Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7842648E0DE
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790101462; cv=none; b=I+zym0DAJQfY6X96bMljyAsbM0B61lHRM+iTypkUfsYQmi5iku/1AX9ZmhjSXXx8ORooxz3YH6/vzES083hvWrRMKgy7Y27dLr+T/O+bbrIgRF0TCRQqYLwLo/kIpCytAZxVil2Le4c5HDSfpf7ufiTtFOFH8q2LRHcqTxpbUZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790101462; c=relaxed/simple;
	bh=+9ObR8sZ6oxPHgi0+oswXpBH/VC2XkRBGmM9k23GnkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MvKkdDdHPYLuRbUyDky7iMacJDrC5Qhq/XEPFAxTtOh3L73HlKyKHF5wG3mgP92ZhzwFmjzRUXlj/jWv5v+jLLDUQQSs0q/+w0LAkSqK/dSqnsmbfFPb26OE2k8pt4gtoIlDuq3cie3icKfqk/GedL3ybipJ+bYQkUH9n2R1qG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=h+bxILWJ; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="h+bxILWJ"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39d654f02baso153446a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1790101459; x=1790706259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aWTLyua4wnNjgucbsZIX9QDTCvjLZHoMRXqqxyAwH6M=;
        b=h+bxILWJ0fcOr2kr70/9TAJ3oeIHe5ZsLkTkvIHLFRBXSqPFiEMI/FQAPR+OXLIX+G
         2LHQiQ85hwpPcn90NmmG1qQG3vGypWMpSU8ffjh0nHpeXJt1efbnLZC3dl70HESEmLhj
         1ejiEgrFjCDYV8iloZyCkSdG6VMKSy812Sin6Q9+YPGF591swkJneHWqZ0IJUR1bx3cb
         TYN8FUdPVv+JBWz2X/7X7kJiRd+vPv2KteUWdR8ce5dxdoNJqsAMpFI4x3oe+TYe/W0W
         QXOAsHdr+ytE/5Zv4KtKcDDvZdw9gf5h+/2qyli2janrqyyMucskgVHCbJoYdP9I0+sF
         UDzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790101459; x=1790706259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aWTLyua4wnNjgucbsZIX9QDTCvjLZHoMRXqqxyAwH6M=;
        b=FgAZRx6O28rjKxhDWdb7Yq6KX/1zs3/md6UM3qceVJB5PFCbIGsk+SeSYri1RmXNNx
         pxfSIBwYkRXXNNacLB3XG0veKB4ajcJJaVke9vTINtvsv5Og8FG0NkUuNOnlWBSccicw
         jcgoUcfJtCu00LrlviBCTl9hpzzA9f3aQinxwrJzC67YrcnY25OyR8L1YyBd1bQoy4s3
         8iP6pE8uK1PkKu/ydqHlZyDr8UJOjdTGg/hfbO805tBrG4vQV7nEU/vkbkcyzZUOLVj9
         oqbXHfHXAGjY7y0vM4eTrtbb23vynNlZ/PJDLM/py3/lUo1RTQq+Y+xe3QhkfzhqQzQv
         pe/A==
X-Forwarded-Encrypted: i=1; AKwUvBzrmWbQdm/OfbJPBS9JilqheTy8aWSyUQ/u5d/MNUMNTzJ46LHbzNGKtMJw1Yebf6bpx7BwmkloMR1vTyM=@vger.kernel.org
X-Gm-Message-State: AFuF++mP6OaugsUOKqDGqAW7QAF8D1GLU5QwrgdMNU+PjJI3HrZ1j5Y9
	drWX6oAr46NgXulM2+5OUcJFSDuzxV2I3uSCQVaA90llx6EwhGWra3pvGej2tJTvnNJyPFe/1Z9
	CTVu6
X-Gm-Gg: AYBFou07hVKC0+kMLe/zo/AD3tWYnCgk8HNxNneaG3KivHSy93JZ5LgZz2EHZnEWw4o
	SMpBVoVJdh6kE5NzdemOJRAliFY+7JrvSkMROvLO0CVCoKhkC4Ys2e/ftooBOAyCnhZuc2Q/Anu
	/5qN8/V9p3UpOnDiQa2ghuoZAAs74kZ1hisowu2l8yMXWa/z0gRInJBEkJ3zQ3IyRcGgPVK7EaR
	5mDps7nOYFJzqbw9CzwzjWpLpGMWgHpY+hPaX8f2BGTmErAKwIZ7PFTBfaYMDo3RCrc/4JUHQRf
	gkPCxE91Wldfh9wJHglbVWiYOZsp2uSkRx3oePC/bDiJahGHVx0HU2LkWk/p0GQpfQw0yTlfMQ4
	rrXKpGHbpvk4nV0Oc15mnrltdX5eRDe74Gx16jKbzYxN8d2yyWlABlMOTksiYM7BabaES89i151
	qqUjFIqpAqfQlXl8yA1baiPtJfBBsSRjeMhBEo1yndT5khbnLPkoip
X-Received: by 2002:a17:90b:4c87:b0:3a0:516d:9f7e with SMTP id 98e67ed59e1d1-3a07e752ae8mr224806a91.45.1790101459604;
        Tue, 22 Sep 2026 11:24:19 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:44::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07ddf1cf3sm579154a91.9.2026.09.22.11.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 11:24:19 -0700 (PDT)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Prashant Sreedharan <prashant@broadcom.com>
