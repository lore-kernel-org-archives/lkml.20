Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794386766;
	b=ZGimEynAWjwe1VGGhc6PixPnx1dTw/QO66qVzKySBjUhe7nil/+1ZEM/45A6+DHophjN
	 rwPwpkafWSKB2Xy4S4QSrLQbev9NIU21BCSSYF8nrKksMNOtVtQYnDysu4FbfgIdCTinq
	 ViztHubzS3+AA2zreenKFHr5OWDjEDvM/xvh1rQ1ljo9e/s4Ie68rzJcKINn4FOVagaWf
	 ePn4pqtKpvBf0xbnBupczDYuEqGgCdSn+RaOM7DZPVPdhS6N4AIpxoLQjaw5TqHoWFErV
	 J9XI51CpIizkp0f+Ck0OhuPEsip+IEIRCiPXDY3N8vS/lv1wbtmEIYILbfrNbFOrsqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794386766;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/9IvjTxyM4LdWMjExg8wu4Ta4lNWPMsKxY0SwENgoys=;
	b=SormPg35RysxSuH2wAQZHCANkvWjtxmGiQFv1da21y8wh05YOuo6INHp+IRAUQPTkBKU
	 n+T9fHmPKHbTVoiTC7ebmQmvvBTjSth4dbOzUOQ5v/U76IKsZixhdVbaEuuHRFSFLb/2j
	 U7vEansY0QBpffU1GOdLBMTRSYEI+PBJJtJgzfpq80RwTMRDFzeZunJAUh5nElgC3plBF
	 AZ04L3+nmEpEHH1fiCyt7Hm5ZcmnY00ocpsZ7rtDj50HwV69rKoWPvwkKcg/bVrhwBK+5
	 EwkE9S9JwOHNwLyIvQx31AgBxXSQDQP4IZMqUTq7mhz4iBUNjN2fcLetNPXXqffFMRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="e6Z8T5/e";
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8208606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:46:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8208606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e6Z8T5/e
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36a315ed211so3265521eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794386765; x=1794991565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/9IvjTxyM4LdWMjExg8wu4Ta4lNWPMsKxY0SwENgoys=;
        b=e6Z8T5/eW8FAz0b80jYDGKUHvB4HANfS/VNHF4HoRAMouMzZObLis0iS8oMkcLON8/
         Epw1/gu4leERwGLLZXMq/2xJeJ491+Wa0rJGje6PnY+OsYOOQWyFrssEQSw1wQd/kpiw
         u3UwowBZhvTcPSNJtVwhZDGTMRAsCsIc2cYOuucb1Hs12itWkpTQaPK87QMvtheEx3NV
         Y2YkM9b/PqXIMPCOhmo6OHW4Pu9bDus+OAGFgieBuAKY84KwKAifP4x1yhFUesiu4VMj
         YQZCcutJWnGnO2FL4Cz0vFE2yN8AQh8kfwiEX4h0hwtREzs7DeKKYsa61eVQdfuWdmnM
         fhzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794386765; x=1794991565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/9IvjTxyM4LdWMjExg8wu4Ta4lNWPMsKxY0SwENgoys=;
        b=n1n9ujsjQemOqT1Esc37WLqeVlncGvxq2t8p/kFfp0nbeytBadY3xzcdRbfuyl69wK
         vfo4jelDKCbaBNzifCuYf1qsXdGfbAtPrcY+8YWAFVCiCaksjYf6FgQhHIQ/zA1wt0Is
         JYxr9xtZ1ewUvp1IUK2cNLIJ2466DzSOSOrbijhYNEinmjag7845o8YevuIGUpcAiABD
         nmX3iA6ht11vl099S33jAqbX9yibhdeLEjJVBXJ3G1kofEqu2fGjOZsSPeHp4IEVmjRq
         TnBRmZ7LuCoBn2lxGcaCHX2lRyYSUDzqiU+B+dFOcbcRkjIisRo5t1hTvL4lkmE9Y5fX
         oAcg==
X-Forwarded-Encrypted: i=1; AL+hErHMfLgyJBwTU64S+80RWmZeXq9CKTf/nmXDnerWdbkV+O4arL3KBSS/6rglkdHGobJUHEQLCPAlrkP7eAY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/y9W9vaqjd1wYSM2QCs1MmkbohDnuT2EHkoYXXvNXW6+AugP9/
	SPVXErpJzU4trx/fGV3PTdINu2oULYM4tPzwgSljzAwAUkrn0FXzMEos
