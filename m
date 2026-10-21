Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792573808;
	b=IcWTJzcxsLI2A5JpDzXFW5COgHAnfBFbyGUPnmbGoJFqgWKjrFYYrvANLVdMlUbZvxp5
	 /QC2pbitdSjvJj1QrKPJtRt9/p9VCHxS0KLyU8VO72/cirlODiR0ydVwn17GDMH8MvjzI
	 6ijY5ZSg/ZbwsS9kCSPLhSc0myOKKxiuXT9x3UFTRgFaMLrFqapLckwVO3KJWQDO+lLvJ
	 npqg8vf2acx6uQYj62tHRAUNeAUhbENOaHof+W4Q8AO2PYk2PpvaYcY544ad/RCW3Cbie
	 Qf2JjeWQW3aV821eOxhteIUI1UGuhEkE/F8w+8HMfL2HRVntUyVDFyXHl35Jbh1YIng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573808;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Du3tEgvL55yjePVWq7XInLS86N3i/yJW/fLUSRhGwFc=;
	b=oxLAmvw1BedHgGDU376lvKBxPLcGcgDJP4pjvoF1hwNQgH+gfcPB+414XblCDjbfBLGc
	 ZkJckyB1rRJl9ZK8WiKtThMzfCKQ0p9vatEBdApeClyHYgfCLR0eNp0b8CnKnRLVVXJoY
	 ENMPXzqPiLEnO7rWB3updtot5ZRSuYqby0PVYYCIi4PiXNDIH+o0sAyUuNzg/ywsFvZOD
	 f5b0MIBo3YjdhI0kVtRfEg1W/DzKnUphSwLJJfr0IEN7kBNTl9eWdWFT8ER9Di3DEDTTw
	 OFYt7nnsCXzqElQF6SGejl7sKLXBhRdmx8vrDkyxLGQU8uo7J5NplONssCGp+qowrRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e6WmxSca;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N0i9iWns;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BDA606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:10:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2BDA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e6WmxSca;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N0i9iWns
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L8VRxS2795036
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:10:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Du3tEgvL55yjePVWq7XInLS86N3i/yJW/fLUSRhGwFc=; b=e6WmxScaXt/H1L0T
	oIOT4jdLmg5Xx5oHu3TlicZMCE0IyQyLKvadZrb3bkvH4h9Gs7f7z+t9gPbU/C5d
	xLDMsOvpHiR8WCezSzkErNp8UpOVjvoJeMVfPfzn59fIq3u9U2vu9VT7MAs5GRqq
	ouumRq3wRVBjzQxwkPnIMbDMu2RyZjsGa2HetyhXNVD3nR4nmT2yOy+Ij0hvG/rm
	0NHu71HFDI4Z7D7zSsBa1tadOI/V/bINxsg1clnk0oSZcXPrIy0suHrvpvEn/Jhm
	YabiEVT571AJnzQq8Am3NVf04tf1dW+pORxmR+BGy5E+FTbdSYL/RpLqc+9rhdom
	bLVFcg==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hesy78a2h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:10:06 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b28d7ffab1so705600b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792573806; x=1793178606; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Du3tEgvL55yjePVWq7XInLS86N3i/yJW/fLUSRhGwFc=;
        b=N0i9iWnsFwgOlPxcBzPSxrSnh6EkXSFIAHMAVbGi80oUfsZ0cfsgwVUwmlhKEjQ1Tj
         rrtNeIVpOoqnaBIrt22OEaWmwabBovCH1yv49w6UO7d39mU1EUvE3uK4H4BAFM5CbNXb
         rX25y7+MVnQgdmXRqDRfpdE/G8tKHzqeTjLfQbewL7yVJemO0GVpj7Y8sqJoeBaZfeTj
         HWpXHaWFkr+0HqN+Nmt3jXRmj8kdkv3zGSD93dm+jSCRW2XAjgBPMQNkHEuqRnylCJb1
         gHqxE5ErDlWXW2+WQMJYElAKBc1gZn16k/37wB4lHTlUBkUf8xVLPmFcvnXxlK1Od7tJ
         g1Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792573806; x=1793178606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Du3tEgvL55yjePVWq7XInLS86N3i/yJW/fLUSRhGwFc=;
        b=xhrkP9Xj1Yq2VBTvrsoVF8wEfi/FOF43krYRnReh+INATFxcxDNxVeZLDxrQNORY3I
         FYe0MesBosbvocI4ytGrdWg9MDWVkNrcStgPylvg4u2LrP4vA21hnNjSO/BTL8xVNMXr
         oLXUpSEnlTWqcsl/9h32IqLUKci5rbRn+Xj94oybW12VUnoU8PhLPulJ5UMFbXqVu9sN
         YS+C78oAY+txyMjH1s16ZKbHB5lhb5jwFQUhEMg7/tzbtfykPzxmunLNGtyobv/aPkpr
         WAKD7yovuDvkJ1EdzaZor9VBVAzbIRbqb+f83omEw2uw+ROT0z/2tYYc6gYybck/oSWw
         /v1A==
X-Forwarded-Encrypted: i=1; AKwUvBy53p6F7BCESGLlpJDTRqrcdN0pAJLkMrXzR2eRi/vbUNdkiMZMtndx+C8R21fIypLfNADDt5B4lgOZsT4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWVrKkmqTGe1H94jdi53reJGZw8PuOlrEG9WBV9Upg7n+CvwHl
	BTAoNMr4dQPNjfSJNajmFVeAUYQMLR89lCDxyYBcgVxg8v67I8EhDBY21A8u3fZL5K+KRzk04mr
	WehmSNfAT+JydwtvIjf0inIVWT32IiKUDquoWbMEPVmz04XixA1OYJfySOkSO6ZC5r92O0Hqa2u
	M7oQ==
