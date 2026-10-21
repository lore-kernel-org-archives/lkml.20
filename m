Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792573799;
	b=vo3+7ftHzyOzkznmeyziZpzjeCHf6yWnxaVbqBQQyinmk/47eOYM3FiE8fyccqsdZOE+
	 U3rBkzqGRVAGD0kvvFWGJaK/WVNB1dH8xWBDJ3Uj/Yd6HDGgi5VVzVt/NdzYGiFQrpVtI
	 DKi+AJst29Q1ulBmz/tBUZmUAyLfA6N0BuKHk1hIP6pW+NaOxIXutdGi2nYCFLF3sxFnM
	 +cfvzI4q9CJdp2eo1DPLgaicf953oPx2iVtw4AgdCmSFzfbpkls7cJmBK4Muc9XbWKedi
	 okxLbSrADpYZGzpMAmwoM0b8oFch+REWNz3H1RZ72h5K+o3vMFRv+9g1hV5k8PTzIYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573799;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iaaDbUrXL1MbstCqkNh2A8z9QVuh0TfWXGm+u2WT+ns=;
	b=Rwd/WdjUmNRvMBa3M5392vQMHmGXnHogjbuSf/I2t9LuPnpkSuSQuPw5aOAZ6NXTyOzk
	 1Ik/9kcOyAnsAJU4gXAvy5+9Z2Zfxmn3gYBVHxqWAbvk/a4jU/jZbCtvyzWVxWB60Gnxx
	 iikoZrDBGEH+ILawNbPn8ptraJoamszHMgnKq8dmvitfyIy/jTXHEYtJiKIIWpYJBKpZq
	 RHzYy3YR1fK9TGcwQnmeCResEDM4cD8sQz9MpuIAQYIC2zr27ROwxiY3QG6c1eKweeiYS
	 oW2c/li5tCWnntUNeaK1wangS7xvTbsKyd92gu97D4YDUq15judF5loWEblnvchZHJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SkKWLX19;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fLlaIr3p;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD97606A329
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:09:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFD97606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SkKWLX19;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fLlaIr3p
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jCfq3711978
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:09:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iaaDbUrXL1MbstCqkNh2A8z9QVuh0TfWXGm+u2WT+ns=; b=SkKWLX19cIhddEgn
	fLAsVbbwY9QW2dhcb1n1Is8orvDRl0Lo75zPH1FtnuKojKUWpYwtdC2Rb5GjInmp
	6wKnQLezsgsGa7uFK/6tNnOFVXq187qb6uU8V7IYrotA844EM1eMqfuxgxj7XH7/
	S1SygAJYGIYeuS+mFhxO47LHhNKNGedoZa1okJk6ANoHPddGCUqlotPpryK5FerN
	kStB2jYgUlQo3jFE+6Z+zOSBvhR7UC3ZFJBULlWUiatGVNAyXhmgQ4sKEqn3ap+l
	eCwmlfzgqxWKZ31arVGl0ztIx8Ohm56ws/Y5+UgrxCiEV4UMLB9BEvTlCJZI7VDG
	tMgN/w==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9v37r8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:09:57 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-54dbbf252cdso708070b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792573797; x=1793178597; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iaaDbUrXL1MbstCqkNh2A8z9QVuh0TfWXGm+u2WT+ns=;
        b=fLlaIr3pmWKQBVua6BxPnL1OTfeg7MX94tcsvSMbqLC/YZpKBItlOS0eyuhjUCsr7N
         Um0krb7BEeRLIUUMabT8RTnKid/1n8aVJkGfD4LU/MFaIt9HYoIEYnO2P6ihG2sfnni3
         jKgxlfE84g+8gRSBHVYCTvRWbRKXRvYos3Un9xhu3M+YgD7bI1mAQ11jFd44afXsPltx
         AhnpNEeA5jxXYHbIUlaLOfTCtIZhLL9e2eU8Ak6lHPIN983aTMCTO5AroYRFQlb1onJt
         s0wzEFe+Z0uMss10wtgd+JGOySphVH8PDUv62lnEBtJJD3QvbaYgq6EyotfY0tL/pSoN
         MyKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792573797; x=1793178597;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iaaDbUrXL1MbstCqkNh2A8z9QVuh0TfWXGm+u2WT+ns=;
        b=beMEAnkM+s/BUuVphfoAEmdoJv9uVwaKdGoB89kcYvsyT4zncrUM4BjCswgtktVdiL
         T53gZVIhJZ7GYS4iBdIQSJpNtDiQCLRNUfhL1aAaSDWoPZIR7J6RQpoOaUR9VNb0FSE2
         DlpltMBj0Og32W59+jZiXgDn3K3BW9bt3i6+a6IPOzKN/d1Fce3FLJct1ChVHF5FryPP
         dTE0aVUSfm7braiK7u12nRCRvUfn7IaKfL2uce2eseyVdkTYF35Epwa/1vWREyZMhjOa
         Mc8TfZUzfA8a49GpbNpRhoZrdMOPMDg0I/7HLc6K1J+vTv2UrrwBCEa+LkbgosZ+xD92
         9kGg==
