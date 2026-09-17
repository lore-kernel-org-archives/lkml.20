Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6164D6C23
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646096; cv=none; b=B/j5D3r1iIgNJVPqsQG9AlgVTwgEFrnCJJDxUYGORxUfHAn9Kp7jty1nA96wDebWP/JYoAM6bgelOCJ6zC6uEDNTt3jee3OrVdJWCF1rKK41miAPz6s3uw3mKp0so/AORzCu0fL+afXVOfacyKs8KRe2sas43LF2ZJBOg2QReIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646096; c=relaxed/simple;
	bh=o5+5tvpe0ZPElsvDSlWdf0J/aKPzIjOAQ/3OGEfPAgc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eZP7v+Xf8tBvIkG40ffnM0uw1rVKmaqVe6/uGh4iTDZUAizgz8kHLbXDgocxlAcDVFftv0MxvN1RJC2rLBdwLQcs1i9UVnaePk9BMr6EfOroOI38VNsfLiGIRhQraDJI8Pf9EAgGEVrNTXsBuIprZMeZROD9goPE21wN7rkhtiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fa9XRUS3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=an1IJ64s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fa9XRUS3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="an1IJ64s"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9Zpxp1863021
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:54:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZC54jYxJJtuuW78KoOpMV5NKoYluv61XVYUBsfKb3t8=; b=fa9XRUS33Z8gxgy3
	UfjfnRrJ+nlof8ovW8+nKgZGbWWhJiS1niw3rJ0aUhxf5hFfW4mJUoJRBf+eOuin
	ElmEIpkC+0wrVY4QkjMkXPmJtiXO5QRv6vbUFoVIT5IK4MqxkzlixFm2DGm06tWf
	osWeSRMjFej7jn2E0zw7po6ogOxnM0zsTJ5vEGpTVEmIELuU9lU/Blg6wCANTxkE
	byckj9CW60z4MnlAoPG9jAkKL4PkY895X53Sy9WAeKxNAZDLSLTb0qq6YIwbAHee
	7HAbO0dzvxSGKvbPXqq+VLssqMgr83jfMoPK+shCBFTpNO7cz8W6TUQycY9riG/5
	h+ny4w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy6av2rj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:54:41 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1eb205d31so1048205a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789646081; x=1790250881; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZC54jYxJJtuuW78KoOpMV5NKoYluv61XVYUBsfKb3t8=;
        b=an1IJ64sTZlH7ORh5g9y/QPR7d09lxTfm/dgUYrAebGp4viLkZVdOP+BVLJcZVPJbs
         qgd9ANSaMq+L18baz/TQJ3XF2ds4AKOnT63nr60uySRIVCvguClVdoKeMoB6XzHEDNYB
         B3AUhv2z/FO+Z7oxnZ1/oyFyPTYTjlcpkh5HkXkYoBkOfmuJcFmHqjOjv7GsgQE8TINq
         idAF2TQRg/5iLLY561BQb28CgDsfqAOx2KRUXazB/EWGJ5xBFpvbIISwSQo9XbVM5bES
         XypqwSbbDwfcAq36G+FHY18o4CttPImZJmAEByD/JWjOc4JoyRmc+Xyka7HH0pp88TIy
         L22A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646081; x=1790250881;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZC54jYxJJtuuW78KoOpMV5NKoYluv61XVYUBsfKb3t8=;
        b=J+EI+k1ScGlhDLYN45jp7QBPfF36cTHC1ibmzzFbrKgDTsbe5n8VXgEBOtU72s+Ia2
         iIuM9NkQA36CWHFPbBb2SP/wunZosmMGMJhfkAFptHWKvBlbgmguBArHg8olc11o5au3
         6dI/stsBIyCe30jtgDClBLDGNYl9AhGCdM4lPOiNgil3of0jRJ6hmfPGx8VVdZAQp9bc
         u3Eb5AtMAjO2vqtWFlWegAwjUvY3xKpiOjv5xdPnSqVpRe5mdav/RePb1PN/TKrkFGNt
         lXHk8Npj1vEmNLj8BRuDLCQR9KM63CYo/1/VN1QxXjlBr1tyFcipDdV3uRxuqKL7N0Kr
         w3Cw==
X-Forwarded-Encrypted: i=1; AKwUvBzqQEyQ8FHNAXPJtJmr/vkALrSZXp3p5LYi0rkUMf0JJ/vvy9PzRA/F8JQvhicN4wp70HWVR3gNFPAXFb8=@vger.kernel.org
X-Gm-Message-State: AFuF++mcJuEzlyYLM1Z7x9ePP9A3QEMjpMrUokWBRkKWy4Ww7NOEQ3Kd
	QfFniG6fYyPITbOpJ9y+J9C6gBFRF68MD/mcDxhs+WW7EN62o12pGecWP3Q27BiKaCOEhvIuS3q
	crOxnCv6S86PEegJxMBLORvaf/n5SGCony8d3y6RKOYEG6624r0ij3Q9jniWgoDDevoM=
