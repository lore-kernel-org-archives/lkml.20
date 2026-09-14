Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D224266A5
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789382715; cv=none; b=P6i0uCNJCC30WgTJuHou6ALD2mmKIk2WGGrxk+y4HaY7/P8Yc9RGX5dG2qbmk3gFB5iY3eq3f+YCLrxfivFAOaoKtTTagugSQrRdOpOKAECnkwBdQQhsTi0IuhPL6XRD9V9ahwDkVqaaFHtzOUVDsJk9cO+fTBQT8WP5UO33eiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789382715; c=relaxed/simple;
	bh=LgVLOg1arH3h6yph2weqhsiaYO9KaoHGIb0VLd0w+9A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=vDA5Ik6JPiZ0cs+8FIWw52r0VRJh1Yg8XFuFbJXSiau9XyK1Ofjq/AsBaR5zttoVZYlBJ497qdsNvMPQ6lfXFVUI7TDB0moGdaox5Zy4AGRbchdWi4kHHI33sMPoer6UWuR/1h3GIgU69Hg/hW6q2Cah1KkWs+HDsM8MFez5OJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ni8fuoLd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OThLJBLA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ni8fuoLd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OThLJBLA"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9nfXQ401813
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:45:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bVt9ANX2ebJHpMR9J1dO4N
	fPSwjbfp7C4d6bTEwou7c=; b=ni8fuoLdBZyUyB+gFjLwlRzQaJbAH42Z8ai4Hj
	LkgGfmUmUNN2pIBMVhJQimyteKr9CZcAqyYpSVadmfipY1YTB0lLwl6f1ac7mZ/p
	PJkJKQDCvfDQ/nKjYGyqbNoijvGD/R2Ez1oHRxiU9bSmo3hH5mQttGAtbM9ZD3Sn
	aFxT3+Ba4jk4EgZPErFhK/ZIIi3JYX8B4hvQnQrmPJgeO0gSAv13vHzQoQwvB/zj
	VjQwQ2GyeoqD5Xc160f2DV7rn2E2tqxpl5wLe4Pa0kMb9tkZ+atLF8jPWjErSMAZ
	bEOBx1BhOzh7x1cdgRK7HyMgR9PLc3HkcRWuXT+irY4nc+4g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hst09r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:45:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934963b2bc0so653300285a.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789382706; x=1789987506; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bVt9ANX2ebJHpMR9J1dO4NfPSwjbfp7C4d6bTEwou7c=;
        b=OThLJBLAc9H6o9sHUXxzT0dJtnEPOvRoJvn8wuDQY9ik0F2ZQ1ndfnKOFJCL4rKO1V
         jzpjsqDNF/i+jeeCocXo+xo73DzLKs8caqvyH7LkpdI3862uKd+o+i+nxedtB0+K6szN
         s1Z5zTVmigAJhc8cMkkDV4U4w5ZIynUeTSTx1Y7roXgbrcAHdE1SwxCcixF+cPbsaYKu
         BMxkqrawYbCB0/ZQ0188cjz3P2O68jOmh4e+T6xRSukIRqgQdWFLY/sf0vuN3SyG7UQW
         KV5WBQEcCLzhYZ4x/2o2D4mJPZNBuzmkd3PVYyHAK37sRYISfY2FmQik6WJ4FnKmobwC
         jb5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789382706; x=1789987506;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bVt9ANX2ebJHpMR9J1dO4NfPSwjbfp7C4d6bTEwou7c=;
        b=V8lmiv1b2QG0Yclg/b4aLe8Id+A3nFV0588GgInFXaNieHCQI9Mo336ukUUDHDss7K
         Y7dJ69JrVNpswF3LBgMLdIUzOgZ5Dn0BWUbGAbdqQ+iRdYhp2qA6JCTL5FwaPl2JuXNN
         9e4JcyuuRsztx6xd5c4Mdh4ya81wofDj2dBwux6teN1p86atZzpD2TPyO6+Vn/ggCsqu
         yMkGR7fegvGBJY3ozcziFbm7coQrFWhz/9SlVDtnecBhNA8Hecho6N9XOHZjQtruxi7L
         4BIyOOW/y6UBKlnXM/5r3lUMZMh1Y4U9IDVjcH3WwLCXbaxqQB/zdWLSNbssSRa1DiN4
         4qRg==