X-Gm-Gg: AYBFou1qRdrFsyhbAa+BJqftSfxSR9ZmYKnXV+qS2P6p3Dl7C8r09nuqIAO6L4d3jg1
	XyyNT0IO+0/4wCLw9ieZ1ZwWuAlSW0Pl4aqOWg7gEuj28ShiPDTuUSDuh/o3UjuDRNw2VMoARjf
	vYSUTxrp5rHWCtZqG0kmss+s5D66Oi0bfSsiyzREpkbhF7ZPzyjyEargE4YW46XNj9cmSY8pFP4
	mRxKw/4BORJpAVMd4QFyWNrrLus9KdZPBOVL/hg5BK4R7KKfB4aV2zzHa1mSP8tFnGS5+fprMdM
	IUkpkYBjlGjHaeW574Sn43rWYHXakj79jqLiBRk/LVvQy7b/Utfl0uAaH1TpTV6RBWF05tgawm7
	QOJ6PZXyEoJZ+JuRCQu82rEi30dRavEBsuG0XDdnPoC3xv87zCJPHTk0cw8CLjHVZHIGKfgXWkQ
	DG+rrChQPRNNlspHYC+R+a1ACXBLYWEHEOTarcOcsE1N9ffItKA1K/VfKj8IpL8f6wk44p99VCl
	De20i3+a6QRArHOgj8D0DLhmdjv+qMrqdDKomvO+Xf8pdgAPY/aqcaXeYdD8JS0+fQoXeCXgz5S
	H+ESocKdmTAYUSNwatyIqfp+plEyKAY1zrNhuS3R2ToagzFg
X-Received: by 2002:a05:693c:830b:b0:358:c5c9:2661 with SMTP id 5a478bee46e88-37686755b1amr1894499eec.10.1794386764680;
        Wed, 11 Nov 2026 00:46:04 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751dae6377sm12811395eec.3.2026.11.11.00.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:46:04 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Vaibhav Jain <vaibhav@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Athira Rajeev <atrajeev@linux.ibm.com>,
	Christophe Leroy <chleroy@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] powerpc/kvm-hv-pmu: don't allocate under lock_l0_stats in kvmppc_init_hostwide
Date: Wed, 11 Nov 2026 17:45:52 +0900
Message-ID: <20261111084553.3039506-1-hj351016@gmail.com>
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

kvmppc_init_hostwide() builds the hostwide L0-stats guest-state message and
buffer with kvmppc_gsm_new() and kvmppc_gsb_new() while holding
lock_l0_stats, which is taken with spin_lock_irqsave(). Both helpers
allocate with GFP_KERNEL (and kvmppc_gsb_new() does a further GFP_KERNEL
allocation internally), so they can sleep in atomic context, triggering
"BUG: sleeping function called from invalid context" under
CONFIG_DEBUG_ATOMIC_SLEEP.

lock_l0_stats is a spinlock because it also serializes the PMU ->read path
(kvmppc_pmu_event_update()), so it cannot be turned into a mutex. Build the
message and buffer in local variables outside the lock and only take the
lock to publish them, rechecking for a concurrent registration.

Fixes: f0c9c49c5067 ("powerpc/kvm-hv-pmu: Implement GSB message-ops for hostwide counters")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 arch/powerpc/perf/kvm-hv-pmu.c | 70 ++++++++++++++++++++++++++----------------
 1 file changed, 42 insertions(+), 28 deletions(-)

