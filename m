Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0871475348
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365161; cv=none; b=SFBKLjiUB37OwcRGHMFLRyKCTz3U/8sZSz8jeKtBnP8iVyHjQCj1RI6tJcNT+G050voZfa6rOaRKLdDJA9/KNF9LEPVl7GiZ/pAdTyKsd14hEqHzAYq10NYYeadqI1fj5wQ9a/v3YHwz25LxMVYZ58vpEkHjECq/Js1wwN46U1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365161; c=relaxed/simple;
	bh=o7DsTDE3bTvEKve7noO0BHvqsH21eTnNSgVIMwnL7zE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q8a99Gez0CmrDBnJGAVLrpJiKZ7w9+hrJidpCXRu7Ko5E00/shQQDghiYk8mVcx/4keHF34/r7MyAgUWV3vaCNbbcHH9Ga705pmd/2yklFzVDGsWNhdXQYp7sxFbCkO2FGDVAYMVXWEjkfDWRWNFJCU0rNmEfRl9/WBRFmFXD9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O5UkXP2B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YkzNDdgH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O5UkXP2B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YkzNDdgH"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jsKH2312960
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 09:23:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UJgJ/jnse5alnP+vj4hLzcWYhPhvr+j+Eu4oWyU7/RA=; b=O5UkXP2Bh9fi4LHB
	pFzTd1hhEsCs0exA23gxG/t4AT9D27mcohtSKCvL1ZV1kOJq2uuBPHTIua0spwW0
	olHI84MWY3vikd36OBisaLeN3FMop0Kxfv3rDJDz2WrtSYWDSYDZmOtzLbtkkMOJ
	24PA2bMbKLV0l0JCYXi77NmCwae7YENCM6cyStej4Rs8yyeMT3qUl4pZCr7hpIbj
	ZlPfGvHDX4VGX5zfeKM+DqUk8dJpgEPXlMBpTiU6bKkAFUAMBoYzPaSaPPOkExF+
	PYPppktYo9otTpvLUFWVkn+mMUTc76Si9WpHtOtUf8TDuCxNG+HT5TG+VHxCjLOW
	LRhWbw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h53askr58-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 09:23:59 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1eb205d31so4348812a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791365038; x=1791969838; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UJgJ/jnse5alnP+vj4hLzcWYhPhvr+j+Eu4oWyU7/RA=;
        b=YkzNDdgHkktLKjQOup+xTZfwKHd9kBmgv/TxIrMLh2LXR0za50IhLrK5GEyzif7NgB
         1qat53gvkv87QQk3ZOQr6bRhYw0/CXYVFlBb9kcptOTDy/9ZHYLCsPAy31nApbvGh2Oj
         i8wIt5bvPIh+gn/ZWjno42P6AGeJ18DPH/xGhPmH4/6QHJTjyXUBL6Kqfd5EfiT3m802
         ZbpPy/A3ID8ISroRBcgihKSXC6PWZVvKIOlU4PJqpj7OsB3VluiRXEOt86WVUSnDZxCz
         +xlcNbmRdJA+Bm4DPal7N4dZ0YcrKJuJOH6FSyI5KSEp21PL1Ylf+3l9IPGWTAXUjlHs
         cduw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791365038; x=1791969838;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UJgJ/jnse5alnP+vj4hLzcWYhPhvr+j+Eu4oWyU7/RA=;
        b=X3z3wotRr7EmesPyCuZ68w4xxHfLhE8rqCg+lWkSG8nfs+w5lOf9nRGurbzq7rjBT+
         q74q/1GeSZWV4A0R/8baAi9wn9fIbWYfJ29b8TFCDn1k8T90ExHscbXvLKJpSQIk3nIs
         b3qqyL94R7yku+LWkxcHQoHpFOSEEPVsnZRZQWEcKU6LRDOwoz1GfJ0YvVOYGfH1UsdC
         8vPN3mofZxXQSLxARQCCmlGN7zVhIYRmHW6hyHHIIfLeo5fYXEV/urUmP0F2s3v2AOh2
         h7e/ScKCxCpPR5RQ0ib2kYmmOXng3cGdSSu142cPH+WcDTtGjgNcYh50/Hxx0P9Ix81L
         5hCw==
X-Forwarded-Encrypted: i=1; AKwUvBwkNywdeq63nzLioFyvZnlxBpJ25P5gF2zNaRq4iHnU2z69XdorIedWP7GYBZfwV0ti3LqNz4+GITaSUF0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJoBjYVcFUDAbwxU3QJLWk4PgsxAqcK5LmVWED3wdnR76BZ8qM2
	VNnr8zllpe8LjCbNpsnzVKVueidflPOrJ265o3RSc+tx5fFKA2UQo42EfnKufNzBbe/btU3o9Po
	jh0EIWAkjqZJnKmM3w+05safRMBPAlpR3HRrHSw2BsaF3bPTieGCf3UCsIuuLb7AcGV48ZpAKiG
	U=
