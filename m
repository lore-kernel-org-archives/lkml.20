Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482796;
	b=Dq3C4EBuZUh6GQdrJQRpujjTmINHK7VwVA9KXjVLeA/61iS/ffqHv1/gCEOZiSVmu6NU
	 iucJHGUrreD52/ICXLcpIs19KNmxlRRcDNhrwnL9WfDZ5fNY/VpeBEnoCoJB0FOSfhYYu
	 9/foW6olLdwaujM8my4bTbTNQ58/8iJEFrdU0k4DNgu4AE8Y2IIFerhfFfxYhutXBNOO4
	 66+z4/EYj5vmH1IkYCQIp7i6e02UPv0JfhcSYR4FN99lR6au5QBEKAiW2yy2aGFoSQXg3
	 VnyYC4DE0xFE+Jfb4haKZ12AoU6+0nXIXsuyR/snkL7glkwJGll/0rTMHtobvXxuCxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482796;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=X7gmftng8XyC6y3KS/A/XtQM72Yig5hdROs/Yc4m/MI=;
	b=cxDc2gxLc31ZUeEKpEDG19jv7Lw3pipUNbnkcWuA82AYrMoJqeFTQgz9bO7VacUF/5lX
	 0l3+ibMaSbDGAHVZ4IZlOcmRiG5iAdjEzkLndxiuK0LpHgVb8RWmVLvIAC0LeBC0gh/rX
	 deIGawW7pn+DQBifqgZma/vG9mbbjy8X0AMGKtZt3e9/IZVqwPPEjuZKz7piggmniHAWg
	 guebKT22ywx2hArkFW9uzymdePvbGllKWJ9Hogry9lacqI88kvUDWZu4SyHsKiQdoAsXy
	 PENtjXOGbUQNRHTU9Vt3h1n0sB7zkHd2kmGl1QnD6HtAFK2oMavDT3sQj5+OyVrj5Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KQS0jTXL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jym5NdYm;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DB460A260D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85DB460A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KQS0jTXL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jym5NdYm
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC6ZrAI3670877
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X7gmftng8XyC6y3KS/A/XtQM72Yig5hdROs/Yc4m/MI=; b=KQS0jTXL9Q8UpSEF
	eFXu+ZdFKEImDCucQHkeBKEu5RZ+egnKyKyqkp+g48qLQU4cLqBIUuSb3+zGuhCs
	tzu+WPjsuRoYMGLdpSJbvRCPIg2dg6CeCUXxPWt2K/LI6cSGSxvAjZEwH67e7Uvh
	xNq6mxqRD8ykLj2cmPgLVSchTO34HpMvRtresAeng/KEsG1t0Jf1LyVni7Yr8jjK
	pxEi8CChQDE1DQMnmr9yKr5KsOanJaTSqjKsdQsnqCfWz+RCUEVHPOiy/JXUmcAk
	rsyoQaKyBYRrr2plb/KYs0nKZrk9dmUXmMgsiW5hOEsnu7BNxbOvmD90dsnUhIor
	KkrwMw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6yuha09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:26:35 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a3451ea93so5651897eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794482795; x=1795087595; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X7gmftng8XyC6y3KS/A/XtQM72Yig5hdROs/Yc4m/MI=;
        b=jym5NdYmSYFYSiNGj5LmCh7qokMJ54kku9JD5QLidtkTnAyvLPeO8hFQbG3eGTSomI
         VX6jF6WXZCgbgf/URnL5LFjFUmP96QhUmkp8pRMw1KSKXlvLALlH4XTROI2EKK9zHWZb
         L+XsLfOr6LEmOEumfDaoWBCMoqeKy/hwblfIBp8l7YrATS4fj1ecV5HrvLLb/qbHrRVF
         gFzcc4ZshdgyccUGWCuvIFcFn5RBLgIT54rCn4R6MP6EOKw+5VgrdV6vvHvuvcinpaPC
         iqzaVrJF/iEgiukrwCsehdjfM1HwdGS54PlWUEJ276n09S+FLi4OZtuqaywaEZoCNpHq
         16dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794482795; x=1795087595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X7gmftng8XyC6y3KS/A/XtQM72Yig5hdROs/Yc4m/MI=;
        b=OwCXO4XrZ9WOFV3Q6wKrWXbzKlkUS/D52XMHkz3Wz2p+JYkZ5cIg7QLRegi1iBZSoD
         19UjB6jCNyT+x/kMYpqomXZHLHc6DJHSUqZjyFWZHkta1N1fLg93BNXtyMokZFbaoXBh
         VAu6Vad/UDop5rutnb9pfrru81+ZytIi4tACDBV3hr4Q9BSX46efBzs6g1f2b18X4gSC
         KcEMVhe3uhY3MoI1hKIcOluioiKsnnNEcl6heysUfBPG5ioDIOWDVaSTWfidBXnlyuFx
         ANqp3KrQcuSGJeWCQKHhoDWg0BXTCPRgd7wIBpiQPxhPUmiC7VUG361ZTxUw0keD/eN2
         VgvQ==
