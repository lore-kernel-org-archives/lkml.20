Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30073EB11C
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791964463; cv=none; b=kZ0GwiHytIiIAN7zZIxVknyLgVHzteYuX2xhsr81oonrLCRNK0BzY4p2T3jZ6LA8M2KT3cxksmHFNJG9IpELU8rkuW+S2NpCqb+kENVKW4iggqrStK3LNIEbDs5irJDeGjalow281qj+3T5oJJj+NHF492ydoOiTG7BXfY5zBFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791964463; c=relaxed/simple;
	bh=yIccwcIzgeIbR//1rkvK1HT+o33SmTjl8FawvBgArh4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Nh0evtGkcbHTmJjzSjLRBtydyoiNoaBMy2SeGS49pXnqVy6fWCY+vBWSxpNbVW7W1JGXx2yChlKgXhiVoby8MCf1ox/UtRkuGpsqRQrVRAMm028l4gDvJn/l18lHeimDcKfCyn0ItoU70lDd9zBwQkgxELSNMJVa5FVuD4uXKMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=QrOnKpSk; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="QrOnKpSk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Eq
	bwl8i4iagGFFSkVH0wQKx5RPaDdonVx8/YFLkVpmE=; b=QrOnKpSkpEJAB/VLTy
	XNWRawMB8+A9bGPCXAjr3VSCNDaBxL1foEs4yFeiE1juHztbPibS2LfN1+7kBvLd
	kMXyHj3qkN1lTL15HVqMFuW2BKRO1b0VzO8CwtN9bJlueXzu4pTm78uDp6kqrTo3
	ecXJFKzOlV9nSDjJFgP8N77Bs=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgD3Xz_pNM9qjDEdEg--.38541S2;
	Wed, 14 Oct 2026 15:53:14 +0800 (CST)
From: kensanya@163.com
To: justin.tee@broadcom.com,
	nareshgottumukkala83@gmail.com,
	paul.ely@broadcom.com,
	hch@lst.de,
	sagi@grimberg.me,
	kch@nvidia.com
Cc: linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	TanZheng <tanzheng@kylinos.cn>
Subject: [PATCH] nvmet-fc: skip hostport ops when the LLDD has no host handle
Date: Wed, 14 Oct 2026 15:53:03 +0800
Message-Id: <20261014075303.277735-1-kensanya@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgD3Xz_pNM9qjDEdEg--.38541S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KryrJw4xAF1ktw17uw15Jwb_yoW8uw4kpF
	ZxtFnxKFy7GFWagwn5AFn5Jry2k3W8WFnrJrWfX398ZF1ft34rJrsxK3WvyrW5JF1fCa4U
	CF45XrZ5Jw15GaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jn5r7UUUUU=
X-CM-SenderInfo: 5nhq2txq1dqiywtou0bp/xtbC6QrVsWrPNOp08wAA37

From: TanZheng <tanzheng@kylinos.cn>

nvmet_fc_alloc_hostport() returns NULL when the LLDD passes a NULL
hosthandle. That is not an ERR_PTR, so nvmet_fc_alloc_target_assoc()
keeps the association and leaves assoc->hostport NULL.

Disconnect, association free and host invalidation then dereference
assoc->hostport. The disconnect comment already says an older LLDD
with no host handle should not send an LS.

Treat a missing hostport like a missing ls_req: do not send the
disconnect LS, do not put the hostport, and skip that association in
nvmet_fc_invalidate_host().

Assisted-by: Kimi:K3
Signed-off-by: TanZheng <tanzheng@kylinos.cn>
---
 drivers/nvme/target/fc.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/nvme/target/fc.c b/drivers/nvme/target/fc.c
index 1b557775e033..951be0bf7b54 100644
--- a/drivers/nvme/target/fc.c
+++ b/drivers/nvme/target/fc.c
@@ -483,7 +483,8 @@ nvmet_fc_xmt_disconnect_assoc(struct nvmet_fc_tgt_assoc *assoc)
 	 * message is normal. Otherwise, send unless the hostport has
 	 * already been invalidated by the lldd.
 	 */
-	if (!tgtport->ops->ls_req || assoc->hostport->invalid)
+	if (!tgtport->ops->ls_req || !assoc->hostport ||
+	    assoc->hostport->invalid)
 		return;
 
 	lsop = kzalloc((sizeof(*lsop) +
@@ -1176,7 +1177,8 @@ nvmet_fc_target_assoc_free(struct kref *ref)
 	/* Send Disconnect now that all i/o has completed */
 	nvmet_fc_xmt_disconnect_assoc(assoc);
 
-	nvmet_fc_hostport_put(assoc->hostport);
+	if (assoc->hostport)
+		nvmet_fc_hostport_put(assoc->hostport);
 	spin_lock_irqsave(&tgtport->lock, flags);
 	oldls = assoc->rcv_disconn;
 	spin_unlock_irqrestore(&tgtport->lock, flags);
@@ -1526,7 +1528,8 @@ nvmet_fc_invalidate_host(struct nvmet_fc_target_port *target_port,
 	spin_lock_irqsave(&tgtport->lock, flags);
 	list_for_each_entry_safe(assoc, next,
 				&tgtport->assoc_list, a_list) {
-		if (assoc->hostport->hosthandle != hosthandle)
+		if (!assoc->hostport ||
+		    assoc->hostport->hosthandle != hosthandle)
 			continue;
 		if (!nvmet_fc_tgt_a_get(assoc))
 			continue;

