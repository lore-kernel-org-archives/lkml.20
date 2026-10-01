Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A5252D2C8
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867503; cv=none; b=SV5JUtKf96qkn8Wn8nfIqDWrJo+YegvA14F7eK7y1r6nnjaFNzP1xOTFpoLRPG954G14XljAetXpigLXQdUXskd4x3W5wgOLt9vMTAVMkJs67Gw9VrlWjZAHUFVo/z+66hRYSlaO9xvXq7O6U+PT2PrIQzOWvMG+vfl4vOvm0WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867503; c=relaxed/simple;
	bh=/w0aJOH+xoiyalrUqU9wOK5XaE/NxE7TbLjMkHrYZPM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hPEXDJm5hzOz0jsby1iEhdOStp8QbA6uK6XjDTTTqVd1UqhNhMWljq/D+3ZGt8bKC+vzmrIPcgFY8eKJxYwyjrgun8WePvE6O9B2x0sm91w5dy1nWKLLsLrbZaz5HwPEOD9yaC5cUQO+rOwWXODfVcleXbsW7YVQeJ+5LtwGB8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CPwL6HVj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fB14PEpr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CPwL6HVj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fB14PEpr"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691DjGr42403829
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 15:11:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PTzWQCCMyGuhdhfBCadmrc99Mjjl12xgtOGe4mlucRc=; b=CPwL6HVjIyHYBAZj
	8baBNSMXxkvSi5M/GwwVHOr99QwszEo+nBgRMDFpZ1A6rnCUMNLqMVI9qwZAoKKL
	5ocBqZIdHh1s15Q3NgGSPus7tmvFv9sDs6uwCOAd1kAkdVucaeGHK8/SQvBVjFuT
	3i88X5rG8m0Ws+nOqlTQ/I6PN68ZREuxuuwFrFPznz+Fx+DVMcW8pl3ajcMmCEdG
	HjoJ9BKVXbLYJYMZFEaYutZUw46L/zNnYbbJKLnaIGUt6ZUZv4jQYt1JxD76MlLr
	ZxNYM7h22x7TE71DI3j9mnON63zOo5KNzkWLJqPl4xOWTcocLEHylfOpkRSfMyKY
	5gTYQA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h188svcvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 15:11:40 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-14373747468so6297054c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 08:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790867499; x=1791472299; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PTzWQCCMyGuhdhfBCadmrc99Mjjl12xgtOGe4mlucRc=;
        b=fB14PEprU/kAjIwpY2kdO0MOxpWTzYrnW1dxbKyEq3crNyPdouZCIIfI1sh8E/vlzo
         6C6C4kg/0yFx6+yZOmn1haEYrNLKalKRo6dbi+xpEy0z61GGu4ptMJVrgHDyYJM4jz9+
         nddsvpy53BNZG2Zv9HcecvjGBlf+4iFR9qpWAF61rZkqCy1s1FeKUlOfIdmG8FA/MNAC
         LMqssoCbUebqLLn26+6gI/vFAK2Qaw9bl1nwC+wM5xT+U3CYwb/2qN/HuGIquz1kddNj
         yCh8oBNii27DqpKoUXypPw5y9reNV6yR2a91/brhJlBBD30GKTa7M3GYo2377Zqlu+PM
         Qm/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790867499; x=1791472299;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PTzWQCCMyGuhdhfBCadmrc99Mjjl12xgtOGe4mlucRc=;
        b=EgpajbVjhSLIjs/oq/e8jto9bQbxUL8PwCh4fmmcEZEwB6abhhYbeo2M2JzXPeDoDK
         YIolHSE/kUz/PMBVRpYUN8kNWCCl8KI1DtLtAyVUPaWyjgtFCWo200uGaRgEiI10Ab6h
         D+AqiXh1v0oh+7HCEbTNt0l7MSMih2x15dDhu5RvMhFlfBKDJ+tOlRAEbdxd7NJhhrxi
         05j1VOpSjddYZWFjTv87wHdItRVJ4IgDc+BMWc3vHodzFdD55aHjXUGUc475HaXSqwHc
         6WmjR5UnpRoUR408YVceOMRtviiMJgTmvLjmmGw7yPVKU7IHgUAtswFdiRzaJPhVBowf
         oAJA==
X-Forwarded-Encrypted: i=1; AKwUvByMtT8PDdvMjuGhv8H48aNCNOHlX2nEQZsot1qwQXF9ffkQF/JS3iixoIT79vpkeS4CEGD7RB04ROno5nk=@vger.kernel.org
X-Gm-Message-State: AFuF++mdcfc/9uxQtDDPjd4zhNYFE7xzBqKGgRYhEhFhFZA/sHkmN+9D
	7kz2aH7J4i2hJDh6XmRIG5oU/KIVyJ9QX0CU1UPzwaPS2l133gjorH0p4ecoPV7AURZuLyws+qw
	tiM11ka1hq9fs+iQPlwAU7VxCgwrXIKB+LCuBZ7NNVcjo2yfR+mStXRTDERcagQkuuhs=
