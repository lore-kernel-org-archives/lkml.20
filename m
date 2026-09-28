Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F394EFFA8
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790613428; cv=none; b=j85jQn4K2cdHjaiE+6D3FdgDxDmnuDMIvsErfYyIZ4/pK099DH62anNCEdvXWJDvcRQK8OuizqZDLqMSTAX9bAUMDZPkMMfbhg1y+div1326O+gkApGL1mrfnUe5IYH0R7Vxitutcd15qZ93xqEwv12zfS+jHBTRKRZ83exTXE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790613428; c=relaxed/simple;
	bh=Hz6nSLvERarJcpswKoCGaPiC7o7c3Wp0wvALFhB+HAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ikmrq8Y0POGztYp6Ml59+R6Ddmusf2ILTHzBO59PrGg2/vxRmvmKJtn3+X4yiRkIyNWTCVJYf9bQJBtVOP+2m0z0Dj2/C17/emS/CROEyJpSay2hOn45RpW2ikpNDSICKWO2l06zIQ2xdC0o4sHrWqKGG06Apc7+ouex3/+PiIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UH+tD9Zc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FRhGO4XN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UH+tD9Zc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FRhGO4XN"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEeUJc941406
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:37:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QChejG/yc+frR0pXhbdMK+PnSxJtugXyhH9OrihQVPo=; b=UH+tD9ZcIgFPu848
	ZMCFLQxlZM94iFmokqC8SkQ6V91Ddh9P4iJrIs7OTT1nyqYRk6xB15q70Nrtzzwc
	s8F4/mzCGX2AQroGDw7y7qlv5naCHgljMNgmkjfuZaDtEfD+lwkB5u5kKq2Oyc3Z
	rEZuUWSLPDKoaOm4cZ6nlQ2nbI5BAkETBJbaGNAc/v2m/EQJ5uxCrJWHKZDx+NdV
	I719GAmQ5y2Sh8ZpkgTgVmUcdulsQcNZIuQFrOOrrcai+e/LiYKgsFuYH88wksES
	hhQb6lTFcegPWk1YdeKk1EA7cA+sj9LosNvdGW5uN9YiU+miiFooX0Q3e0SUIb4j
	fzBwNQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyjt12efv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:37:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936aa34873bso628383985a.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790613425; x=1791218225; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QChejG/yc+frR0pXhbdMK+PnSxJtugXyhH9OrihQVPo=;
        b=FRhGO4XNebomRw6lIrZYMMaF/cvnQmNEE61nnA7tHZ9kbZpVy6DV9JJFfjjFNYoiI3
         vj8CzqAzA0p993TrM1jCc3EFwDaJKix7o/xf5iHfsTjetbb+45/L6vXIntPC4B8A8oUC
         pQCo9Cgf/hI7WtoxnfhEXR/DXg8NaKundRlj+pu5BFXgYkHg2lCP2y758JZoHSiGRf1z
         yG4MEy4/bi/4X5Qd6xBzfo4ebpIVB/h2UJW3ggSqtIxHPUJXtkf4v+E0adw+OCA5RERG
         KEqPwEPDvX8/CPUkhdpiUmKXhR00ifaa/AWaIgD9DSKG/0I91aKzOhxP1luAE6vd96bu
         Y0gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790613425; x=1791218225;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QChejG/yc+frR0pXhbdMK+PnSxJtugXyhH9OrihQVPo=;
        b=xDnCaa3G/ToOoL3eMr5taCk+bL5rA5jsZnRLw9fDOltm3yHJ5ut23/cSiQ8LS2ox9Y
         aHfK6IYXXUPwKhCm0/8G49CpG3rezD08P9+7MtvjvMPgIE5Y0YIhjV3LKMWTuytx0M19
         CQgeL3JCBRKN6RKELo0JiGBMHHBwhrRsRNTgfUsRvw9NiVDKAvToakue4gNNgh2sD7g0
         a/FdH+Cz3RPbHB2EDsyl557VPCQDcb4nxZdFOTbQFGjA6+NVg1m2XZx/t9HxD1fhdisA
         PDHygmO/1sHatFwgbM1QaTn3v7UKvV1g2i7E5VMoZL+5koeJ256wwMRYZ9rmJvu9/Z3O
         shUA==
X-Forwarded-Encrypted: i=1; AKwUvBx94G0D/s9VizKsSoQgkjbxCCHoHFd9BcHjiTyRmpEHx494VDXY2ykn9BCdRazdMe2XyZSTcpOdP7S9HBo=@vger.kernel.org
X-Gm-Message-State: AFuF++l+X7qUwkcSDQ1Dyv0aLU9TulHCfdooRFmOs/piQuXV7c7coGxx
	xbkLe/3txhDBb5Y721pfO/68uM6fiGf5NiLaypsYFiXtPIS4XH/TUZ/PVqkHrXvVF4VtxLKbtpt
	7wP4KBzt1cywdzDpsC0+EanmjdXBMoKMnx29P2CZl+CBw5WHnQ+qA2OWMTE03zZCf+pQ=
X-Gm-Gg: AYBFou12IFrD1/LXjfoN+gLzdGMkICdwQFU3wJ44/zVQ0XppFGRsDaVq798Ou3XeL93
	ngEiCG/JZw8tr3hMSZZztXI8T8zLyz+OLNddkM/Y6ZlE5gWuGJo8hsyoxPsqx5Qd0suig3eiZIS
	KbfoLsxb1fMMyv3kAeSxA0wo7AoItxcLFoQ/f4leYhH5cECf3CY8f4xYzfd1s3HfMhKfqdKS7vL
	0ofjZxufQNqr2/Av+1Co9uMRhAj176cBIbgWcnCotZza8wz5oD8JaFc3xC7z1Hjls5oXIvubIh6
	OyvWwxH8SDbsUuL4lTaHin+g9u/STpY2z8hPoRw5L3WsTFPtxgha1LYjuvq4pHRQ0/wv1OYy3Cf
	i1MtZdSHT
