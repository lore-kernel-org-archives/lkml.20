Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793977340;
	b=bQ5yhR7nErM62GcyhN3ZXOgEe4YsDgYRLdRRRnc2/bqWxLQVd2UtkezfbyMuHcmw0FZn
	 itx0UvWaljPPpAjErsXVn0nZ25RZlby4EN6aCjKMFH1wZWe1bvmhH8tSoQrSixrkafR5z
	 H6pQFqsiSXmV0TGclWD3qCeSSEgFNP4uMdVpF84HakuBRfSImlliHY+t6+4FTVLfjTfOC
	 CxQGBiuYh/K63Jb6QMBoEVI57Lx9WZdtAf6m3ZK0yhyCU8WImXy+nau1sd70Nd1fJy9gc
	 WEhuCFFoA/0qzFnRd4vqPvOFss/y1ZhEc6ZSfadfr7/uh+NHWwXqOoU7WV1KFd5B7Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977340;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Yx8cGy6GRV/5KE7+yO4+nlU2i7SRus2h+xb24HPkgYE=;
	b=Q+emDuMA+obwhrpfDOv8FARKA6+tfkCVtgB//fdPA+mU0eSVDxxHYEPlOHTAWRysYAGg
	 zOVBgzmVrgtr64NhDLb1ABhDz90Rnf8w6T6aajmfEHfDt4v0blZnQiM7G+1/FZnWGtg1E
	 QQAY+RjG1qPCjAFXTMUP0fu59+cP8F6DWfxZpdyRkZc/4xIYOVKwf82fPNuo6MDO+4Fkr
	 RU2zBT0KnRjB3Dg83hpILysHDBMpRGVePrTCnadnGkX0LAYyOKqeKgpJzjakWPc15HxoN
	 GHGrXqyj1oA0hhMEIBEeLIN0VXyQYk8zvr3/TEDtbiK/XAUbkb1z0LURJpcCTj3EYWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ooiae5c8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fvIYChHZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB80A606D81C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:02:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB80A606D81C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ooiae5c8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fvIYChHZ
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6ExvCO3324808
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 15:02:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yx8cGy6GRV/5KE7+yO4+nlU2i7SRus2h+xb24HPkgYE=; b=Ooiae5c8LeL790vg
	3HfGqpQUSGhnFjRhtcuabcQooUZ2p2X67qIfBqVZ6cJSiDsr89ZsiEPfS16DrFSC
	jmGDzOugKZM1tmiZzb0zZBQlBfyTzTC4DY38Wz41e8+IbgNtHmonNQnFmZWUUy2q
	Wx/qoKO8cVvXowyRBYaLrDGLqv1Fw7WJ8xCMDfm7r32yupZuEkTxJiG6QFDjYUXL
	B7c6U7v9i2dksJOHuTXFC4jWgnHtNwLsf644DC4Rsf2hdisD5Ps6jnfD+b0BsOSO
	raMctBdtu7Z6JnMqLTre3pUEZiQ+43kNLuZ/FKMa/TV+s3xov3PSIC/f9eoeZzrL
	6pHzig==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9bb55-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 15:02:18 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b07b06027eso1031506a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793977338; x=1794582138; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yx8cGy6GRV/5KE7+yO4+nlU2i7SRus2h+xb24HPkgYE=;
        b=fvIYChHZ/VHb44k1posJawhbEGdasBVHP6OuucAG55bMZyX5yLzA4Dd8JcOMo0iIA1
         mLzEd6PHs74xzqhX7aOdUvLf9jHgKSXJU3K86l8Bm37SBIHl35O1tWJ/dO3uWb2+A6FN
         zTov97mqiwmS+8k8D3FahTDF3S0E6/XWQfLBCeOl+t8dWWb3vlpSuukeBi93x/UaKGDh
         iaCc4+4RRNP5dedWVLEl+wUHdQ/xyrY4B1+0R8ZnB1KWBrW8m26W14WCfVBQhb82FVMF
         1CUpzDkISLKoJ5XzgkQEH+jcXHwnOaChgWP2vnbxnLZ4J/4bkW8e06hLfx3Z5LKCekgd
         3BIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793977338; x=1794582138;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yx8cGy6GRV/5KE7+yO4+nlU2i7SRus2h+xb24HPkgYE=;
        b=tEZOKKcMpYH7IiVCzscUPyk7aURB3ZK7MnXdKiKbnFA0O7SULUcZrJUIyz5brJau6E
         yfH/HwjBQgHjwZQ9MEc3xUI2DY20TO+HVacA2D0B4TxuRLR8nd6rO4fvO7m3HqTJ/VdU
         ZhlViO702TVgbV7LDAAA9LB9OX+l44DsYkQ70Mg/GxTUTwHvQ3aS9hgICCknT5VitzES
         H4imX3uUp2EXRFz9Hc9LbqxHMJtarqa2oC6Jw9gav6uH/zzeDwgBH2jdlGUmMlyDRHa+
         xX5pupdqvAoTj5by5DHCwQLUD2XU7TpUyuLu0lWF7P1eMOn8n+xgGthwNv0zyqa8RMVr
         739g==
