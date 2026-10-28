Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793190343;
	b=3kX/OXfsR9ljuWimIBkE7PiaQOFNH6XjVKabzunAcj1G1AtB7W2Wu+a+0k4xtuHyruS/
	 jW3djLzJSterj6PSkZa2AwVYqAFxcNAc9kdXQvcpkfQcWPKI6gnufgjMyH8CGzIrzZKbm
	 +o3EP3E7ah9+GRc6MyDay8EpO1BLhLpRR7F4r7Fu7/8GakjJu9QOaLkND1thIlm8eYEes
	 6/bPiyuciSjiNcQ4MTKNAtWFlzn4vYVnyLLYJmjFEKH2SDi0ppjnx+TGzhj6n9M7mNcGU
	 PmgRrhmBkGe00NGHTgk+FBgNn3Z4Eviqvpduns7uCNRiOcdOUyvNWIjFLdhq3+Z5G5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793190343;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IE7TTEPp+mYjYOJnw2S5JdN9e/VGEB2SwjVCAm8BKAQ=;
	b=lO2xkrAk7RDIsTsJxYEgUhkMFq/2dHRPtg7HIDQVPJQz1YJDB6C6RqZf10y1sz1RaGTC
	 kJm3cvWzGEgVNUv3f5kay6/Opv9GchiNXy6eCoagn3hjG8M9p+OgR20WRQr7KvOjeFMNg
	 9hfT+V6rBvN41zhmpogeiaBmY3de4l3rkiz5ISgcy6jku7u4EgkaqTYEXMqpHuml08qZd
	 ecxS0T+rIkRE3q0aUz/mUjdFBijhbF3aNV3mq40MVKK1f4rJkHIPxqrrp6q6rC3aeCbM6
	 fCXk6ehUi+rP1uSyHf3eb6LnBqM/6cOfERVVNl87B5JYcYxiwAWPmJfERGL4V9bST7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iz2BlZf8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ODr38ykQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C36606A320
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:25:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5C36606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iz2BlZf8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ODr38ykQ
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe5xh1539006
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:25:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IE7TTEPp+mYjYOJnw2S5JdN9e/VGEB2SwjVCAm8BKAQ=; b=iz2BlZf8W0+7zF8k
	YVFXLVXVXs+KbPcx0z96X3Maa38IR0tPPEcphuCMRQrxA10L5Bk34Qh93o+5c4jl
	mr23IQ64YsoKgth3gFJx+bSx8yinUqjz8luZA6HdsyUf0w8F9ZHeX7CSsOHCiFio
	M22diJ5ZGF7LY/bFN6Q0LI7CFFGKBKZEwGWUhf8AvAWiXgvlbmaFhsszv3CYY4Gc
	ThsqEllfEy4/sahrUG4DW2LqLyntN9F1c0xXf1pJuznNqpajbbhmVRnD2kgQdi3G
	Fwz2bCRFTQ/4dyqs61p4GZzzIFVdukKdCiAHfD5hLvu+o7JjsH0XSAfHRJ5qFI2c
	18ZUXw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdf7rux6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:25:41 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3acd21ba24eso650294a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793190341; x=1793795141; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IE7TTEPp+mYjYOJnw2S5JdN9e/VGEB2SwjVCAm8BKAQ=;
        b=ODr38ykQA8mOISmtU+vtdZ+85hrIBKIRoAQqQSnM9OlWHG4AVS7P/ZciTwgA8Xk16w
         EP4CaFLxIVLihmnaLKKaWQj3WN6FjtKzzW+d8s532VI7BFvY1tW9o6XdUxpOVeJxQ2nS
         MXxlUieDCJey1CtlJkFENTJM72leHWu10cSTQiv14SFYNv0C5on6Q+9qaN+NZBZIp5mj
         9A/uSaZQazfSYT+7ja0a7TiI5QSE1PWgYCKGzVkOZmynJ/A6RbfxNYu9E3oHs4QJngAS
         xJtccB4TvvY3xB56sLzK0r3hB1RXvlw884kVzXzmxBmYsuUFxf23MG9b9ZMt9H23JLpi
         OjvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793190341; x=1793795141;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IE7TTEPp+mYjYOJnw2S5JdN9e/VGEB2SwjVCAm8BKAQ=;
        b=ditHxsWmt2TltHXjFzVlJH/UzRL8m830WEvLszo1+7FL7+m/CVcNRpIT0m9Y2QAh0C
         FV/tY0+zPPSUeNKmoDGr5tyZ1Y54JAaMpes2hk12lpi4Gez6400EfvVX892BNra049bN
         fGozGzq34LuP6C3cwEX1Nb0pe6yu51guncrMmcWV14oax1qQTG+KT0GhLGsaWWmVu1LJ
         3w+4s1R8JEQOCTlMskfYm08Lk6myAI3C2VNx5sWBtKhHKQojCPoolr7aeFH2kN+dM98d
         4DuozP8qWyp0Xkh+Gezmvwi86CdukXj83tx7/SbHJRXvYvJE9XCXTse5iLypq7wGJBBa
         JVuw==
