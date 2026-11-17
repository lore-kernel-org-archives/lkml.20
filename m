Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794896319;
	b=4vxLtlfao3O7OpHSK9awhr3cEBvpSyb8QNXHPZ1HQ9txKMAL9IWdnNUMvIMWjRxStPrE
	 RehR0eBLYDoQ9YCdqLpF+hTC3hu1SROdx9Zcmf2p+NjX62K/vKmBcVkEEqKJkg9ue0iKq
	 +XYOWNnDYN9noJ53zmi/Kv47eV53SBXJyQu/coqlYsG6O8VEGfXSRgk9eVyn7D7ZCouqE
	 zKWb4W/0mS+zHqcSsKBRcbqxgngti/W/aH3jzxnCBvEGctAHSmbku3phaBcIXxoV4IVMs
	 o5jqOPwySypPU1ShVNhEgcwLKKhtZd1BS3lRKJMdC09xAUT3/inCXRrrzj7XbyJBClQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794896319;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=yCKiASahuIrw6Fbc7uugzxhsMl3udZMIRE/MrjfigHk=;
	b=MO68F9kuyihZ6lF6tZGYbumMmqMYXIVfDDAvJymdz8C24xi5SoK5XIc9PUd4xGmBjHC3
	 1sCeb0y/E0UUOpOmmGt2E3u5OxALMNYXdXqX19cfw+L96NH3UulKukx24EZjQXAXzQc/0
	 E+1zBNGH6C9hfArWy5PdhcRD5LZ3RPr2zUYbiEAEN0pbo0UyLEn7v4pzCg3mxvd2NeDnE
	 qDtcszX6Q+O5Ts1MsRJFF4KS6OVecNyipfn3OM/sVJjt72HSRGijctBYeaDxLeDTU8O1m
	 rqy+E21Whtzwk2QuQ+l2PhcqAU/3QSnscQI/2j6eg36IHp2fLvi0WNHmPKijNzvA9YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=SfWv30B9;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DE8606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:18:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07DE8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=SfWv30B9
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3b12cb3c37bso2179282a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:18:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794896318; x=1795501118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yCKiASahuIrw6Fbc7uugzxhsMl3udZMIRE/MrjfigHk=;
        b=ty+TS71G/8Lirr7Fs1J6QuUajeRaBDosJrYibnB44QC3JQ/4cJ1tQljBwA/PtNBxoU
         p3hD6TMxHNMQBYmmz5I7zHcZF66MPR+Btyh9LlWqSW0XtLlnlRv0IxxQVJh7GfRB6oC3
         KbASUyM/yhnclVeMMeecWNoBtig8e4qDJevAo8M1gJAmPvVHRrESQdHDwha+N7a4bGlI
         Gi9bdsj13nNLzyMmhmKi6VUQt7jMMVPhWO92F8RLhdgYA76iLP5f4rd1s7DHvQNImQ4r
         6+zcBYXn289POahhqI7vn/0YnqeOS5MnhSP2M/O6Qj81usHWjtUeZxad1AuNMsxPa3Gv
         me3w==
X-Forwarded-Encrypted: i=1; AL+hErHjmqL5lHXS4RtSzCa8tgWC20IPeeVB1lSzmu+2w8Y6vtYuLFeTP3VGJoJNFzQUOb7Mdpltv5BlOMPwCpQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+n6L+aeTOrRMSe68bfT2G9/mnwKSabqjB7APmAZzp1Cx153fse
	B9wESer4/qLS71Yv05ykff1pFMfd8mElJJlGW21ZUjY4a6L25gXcFTE/yo/g1iQdZi/G/omxkVj
	8pi5HfSln3i32LRZQ1RJqia3WynszJ7W+i8B74jk93s3DTCEK4frHwn2DPQa19vactW/LI0qmO7
	3+6QpJ55jX7M7qksk7UHmStA1K1OaApi/TYkz2qhi2ekq3MQJn9xbanvmubPs2kNA+jBLZl7aoF
	8N9acBpi+YNmz+3HT1g8WUyRVvt
X-Gm-Gg: AZFdTZcKdPyHRuw3DYu/FrE4Yh384dcoMY32l7DvLnIbe3sqJKPSE3873Kuj/f7COz8
	ZO6oyNIIQzCcfrN1uYaSuYyhWc5L42WWpeAgqeaypSBWozV/pok3Ob4dEYlW5oTa++01LSjwO0O
	L/qJ+UcRJvzWqVAuxiYsqNsZPzkNo2/fHp6rbI8HbaSMFpqWBls6KjpD8SVJE8B7DNYCZToQy/P
	9fclDmQwIn8d7MTONdOSqNapwr7t9d6zT2XbCSGO/buHczHe7yNhnp6/YIgCg9fBuKbEyD1ErQq
	x4KS4vzmOSrnT1ZPtGjaDrq0sTaDFrienc92V766AeqHfNtRBRCHSj9orBEE2PeF8qJGmFuhzxl
	ocBGzh/jJK/JzAKs8fapTuc3ViQN7tUNthy8D3ZYs0fTU4G2agvZV1FBI5y7eAE4jRxCZELBk6S
	WfgNre9a5zYzKi4oB2xH64rz189ZkYq5FSnbmEvJO+Wg==
