Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DC6352034
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.30.2.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792159250; cv=none; b=duaDkfYcGFRo0Sl/cLE+5bzn5yLE3+cy3gdAckULG/KrAiv9QZmEWQ+dic5uumH1+HzfXAbp2Ib8heXQL1XiWH8mYwwR2yeLXzZ36SlhYr8GNGabBX+fMK6OEaMygw1zjE7CsgdRkz70D02heU6iC4Br6U+8tsEFiyPzGpQfbHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792159250; c=relaxed/simple;
	bh=1dW/8yhwyRUcKU27uxKRNWQ3mLJSTyAcrfWPK0CXz2g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h0nzMkVAYXFID3GwOH2XspdElvYvnM9nQiHwoTwKyFa1TJlvA8IFuN6OOtZny88rrIaCCS/w6DPNAI3q/Pb50bO4KDkEPbtluD7pvjB4Z/G+VFkTXbSmN/AlLT8bEfZxDN29lZx25TyyBH4nD5BcR1P6xPtASY2xi9KmBhASUB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu; spf=pass smtp.mailfrom=csail.mit.edu; arc=none smtp.client-ip=128.30.2.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Received: from escalante.csail.mit.edu ([128.52.128.198])
	by outgoing2021.csail.mit.edu with esmtp (Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xHiUF-00F7EQ-Ec;
	Fri, 16 Oct 2026 10:00:43 -0400
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Dan Williams <djbw@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Tejun Heo <tj@kernel.org>,
	linux-kernel@vger.kernel.org,
	Nickolai Zeldovich <nickolai@csail.mit.edu>
Subject: [PATCH v1] resource: report a devm_request_resource() conflict under the lock
Date: Fri, 16 Oct 2026 10:00:43 -0400
Message-ID: <20261016140043.790048-1-nickolai@csail.mit.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devm_request_resource() calls request_resource_conflict(), which takes
resource_lock, tries to insert the new resource and returns a pointer to
the conflicting resource after dropping the lock.  The error message is
then formatted from that pointer: conflict->name and the %pR argument
read the name, start, end, flags and desc of a resource that nothing
pins any more.  The owner of the conflicting resource may call
release_resource() and free it the moment the lock is dropped.

The conflicting resource normally belongs to another device.  With two
devices whose drivers claim overlapping regions (two PCI host bridges
whose "ranges" windows overlap, two instances of a controller on the
same aperture, or a stale claim an administrator is replacing), the
following interleaving reads freed memory:

  CPU 0: driver B probe                  CPU 1: driver A unbind
  devm_request_resource(devB, root, resB)
    request_resource_conflict()
      write_lock(&resource_lock)
      __request_resource() -> resA
      write_unlock(&resource_lock)
                                         devres_release_all(devA)
                                           devm_resource_release()
                                             release_resource(resA)
                                         put_device() -> kfree(resA)
    dev_err(..., resA->name, resA)        use after free

Both halves are reachable from userspace on any kernel: a write to the
"unbind" file of the driver that holds the region and a write to the
"bind" file of the driver that wants it.  One in-tree path is
drivers/pci/bus.c devm_request_pci_bus_resources(), called from host
bridge probe for every bridge window; the windows are the embedded
struct resource of kzalloc'ed resource_entry objects that
pci_free_resource_list() frees when the other bridge is released.
In the common case the "resource collision" message is garbled; with
the slab object poisoned (CONFIG_SLUB_DEBUG) or reused, formatting
conflict->name oopses, and KASAN reports a slab-use-after-free read in
devm_request_resource().  All of this happens in a probe that is
already failing with -EBUSY.  The window is a few hundred instructions
wide and exists only when two devices actually collide, so the race
has not been observed outside of analysis.

Do the same here: take resource_lock, insert with __request_resource()
and print the diagnostic while the lock still keeps the conflicting
resource in the tree, then drop the lock.  The return values and the
devres handling are unchanged.

The change was built for x86_64 and RISC-V; the resource KUnit tests
pass on both.

Found by formal verification of kernel/resource.c against the kernel
binary.

Fixes: 8d38821cbcf5 ("resources: Add device-managed request/release_resource()")
Assisted-by: LLM
Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
---

Notes:
    The same read-after-unlock shape exists in every other caller of
    request_resource_conflict() and insert_resource_conflict():
    pci_claim_resource(), pci_revert_fw_address(), pci_bus_insert_busn_res(),
    pci_ecam_create(), acpi_pci_root_validate_resources(),
    efi_mem_reserve_iomem() and the sparc, x86, loongarch and powerpc arch
    callers all format the returned pointer after the lock is gone.  Those
    run at boot or from PCI enumeration and live outside kernel/resource.c,
    where resource_lock is not visible, so this patch only changes the
    driver-facing probe() entry point that pairs with an unbind of the
    other device.  If a treewide answer is wanted, a request variant that
    reports the conflict from under the lock (or takes a callback) would be
    the shape, and devm_request_resource() would be its first user.
    
    Testing: the resource KUnit suite (CONFIG_RESOURCE_KUNIT_TEST) was run
    under QEMU before and after on x86_64 and RISC-V, 3/3 passing in all
    four runs; defconfig builds for both architectures with GCC are
    warning-free, and kernel/resource.o builds clean with W=1 and sparse on
    both.

 kernel/resource.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/kernel/resource.c b/kernel/resource.c
index e60539a55541..08bd7579cf40 100644
--- a/kernel/resource.c
+++ b/kernel/resource.c
@@ -1695,10 +1695,15 @@ int devm_request_resource(struct device *dev, struct resource *root,
 
 	*ptr = new;
 
-	conflict = request_resource_conflict(root, new);
-	if (conflict) {
+	/* Report a conflict while the lock still keeps it in the tree. */
+	write_lock(&resource_lock);
+	conflict = __request_resource(root, new);
+	if (conflict)
 		dev_err(dev, "resource collision: %pR conflicts with %s %pR\n",
 			new, conflict->name, conflict);
+	write_unlock(&resource_lock);
+
+	if (conflict) {
 		devres_free(ptr);
 		return -EBUSY;
 	}

base-commit: 90201351a862182bdabfc1ad1c97b1e1b6ed5931
-- 
2.53.0