X-Gm-Gg: AYBFou03n6TCVMLGi1XaGG+Oy1ilIlDMKf7TK4YdiXnDOL05pCfzFKXCqvhHfcmJf6S
	p8eCm0Ai5TKJ4Xj03G0Q5GEBWnqBAhhhkz8XkfyEvcoYX7iGWZ4LJ93F05mVw0/40blWj6KW9lJ
	apdXO3jepNy/NdyardOV2KmgiBuCSkSRBeOJ7MUtKy9T4xEsySO8uXbbVNFZ0p5Ejzuv5t8tQEP
	avdd7RKi242Ua20NO3ozHBoMBIuFxLfo0e5wNZ1kc0+wt/aVkhAlYAn2m7TAAvgF0Ra+RBe0OSg
	TjvI9AY9lx0cxeujBVWmGcPP2a8hAqrgPgKMwfeuylJCHyfsfxBTnhe3t3nEviY6MdiObIJUPSZ
	vDu60sRsx2ZKFXlVXZeV6hBKMTl52SGvXzJmLOLrNdiiAWnlsvyrBR5cI7yaW3/Gg+4WzfzAAwM
	vOquBxrlOhTmT8b7H8+Wck37w=
X-Received: by 2002:a05:6a00:3317:b0:874:708d:b627 with SMTP id d2e1a72fcca58-891b1290986mr1402178b3a.28.1791365038368;
        Wed, 07 Oct 2026 02:23:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:3317:b0:874:708d:b627 with SMTP id d2e1a72fcca58-891b1290986mr1402172b3a.28.1791365037974;
        Wed, 07 Oct 2026 02:23:57 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89271257af8sm119128b3a.41.2026.10.07.02.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:23:57 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 14:53:33 +0530
Subject: [PATCH ath-next 2/2] wifi: ath12k: Increase RXDMA buffer ring size
 for default memory profile
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-mpp_ws-v1-2-739b1fb87d24@oss.qualcomm.com>
References: <20261007-mpp_ws-v1-0-739b1fb87d24@oss.qualcomm.com>
In-Reply-To: <20261007-mpp_ws-v1-0-739b1fb87d24@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        Pavankumar Nandeshwar <pavankumar.nandeshwar@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: PlSdH3bH8m0pe4puM89aZrQ9N1wOiSuu
X-Proofpoint-GUID: PlSdH3bH8m0pe4puM89aZrQ9N1wOiSuu
X-Authority-Analysis: v=2.4 cv=Xt5vqlF9 c=1 sm=1 tr=0 ts=6ac60faf cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=b5TSSxGLzCK9vQyPxlUA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNyBTYWx0ZWRfX3h/XSITaWb94
 ZpwfmXk6fEmlft9VydtGeSQSgkXCpJkd+oriLJOqKnSgWV8gxRrDrJb7VW1R5pT8B+vuidwfaF2
 3hkxC+72PU5H0WKGl23zQED8nDtaeOMXc/UdhN9m4yv+tqyMjoZHk40VcEHMS0zR/OxhYxlyrf7
 JLmUjPvgvXYnLrpYZOvB079ZbCzLQ/lStMdvrjj2XRs3nx5hokgNRpego7bJ8S9xgkmRW+ehDVl
 j+/T1KM3QDMJKczV3j4jyTWXceUumac5dcOtwXEYX/mDtbGK4Ot1cFOtd4SFwOVFNSc4wtG+h5S
 JqoN6no0wYshEKKrfB3mE5MhK9umO1dk1mMtuuONnCUjd3GNSJxUeDvhudEKfNCsH/5UfrIKDZd
 o9MrvNz95+R0zup020q726HQFL693kwcPLX6TNvwXoC/BrVTtm8kbDDL1kVC+VRMpeZll10oQCQ
 nkTOlKva0zfdPJ+xQDg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNyBTYWx0ZWRfX1PNxJKLEY5Q7
 F9l+g58bpen9h9k0PiApmCDsWhfhG3srHfylQhMbTleoWbV/5KeynTDBaDQAS+XColpuNveA88w
 gOyWDoCN27dI7scTv3FP1szR6VRXzqE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 impostorscore=0 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070037

From: Pavankumar Nandeshwar <pavankumar.nandeshwar@oss.qualcomm.com>

The default RXDMA buffer ring size of 4096 entries can become a
bottleneck under high RX traffic load, resulting in reduced receive
throughput due to limited buffer availability.

Increase the RXDMA buffer ring size to 8192 entries for the default
memory profile to provide additional RX buffering and improve RX packet
processing efficiency.

This increases memory consumption by approximately 9-10 MiB and improves
RX throughput by ~20% with the default memory profile
(ATH12K_QMI_MEMORY_MODE_DEFAULT).

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00074-QCACOLSWPL_V1_TO_SILICONZ-1

Signed-off-by: Pavankumar Nandeshwar <pavankumar.nandeshwar@oss.qualcomm.com>
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 764e646d0090..a70590e1d821 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -54,7 +54,7 @@ ath12k_mem_profile_based_param ath12k_mem_profile_based_param[] = {
 			.num_pool_tx_desc = 32768,
 			.rx_desc_count = 12288,
 			.rx_release_ring_size = 16384,
-			.rxdma_buf_ring_size = 4096,
+			.rxdma_buf_ring_size = 8192,
 		},
 	},
 [ATH12K_QMI_MEMORY_MODE_LOW_512_M] = {

-- 
2.34.1