X-Forwarded-Encrypted: i=1; AKwUvBwrRZ5S8Cn3iCzmNVOqdxhH2myGYaTSsfZMJ5wKH/HnMvDSBmK4YS95jfbBWWLZqKP2DFhQyTdD3V3dEQ4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfNyA2Bh2O8ab77aoTSq29Fk1lFH+Y3mcIToiL+LKJeFF0/EvW
	ZR0tQBkBnIrfBn7BW8BTa71l+NldzFHYKqRFxQiSWckjzDYxfYDCeRF3C1Y431OHROme9E35dv2
	ku/+2xMtckEWTncldia9QmIcdwbaDLZtqSLGZB0Yj6qE0GWf4Fl56l9Oou0VQaMIb0zKCi+FqtG
	4=
X-Gm-Gg: AYBFou2Va3LgjkNf6ZYfvNn/NkMDecX7OwMOmdw2YL0qaTB1I5vfQkntyG6c55bRdte
	Qc2MNHhXxKmzdPyCoM5n29C5sUbuZWhcMbbMNwgygW59lfOnWiV1pu1z0LRKLbRzhOvtMsvyg78
	9gIoZKFyXgDFrBv+0r/igijb2sH1/3C3+6MXzRVDyC/fpH+IQwzlJVCYUBW3yGyMXdqCYSnCSZ9
	ks0vvx1nhnLMeDpIE4IRbY+juyRdk6yiE3K/R5QE+kKGsjwzdAtae26I7pfjRgb99d1GiTbMlcy
	FOwTgIqJSpskzNUc+yk2xb63dh2owUyci1YAuCZCt/J9gjlBb9qw8aTDeNMIklF4KyE+UtqLLSn
	N8Jy3BLnP9bZCUiy7mhnc6WlAck+WABJj46YnkDjV7c0e1yvWdMw/BSLb5xu0d2O3PXpcozjOf+
	w=
X-Received: by 2002:a17:90b:1f8b:b0:3ac:80dc:f40c with SMTP id 98e67ed59e1d1-3ae57f9afe3mr1580060a91.14.1793190341014;
        Wed, 28 Oct 2026 05:25:41 -0700 (PDT)
X-Received: by 2002:a17:90b:1f8b:b0:3ac:80dc:f40c with SMTP id 98e67ed59e1d1-3ae57f9afe3mr1579906a91.14.1793190336827;
        Wed, 28 Oct 2026 05:25:36 -0700 (PDT)
