Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19E6361666
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792376155; cv=none; b=RRdOlg2izD1tbd2ZzOQoXZPZqRQV1+xUnd6lwmEllQ75q3FJx908emj5+RyW+KMBXrqyclbXR4kr8fPaQVixMYbCAhTBmWLRCnA8dplUbYtTnxcsXcJ+zGHz0pdXztlYo4vwahglD+jMYiKED10faeSXUd8tuuf9Xx6y51i/HE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792376155; c=relaxed/simple;
	bh=DILLGEOqmhVtnt/inOSuN+oFHC16oLiZeuvKKj6QrQw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kFaucO7lslUI4bp0jMxn2ED4EhpLueyCHVXrUBphdi2qO+fW/mKWGesEvKbJtEuc08y8isuqzDai+b/eGi9RVq8m5sEXOMtzv/DXDqIBfRost78mBIeobI0+1VH1/0JaN4tgphiAw5XuRKyRGIDW3Xd+06LJZK9QTh16HUToAM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cKlDe2eu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qno3QPG3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cKlDe2eu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qno3QPG3"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J1FVRH1114076
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:15:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=npnmsGn/PJZA8qbA6dc2x4XrktnRfF/ttnK
	kUxS5bVU=; b=cKlDe2euhIw2lcj+cn8vD22Tk07L/poBMz2npRcj3wGTh1R+tNS
	7Zh30m+QNGcQr+2d6C47cEdyM4MjiWc9n5zUSdzae/pg9C0WNcPo1xuaOGeGMozM
	3fnN4fyhfdnQO7W1JeicxDS2939LZThH6fvHQSEvW+nfWpyUmnXmOLLSp0/oDaRb
	h08lxmkbQWsY/MzUNJkxuMmtWA9Cfjdeaw3WY4rd2zips1j0yvKYUxnavo5It0aG
	hjbzpgePgn3Mr4LXq5+GV32UgoakhkQpGFwP3p+ICExEQjvbjtBV7ap55+mvk4UH
	JQRuJsGAfgODw9zcE7nre6e8WsX39aqO9OA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5ur0hy9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:15:52 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3552883bd19so4150975eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 19:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792376152; x=1792980952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=npnmsGn/PJZA8qbA6dc2x4XrktnRfF/ttnKkUxS5bVU=;
        b=Qno3QPG35/UvmyDedElVNcJlwBhGd8QdkjXTyJeAPWSE7ws3c5dtAMnLlJDT7OrtMe
         ljplVKmEfbWN99xxUtaTsa7kmFzIwr3ZRKdA4wA5QmIRKXCedaYcrPQfNdhVZD5ohS7+
         cA7IFikDxjK3QaOSjaWIXtr9BjyBm5X0cfIT1Dzt5YDvV3wUrPF2Gfu5aPu5PblXKZsP
         YNGQSHrHCeBzPhTtpU0YDK8bn+qxxxw6fK8860RqV2PNong7r8dYP16VCLQNQ0ng5VyU
         4k97MWb5pyg6pgNIPC1zplBxD2RCh3F4SPTDLt6RDIttAb2h5XVXl9wkIVPhEnjZIt9Z
         eD+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792376152; x=1792980952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=npnmsGn/PJZA8qbA6dc2x4XrktnRfF/ttnKkUxS5bVU=;
        b=qQ3Jy5quTjVTCEA/NG93GAPh3d0DMekYDB+S9WAbfLy0cWPf0TsZ5mCgq/3uf2x8/f
         3R/f7n342ucist2/JB7WJREa4Plh5Tmz4curTGxk9HpRe2nyGOVK6hJELE17Kxj3pWKj
         UwXO6Tl7XND5PMBee2/VZC/x8Nk8Yff+2kARRZHG068W8znj/4D9MD8cRjE88jsNl0SD
         ke4ga+CxHwVDNrTpu/Jel2v+jiat0uJFnOexoR6tOu4oZLzFrJY4zbreeTC8bqkv7l/A
         E6uj/NN33ISwROeO0qxuH6XFCOCPjENGsJ18qLhA+xjWTga+riBAVbCECEe9lrOSPjhm
         +bEg==
X-Forwarded-Encrypted: i=1; AKwUvBxwmIMGshQ5yDrcwWzx6Y/nuMgoAWU+ybVfXhGg6AO4biZTv4LL+l0rOaxRdioxU5ESwlKjorSXBOkKlGA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRsn/Z8wHgHQg4YVXrpNOkAttSmt9ekNxDg1+GXi0PwmGykPEQ
	x7twS7Naxpo0iMFqQGMN51ODD6YmiDg01xXq6EGOCgItMKnc5Oe9y3Gb9Q/BXjqJwdDIJzBA47B
	BnSVaD2E9pF2o1LYVvDH6Zwu4lSGAzuCk9CCfy+6Db6QS6SwDEHyMr/wxbcV+mkScXzE=
