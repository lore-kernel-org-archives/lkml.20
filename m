Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3596F374A0B
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 12:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791547592; cv=none; b=J+nkTQrR4pV8aUlVAUAYAtCeBq5Wdl/3u1ufkuu3WV8/IeNYWfdT2VnTIfB7Pa9/YMqdZMxW/dlIIoAsDV6LTHKR/BxgQNm64F8cARc9IyoeTehzzcY16s7qaahCn1OqjbpRY1lE+QDmIVZr0dd69wTIC5RJ3blylDpfqO/xEnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791547592; c=relaxed/simple;
	bh=KW0LlYcgIekVd5iwGN9xOxzzRGAL5Lf3F0H9QU9QRBY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pieASYwdl1ctP2nuYHHDTKqn4juhUaMbODX0vL68v0YwV0vNjfCTwPfI7H/SBEaSGlEAEdTgQOuRw9RkDdhelvK0cENYvbAN2OovPej07laV9yHZCj2bFOic8koBaA621IkFjhB7E0Pl/vdCb4+++wLN3lPKhoxILm5EMg6ux9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZFgOMjS1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EeEJP8Au; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZFgOMjS1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EeEJP8Au"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KO5D3977805
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 12:06:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3baEXoP0uS0PxL6jcVvm1v
	qspBsroAlCY8IAaQ8W77A=; b=ZFgOMjS1V2mFDZ6Jhvugk13av5pzCKGMctKCck
	9qbJWmoXxVyejXNy12e/3AL9ahmZBT97FR2tU7AEW9sR8+2i0J7aQe3/QOHwEar6
	l5xRnVlBHgMuruQXgzMkEAN/Et/t6WlL6fomQw+gJ7N7Bpr4wzrC/xznUEgRigeB
	yK1vOi++wI165p/nn5mtYhUr4U8vHGnwRWipMtXZQaiBnucUSHAMhAZ+aYEqrKEG
	6htw6cOLlVmjuEn+k0zItX1B3VfM5CwpErGCxToXGVCSCoel2q3EQAu895pXMrBE
	AhhTKZU48r1Hh4cbxtpmw365QDWOqmBr5XFXCtZ6hokaZa1w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6ev5bprb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 12:06:22 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3aaf955db5fso2447023a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 05:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791547581; x=1792152381; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3baEXoP0uS0PxL6jcVvm1vqspBsroAlCY8IAaQ8W77A=;
        b=EeEJP8AusqqZ+ia5k0BSfS1FHksUgoq3H0PJr4JC2jMLTid0V0Vdb/b4lRfQE5JdD4
         LMBckQhwK2X8JcjBSRN9rGwwoLp+wOfmPNNigaKegWNTk3VkeqcK1yPDjP3WIrWAzLAG
         XWwQA+m9QEImm0Mp0hPVtk8dKwCoTa9kz7kns2gyttzywpqGXKqDba9sRdORyTXjQtVf
         8eCrzU7L06enk1xVzFXNHzrpyD/X/3BYhNv2jKgg4ckP86MQN0aZqptHN5w1kqFm7irL
         pbBJmLSLsHdgqydQk8eoB47epLr2oOL8a2vZU2KJAHru9Owm6tvJplH+1z5w1ir7xJCx
         Hf6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791547581; x=1792152381;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3baEXoP0uS0PxL6jcVvm1vqspBsroAlCY8IAaQ8W77A=;
        b=y6MY86qRUrUcSl0yhWJylVJOamF5XlP7UV7BRDQTGstdfhA3bjrcyVeI8RFCB3tXno
         qnPZt95YKIllaDz5lu9OsZDj0rc0jxdNIrwACk4ZH/o0hZHiSR5n2wPl/KA5GmkXNu7D
         loPrkzIpwHfLwgF1ttJOu2Z0NQlyKw2PFsYLbYrxH940a9KkExwMNwxmSGwGCdKKHMo8
         vqiuOhszuInYv674wdhTAi/LqwRakucywBluYjAl3hr17ALdm+yTug9+Yxo/RPAeIzZQ
         MTgeGz1FYWHPUgshys7xrRy5yGODNa17feTEIJgc2LNPUo6ARsagb5rHoc6vIn4rUKoI
         CqDA==
X-Forwarded-Encrypted: i=1; AKwUvBzpAH7U0/PIrA7L8+MVoOF4jXY/uIPvYqKIvNvsGLJt0FaM3cKc6lMzwq8gsq27/S5FA3qW4qU5rpPpBYE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIscYD4QpCjdg+isy6b9ETm2wWyw3R/yWWv9ChKTRONKLqSlIvW
	l+CgCk4W8dh2ahcmicrFovfAw1EbPziZFPxB/XvirEVnSXM6oA62W/WGsnWKtGnKrrcbSTWA6s4
	48V+Oc9pkpVR7GHkdBuAAhqL/z/yfuh3PEiZdHcUJAkUW6jx32xhD1RHFgFE/jy+qGA8RR3xqt6
	s=
X-Gm-Gg: AYBFou09YCgNlpYdh72iSIG8GUqqYzc9RGNngJYjF3V1NmN+rmxfkR8yxcbmkSAVsA5
	GKgFOJy4vQJ7EwAO9fEdU6iVzIDNgGZp+OZFclzNe/bNvFN7Z0IHURCWDKs/iAyJ4TbJsmkWONW
	d5NjG80BsSBRQXkV0PBfuEvkU9thfvI7q6NNk4KLQaTxjr28U7YcJK/8X/PMRBN+Vb2p5dYBo9J
	iwb1sSqGpVj9UcZUDqolGUFdKAy8QH69HmvP9ig9cLuBD3zXDuIEQRRUcgwllKeqnJhOah5qLyx
	8NhKjYd8eN3Zt1wMHrKfh1hgNMR6MoMPI0Ooj+YPFcDNhkaGFIlcM0WqjCedHPzKgw6C6ciZbJ8
	7SoomgZCNVqgs02awZUp9QwXQwGYckQ==
