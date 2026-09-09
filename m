Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69AE54488C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 11:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788954530; cv=none; b=hzEt4iBhdOZf1Jb8mqz5KiR7zbG2sKfNlGG45RnO2pFguOdvfwQId8UJggfs3n1PmuNvmVpybn3bGrz40kL/syeFk4lphN3Zzx2t7yI9oanAXxwtkiHBQVXatHVJC5flLUBHqcY4qEjOjmfsoqFftJ3E6/NMlGjzbZzrhOBKzY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788954530; c=relaxed/simple;
	bh=9ql4uJf+bmo1nNNjIE6D+tbj4KJVSk+Obl363fXcddg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eZEk234hMFJ7tnzrLTY+i7ewXzTMwsWB9d0Jjnr+1FhqVgB46OVgrblB4kwc6YpgEBrxrxGKrkaAEUYbnd/v2g0hYsj8sJgK7/5/AxsdgNFaPDNafti371qa4AbOzZEPBk5pqiuKL31RN7DYAL+uvgms/kBCIQrXAA+YsWCFfjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bGjfqDix; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h1bQAWkN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bGjfqDix";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h1bQAWkN"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU2ZC1810053
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 11:48:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5ptw7PO2IxZi34/R9TCTZRFlXTJ7+L0nCUhyqPDnhdQ=; b=bGjfqDix/tOmRuCp
	DwiVFyVxJU9onH08g6OhyrXvMKY9ZeLHlA3xj68GqzeUVgsCDENmta2l7Je7ut7P
	NULOt96MDkIrpGqfG0kN1wAwTWhPVvCmyeUECZuCFVR2xjQz2wDFglxpRVfEyS+e
	tJX7heNcIMTEWi8OkTmdJBem08Dhsk8jC/jNH/c7Ac39TECUN9Msm8kAslHyxTgU
	31UBEPN2z1S5kB3SuxzfPPsUSg+hJN7dxxuPAiGTmekNjALwWtoqXQx/1ehChCV9
	XYmPscY8Qr5SvdMN2giVIXVSs332mR12pshk9Zo1EXvCie7xV2E6uRfmGEA86IPp
	ErzrDg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk4xj0ft6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 11:48:47 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39b6416441eso6378765a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 04:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788954526; x=1789559326; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ptw7PO2IxZi34/R9TCTZRFlXTJ7+L0nCUhyqPDnhdQ=;
        b=h1bQAWkNxdOA5xAQubwyUJBUmZFaydbZ0o9EizKFVcaYaUpGrZkZGp2lkv9QZiSvvs
         tI69jZF8mQUuHPHZFviuOOAPCr4Sm0HOnAJbidkK0ZLLhIUoVfBlkxBean0HCX1cUFJk
         kZo8LREbYthET83Y8z9SltOXuu8a4nXX1fJJ/BUVgQ9J/B0J3jyCTrZ7zJSy4/Linmf6
         A96DmHtPWyCD9I9Fa+vd7xyro1/bKtLWuwXZxJuDe/kjbFpokTN50IpeGqyAiQ63Ve4I
         BcIgwSOeA9yFL+BqaEos91sbar9w61SekzfbaLdEAPZWtW3WqRhQVcb4EZQUQP9kbdwL
         K0eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788954526; x=1789559326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ptw7PO2IxZi34/R9TCTZRFlXTJ7+L0nCUhyqPDnhdQ=;
        b=n2UCgIjVk2Hdk+5+PKix8W+DtVAGsgoHBViUX+yM1c5T+d9aS6nMPYdXhp7wlFl2i2
         gbTrhdBfj92+oK4g7OcPpGAMDGnYqipKmr3/iPU1PofZEoYz04elhq5oAdAIeheI5F9p
         fyPw4al7DKn2chrsOCc2uRS5J1LwGWMqvmB3w+wtLxEne9dPGr0YdTZb9BiAkgIYJeJY
         CEy3531ao3jz6lcu1N2v4YvMZ0MhGM5ajPL7sXNsAhX4X1XRjAlq2M0ZLMNF/7OjynJ+
         XfYxWgnDLtWa9sKWTltW6+d7yzA7OnzuaYqdN+hw1rQxTL83KbXurk6rdr7RPjCkCM7m
         Rb/g==
X-Forwarded-Encrypted: i=1; AKwUvBz7gSZH2v13YoH4NWbE3fhW/QQyQbGJyQCtnnx1uO51xBMqFJrdtULSotltNzzYwWr/m7GIaD0B9WNrMCU=@vger.kernel.org
X-Gm-Message-State: AFuF++k48H/tZyU2GYC0XJouW0Jjj6u7iP7fpywGCWuZsS/7yvc/CitP
	9+9rcun5/Co1hjPhZF/s/IfZiK8/f/IYTmbe1bp8v+Kbr1VgHExMeLiK48CBGZ7htJLiz+EBA6n
	2cJ/p1GDyBPpX1DR0csrLPUQeSDIS88RDGTSlR/7BcC5JR79ptURQK/XQsPu16TwTPiLVmIpi8z
	Y=