X-Gm-Gg: AYBFou3MnCombn5QKj5oobABJmvbFdkx50/e9hohf3khTX23+J3vNcWkBzOZkYULBxD
	7+gEeaXhUTncqRhhflOHF1TUAfswkt/XqSNK9LlqayVC3BHPKD4UpChagfwlx9GFaCHYJnk0T6i
	+tE6q2NhqzBvODn7xui+i7dnAZJiOy+MxM1uaRdBELTjNiggYyHCjRn9ov2H769Dh3be170dWm9
	wsmWjlOBbSX+E4DOP6mcOjya0zEh6JBd4FO/mTPmhWgrDgxWyZBcz+AgG4C/uOgnddLrUdx+mDv
	ZD+Hxq2O8hdQlMRwX4WiMGcdcIq3GnDU64XfCabQ9DxijFmLdy7kaNIO0j6mUauEder0b/xIDur
	32ko4EIIr3CaY54EtTEQ5LKPOBrBwlla4tDHovj9DjcPb3MjLrQ==
X-Received: by 2002:a05:7301:52c7:b0:35d:d671:933a with SMTP id 5a478bee46e88-361a185eff6mr8018220eec.15.1792376151643;
        Sun, 18 Oct 2026 19:15:51 -0700 (PDT)
X-Received: by 2002:a05:7301:52c7:b0:35d:d671:933a with SMTP id 5a478bee46e88-361a185eff6mr8018170eec.15.1792376150678;
        Sun, 18 Oct 2026 19:15:50 -0700 (PDT)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm33841550eec.3.2026.10.18.19.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 19:15:50 -0700 (PDT)
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@oss.qualcomm.com>
Subject: [PATCH v2 0/4] arm64: dts: qcom: Set snps,resume-hs-terminations for M31 eUSB2 PHY platforms
Date: Sun, 18 Oct 2026 19:15:43 -0700
Message-ID: <20261019021547.1694088-1-peter.chen@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAwOCBTYWx0ZWRfX4EDHHyB+XDTf
 nwMrULxn4lVOWBk2CqtapvrZSqZYge5N4uTUa1loT5P20zlidmzFcwjOHbky/1Jn3GsXxpMfFBJ
 Lo3LAiuBL+HSVgC1yfEK+Jlr11QOfdk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAwOCBTYWx0ZWRfX+YtEtq8Yw1Bj
 kwiKKbAy+/QG5pYHTuaa1xlm1pSVCiN8yDgHdAEpkvGZ3a72w/zAE1v2i2He+YN6MvDr8TTKwmW
 yYn0qVULnpuD3iW4KGOaZ71fB7MYE8S5ZZBpiWMKDMJmp/ClpGmNo9fM/hz67xuGZRsCbtsKYEL
 ffRzDiIMLFggR1htGxLhp+biICA7NFvmTT7ZKRnjxvhvByQchUsEOFM08/9srfsZ4zTAgbDrcJl
 jpAZMTEFxO3jvNQraE1FJ247u09BMIjUQ8trSz9pgFVrmpe3K2QmcB07pG2vqjT/013GE4J3i6/
 wJmgTUcda/hDPjl4fChUd0v7tmTBkb593pYMXLPYABvnVrtD7NPzuqO50gxcKDV2+xDXaDugD5N
 m6IEHT9OhETzz4fiP0CY8WlyfCCGWSTdgiSDOWsl1lodo9pPofcg85Wqj7RfX8lMSgWzb7mKza+
 l44ozc+fMbY/qo+ydZA==
X-Proofpoint-ORIG-GUID: hOsXR_qiVhp3MGadg1GF7s5owASbBBDq
X-Proofpoint-GUID: hOsXR_qiVhp3MGadg1GF7s5owASbBBDq
X-Authority-Analysis: v=2.4 cv=CP6/zhrD c=1 sm=1 tr=0 ts=6ad57d58 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=7Cx1X0J1WT0CMOh0E7cA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190008

The DWC3 controllers on Qualcomm SoCs paired with the M31 eUSB2 PHY
need GUCTL1[10] (RESUME_OPMODE_HS_HOST) set for host-mode USB2 L2/L1
resume, as required by the HPG. Without it, a USB2 HS device cannot be
reset after it is runtime resumed: PORTSC.PR never clears
(PORTSC = 0xe11) and the hub driver fails with
"port_wait_reset: err = -16".

Set snps,resume-hs-terminations, which makes dwc3 core set GUCTL1[10],
on all platforms using the M31 eUSB2 PHY: Glymur, SM8750, Kaanapali
and Hawi.

Changes in v2:
- Apply the same fix to SM8750, Kaanapali and Hawi, which also use the
  M31 eUSB2 PHY (Konrad)
- Collect Reviewed-by tag from Konrad for the Glymur patch

v1: https://lore.kernel.org/all/20261016091336.2715717-1-peter.chen@oss.qualcomm.com/

Peter Chen (4):
  arm64: dts: qcom: glymur: Set snps,resume-hs-terminations for USB
    controllers
  arm64: dts: qcom: sm8750: Set snps,resume-hs-terminations for USB
    controller
  arm64: dts: qcom: kaanapali: Set snps,resume-hs-terminations for USB
    controller
  arm64: dts: qcom: hawi: Set snps,resume-hs-terminations for USB
    controller

 arch/arm64/boot/dts/qcom/glymur.dtsi    | 5 +++++
 arch/arm64/boot/dts/qcom/hawi.dtsi      | 1 +
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 1 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi    | 1 +
 4 files changed, 8 insertions(+)

-- 
2.43.0