X-Received: by 2002:a17:90a:d2ce:b0:3a4:97ea:f0da with SMTP id 98e67ed59e1d1-3ab3a735fbcmr1525757a91.17.1791547581419;
        Fri, 09 Oct 2026 05:06:21 -0700 (PDT)
X-Received: by 2002:a17:90a:d2ce:b0:3a4:97ea:f0da with SMTP id 98e67ed59e1d1-3ab3a735fbcmr1525731a91.17.1791547580936;
        Fri, 09 Oct 2026 05:06:20 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36fdc75esm3254084a91.12.2026.10.09.05.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 05:06:20 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 17:36:05 +0530
Subject: [PATCH] arm64: dts: qcom: glymur-crd: Mark L4C regulator as
 boot-on to save power
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-b4-regulator-boot-on-l4c-v1-1-7b76c2b2ea76@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKzYyGoC/yXMwQrCMAyA4VcZORtoRpHpq4iHtc1mZDSSdkMYe
 3erHr/D/+9Q2IQLXLsdjDcpormBTh3Ex5hnRknN0Lv+TM4NGDwaz+syVjUMqhU14+IjDonoEii
 x5wla/jKe5P1b3+5/lzU8OdbvD47jA72wsCp8AAAA
X-Change-ID: 20261008-b4-regulator-boot-on-l4c-8d119b1de4ef
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791547575; l=1467;
 i=kamal.wadhwa@oss.qualcomm.com; s=20260406; h=from:subject:message-id;
 bh=KW0LlYcgIekVd5iwGN9xOxzzRGAL5Lf3F0H9QU9QRBY=;
 b=hF6mVqPU6Oo8YNpQFk42lEb16ecqMPWDYSfxLwG+01VnmnB7GgESqZZhg2CMymxqzH3FYIf7O
 Wugx+N6I1XVDbHapLk3T5ECFEFld1an9JQ4366iIcz+XEuwmzFUGuJ1
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=ylH1NxUZkBpYsmww89g6zVxpS0q8qthtzcORkYxn/Ag=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA0OCBTYWx0ZWRfXzUreoVeXyDNZ
 6Nqa5gwiTwl26OhglBoSeg1WlJEq9bT8UVBt2W1FgL25hF+QfUdX14fJUE+fPCsTTf8Eldg0kD/
 v6B9FNR1AkAzTE1bLPU+AJ5KqfFCv8Q=
X-Authority-Analysis: v=2.4 cv=MMT1C8Zl c=1 sm=1 tr=0 ts=6ac8d8be cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=NK1Zv9-Dd623KQK__TcA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: mGeWJr6YzLlZ828j_0CBmMcS9fOCfYjc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA0OCBTYWx0ZWRfX2tYJJwzbbFtO
 mEunQFXZlqt1t16eURgzspUGlN2fCxHL2UW+K8xHvhjS+BM4XYAslOBHVoyjBkEuCaHC3iP9hvV
 EWf4vNt50HO6t+E5A4cVRIzU+Kg3w0IjUbabbec/V7xTHZCJWsVK+wgFHDFslAYht0LJrXzwibB
 X/uxjNW1sfXHINKwYS/oFOU21iSbJfDnjjj++/EFF0ADmd/iLg6fJ5442KstadAhIROKsIzMytH
 48pDzy/1lBsy64bJ4gh9gW6vVahVmJkt/N5jAN33u3TOzh5I/RaUgQuMA6lZUZ4wRbs9EqEHYmQ
 w86MJo07FonNEB6u8bvq/9BFxZ0FBYte7VxajPhFw6FFoVhY1e6u6SyfuEZQOdcn6pvCcEShKm6
 mbLQ8/C6Hifz0KKjDS/2tosIvIQk9O9KyJiOWvkcSAZW7a+Nd24dEHezM4lk9WiFQURfmrps1xr
 5EGoDNGRDA/m8HnasNw==
X-Proofpoint-ORIG-GUID: mGeWJr6YzLlZ828j_0CBmMcS9fOCfYjc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090048

On current Glymur Rev-1 boards, the third USB controller and PHY are
not enabled, so the L4C regulator has no active consumers. The
regulator node cannot be removed, however, since Rev-2 boards will
enable the corresponding USB hardware.

This rail may have been left enabled by the bootloader. The RPMH
regulator driver cannot query real hardware state, so without
regulator-boot-on the core assumes the rail is already off and never
issues an explicit disable during late cleanup, leaving it enabled
indefinitely while unused.

Add regulator-boot-on so the core knows to explicitly disable the
rail during late cleanup when no consumers are present.

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 58158b51fe29..ab4c9c33f4e6 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -472,6 +472,7 @@ vreg_l4c_e1_0p72: ldo4 {
 			regulator-min-microvolt = <720000>;
 			regulator-max-microvolt = <720000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-boot-on;
 		};
 	};
 

---
base-commit: b018686719706a781c45a874ed51374a2dc4b767
change-id: 20261008-b4-regulator-boot-on-l4c-8d119b1de4ef

Best regards,
--  
Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>