X-Forwarded-Encrypted: i=1; AL+hErGpedy6Och4T+WIde3bjePweW8Jusr9sjsC0LR++UvS+1CsD8tsfR2S4QNxGO9uYK3eYdFMaisD3jBZSfk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rfry3BA9pbS3tRd8FWmQipxkT358q9wDMU6Rilus9u7O/nQp4
	5LBOlvDy+hDg91E3ZkwIk0umGczeKd0iQGagVU5mItZbj/kMd07SrggmNS2p2HInadvS7Tz/ZUC
	R29g3509+ek3iA1an4whIsBngA4xcwDvtkvKjNXcglnWKog+Dc2kSHanpQ/kIiQ731UM=
X-Gm-Gg: AYBFou2nnJW2amHB+aDhstRNf84amHMuYnVcUR/eK2Ls0ikXOoghNf6DOj6yTl54cjl
	fu7h05/Bs93TtSamfO5epp2vqYZftxVoedL68i1O+6m3X1Cp5bPlUHKwiTFzgO7yw3Mylr2UI2V
	X77kxK6uRwkiEAc+ynIcvBTYyCt7HKXi6wU6996wqLPmOmh74pGfshMOn7D2RAYrANtskYvHKpk
	AwlL244QRuGxLMjkb4H2Z19ALytGg1uNc9rmkKjV5KgLQtZMNy1fNcv91hzmOF18OibzJlYJWAb
	IuIUt9sJYCCRStl4JwfV0DBBcpO2piVp4xIFDpQMZMrVycE5ixgk3j0AFNBbxr/RtIhFEpSOhMY
	sl9mgtyje8s55YZOp0BEgdtixtBexvtDDlJyGDbBtVl2dxcDVCISNw9PMAGQyh6X0GtTL2CaiVW
	5p7gaK1BDH
X-Received: by 2002:a17:90b:2552:b0:3a8:185:cf40 with SMTP id 98e67ed59e1d1-3b0db6a8e74mr2884513a91.10.1793977338255;
        Fri, 06 Nov 2026 07:02:18 -0800 (PST)
X-Received: by 2002:a17:90b:2552:b0:3a8:185:cf40 with SMTP id 98e67ed59e1d1-3b0db6a8e74mr2884448a91.10.1793977337611;
        Fri, 06 Nov 2026 07:02:17 -0800 (PST)
Received: from hu-jseerapu-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0fc1bc1e6sm100032a91.0.2026.11.06.07.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:02:17 -0800 (PST)
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 20:31:22 +0530
Subject: [PATCH 4/6] soc: qcom: geni-se: Define the QSPI firmware protocol
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
Message-Id: <20261106-qspi_upstream_series-v1-4-21f43042dd60@oss.qualcomm.com>
References: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
In-Reply-To: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793977309; l=1942;
 i=jyothi.seerapu@oss.qualcomm.com; h=from:subject:message-id;
 bh=ojWeR4VoxNLp6SSgIqv2hrWvgVO2h3SZMPicVyzBSmg=;
 b=tXEQEoZ/2GxkCiFk/2JvJdGrCiIpMiZY7dqXyKOv0bjxZA4pHhyNLUF7zxzajclaa1/wm6dN1
 Oo68+1Np2XfCQpX9o6a5Sa31CNZVIfN+QTegPB27oFb8jKr8OUrnAw1