Received: from [10.213.101.15] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a9f287fsm2995819a91.16.2026.10.28.05.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 05:25:35 -0700 (PDT)
From: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 17:54:47 +0530
Subject: [PATCH v5 2/3] arm64: dts: qcom: glymur-qcb: Enable UFS
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
Message-Id: <20261028-glymur_ufs_qcb_enablement-v5-2-09cda5e3bab3@oss.qualcomm.com>
References: <20261028-glymur_ufs_qcb_enablement-v5-0-09cda5e3bab3@oss.qualcomm.com>
In-Reply-To: <20261028-glymur_ufs_qcb_enablement-v5-0-09cda5e3bab3@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793190309; l=1034;
 i=pradeep.pragallapati@oss.qualcomm.com; s=20260911;
 h=from:subject:message-id; bh=qZOq97SsVPti3oQZnFWkZh3c728gDdolT+V4/jasJQk=;
 b=32awDFy7e9HmWnP/20AX4LOq2FVNW52SoyFahYvtOVEkfvhPnZE7dbpNNlkhNLILqGfEZDoro
 gALGuqVM6y/C6OqU8Q6Ccqgwz3pNh/45gLJSlrhnP7l7B6Tg8Jb/iPS
X-Developer-Key: i=pradeep.pragallapati@oss.qualcomm.com; a=ed25519;
 pk=uyRUsge8nQMwf3iW/e/o0U8z9nWLCMm1MGKxEftztic=
X-Authority-Analysis: v=2.4 cv=M4bYuCws c=1 sm=1 tr=0 ts=6ae1e9c5 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=cMKPt8sKVRzp0kMMbBYA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: Q2y-yhHPG3GZTk9EY_vNLF0GRml7Z5tW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0OSBTYWx0ZWRfX7lAWPl6FpcZg
 YbqgLpfCe7KdCDJoiqItvYkGtxWH/jknN16AlDDdijaCDIGyhOMg4zPGNAC0R8zBAkF2nV4AjI+
 KqHEtmyPa/lR4k7DeOLeH/Ph0Hl/gVc=
X-Proofpoint-ORIG-GUID: Q2y-yhHPG3GZTk9EY_vNLF0GRml7Z5tW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0OSBTYWx0ZWRfX5w91/WCuACFW
 FBa+0aE4+UNEiGmgYBE+iTCaBgNOhWbtaQI6G95RjupzjN579tNhJUbcWWPghIwJC8EzxLtMl/1
 MmWdhp8REEQ+97mmY4Aiujj4tdWnj8O9FYcjuwg7hzIKg7loLkAFTlBON3mddt+FAyy1kOEnEgi
 RXyaH1s5mWSdgDV2atmaiJJzi0t3HBUUhhtdcY3bVCdJV4ZEdsuhhGPN9mNIimcTbaMvJvae5F+
 gmExlC8/NWVKDG/MHsrg/Hq8Poow/jIzqOFWr95m04Q/F8E7qrESAMTuGZ6N/NJwvGc9v7Ynhb/
 x0MIRtGbVk2sIXBonHbOsjImcDCjtaMboUjSqd7QTv5F4NQJVC+YWtafJvDD/XMyBnvSdok+Ge8
 969w3NiH3jYnLUZTA2XPv1jr1xXgDEVHLZ43NIH7Gtud/Ucc/kTMBG5hpIFqCtwop93cTMpgUa4
 09Hlj6sPQJpWZigPxyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280049

Enable UFS for glymur-qcb board.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-qcb.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-qcb.dts b/arch/arm64/boot/dts/qcom/glymur-qcb.dts
index 17d8ff3aed23..f17181bfeadb 100644
--- a/arch/arm64/boot/dts/qcom/glymur-qcb.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-qcb.dts
@@ -697,3 +697,21 @@ bluetooth {
 		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
 	};
 };
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 250 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l17b_e0_2p4>;
+	vcc-max-microamp = <1200000>;
+	vccq-supply = <&vreg_l12b_e0_1p14>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
+	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
+
+	status = "okay";
+};

-- 
2.34.1

