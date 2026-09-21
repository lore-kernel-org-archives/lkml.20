Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B124A5C23
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790002034; cv=none; b=W4xY3QeNNaZ9qwtODHxydyADCBqQY5EYLk+XCTvVmzqsaSuEAfRPQlpWZ0v3GNUmcAEN2rl2pyowi6gpAwSN+oO7WRIGkrfD6CLKlDCXKW+ELQ18lFmIaIe8qoe0KYSspJ9+JrWYEt1++rUvI2Qy70t9zYILv4OTRtHDIyEtQEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790002034; c=relaxed/simple;
	bh=fp7fQreBnthImLz9yC7TnO8ACEl9OgIHWkUN/8arfvY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Hwtv6fX1iHgeEYQUy0W0bVfB1tiG50O5zTPWKZk3/QesKH/PGokbR9HjPByRLTAdlNrL/a1L/8AeIgMgpeaY+YPFdupCwIsHUJaFScjrk6OhwBjqAoMZgYf32xWaVzhn+MdFe9GfxoOsdVlPs/uzwbvFvpZMGqrXlLKGmbwE2XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kJsTzBr2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JxyzuONM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kJsTzBr2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JxyzuONM"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LEGYjm1410127
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:47:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wQZmRGeGJySWjhLlCYRWWj
	qwDMYiYd5vCRMQPcuIPpo=; b=kJsTzBr2o5Z1KBjeZiK10XkN6LiljtRdsKxnzX
	sGvv22p7214CmAnI6aBM1ZGEaQ9N/EYpz7a6BDlSqjDmN7g0PNbLaJHHruG3Ca5P
	qaAWW5LCX0meNefvDWxjIkD/aNLPFB574h/Zt++HsBWxU3g2hbx/9XPFDpXrOsLh
	69jRhrTNS6vQKijbRtR+vqRQ0on+ZWaoH/IT9PCVrIgOLsI/1D8GcdS2wSXAcvAX
	1RsdSmnRfcABvo8zAx70rHfoJ3xiF/PZyg6zEtGJYAqqMUOVJgZXio4sDs8a840g
	bVORUgn9HlgJddgFDrwth6et/rebElneshRJWhaejeidzlDA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq8bb6ht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:47:11 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c7d2076f8aso3444265e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790002030; x=1790606830; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wQZmRGeGJySWjhLlCYRWWjqwDMYiYd5vCRMQPcuIPpo=;
        b=JxyzuONM+Vv4gNIpADE8Ry6eFnJ6z8m2+ex3WCntA3wxCtEvZJ7VPv06coB87mZImB
         iuoFH4AdjvI+a1ZHomoC+NNGNJsIyf3MrNmrwajtq17yBTE/WpwT2RSRYASiOCIMtsoH
         RWsC+oPwWGZ0vLODkxjfSw14IxD4SczFJoLCN5aBBKvNmNHZP1wm1NE23VHJVHH5mdp7
         N29195iCTO4vMxueYYoK78gTkNIoVZDw4XX1j9+EWe8HGv5NbpoXXZ+T0Gy+mfPIN1tt
         SfhyG01nBbq76QcLwI8uH8/nhPV/LrIQmRqUB3DmhH1ori8tzg2C4kuA7UbgxtkQG0U6
         LmbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790002030; x=1790606830;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wQZmRGeGJySWjhLlCYRWWjqwDMYiYd5vCRMQPcuIPpo=;
        b=Cux0fzdGGn6I5cFXaSN5QUcwvcwNDz3EpoY/edHZGufJm/RCdld/R8GMCpopZ4m5ss
         +XvJbXqICGwxmfVssVNijmurXQYSMjggNKpxT3U0LzQJAAYHXRRJ2s6rFR7H22mVKjqL
         ZTYVyCD2yOs8sFXgo1cy3x+9cECxEF/YyqaNMOSigF754qy4wBB6Zwjy/z4y9TDjeOlS
         0BzEs3/73oVZXEjlw/brO2piH1lvYX8DCx2mMkiYtwRMVyVg0Cx8AslIDqKCtGUrhLDg
         2IC3UiZA5ACtLSUGLQhmD4k0PBuoFvZuM/i4mqDxyeOzp4av1qDlFh+PkYrvVot05V0N
         l2mw==