diff --git a/arch/powerpc/perf/kvm-hv-pmu.c b/arch/powerpc/perf/kvm-hv-pmu.c
index aa72b96b5a8c..deba59cbe234 100644
--- a/arch/powerpc/perf/kvm-hv-pmu.c
+++ b/arch/powerpc/perf/kvm-hv-pmu.c
@@ -314,53 +314,67 @@ static struct kvmppc_gs_msg_ops gsb_ops_l0_stats = {
 
 static int kvmppc_init_hostwide(void)
 {
-	int rc = 0;
+	struct kvmppc_gs_msg *gsm;
+	struct kvmppc_gs_buff *gsb;
 	unsigned long flags;
+	int rc;
 
 	spin_lock_irqsave(&lock_l0_stats, flags);
-
 	/* already registered ? */
 	if (gsm_l0_stats) {
-		rc = 0;
-		goto out;
+		spin_unlock_irqrestore(&lock_l0_stats, flags);
+		return 0;
 	}
+	spin_unlock_irqrestore(&lock_l0_stats, flags);
+
+	/*
+	 * kvmppc_gsm_new() and kvmppc_gsb_new() allocate with GFP_KERNEL and
+	 * may sleep, so build the message and buffer outside lock_l0_stats,
+	 * which is a spinlock (it also serializes the PMU ->read path), and
+	 * only take the lock to publish them.
+	 */
 
 	/* setup the Guest state message/buffer to talk to L0 */
-	gsm_l0_stats = kvmppc_gsm_new(&gsb_ops_l0_stats, &l0_stats,
-				      GSM_SEND, GFP_KERNEL);
-	if (!gsm_l0_stats) {
-		rc = -ENOMEM;
-		goto out;
-	}
+	gsm = kvmppc_gsm_new(&gsb_ops_l0_stats, &l0_stats, GSM_SEND, GFP_KERNEL);
+	if (!gsm)
+		return -ENOMEM;
 
 	/* Populate the Idents */
-	kvmppc_gsm_include(gsm_l0_stats, KVMPPC_GSID_L0_GUEST_HEAP);
-	kvmppc_gsm_include(gsm_l0_stats, KVMPPC_GSID_L0_GUEST_HEAP_MAX);
-	kvmppc_gsm_include(gsm_l0_stats, KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE);
-	kvmppc_gsm_include(gsm_l0_stats, KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE_MAX);
-	kvmppc_gsm_include(gsm_l0_stats, KVMPPC_GSID_L0_GUEST_PGTABLE_RECLAIM);
+	kvmppc_gsm_include(gsm, KVMPPC_GSID_L0_GUEST_HEAP);
+	kvmppc_gsm_include(gsm, KVMPPC_GSID_L0_GUEST_HEAP_MAX);
+	kvmppc_gsm_include(gsm, KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE);
+	kvmppc_gsm_include(gsm, KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE_MAX);
+	kvmppc_gsm_include(gsm, KVMPPC_GSID_L0_GUEST_PGTABLE_RECLAIM);
 
 	/* allocate GSB. Guest/Vcpu Id is ignored */
-	gsb_l0_stats = kvmppc_gsb_new(kvmppc_gsm_size(gsm_l0_stats), 0, 0,
-				      GFP_KERNEL);
-	if (!gsb_l0_stats) {
+	gsb = kvmppc_gsb_new(kvmppc_gsm_size(gsm), 0, 0, GFP_KERNEL);
+	if (!gsb) {
 		rc = -ENOMEM;
-		goto out;
+		goto free_gsm;
 	}
 
 	/* ask the ops to fill in the info */
-	rc = kvmppc_gsm_fill_info(gsm_l0_stats, gsb_l0_stats);
+	rc = kvmppc_gsm_fill_info(gsm, gsb);
+	if (rc)
+		goto free_gsb;
 
-out:
-	if (rc) {
-		if (gsm_l0_stats)
-			kvmppc_gsm_free(gsm_l0_stats);
-		if (gsb_l0_stats)
-			kvmppc_gsb_free(gsb_l0_stats);
-		gsm_l0_stats = NULL;
-		gsb_l0_stats = NULL;
+	spin_lock_irqsave(&lock_l0_stats, flags);
+	if (gsm_l0_stats) {
+		/* raced with another CPU; use the existing registration */
+		spin_unlock_irqrestore(&lock_l0_stats, flags);
+		rc = 0;
+		goto free_gsb;
 	}
+	gsm_l0_stats = gsm;
+	gsb_l0_stats = gsb;
 	spin_unlock_irqrestore(&lock_l0_stats, flags);
+
+	return 0;
+
+free_gsb:
+	kvmppc_gsb_free(gsb);
+free_gsm:
+	kvmppc_gsm_free(gsm);
 	return rc;
 }
 
-- 
2.43.0
