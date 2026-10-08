Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EA849A3B7
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 10:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791455134; cv=none; b=qp5b9yTIPiBjvcXoSWHZFg8u7V092m8ZAnooteYAqhzjA3pFqmJ1dIQPuY5LoxIYQzqSTYDkrGZpMvlOxpC8ki50WbN/l4vL3mqPnADaHlSe7cfiHXI+yRStUGQXygOE0TKkfwzTumGmCC4j/rlai7dHGMjzy2BEo5spk13guY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791455134; c=relaxed/simple;
	bh=K/tVYy+6qbueVtZCWtLkH9tCPTJuOOQjJyOkjda3fGo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hmenUUuAGsfDpOekwxO5lr8P3fE1b9tCsMg2HEdNqWl5DHN0FklFOdKvJzQ5TlrW7lgvX7KPuGOJTsMNqG+yffkEDSCcBEI1HHKu7Ri3A5KMsLKaqav0ZkEgUipIZqRcBiV1w7RC4MDgVTRgk7zV80Qow51lyZYkJLKHVkK0sEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WYh3HATT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hUVaMKQr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WYh3HATT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hUVaMKQr"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987L3q82067985
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 10:25:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zmsQbMNmP8i2tzXsasw6FBSJec6UK8O4ko7kuCL95o8=; b=WYh3HATTj8NQpdVL
	L8WrDjTB4ZCgvC/7USEJiUlpIxDYZ6O5opUIPus/1BpblGXK5l4NHAuMNaFiru2v
	wZXylQIDpUO6VseYuURW/9Uw5sm5YaCY9msqDpWy0MLoVQmPtlcW9EUhCVB5W0ZJ
	mLa+Q+DeuNDemPxy7mkvpYCYTIx/L6NekzopJijbFkXlOSIVUmh4exIlm9FEmDb9
	KAxE+E1KC5dFaipXHZhhPsbA/OHsk8K4sE2pWKN1KDBs7vb16Pu/VhMXRNsIUcWv
	a3E03xgrSHi3fn7oan3pwjpxk91VgLE/qnZmZPwVKfp5j/ab6FkrLVvivQQTzp+L
	yZO/sg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3jekh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 10:25:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e60770381cso19167465ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 03:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791455131; x=1792059931; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zmsQbMNmP8i2tzXsasw6FBSJec6UK8O4ko7kuCL95o8=;
        b=hUVaMKQrhBDQhgm1sxxVEqp4NeYy8KlMrRRL+ih43fprF1vAGanyZEvpCtN3xkG8HQ
         XmBJkO8N1wYBnH0w+BP0FqmMbWgxqrLrdB7JObb1BGX/5BMuD8Zl880gLy4cSpJoRUwR
         dqocCpCtgUBjiehlc0ADCt0QprP5bIwDRDa+UGsyDGkmNfXJY/jjghgjPLVKR8rYKKyU
         dkF0vu+BeayEKspPnyBfrCDPNx5eSh1Yc9/2rvyCHJVX7Y69kgp4soLo0LY2yriW+nrv
         b9NUvrq7f40fLHHeHSc8+3DznzozNpdF1OLilhRf2rS4bAGi2gBQJfH13eYHGTIyAIAi
         888w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791455131; x=1792059931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zmsQbMNmP8i2tzXsasw6FBSJec6UK8O4ko7kuCL95o8=;
        b=0YLN2YSuILbVbE3a9fPqW0/5zoZk8kt/9SCiFXUiajQXSoe8Eo3gbX2JTacxofZnBB
         mtxWXHIInkeN6WSW7trszgLZdWoFeh04esiUtZOLKZsiCusjHaTqcUtbO8zUxCChjH4Q
         zLxjF/OJorVtoX6Z0qBtoHMgnKv9foAmR+Srg04uH95ONBkjt27GRhL32f0WgXz0lEOV
         2D6L5qUJSGcJ5lEUOEFG5/UuhIFpwKbJIrXWiXMJFNzAsPles0WMlq97PRvB5sCYDAsO
         B3pxuIvokf6Xz7HhK7D+/jYAVz+d/6NHFqnEVoccWcLUEFaHcXOXIhdFmCSm7JUMYacL
         08xw==