X-Gm-Gg: AYBFou0/0quJ3tRV8TUyFZLLie5hvjlpl/QryZdIaWlDvHMQ5oIRo7et5TUZ4Vxn/2e
	oUJk7gY86O5aeEhebEPa4v6ozooRh3wRNKKfAx8XIAZXgm4orrTzMB+szwbviZsH1u396geqD+t
	0ZtHkOTA3T5E5rAHRVHVxaEOMG/NcnxJuiiOLWs7wLMDRAKezCJswOkM+7Ek+Yej44J8uovwNQS
	aVjJP4JeM01xKb4az9EvvL/Mjdl8+Ndt/PS6c2Ncln/yxl+aW8L8qi7xOHjRfnSSKmrGKnE4Djd
	nEYgDZIG01+futVZlx8YsdDaj/kTXSrzbnnFK3TePMaUlEJMBUODGOQNG52rkSgx1UvSwhTLHPc
	i5WIjVKM9/+uImEqYZMoiF5GD/BhkHUapBFvVWAMNTMIzrmjaU5u6rHqcNbL5FfzBdgVdT12xLg
	HXN7Ko15TG1aXLBxQhXv3YD5c3tM4vW03vzg==
X-Received: by 2002:a05:7022:158b:b0:148:4d6c:201e with SMTP id a92af1059eb24-14d33f3abd8mr5346550c88.23.1790867499088;
        Thu, 01 Oct 2026 08:11:39 -0700 (PDT)
X-Received: by 2002:a05:7022:158b:b0:148:4d6c:201e with SMTP id a92af1059eb24-14d33f3abd8mr5346522c88.23.1790867498484;
        Thu, 01 Oct 2026 08:11:38 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f265d307fsm56159c88.3.2026.10.01.08.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:11:38 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 20:41:13 +0530
Subject: [PATCH 3/5] arm64: dts: qcom: ipq5332: add the IMEM node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-imem_restart_reason-v1-3-79f516906010@oss.qualcomm.com>
References: <20261001-imem_restart_reason-v1-0-79f516906010@oss.qualcomm.com>
In-Reply-To: <20261001-imem_restart_reason-v1-0-79f516906010@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfX2I1AbzwvML3I
 QQJLxd+naRVgeMAu17sokevk5CCNWzfDUauUJiR1OrCrPa7QQa9oFnjVhEC0XhQoO0BC39wfrV5
 iCMHFu1vVTQ/aT/OmQYTxpVcr1fy4y0=
X-Authority-Analysis: v=2.4 cv=OozaWC/t c=1 sm=1 tr=0 ts=6abe782c cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=1EpwE-knX81bZyav7xYA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: t8vVlDBIrJ0gw8KJZgM1KwZbrQMnsBTy
X-Proofpoint-GUID: t8vVlDBIrJ0gw8KJZgM1KwZbrQMnsBTy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfXxDpP8xXllvZz
 ujLiHUmKGZ5VzlAfMaAiwY0ISV8QAlPGmdeTbSBVqpiLBebTqzMeSrct5VWwSsUYhGarb67Js0n
 oMqIc66OxU89yD4PquP9dQhDBIrFpFx765cLzj3D4U14jHgT+co8y5u08BKFf5340hl4pgVLpJa
 V1+8sYQfwOQv2ULJueCzL8RkEyH42EsnDeeRLX4P7K9SaD/fcY5BTBqLRIuCwxDzxktfTp3sV73
 zWGRq05UEV3d7C8ZQlDmix3DKofTqe09ES+GA3egw87/wO9RHMUjvewANfnY+XsQRix5HBo9UeT
 Pv+vuVQrP4ieLMJwDTzMvWHMpGeSMPBDErGORyfogXN99qcz0iXg0KTr2oQq1291p9WTaNVtiNx
 9EMaz/n8EwqVbG0tc7vgZwjo1dhnBNxFkggmWbRInVuioKfxf0mkrS1cwP3JYAgrbLhp6nhcRVm
 /ZUHZrn84yujU1GRCtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010060

Add the IMEM node to the device tree to extract debugging information
like system restart reason, which is populated via IMEM. Define the
IMEM region to enable this functionality.

As described, overall IMEM region is 80KB but only initial 4KB is
accessible by all masters in the SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5332.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index 74d9de8d7641..3e10f45e182e 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -493,6 +493,13 @@ qpic_nand: spi@79b0000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq5332-imem", "mmio-sram";
+			reg = <0x08600000 0x14000>;
+
+			no-memory-wc;
+		};
+
 		usb: usb@8af8800 {
 			compatible = "qcom,ipq5332-dwc3", "qcom,dwc3";
 			reg = <0x08af8800 0x400>;

-- 
2.34.1