X-Forwarded-Encrypted: i=1; AKwUvBxOVsmJJksHb7JMPFlDueRW2tYKOXSXD2olirKCg2qXsxxTNs4/98nBj5VnaEzu8VF2mZDKJ7pnp2j/mCI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLxFWp7TeiD7pVHtIhcdkD3UYf+wxqn8PZBkNdjdDm4dI0ERgt
	JSwsNi7IH7YYOxEpF1NsmM6OrSKbClyGa2JF7hLlJzQ9faLzIXGCbQhYNl+8aD10DNu/vXMMSik
	EPJI8gzZrHBHNWL5xqrKGYHk2m37uN2o088ezwpeooNrU8NNG5x8Rn7bUVi9cHN9+3bU=
X-Gm-Gg: AYBFou1fCoMyt3jjMvdkOTBz6RXljDozIllkAYMdSYeS7Z0E1aGQ5S9qfAxWlmyBYxI
	CtqS8QMmurX+9Osm2kS6tSTUN8rcRxrGlGC6U63O1zN/EGuyCRD4ls5Prbge359fuI2u+6qzwsm
	Ggzt/nheGs2Ndd35PJ6E3lgPZat6hnCOeVaUD9q0mV+7MATLEglxHTqZ0u8cZkzLnao56GsHxnE
	XX3rjDX6gPxpu3kyrK3jnnyBeflMZcsr6xceMPJSz87DglnMExX4EbEP/HmvlQWPLZAw+Xt5+Os
	qdMUn9+yi4RydntZo8LupVsGefWyM7pLQO7yw7ax0XxgAOVrHF4lDS9SU4SOJB0fi3DTJjDeZvz
	zj/hQUeH9EFztdSM+P5ndBKM++kqiRRYd9l12vNcbT+n3ud028w==
X-Received: by 2002:a05:6808:4fd4:b0:4d6:90f4:48b7 with SMTP id 5614622812f47-5535bea1b87mr999434b6e.57.1792573797035;
        Wed, 21 Oct 2026 02:09:57 -0700 (PDT)
X-Received: by 2002:a05:6808:4fd4:b0:4d6:90f4:48b7 with SMTP id 5614622812f47-5535bea1b87mr999408b6e.57.1792573796225;
        Wed, 21 Oct 2026 02:09:56 -0700 (PDT)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-552a182d59bsm1554595b6e.0.2026.10.21.02.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:09:55 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 02:09:30 -0700
Subject: [PATCH ath-next v2 2/8] wifi: ath10k: wake blocked waiters when
 entering WEDGED state
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
Message-Id: <20261021-10k-sdio-crash-v2-2-5df80bf16e86@oss.qualcomm.com>
References: <20261021-10k-sdio-crash-v2-0-5df80bf16e86@oss.qualcomm.com>
In-Reply-To: <20261021-10k-sdio-crash-v2-0-5df80bf16e86@oss.qualcomm.com>
To: Kang Yang <kang.yang@oss.qualcomm.com>, Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792573790; l=4080;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=Rw4qE318zOpF8ysP1n4lo9aO3ThjAOMDbjwAMreJziE=;
 b=lFCaFDrXUXmpdeYacf2XKBTxSI51kI9OE8NosZ+FSVG//kfLs+xiNKWsYo7oYcVcergv/Reeo
 PkGPDDQU62aDax3cTLgX8OOS8RdLVG8Jff1NirnueNx8U2qUNVEdtat
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfX1HuEePlesxwK
 IQCC7+HkQVszVI4+LY8z3HLVHqQ43RmD9ccZeEkOH1TRri61FVFXzvob3lZRVPI2gch9pMIaL38
 pLSSQud3bQTulTJcs+QdI9YoMJkcIe4=
X-Proofpoint-ORIG-GUID: 15vgdskPWQnRFw7YilYAvpKr8fCCNKjs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfX9LxmDZ+QO6PB
 AZtlNmYg2Rlw1QoOF2wX9zQhVwEEqIylY5ObatPm7rdIEHbBiBg081i8XCSU+LIXSQVdqg5Fm+p
 Mqwh76H0SsB1qW6PAFCpAvX6q0cBeKst8d5N8F8ElNIg6w6A3squKDUrbTbebqJUbs5o3fRj6vi
 6wKuX6bqq8Siyguw14i8B2u/TUXCgfcpWX4cHpBfUVTKNwE939XSI2XG0fff0kiKY02AubWc60D
 O9OZmwExOCXE3fA6v01OWCIg8f5Fv8/z74jfi2iHQ6zxY4Z+KS2CymlKXoneqiVPx1nbVnsbzze
 jhuJNkvhoiuMiYTLFqbHvpEO5oP6zLLBKfh45lo65cj3VWeqZBhSi6UzyChjWjKl+RX5YpmRx7z
 ubGIQi5amfa6pjN3IVtGt8ETNdDEMlczXDdKx65D85stAFneXd9aHz0sXWamXcEOrMzB7t5TTbG
 Z53jPiGoGtHHSVzOTog==
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6ad88165 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=6QK6Bl5UZFK8huMW9Y4A:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-GUID: 15vgdskPWQnRFw7YilYAvpKr8fCCNKjs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210036