X-Gm-Gg: AYBFou20zXRcNVp+qo4q+6npTao0+ZZc5sUTAzfI+c4vaPPoLbLVir7jWBVjMZQs/ES
	bNBsT1yq7NJn+rvDgJ0IRSpcBb1Sihwrjr3yzYOEe+Grh5dta2EMb/+3cELFZyJZUq48JaBJqCj
	c8ecIz/LFGcIUOo17von27m6VRfwLKdZtVpE9P0JpxECbgDApnVbq/qTKs6lzQ90g5IOg03X8ss
	haXi10CpZ2ufLV2Emvu9IovKmKReuqictpGDshNZupt/uQKxT04ShbZkH4Pcp5K9Kp3DO7cihcy
	xWkkETVi7gvv1QcvKZ4bfIFJlBIOz3BzDePnT0GYTkk4pAA9E4WsL7khhdi/8VxdYDfUz7PZTN5
	x/9ZwUWqXv0b8ZYNej84TsGVqUhQOUQg10Q==
X-Received: by 2002:a05:6a21:517:b0:3d3:ae0f:5269 with SMTP id adf61e73a8af0-3dd5f72b339mr16718034637.21.1789646080742;
        Thu, 17 Sep 2026 04:54:40 -0700 (PDT)
X-Received: by 2002:a05:6a21:517:b0:3d3:ae0f:5269 with SMTP id adf61e73a8af0-3dd5f72b339mr16717976637.21.1789646080323;
        Thu, 17 Sep 2026 04:54:40 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf596e1f6sm18249500eec.1.2026.09.17.04.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:54:40 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:24:09 +0530
Subject: [PATCH v2 01/18] ARM: dts: qcom: sdx55: Fix PCIe WAKE# GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port-v2-1-0d627d0856d5@oss.qualcomm.com>
References: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
In-Reply-To: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789646072; l=966;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=o5+5tvpe0ZPElsvDSlWdf0J/aKPzIjOAQ/3OGEfPAgc=;
 b=Wzddv6EHdKemMLY4IIEjkKoiDG55j631UOXiqRlnlH4xAnxhjM8RLy3EEtX0Gb8sBQ93X6hNK
 mwCiT8gmLGJBgp8xO/YmYRqH7FilkLrZH1NQdvd4O7JhOhyG8XbRqxO
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: 5d0V94Hq2bGL75cgycj5kjmY9B5aTOfV
X-Proofpoint-ORIG-GUID: 5d0V94Hq2bGL75cgycj5kjmY9B5aTOfV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfX8Vv4inTwN/iR
 esocTk9rOJ/HzSImH8I5C5EL2WAVRIZvJt97PJjSvUrL3pkCbDh1Z7athqQlrlDcAh6my8TkYTg
 WXFUJDjiUN11AYspfqh99pB63CYOpbA1hdSGDttpGoafOL0rQHwaWMxBzQb2agTXXy8ckgWOxJz
 fxEjM8xiM5UT1VPiR/n6+mQIqa7bs0hsUL4fG4+Cl+XKr+yIM9NPEVVSmhehESi2uZor1rqxFCI
 qoOyLm+4ne4Txx0dhV/tUZo0hbAW/9ZCoFRbNMAH9gnzQr7Z5bUcdgUYGWhOMLWwm3dJ9LRJtk0
 5ny9s1k5IsrnHJvcBbPEyFcfk0OdeutlGl3oLvsbbEBFW7/Oj69+g8fTeFnk+5dedClT9YWUEKO
 3eMSFkgLT3TblS6/0yvwhGapGXgX1frM6P0DMBek1H3Rt2R9vfUuaZpKZ+W+Eq/14LRcWPUpjpZ
 NPXHqKmiPa1Pv78oCHw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfX0Hs5F9M8nW41
 RX5M1mOPOViqCOMbKZOGeeYqlCj0xbfJpA8O9/QlOktmrvkvO6zZ0czNa28jkZ/eiPSFiAYktaU
 mugN9Uy6hSzMWW0Xml6Rg6uduNF2wt8=
X-Authority-Analysis: v=2.4 cv=VIRIDNPX c=1 sm=1 tr=0 ts=6aabd501 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=bRpLjHfgeuKP4GRv53IA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170166

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts b/arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts
index d23b8ec08af4..0443a86899a9 100644
--- a/arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts
+++ b/arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts
@@ -249,7 +249,7 @@ &pcie_phy {
 
 &pcie_rc {
 	perst-gpios = <&tlmm 57 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 53 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 53 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie_default>;
 	pinctrl-names = "default";

-- 
2.34.1