X-Forwarded-Encrypted: i=1; AKwUvBwyb5g1+rjxc4AOZxnGxPByYh/aO0rfBmhNWWQEXojjGaP0XfVMidEkbOmo5zpFxMPwogdvIl42wtCkilA=@vger.kernel.org
X-Gm-Message-State: AFuF++koAAGDqVtCSolwMNKkKxCUDjJlXa9DM+DRKVcR61r7ydptH6IA
	VjlPAQmPUgqnZtabuUzxaFG2aPqKB/OnFhZp3E31i5/MZGgmk0b0RlIaXbceR7MPEC/VGyuzQ9s
	tSfMCqyImX1EfT4phyN9i87EhzlBefFKNyHW6+BmdVWepvhKYzTlwFGryVthiQBG8iTg=
X-Gm-Gg: AYBFou0bpkLC2dv0liKOxAmsDI2Tf7Hw9ET8jclV90jO69eOHTLF0hcLzTvC0kqfFKR
	WYbu4vZvyTyDohpsoWgiuRB6gT5qy/TNtVheiakMUkYlr1fOQsZyaS0N5b75KVNGvkztQ+1pinV
	wjRy4B0jwvdVCKB3Ibw23R3QJuAFcJwYW5qJ/a3AiNUbj0a02t5vHpzrl9kduIaNxAZrSvF6gTp
	LctVPMWE2Tyj9nV0xIF/CfdBwQML/Z+uJoNx2ZD1XEDYdLcEb3H9lOQkGwvaYJruj76hfxwexVo
	VppZQUVPKDTGi2RoqEHEAsAOX2zcJTHj6xUy+KkFKXZX5/zpP7B5VoS9o8oKj9P55SKczu8avT+
	kHZ0GJ/6E
X-Received: by 2002:a05:620a:198f:b0:91c:c20b:a135 with SMTP id af79cd13be357-93a29a07d04mr239682885a.40.1789382706119;
        Mon, 14 Sep 2026 03:45:06 -0700 (PDT)
X-Received: by 2002:a05:620a:198f:b0:91c:c20b:a135 with SMTP id af79cd13be357-93a29a07d04mr239675785a.40.1789382705592;
        Mon, 14 Sep 2026 03:45:05 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ee8bsm26335926f8f.15.2026.09.14.03.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 03:45:04 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 0/5] arm64: dts: qcom: eliza-cqs-evk: Add storage subtypes
 and rework generic parts
Date: Mon, 14 Sep 2026 13:44:47 +0300
Message-Id: <20260914-dts-qcom-eliza-add-ufs-variant-v1-0-78b3249eae61@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB/Qp2oC/yXNQQ6CMBBA0auQWTtJqRWDVzEuxnbQMVqkU4iBc
 HeqLt/m/wWUk7DCqVog8SQqfSyodxX4O8Ubo4RisMY2pq0dhqw4+P6F/JSZkELAsVOcKAnFjEd
 nWusbvz+QgxJ5J+7k8xucL3/reH2wz98qrOsG6IepU4IAAAA=
