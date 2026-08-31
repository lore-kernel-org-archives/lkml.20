Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1793C3F67
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788161193; cv=none; b=N1Ggg+yT9VPTTEANdjZWA2ZGkOroCrKjNqR/DjopewJV/P+0i5T5MgEBFHV6BDLmS2XZL6ufQ1nMj+qeK4Rc22k2MLCqG9x1bxpTwWuRkBMmiuMpFXO0303+CURms+RYAkimTUXOKcpwl8IiNis47fjoIQNjKreet2D4dBiv/VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788161193; c=relaxed/simple;
	bh=GecsPtDzBCsWNuDkEsU+ZgpETbYSghfoMtZfgts9qAA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BAhCXJhcuMOwybjx4vumJYmiItLtKqit9MmanxnN27OxjDlVzV9yFb4Q16HSj6QxXXNysjKQWVIpG7qQgdwwUJ0Hp+BdvMYes/9JZ0XZfdkVuedyI3sxMlxsW2HH5uG+EuWaMJcKQfJqqV0BBZ/G3YTg36gdrOOAnjzxVD4BtrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cb+W6Ypv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ln4HFOA+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cb+W6Ypv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ln4HFOA+"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V75rks3543654
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:26:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GCgClY81I44AjvbZ/aXoo8VK5dN9dzyBFnWzQ9hfEIY=; b=cb+W6YpvtF5y3yAX
	6rv+oXd/Q+wYrFm2Yws/rl/HK2EjfIoPbxBJtMqDwQ+JCI732Mfj8v5dJIT6Uxcb
	9HQgyQrV7Kr1TEn514xea1pMVxR7b+LRX/Nv8oWaRKszT7aArUrkQx6p4ur/AmsO
	fS51NXhrRC8itp+FNwS75r939xLjcCMl+Lrao09ZCUmh6IJ6vEi6Yk+8YSEcXNEZ
	oiWRDeWJeH1COoI7yOKlO3PxoTz6o2s8NLZrw5YPIKDN1cG1g23tHhxBkEf4u9xZ
	w89shjs6k9ZouofbOPUZlGPCuaRGsA4kHuvY5oI2qj4Xq0n9uW7m0wWcq38W4wdW
	oezlqA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd4x082q3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:26:31 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-396638f9a18so5514181a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 00:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788161190; x=1788765990; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GCgClY81I44AjvbZ/aXoo8VK5dN9dzyBFnWzQ9hfEIY=;
        b=Ln4HFOA+AEzwNgWut8dEXfXNpPtujQ4SCIyJpoCUCfd5mCt0z27UE7nN3sp07RtXup
         O0ta7uNe1YLDuCn8KKWrP4Xip1aQCMwtN/RVD4MsZtD1Qb3G0qYUr8fcrJt6cxfw26QA
         OCpxep9fHINbmCstzVUoRVBN1x3ZF/D9OwCqHeJOvwPsEu+66vu5x59mbwdGq5XNsDTW
         ok4BDW/pOsw5rzf/4gpy1IRksMYn0E8NSqijGRYUr5mgWYvUYg2RhmErZHGAVOF+U3tx
         +00S6LdLlUkl6FvVYoYtsGwUQ7fbGlYciIG0xcMNS7Hjk5YP025MRjli5T9shzvPHTvl
         7ScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788161190; x=1788765990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GCgClY81I44AjvbZ/aXoo8VK5dN9dzyBFnWzQ9hfEIY=;
        b=m+JKoYHa1CgG/H1DmAgnpQ8qYSYYbOTxjBqydPhEXtY7wbh/FUIHxc2Cv01c82/Lvr
         1fA7O5VnMbqWdEWUPw3CoKm1BaVvmjCD+//d8TtCCl0EmHNArSNZEY3uZRP0M8dIlXui
         zrskI9+p1Gmz8cld0ZI8m2WLwE26lBm8Duxmm8thuMXOaO/2yyF8iVw80NNk2DUQVdQ6
         9pQNaXnY7R3ScDXUYLrDkt/LU3q2oOlDbK61QqUNBr92a6pu61LSkNWR584MM5di7lVT
         fur2Bx9u02SWeZrfP06Wux3OVzjBGbnOtBVToDBLcKAVUokJLolWMJH/cfweDto3UiQn
         Pt+g==
X-Forwarded-Encrypted: i=1; AKwUvBxOcwWdkqZO334NQgBDrB9NfCQWA21txPss+KamXh0pnzIzQ3Oxwbnjbkdz7yGwriC5IHuENw07B5rDHpQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mWooTg/+Uccj47TCYcK2Y2DddPLvuAECoJlcBUgDDBDDVs+hD5
	1R9GUSI+OpoCEEZF94plZfKD9SCTz0g5WvWAHGgLd7/BGTXcicbGAWNXzxRdR70S7NmuTLXZIzt
	aRym2s49c1SE/K4VN8YNcRo7dALt6sw7R/jUBqoP+q4J9OTzvGVRUze8Wahecle421sk=
