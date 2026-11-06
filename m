Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793936666;
	b=pv9OElP2MmhkdAC9g5xct+MN8veF2nSPJ46HwzX2dQw7zIkiRYJilgrbUh2SCJkoetGG
	 KkC2GdxyCHIU1Zqncbm9Kjl2SBkI9+DKfGYehD9kq3qLhr6RTsTR5bwk5L/+NhmFM/+l4
	 K6aFpx8M6MWcy5btkNVbFGvjevoVP3VaI66aPjjT30Diqbi0BE28NQxE5tpFLZnVsLF5m
	 1vwp2bbqFDRRGrWDFlrdhKuoN3t8xd8lN0oSN2kFLpr0VEp1S8q0qKI9yPcio8jr51mPQ
	 J/bn2i6BoRPvuGDAwUl6HW9eu9vejplbRSW6fts2Cil7qxJd1Xxq4pZQiGvsdgWn5Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793936666;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bOXPrpPnnm0xKh7x64ojzAnkDsnPUwmw22WpdWcOAsE=;
	b=amqdbOhe1ciipDPPdNJ2apSBMm7KCIkGHssjqlikNKzpaPfzLPZRtTkKCNw0gCXFYgLO
	 FXFctq/hwLtOCMowfhsfvgg8lonKESXOx3IVuqH5AoP211zJF0rWONlB2kixAPnCFRPmW
	 hj3GCYg/mBNKZe7eXNu6BeveDjfOVK7I4OhalxGf+eYTTQ4NiIj2mqqR9nxxy1ynKNzFS
	 vxu5rb5EgWO862e864XhyaN6RkFlJivclSLV/rQY/A3+pqGyWZWJg/nlFtSt33wlbQnId
	 wNyDf6eSS90eMgPTT8MbKRZ53qRAzBbvhqj697M6LObP6s6Tdz6etuSwtrBXmMtP6AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dw5gWCSa;
	arc=none smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2371C606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 03:44:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2371C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dw5gWCSa
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5364d86f7f0so1899601cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 19:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793936665; x=1794541465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bOXPrpPnnm0xKh7x64ojzAnkDsnPUwmw22WpdWcOAsE=;
        b=Dw5gWCSauIezQu56v+Ix4FbWgkPMn66gjvvdKEUzBnukAmqmUWSIfKOltUzg7e1KuA
         nRYxWnUXxiqOoW+FH4EropslAIVzt6x9HvTqxeh6yzSfKNunecHhSgWETGebsioYKANG
         8+1nswbgthIOFrgVpQNpdb+aeEjlZINlqWZ8c6NAAAaoCA0e0wvYBowMT6rR1+uhyK0G
         mc+Dgu+PmFTzCYmeoBoLimAwACSMKB0v7E1tZ/PHei7GPz5tOv7/sNE92bn/wooBkwuv
         TabaBCCdIjeaYMscqIAwCC9rykW+58jAcSpyNvQHl/tysj9qphomkJ7XvxManc482LWt
         pshA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793936665; x=1794541465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bOXPrpPnnm0xKh7x64ojzAnkDsnPUwmw22WpdWcOAsE=;
        b=xz2CqKiJUbvLPXSlcjIp3yZsAOIHWlw183xSK0y9Lhu0UqIGF1Lrsceo0tkFgqvs0J
         Z/ph7e2jIhmU3YUTqvDcTqU/S2GtpAspfNKwmwIyjKdAkBxynRe19A1BY9BZS48UrbbK
         7qYp6DB0qPnTqEin1jAypEQbDdYK3nB9AXp0z2S8zA2uaWhueIwVrHkJgMtC49t3UoE9
         cDQ8JResMG3W1FtxGHrbHb9/HRd9OFSK3VdwY2ZZk5+1TdhWv9v+LcorloRept7WahqD
         U9Ih9ZDUlo+2XJp9+mYebpc5zANFBl9hQJ+4C1NC/ifnx6vnyITzFssLzZTzyQ92YVjq
         FXUw==
X-Forwarded-Encrypted: i=1; AKwUvBy/53FYFs2WifJCl8na1V3uoMAsjZzaZf4OnoJxvUZIkcpMZq4jDyGv/3sePIVTab7gLFG6YnzLTnSHNms=@vger.kernel.org
X-Gm-Message-State: APuU4Z/doVRMgTQJN7SXaiQuiRQkyOyXSOCdVYwLCflfxSDJRLqU2aE1
	HvZ8oKklkXK5Wz56YaW3Si06pB+pDvXHxjuKzJIC7RuFjxRa16fUkp2Na8NNWA==
