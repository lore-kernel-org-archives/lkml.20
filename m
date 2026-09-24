Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F8F42E414
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790236155; cv=none; b=MxkBOAweLXKubAs02C/unUDbIOzXG+WW9jZOa38kXMAHd9LjZ7/7yB7yN8MiVZq8zDHhciTg8HbtkXSi21eweaeWBpv6ZXl0wH08KEa2fN+qDAVUuwPg90Y5TGC55myTAIcZAFK1pIvNTKGPMpVh5PqKBZpKoT29JLXqNEzIcp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790236155; c=relaxed/simple;
	bh=XTLt0c5Dv59ALcqjp16DIRAjGHZtam6MfpOu+WlMqfM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Df5d3WlDMSPjPGfuVy2cr/TXUtWV+Xyz0kweVMoObo7XwCr3muytBvCcsHsC3fQapgmPOcEGopbUvyslcEKMFdpMhZRnMHD45pg1kuaZSt1fkA6YuAYXDVtI6GErpkYDjETJmYFTwG6UJHIoVEkrgQ8cj4fYCSI4tSV6FPGbPds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZIZmVThj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WKVnvB//; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZIZmVThj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WKVnvB//"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O62OYH1475976
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:49:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=F04EeTWi1RxE9e3yAxNT6w
	8vWQZp5pUahO1E1kO+Chg=; b=ZIZmVThj+B8s2Yt1FRxfN6Kp2asx/zeI5/JU97
	IsLLEAtmQUthcxaEbR6sNGugqHGSk2Lgg+a7ZN/nxwMRoCjWXWap59zYOC8QASii
	gZ7kRiZ1ALu+622WBljFdZ7BjpJ0v23+4S+8IFGhjK5OAVDEd0oLeTPP+hgAIrSr
	0mYGdwal+NnBMYG+NEfWYr3ogVN3uUT7EcOos8xdbRByW4YAKBwRvbgaLMxSy7Ow
	zfCbQ5vntSRB5D0Ti9kEOuwY5U18mHmPreexwKFm94Y9/UThWgfkG/TcNbN3BkTA
	RuGOx1yMSnUcfxVP4c/ej52buU1h0NX7AQ+rXqRhUrXPRqFA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvx8agddx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:49:12 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1438492fb40so2804871c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790236152; x=1790840952; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=F04EeTWi1RxE9e3yAxNT6w8vWQZp5pUahO1E1kO+Chg=;
        b=WKVnvB//c1QTAiI6muhbZEDtCuxHpx4V9061ppyMSQKV7CkVMTbSDdJ/5r82+ZnG2E
         DntFW/wLrZHdtsqbeWi+mMkW1YDdwxseR3dnv4Qr7cl7+0TQgec+tSR7yYeuDY5D58SB
         zOg7CMv/C61pu+zjhyGu6c5Mmy2Ji6tTxAE+Tkvc8Eslpw3OJkCxAuXPn5Pc2p1fDEaq
         EIijIPhuvX8ZggeetGHQneAtv2JnmPA4QIZz8U8w7kcUh/dIX7vnzs/QBnYRApCfh//Q
         chq1yoAUCf18ooKutC8Ru9cuQXP58al/jK74d+ehK1vIkzSn6kbpTYzfMgl+HI6Jia75
         U4xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790236152; x=1790840952;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=F04EeTWi1RxE9e3yAxNT6w8vWQZp5pUahO1E1kO+Chg=;
        b=E4ktWUTRPjfiImA4426Sw84f2Xnjq9Xnq0F2ZdwiEdVEcEjjUfuRcUjCbtCC7MTIVJ
         o+WbBG1yHJ5LRy3cahM5fxobV06L8R6JK5r64aFEwEfEuQbS3Cony2oio7AWPjos5gjs
         AKvZn8RFib6tyzjd5h1Lvl1M2VP+3Eg3OWgSFkFygAl5DoO2AQKQuG9/ikeKcbamAD/0
         tToq2ToMtBqscsN7O5DN6DJKEXDhxG6uhtaFkNVBd7EqepBxcWE4EVBXGBMMxkLCIyfT
         d95bDA4zOTESlEYrZ1bse36T/vcH2STDHECxmmpThLh3MVD8frfIL1TT0nHKTlFL5G5Q
         MyJQ==
