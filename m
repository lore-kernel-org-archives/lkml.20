Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B97476CF1
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792163016; cv=none; b=UK9hHTTMHjp8mTm1xp7fJG/Zti7obrJL9hz4vHlXa1Y22n8J/yRCUnQ0o4Q72LvrzK0bT+thBb/MGXfUS5wqQvJ9DPnwt6xNGpcK5GO4ccWi9xgYR9HiSerhXrnX/a3/542/INdWh8lLqHGSebH7IjT7Pcvxnzxfjq6aT6R6XnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792163016; c=relaxed/simple;
	bh=+qbQ9mJu3RocW5ghL+3OwuRI6iYRom0wC1SfAkAQL/Y=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=R/jbrCqP9ZIQGNKwB+BTqjCQD0TCPX8Ekag0qVLiEl2zWq8fC4lMmm+7oBKt33NeDczs+ivmit0qFu3UOiw/HSBVTq5MUhfAjAKb8D7Nk6lYduBDmgEFNkKVV5ILH7y1xHEXgVt0rDC+0Nj9llYZOpnfaaF48TT53T/S0Y0DtD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=ssYj/UYr; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Nkx5FQnr; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="ssYj/UYr";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Nkx5FQnr"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1792162993; bh=JGM8aznGZ1jvH8gL8byaFc/
	blWOREiHo3wQ2Eo+eFso=; b=ssYj/UYrUzYZOtntApnLfF4QtR/cGRKA7mMQ2zIzSbhzFOMNW6
	fbTkkgqMPUJKD52KY1o4Lf46IK0JfX8U1JpTrDxP8QFGGhIDI5rJ+8i7/KfMmGKw123J7oEuzji
	xByLy3MxQ23ecUtr/t0aLvdeExcAzsyfrhcror2H4I5zv1SotNKAhfrDsKpSfjIb8pppt3ZTGpb
	kSZ/mjcrWdOvryVQ3PDQx8lM2/WZnprUUPCQAUCvMIQHeTLtSVYqfEDIueWKaHJi17DLUpu5bCf
	/u16LF09EtoSb7iyWW63lJWy9R7cPGy/V2rKdQa2ZC4b2vLJr8AdIC0fbhTULb1hxzQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1792162993; bh=JGM8aznGZ1jvH8gL8byaFc/
	blWOREiHo3wQ2Eo+eFso=; b=Nkx5FQnru0xxvm2fZimbfptBHBaj8IrA1TqfJNw0+S2mjdmzhs
	IWQeHglBuVYyr1g0xyKHo4Gv93qEuPtzNJAA==;
Date: Fri, 16 Oct 2026 16:03:15 +0100
From: Bradley Morgan <brads@mainlining.org>
To: nickolai@csail.mit.edu
CC: akpm@linux-foundation.org, bhelgaas@google.com, djbw@kernel.org,
 ilpo.jarvinen@linux.intel.com, linux-kernel@vger.kernel.org, tj@kernel.org,
 treding@nvidia.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v1=5D_resource=3A_report_a_devm=5Fr?=
 =?US-ASCII?Q?equest=5Fresource=28=29_conflict_under_the_lock?=