X-Gm-Gg: AYBFou3KRAxIa2xvCNlQeeXoApcVhLyD6/S32x8RUpZ2jvHCxpaw0RdTt6hZbhe+f3v
	+8shmK1lTC5+NqgxpC7yPKRFUNmHhhoK9Heu+eiMs4bFp7lMLfZjInNlkZX8aPN/CfNYX3yxhRn
	7qKuavRbRNx/uB5m9nhMUcRK2J4xgxVJSkJ6i/TL+2xWeHZULNaEVFluLbMDbswARMpOzpfJ2UH
	GXGxvS9orDoRU6IMUejnsceH7TaBnUN6Pd+vx5yc1p13som6jt+4v1Qv20MeF+ziIQZUfvfHjUm
	M/IOvq1oMc0U0xfXTj5Zq9Wvot2+thSA0t49v7dDP2y5xNLXGeY61q476puXNwLvfvbgZX0MNCs
	0tCMEdLu5u6RydlF2LIwHlqh+ShbHvDBn3ZF6
X-Received: by 2002:a17:90b:1a90:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-396d0f8e80cmr34398738a91.10.1788161190464;
        Mon, 31 Aug 2026 00:26:30 -0700 (PDT)
X-Received: by 2002:a17:90b:1a90:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-396d0f8e80cmr34398691a91.10.1788161189996;
        Mon, 31 Aug 2026 00:26:29 -0700 (PDT)
Received: from hu-sushruts-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9595bbsm31327059eec.14.2026.08.31.00.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 00:26:29 -0700 (PDT)
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 12:56:03 +0530
Subject: [PATCH v2 3/5] PCI: qcom: Add support for Shikra
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-shikra-upstream-v2-3-406661d75afa@oss.qualcomm.com>
References: <20260831-shikra-upstream-v2-0-406661d75afa@oss.qualcomm.com>
In-Reply-To: <20260831-shikra-upstream-v2-0-406661d75afa@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788161164; l=854;
 i=sushrut.trivedi@oss.qualcomm.com; s=20251127; h=from:subject:message-id;
 bh=GecsPtDzBCsWNuDkEsU+ZgpETbYSghfoMtZfgts9qAA=;
 b=55ch1aG1G4LspPpgrm0K7D/1FVbflwomwl/UnDiUlC25zvssra1xrNLuTowwVyhnQIx1T7i3y
 BD5Bn6bEEdKCCwrq2EXn6BNFfR1UIiPZkXZLQs7q6LSnHDVPq6rJGyE
X-Developer-Key: i=sushrut.trivedi@oss.qualcomm.com; a=ed25519;
 pk=OrUHTxBaSg1oY3CtCictJ5A4bDMNLRZS1S+QfD9pdjw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA2MiBTYWx0ZWRfX4WufmNdUSrfR
 iUENJ2C+svyArh2e7cWLSErlGp4COjZUhUecLc9F99UpiQGuwgo60E4UDHRk0Cc9xuddmK4GRZA
 48hOtBufEDZcO4D+bAXGjo3AwMXJ9/I=
X-Proofpoint-ORIG-GUID: HWka9oXOjRM9RTsgZfNy7xOUm26ql69K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA2MiBTYWx0ZWRfX0oXftSrzQnXg
 8sHyh7DNUFzREn0gDwNmaon+TFo9uGNrHLzH1l4df6c+q85Bn+Zdmca2rAIQWlgUIDT/DtIPxip
 EEZcOJHRRY3uu2ukoxFnfHpv/aLRaG9uEy0OM6RUpCTqlqyXTjLkvU+zj+KgAnbT8I1KNluihnX
 1jv3W1+/Zo6fPN5LrWVB+DCL8iid2kUFucYSIcV2jfXpVItlMHo236uXEaP0tKkvPzTXk2lLGds
 lawmb0qiW763MVpsEYGJDhh8g9Tne8axytkCRF0z1UqAQz6AJsi8G+9CLE8wku1t3gV8WxpcrYZ
 z5w+RwzaZH1M58VJD/KXNjpMvsuDGKsduHHLE0xid13ikssUy3LsSN0kJ7Rcd7kRwPyL0JIT2+V
 zhnlCltHpOA5kpy/2Y3mf1oQu2qkhvvS7m4r+mSNrmy0GEkMxR9GEnBZBn3gKD3l8rnBbZt15+W
 ilm08adVRdtz6PePdTg==
X-Authority-Analysis: v=2.4 cv=Iqsutr/g c=1 sm=1 tr=0 ts=6a952ca7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=sKgv3_SsqRtbfYgyWx4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: HWka9oXOjRM9RTsgZfNy7xOUm26ql69K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310062

Add support for the single PCIe controller on Shikra platform
which is capable of Gen2x1 operation.

Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index d8eb52857f69..19daadee65f7 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -2309,6 +2309,7 @@ static const struct of_device_id qcom_pcie_match[] = {
 	{ .compatible = "qcom,pcie-sm8450-pcie1", .data = &cfg_1_9_0 },
 	{ .compatible = "qcom,pcie-sm8550", .data = &cfg_1_9_0 },
 	{ .compatible = "qcom,pcie-x1e80100", .data = &cfg_sc8280xp },
+	{ .compatible = "qcom,shikra-pcie", .data = &cfg_1_9_0 },
 	{ }
 };
 

-- 
2.43.0