X-Forwarded-Encrypted: i=1; AKwUvBybTIEEE68r828CTP9s0foZbESXIPSZVpKl+lg0BLnYXFZj8wnbqRwd1t/mchBVpiUA04NogYLVhaOhUNM=@vger.kernel.org
X-Gm-Message-State: AFuF++lraJLDXbzH6MAtt4WXSTzW/mWTsxHySMwX5OLgihPIYqwa5HqL
	NOXXBJVc/IYWuv5yFUz9KB4urhhJ2VKu/GijlszzEATU7kOm8j0T/nDaZF/An3u7Jl4j1Ga0kQO
	YcMlM5ZXvJAWjLz837hernrz4DafkDv+mEh1Md1+vj/OmoQgaeUK9B4hHTvqois35HU4=
X-Gm-Gg: AYBFou0VriY/L3L9gygk+VWHgAJVYkX0CQ3mLVQNUHhTqO3lCBSLSUVc2v3qtnYuIpc
	uHbQMm/IlZbq3sRTPcILAnrj08gUm0+iDeY2b3lJCfIkE4bwzIbtKzTb4Z8Q9ZqETHRszI248E0
	xH7as6ElTISCt0BFIql7j1tTnVLYCTM8D4YA+zEuy2+d4h7N3Tb6Z3qzPURynQGjB4c6sRUoTBk
	pOGZj/cmQTttJj1ZEGb1lRsZT+jnSqGDfO9vOf6iTLxKNA46CclEa8XiM08/W/F3z7lJUVmtlzi
	s706tkxZjr6+1W0kLPfL3sFS9gUa+Q5AWffE4kNVfqXx7Um4qHf7RC8Of4hjq6S2oUWHGx+Xs8v
	Z9P6MJFb1WG76drPYo3lRmkFaawz1TVpAghcANPXjSkcb2V4/FF+svD+avdLHOOia4y//mI40u/
	5oWtBuTi18kt6qZihPbBRLYJLBDEqQ
X-Received: by 2002:a05:701b:4205:10b0:144:f86c:e330 with SMTP id a92af1059eb24-145040374bamr1222722c88.3.1790236151322;
        Thu, 24 Sep 2026 00:49:11 -0700 (PDT)
X-Received: by 2002:a05:701b:4205:10b0:144:f86c:e330 with SMTP id a92af1059eb24-145040374bamr1222711c88.3.1790236150749;
        Thu, 24 Sep 2026 00:49:10 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f983c5a1sm19401376c88.7.2026.09.24.00.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:49:10 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:19:05 +0530
Subject: [PATCH v2] dt-bindings: usb: qcom,snps-dwc3: Add IPQ9650
 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-ctrl-v2-1-fbedbe760375@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPDVtGoC/y2OSQ6DMAxFr4K8blBiBkFXvUfFgsEtkYCUOCAqx
 N0bQjeWvuX/nndgspoY7tEOllbN2kw+4C2Ctq+nNwnd+QwoMZcFStE6O4hcqoxUJpMGU/CnH0s
 vvQXMs7qypXnxNHctoamZRGvGUbt7NNHmRCCWmMBZ6DU7Y7/hjVWFxt+YXcZVCem1JSGWqlBp9
 zDM8bzUwwmN/YDqOI4fgbMfstAAAAA=