X-Forwarded-Encrypted: i=1; AKwUvBymTMZLsY9C6naEaDnrGjUWE5hie/NKYfl5pMaoeCYu1F+8PawYcRtf2iHPlDEGakqCDa6o0gBZfMo+iaw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBxxvm+YE1YFJCtqNdeaZc+gYjQIq/0DTDew6I5iKeK+zUuCvm
	8Zdp7d79RxCHWzWFiyzs9SjeP1ZTXEiYAiXqppulBDhTBN1B/1uHrXoSMXjDxQj+xe8FMYXPpTN
	L/Wx6+dz5qez/U/pFD26VLruTX4PGP7JKmQUBi1NTK+i5UTtlbIhtuOvJt2mOuCcjRW0=
X-Gm-Gg: AYBFou1hRnBJHLlbDCpiTHOWCzylVNaNlFUxf5SXQKdMNwGAKA0Ne/FF32ae/sF7Qpb
	P//TB3ssDb37AdBXF+K+eBT00vqD3VE0M/52V9OQWcVNP4/1t85eXTUMf4u3r61yZ5dJ9Rk8Kys
	4MWFGzTaaJ8gxMaPcI0IQ0oon1ChuRTFc5bhzlm/aYS92b5e9thzJW0sFGpXLfKb41SaqrYfMOj
	l+h6LDuQdYOcTLPEiD9Bqyg0vJU3TX1EuXAwwJeeYj1yCPWBphzgXHo5bJWsshZYbGBgThFwptN
	bRk3zMf8EjaCMrYLY09nXD+Yl+3Yc66m4oEtiyRbyIxAPAv5UWANBRon1B1GW2VSxpn27LG/1il
	+i4zx/7t5pZgfpu+fag6fpccUbnEBq7n7Dn54wJHtMTbDWsiinYC6juzaXoDNHL/1JLUSl8QPMw
	CrsmRXocltuzO4YgRZFmY5EQ==
X-Received: by 2002:a17:903:4b03:b0:2e7:e73e:7091 with SMTP id d9443c01a7336-2e7e73e7348mr18214435ad.31.1791455130670;
        Thu, 08 Oct 2026 03:25:30 -0700 (PDT)
X-Received: by 2002:a17:903:4b03:b0:2e7:e73e:7091 with SMTP id d9443c01a7336-2e7e73e7348mr18214035ad.31.1791455129590;
        Thu, 08 Oct 2026 03:25:29 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe39csm22081655ad.16.2026.10.08.03.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:25:29 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 15:54:13 +0530
Subject: [PATCH ath-next 17/17] wifi: ath12k: Add QCN6432 AHB support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpp_bringup-v1-17-2c5797b5e4ac@oss.qualcomm.com>
References: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
In-Reply-To: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=NchzRGD4 c=1 sm=1 tr=0 ts=6ac76f9b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=R6GObu012cZLLkk_EdgA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfX2LkmENyX89W6
 rWOmnhAZ3DyT+ZDosRDt16Hd7rkifvwdnXJckY2Uj0LTpEoureZ9eVz8pF8eWDtvSKLthe4bntg
 1ta7E+ymw1yQ77EytCo/4NhicZJ15Po=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfX+jLr/Gf+A+/w
 yn+4KZZ2oGZ547OoLZxUYukBGV3+jVFXrhBkxAeJCKf+s2cKgT3m/JxAPSJK8crWHYhwlgB0Gm+
 nxWIE98wVt1Pl3rDtAQqxvtX0I6HbJ1MZ7sE2qBMVe6edi7ylB6X69blQkVr8FFp2emcT7wrdNH
 4sHOhyCMYTJmonQipvPwDy7s2MKF+MpJABNi1LiOVfUhe5rsee8KCKNyZDF71btu4P9Iy2xQ2mt
 Zx0IGrTGyHFi0mpXdNEIid8/f1mCH0/GKEYZpZspH4ffUXKOrvBN7RuahB7YNMc6a7sM3aK0Zqf
 s2BUJsyGemxyZVN5TgrPqJ1eUYRePzjm8TpOfZnVhtW9q+3pK2JlYYdlTvmA7WbHnmXMeQSKDw7
 xsC6Y1izgiIqIzIdm0zkCe6+scLbp1Nb59AjXeF3KzgISebQXN+zQSV9ic8mic4xJQMrsOouAM/
 N/0a2/bBw48JzOa62bA==
