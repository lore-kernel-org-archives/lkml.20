Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621466;
	b=lrHEtKK9A1YLqsNqFDfyyEe2UFKBPra9udp4sCH6dtfAlloCQ8BmTxJYBcC6FUGfqEJM
	 TG6g/WABL7Khcuvb45qvR49sNDntk3jYwXds9cqPX9fw5oDwPNooDSoiPoVvGQ16Upm5n
	 Wa0KT4vcAwn6XG09jc8nX3P2dUf2sYHEUCfIC34jEphPORALHCAsmNOOyg/n7L9dGIfLy
	 VG1M1IANG9AKFwUEUD7+iCUT0kxUgxOAbF4/LJ2DvTUVLTfDkVPdpZ16yo4LW4NO35xSr
	 o8uEv/yuy0RkCxoVW6UCO8uAJvOimtqAJT0bLcRZDUAoSXesR1Z42U0jeNTnos2CWHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621466;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PFt9Gp7t593Dt3xqwIEF/MymtP/w9kZCYAf3WxoQwpU=;
	b=JvdIsl9ZeKYQmeFpsEWjgMuN3zEcKwprhjqgLqm6lAublVEG3rqAZkgpBgY70he8CeHb
	 QcCyhFRH0sz4GLRqYVZ2AtfTVo3jXlsBdmdBNrFlYSRUzlBuGduzMrRvlEdwsfZVWwhZV
	 oKPn7/MXVoRhq/48ygdVq7QKpE7Gc6g+NBu0dnx9W4gwg97hHvulyw3Whj48MibBunSDb
	 Mxtxfw9tR//VYfhildp1KL2wsdfcLr01DPwHOoWM3Zb0c6wgXijVg26Ma74ViAJPBeOmO
	 f0OvVMUoiR/xue0UwY4YD7BuDRnMnondl8zyGo5SVvD2ynlLvxRYOo5OHMRA1BsEJdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PrhIfmFB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gphbckcZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A4C60A261E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:11:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92A4C60A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PrhIfmFB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gphbckcZ
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29ABpd260686
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 12:11:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PFt9Gp7t593Dt3xqwIEF/MymtP/w9kZCYAf3WxoQwpU=; b=PrhIfmFBScL1Iui0
	pgEKY7pe8fJ2WxCEHP94PPE/CHghX2z9PwTyOvaOmZPe/lBdwXvO3RJ1k8cc8GNZ
	gPw8uVNnM0deStbn1wzSaxAm/bjR62Q+6bktlDSvr79S36vZUPKrOngYBFg/ZjLq
	00ldwUKLO2GeNxmTn8KzdrntjEMCrqdM75tTXELc1PLAJKOwCdAZ9VXABhQ8Tr6r
	lmslRM50yoSUusL5uNEGKDvQr/YFh3kZ4XnekIKMS2kqrZ0J5bG+imIxSYSHLoAK
	0b+X5W+nA3AsCLjncPcRcMz9AX3a2QUqrpmvNK3eyiCP9eF/SOo2vII7E8eAqxVJ
	vN5aBg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqmvrpqn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:11:04 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc450e6dc2so2324813137.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793621464; x=1794226264; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PFt9Gp7t593Dt3xqwIEF/MymtP/w9kZCYAf3WxoQwpU=;
        b=gphbckcZBYw4mfeTPs1eqpqhxhYQspCNFYH+LN8D0EuetEEZeKVpY5xmmphuOdCmmb
         GQjrSq/BmxK8pbaY6pNQ4bCF5YI+91OFFuvYP2P4FrJcLSHPUFYH1pv4gu8KqE7GX90z
         MTYN+ik+nTeeuAi8ciRCakueOPQcYCffNQELJJmiksxpmtnOZKycM2uOf4ALejNSP52P
         OvM0jvifKAAVMKzWMzGms+9ndQzX9n/JmAXDDzyOGjfrSReraSWVadvvKIdfoM3lA/oP
         sIG05VAdV/iMRSZJy2JOEfATyt+Dditj8z9aTuP1w4xbhaFtBkQDW7HWBdh3+2tFPqa/
         0UcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621464; x=1794226264;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PFt9Gp7t593Dt3xqwIEF/MymtP/w9kZCYAf3WxoQwpU=;
        b=MumBza0RgnGdLqYN0kmbaUcdoWB+Fsp9uxgHD0GzER74bjaN2s8IycDEQZb5jDkGBp
         e/HczcZYT9fhBw6zWwytA1/0JnPhRS6RhLnFUuOdW7PFzBqUhe0GpVcOSGq7zhcxdFCa
         mzm0LZvqVgLgkZJXoUFTsxBg/7l3uH5Aay1c9Fkeh/5Sfkw0j9JKlm+Bhotn+I3p8avo
         O6dgqOCw9VC7WBlClzXmaH7Zxw69shevD67Xj+1mUvnwNq5pH7GoU7Nd1qCbSfjsdkXf
         9RoqoVYPManrhT3es0MxKuVbWbzR5DBR/8snzEaLUIeoV0vpl5mT9hmj9DiY7lkRYKTM
         kBOg==