X-Received: by 2002:a17:90a:c88f:b0:3ad:1da4:2ddf with SMTP id 98e67ed59e1d1-3b1b0b5d611mr11219815a91.51.1794896318306;
        Mon, 16 Nov 2026 22:18:38 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3abb84fe8sm1189690a91.2.2026.11.16.22.18.37
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 22:18:38 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2eaf8ea208bso33173835ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794896316; x=1795501116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yCKiASahuIrw6Fbc7uugzxhsMl3udZMIRE/MrjfigHk=;
        b=SfWv30B9MTAfp9kGztJj1dWIRYHWocuMaSI1GRNgJ8Jr7U26NdH+TqMXuhcYfReHXW
         o6ycZUnkfNdNnBJDH9F97fcYW42IRwo8fWtTI6CH9pzCtWTZwmvGJn6nswMnhTPPLCT0
         a1o2XKlc2VCbQ/+crjGMHgAJevEnT3b2b/Gm0=
X-Forwarded-Encrypted: i=1; AL+hErFEj9HzIxS5BwOwsNkT86l0Lr/LgBXkb4anZjjoFKDtQ7RHpWkn08NnabluHMXAH+JBDiJpZWLplCCb69k=@vger.kernel.org
X-Received: by 2002:a17:902:fdaf:b0:2ed:391c:1de1 with SMTP id d9443c01a7336-2ee0d6654bfmr118905615ad.1.1794896316566;
        Mon, 16 Nov 2026 22:18:36 -0800 (PST)
X-Received: by 2002:a17:902:fdaf:b0:2ed:391c:1de1 with SMTP id d9443c01a7336-2ee0d6654bfmr118905465ad.1.1794896316065;
        Mon, 16 Nov 2026 22:18:36 -0800 (PST)
Received: from localhost.localdomain ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd76d8668sm8669335ad.6.2026.11.16.22.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:18:35 -0800 (PST)
From: Bhargava Marreddy <bhargava.marreddy@broadcom.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	vsrama-krishna.nemani@broadcom.com,
	vikas.gupta@broadcom.com,
	Bhargava Marreddy <bhargava.marreddy@broadcom.com>,
	Dharmender Garg <dharmender.garg@broadcom.com>,
	Kumar Mudide <kumar.mudide@broadcom.com>,
	Ramakrishna Koduri <ramakrishna.koduri@broadcom.com>
Subject: [PATCH net-next v5 3/5] bnge: add bnge_for_each_open_nq() iterator
Date: Tue, 17 Nov 2026 06:16:39 +0000
Message-ID: <20261117061641.122942-4-bhargava.marreddy@broadcom.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117061641.122942-1-bhargava.marreddy@broadcom.com>
References: <20261117061641.122942-1-bhargava.marreddy@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Add BNGE_FIRST_OPEN_NQ and bnge_for_each_open_nq(), and use them in the
loops that will need to skip the NQ that is created at probe once it is
split out. The "open" NQs are those whose IRQs and firmware rings are
created in ndo_open() and destroyed in ndo_stop(), i.e., all NQs from
index BNGE_FIRST_OPEN_NQ on.

The loops that create, free and name the "open" NQs are converted: the
NQ and bnapi allocation, the firmware NQ alloc/free, and the IRQ
setup/request/free.

The following loops are intentionally left alone, as they cover all NQs
(including NQ0):

  - CP rings and per-NQ stats: NQ0's completion structures remain tied
    to open/stop.
  - NAPI registration (init/del) and enable/disable: NQ0's NAPI exists
    only between open and stop, like the others.
  - Interrupt arm/disarm: NQ0 is armed and disarmed together with the
    other NQs.

In bnge_hwrm_ring_free(), split the NQ free out of the completion ring
loop so that it can use the iterator, mirroring bnge_hwrm_ring_alloc().
This changes the order of the firmware commands: previously each NQ was
freed right after its own completion rings, now all completion rings
are freed first and all NQs after. Each completion ring is still freed
before the NQ it belongs to.

BNGE_FIRST_OPEN_NQ is 0 for now, i.e., every NQ is an open NQ, so the
macro expands to the loops it replaces. Apart from the firmware command
order above, no functional change.

Signed-off-by: Bhargava Marreddy <bhargava.marreddy@broadcom.com>
Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
Reviewed-by: Kumar Mudide <kumar.mudide@broadcom.com>
Reviewed-by: Ramakrishna Koduri <ramakrishna.koduri@broadcom.com>
Reviewed-by: Vikas Gupta <vikas.gupta@broadcom.com>
---
 drivers/net/ethernet/broadcom/bnge/bnge.h     |  8 ++++++++
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  | 19 +++++++++++--------
 2 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge.h b/drivers/net/ethernet/broadcom/bnge/bnge.h