In-Reply-To: <20261016140043.790048-1-nickolai@csail.mit.edu>
Message-ID: <3F8D5A59-D909-4E24-BB9B-08CE1C450064@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 16 October 2026 15:00:43 BST, Nickolai Zeldovich
<nickolai@csail.mit.edu> wrote:
>devm_request_resource() calls request_resource_conflict(), which takes
>resource_lock, tries to insert the new resource and returns a pointer to
>the conflicting resource after dropping the lock.  The error message is
>then formatted from that pointer: conflict->name and the %pR argument
>read the name, start, end, flags and desc of a resource that nothing
>pins any more.  The owner of the conflicting resource may call
>release_resource() and free it the moment the lock is dropped.
>
>The conflicting resource normally belongs to another device.  With two
>devices whose drivers claim overlapping regions (two PCI host bridges
>whose "ranges" windows overlap, two instances of a controller on the
>same aperture, or a stale claim an administrator is replacing), the
>following interleaving reads freed memory:
>
>  CPU 0: driver B probe                  CPU 1: driver A unbind
>  devm_request_resource(devB, root, resB)
>    request_resource_conflict()
>      write_lock(&resource_lock)
>      __request_resource() -> resA
>      write_unlock(&resource_lock)
>                                         devres_release_all(devA)
>                                           devm_resource_release()
>                                             release_resource(resA)
>                                         put_device() -> kfree(resA)
>    dev_err(..., resA->name, resA)        use after free
>
>Both halves are reachable from userspace on any kernel: a write to the
>"unbind" file of the driver that holds the region and a write to the
>"bind" file of the driver that wants it.  One in-tree path is
>drivers/pci/bus.c devm_request_pci_bus_resources(), called from host
>bridge probe for every bridge window; the windows are the embedded
>struct resource of kzalloc'ed resource_entry objects that
>pci_free_resource_list() frees when the other bridge is released.
>In the common case the "resource collision" message is garbled; with
>the slab object poisoned (CONFIG_SLUB_DEBUG) or reused, formatting
>conflict->name oopses, and KASAN reports a slab-use-after-free read in
>devm_request_resource().  All of this happens in a probe that is
>already failing with -EBUSY.  The window is a few hundred instructions
>wide and exists only when two devices actually collide, so the race
>has not been observed outside of analysis.
>
>Do the same here: take resource_lock, insert with __request_resource()
>and print the diagnostic while the lock still keeps the conflicting
>resource in the tree, then drop the lock.  The return values and the
>devres handling are unchanged.
>
>The change was built for x86_64 and RISC-V; the resource KUnit tests
>pass on both.
>
>Found by formal verification of kernel/resource.c against the kernel
>binary.

Ok.

>
>Fixes: 8d38821cbcf5 ("resources: Add device-managed request/release_resource()")
>Assisted-by: LLM

Fair enough.

>Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
>---
>
>Notes:
>    The same read-after-unlock shape exists in every other caller of
>    request_resource_conflict() and insert_resource_conflict():
>    pci_claim_resource(), pci_revert_fw_address(), pci_bus_insert_busn_res(),
>    pci_ecam_create(), acpi_pci_root_validate_resources(),
>    efi_mem_reserve_iomem() and the sparc, x86, loongarch and powerpc arch
>    callers all format the returned pointer after the lock is gone.  Those
>    run at boot or from PCI enumeration and live outside kernel/resource.c,
>    where resource_lock is not visible, so this patch only changes the
>    driver-facing probe() entry point that pairs with an unbind of the
>    other device.  If a treewide answer is wanted, a request variant that
>    reports the conflict from under the lock (or takes a callback) would be
>    the shape, and devm_request_resource() would be its first user.
>    
>    Testing: the resource KUnit suite (CONFIG_RESOURCE_KUNIT_TEST) was run
>    under QEMU before and after on x86_64 and RISC-V, 3/3 passing in all
>    four runs; defconfig builds for both architectures with GCC are
>    warning-free, and kernel/resource.o builds clean with W=1 and sparse on
>    both.
>
> kernel/resource.c | 9 +++++++--
> 1 file changed, 7 insertions(+), 2 deletions(-)
>
>diff --git a/kernel/resource.c b/kernel/resource.c
>index e60539a55541..08bd7579cf40 100644
>--- a/kernel/resource.c
>+++ b/kernel/resource.c
>@@ -1695,10 +1695,15 @@ int devm_request_resource(struct device *dev, struct resource *root,
> 
> 	*ptr = new;
> 
>-	conflict = request_resource_conflict(root, new);
>-	if (conflict) {
>+	/* Report a conflict while the lock still keeps it in the tree. */
>+	write_lock(&resource_lock);
>+	conflict = __request_resource(root, new);
>+	if (conflict)
> 		dev_err(dev, "resource collision: %pR conflicts with %s %pR\n",
> 			new, conflict->name, conflict);
>+	write_unlock(&resource_lock);
>+
>+	if (conflict) {
> 		devres_free(ptr);
> 		return -EBUSY;
> 	}

Looks fine to me, thanks for the patch:

Reviewed-by: Bradley Morgan <brads@mainlining.org>


>
>base-commit: 90201351a862182bdabfc1ad1c97b1e1b6ed5931
>

--- Thanks!
"I'm not a very positive person" - Linus torvalds
