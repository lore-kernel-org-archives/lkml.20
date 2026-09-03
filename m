Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A4F4E56F8
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449924; cv=none; b=BRcO7JIP4EcafM4hbXGsYLhPHXzo51OWJ0wpUeRjnuKmOFpo75QagVv/uePqPgbconaXu0CCNEWs4SMPQcn7r+muPAoPuPtvf/GZ6ymjYQGjiV4poMiL64w8nMR+GF97i0647DKLIY72VseZOvI6pC/Yga6kZZLts0r3iKSPmcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449924; c=relaxed/simple;
	bh=ALi83rRNuADvE9ffMiegutYDx3cZlhwl260kOcGTT+k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uBMDdheIwC4fMk4h3LOF9vQ1GTRiNQrdSklY7VvYi38z3blMZ3p+364N49FWpxEjmAOGmrH0/vo5+p3jUsti7dFaKNbjwhuI0pv+Sq14+mSxOCko1dm2R11N2xVnisSF2Yi2AFQ+QFvTkDtneU4Q83b/cat91+jr5wyDMIJ5MrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gwy0lSCn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xj+1NMMz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gwy0lSCn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xj+1NMMz"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DAhhU707742
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 15:38:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/Hy99dl8vB9
	19AY9DOVP/bYhGp7iGiD3x9D7uELTJ0w=; b=Gwy0lSCnKFrCup4JYBWJodCYrVT
	sVxnLI27r2GMj7AQrfocR/U/YllWsHkYvmrmHaxeZkGYiLUe4aFpdfIAmp2Sx03C
	067nyjIwxO+yVgZI7BS3mu7qKHWoV+4jS5Bp6PdXVpsQ1ewYOueIIyOjtt9KK6DC
	uiRQJyafGH0Vh8azNeM0qUYnjSuApLfRz3LFN+XgtX9Nx8qcL605xY3t0GTWwL17
	vSPR6qTabLnxh1FRz1orPK6p/W2bBO14BVGyQUEPkhzaZRdVAmr/0Jp2Yl9jASWA
	CxvS/SpNeu8J7HFYnff8XATo1mUMEeD3gF7oB37ofT2NEV3r2y49BH2FbeQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf4ekj39k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 15:38:41 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-85321e37104so3472283b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788449921; x=1789054721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Hy99dl8vB919AY9DOVP/bYhGp7iGiD3x9D7uELTJ0w=;
        b=Xj+1NMMzuAOg0KskHR+fVrMph+RtITF0cUEevXdGm/GBmTVS3GD1MqBpAG9b7KM/Zl
         G3EnCdJoQ12ziBLwihucMCHGkW2tL/FnTp4IAjz5JIPG3FxDCHp6KKvvudCyzRSqnkDR
         6/hhpNuBGDTexuodUkKdLXOZRPv1Ll0EBQpxlZfYEzB1sxKB5aT6erjypqF8P7t8s1Ch
         g3Ii80AZjPtZeRqHaCN5Pi3cwCM4u/yO8qYS9chcfHfMsy2q6ynpzLwc4y1f/v7nAboB
         PjCptGLQjwQBIbqDkdZiW/CBCExjo6I+Rs1rdGU9cMiILLbcmvMBnsasokGsI69enhtk
         olAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449921; x=1789054721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/Hy99dl8vB919AY9DOVP/bYhGp7iGiD3x9D7uELTJ0w=;
        b=lMWTRfnPFj0K/x7XSBYpZsMnu3vPwi+9BhYAm1mFXaWDGuKwWOSPk4IG+FAQSBGpm5
         mQSVJfLy1QJTgTRYvOrCqZix/6+aS4m06eoMMDTZz3JXk6KgfeZxekhBPF9M1+qWFGM1
         gr/Y9MVVaRlWXHc62FKk6vnFS/ZAJM1ap4/r6XCno3J8h8KLZn5trnNr24/6SgOlw99V
         WitteBtyBtCcBTeULS3dituV7xO2F4dAjxft6SWvk0CqLYkQOjGEXcbiCrV0+ojieHRC
         XAifqvQB8oY0VdQjLIOJ+VkEG4kpar5xsMjTodL+P75nu5Ce6pEiaj4ACvqbp5zBR+6Q
         +ioA==
X-Forwarded-Encrypted: i=1; AKwUvBwS5c6STp1QQXDEH5mtwxpiJAqDu/ApmtWA6I58s5ZSiDeiUxH0dpQoJJCUoWLXd01Rm5ydUMlZtBv7rFg=@vger.kernel.org
X-Gm-Message-State: AFuF++l1qHCdzAvzHWWIWwSpoEEU+ppxqMPD4FafixfB2Tj1A+lVMQID
	+d6+zM8SuFPoEjWZuIxP7teMD40T4AOP6DnU4Y/Xewy9C46bWUbyl8zFBk7wxncGjZN/c/d+X/W
	XY+EbcR3MOjF7DylvI5BOejfCcdZwJwPgDqiZRSuKeMzcfbFvSf1CbN3BNfthZgncjYA=