X-Forwarded-Encrypted: i=1; AKwUvBxNwcmW26LRn97CkC1AGr1IWufxy331IHJq8ss0d2H0NSy3Z3EJ9iVA+fi9TfUfQRZovjiGESs35QndifM=@vger.kernel.org
X-Gm-Message-State: AFuF++luM21A3KdoDYj+YOPPahQBIIKuvhcc5ar6FAJ+xMJvSgkAsfQs
	vw/FuXb34WAYcM6Flj0zdG1YSztXRQjerreeFbwkshrODTVfTgjXYNg/QoDhqyRSUY/j3oStuG5
	CM/zbszp6NOQUCd95SMCLJ6dHPftUZdfx1FZdPgJP9+ZnAVHLyCoxeHnjAs4YlNl7eQg=
X-Gm-Gg: AYBFou3aBXJnfEHWN47mKMQWcediFx0g25znL8QJdS46LSGnvlcwFdDq8udbqjkxbgW
	Rlj9vG1ZKaVnnlM0GUYVqF1tNLuPuPlYgw8cEpbqntmVzkcIq4sLN/pmt+SHFYKBmYd2oA2X//Y
	6k2kAHIELC8L9vsFPiKfNdDX/om5hhPooxkE90PYxRim2tCFsE/q3ENcKQRm3gt+2LVZNTKGSrd
	EUn4kKCjkovtLBdqSTRfoX9qnHR8DNGb0fXOn2ISzSCd5emqvT0SLiOwt5PyKB+Q19T5OCfJH0+
	G/b28+wuuZWoUghwyIxEt/ZHu047nugKDNLBundv/ikHNDjpye/VA0GXvrjy6HojpyfzneI5dz0
	QPiwQHyZELGPoAhMu0/IZPJqDl+o=
X-Received: by 2002:a05:6122:530b:10b0:5c9:a5b6:27b3 with SMTP id 71dfb90a1353d-5c9a5b629a2mr3863586e0c.16.1790002030427;
        Mon, 21 Sep 2026 07:47:10 -0700 (PDT)
X-Received: by 2002:a05:6122:530b:10b0:5c9:a5b6:27b3 with SMTP id 71dfb90a1353d-5c9a5b629a2mr3863536e0c.16.1790002029956;
        Mon, 21 Sep 2026 07:47:09 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:d04:d483:faad:1e4e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724562aebsm24992091f8f.14.2026.09.21.07.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 07:47:08 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 0/2] arm64: dts: qcom: nord: add GPI DMA nodes
Date: Mon, 21 Sep 2026 16:46:57 +0200
Message-Id: <20260921-nord-gpi-dts-v2-0-4f297c983b94@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGJDsWoC/3WMywqDMBBFf0Vm3ZGJT+yq/1FcqIk6UI3N2NAi+
 fem7ru5cC6cc4AYx0bgmhzgjGdhu0bILgkMc7dOBllHhoyyihpV4Wqdxmlj1LtgQUVZlUR93Su
 IyubMyO8zd28jzyy7dZ+z7tXv/RPyCgmpzk0+NoNqNN2sSPp8dY/BLksaB9oQwhdLDsOOrwAAA
 A==
