Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794670767;
	b=nyikX+Q+iaDTozt15+lPBiRIVOdv08h4VJrmhNQNXtOm18xxBZxPwkq1jZaBXKJ2eqKk
	 zaMtmXXfESsTQjMiztm5AGWUJCO9zb5B/UQp4gw/0NFAfkK2OMoEKjRkMJx5F+kxxTK0/
	 Rui2CD7KBeU4cmhWTgajR0n1a0lqPM4ENxX+q1d3hqCaCPoH2e6ynpeP0Di8L7o8WoYsn
	 Gdh2MAirdn0hTA0QVHztfqUNHwRxGKh7PeQGIM0pdozDzrr627CFrPJ2FAu9/b5rwPHwx
	 pWpkNSRI+S3+XrwXSXpp58QVJD/HVI0oWK3dVDz5JQmtWI8ajeJu4DjGiHANb85aYFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794670767;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=W/mPHONDiBlbVDbKIfcBd4APZhECiA8xyKQZk8yM/d4=;
	b=X6mO92cXHnTwXPxKXTTnIL87wVvZBsI5QzujBxezJyF/JWge4eWj2X9LcLeRoSxod/uA
	 +JuQbGTMMdoQZc5zHy9LFJI20Zu2XAZeIdq3w/7haFBE1c5zrkbJh63uSgjQ3yRq4y6OK
	 aJjY0ebCow2OMADrLt78i0u6LL5mGmIWCY/48EqYj9/TUy3YXmzlg6X6+8op6XDxiv7c8
	 wGNq4zf2M+ZOTWCuzDV1S9Z4BpNNSlvZNi6KvmmS81SStmMs1y/YXSmz5lTmi1FW7KlG5
	 k6a60m7j42zQzgzBljlzIBGmFlw7onTh2pFkvFsltATJwnTVdn8f9wUwMMakRuFGORA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NuW2YZq0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=igE00FZR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B220606A33E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 15:39:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B220606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NuW2YZq0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=igE00FZR
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEDklrx2518787
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 15:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W/mPHONDiBlbVDbKIfcBd4APZhECiA8xyKQZk8yM/d4=; b=NuW2YZq0Y41HQpkr
	fnC8EY82DmUdPIgA7mZsD1h9N263pSYE763MDan0BExrWxog84vFzN9yvWjUsc8k
	Neji8rVB1KxtF9iUH+WKDJAa+Ze4pV0fuShj2MNCiVemBhTHc5dsxO67snggvMNj
	hZB1lA83CYMfR/qhnXjhf8wSGEiE3LpZ6DTzoj76naB0z/qeZZy4cRGFJtq0LO51
	EAPivJ4y+rYbujXM8TirtH/WfdC3vgUJCGfWc1cNXE6DBl7JN2rcbqEo3JKxVBec
	VYJ/6rC97gjUlgQeMmnbf4PsmLJQn8tLQCMbi7t3a+L/JE7TiIIfUWaxCxNS5Oll
	mV7uTw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmc9308-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 15:39:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-944138ed63fso328869685a.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 07:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794670764; x=1795275564; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W/mPHONDiBlbVDbKIfcBd4APZhECiA8xyKQZk8yM/d4=;
        b=igE00FZR5jgQO+U4ihtj1yJKqqcpVhs8pkpQd2X+yedPvNTGfi+BkfIoabjks2QuXc
         xYlApRqC7/V2fWUN+aXS87PfoYcTZn/vVbfmQiICc/kpZiiDcZos5YvnT7Li2HErIqSK
         UgdZAhcxbP31+g+WrAyn0zjDFAGQrYz7WJk1FysZJhPuaJil3dD+lsYcQIq/dvbFaNSH
         OKqASf9XZzlPObPRhm92u7h0GMQz3Z7I3RGcrjZUZPrLP4TDdkFkUsnyuJ4fpAbj+s6e
         Lac5G0rWR2XTx8DxcrAdy4ZyUIIcIdnC3vSZfL5wFzJPG8enMwFEl9gc3aNa53Aak7vc
         jOjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794670764; x=1795275564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W/mPHONDiBlbVDbKIfcBd4APZhECiA8xyKQZk8yM/d4=;
        b=PvI2hVOQ8ksxx+baoIOdxqWpJ9x9+7IRfm9CZYzPVOAsv4esGddJf9yEsH+JuH9sZL
         mNbNJopSmArUvJbwEqDLW6BOfs1MebK1q8LrzOeBBWICnU0K4Rp5iw90D2SmDofrxfIT
         gUKrzYTcTTK/od8xrzpImF+pzM2t5wPUPnLuidUBIXaFWiBZc6apXiB5XJ0tj6vqjoCv
         w5CND0xOIhvqEU+INh4VRWkLvsS53uDbl12mllUaf5otXfWOuymwvq0EeETKgRKORgKi
         73Ut0lDK7gk3qHeqaZnK89Ivn2CZVjPvNDFJ81KRIDJ+Mvh4JHpegoiaOeqFcHVsvZW1
         Xs9A==
X-Forwarded-Encrypted: i=1; AL+hErGnMELUBdk3yI0IcmvCAvlHYan1lG3Anh+hQfxFeR1I2msRu/cmwCFTx4vktUbDu4acQOdJ6bIOGVM10XA=@vger.kernel.org
X-Gm-Message-State: APuU4Z92uo/jFfpUV0AXlSofuHp98hqxHsHMHbvifOSynjDs1n2U0mUb
	W4yShMxI4dLiXwrQIKqgj+ZiaQS7ogkRZK71ydAYM2Ns5zlJfIhOKsOE9NNki6VqS0HxPakSV3V
	Mjvv9nD5MxCF8shcpNJn6ZRSbv7GnvExeE/SqIuDj1W5fkjgjry2Wd85zcqjL9R33JyQ=
