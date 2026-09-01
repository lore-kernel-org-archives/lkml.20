Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAFA35F5E7
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 06:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788242682; cv=none; b=AqmN4B7vwYdCT7R340+q0YZty4zlV7IUhJSAyXa4hMMlsRT7O8yn2Zi234p4uxofvJFrQbTWPFu/4bxZM8d/EcbdC/PNk7a2s5Wd5MMgPDkJckkte25bsId6nU59ST3DJ/y57oLXMxZvEMBKBfmqeFlb06REMlLR3cyX0EL3om4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788242682; c=relaxed/simple;
	bh=NzsD4QcajZOVRH4NV4GO2obUNyWXJF0JtcZuLN8XyqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RGAXLdzc1gFe0Myc25RsG8BvHQw4SDFdjVbIIGcHf+guFHCyMSOBMrkX/AEUy5mGxISfEsWsRqRVibaC+zozezY0zKIkXRqtoUEUhcZ9TAN3p66z0ZYMMl4NLFhPNsv3Zmf8qvnqqe0PGu4qiGrihdWUEvfo/i4aQ6IZ0+UIU2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fJR4n87e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I0MBZq9V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fJR4n87e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I0MBZq9V"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6812mgq81132734
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 06:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yxOiia23GtlGiNnaYrLL6nmn5DZZAppKMl6jIYoOE4E=; b=fJR4n87eqUAAMu0w
	dHoJjhk1y7QoSxuuUPx57GfNNBVTIg+MAa8WtGYdWIXTFMsVJI2+ZIiO+fHkJY2Z
	3lzMfu4ao33mXvpJ5GWwfn9aFGGXkKqB2C/ZQ7eTBTPK3tY8NSgBCrJ9mx9uy4qP
	qjqFtltOjR8CRWVuCWI7S1RAoyAA6YB7JBN7RCZiEra8uPGUpyos8dzC9nHTDSa4
	/76eAMAgbi9X4d7iM4vkyGGRW/7q9xAtVOWRPfP3wFqnGH0YYzua+kFgGzEVSO6j
	5sIlHZytlREX70dOOLe9tcKdhSkWJe5Y4MNRdad6mdFT0t2EotiaX8/Ja7kO+FT+
	vI0VzA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp8frmvh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 06:04:39 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ce7dff6253so6946075ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 23:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788242678; x=1788847478; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yxOiia23GtlGiNnaYrLL6nmn5DZZAppKMl6jIYoOE4E=;
        b=I0MBZq9VO8KQbOgtZ8+ehxSAAeMX4ydwni3PV8vy6Ab6Y6FbwVu00t4dFJcdMeBZ6/
         RLxgYlv7G12T9GgYGLTsrhRSAv494vx4ab/MiHv7NbjplvWccb0XMzmUOFkazltyROGc
         J5rw6LKS5frp27FDOKS4wMz3IOQBXpRD3wv2Vr5HvhuHp9RZKQe1xmdrdxD/kBtSYgTp
         5umE40GCRJPvxrlLG3sJpMWfoYk4fsqbKGDZY2dezhfMxXVmuAly/ItyifKkB5/+q4QX
         x0qHRhtoQxPJen6ua7Tm+gnxCVuL2G9xzgtpZp5CRo0K6vEOl3b6AL4Ab3/ioKPDNmH9
         yEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788242679; x=1788847479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yxOiia23GtlGiNnaYrLL6nmn5DZZAppKMl6jIYoOE4E=;
        b=IOnnFjdGUHriI5ccVAq6+/pXgaSbW50VotC8liWKS9Y2S4lockvsrcZGcT5/1ow/kh
         pDK4tihk+0DapvBFSt75zk885SzUSLVv2AoCdZR6J1NgWKy7efs5wg4LfJ0+LrALxb0A
         Ej5F1ssl2LlS9ObRfViF0DTCef8hU3v+kkXFJkOZG3zccJGnTP0PcN+yjtnak+eE3aQp
         CKnL7yWKGq31Zny+Th97eBxChifHY0ngEi9XWijYsJhf7hwqXcu+s7Mu1EuQgVwuXJl8
         6jKYhv+qblNBOQSlNUu/iiXl24tP1I4PxgzOiOOzrNgDczx7klLidMZ83Exj/I7b64HP
         8PuA==
X-Forwarded-Encrypted: i=1; AHgh+Rr9+ykkyZqu9JbKTNuuMOaf8V8SHKEjEEdC2SuOqoAj4tyb/LdtJo+NqTm5PJmfb/pzr8fXvlsDtr9gY3o=@vger.kernel.org
X-Gm-Message-State: AFuF++l7QM+QIaGukWnCS/uLEA8okq62oUOlQChww8HeEAJApzYl8vXL
	fdo6eJQH6sUd/G21KZTlLNgl2HTuU75euq8QodkF3eE5JPdPpn3rjVBTqKw8N8fRnDUPT7d+2J7
	oFDN+0bX/NGV5a4/15CEzj88lNX9ubncdtGYPSbdGbz2no2sBoZA5lkrqwH/O8vPeDnwgUXe5tL
	g=