Commit c256a94d1b1b ("wifi: ath10k: shutdown driver when
hardware is unreliable") added a fail-count based transition
to ATH10K_STATE_WEDGED after repeated recovery failures.

When recovery starts, ath10k_core_restart() sets
ATH10K_FLAG_CRASH_FLUSH and wakes waiters already blocked at
the time the failure is detected. However, additional waits
may be created later while the recovery attempt is still in
progress.

If recovery ultimately fails and the device transitions to
ATH10K_STATE_WEDGED, those later waiters continue sleeping
until their individual timeouts expire even though no further
progress is possible.

On suspend/resume, these extra wait timeouts consume watchdog
budget. Crash logs show cases where one or two such timeouts
are enough to cause the suspend watchdog to fire before the
driver finishes shutting down.

Apply the same CRASH_FLUSH, queue-stop and waiter wakeup
handling when entering ATH10K_STATE_WEDGED so blocked callers
fail immediately once the driver gives up.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Fixes: c256a94d1b1b ("wifi: ath10k: shutdown driver when hardware is unreliable")
Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 43 +++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 07beefa06c4c..93140f1ffb7b 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2491,6 +2491,32 @@ static int ath10k_init_hw_params(struct ath10k *ar)
 	return 0;
 }
 
+static void ath10k_core_wake_all_waiters(struct ath10k *ar)
+{
+	complete(&ar->scan.started);
+	complete(&ar->scan.completed);
+	complete(&ar->scan.on_channel);
+	complete(&ar->offchan_tx_completed);
+	complete(&ar->install_key_done);
+	complete(&ar->vdev_setup_done);
+	complete(&ar->vdev_delete_done);
+	complete(&ar->thermal.wmi_sync);
+	complete(&ar->bss_survey_done);
+	wake_up(&ar->htt.empty_tx_wq);
+	wake_up(&ar->wmi.tx_credits_wq);
+	wake_up(&ar->peer_mapping_wq);
+}
+
+static void ath10k_core_enter_wedged(struct ath10k *ar)
+{
+	ar->state = ATH10K_STATE_WEDGED;
+
+	set_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags);
+
+	ieee80211_stop_queues(ar->hw);
+	ath10k_core_wake_all_waiters(ar);
+}
+
 static void ath10k_core_recovery_check_work(struct work_struct *work)
 {
 	struct ath10k *ar = container_of(work, struct ath10k, recovery_check_work);
@@ -2516,7 +2542,7 @@ static void ath10k_core_recovery_check_work(struct work_struct *work)
 	if (fail_count >= ATH10K_RECOVERY_MAX_FAIL_COUNT) {
 		ath10k_err(ar, "consecutive fail %d times, will shutdown driver!",
 			   fail_count);
-		ar->state = ATH10K_STATE_WEDGED;
+		ath10k_core_enter_wedged(ar);
 	}
 }
 
@@ -2585,18 +2611,7 @@ static void ath10k_core_restart(struct work_struct *work)
 
 	ieee80211_stop_queues(ar->hw);
 	ath10k_drain_tx(ar);
-	complete(&ar->scan.started);
-	complete(&ar->scan.completed);
-	complete(&ar->scan.on_channel);
-	complete(&ar->offchan_tx_completed);
-	complete(&ar->install_key_done);
-	complete(&ar->vdev_setup_done);
-	complete(&ar->vdev_delete_done);
-	complete(&ar->thermal.wmi_sync);
-	complete(&ar->bss_survey_done);
-	wake_up(&ar->htt.empty_tx_wq);
-	wake_up(&ar->wmi.tx_credits_wq);
-	wake_up(&ar->peer_mapping_wq);
+	ath10k_core_wake_all_waiters(ar);
 
 	/* TODO: We can have one instance of cancelling coverage_class_work by
 	 * moving it to ath10k_halt(), so that both stop() and restart() would
@@ -2624,7 +2639,7 @@ static void ath10k_core_restart(struct work_struct *work)
 		/* hw restart might be requested from multiple places */
 		break;
 	case ATH10K_STATE_RESTARTED:
-		ar->state = ATH10K_STATE_WEDGED;
+		ath10k_core_enter_wedged(ar);
 		fallthrough;
 	case ATH10K_STATE_WEDGED:
 		ath10k_warn(ar, "device is wedged, will not restart\n");

-- 
2.34.1