X-Forwarded-Encrypted: i=1; AL+hErEZvb0iRfpsek9QhxTvIbxeLOgqrZzNZy2/TJtujEfakTLDZ+cFdDwJLHEKFGIScwaBTDESH65zlmV4yWY=@vger.kernel.org
X-Gm-Message-State: APuU4Z87bH06D3t7NHUPoG5QRSKXtGwGPjORMsU+m0eY72b3tzQtgBl5
	QaaltFgleO7A/1l/i4vZC12XMG+YYF3yjgwXh+baQ7JUAeeeIXlORcrqfrMfDheIKbsb+h+FzO1
	d+M0LeEYiqVQ8pXNEGOGmPsBSBrBD6V1SYHfoKUsfRBrY38+lq2tQ4V+qoaSooKDzpr55etDPFu
	JdXg0z
X-Gm-Gg: AYBFou042tHl4d3a6pICpaAAoGEYY89DFbrnrxoyPJPEJ9k+G77XweXlcps7784PXy5
	8EvnE7f6R0Ag+IuEOzdga/c2hV59/KEpl3h8Ab+MgjP5epE69aHjo8aOvzEs+iCwSdr6lZxu0lG
	/bFy9UH58c84pKNGORORZa9GzsqHfz+UrzQ9QYJMYPkjCq0VFb2e6To7Zmx64wWZrbaQvbwPCTl
	HDXs9TXSpzb+EUCo1zRXiIMPJF8M8wge4hDp1NXNZgacUqZjP7nKL+4PvMPU+VgSUmSPZMLgWfA
	FS/mhw22rl5RgkKuZeekc7b5uK7sPDh6TlkK+/Bwo36KLAqVFSm9Vh5sbbzNk6smxxyVtWbG2PU
	ZDZCGH12tjiOOhhDOugkiOs0DEJAITu4wS/rnEmPXCOOulMvVtzaZ2rNT/1hbHrCeCWjMaLkECT
	w44hL9GB0F2jUjYXJSWO5RF6th
X-Received: by 2002:a05:7301:46a8:b0:370:121a:b2f with SMTP id 5a478bee46e88-376854b990emr5265322eec.11.1794482795247;
        Thu, 12 Nov 2026 03:26:35 -0800 (PST)
X-Received: by 2002:a05:7301:46a8:b0:370:121a:b2f with SMTP id 5a478bee46e88-376854b990emr5265302eec.11.1794482794723;
        Thu, 12 Nov 2026 03:26:34 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm30402359eec.19.2026.11.12.03.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:26:34 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 03:26:05 -0800
Subject: [PATCH ath-next v3 06/10] wifi: ath10k: remove now-unused
 driver_recovery completion
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-10k-sdio-crash-v3-6-24f03f300bb2@oss.qualcomm.com>
References: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
In-Reply-To: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794482788; l=3564;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=ILgt+FP56A73W3Zz3d3BGWuyYpSBYBnlRPrxfH+vH2U=;
 b=9NoNh2LHNQ5MSBo9KKKhlhG0+SPDNr5mQC7LhsAPd8fReXvDDGYhFLqeJXT/RozrplA0ICbmN
 ENdnFjZkFkuC/o2WQfX9eXjNx53k2BxAqFihVLxF+hK0ra8pxZosqY+
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-GUID: ro0bID6rZxbhhtwagugFkRR591MoUk8j
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfX6tWJnNxB8rAQ
 ZGb/wd0jQ0h2dZwjd82zYk5u1VAeHardU9CF4BlAeh0dJWNGh5/YeTeCuc6EhV0/UEc6txiPSqZ
 0uRg9PuYote28Xbx03V9/lh+lwVWey8=