X-Forwarded-Encrypted: i=1; AKwUvBxIcNxdzSIDw+P59H3+My1j7wJvTVqZjC1yhwm4AvPflr7NDB1sXaosanOqb9wGxQ1EqMvhca4rHpmW8vA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/I6Xtv3cesH8xASrkPAeIymjslrJKgBKkx/WPTDVSnprxhBLAr
	yaCT9RY+S5Y01cYlWGKC9SDvy6RZTI5fx7JKhQfxSSZ28XkGaU96gL0os61+T6oFsYA86GMZmtE
	6U3YzWRueO7c0CO8lLE3mE8sSlEIkSI5WPuSrOBCjDeBnE2zmGLl0HOukZGsShwoaIKo=
X-Gm-Gg: AYBFou2gzp3HWHNudTzEmSSUUOJAnymFLkhGxsWe7mSsdJHD0jZ8FaxP8bNWacFmush
	JJkwJIHrMuhfSL9Y3a3HvxdGdtKTSDmYUlpk1HQn8YA9WkUnCiSXZ1/5rXX45hn4IcI/7AOS1WX
	VKpPPWmZT3lpWQzhMc1i+TPSXlb2v4TNAv4/76UN3bMLfvhHxzUnWysVukqNw8z0EVC9uXqV6H9
	VHN2pt48TdCs407XmBAxU0BNcl9Rrt0LGXteV2U0yp38fYi4UEx/+t1K0rYPKko0TnaemCWlNyF
	njMEZ3KemG04r98hqjcSq+/uE9oYEKRAnM5XXngccvFinJwg345lpeUZePJkzHYgtVG3168HI5y
	8LxQEbvBCNl0gQ5xzKHdECBcrmU63ZSkbF0pdGzRHGBy8H6emx1Z+4b8b+w==
X-Received: by 2002:a05:6102:c13:b0:7be:25d4:7ff0 with SMTP id ada2fe7eead31-7d072247a9cmr3560797137.4.1793621463634;
        Mon, 02 Nov 2026 04:11:03 -0800 (PST)
X-Received: by 2002:a05:6102:c13:b0:7be:25d4:7ff0 with SMTP id ada2fe7eead31-7d072247a9cmr3560781137.4.1793621462886;
        Mon, 02 Nov 2026 04:11:02 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b81c74sm19304405f8f.36.2026.11.02.04.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:11:02 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 14:10:47 +0200
