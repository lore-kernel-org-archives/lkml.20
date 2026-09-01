Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A50B377553
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788256294; cv=none; b=TYSBzU81JPVj680fRV6A0h4oGZVsf5hr2FrSBM4bM5YKID5Y7q9fLTGUdfjycX8vesP0RAbr3ZHCwM7++F4x0UAzVhO7ZD7Hk95dKcfNJKZFR79HUxgUWIyt0uLIF3Lxy9+DDnmXBu8x/R0VwJApKmOT4e9ZutzecvpnSwKOusI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788256294; c=relaxed/simple;
	bh=I2fDkzNify1UWFhvkW9uADxCcWHQwDRl3GWqoKy7/b8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rF3vnWwakj53lkKIHaTww/wfSCbF7fIn7/5PzAz5XgKstFcA7loLaCVoG5zY0FrMC8zORTEm1AmuCyLWRrEIe7fntCgKh/OPxQIeG0zt1LOzD/f9drar7yeUvvKRC3qNvMCA5mkAw5d2rnSW/bOtmEV+Ordl58509xt0nGVo3IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BKI+A8mz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AdxNlM9U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BKI+A8mz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AdxNlM9U"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179Kqd1335435
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 09:51:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UvKym6aHIK7
	EK8GspRQJ0SdMsn7ujRvAUZ69QOH0Tt0=; b=BKI+A8mzQyOyxWJF6Pr7gOITDCG
	YXMBxzDOwswcI5+N53qt4YHv7xEhiuLZTFgTNMh2jjLEeXZO8YqFRMSf2nuR2NKS
	BeABuKWedVawmbGPxGXFeqf/HJkus2Vp0I7fcmmst6LEgcj1sL/xHkbMwDroahK+
	dNxMyg1WF/6qLno21vswqpUG7zlLM5V6JfOcXmoqVIpW4dKMs9Wn1uFU+6K87SeH
	30ODe8Gq7ui/mX9+vbo2QW9nsiHDehoXDvHu/8vVk/NZyzv53zWyGd06pe0HFfis
	uWY+TPBQwLfI1OoAWz1W19giUo2kWAS4Eetln7hSQ2cPC3ZDbzOnmZcDXdA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdjtx2ggq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:51:32 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-385d2703b64so972386a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 02:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788256291; x=1788861091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UvKym6aHIK7EK8GspRQJ0SdMsn7ujRvAUZ69QOH0Tt0=;
        b=AdxNlM9UQsqJX8D609tTo6R5uHB4AqsJnkgIM/W5TdzHJuq4qvhI1HjqbR5aVeQoWy
         dlh8h2evhufzVM+Mk7cqN5h9eY8SD8cxYciQMikCDrAAAolC0M655Aibl4MLKOoRnaWh
         4wXrj9JXyzr3cUOURvCS8paZ0jvxkhtDo08MxJzigXKwzItuSl/7q1zXz8sujiZbjU9J
         FbpTec/0Hw/j+dcrDN2+10hU2PR013CtxgxrixFZElsQzfVxVCfDfYrJu7ftHqm0HJ29
         iMSFXw3KXijLYyPKc1D9op5ilM+oJDpkLTxjolBYqaxfFDyzYoXFjH/FSABDYmuvVmpi
         BN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788256291; x=1788861091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UvKym6aHIK7EK8GspRQJ0SdMsn7ujRvAUZ69QOH0Tt0=;
        b=NVHqX18hgqp9jTtcinohCwTNGUwRtTmNX3WSoDeBro7JKpbE6940IW5EPzx7hWLTfV
         EEYAXVdHTM6hphtQn5RZ4GQ4qM88j3JsBoUymVG1N0nH3eKsjIDpntxhKjFjzx7YfTJ7
         4qld9/4fXm+dakYNiNde74PxejpIczsAOiS8Cd6gr/KGJEc+VqnnMUZKxEiLBTolnbmV
         zuEns5c/Eh+n9zlUxmWOBE4IP12bbPYNUQDXhX5QbXwKgmHdzxzU2ovJm3rJr4V9735d
         LOyY7DUxDJAlmI8sDGNIZRIKW0oggCZi5T70JMf58ZygdPihLtWAQMNlrz06wh7hWJ2a
         2EbA==
X-Forwarded-Encrypted: i=1; AKwUvByr/vdD71XDZL+PxWppx7UlAIJXunQm0WBJBPSeYYZ59qshGUbK8/QYum3WAE1jFYdYP5PfNqaqLkUWpCE=@vger.kernel.org
X-Gm-Message-State: AFuF++lXulypWP2fxyfWQkJrDHDDnKr3lWLb7Wk7i4VNmSc8dCJD3VDe
	UkVy65uw2kkWPRRsLohEUgqOGTFFH02tWstsSfCf+1So9rYyWT7YrZdFxYrRattb8EgGko6E+iK
	CnX4mfjdK17K+vGLa87JKv6rT2U/p5IHOoZntTgN9MVdft3ADfBOaupHXo+D3+Cd8RD4=