X-Gm-Gg: AYBFou2ENGq1CGNOus9Syje+XtpqcbSwUbRnVXcvrWzr8nSI8Q4LtqaSx4zUhdwkC/J
	o9E7Ulz5JjHDApCNeFuqypzT3Ba1usU4XGYTGGQLmN+n3BhnEnI6n+bSyeDU9TrRc0doYJCq5J4
	vBd3L3URIArHofZxPmwvzD7lUm9a42/464FRLS7pgqVC1ta4De6wHoyKGkmVyIOSIJoFAYq43JO
	W3/su9dESdq40/Qpu7ct3ozgWzplAMwIBirn8huZ1GIj4IHl02NfEKDwZrJaC/efeh1j7B2F5ZY
	4w3vsI6aosrr0pYh5rBwEmIiuunX5Vb4kdQHsFykAVlEtHmQaZbFMC+YySqmm1ulUOZjXGNJLm+
	rhW+RsItx7DlrvW2NT/e8dhQqTlTtoP9M
X-Received: by 2002:a05:6a00:ad8e:b0:848:8715:c2d9 with SMTP id d2e1a72fcca58-8613d06f6efmr1606491b3a.2.1788449920687;
        Thu, 03 Sep 2026 08:38:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:ad8e:b0:848:8715:c2d9 with SMTP id d2e1a72fcca58-8613d06f6efmr1606367b3a.2.1788449920010;
        Thu, 03 Sep 2026 08:38:40 -0700 (PDT)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86153027951sm81069b3a.40.2026.09.03.08.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:38:39 -0700 (PDT)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: Sriram Dash <sriram.dash@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/7] usb: dwc3: qcom: re-enable wakeup interrupts on failed resume
Date: Thu,  3 Sep 2026 21:08:21 +0530
Message-Id: <20260903153827.3463313-2-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260903153827.3463313-1-faisal.hassan@oss.qualcomm.com>
References: <20260903153827.3463313-1-faisal.hassan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Bxe94ljQDaWHizGfDzlVNTHkoTF7foGz
X-Proofpoint-GUID: Bxe94ljQDaWHizGfDzlVNTHkoTF7foGz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEzNiBTYWx0ZWRfX+PhmWuHVJceh
 WTe667CdZZgg4ZJWDibijqbvPDKlVI3gdLwCWJKdTIZRaYafFDBU9BVxmgIEJSFXpGJi7wSr8n/
 MObv1ouGOXSWBBsXNAunbutdRnPfvEEAK/8yas10ZAwuiSyhbVunWAypaRiPnVB+1XxHI7WY66d
 9CrAq71QoGrNCTdymHuG/+VAYvHVarGz9ml4roym64ZE66+t2ewNZ5mtwNS6qmD6PvzC+mS1tXk
 02zMjXSIycUkPIG8hLqUqKldiNRXunAmGAcGG7ZpeRk1U/yqTOwUg6dGH6JrZXaCNH9tcoRdmjZ
 si4GGiWH4jxB0KnX1XihQzODTm3aqyzUmXXZ7oZd/UcVcekM1lVLiMq1zCX+17VpTSIA/0LY2zJ
 PlbVcf+Wpg6Oy/c/gMWhLm22x9s5+niG4CnBGvIF1Oiu208Okv7VJo15svek46H8zyP7W/MUE0n
 qav5UIoV49/y57Ueliw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEzNiBTYWx0ZWRfX4o1jxbbVBWuj
 Ftz7Iy94cX3A8M+rPqMSVQbmCOJFJfoNlaWajDK5Hopbe8cfGGK6BlgG8S4vkhlNova4us3TCL+
 zbRwMryqYcNxC0gJTGfMWum+bqOBF2g=
X-Authority-Analysis: v=2.4 cv=PKc/P/qC c=1 sm=1 tr=0 ts=6a999481 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=NhDn8tuv-5NqXiZlDHIA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030136

dwc3_qcom_resume() disables wakeup interrupts before re-enabling
clocks, then re-enables them again once resume completes. If
clk_bulk_prepare_enable() fails partway through, the function
returns early without re-enabling the interrupts that were just
disabled, leaving host-mode wakeup interrupts masked after a
failed resume.

Jump to a common cleanup path that re-enables the interrupts
before returning the error, mirroring the success path.

Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index ac68b4218b56..49698a31b2f4 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -382,7 +382,7 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
 
 	ret = clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
 	if (ret < 0)
-		return ret;
+		goto enable_irq;
 
 	ret = dwc3_qcom_interconnect_enable(qcom);
 	if (ret)
@@ -398,6 +398,16 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
 	qcom->is_suspended = false;
 
 	return 0;
+
+enable_irq:
+	/*
+	 * Re-enable interrupts if they were disabled earlier, so a failed
+	 * resume doesn't leave wakeup interrupts masked.
+	 */
+	if (dwc3_qcom_is_host(qcom) && wakeup)
+		dwc3_qcom_enable_interrupts(qcom);
+
+	return ret;
 }
 
 static irqreturn_t qcom_dwc3_resume_irq(int irq, void *data)
-- 
2.34.1