X-Proofpoint-ORIG-GUID: ro0bID6rZxbhhtwagugFkRR591MoUk8j
X-Authority-Analysis: v=2.4 cv=d49gWhjE c=1 sm=1 tr=0 ts=6af5a26c cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=M1ZKI_MSFVluud-aX2IA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfX/j4kVk9n/xwT
 LLHL3asttoBIzwbSZTmgDdOxnqjOprSTmhoTShHR9/aUhxK5VjZCC6xr17GgxLDzfLXJNxc9+iq
 oMpFHkDYsZBU1lteizrt36S8yZXS48AYMdMeG1VjFjxYfOXJfDICP16OtvRCDcJPnOuihXRSKfg
 gP/hNH+DzuUSbIxxUIgXv+Q97gvLHIbEHtK/VuaEC2fvfnkh5zGLPB9M0bt4Udi+8skDyylYkNh
 ZeqY23XVARqE9IwdonAyH1sQu0M7hFmPTpDUs8weqcp2+1DtN3kkWsAc0hmL1Qc4cp3m60rhUpZ
 NxTJ7cQF+nHj4QzfAyPtWAkyuiIfvlR5DbQTJJXfDEYNPkSg5pthysrgYzhoAHBpWyh+jSt2OnY
 PQ5tFkNiyzWMiZZKrB26tPraybHDln40m2dH+m8Jw6jbySSQkoi/uGLdr6yl6DJruKPN075U9Sv
 mpKsL/0SE/omrEDYE6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120045

The recovery monitor no longer waits on driver_recovery, leaving the
SNOC remove path as its only remaining user.

SNOC removal only needs to ensure that restart_work and
recovery_check_work have stopped before their resources are freed.
cancel_work_sync() and cancel_delayed_work_sync() already provide
that synchronization.

Use the work cancellation helpers in the SNOC remove path, then
remove the unused driver_recovery completion and its initialization
and completion calls.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 3 ---
 drivers/net/wireless/ath/ath10k/core.h | 1 -
 drivers/net/wireless/ath/ath10k/mac.c  | 1 -
 drivers/net/wireless/ath/ath10k/snoc.c | 8 ++++----
 4 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 4eb91efdba41..3be069724ddd 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2617,8 +2617,6 @@ static void ath10k_core_restart(struct work_struct *work)
 	struct ath10k *ar = container_of(work, struct ath10k, restart_work);
 	int ret;
 
-	reinit_completion(&ar->driver_recovery);
-
 	set_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags);
 
 	/* Place a barrier to make sure the compiler doesn't reorder
@@ -3716,7 +3714,6 @@ struct ath10k *ath10k_core_create(size_t priv_size, struct device *dev,
 	init_completion(&ar->scan.completed);
 	init_completion(&ar->scan.on_channel);
 	init_completion(&ar->target_suspend);
-	init_completion(&ar->driver_recovery);
 	init_completion(&ar->wow.wakeup_completed);
 
 	init_completion(&ar->install_key_done);
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index a1ded2cba103..7c961308d7b9 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -1067,7 +1067,6 @@ struct ath10k {
 	} hif;
 
 	struct completion target_suspend;
-	struct completion driver_recovery;
 
 	const struct ath10k_hw_regs *regs;
 	const struct ath10k_hw_ce_regs *hw_ce_regs;
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 6179a029914d..50eedc078c12 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -8185,7 +8185,6 @@ static void ath10k_reconfig_complete(struct ieee80211_hw *hw,
 		cancel_delayed_work_sync(&ar->recovery_check_work);
 
 		/* Clear recovery state. */
-		complete(&ar->driver_recovery);
 		atomic_set(&ar->fail_cont_count, 0);
 		atomic_set(&ar->pending_recovery, 0);
 
diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index 8f171ab6f4de..1ec58ec1029b 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -1916,10 +1916,10 @@ static void ath10k_snoc_remove(struct platform_device *pdev)
 
 	ath10k_dbg(ar, ATH10K_DBG_SNOC, "snoc remove\n");
 
-	reinit_completion(&ar->driver_recovery);
-
-	if (test_bit(ATH10K_SNOC_FLAG_RECOVERY, &ar_snoc->flags))
-		wait_for_completion_timeout(&ar->driver_recovery, 3 * HZ);
+	if (test_bit(ATH10K_SNOC_FLAG_RECOVERY, &ar_snoc->flags)) {
+		cancel_work_sync(&ar->restart_work);
+		cancel_delayed_work_sync(&ar->recovery_check_work);
+	}
 
 	ath10k_snoc_free_resources(ar);
 }

-- 
2.34.1

