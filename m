Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FC04EE868
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792054750; cv=none; b=E9b0aM7xDv4w05zUS0nyyIrzZ79JknNvC3OrOjY6ezonpPcpzCmwMWnR6A8aa8YR5PXIDihYpdRqzIGcHwc37M7s6+vD5Mx5FMPd0hFvLLbe1fttE83q5oAQz/QFTRiyj2hSQ/x7ETc+2RmsJzFMohgJ45eUulWv2fg01CMkZxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792054750; c=relaxed/simple;
	bh=lcd/P+nruFRhQ358i4WAml/LB0EcL8s1zTEbmnwyMQo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eVfAlwNPP35QfGVuCbJNQh7WJ26sp++c6y1yl7rmSAGEgI0dtWOIXZ8AqZHBiLz4vdyJKWcPO5w9zOZvyNO3CUvzpLnCNGl9Tcq/GzGTBsxLSNanDahKH0kkPH7V/PjYFEC83Ca9G0UrLJEQkyDe9Wvqe7AmSJykA2FjJ+4KORU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IRE9cK4W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y64R4hl/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IRE9cK4W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y64R4hl/"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F8vuiB2885803
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:59:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nKB3HAwwUoMAANvcjYoiAe4y9aLaTkX2vWSxD+aknP0=; b=IRE9cK4Wt02FYXYN
	TcfC9ibQz4nJfFl5hJbiHxaQR58kdsHtAOmW24zga/73b1y0Qlp42u1KK/AFCrqL
	y4Cblkxh3xj8Wth3I3mZHtrMqwqRQCptPJCtO2YfGtQsgYMWCYFH2nt+vEACAKUH
	8+ua3b10WvCgafGwnJYUvwcQhYuJXMODtMhk7wKOnfGQeoSJBf4tv53LaFHIdpdw
	LIJmLsoMuPwzWV5NrZTaKKM7F/xUsflJua3vYhlCGfAmztU303X3KgDrselI2Hmb
	Ys3cDSmN/oB2AWTloUeNMUR4+HmdQrf2fUWmI1nZGgHtvkBZAJ0zMV3orBIalvIM
	0pFMAA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hausm007t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:59:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e82060977so374445985a.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792054744; x=1792659544; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nKB3HAwwUoMAANvcjYoiAe4y9aLaTkX2vWSxD+aknP0=;
        b=Y64R4hl/hH2Ew5EurFAUOF1LgxerXU8L1Ckf3xNQVzGaIF5JpGzVTEzVokfRAM8uGO
         527q/PWTL2LgapEScxtFbtoW3Tju1ve0pyTP7sNVK20hTo+Mz/M+H/jcAU0MRyeMdLeb
         AH+opthzbYd9zIccN4CXPRWkZkpKOeuK7TNOv2wgmpm0C4gPa2pQbPPV/DouU+FfyFWC
         aizOh5c//9NGHSR4TtB4eVxNbHT+QgnHhZVrJeRpw8U0DQ+UHvz+53snm8hAWsSwcbFz
         VKaTK3wLspgR8nFl9uTlrtKqxXIFZXUx0z1wNef7hRX15o0HIB8Y9MAquh9AjToRn1z7
         8V4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792054744; x=1792659544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nKB3HAwwUoMAANvcjYoiAe4y9aLaTkX2vWSxD+aknP0=;
        b=iRaXyCyjLVS3zraxyyiE1a1Xob3iXjH4uTDqVAN8FaGB1CVYQ9g6eCS015c3A+znqe
         RmqU8nH+yP5MHkpWccEytvjKne+OdJ4vAYgakn7S/QjJnFA06IxCkOZ/I4mSvKLHJs6m
         cqpArT60zYBbtqKFGAslctIeE9dRfhr5pMqjt4kttiCyDNFa2VDfGwF6fcW3BTVDBzxl
         uuaZKvtdQjPlN7YDvDamejhdIVhf2Uv7o71/L90pxTC6ItUTQMDs2FAz0zpVtciXSL26
         0SGCYkIICvIQQFbX91shLDXBGMDrh35QBAARYB4PJi/nGMowmctkgX9Vh9REia4/IcQE
         89hA==
X-Forwarded-Encrypted: i=1; AKwUvBw4hUizIzJKKUKKsWnL+eRSxmAZLYyX3iWWLgJUa5hXTwcfQPpLDrxDtKk13Qz3aKSSmZ01vk0E3q7S4Uw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWtOmssskT/IpMqBD6TNTxFyIbPwnC2iucnJ+9xcP+QxYQXPJw
	CJ12yZdBuE99sIbo6rA93S0mp2cRIjBmHYrUvP3gBKmr8FQDIz4h5hQPwYse11baX4j64AtbXa+
	R36zyv09z6Oz0yQrONxud1hQnFEuL39IW64/PVy/Sxgrf3kxT1fhx9OKfMd3eu+tXBO5fWiRiFa
	I=