X-Gm-Gg: AYBFou2LKKEZq+J2B5PV0vS3zccWsiz4qnN/5slJCIws0WzQxK7ZkwAcMMfP6m/ZxZp
	YGPs/IoqeL4Vry7teZlCyNAGw+Zw96qm93UfIvryL9tyVRmLeUWW778aJ6jzJdPrdj05vQE30gB
	k/eBIIxf1NFG1fg0ZOhEsGAGGixCwdzvc6dl/4P3iMdeqb28luFT+/4iedennR24XO7Gx+G+odf
	DxYlZuhmL+O/elrdekEBpHrTWL/Mtz7ozhB/03Udb5S2/JOdGj9Yv8lo0mj/sCl0wqHBgFEZ41C
	zk/bfOgjM0PylA5TlPOxi6/PRZa2NZU2L3NE7sdjX1Efv4uOpl2d6JxATdrC4iyDLPGULkxmDTy
	3yKPSJMk4sm82BjkBz8T5+KCJDdvkZvVkt3zm5jex1XhIx+AFu0/s/anxRn7/MJsV6dQKpOa0uN
	z66PcJLrMW8d5+
X-Received: by 2002:a05:620a:28d6:b0:93b:d7a2:83cc with SMTP id af79cd13be357-9494bca6f3bmr1030873585a.59.1794670764527;
        Sat, 14 Nov 2026 07:39:24 -0800 (PST)
X-Received: by 2002:a05:620a:28d6:b0:93b:d7a2:83cc with SMTP id af79cd13be357-9494bca6f3bmr1030869885a.59.1794670763980;
        Sat, 14 Nov 2026 07:39:23 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c50a6c826bcsm167268366b.11.2026.11.14.07.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 07:39:23 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 16:39:04 +0100
Subject: [PATCH 1/4] dt-bindings: soc: qcom: eud: add the QCM2290 EUD
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
Message-Id: <20261114-qcm2290-eud-v1-1-b6157b817377@oss.qualcomm.com>
References: <20261114-qcm2290-eud-v1-0-b6157b817377@oss.qualcomm.com>
In-Reply-To: <20261114-qcm2290-eud-v1-0-b6157b817377@oss.qualcomm.com>
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA2MiBTYWx0ZWRfX0/ZPSLXTHuvX
 5Gnxr4e0m++QZGUeA7OkIv8sUnA/lpLu/VPsQAImmmEHBoC7eq4INI6SpNdXuMaEc4lm0cEp8un
 z+Y2CmtE1DDWFlSrUggY7kp2txH9WmU=
X-Proofpoint-ORIG-GUID: Z9vr_45v0ULhF73fQONTUTxrxcQui6FH
X-Proofpoint-GUID: Z9vr_45v0ULhF73fQONTUTxrxcQui6FH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA2MiBTYWx0ZWRfXyxR9XLuoh2ej
 OjC2IxRoqBxspY1St35Q95O+9c+OfgY2StUMeGko7GJtpZgOr/uw7Z8w/Io5uSXd8oQaQ+Cne5k
 cgWHLUIQjDrcG8P091272cc2/nq2ATqtn2K/4dQx/Kr5EkMUWCet6C83Z1fRubnMWS3BxVDkD/L
 zrVYYYOqjTf44evv1BK6ZvnYQxPOZXT9Nk0sEnaSEnKbEbH/Vwr0LbycyKupm4/5qm4jt4louzy
 pKesT5nYcwEdXc0t/2rdhu7r2V9gTR5aGvvzX5B/ezmYBy4uaBUFYRE/JRz91HK3keiTtfoGpps
 7tr/AmjMpkvcOX6enfxlernDHWhB6w+FMB65KL3TduhwuHYLO/frqtDTx0Bz+VUAE1COpKvyJ16
 tJMbH14kzabAzgFzSnFSKsmnfla268Eq16i0sUpQlr8rwI+h5mrQ4OJwb1E3wFO85AuIJDQ8rmJ
 ACMWcl1aRgmcwYpgBlA==
X-Authority-Analysis: v=2.4 cv=Vpy2kO2n c=1 sm=1 tr=0 ts=6af880ad cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=A5wwQmU0M-B_W0dhetIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140062

The QCM2290 has the same Embedded USB Debugger as the SC7280: the EUD
CSRs and the mode manager register that the secure world writes on
behalf of the driver. On QCM2290 the mode manager additionally ignores
the enable unless the TCSR register TCSR_APSS_SPARE_REG1 is set first;
the boot firmware does the same before enabling the EUD, and the
register is written through the same secure IO service.

Add the compatible and describe that register as a third reg entry,
required on QCM2290 and not allowed on the other EUDs.

Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 .../devicetree/bindings/soc/qcom/qcom,eud.yaml        | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
index 84218636c0d8..14503527cdf2 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
@@ -17,13 +17,17 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,qcm2290-eud
           - qcom,sc7280-eud
       - const: qcom,eud
 
   reg:
+    minItems: 2
     items:
       - description: EUD Base Register Region
       - description: EUD Mode Manager Register
+      - description: TCSR register that has to be set before the mode
+          manager accepts the enable
 
   interrupts:
     description: EUD interrupt
@@ -50,6 +54,21 @@ required:
   - reg
   - ports
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,qcm2290-eud
+    then:
+      properties:
+        reg:
+          minItems: 3
+    else:
+      properties:
+        reg:
+          maxItems: 2
+
 additionalProperties: false
 
 examples:

-- 
2.53.0