Cc: horms@kernel.org,
	linux-kernel@vger.kernel.org,
	Joe Damato <joe@dama.to>
Subject: [RFC net v2 1/3] bnxt_en: return the RING_FREE status to callers
Date: Tue, 22 Sep 2026 11:24:01 -0700
Message-ID: <20260922182405.1290749-2-joe@dama.to>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922182405.1290749-1-joe@dama.to>
References: <20260922182405.1290749-1-joe@dama.to>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hwrm_ring_free_send_msg() reports failure to its caller, returning -EIO
when the firmware rejects HWRM_RING_FREE or never answers it. All three
ring free helpers that send the command discard the value.

Return it instead. No caller acts on it yet, so there is no functional
change.

Fixes: 74608fc98d28 ("bnxt_en: Ring free response from close path should use completion ring")
Signed-off-by: Joe Damato <joe@dama.to>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 48 +++++++++++++----------
 1 file changed, 27 insertions(+), 21 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index d7728d0c5b6e..a7f6facca7b4 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -7660,50 +7660,55 @@ static int hwrm_ring_free_send_msg(struct bnxt *bp,
 	return 0;
 }
 
-static void bnxt_hwrm_tx_ring_free(struct bnxt *bp,
-				   struct bnxt_tx_ring_info *txr,
-				   bool close_path)
+static int bnxt_hwrm_tx_ring_free(struct bnxt *bp,
+				  struct bnxt_tx_ring_info *txr,
+				  bool close_path)
 {
 	struct bnxt_ring_struct *ring = &txr->tx_ring_struct;
 	u32 cmpl_ring_id;
+	int rc;
 
 	if (ring->fw_ring_id == INVALID_HW_RING_ID)
-		return;
+		return 0;
 
 	cmpl_ring_id = close_path ? bnxt_cp_ring_for_tx(bp, txr) :
 		       INVALID_HW_RING_ID;
-	hwrm_ring_free_send_msg(bp, ring, RING_FREE_REQ_RING_TYPE_TX,
-				cmpl_ring_id);
+	rc = hwrm_ring_free_send_msg(bp, ring, RING_FREE_REQ_RING_TYPE_TX,
+				     cmpl_ring_id);
 	ring->fw_ring_id = INVALID_HW_RING_ID;
+	return rc;
 }
 
-static void bnxt_hwrm_rx_ring_free(struct bnxt *bp,
-				   struct bnxt_rx_ring_info *rxr,
-				   bool close_path)
+static int bnxt_hwrm_rx_ring_free(struct bnxt *bp,
+				  struct bnxt_rx_ring_info *rxr,
+				  bool close_path)
 {
 	struct bnxt_ring_struct *ring = &rxr->rx_ring_struct;
 	u32 grp_idx = rxr->bnapi->index;
 	u32 cmpl_ring_id;
+	int rc;
 
 	if (ring->fw_ring_id == INVALID_HW_RING_ID)
-		return;
+		return 0;
 
 	cmpl_ring_id = bnxt_cp_ring_for_rx(bp, rxr);
-	hwrm_ring_free_send_msg(bp, ring,
-				RING_FREE_REQ_RING_TYPE_RX,
-				close_path ? cmpl_ring_id :
-				INVALID_HW_RING_ID);
+	rc = hwrm_ring_free_send_msg(bp, ring,
+				     RING_FREE_REQ_RING_TYPE_RX,
+				     close_path ? cmpl_ring_id :
+				     INVALID_HW_RING_ID);
 	ring->fw_ring_id = INVALID_HW_RING_ID;
 	bp->grp_info[grp_idx].rx_fw_ring_id = INVALID_HW_RING_ID;
+	return rc;
 }
 
-static void bnxt_hwrm_rx_agg_ring_free(struct bnxt *bp,
-				       struct bnxt_rx_ring_info *rxr,
-				       bool close_path)
+static int bnxt_hwrm_rx_agg_ring_free(struct bnxt *bp,
+				      struct bnxt_rx_ring_info *rxr,
+				      bool close_path)
 {
 	struct bnxt_ring_struct *ring = &rxr->rx_agg_ring_struct;
 	u32 grp_idx = rxr->bnapi->index;
 	u32 type, cmpl_ring_id;
+	int rc;
 
 	if (bp->flags & BNXT_FLAG_CHIP_P5_PLUS)
 		type = RING_FREE_REQ_RING_TYPE_RX_AGG;
@@ -7711,14 +7716,15 @@ static void bnxt_hwrm_rx_agg_ring_free(struct bnxt *bp,
 		type = RING_FREE_REQ_RING_TYPE_RX;
 
 	if (ring->fw_ring_id == INVALID_HW_RING_ID)
-		return;
+		return 0;
 
 	cmpl_ring_id = bnxt_cp_ring_for_rx(bp, rxr);
-	hwrm_ring_free_send_msg(bp, ring, type,
-				close_path ? cmpl_ring_id :
-				INVALID_HW_RING_ID);
+	rc = hwrm_ring_free_send_msg(bp, ring, type,
+				     close_path ? cmpl_ring_id :
+				     INVALID_HW_RING_ID);
 	ring->fw_ring_id = INVALID_HW_RING_ID;
 	bp->grp_info[grp_idx].agg_fw_ring_id = INVALID_HW_RING_ID;
+	return rc;
 }
 
 static void bnxt_hwrm_cp_ring_free(struct bnxt *bp,
-- 
2.53.0-Meta

