Received: from mail-ot1-f99.google.com (mail-ot1-f99.google.com [209.85.210.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CBD5476D8
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791922103; cv=none; b=tj0+mRC4gu4PkYE5s0j4Gng6+4RxVxtjamME4sh9Z+YZYWhUHvVscBCemTvRLyJ/J0470u1ckxSS14LofZWGGenRFHruqtrTLkEwxZtnhaDm0sI55zl4R0TU+zzwP6TYnm4i9M9x/35OJx4Mwd4ygsdJMI+ByU9LFjkJqmtAYSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791922103; c=relaxed/simple;
	bh=9yo9xv6KxKaLJOPj8QN0fOXVqpQCRiX2rAK9W0phauE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lh9J13wK18yh7InKsnzjRp7oK13ySSGZgCpDUtpx35Sk2p0RwFwus2e2XcLzmRWXxtdMIzQU+YA7SzEXYdCdesRw1yBaZ6lXsTnVIIv/Li7Re3jiaKbOxPbuPvSekefpjN5z+MYY7hA2xwlM+myhJ5pBidT3dgshUbG7gI2cpMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=NBpipssB; arc=none smtp.client-ip=209.85.210.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="NBpipssB"
Received: by mail-ot1-f99.google.com with SMTP id 46e09a7af769-822ddb835fbso2486764a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:08:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791922099; x=1792526899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rbjWRwvBceXDUpKmVzvJBj3QPpFh+Fowktv6+6Nd1Uc=;
        b=K18i1vxizmpOy2UJ7qSXxeX7n89mUDtrbUtUgdJWObMW+mB2uZKvrskjhx3OLb5uBN
         YJ7/LBrJITnCqY2x23JLhul5fTUc2GqIWdvLU33ZMvhXBuordugvBo3p12EMwcvWIUS9
         nOS1Yt7VEVir+ADGXohiFcWJBzgcVw/SPItpAlseNdTZAIBSl8XxQ04HxUMJLzx8MZjB
         JvpErD9pHUG/6VrzvLxThoQ9LzQj/al8tD79GmiP04EL8/Rqx/AHM0tFPuJUVaZTLzZT
         nyVYEHiyvLRPrkO9Znwnn4iZwqfwqCVggY0wHFxW3pvfIN+eCtcqhh2rmUXyjiSNhBJj
         OuWg==
X-Forwarded-Encrypted: i=1; AKwUvBzygCBpZe6+4EnC660XjqEYUbY/x+7JsV16zcHhmMSGDKncReOuOp3jPIbGgFwmBvSXGovRfpeKmM9dTN0=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8QKfVw+nbFvz7uiRNST8OKOwsxrrtmkCH1U3OQEborTE+qYQU
	ipQvwrwMS1egzG/SqkkLR0kjffJsGjrxMoHH+2BaIrC2isXoMRO9aEms6WZHEvWTiorPXQ64iq4
	ylB9XpfduRW7V1aZ6AkAh8GF33JdQWEhjn7PoJ51ptNX8UrikVP1NaiNsLhUx2eO8GCeCpxqXfb
	8MB2qegyvIOURnQSR4T5UrUqeHEqblvz38zO7xtsNiq84Bnt4RgqokpzYFq1jjVOdCEcs+nVd8Q
	CfHqqlQCYSAboU07VJV7ZfMewwRvsE=
X-Gm-Gg: AYBFou0Ln6ucsGkFZheERjd1uhvsOqvzXvaWNfP7Y+Y6NGdxV6Ng3n2bbpoJnL0vXfD
	dla3QcoXbXtQ6A6GPoT+CINWbs6GrAwlE7ZmHymFqTTfiDI8Z3eCuiHpunfih1+UFNHnscsQWkN
	nocMPS5vvjTJFIJMelBzKWu/FmQdzjWCJggksgr6PEdvnRX5cEw9cechyuYxJZBQAfUwtqifKhu
	9S69j3ePayhpUrHaSb7QPrAcerE0I6BpKcc+/hpbypoaLuqesGfC6MXr0CCz2V1HfIe0c2zCS+P
	ykKZqwurOQL658UFio6YuEShJc3T1OCHSvLxT3flLLrP+o52yqN7QBszxHHVmTfc07RWxYSEWlS
	nP2znKLtOXdyDz2h3MsHj0DE0Iy3/IixsQG9gofV9gUanL3lhs+YkEwFbmEtOImXu2Z+RPykc77
	CeD5pmjwBZxbcnZwVxXOnKp/ghxPo8H/HRZOgc7dD7VPKE
X-Received: by 2002:a05:6808:6f94:b0:4c3:b290:cf55 with SMTP id 5614622812f47-50c42a26c1dmr11553219b6e.7.1791922099563;
        Tue, 13 Oct 2026 13:08:19 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-4a6dfcb178csm24633fac.18.2026.10.13.13.08.17
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Oct 2026 13:08:19 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-156b5338d4bso563323c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791922096; x=1792526896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rbjWRwvBceXDUpKmVzvJBj3QPpFh+Fowktv6+6Nd1Uc=;
        b=NBpipssBI1awyaBfO9yTIZUYsKB0o2atQJbjNxnjQDti43juYDPnt9AIV2OqbAvv2P
         TimCUYaajWghjOg2F0ps/xk0UrV2OqnfsbXUwOBxsPI24tv0hI4A2UkPV5BPh4QCp6KD
         DBXxIaAYqT8q01ouRUPWa1MdIrBTKCNkXXbp8=
X-Forwarded-Encrypted: i=1; AKwUvBxQea9OzoEFmA3O2h66X/esTwvI5Q9AAE4zFT4TkCvIlrBXiRyYYZCPdPeSUJ/OoMAt/QiYh2uXH680LMA=@vger.kernel.org
X-Received: by 2002:a05:701b:21db:b0:149:ef22:2fa2 with SMTP id a92af1059eb24-16a5dcf5a62mr18926970c88.8.1791922096211;
        Tue, 13 Oct 2026 13:08:16 -0700 (PDT)
X-Received: by 2002:a05:701b:21db:b0:149:ef22:2fa2 with SMTP id a92af1059eb24-16a5dcf5a62mr18926890c88.8.1791922094795;
        Tue, 13 Oct 2026 13:08:14 -0700 (PDT)
Received: from localhost.localdomain ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a31f6f5csm39526585c88.11.2026.10.13.13.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 13:08:14 -0700 (PDT)
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
Subject: [PATCH net-next v3 3/5] bnge: add bnge_for_each_open_nq() iterator
Date: Wed, 14 Oct 2026 01:36:43 +0530
Message-ID: <20261013200645.1346299-4-bhargava.marreddy@broadcom.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261013200645.1346299-1-bhargava.marreddy@broadcom.com>
References: <20261013200645.1346299-1-bhargava.marreddy@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Add BNGE_FIRST_OPEN_NQ and bnge_for_each_open_nq(), and use them in the
loops that will need to skip the NQ that is created at probe once it is
split out. The "open" NQs are the ones created in ndo_open() and
destroyed in ndo_stop(), i.e. all NQs from index BNGE_FIRST_OPEN_NQ on.
The loop that carves the bnge_napi instances out of the bn->bnapi
allocation in bnge_alloc_core() is converted as well; its allocation
size will be reduced by BNGE_FIRST_OPEN_NQ when the probe-time NQ moves
out of it.

The loops over the completion rings, over the per-NQ stats and ring
group state, and the interrupt disable/sync loops are intentionally
left alone, as they still cover all NQs. The latter must mask and
synchronize the IRQ of the probe-time NQ before its completion rings
are freed.

In bnge_hwrm_ring_free(), split the NQ free out of the completion ring
loop so that it can use the iterator, mirroring bnge_hwrm_ring_alloc().
This changes the order of the firmware commands: previously each NQ was
freed right after its own completion rings, now all completion rings
are freed first and all NQs after. Each completion ring is still freed
before the NQ it belongs to.

BNGE_FIRST_OPEN_NQ is 0 for now, i.e. every NQ is an open NQ, so the
macro expands to the loops it replaces. Apart from the firmware command
order above, no functional change.

Signed-off-by: Bhargava Marreddy <bhargava.marreddy@broadcom.com>
Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
Reviewed-by: Kumar Mudide <kumar.mudide@broadcom.com>
Reviewed-by: Ramakrishna Koduri <ramakrishna.koduri@broadcom.com>
---
 drivers/net/ethernet/broadcom/bnge/bnge.h     |  9 ++++++
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  | 29 ++++++++++---------
 2 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge.h b/drivers/net/ethernet/broadcom/bnge/bnge.h
index e76ba4e063bb..fdd8bca01440 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge.h
@@ -238,6 +238,15 @@ struct bnge_dev {
 #define bnge_warn(bd, fmt, ...)	bnge_log(warn, bd, fmt, ##__VA_ARGS__)
 #define bnge_dbg(bd, fmt, ...)	bnge_log(dbg, bd, fmt, ##__VA_ARGS__)
 
+/* Index of the first NQ created in ndo_open() and destroyed in ndo_stop().
+ * NQs below it are created at probe and destroyed at remove. It starts at 0,
+ * i.e. all NQs are open NQs, until NQ0 moves to probe.
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
index f8f81f3f7cd9..0d98223cd703 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
@@ -548,7 +548,7 @@ static void bnge_free_nqs(struct bnge_net *bn)
 	struct bnge_dev *bd = bn->bd;
 	int i;
 
-	for (i = 0; i < bd->nq_nr_rings; i++)
+	bnge_for_each_open_nq(i, bd)
 		bnge_free_nq(bn, bn->bnapi[i]);
 }
 
@@ -557,7 +557,7 @@ static int bnge_alloc_nqs(struct bnge_net *bn)
 	struct bnge_dev *bd = bn->bd;
 	int i, rc;
 
-	for (i = 0; i < bd->nq_nr_rings; i++) {
+	bnge_for_each_open_nq(i, bd) {
 		rc = bnge_alloc_nq(bn, bn->bnapi[i]);
 		if (rc)
 			goto err_free_nqs;
@@ -565,7 +565,7 @@ static int bnge_alloc_nqs(struct bnge_net *bn)
 	return 0;
 
 err_free_nqs:
-	while (--i >= 0)
+	while (--i >= BNGE_FIRST_OPEN_NQ)
 		bnge_free_nq(bn, bn->bnapi[i]);
 	return rc;
 }
@@ -1249,10 +1249,11 @@ static int bnge_alloc_core(struct bnge_net *bn)
 
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
@@ -1970,7 +1971,7 @@ static int bnge_hwrm_ring_alloc(struct bnge_net *bn)
 	int i, rc = 0;
 
 	agg_rings = !!(bnge_is_agg_reqd(bd));
-	for (i = 0; i < bd->nq_nr_rings; i++) {
+	bnge_for_each_open_nq(i, bd) {
 		struct bnge_napi *bnapi = bn->bnapi[i];
 		struct bnge_ring_struct *ring = &bnapi->nq_ring.ring_struct;
 
@@ -2426,7 +2427,7 @@ static void bnge_enable_int(struct bnge_net *bn)
 	struct bnge_dev *bd = bn->bd;
 	int i;
 
-	for (i = 0; i < bd->nq_nr_rings; i++) {
+	bnge_for_each_open_nq(i, bd) {
 		struct bnge_napi *bnapi = bn->bnapi[i];
 		struct bnge_nq_ring_info *nqr;
 
@@ -2443,7 +2444,7 @@ static void bnge_disable_napi(struct bnge_net *bn)
 	if (test_and_set_bit(BNGE_STATE_NAPI_DISABLED, &bn->state))
 		return;
 
-	for (i = 0; i < bd->nq_nr_rings; i++) {
+	bnge_for_each_open_nq(i, bd) {
 		struct bnge_napi *bnapi = bn->bnapi[i];
 
 		napi_disable_locked(&bnapi->napi);
@@ -2456,7 +2457,7 @@ static void bnge_enable_napi(struct bnge_net *bn)
 	int i;
 
 	clear_bit(BNGE_STATE_NAPI_DISABLED, &bn->state);
-	for (i = 0; i < bd->nq_nr_rings; i++) {
+	bnge_for_each_open_nq(i, bd) {
 		struct bnge_napi *bnapi = bn->bnapi[i];
 
 		bnapi->in_reset = false;
@@ -2609,7 +2610,9 @@ static void bnge_hwrm_ring_free(struct bnge_net *bn, bool close_path)
 
 		for (j = 0; j < nqr->cp_ring_count && nqr->cp_ring_arr; j++)
 			bnge_hwrm_cp_ring_free(bn, &nqr->cp_ring_arr[j]);
+	}
 
+	bnge_for_each_open_nq(i, bd) {
 		bnge_hwrm_nq_free(bn, bn->bnapi[i]);
 		bn->grp_info[i].nq_fw_ring_id = INVALID_HW_RING_ID;
 	}
@@ -2622,7 +2625,7 @@ static void bnge_setup_msix(struct bnge_net *bn)
 	int len, i;
 
 	len = sizeof(bd->irq_tbl[0].name);
-	for (i = 0; i < bd->nq_nr_rings; i++) {
+	bnge_for_each_open_nq(i, bd) {
 		int map_idx = bnge_cp_num_to_irq_num(bn, i);
 		char *attr;
 
@@ -2707,7 +2710,7 @@ static void bnge_free_irq(struct bnge_net *bn)
 	struct bnge_dev *bd = bn->bd;
 	int i;
 
-	for (i = 0; i < bd->nq_nr_rings; i++)
+	bnge_for_each_open_nq(i, bd)
 		bnge_nq_free_irq(bn, bn->bnapi[i]);
 }
 
@@ -2721,7 +2724,7 @@ static int bnge_request_irq(struct bnge_net *bn)
 		netdev_err(bn->netdev, "bnge_setup_interrupts err: %d\n", rc);
 		return rc;
 	}
-	for (i = 0; i < bd->nq_nr_rings; i++) {
+	bnge_for_each_open_nq(i, bd) {
 		rc = bnge_nq_request_irq(bn, bn->bnapi[i]);
 		if (rc)
 			goto err_free_irq;
@@ -2840,7 +2843,7 @@ static void bnge_init_napi(struct bnge_net *bn)
 	struct bnge_napi *bnapi;
 	int i;
 
-	for (i = 0; i < bd->nq_nr_rings; i++) {
+	bnge_for_each_open_nq(i, bd) {
 		bnapi = bn->bnapi[i];
 		netif_napi_add_config_locked(bn->netdev, &bnapi->napi,
 					     bnge_napi_poll, bnapi->index);
@@ -2857,7 +2860,7 @@ static void bnge_del_napi(struct bnge_net *bn)
 	for (i = 0; i < bd->tx_nr_rings; i++)
 		netif_queue_set_napi(bn->netdev, i, NETDEV_QUEUE_TYPE_TX, NULL);
 
-	for (i = 0; i < bd->nq_nr_rings; i++) {
+	bnge_for_each_open_nq(i, bd) {
 		struct bnge_napi *bnapi = bn->bnapi[i];
 
 		__netif_napi_del_locked(&bnapi->napi);
-- 
2.47.3