index e76ba4e063bb..5cc08177ff86 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge.h
@@ -238,6 +238,14 @@ struct bnge_dev {
 #define bnge_warn(bd, fmt, ...)	bnge_log(warn, bd, fmt, ##__VA_ARGS__)
 #define bnge_dbg(bd, fmt, ...)	bnge_log(dbg, bd, fmt, ##__VA_ARGS__)
 
+/* Index of the first NQ created in ndo_open() and destroyed in ndo_stop();
+ * lower NQs live from probe to remove.
+ */
+#define BNGE_FIRST_OPEN_NQ	0
+
+#define bnge_for_each_open_nq(i, bd) \
+	for ((i) = BNGE_FIRST_OPEN_NQ; (i) < (bd)->nq_nr_rings; (i)++)
+
 static inline bool bnge_is_roce_en(struct bnge_dev *bd)
 {
 	return bd->flags & BNGE_EN_ROCE;
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
index d95c3c1469da..c2f1f517348e 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
@@ -549,7 +549,7 @@ static void bnge_free_nqs(struct bnge_net *bn)
 	struct bnge_dev *bd = bn->bd;
 	int i;
 
-	for (i = 0; i < bd->nq_nr_rings; i++)
+	bnge_for_each_open_nq(i, bd)
 		bnge_free_nq(bn, bn->bnapi[i]);
 }
 
@@ -563,7 +563,7 @@ static int bnge_alloc_nqs(struct bnge_net *bn)
 	 * so every NQ gets a distinct irq_tbl index.
 	 */
 	aux_msix = bnge_aux_get_msix(bd);
-	for (i = 0; i < bd->nq_nr_rings; i++) {
+	bnge_for_each_open_nq(i, bd) {
 		rc = bnge_alloc_nq(bn, bn->bnapi[i], aux_msix);
 		if (rc)
 			goto err_free_nqs;
@@ -571,7 +571,7 @@ static int bnge_alloc_nqs(struct bnge_net *bn)
 	return 0;
 
 err_free_nqs:
-	while (--i >= 0)
+	while (--i >= BNGE_FIRST_OPEN_NQ)
 		bnge_free_nq(bn, bn->bnapi[i]);
 	return rc;
 }
@@ -1255,10 +1255,11 @@ static int bnge_alloc_core(struct bnge_net *bn)
 
 	bn->bnapi = bnapi;
 	bnapi += arr_size;
-	for (i = 0; i < bd->nq_nr_rings; i++, bnapi += size) {
+	bnge_for_each_open_nq(i, bd) {
 		bn->bnapi[i] = bnapi;
 		bn->bnapi[i]->index = i;
 		bn->bnapi[i]->bn = bn;
+		bnapi += size;
 	}
 
 	bn->rx_ring = kzalloc_objs(struct bnge_rx_ring_info, bd->rx_nr_rings);
@@ -1976,7 +1977,7 @@ static int bnge_hwrm_ring_alloc(struct bnge_net *bn)
 	int i, rc = 0;
 
 	agg_rings = !!(bnge_is_agg_reqd(bd));
-	for (i = 0; i < bd->nq_nr_rings; i++) {
+	bnge_for_each_open_nq(i, bd) {
 		struct bnge_napi *bnapi = bn->bnapi[i];
 		struct bnge_ring_struct *ring = &bnapi->nq_ring.ring_struct;
 
@@ -2615,7 +2616,9 @@ static void bnge_hwrm_ring_free(struct bnge_net *bn, bool close_path)
 
 		for (j = 0; j < nqr->cp_ring_count && nqr->cp_ring_arr; j++)
 			bnge_hwrm_cp_ring_free(bn, &nqr->cp_ring_arr[j]);
+	}
 
+	bnge_for_each_open_nq(i, bd) {
 		bnge_hwrm_nq_free(bn, bn->bnapi[i]);
 		bn->grp_info[i].nq_fw_ring_id = INVALID_HW_RING_ID;
 	}
@@ -2628,7 +2631,7 @@ static void bnge_setup_msix(struct bnge_net *bn)
 	int len, i;
 
 	len = sizeof(bd->irq_tbl[0].name);
-	for (i = 0; i < bd->nq_nr_rings; i++) {
+	bnge_for_each_open_nq(i, bd) {
 		int map_idx = bnge_cp_num_to_irq_num(bn, i);
 		char *attr;
 
@@ -2713,7 +2716,7 @@ static void bnge_free_irq(struct bnge_net *bn)
 	struct bnge_dev *bd = bn->bd;
 	int i;
 
-	for (i = 0; i < bd->nq_nr_rings; i++)
+	bnge_for_each_open_nq(i, bd)
 		bnge_nq_free_irq(bn, bn->bnapi[i]);
 }
 
@@ -2727,7 +2730,7 @@ static int bnge_request_irq(struct bnge_net *bn)
 		netdev_err(bn->netdev, "bnge_setup_interrupts err: %d\n", rc);
 		return rc;
 	}
-	for (i = 0; i < bd->nq_nr_rings; i++) {
+	bnge_for_each_open_nq(i, bd) {
 		rc = bnge_nq_request_irq(bn, bn->bnapi[i]);
 		if (rc)
 			goto err_free_irq;
-- 
2.47.3

