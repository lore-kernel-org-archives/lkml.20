Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C075636B061
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 04:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787804309; cv=none; b=XQP/lxOL6Q+3Vx90omL1UzmmaCX9yL4Lfa8AUxFHChVKfxC25GTgWYeiFxBX+qb8V7VAiWFBqSdCBtaXPkIQ5p53bE9/UEMRmoKs+TxUO9FV5jpv5ePGGIENdzMjXYqEfUTiRAvyjqLQkISCm5V1lvTGHmZkTjgNgOj91//xIZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787804309; c=relaxed/simple;
	bh=YULKJpDc+6GzNHOOOEj3GqsAFUDCSD31ViY/vK+CMAk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CPcMZ4E53BvnD9vVAASiZsjQB/Rsnjmaco7DabZFQu3vc6anWr4+YupdsovbQAbDGx7PuTkSeTZIR6+j8/nWdSakbackGO8FsfgNw+xzAKzSwkB9+Gbdl751tE1fbgK1ha0cB1kzIPr3Tf9endAUOdgCWlItdgIeUv9NQaM24ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g7c2nN0s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MZ2H6Ioi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g7c2nN0s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MZ2H6Ioi"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R3IqhT3875078
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 04:18:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XW25iEH/hoSmAp3yCUmknk
	dfVZAEwSYAEvL+3+rv4l4=; b=g7c2nN0sEmoAOgAuBVrBtev3S8Ve1sHcZ8hBDf
	h+o4JAV1TnqbdoKQ9FyEoOaG+wBcodo3h7oLz9hmz6aTzpfM1iftCgnO5zd/HwrC
	J4FS43kKQhn699DFIB4eB6GsUNrsmUY+kq7E54CQWV+tzTtCByMF1Qu//SyjGN3a
	DynrARonUKrgFqRmjZLat6pwxbGLaDFcH/g0lSOE6F3qGedYT2Owbe9RfUcqNI71
	R7bVKMY1MO42wp9Y9U3D+y7sb6auoqfOpyMJqfn85cMbw1CwaAayavkoEd3+yO2H
	zrkraelOEAe+sy0NhE3oLtMGFY8lZI/tEQ72Wp4YsPhTQpaQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga8m5gxbu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 04:18:26 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so2706107a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787804306; x=1788409106; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XW25iEH/hoSmAp3yCUmknkdfVZAEwSYAEvL+3+rv4l4=;
        b=MZ2H6Ioi06zB+s9MlTVtV78h1PlBwKhv1SsTA6+mFJM2R2u3bn6anPkqnpH64929FT
         JsEGZSutzYERQyhF6v2cCTHJ2fN4qsbqIzi7WlKlUO82gAfW9vTZx75fpZy59IozHuh4
         vNLHIcwrXF2DZeXzjGdJACQsyjtwmHXDGiG5lMrjNSLOdISVm/nhQCwxGWxBAYsLrgag
         +/KPVbLC2up0cBiqOFKrDAAu3ZC5sasfLOHvBDOZRvuGgkcUwQ+bhrUogeEfh6ehTDaF
         NhOD3iFpE+Pi9f0NA4VZE13XltcV3Bfa7F2roGWoCTFnN27+nDkmE01Dpt0R6g+yGQFN
         kGOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787804306; x=1788409106;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XW25iEH/hoSmAp3yCUmknkdfVZAEwSYAEvL+3+rv4l4=;
        b=TGR+qliL3uSvkLSSsbIP8SwVdqITTU3hUtjKy3CUUTvIJp+xNrC9z1z7qeLF7YWiJb
         3ex4aFK5MIa3SPM7TZnAnVNswHv3QvVa4CaLWqiv/sw3/zZUfLwttOGkLJDBUS6oL0VU
         lh4BTAjAa+sDVBPUB579HPdI7C9IjIJpyxi6L4iEdB3DRCVANOjgHx4xrsNqlS3jkZGA
         bIqvgupQCKkih/2GhNAyTboZvuHI2Atbm/VjW8wOqpxSiNCU6GpqZ6t5cZdxbEBG/Wjn
         CVnIrEXi3cRj3gaYJzAxNDrHB6KEC9hv6Qe18nhasWOD9nFQqMGVxPB41D/w8+GpZXQt
         j3LA==
X-Forwarded-Encrypted: i=1; AHgh+Rreh23ped8fAs4REcnBb1AikUN9m8p5GK3aLAmWXRQOpxMJsAPu39GO+/vmwTNpYTEn2+0eppyaK8sIcfc=@vger.kernel.org
X-Gm-Message-State: AFuF++k2NzINm4dt160k8wBAy3XqEchul1eIhwCVmJYfHvKoxfNGIKAw
	6idU9C692Rg6agVGTguydLjHkUM0WUVA296gL/G/USt+TEFbvYqqvoo6RDHZrrYJrx6bNKI5var
	cZDjf5DB97ZPF1B73qkhN+WkYX7NeafzuLUM3UWkzpSqxAnWNHec+PRvOO/pb4HO4zzE=