X-Gm-Gg: AYBFou3vZaNytMNpGwff35c8AXjyvGCJIiM3gKC0Fua2l0P8HZIDjPvL7/qnvdpj7p8
	ltrVTXXv776Rs5huZnOoMMYC9qPGlElw15Qkp76Lr0cd6CoIHMh1mbwGQL/pa3KO/bHcw2Y6LZK
	S+BirDuNUwyico7T/A5Q1trS3wTwC1mrsoywm/HWqWrxWLbsONFhh916xV8eToNwmngNT7RFDFC
	58/x7Rg/I30zB3ZzDD3Rf40utRt3NndQ/7wJvaD42bnAzrjOiwccV0g9+gMmKVpbORRd+keOE/n
	ET5MzHx8JApHjAhKnuKahKIYsneZfYs90ncgCEFXrDI4nWVielTWzMzUC7LsPmDGosZ2O+Kyj3x
	zIFswOwr9v2m1rrfU5cdmjKrSsUlmitAEzQFYqqato7Qk2WRnulOKdkj4Fm55
X-Received: by 2002:a17:90b:1f92:b0:381:10a3:8b10 with SMTP id 98e67ed59e1d1-3990f78b130mr4966300a91.14.1788256291393;
        Tue, 01 Sep 2026 02:51:31 -0700 (PDT)
X-Received: by 2002:a17:90b:1f92:b0:381:10a3:8b10 with SMTP id 98e67ed59e1d1-3990f78b130mr4966236a91.14.1788256290969;
        Tue, 01 Sep 2026 02:51:30 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286fa37fa5sm40641466eec.29.2026.09.01.02.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:51:30 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 3/4] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Document the Nord QMP PHY
Date: Tue,  1 Sep 2026 17:50:54 +0800
Message-ID: <20260901095055.42229-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901095055.42229-1-shengchao.guo@oss.qualcomm.com>
References: <20260901095055.42229-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=K78S2SWI c=1 sm=1 tr=0 ts=6a96a024 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=ukKPufHZZ26NhZEM1hcA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfX4aaQzH2gRaQy
 6bknUm8PgWIqIlg6C9QkZziMuZviOs2OvcZia5T8SqNDQHAZoukDEZDIcbi2CLS4BRzowCrly4E
 eovQ5Tp3x+6QMWU2iIs47AA0zaxXjnE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfX1Gu1BpbvB7Gv
 wFStGYVGCv9pmW2FTzmobBmZ8Miw84rukZikw0POB58xpF00dHNdWtQKim3HDG+b63nV7gG3eER
 DJtoWpLtd18y7gmeheDM7i09d60inWMAl2G6PaVB7V6ngiXqIkdDcJPO/QitiupRwklHtfZbRO8
 GLa1dTC6hHd7ttv/4ESJ3Xi4CcsuqPZB9VOxg/vt/ajo7GbGNkAzUvKgmy/yNKw8CXeuu8utsHk
 TCdbY0Jlz0SI8/NyOYW4OhJpQExITXcvnxI4Yth4S1V4BibGxvhjPtR5c4Wu+qpTa0fiNAGbx/Z
 1rKQkdOBQ4woAcP39HVZMkPalRgi3kx9FOz+8A9nwoi1jFlmscgjwPZtEdxa8IAOSYEQJxcncQV
 fYu03Id7wLrYqgD3hgb5mpHegQhFBs673PGPuAVrtPdaDodtMNnFTb7tH43DNHzBLN72Dzzohkh
 Si1eDZrYqjntJ3Ob14w==
X-Proofpoint-GUID: Fa9vlDt15PcxbigLSLmKyyZnsYKLOzuU
X-Proofpoint-ORIG-GUID: Fa9vlDt15PcxbigLSLmKyyZnsYKLOzuU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010087

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Add a compatible for the USB3+DP combo QMP PHY found on the Qualcomm Nord
SoC. The PHY sits behind a GDSC, so also allow (and require) power-domains
for it.

The block gets a standalone compatible rather than a fallback to an
existing one, because it is not register-compatible with any PHY already
described here. Its USB3 and DP initialisation sequences do match sm8550,
but Nord places the sub-blocks at different offsets within the PHY: it
exposes a dedicated USB3_PCS_AON region at 0x1e00, which sm8550 does not
have at all. Falling back to sm8550 - or to any other entry - would make
the driver program the wrong addresses.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml  | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 8adfc78108fe..b5ccc8b4d8c8 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -27,6 +27,7 @@ properties:
       - enum:
           - qcom,glymur-qmp-usb3-dp-phy
           - qcom,hawi-qmp-usb3-dp-phy
+          - qcom,nord-qmp-usb3-dp-phy
           - qcom,sar2130p-qmp-usb3-dp-phy
           - qcom,sc7180-qmp-usb3-dp-phy
           - qcom,sc7280-qmp-usb3-dp-phy
@@ -212,6 +213,7 @@ allOf:
             enum:
               - qcom,glymur-qmp-usb3-dp-phy
               - qcom,hawi-qmp-usb3-dp-phy
+              - qcom,nord-qmp-usb3-dp-phy
               - qcom,sar2130p-qmp-usb3-dp-phy
               - qcom,sc8280xp-qmp-usb43dp-phy
               - qcom,sm6350-qmp-usb3-dp-phy
-- 
2.43.0