X-Received: by 2002:a05:620a:400e:b0:93c:2110:14ea with SMTP id af79cd13be357-93c43ce4e31mr2097829585a.48.1790613424600;
        Mon, 28 Sep 2026 09:37:04 -0700 (PDT)
X-Received: by 2002:a05:620a:400e:b0:93c:2110:14ea with SMTP id af79cd13be357-93c43ce4e31mr2097819685a.48.1790613423900;
        Mon, 28 Sep 2026 09:37:03 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a6456f8sm28442084f8f.26.2026.09.28.09.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 09:37:03 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 19:36:50 +0300
Subject: [PATCH v3 1/5] dt-bindings: arm: qcom: Describe Eliza CQS eMMC and
 UFS variants
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-dts-qcom-eliza-add-ufs-variant-v3-1-9a2fdbf6baf2@oss.qualcomm.com>
References: <20260928-dts-qcom-eliza-add-ufs-variant-v3-0-9a2fdbf6baf2@oss.qualcomm.com>
In-Reply-To: <20260928-dts-qcom-eliza-add-ufs-variant-v3-0-9a2fdbf6baf2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1600;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=Hz6nSLvERarJcpswKoCGaPiC7o7c3Wp0wvALFhB+HAE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqupelPP4Od6LP3QryvMK0d8okf3qY/+3TmTqlH
 4Rzfc7X5DGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarqXpQAKCRAbX0TJAJUV
 VmhqD/41XUbSYyyl9ZCXJB8IQB8U5fUhLyj/hc591rIfIiVOumbS6cZOTW7Hu7APcNAzJ6OYJI6
 Q4aO1sfRXWYFRXFiNQ//tlonWlWGC+b82zktgs7vJYFBLE0vmy8b8Ga48SoEGEMcnePaASCJcvl
 1X0svDlwsNdFfEkZEoVIeNo8MyqZgfLNVDHqkz7/NP5pSCAh+kfl7GK1HnCFhhWmKq3bxDqsz5m
 HmLmfVOseCkITDwiAYOX9g5Ml+x28VAJqLVBgLSlW8Mp8CX8yd0iPULVnr0Si+OyMeh3NZ8dAn8
 1fH9q1RgZpya/rLDVRdotNr9yWbQIqKvQr7F+PBzgXzB7KqtSLa7+tXXvUfEeFGtgo5HwpoU7ik
 1icBnDNx35MpGE0Qa6Jtscq9f0eutX+LsD01AFZIxcrpCNaTGYqLoV3Yc7JGISJK0XtQL+egztY
 WUrh2nsKqWnl8U/7YWUGgK9xgGYiu3Or+CjoHbhVNcQ7UXSZllrZkydJ8OsKNsWgwo0fqdsVJY5
 xtVu7r7nowZZljVsoGkpii7/DRB1iJLGsXzwPzVLiv4xwkWfRoElvYdVfUZVNs1FGt60jBZsPIb
 DN9PSqAZoxsTWMVQ28YCT87rAnh3+9I8HpOXpzg8dHLW2DcthBdhWK7C/gGRtCcR+2yiDcgna6v
 F/E7crAEDyL6buA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2NiBTYWx0ZWRfX4IBGphpu4c4T
 hPhKf0RGm+RT6n9Vw9dBaoOy/hrVZmjipgw6SX14ViUAyyGy3VFr+cY7OOIo7qLLl52u19Puqg7
 u58Jv/kB1txyP6l+WTHvb9UKexwjEUUTyYVG8DJKScywVwnxvJ4Y2KAcfsGxSmJbC083ONpoK1W
 7uCoaqJdu0UI5vqCLDu5QP4qUAxCZQ0bqOMQCTZIBr6K+GbGgH+yvxnSEcjdd7jh0AKgWnoduCj
 kTGyyDdBjJ/edG1eytyEHf9V8oS43UYWgCHZLq/M0yycWB4mjUG1FB9l2efwjgQurGwXGBCONaU
 xzGYkIo+L2iGzNE7QAnG7BgCj++O24XuVsdISvB8RoXdnR8kT/eyNDpNDSKzAmEg6oNpbt9w5r3
 PjGIBaiS/AAO5vsd9F88CsL4JTJRC1wmu7vhq6Undg+iIL/fjBHwKDIdE60E4LWCj4rOD9Fq4F0
 00VO8A0MzibZCyDJgJw==
X-Authority-Analysis: v=2.4 cv=V8foQuni c=1 sm=1 tr=0 ts=6aba97b1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=-EGYiVr9cHPlVdSX11wA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: TIfXsjJA7DxC5IYq6JLlOJSLiBnkHiU2
X-Proofpoint-GUID: TIfXsjJA7DxC5IYq6JLlOJSLiBnkHiU2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2NiBTYWx0ZWRfX9Y0GXtnbr96f
 CDcIcQ0y3TXoF9aPDuW0w+Veh9giQ8oHV84mq1aaYkFe7aRGRtezS/5y5PrOUCbn8MAblPZpdFJ
 0YLoyNuFuPSZuPFPursZLpxD5bL+KPY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280066

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
index 18a13b4a460f..1aa65db77bda 100644
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