Subject: [PATCH v4 1/4] dt-bindings: arm: qcom: Describe Eliza CQS eMMC and
 UFS variants
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
Message-Id: <20261102-dts-qcom-eliza-add-ufs-variant-v4-1-c92512c7c759@oss.qualcomm.com>
References: <20261102-dts-qcom-eliza-add-ufs-variant-v4-0-c92512c7c759@oss.qualcomm.com>
In-Reply-To: <20261102-dts-qcom-eliza-add-ufs-variant-v4-0-c92512c7c759@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1600;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=p/p2RYwE8qlgn7mg/EOxuBv4tDucnsUtXkwvRj0tEfg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq6H3PL/FgmpzuO2ttwzCe9HUeWIjFpcMyi8c59
 POeNhJKGmiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCauh9zwAKCRAbX0TJAJUV
 VuDeEACHLrqrQI6LLulP2556SgJhAuFF0RXuaxpio3Xrf7E+/yzPTCpZMvCdr/s0Z/as+P2l/fX
 YIZ1npu39ZQ9xiHBquroNBCkdeWGfcw6aRzjfSgEmWoUrXBKgaDPVyzB/wSJEbNar5UaY01BdnP
 ibN7q1ZBd7liHAjcD0eWGmrZ4JD8SpHwp3OfDYIuj0hfG7SGltGr2dbAAoogiswKk1Z0NT4Imns
 iDkXM6c08NwUL1qeV99EfApmb3KUw+Sfsrn0D16zQtKzOwTGw9py3J369csfm1OjFc6cSWoXnpr
 i+02gtLaJQuDN1vTclbMICaDKlWHXyFXBKmP+esMDF4Ev+gjkGtWexRg0k7G5yAMCFQP56k9Yk9
 mjeY+lcqxFwzy5f9k8Qr+rbfknKUPL614w64xD/gb+Z0SNKotudWHaUFrqqfB9U0TfSyOGoFiTT
 iY2ogQSUR9ZHlXr8pBJMKZQSUJqhZ5eTseOMR3znJzpxk6JjsgyrZQ8FGatQ8+X0nE0yuezie+K
 B/D+4tspFA2JeWvO+ds6xcBSUBpG/1keUmlHOYUtUQZkrieMvGYdE5CxNncsRW0NBKq3z9jwh1B
 ClxJ/U7HeeG8DfVdHLkDn3MbW2iGbufHTwUBe6djmTHWPfSk4Zcb8+GzVkX/0DTqzttijMf5z54
 aiW6fgMgzT/cTuQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=TMDQ2Fla c=1 sm=1 tr=0 ts=6ae87dd8 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=-EGYiVr9cHPlVdSX11wA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: nc2Zfjc90qI5JAW-pNDseyU0NOa3QeVA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0OCBTYWx0ZWRfX7c8anhkgBkAl
 S9Z1vaZU30Brs7cmw0Zem6lqrIAqqJ76NtCkSNBDiTmHX5VNpDbXzK1YdBfnj5lc7efxwU0+0Cx
 j9l/GElGCJCOxg9IQnoLvF7FH8z4szg=
X-Proofpoint-ORIG-GUID: nc2Zfjc90qI5JAW-pNDseyU0NOa3QeVA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0OCBTYWx0ZWRfX6+BE6UT0hExK
 0yDsn3sE4znlsO9QZspemAaoNizI9aXoPYPo3IbavtbJgnzRm8dnmA9lL45EDts0mZJanY5sdpX
 nRaZnYeR/JiTTpS8h1a+Y3rlcFon6SBLgKR7cqAQ/rhgausQAnFeYqmDyovidWhGnXp5bKH5QkG
 inVDU+zmuOldebyGDe4kAdVh9ifHh6Kab3YvRlDcnMmfd3VpC6gi9/ZmFHCmSuh78/EJa1wo7Ej
 vW0cXicoykUlEOD16P5Vq2ZXGvvatfHJjXWSxiBqYhzqFDAGfljE80o8t8P4hx0xli6gWsv6Cg0
 xd0tpacIno7GbjfloEYqACesotZiXwZE4OAVJgSoaJq5lRz+hvhcT2WjK2N9VUTuNrPBphZTq3E
 NHbBftVhdIkS20+O5imfPn6O4RL1AuiIDDFGTKNzXJkUig/FnlEIIyRjyR1wLXYGEUsXyTkKayE
 sD4XebbvxP6FKTKXn/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020048

The Eliza CQS SoM is available with either eMMC or UFS storage, but its
compatible and the compatible of the EVK assembly do not identify the
storage variant. Both SoMs connect to the same Eliza EVK carrier board.

Describe separate compatible strings for each SoM and for the carrier
populated with that SoM, so the two hardware configurations can be
identified independently.

Neither the CQS SoMs nor their corresponding EVK assemblies have been
made publicly available. Replacing the storage-neutral compatible
strings therefore does not affect existing users.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..a75963b30186 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -56,7 +56,16 @@ properties:
           - const: qcom,apq8084
 
       - items:
+          - const: qcom,eliza-cqs-evk-emmc
           - const: qcom,eliza-cqs-evk
+          - const: qcom,eliza-cqs-som-emmc
+          - const: qcom,eliza-cqs-som
+          - const: qcom,eliza
+
+      - items:
+          - const: qcom,eliza-cqs-evk-ufs
+          - const: qcom,eliza-cqs-evk
+          - const: qcom,eliza-cqs-som-ufs
           - const: qcom,eliza-cqs-som
           - const: qcom,eliza
 

-- 
2.54.0

