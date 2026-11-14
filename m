Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794618804;
	b=E3e0Qejhc53lkKUkxZbB78P84Bzgdp1H8Yl3Hs2I4j7en7uzRqO+Vx9I4hPsA9NFGnBv
	 T7+fYb9VZyAPK+WGDnvd2ZR3SXMryQKIx9ijYayxtqPZqCT7Hx0wmTAVTW/GlXgs8lw8/
	 Pbi1cUSPL/Q9A9FGhwwiwIILPvJmhd5avrqD9GdUsQRqeQUlS4yefA+lfIRARUwj3/1II
	 0pmBJwf2vah8HpgB4U6bF15scYUcg28Sb9oi1IUrqxo2TrCEBGJBwpnLrEeQtpm19lIEh
	 za3bjgnmliOSXMLBfNAVtyZRtgrZop26qBCjwZ5G2Nd4bHDMY/yq7lSvvytVu7epTAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794618804;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=EjC/Uqu8Fpc5YyfEaSNx3RgivzcI3gmA2KSFjoMigrw=;
	b=utwiehcWuTxuxFeTHPAUkw2kw4Z2Ox3/jfxB5s9lASP99YQNS9LsjEJ0H44CAtO3d+5z
	 /DizarKV+ShOiZq2emjbnZtVz9vqUB+0j1Qt12x9PcUif12ZvOS7E9nVku1nSfOmY4Sld
	 ZqNqoNd4LOi9HpR/UoLf3LtlrY15OmwULE1xS/SGzstwteOsBRa5sMaB0dgu5ikSdJmy3
	 jstME4K+GEOelw8/OmCvTR5Kb7W0dVWdzRYJqZkc5jZuhKtCpTCNpN/uG31PvK4Ij91xv
	 R6GO1paTHWEtKwrQKcs5FzYmvGUKVtXVHmfxlFbllq1sl/z70KEJx53XjdDs3E+R0Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CY7JYz4b;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TpX2Usp3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B09606A33E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 01:13:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41B09606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CY7JYz4b;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TpX2Usp3
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADMbeQK2847019
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 01:13:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EjC/Uqu8Fpc5YyfEaSNx3RgivzcI3gmA2KSFjoMigrw=; b=CY7JYz4bBwcC7CKk
	4lP+QE1DtXSgTu/2oE89e6SrIMXJY/UzMyuuD3AT9QM9wnaUWUzmSJr7HbWTFcmZ
	BiTN/BOwSHO4L8RA+SjKZf6TQr0JOGj6hx2cZS+C9aFqnU0dOmcSwFr30Lilkddp
	fUUVatB8q2GswZInZx8dzUL3TqzPiNEUwjM+h0CAG5rwglR0Em5Njlvp4+8mYnD5
	pddU5RsO8aX1z9lnpDhnaCtYxWRGH+kBQgCwAj9RX9Vs2neVxcHZ/hBV9VT9WBfX
	GMaB6cxxd1oaQOZNiaEJHbhvaCCLSHCsc813D50DMfvgolAvGe+UjiYNpCE5+wSr
	Rnowlw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx1bpayjv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 01:13:23 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b25d977b91so1342081c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794618802; x=1795223602; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EjC/Uqu8Fpc5YyfEaSNx3RgivzcI3gmA2KSFjoMigrw=;
        b=TpX2Usp3gNY6oebVbcqEYaohAacT4YtlLHQ/hILiQE9/T/MFcZiQujg4aR/eM1bKOM
         ZMae2tw+YIYYk2e8QAUeO7IJPaNY132guZOzmvMjic/I55FkSxDx1I9c270i/7Qiv4IG
         OttUdeOaEv6qWTronKDHob2hB7Ny09pndGPihKbi9EgCngDfmNpTPjlUYBDMCYsyKYV4
         fpflsC7pUzXeHDdD2mbrOPaC1aUA6mc4vghS52KUIlyrmhXJde1jZBpRBVdUrKuqtsRG
         ZTpCR8siPYR7amlDXQeqHVaZQJNTZgkmBjcaO5HD5MaGNZE3u+p0rA0QqWDLQhst9h1K
         9zrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794618802; x=1795223602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EjC/Uqu8Fpc5YyfEaSNx3RgivzcI3gmA2KSFjoMigrw=;
        b=eghHOJ+disq2jh5L444gtvYA/N0MafrTBnHcILLZ2FD/sctMWroMZ6yWQSBQ5GdkPi
         gtooN734x8waTsD6aPrpj4YUdteTPY1BJnWMd2s8muryR9/GNmpUhhjaoAnyVB6Ccjib
         5ZOZmaHXJElmBfM7qo3tBVc7+HtkRbr/K5qioWXhebnlu0na1EFb0yvpZzeAj7LK6jvu
         AS6AN1bLVNU/K4P/G0uJkyF2Q9AMBUjcZsjIAxyc7Khetav28nY3rtE9EVzXAtGIN292
         0ERuJcYJxDL4UdYWzqXrbycFZjL3az6oD5aHGObhStN8A4kRNz8uqA3QvZtfgBXMqZdl
         at2Q==
X-Forwarded-Encrypted: i=1; AL+hErGLBCOUNZiY9iCzZThTtwIl1AYLssgtnROVXV5yAPVwykjmG743LTSP0c5nwk+DwBt8s/au5G2SsbA01Qs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9L9lUQ0Rv284zEyaVnVd4FUXFjGg7NMupueN00ywvtTxgFh2vR
	VfXbSsjfBaQTkglK21N8TB/cMaYCsaBYGXfQwLVxrQ/1eZx+K51zW2Puse0Pj8dSa1++VYd1tCM
	a+bURKyBQiOcJDh+Syvd28G/UByCk3t4OJYBq1wf1q8z51oVZ58nPuDUkZ0qRFH0a5o4=