X-Change-ID: 20260914-dts-qcom-eliza-add-ufs-variant-74092c6c35a4
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1707;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=LgVLOg1arH3h6yph2weqhsiaYO9KaoHGIb0VLd0w+9A=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp9ApTMOdveQxC+GgWs24vgVerOyzMma7EAhXl
 IWzjH1+QSmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfQKQAKCRAbX0TJAJUV
 Vr5DD/90DWRJJAWm10lQLvvjM5+th4W1uJ73J00f28H0HieOBxzaTbLRNrJnltOreWkdLqmghQA
 JKw8/K6OY5JDwiQUic44JTh3/60AGaV7lWRcMm8U3WLIP7Lp1/+GpKS8HYEl/VBMqXbjFr9AvtE
 zW4CY9JS2sNVTQMNRpV60Ofsg58jcfcP81cM0G8CbU68Qfu1z8eGu4dJozEQ5+bTdmFcfgUBflg
 OEVVUPhanXEC0UEJ42ZruUGfwAmGZNoXZjuTtvR48aA2PnESotXHzlpwGVlMKpwTwBf32AmXvpE
 FP6IGSjxBy1/Ltcae7y7/WLNXm2r/tvZv7GZqoAHxcujJ+07EoZhbz6Uy1MFgeiBwZBfEK/TbFM
 zS8gRpcdtzvQe5aXuS0YGvIHz0BVu4Z343Bid/cDWj2MIK8UXkuK918E8pD96HLpQ8rJI0+jcRO
 2dL4MAcp+gEmnQiZEBwrpVXlvBUH1dLz63Rkbh1CMO/HzqOoo8MxmsMldUsAY3C9ZW7EUDRy5cQ
 P4AuSouxyf0mMW8LhJaLBjJb41Ab+niNMzwoErtnMkko35L+4YGnLO6/Z/NPZwxeRZbGykTbQ7a
 aTu0NEYrUBPwKVqlKcVeyYc9yn0DDyP00Ton5v9dog/wBz/UBkCVd/c38WaT8HjIHAAlm8s6rNv
 3bw59rCxmX/PpmA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NCBTYWx0ZWRfX+hzLx7LBuLXm
 2cXH/YjmWFUOJCklw9OOe9BYHgX5skuLwfXrpSEi1U7p2ZzSSKTC27KnZZc/UWKYBApRecNcrxy
 5F+FVTDTRrNQZ2VGRGLe+X5pkxNAJEQ7XmAegtl7hby9q/OiiTCsxi9+HGwgILFvYM8yXY+0unH
 StMRxKAbUEaRzs4IHsWYK/E3X1SHuMSoeOTvVl7297VCDxh6gAAsm1+2PPMTpv5WD8RugsS/jP6
 maFbZuW3oo311UQCHlWVv4LNmJvsHToZ0+LnG6zhqJpe+y/UCpFdSUpBRBbzOHCaViZBBRpXpN6
 rFJlEwZkbJplyRVgVqR4ur5bNWPrzAzmghzou/W+WAEsaaxcXAylrXKZxXw6vJzybekj6Bv9/i7
 HZ5VWBVallMpZcfwjX8N3Jfa4qHblhwEjznv545pQodxk3p3C9gIBrvhL5f1Wgmzi1TZDSswiHH
 KGLdOaS4L2pQSbzX6uw==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa7d033 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Ujb343AK-uRHTq2VCXsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: _wZaMaPbhZjfHHtvSauvgbjkRnGjhMCm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NCBTYWx0ZWRfX82EWgNFrOTb0
 IHCxjLmFG/rwsMVvaRwnhQiA744oPqVvRamOjJgJP8N8Wfs9njf+FVjTVHjYpwXN4jPkcFPEAR5
 XpmnhMNNpFyHhAcO8EjH3DlSIr98D5M=
X-Proofpoint-ORIG-GUID: _wZaMaPbhZjfHHtvSauvgbjkRnGjhMCm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140154

It turns out there is a UFS variant of the Eliza CQS SoM as well. So
lets differentiate between them with -emmc and -ufs suffixes for DTBs
and compatible strings.

Adding -emmc suffix for to the current Eliza CQS SoM and EVK devicetree
files will not affect any current users as these boards haven't reached
the public use yet.

Also, move the sound card support from the eliza-cqs-evk to the generic
eliza-evk, which will allow it to be reused not only by the UFS variant,
but also by the Eliza CQM EVK later on.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (5):
      dt-bindings: arm: qcom: Add more compatible for Eliza EVKs and SoMs
      arm64: dts: qcom: eliza-cqs-evk: Move sound card support to Eliza EVK generic
      arm64: dts: qcom: eliza: Rename existing EVK to suggest eMMC
      arm64: dts: qcom: eliza: Add CQS SoM UFS variant
      arm64: dts: qcom: eliza: Add CQS EVK UFS variant

 Documentation/devicetree/bindings/arm/qcom.yaml    |   9 +
 arch/arm64/boot/dts/qcom/Makefile                  |   3 +-
 arch/arm64/boot/dts/qcom/eliza-cqs-evk-emmc.dts    |  18 +
 arch/arm64/boot/dts/qcom/eliza-cqs-evk-ufs.dts     |  18 +
 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts         | 141 -------
 ...{eliza-cqs-som.dtsi => eliza-cqs-som-emmc.dtsi} |   0
 arch/arm64/boot/dts/qcom/eliza-cqs-som-ufs.dtsi    | 421 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi            | 139 +++++++
 8 files changed, 607 insertions(+), 142 deletions(-)
---
base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
change-id: 20260914-dts-qcom-eliza-add-ufs-variant-74092c6c35a4

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