X-Gm-Gg: AYBFou3jiHO1dPX0EBX16dGyqmo1btgSO7noG7yvIBNOBMhmrpA3VSQM6xI/9/On/1l
	acOsIp88UzHfUAKP65oOA8OvIWOVQDl3ZBfpRj+3khqLE4z4XVc0WD4bP6/Vxm9pHnFkwmofrnI
	mvfjDqep3DXYT7ESoBnhRlAvrbaRHyYonKCciG/LLmsPBdysN5sQsxcI79MKm14x/OQs0CUg8oT
	Qp3b1mfBpUeZ2nZ0BHMy7nz9wxeSDUsIluaakl0wdLXjwTecox/wBBti5tfvgZ7fdt4akIATGj8
	RvQpCZLk+1TMoCIMUwOgpjdRTeLAQgCQbrZi9X29Kel+14FpfGM/0IPnAQ48/oqTPibkdj5s7yf
	fBF+Pp63tSEzd4f+qvQvpQMwGrD8OBe1Lhy8GjK+Hzr2kWIVFIg==
X-Received: by 2002:a05:6808:238a:b0:4c5:6a01:210a with SMTP id 5614622812f47-55354eead93mr595936b6e.17.1792573805816;
        Wed, 21 Oct 2026 02:10:05 -0700 (PDT)
X-Received: by 2002:a05:6808:238a:b0:4c5:6a01:210a with SMTP id 5614622812f47-55354eead93mr595928b6e.17.1792573805299;
        Wed, 21 Oct 2026 02:10:05 -0700 (PDT)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-552a182d59bsm1554595b6e.0.2026.10.21.02.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:10:04 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 02:09:35 -0700
Subject: [PATCH ath-next v2 7/8] wifi: ath10k: remove now-unused
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
Message-Id: <20261021-10k-sdio-crash-v2-7-5df80bf16e86@oss.qualcomm.com>
References: <20261021-10k-sdio-crash-v2-0-5df80bf16e86@oss.qualcomm.com>
In-Reply-To: <20261021-10k-sdio-crash-v2-0-5df80bf16e86@oss.qualcomm.com>
To: Kang Yang <kang.yang@oss.qualcomm.com>, Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792573790; l=3510;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=0MX56h+G5vwBMUj7+Wrtzk4LSA9Q2kd7+MXHjWNs0hE=;
 b=LGw/a4nmclHQqbw5nk6z8pHL0GkmeSMpeDV1FEEwwcgoI2ith6J/WXIEPvgej7S28mDffcwrM
 cP7O9Dpfi8hAkxg3A2kk37Fx3QlT+Udh4xnKevnIXhwFF0BhMLqR3o4
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-GUID: sDDHinTCY-AJpVXzBfZFdU5-jnEEm_MX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfX7d3zVx4SoMMs
 g+NBcW6vLCOS7iNScLkj+A06kizOJfuEl+WUvMOzM0bvIkCLgVhYM1MxinJs8nwhPAOhqIBJ4HZ
 qDqH3sn2FOUsngqXO1ifEgtPnXysfgDJ406WIVpY6VbbxE3mCPKkT7mqw1kY3qZG9QBuAphh9Cm
 vmDu3yde80AHTP+OE75upJ8z7rsMAbJXlwhTKunjFHtelNPqRNHGoinxwpQcTdww3dnHEfW3yic
 zaDTumbIggI5MZcb2S/NOtJepbv3lNH6Jm2B3VBoo65PIKc0PuPyDjimuz1ZAyrN0Tkxf+twNHq
 J27aM4FRyrsYNJeXzQcm87B3WRWrOVa/dC0M5Jn4lQf2r+xQoZ6qWOCLZMMiE4vJSxrkLtCrVI1
 ghsAE6BSXEYfb/sPixRxqqcHxZ8Yo28AP8TkhoR6gq3bICbwXwYc27c+BuTVmsCVvo67MLq4De1
 kAmq0THMWCjLSpL3cvw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfX6ZwQSmJRdt+n
 jfKB5z4qLby5BDbeXZ6rUn64CINbm5lfRyXweHuNR9GotEQUhgMIcOfQuSyC4ddJub6ZVE9oZoT
 g63GcEmw61SdYlBh4XyXUmGc+G/YPpY=
X-Proofpoint-ORIG-GUID: sDDHinTCY-AJpVXzBfZFdU5-jnEEm_MX
X-Authority-Analysis: v=2.4 cv=IPaXmQvG c=1 sm=1 tr=0 ts=6ad8816e cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=THAtv8xtLSZw0h4mMwsA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210036

Previous patch removes the recovery monitor's dependency on
driver_recovery, leaving SNOC removal as the only
remaining user.

Replace the SNOC teardown synchronization with
cancel_work_sync() and cancel_delayed_work_sync(),
which already provide the required guarantee that
recovery work has stopped before resources are freed.

Remove the now-unused driver_recovery completion and
associated initialization and cleanup code.

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
index 66585cfa6d96..7692e1a8b2e6 100644
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
index 693b935536c2..5f828704f8ef 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -8177,7 +8177,6 @@ static void ath10k_reconfig_complete(struct ieee80211_hw *hw,
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