X-Gm-Gg: AR+sD10tEkV/tFz+nc59cGZwbsNg4oihhnLcMxvuPDl67QRAFIvaRvLOnxtjTrmzC8C
	I3/ufTP2fieaAfwVi1yZqUn3vNbebnVNpAUsbCjv/TByPn6nSmsKSt934d20W3HllxcvGrRhOYJ
	6bFpj4+HeSJtePLS1Pv4RKQJNMd8RxNxhZeIuhAwfKmGtoZHwQQ2xzZHrUK5O0MAKutagAXN9fw
	DxKEbWsOmA8Nc08jG0lP5YVyPDi/EhD7duqAvfIm6y1NK1u/c+EG+DJAQo22q94uQRE7YqV4pyF
	xH3S/4S0rx26eq9m6Ve8SydaaTNgFQgtVovK+Q03Kuuyp/7aN8XhLo/0nnzkL26Ti77O07l+2Nw
	WUvFTpQSm/I/SMT0KmW1FVpyHASqXpBJp+Z2I/2LwaemQheKg0p8mTdbB9cnXtlTNrKFuIrzO1b
	V8aWWu7h5xXWlbLcRTWCggkZHyW5Uddg==
X-Received: by 2002:a17:90b:2885:b0:380:71eb:4014 with SMTP id 98e67ed59e1d1-3966d5c1a78mr25281457a91.15.1787804306215;
        Wed, 26 Aug 2026 21:18:26 -0700 (PDT)
X-Received: by 2002:a17:90b:2885:b0:380:71eb:4014 with SMTP id 98e67ed59e1d1-3966d5c1a78mr25281347a91.15.1787804305777;
        Wed, 26 Aug 2026 21:18:25 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d886256sm15547966eec.16.2026.08.26.21.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 21:18:25 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 09:48:07 +0530
Subject: [PATCH] dt-bindings: mailbox: qcom: Add IPQ9650 APCS compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-apcs-v1-1-33087bf44620@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAH66j2oC/y3MQQqDMBCF4auEWTtgog3Vq4iLGMd2FkabSYsg3
 t1QXf6Px7eDUGQSaNUOkX4svIQculDg3y68CHnMDaY0tnwai271gnVltWkaPeipgnxdI028/Zm
 uvzrS55u1dI0wOCH0yzxzalWgLeEtPqA/jhMotbIEhwAAAA==
X-Change-ID: 20260826-apcs-43612991b1f3
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: AyfIOGPoMnzSyi9hQ42vO4pdO0x80u6s
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDAzMiBTYWx0ZWRfX7AFBvBhhaBUT
 QDQkpnmRcXjmaSxv87d0ejXJVcnySoECB/15hBObjv3o0xG+7qegBT4VAYAtOpC8Vfr5qIe1Iow
 eLhkYfiGjvyZx11BkEmPq1+hzEr2piU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDAzMiBTYWx0ZWRfXyCpPhnXFpgyf
 yqZq+Z0uHiTfR84ha6rTP45i7uVwS8CUqwNxsq+JNyCXbwRpy8dqNracXF5kACuCosE12fXeTVD
 swlueF/7yzrnBAhKFX7FvszLb3cS0kO56X94sQllEETVDx9fFzsUuZqNoCSdPGXmj4javNaP4nU
 aT2Y73lwKRhoUPdpUilDZlLzFc7w0NEzyQhWtZczwbvNfKF1NzLvCwYslgyQK+Ti3LVQnYvmHyS
 LHU18NWGsK6SZS9cwT9W2PmyGG1lmbDiw3zMHL7KE0E/eSxw1g39ZyWGxnvCm8P/iPF6+hp0LNY
 uZJBYU4EHI8ZJ7xTraeH6YQnz+hVdl0owdKIsGwvLgANVohsl6J6n+hWFsvPOIPYDiQf2pOtcmg
 vtWqqUSrdE6nwwYk87jj5WU8dGM8jc6j/bVkMh84d8hqeIxhz3nTSypOLLd0cvWu7l59tQZ4RJc
 oAlOpzo0BWU2lmwcoEg==
X-Proofpoint-GUID: AyfIOGPoMnzSyi9hQ42vO4pdO0x80u6s
X-Authority-Analysis: v=2.4 cv=SomgLvO0 c=1 sm=1 tr=0 ts=6a8fba92 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=-qfEBsuHl9svXMZ8bqwA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_02,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270032

Document the APCS mailbox compatible for the IPQ9650 SoC. IPQ9650 uses
qcom,msm8994-apcs-kpss-global as a fallback, so add the valid compatible
string combination to the binding.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index 39bc374300c3..11f4aaf256a7 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -39,6 +39,7 @@ properties:
           - const: syscon
       - items:
           - enum:
+              - qcom,ipq9650-apcs-apps-global
               - qcom,msm8998-apcs-hmss-global
               - qcom,sdm660-apcs-hmss-global
               - qcom,sm4250-apcs-hmss-global

---
base-commit: 41243c778cfc83f8d70600be6dcd0c7924603aa8
change-id: 20260826-apcs-43612991b1f3

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