X-Gm-Gg: AYBFou1dOwDjpENZsGWEMXiLQkccaRGrQKwNn7Rd30sMtwVvOgO+eikqclcqDw2wh8V
	dcfrVm5Fg+iA8GISuiHzlHw/S9s5BtER4LF2CAn4w3j7p1Wppvapsih+NKffmL3iz4Ai+8qv1Nu
	EvY+CHaRJqy7unQiXIiSom0JtwOQYNISZxeNHDfT6V7QRoiejVccFjN3A0H493TVyZIpHZamWsN
	efv+JS6dYhwowdYMk+qsDffX3Pe+lVgcjKsMvBukSEJI0vXHmI7PHlvRFPnIhO2X2caTQaDZskZ
	BgKIL6UpjbUjmOD7HtWbCxgwnlrkNqVinAyoYT2A7ly1AjPkX/MMxUU0bOXyuiSUIzOwhRu3MvX
	P/SLp1q4GndNCkN/Hi+DHMrhME3S+1naF7/SgWrUW/f1lpO7V2EwqkAr6KUrIZKDyXTZe1pOPup
	1VuS76v/1bhmQG
X-Received: by 2002:a05:620a:2985:b0:93e:c12d:4ec4 with SMTP id af79cd13be357-93ec12d54camr2604347485a.36.1792054744270;
        Thu, 15 Oct 2026 01:59:04 -0700 (PDT)
X-Received: by 2002:a05:620a:2985:b0:93e:c12d:4ec4 with SMTP id af79cd13be357-93ec12d54camr2604345385a.36.1792054743810;
        Thu, 15 Oct 2026 01:59:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be3b51fd1dsm371590e87.58.2026.10.15.01.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:59:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:58:44 +0300
Subject: [PATCH 7/9] arm64: dts: qcom: sm8150: add MDSS reset
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-sm8150-display-card-v1-7-5c14928cef29@oss.qualcomm.com>
References: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
In-Reply-To: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=826;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=lcd/P+nruFRhQ358i4WAml/LB0EcL8s1zTEbmnwyMQo=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9aFqcd8m07PmdPRa/RC1X/HOQu9S8ms0iXHNl9mkp0aV
 TuvbeX/TkZjFgZGLgZZMUUWn4KWqTGbksM+7JhaDzOIlQlkCgMXpwBMROIE+z+lc+Yq0xUkOnq8
 V6yKXsqvqn6thMfq9NXmSs2CeleXbyv6vzbvUK37H8WaN6NVreJc1ksFT5PFM6b6/jwxVcbtP6O
 X05L43UFO0ReKTrk1f3q3eeuk8nCBzv3G1jqem7O03ZaGtWc83a4gryN1RvQWf5rK3nR/vr4YuQ
 6dI2WPP3tf2CFepi1RL+Ozk63Eme+Z6Kd8af9l2WLhdspLWEpKoybJrytyzT00Q3muo37pNmmhk
 Klvdldw6xgv0l5w+Eux+ox0xYsKPsuXz3B7oakQ2fqTPdr1u4Mxx5kVfRu3WLV1ss6rTl317lfo
 16fG9QncgiYBqfdjsgOS45Q1VMrWsBya1xprvvXf1hYA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: hxQJ7e_iE2uxXxYJc9NAT4vgOsk9GqtG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNSBTYWx0ZWRfXy30CrWp/WyaT
 V4JLfYnVoH9Pwnh+c23OQugOAMffuQ3TQZ7+F0CWFD4+j6fQwpkIGqYvAW3044ilYMY39XezqyN
 Vwh8hHU6/yStsKgM5TNJ9b+7nnIqJSMp635GkTJu1mCVFWvnxCkPCsUcc0y1jEYnWHeA4K8kYFH
 zauBxHEpaRjUAYeIWQ5P3cacjJgEB3VS1jFQlYSASeFw2rogsRF+n4PDFWt+zCUM3mTnkbSb/mw
 GPzHaPkK7OqL3/mMt5s9H0FhM1ANiP32pPWKxA4nkyNnVNnV6cxnguT4x4TWorYPDYhUlHkR99B
 /pD9kXn9MUwTjoDZb6KP66q2XnMqhUkDNh2JFvQf7+L+uIeAOkR9e3wDc6tNxpKR6KAlCeRqNsD
 hhuIWzVfnEqJfDpD2C+ihGDCQXpnP/8gZtegOisIgl+KcquMkKC5jAefrRZlxichHceBt3COHuK
 RmncJqORD2VBJfTRnzg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNSBTYWx0ZWRfX1AGzcTQrvYc2
 YslRYo5BiTzuAS4hlsNBXcHp/IdUKDwb3QCdqRuZ8U6FEC+g2AyGw95xO8JY6jOL5vC8JY+Y6tM
 7icgbaK2xnaXWxFv05LJSAZ1D2EYJGk=
X-Authority-Analysis: v=2.4 cv=Eb5d0/mC c=1 sm=1 tr=0 ts=6ad095d9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Bz10KyuN3JYNdhx7gBUA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: hxQJ7e_iE2uxXxYJc9NAT4vgOsk9GqtG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150035

The bootloader can leave the display running, as it does on the SM8150
HDK with the display card attached. Describe the MDSS reset so that the
driver can bring the hardware into a known state before using it.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 293fcbacff34..a2d6e6947c4c 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3817,6 +3817,7 @@ mdss: display-subsystem@ae00000 {
 
 			iommus = <&apps_smmu 0x800 0x420>;
 
+			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
 			status = "disabled";
 
 			#address-cells = <2>;

-- 
2.47.3