X-Proofpoint-ORIG-GUID: rTHiJUf9MWHkVyiJ5qOr83GmceUD2jOy
X-Proofpoint-GUID: rTHiJUf9MWHkVyiJ5qOr83GmceUD2jOy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080041

Add AHB support for QCN6432 by adding its hardware descriptor and
device-tree compatible entry.

QCN6432 uses a hybrid bus where the CE memory is handled through the
PCI interface. Skip the CE remapping and cleanup in the AHB resource
initialization and deinitialization for hybrid bus devices.

Also add the UserPD mappings required for the QCN6432 devices.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ahb.c       |  9 ++++++++-
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c | 11 +++++++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index 3872aeeb9ba7..04974a6b423d 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -1210,6 +1210,9 @@ static int ath12k_ahb_resource_init(struct ath12k_base *ab)
 
 	ab->mem_len = resource_size(mem_res);
 
+	if (ab->hw_params->hybrid_bus_type)
+		return 0;
+
 	if (ab->hw_params->ce_remap) {
 		const struct ce_remap *ce_remap = ab->hw_params->ce_remap;
 		/* CE register space is moved out of WCSS and the space is not
@@ -1266,10 +1269,14 @@ static void ath12k_ahb_resource_deinit(struct ath12k_base *ab)
 	if (ab->mem)
 		devm_iounmap(ab->dev, ab->mem);
 
+	ab->mem = NULL;
+
+	if (ab->hw_params->hybrid_bus_type)
+		return;
+
 	if (ab->mem_ce)
 		iounmap(ab->mem_ce);
 
-	ab->mem = NULL;
 	ab->mem_ce = NULL;
 
 	clk_disable_unprepare(ab_ahb->xo_clk);
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
index 86359ed1eeb2..98e74bdf0112 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
@@ -18,6 +18,8 @@
 
 static const struct ath12k_ahb_userpd_map ath12k_wifi7_ahb_userpd_map[] = {
 	{ .io_start = 0x0c000000, .upd_id = ATH12K_AHB_USERPD_ID_0 },
+	{ .io_start = 0x21e00000, .upd_id = ATH12K_AHB_USERPD_ID_1 },
+	{ .io_start = 0x19e00000, .upd_id = ATH12K_AHB_USERPD_ID_2 },
 };
 
 static const struct ath12k_ahb_desc ath12k_wifi7_ahb_desc[] = {
@@ -33,6 +35,12 @@ static const struct ath12k_ahb_desc ath12k_wifi7_ahb_desc[] = {
 		.ops = &ath12k_ahb_hif_ops,
 		.supports_multipd = false,
 	},
+	[ATH12K_HW_QCN6432_HW10] = {
+		.hw_rev = ATH12K_HW_QCN6432_HW10,
+		.auth_enabled = true,
+		.ops = &ath12k_ahb_hif_ops_qcn6432,
+		.supports_multipd = true,
+	},
 };
 
 static const struct of_device_id ath12k_wifi7_ahb_of_match[] = {
@@ -42,6 +50,9 @@ static const struct of_device_id ath12k_wifi7_ahb_of_match[] = {
 	{ .compatible = "qcom,ipq5424-wifi",
 	  .data = (void *)&ath12k_wifi7_ahb_desc[ATH12K_HW_IPQ5424_HW10],
 	},
+	{ .compatible = "qcom,qcn6432-wifi",
+	  .data = (void *)&ath12k_wifi7_ahb_desc[ATH12K_HW_QCN6432_HW10],
+	},
 	{ }
 };
 

-- 
2.34.1