X-Gm-Gg: AYBFou0LotoA3ifUkSH9rAx0aBJL+vVPZYr9YP2Sa6c6W9MrJKKx4sY1uJEQSSnlDiI
	vgfAm8fnFyhv3GhCjf58K1/9cdru5/2nj4nF4BwFj26MCr+v6BqcxgmhonCXNjcRia6B+/M4Hou
	s/CdCqcmd+xMnC0H+sf9NQl6P3Ty21lvOiYupvQUOhl9nKYxgJALNGF7C/VRuYrfFpgbmbAQZDE
	JE4VJ1tUjT6zSVYOCWfqSdRgD3JHGIqMlOuF3CYVDlG5v2M58luML0Ad8MQVwH/uDyH4qRBlDqQ
	w4Fs57WLquRE2gSxwWjsck05tDdyKG/8Ktu+0s7z/dt8RnfMKvVWL8FvzaVchbvTdeCzwpJj8Bk
	PMMPvJj9wVF5kb6/UhURpUpsOdcKwEVDRURTR3rE55rEBHoXZHllbdMArxOuTxnY/MmybOMPl4v
	Vu/9Zk4M2ENPie8Cf8OWCUqXTOsk+uIw==
X-Received: by 2002:a17:903:98b:b0:2d8:d4d2:d138 with SMTP id d9443c01a7336-2d95295bcb7mr34998785ad.20.1788242678551;
        Mon, 31 Aug 2026 23:04:38 -0700 (PDT)
X-Received: by 2002:a17:903:98b:b0:2d8:d4d2:d138 with SMTP id d9443c01a7336-2d95295bcb7mr34998545ad.20.1788242678142;
        Mon, 31 Aug 2026 23:04:38 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286fa20e2fsm35855800eec.28.2026.08.31.23.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 23:04:37 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 11:34:19 +0530
Subject: [PATCH v2 1/5] dt-bindings: phy: qcom,qmp-usb: Add IPQ9650 USB3
 PHY
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-phy-v2-1-cc93d2f3b1bf@oss.qualcomm.com>
References: <20260901-phy-v2-0-cc93d2f3b1bf@oss.qualcomm.com>
In-Reply-To: <20260901-phy-v2-0-cc93d2f3b1bf@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: ndYprWQSUENhA3UvdyrxXiVVML7xTV-9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA1MiBTYWx0ZWRfXzGZXFHvtWwxx
 c6wvJk6JMDAzckux3xsjGLQVSZvR/Uip9MOrZHd5ic00DX72BK8nCqo91CLY+qr+4pd4XXNmE8K
 H6YuYow8Oss2EzBfkobecLoi0i2yTug=
X-Proofpoint-ORIG-GUID: ndYprWQSUENhA3UvdyrxXiVVML7xTV-9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA1MiBTYWx0ZWRfX2R+xfrsqFlr1
 5gaiFKAqRD7S5xSK+Vit23oajk7Rt5CGGKPLgth5dICDd6McR7RpJ2umqITxZPkQN2q6jWwRH2H
 JpET/PEORJpD8KxMmvIEmLAiKXWqauhyfKiGmgBN0Ac1n/KYuJqSrL31LYHNDw/C+3Iqwvf95YK
 WayvYbh1QtGXegJ2UJuB6PlDVPIfRdCX2E10m/qROIdnpwLfxh3OMJQ2V6PhF9iUqAXhX+IByne
 rxB+MGSVWTCfAesHHvPgMVw6/5YobMj2Wb42ROnwp/2tL0SPn4VzQ4o9VT+roFkeoiGhSM0bGpM
 iESMTBhghstKUVq06ZAj/IRdpwbbAKIPal28ybvv/rKZMf7Eo2UvA1eiIsAgw679MYaF9E8ADlK
 9QeqSaI510d6dZHClGr4L7T1NUCEIrfbe9bl3GLnCtrZ9FxnogqUkPZk1PsC5dr1MBG5ybJnIjE
 RyMXdSvScbZhbdHWTgQ==
X-Authority-Analysis: v=2.4 cv=BPWDalQG c=1 sm=1 tr=0 ts=6a966af7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=CyeWGLuohibXKJY0YOUA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010052

Document the Qualcomm IPQ9650 USB3 QMP PHY compatible.

Use a standalone compatible because the IPQ9650 PHY has register
configuration data that differs from the currently supported SoCs and
should not fall back to an existing definition.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
index 01342823e57f..746c5a331f48 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
@@ -23,6 +23,7 @@ properties:
               - qcom,ipq6018-qmp-usb3-phy
               - qcom,ipq8074-qmp-usb3-phy
               - qcom,ipq9574-qmp-usb3-phy
+              - qcom,ipq9650-qmp-usb3-phy
               - qcom,msm8996-qmp-usb3-phy
               - qcom,qcs8300-qmp-usb3-uni-phy
               - qcom,qdu1000-qmp-usb3-uni-phy
@@ -102,6 +103,7 @@ allOf:
               - qcom,ipq6018-qmp-usb3-phy
               - qcom,ipq8074-qmp-usb3-phy
               - qcom,ipq9574-qmp-usb3-phy
+              - qcom,ipq9650-qmp-usb3-phy
               - qcom,msm8996-qmp-usb3-phy
               - qcom,sdx55-qmp-usb3-uni-phy
               - qcom,sdx65-qmp-usb3-uni-phy

-- 
2.34.1