X-Change-ID: 20260820-ctrl-6015e1503b24
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzMyBTYWx0ZWRfX20bmy7ZwwqvH
 GhckeRCFJCi1ECM3p6jVK7GpVZcqdRvdq1xn/kP55INc4cc40z0g0h7MB1P0Kl4RSLqJ7tz6rps
 9KfuqY8cNL1VruHQxzk5dt2DHJE7Efg=
X-Proofpoint-ORIG-GUID: gV0XBzCPN1a1glqlvdo1wp9RNTJsXccC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzMyBTYWx0ZWRfX0LRRcenwFY47
 7Ulom2G8uIQkC+PiqXPGppjJNNG5EJvkliDOuiK37+BkNZMRALQNqChfhFkXi2z3vrSJWCAtbY3
 grCK6lVcpZvc/py52aoNzb11kb3K29D8T+uDjx+vJJVKKrcaJaISEFbGEA/Ovbl4/yU+J4bXUgW
 0rwpR0QfppWsL35yhkSPm66dRMAFVrZST5BlEDDooVr7ciE8Xyc8kzbpNioh0HwSZSIV6P9G0CH
 Cl6YtyA8ilZ5qvMELVihvcUlCAecGP82xcUrtt84D928FHRgIW8zGt5lO0AAjy92w3UQ/L6wU8e
 NdPT003/vMBm/zDS2YpYUms7xEarbQZZqaVpJtBDAMhw/RncnAK4CR6TofwZF1q3yASq555fwTf
 LruIpC/tJ5LXNdE3ggTRmngsHYBhdZz8ebW3fuc87xYH9WgSL7Hu2xPr6VF15R5pD2hxHeK0zmj
 eDsT5nyrw0pRG8k2xyA==
X-Authority-Analysis: v=2.4 cv=a6SlZkSF c=1 sm=1 tr=0 ts=6ab4d5f8 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=10T2-SsU0MHo1Rfz7GwA:9
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: gV0XBzCPN1a1glqlvdo1wp9RNTJsXccC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240033

Add the qcom,ipq9650-dwc3 compatible for the two DWC3 USB controllers found
on IPQ9650, using qcom,snps-dwc3 as the fallback compatible.

One controller is connected to a High-Speed PHY, while the other is
connected to both High-Speed and SuperSpeed PHYs.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Add bindings and dwc3-qcom glue driver changes for adding support to the
two USB controllers present in IPQ9650.
---
Changes in v2:
- Rebase to top of tree
- Drop 'usb: dwc3: qcom: Allow the glue layer to pass ref_clk to the core'.
  This will be taken care of the by https://lore.kernel.org/linux-arm-msm/20260906-ipq-flatten-usb-v3-2-13e4e0f63123@outlook.com/
- Add ipq9650 to existing clock constraints instead of new constraints
- Link to v1: https://lore.kernel.org/r/20260825-ctrl-v1-0-609e2291814d@oss.qualcomm.com
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 9f91c8711e02..a8fbf72c6375 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -36,6 +36,7 @@ properties:
           - qcom,ipq8064-dwc3
           - qcom,ipq8074-dwc3
           - qcom,ipq9574-dwc3
+          - qcom,ipq9650-dwc3
           - qcom,kaanapali-dwc3
           - qcom,maili-dwc3
           - qcom,milos-dwc3
@@ -210,6 +211,7 @@ allOf:
               - qcom,ipq5210-dwc3
               - qcom,ipq5424-dwc3
               - qcom,ipq9574-dwc3
+              - qcom,ipq9650-dwc3
               - qcom,kaanapali-dwc3
               - qcom,maili-dwc3
               - qcom,msm8953-dwc3
@@ -525,6 +527,7 @@ allOf:
               - qcom,ipq5210-dwc3
               - qcom,ipq5424-dwc3
               - qcom,ipq9574-dwc3
+              - qcom,ipq9650-dwc3
     then:
       properties:
         interrupts:

---
base-commit: 4d7e75152b01862a4ec598435d79a81c4b254dd6
change-id: 20260820-ctrl-6015e1503b24

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