X-Change-ID: 20260916-nord-gpi-dts-40456500b7b1
To: Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=996;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=fp7fQreBnthImLz9yC7TnO8ACEl9OgIHWkUN/8arfvY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsUNlxYY2PQigrzQt/5uYl3xQNsxOP31Fz3cvi
 cGuaUp25iWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarFDZQAKCRAFnS7L/zaE
 wxz5D/0W6qUgy3Q2YpmDFDHj5qJgZ62zwjNuDXo/ngZFJJoRT9HbK+WYE5IoIzolInQx5Ax3EU4
 6rOmTPPn6fO4+W2hZ7VcaawIudNdD19WqMCgMBeYMGCpGk58l41zR0yGzIjqddpHPkRzdaZGlm7
 C1bvWWBaV+J6oypKzLDQxJm+VZXe9IO2hOu3rjtJXiqD6A4nfiXU+fOhb1/kk4BRfAJio1v/NqL
 S9dfvOec0FhLBLHzHryeSNRMRDu7VQEaNXzbmMQ78rrIBUwv4XwC3SPAO+QWcS/pRydAebhO/Nz
 u3RRMgkxSGSgXwRCfrHU77dk4EFvxkr6i3ZYXK9pFFadIvP4p6zgOtBJ+K4pj1/UPeEy4uh6k8o
 sB6J9a3KCawtNerIAutCkjG1sYFTSVc+hkgGIdPpfSTuePjhMeuSrLxzVqm2KApH4rRkovrAs7Q
 0BOipYi4tNoKJ4GXYV/3wnosnud2gB3BCu7mSekml0jlohKVnRnKMJTT6KFIns0zPpKFEQr1cLU
 WI1uKQ/0TcUdtuCcZKKJYQqd2yxV+RUoLbEDt2BbLXQMDebTHaNEuGiYqBDLYMi1Jesc3DK2xp0
 vYMZXqulewVLjHmame9xTttgM5OhicUTbtFaxpx5HP3/RbJwOrTkSiwlsYw2h11YO5dZ9Bjxcuw
 O0HOa6KwQ7A9hrQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIxNSBTYWx0ZWRfXxnbRgKp7vJNO
 SvPcddySA5wQlMmB3264gBDD7BJwZv8kYyVSaS7jiWdlm1J7TqWRAnt9XVoEWPCsPWMA/5mxo3E
 Zb+VfKjEQqLF7QHzfsQT5LzCqV0bQbnC3+Hw247sNkcGMUacixpwjw6LnxgJgCi3PbBhYvfWJ6M
 RW6iekyHVEAJKfIvcY9OkWR0Yfk28KpS1CelhsJUtZcOKoJi9e8grYKlAUr/P2heNjfJjBQGRMV
 HqV1ACMUup3Vohuwbhx/ZHgXlxzkOXqDz5TpLzqKBHml3yiL3cOV8ngW5UYkdOgUWzhCRk2WC2m
 AzlJueu03zZKE6W/cR+XfxnXCzmrWem//yxM+f6YiLeLjaiOX+7v6Uo2RvSOAv9jRbbSBCN13+q
 6vRqppNAIEVGL75m9zk9PO1j8SLoLCmYM6WvM8juQeYOX7pVsVNvpJcmv3JNdJByZgXvpDIjZ9T
 NCai6oJGRALEahH/GmQ==
X-Proofpoint-GUID: 3bLI95zegQxNhlQsGcCpIaWlaWmyI3lv
X-Authority-Analysis: v=2.4 cv=T/8Z3PKQ c=1 sm=1 tr=0 ts=6ab1436f cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=x_AYlYZoqW90jIegvs8A:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: 3bLI95zegQxNhlQsGcCpIaWlaWmyI3lv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIxNSBTYWx0ZWRfX/1EFqdlS+T7b
 cwE9Mr36Skg97rV4sGyuawP6CRLzkL5GoFJbIcx5Ld/R12MoVH5nSCLmYwQf6uL3lLW0PfQjbjA
 Q2OlFcOAzkoziS1EuotBMGw9W6Zx99M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210215

Add GPI DMA nodes for Nord and reference them from the QUPv3 I2C/SPI
nodes.

The DT bindings patch was sent separately[1].

This series is rebased on top of current linux-next.

[1] https://lore.kernel.org/all/20260916-nord-gpi-dt-bindings-v1-1-857bf9e84999@oss.qualcomm.com/

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Remove dmas and dma-names from uart nodes
- Link to v1: https://patch.msgid.link/20260916-nord-gpi-dts-v1-0-073e3f9c19d0@oss.qualcomm.com

---
Bartosz Golaszewski (2):
      arm64: dts: qcom: nord: add GPI DMA controller nodes
      arm64: dts: qcom: nord: wire up GPI DMA for QUP I2C/SPI engines

 arch/arm64/boot/dts/qcom/nord.dtsi | 191 +++++++++++++++++++++++++++++++++++++
 1 file changed, 191 insertions(+)
---
base-commit: 6abfe1f0063dc103de5be76c09cea2a25e332c20
change-id: 20260916-nord-gpi-dts-40456500b7b1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