X-Developer-Key: i=jyothi.seerapu@oss.qualcomm.com; a=ed25519;
 pk=9vafyYsia0OnBKWSEwhmWe3hPVQfI2T1xOs5dPaFvEo=
X-Proofpoint-ORIG-GUID: ZMmU2cL0cRvvU5vq0qYueBoX3yYAOh3B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX5jxIuTZG92jS
 x/bmHhNhoK+MDnNtZGv+Ds/W++oNs6/5tu8MCyb4M1owytQsu60PkL8EMfbW5Yls3Bc3IgT+SHi
 VHIeJTlqA/6+OfuoiGE921t6fZo7DgAAx1XsNuTNzWn0+/wo2i8CatXjPYKGUwUIls0KbEoweD1
 6s5ea3zdU5A7jvSNfU5tHpKwztIs5YAuUUUDMhTtreoRo+ishLxNgLPQ5DTtNP3Ztqr0n2btaig
 r+/9mR2pxPmcF7/BZLRiLooWbHnGCBWl5QKHpGCdsKMbbNarTBIUKheEK0XJNDT+k9MLrdhWFEX
 T1sND3k0XDWqbbuzzBmeFdSchwstb7YJ6F0ivw4L3ezrc0vQDQ+MMWYsR7IXhbvohg6/0ruoW+w
 7BvfuKd870UzALC1alhlPLcnuqtWlOTDOALxTW9riiUonT2U5Nu++wrf870HjiCYR9ZZo6gnrfN
 jjNBSXtMZvu4fDu8WkQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX9ufBIccB/wU8
 2DKa6muZosLfvNsLVY3Vv8JjmKryOXnFPHPnm4A/cW3jY//9UwHXXPt+teKLZYKYOKCpwOHeWQG
 aq+x4DPrjAnMijnxjDngyeu6EPwY4/Q=
X-Authority-Analysis: v=2.4 cv=WMzqzXsR c=1 sm=1 tr=0 ts=6aedebfb cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=0Zn3HNfoxhtf-8mV_PwA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: ZMmU2cL0cRvvU5vq0qYueBoX3yYAOh3B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060059

Add GENI_SE_QSPI with firmware protocol ID 9. The GENI SPI driver uses
this value to request QSPI firmware and validate the protocol running
on a serial engine.

Extend the firmware loader's protocol-name table to accept QSPI.
Reject unused protocol IDs in the sparse table before looking up
firmware.

Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom-geni-se.c  | 7 +++++--
 include/linux/soc/qcom/geni-se.h | 1 +
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 873bfbd6b2b7..396f3d81d292 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -122,7 +122,10 @@ struct geni_se_desc {
 static const char * const icc_path_names[] = {"qup-core", "qup-config",
 						"qup-memory"};
 
-static const char * const protocol_name[] = { "None", "SPI", "UART", "I2C", "I3C", "SPI SLAVE" };
+static const char * const protocol_name[] = {
+	"None", "SPI", "UART", "I2C", "I3C", "SPI SLAVE",
+	[GENI_SE_QSPI] = "QSPI",
+};
 
 /**
  * struct se_fw_hdr - Serial Engine firmware configuration header
@@ -1557,7 +1560,7 @@ int geni_load_se_firmware(struct geni_se *se, enum geni_se_protocol_type protoco
 	enum geni_se_xfer_mode mode = GENI_SE_FIFO;
 	int ret;
 
-	if (protocol >= ARRAY_SIZE(protocol_name)) {
+	if (protocol >= ARRAY_SIZE(protocol_name) || !protocol_name[protocol]) {
 		dev_err(se->dev, "Invalid geni-se protocol: %d", protocol);
 		return -EINVAL;
 	}
diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
index 29a53bbc0dd4..e96266631ae1 100644
--- a/include/linux/soc/qcom/geni-se.h
+++ b/include/linux/soc/qcom/geni-se.h
@@ -37,6 +37,7 @@ enum geni_se_protocol_type {
 	GENI_SE_I2C,
 	GENI_SE_I3C,
 	GENI_SE_SPI_SLAVE,
+	GENI_SE_QSPI = 9,
 	GENI_SE_INVALID_PROTO = 255,
 };
 

-- 
2.34.1