X-Gm-Gg: AYBFou1vg/wsFE9Hz4gydr6iY4VKTI1pS487MVqEcy8khEVG9beVxF/8BSN6q+ifGvO
	nj1h9jPHEiG5ieWPkli3JYBowEEiDua2e4QxdBAnNZqXGYSTJl7x4f9gnuNaWDTH2Z6rk46BZYj
	dAS359NqbU/kfAYrqien36VIllwRj6/lONuZMf9w13ubOY7RZ+2TQuYJuyH6/xeseYcMZMjkR46
	Buq7M+NRDm62spF7vvUEgIYnVnJIblvqpAWiRENOMOJydoy0PXMMcHQQ0A8fM6Gypet1f1KpSnh
	8UZXfHdYa5GCbkAj+ALdFJVVF6sGAWGtOcCAy9GgnzUTQSyF5FfvpqlUuMQHtpSh5otGcAQx5W/
	OKGH7I8fFuJOG66RhaxkMJbKwQtOZ1OojZxY=
X-Received: by 2002:a17:90b:4d82:b0:398:bacb:1137 with SMTP id 98e67ed59e1d1-39d70b1c7demr451412a91.19.1788954526494;
        Wed, 09 Sep 2026 04:48:46 -0700 (PDT)
X-Received: by 2002:a17:90b:4d82:b0:398:bacb:1137 with SMTP id 98e67ed59e1d1-39d70b1c7demr451338a91.19.1788954525966;
        Wed, 09 Sep 2026 04:48:45 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm50156857eec.21.2026.09.09.04.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 04:48:45 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 17:18:17 +0530
Subject: [PATCH v3 2/5] dt-bindings: pci: qcom: add Nord PCIe controller
 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-nord-v3-2-b0a82721c547@oss.qualcomm.com>
References: <20260909-nord-v3-0-b0a82721c547@oss.qualcomm.com>
In-Reply-To: <20260909-nord-v3-0-b0a82721c547@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, shengchao.guo@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788954507; l=1017;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=9ql4uJf+bmo1nNNjIE6D+tbj4KJVSk+Obl363fXcddg=;
 b=tHX0LCb+5Wt1So4bJXxbiVPpqbP2gOaAqHp8Cg3P+pLnlwY8fy6UkI5XFgrfp7cKloLGT8Qan
 L8Q6S80Gq8LCUIq/jcybPpijg2GnFOynErCs3iFo128QGtDJjWYRbka
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfX19IjrlQKqUkY
 h5rjs+nSzcX73NS18bZ73eP1hCwb/GRdS0d1FZYoPb/IazkhREZl+AeNX/Z/5P71Ppnlh1KhdWo
 lPrSqwKBr7AtRG9fkRPhpVjul92OzIw=
X-Authority-Analysis: v=2.4 cv=J52aKgnS c=1 sm=1 tr=0 ts=6aa1479f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ly1VyIkaSgMpB_u5KqwA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 7m9BISvIw3XGZiTgCB96h260UC6D-YLL
X-Proofpoint-GUID: 7m9BISvIw3XGZiTgCB96h260UC6D-YLL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfX6DEs5TOq0MuQ
 iFiIX1unVkn1Z9v9yLO4DFp12dUCShzkxobjCm+SMskKFdXhWYdgIHnm5lQdcMgTKfCykaBu31Q
 DgDwFa2Zwbtfr/6kAHxVZCOFUrTP53OhPmGUWdK/P/V9AL+zk/aC+00YPUxqWXNvvEo73Wuh4UL
 FjuQe00Mjq/q5mx7OZIA9HHVHXWnEyWQwuPo7oA4VH35jDeXHoUDXZjlzMH5ESjpfSnNBKJyay/
 6G8/AzSMNxM1XBzjdJGW4H4135mYeAIrFasdkDOvB3i1DH68fNV2aRGKoZeTJfsbtvmOvPwax+V
 okG8sGAXWBgecUZ/ZiFKjuecRtb7szWv0Hn4F+9eiWtBLj/dTxGkeiwBLA6LYZjJA100vIVWWdK
 9Ei4e68XY9f9AFy9sIexAfGYdgElaeJek7Qu1kAVzZMpLCoVx91oPI5xB6Y90oiLSd3NzLABO4I
 xNMlwubtiLgxKmdjtpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090131

Add the qcom,nord-pcie compatible string to the Qualcomm PCIe
controller binding.

The Nord PCIe controller is compatible with the SA8775P PCIe
controller implementation and reuses the same binding definition.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml
index 63630a814f28..b8ba2c4449b7 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml
@@ -20,6 +20,7 @@ properties:
       - const: qcom,pcie-sa8775p
       - items:
           - enum:
+              - qcom,nord-pcie
               - qcom,pcie-qcs8300
           - const: qcom,pcie-sa8775p
 

-- 
2.34.1