X-Gm-Gg: AYBFou0vDxaNmJg/2qQkr/kWHd+vzBam4oAjyOFnpp62gw0ZwtGVYR1OiDsSpnYXbKp
	8Lp2JUKRNINop/0IW1NjJoO9rtQ68Lxs89fR7c6NV2DNpdj9PCMK+iE5CTdPfR533ugZ66azav+
	XrWnMDehHuTgAIeu+Ohwci87QoyiK5RM9mwBBBqedbsRtVqAlD74fmePeuXtIYXqg8TAf0Dnw7e
	MRfWPn6axYBRebNGK4t96P1Chp4O9tfh3HmJbIrzpVvBKAJqztNOdUG62WvHihBrAjUYyTOcO7r
	x7qN0JOdvIXZ3sq39qHQ1nRl0KTjK5uDE5N1afG0nxF7XYN2JuYomfGmjNXCHexQcnbKM3jADSX
	B305J8xGxJzO80TVnTMeOjZiSur3ai7UGaNMjw5rPTC3+n6kFktxZUZZknfiTCvu2Nf7CjwhDT6
	uuKn/FibC4
X-Received: by 2002:a05:7022:1e0d:b0:1b3:bae1:f5f3 with SMTP id a92af1059eb24-1b503068228mr3231035c88.6.1794618802245;
        Fri, 13 Nov 2026 17:13:22 -0800 (PST)
X-Received: by 2002:a05:7022:1e0d:b0:1b3:bae1:f5f3 with SMTP id a92af1059eb24-1b503068228mr3231019c88.6.1794618801698;
        Fri, 13 Nov 2026 17:13:21 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d7e5sm10952813eec.3.2026.11.13.17.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 17:13:21 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 06:43:03 +0530
Subject: [PATCH v3 1/6] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 qcs8300 16 GT/s PHY
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
Message-Id: <20261114-monaco_ep-v3-1-7fe227cdfac0@oss.qualcomm.com>
References: <20261114-monaco_ep-v3-0-7fe227cdfac0@oss.qualcomm.com>
In-Reply-To: <20261114-monaco_ep-v3-0-7fe227cdfac0@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794618790; l=1515;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=bU8CCkmWS7rC2poZZ53djxBqRGU6cUp1YOnSmcwnl0c=;
 b=zMfsxTErxY8hECwKm/R99bDrh33rFO98c02vXxvjBrvEcS0wCoMcqiVEOgmOdFGkJv9hG3guR
 H5qzlkBd4oCBl573JqURKYdapEMgFG5Y0lETKX9JhU2KrJXGhQz7T19
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=W9ytxhWk c=1 sm=1 tr=0 ts=6af7b5b3 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=LyAK_bMyhA_l01y8gmIA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: uU2YbnDzv8xuGz_eG4gd2GBO6cps_1gb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAwNCBTYWx0ZWRfXzriRvEHu4Jr0
 CDNojpXXvcwtnnOIcXimZg5DbH9c9BffOZM7ZsRwPmxWcI164Otdp7NDrSUCQPEZ/NjGC9KVSXN
 euuPsZ+erlu31V+xsU8+gAw00n35iLg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAwNCBTYWx0ZWRfXwEXqBG7OYlVf
 7zmjagtTtJFjmzJybo6KC7kW7JthGX0MpR1oUmm0dXDd0fn3YygX2+Zj9lQRpos+H9CsepgOQi9
 hGkkxsKvTL+0/8vQQlVxZ/Ty/s1d96cZFGYZw+6sFZIy9SDiD5XU6wK9qUhTa1PTA/2w3yxtoXO
 8Jjc9emiZc1oSc1mtDKVABUqks+rDqTQPhQODOJipKWgWk15dAxOeUKrIQasexioFY/nJMRxGjL
 omu3AvCVb10mR5eMFobDRy23xtk0VulP71eLf0tQitp5Kw9tgvcy52Z84NWhw4fE9oqs0UsfVOi
 TC1jQUhUByTzQFVfrJTSONTsFXi13NtXq6ivrDSFI+kXDAt7DmUF1+XId3/HF2TDw+Ab9lurE/d
 Mg3Z4z0zZ8o+OrPBOkgsoD2A0sLMcvJYsubi1lRrOZ1CWDV6KvGpUN7Qysw5Xd34tfDaqW8B2Pv
 a0RbWKY0oBLfLbk9wmA==
X-Proofpoint-ORIG-GUID: uU2YbnDzv8xuGz_eG4gd2GBO6cps_1gb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_07,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140004

The QCS8300 16 GT/s x4 QMP PCIe PHY was previously described using only
the qcom,sa8775p-qmp-gen4x4-pcie-phy compatible, since no QCS8300-specific
compatible existed for this PHY. This was a mistake, as it left the PHY
undocumented as QCS8300 hardware and indistinguishable from SA8775P in
the binding.

Correct this by documenting a dedicated
"qcom,qcs8300-qmp-gen4x4-pcie-phy" compatible, with
"qcom,sa8775p-qmp-gen4x4-pcie-phy" listed as its fallback compatible.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index c0a3e1f160ad..8d0924fa928d 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -24,6 +24,10 @@ properties:
           - enum:
               - qcom,maili-qmp-gen4x1-pcie-phy
           - const: qcom,hawi-qmp-gen4x1-pcie-phy
+      - items:
+          - enum:
+              - qcom,qcs8300-qmp-gen4x4-pcie-phy
+          - const: qcom,sa8775p-qmp-gen4x4-pcie-phy
       - enum:
           - qcom,eliza-qmp-gen3x1-pcie-phy
           - qcom,eliza-qmp-gen3x2-pcie-phy

-- 
2.34.1