X-Gm-Gg: AYBFou2/VNhNGS8gupeod1u3yRugOvn38LPH55YIMZwtsSIVHJ3dP/o5NZGnPOHs4XN
	2x1JAJujcj/8Ke+k8PYRa3KvifPRbmbvP00/fA3gLeQwX52FjUiMDM9hIrPg77r+UeRMDmV0L9y
	FkpLT9H5+EKKiZyAoJVUu0uhSgvlkBoO2XRlTfkKqQfMQhiLUJAVq2iFDrqxIo5fPMIDK5LUJnM
	AP9XYD3wE9L4jB/Fal3gSV17UNksNL78m6azV39QCW0+7KQGhbQARox5KSi+l/XUh4bg1CsbCA+
	7XmjZxMLTkTGr/6erXTnij/4399xSGyx9wvkAsVx5pqKgzlCt04y/krpqyymrhNWrlo8vTXejCF
	hzL559gux1Xh4Fy3rEihUek8XLLxuqZv9XvoV2Lhgx2eTbBKwMI9RYCcKX8Pn6nhNzgNOtoszUq
	Uui9Ez9EKa2empypqNZt32w0tMkiiCrvyXEr+YXtg981mncdSNOvuteAkaCQGoDcq+/RV/1lsNp
	aeeJMFZwCUnU+2lFbVeWLfIseqR1St2Dvj2plLmLBp3hAD0/zuKKdXhCHGA2/cS9c/ST4mqbGaL
	cAHYn5c0P6KFFKh5GgXZZJzaoYIlLatAiD1yE6q/ycNO8x9BLu3T
X-Received: by 2002:a05:622a:2617:b0:535:266e:f121 with SMTP id d75a77b69052e-54e0fdf2be8mr24256611cf.1.1793936664972;
        Thu, 05 Nov 2026 19:44:24 -0800 (PST)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54e231d0710sm10217091cf.2.2026.11.05.19.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 19:44:24 -0800 (PST)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Bryan Tan <bryan-bt.tan@broadcom.com>,
	Vishnu Dasa <vishnu.dasa@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v1] misc: vmw_vmci: Leak queue pair endpoint if detach fails on exit
Date: Thu,  5 Nov 2026 22:44:15 -0500
Message-ID: <20261106034419.134545-2-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the VMCI guest device is removed, vmci_qp_guest_endpoints_exit()
asks the hypervisor to detach each remaining queue pair and then frees
its queue pages with qp_guest_endpoint_destroy(), even if the detach
hypercall failed.

If the detach fails, the hypervisor may still have the queue pair, and
the peer may keep writing to the queue pages after they have gone back
to the page allocator. The device reset that follows in
vmci_guest_remove_device() comes only after the pages have been freed.

qp_detatch_guest_work() already handles the same failure by keeping the
entry, because the peer "might still be accessing the shared memory",
and leaves the cleanup to this exit path, which then frees it anyway.

Leak the endpoint instead if the detach fails. This also keeps its
handle in the resource table, so the handle is not given to a new queue
pair while the hypervisor may still have the old one.

Fixes: 06164d2b72aa ("VMCI: queue pairs implementation.")
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
Compile-tested only (x86_64 with VMWARE_VMCI, W=1); I do not have 
a VMware setup to test it on.

 drivers/misc/vmw_vmci/vmci_queue_pair.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/vmw_vmci/vmci_queue_pair.c b/drivers/misc/vmw_vmci/vmci_queue_pair.c
index e1a11820be01..57a4f0ae4f49 100644
--- a/drivers/misc/vmw_vmci/vmci_queue_pair.c
+++ b/drivers/misc/vmw_vmci/vmci_queue_pair.c
@@ -2391,28 +2391,35 @@ int vmci_qp_broker_unmap(struct vmci_handle handle,
 /*
  * Destroys all guest queue pair endpoints. If active guest queue
  * pairs still exist, hypercalls to attempt detach from these
- * queue pairs will be made. Any failure to detach is silently
- * ignored.
+ * queue pairs will be made. If a detach fails, the endpoint is
+ * leaked, as the peer may still access its queues.
  */
 void vmci_qp_guest_endpoints_exit(void)
 {
 	struct qp_entry *entry;
 	struct qp_guest_endpoint *ep;
+	int result;
 
 	mutex_lock(&qp_guest_endpoints.mutex);
 
 	while ((entry = qp_list_get_head(&qp_guest_endpoints))) {
 		ep = (struct qp_guest_endpoint *)entry;
+		result = VMCI_SUCCESS;
 
 		/* Don't make a hypercall for local queue_pairs. */
 		if (!(entry->flags & VMCI_QPFLAG_LOCAL))
-			qp_detatch_hypercall(entry->handle);
+			result = qp_detatch_hypercall(entry->handle);
 
 		/* We cannot fail the exit, so let's reset ref_count. */
 		entry->ref_count = 0;
 		qp_list_remove_entry(&qp_guest_endpoints, entry);
 
-		qp_guest_endpoint_destroy(ep);
+		/*
+		 * If the detach failed, the peer may still access the
+		 * queues, so leak the endpoint.
+		 */
+		if (result >= VMCI_SUCCESS)
+			qp_guest_endpoint_destroy(ep);
 	}
 
 	mutex_unlock(&qp_guest_endpoints.mutex);

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

