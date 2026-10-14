Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548FD51CF70
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791986159; cv=none; b=YdeSqHYycMp9/FVGUw62m4nAaH5vryBJtf/4j0ThKC7IHcSIbXaKxlBLv5IEJKOtzszWIQ5SdFyecJgv23asu2S7+b6jhTvzO4jDKBJsK5LuNGkqKd4Zi1GNPBccNXJ2v9Sq16c8vCvV/081S/q/6ps/q4KbIAJN54dtzZltwC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791986159; c=relaxed/simple;
	bh=QoI1RsqYg7bQcbAA2KdjiqC/g5TWvcxP2wskOhGI3XY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZrMrjwtrZT+ytzynuc9HEW+CzpFlB0Up1FAqUuu6oLHyV1U/OvtiaKXzAVx6uLoR1Nd3hK/D7VXDElPYCFzE8VskfYcHc551+AG+HGThlmBLzFv59tA+KsDIRtBL0bIybfy9F/RVPY5dynqCOtADCvGHzb1Wgt+A1IJ2xhq9fCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CKgF0DS5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kPJT/ktS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CKgF0DS5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kPJT/ktS"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EBJDb92685286
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:55:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wAoW7ljl9KKWlBONsFzPHw
	5KdjzrSY6v8WECsydu2Fg=; b=CKgF0DS58/cf0OSJTzLFsAQpu94mKNkV9zahdJ
	gxUFbgXuvg4vvXPl3/D/NMVyN1cYAw07xrz/SYIv3n8Wa753hH3YTgomDDEcpUjN
	WwGPqV2yAxwzpU0hUASNTdFHRW7V8P08a8fnMn7z3eX9cY5CkU0uteMtdSJM0niL
	Thn7o6U20Cyfo+1XQsxzjiQNGMuPWPYCHgz0x5+t3gOJn+Ff61nbCyb/UvnGRFCs
	Xu22LprdDynA+VxtGoE8Bkih4jkgB9CzWQSWWINCTS7IclDmk5hAh35mNQ1apA06
	uGodxZvrW42tFxUj3id+jZSaz7MW082WzT0v3TnSlC0YFh0Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha46u1vft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:55:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ea8067974so1006368585a.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791986151; x=1792590951; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wAoW7ljl9KKWlBONsFzPHw5KdjzrSY6v8WECsydu2Fg=;
        b=kPJT/ktSNM22ZTfpEyAFIDk1nzhXHS3XEvLLShsNXLASzK6S1IFTGXLLG/2hs1s6dd
         8JAacfAEWkzKA/E9mme5hIlwiEMAI1we0XDXrVt4Glk7N1yLLq1wJk6u9DI3EPefgFSx
         8Av/axlLaQgiIzsUyfk7wXxV+FxpWdq/nVoU4qpuujm7q9u3hir5Gl+Jp3g3TLYYynCH
         q8K5Z5zbxymkdBgr1LScujuXPY7f0OtJ1D8/fGx+O5Ihtqc14OMKNBH09bPsQ7s7DCT5
         GUg2+l+H4Y6ilJgdOGt2PEju3U+3UE6tAZTdE8jx8rxx9DKlEfhWhwLAHXpt2uYVUQmi
         IJtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791986151; x=1792590951;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wAoW7ljl9KKWlBONsFzPHw5KdjzrSY6v8WECsydu2Fg=;
        b=hS27muvfSnQh954LgCIFDhuSYL5hNhpQaB4+EnbWHk6sOVvABFpklDImr7Q+NeI9HT
         icdpWG2XknWXMUdMbZcrFPDi9SFMK61vS458U9oLdLN52DnYOmW5euSGs0JjhHEv5iVP
         iDyG5347/n6Pe0vEgAcIs+E+RNGebtAuI2sURbQ6fMUpo3zmoyn48O9LEfLnwFLGJXqt
         oogLFMgjd0yBQf1xWxAQeDbOoAzk6uyTs8sV4a5L1wmMU4nfMe6NGRNN+Y/4osLrZK3a
         efovMctsOSdSlY2+WP6k0OlEft1SvIxDRsUlqb1AbLnPz7QXxdx+uW4qC78PXT5ta1Fa
         zDuA==
X-Forwarded-Encrypted: i=1; AKwUvByonD90jC2GgQvMF1WdYKSJR17r7tdjwfZSJwXMmdEM1Cuj0uOFoetkKOCnalRn35gFy8L1unjiln+gYKg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqqHB0oEhgBxu0fkZzvoZQvNhtCRIn2UwEM7id8P8Ji/qvVy6b
	bl60LtrWCY1i1wWFPLjh8zjGyBsL4l1l3KnaIEwOmCDLV7f4GV3+rfXj0+tiFBFKYNBiYPsvRzb
	FxO5AoYE4HgqGqqI6L5YjzEMJSFz0jodyxcxXoQ39nFZF2fuDWkRkawDsjX/FARMcfF8=
X-Gm-Gg: AYBFou2AXBzacW5rLsw5Id6yw/0+1BDr0xneVVdPP0aGhWQiV8C5TTcQwRD3p2eqANY
	rqdM308rYKvbOSs3Rx8FfgmH9Bv0vy2SGxwXD1oi/MxanWGHUsPxW/cGnLdHW1SP/We18Rtj1uD
	VRDqlyyeq/2JnNW/vBSdxa5aGb/qZOee1Rnveibsadq1EJrM/SHGRKyapD9QYLkqNjyUtCsq8pM
	h3DoGzrGXtlQMGgJG2ACdKxXblIuzVS1ZB26FZCvd994zu8XaV1UPLJlctVvi52efATMemYU4zS
	da1a0aCcKDDGrugvTetmYvb5aN67mK2esFoyY28J4PGVbY6i7GECa9BUHTjCjXv4hJymIZ0ZbPq
	brePNliWnOw==
X-Received: by 2002:a05:620a:890a:b0:939:3a81:326 with SMTP id af79cd13be357-93ebd25989cmr2543313985a.37.1791986150555;
        Wed, 14 Oct 2026 06:55:50 -0700 (PDT)
X-Received: by 2002:a05:620a:890a:b0:939:3a81:326 with SMTP id af79cd13be357-93ebd25989cmr2543309585a.37.1791986149798;
        Wed, 14 Oct 2026 06:55:49 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bcfa9d50sm2815065e9.2.2026.10.14.06.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:55:48 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:55:44 +0300
Subject: [PATCH] arm64: dts: qcom: glymur-asus-zenbook: Drop the CMA region
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-dts-qcom-glymur-asus-drop-cma-v1-1-46f745d5b2d9@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAN+Jz2oC/yXMwQ6CMAwA0F8hPduELUicv2I8jLXijGPYMqMh/
 LtTj+/yVlCWyArHZgXhZ9SYpwqzayBc/TQyRqoG29retKZDWhQfIScc7+9UBL0WRZI8Y0ge987
 Yg6OeOmegHrPwJb5+/+n8t5bhxmH5prBtH43bNXKBAAAA
X-Change-ID: 20261014-dts-qcom-glymur-asus-drop-cma-591289d6d491
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2404;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=QoI1RsqYg7bQcbAA2KdjiqC/g5TWvcxP2wskOhGI3XY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqz4ni2AXTWxQhiyv9TamVXlxq5011tFdHJ2PgK
 jTkhc+uo5qJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCas+J4gAKCRAbX0TJAJUV
 VmRHD/0fW5gtdj8AA1uQSkuqz7ErRQpyoqnK+pj4KuItUYXU++ztjULi4iJPe72zoZcGiGuSooG
 3Tzf9jdVqVytg3OZTwMRA3gRNBbR9oywXKgVgoOjCPo4nQxDyobhtPM0mbBVvadVCPXCnXM5Qg7
 Ns+GjDwliSdfi6bBp/cBForW7hP+7V0egS75+b0XSxiaZ4vB4txbKoWnwgJDvRAb15CYyDcNnE0
 Wx3c8AaUC8hjINq6ElOcEmduEK+If7O57KbQ5dbgiFjE8BapIZ70lQT29MSVxhy48/m+MeP/u0z
 NaTVOZeeaNj0ccfR/J6glUDg+/o105lHHZvbAg/oR5UvJfcMRsInpe7ypAz1BaOb30GDXFoJdod
 08LfvOQbg2c7tC15s1EkgNHIyzOobToc36bLDgpLZ6b6jKfqgX0rkQFoQ37ktfpfR8ra8UIy43d
 kuK1zyBLRSNuJ3UA6bNDQTbAXBF8SxLI0fbsxm57IXCiWTSW1O5i5L7mPKvUS9TrfdSZ2fqIyW0
 NXLTrIf+1x5tL7FJxhYHkGOo1kQUE0+iw2eCJMYhw5HoJcRGuGb9XjtHc/fFGtYPnJZqpweiNDQ
 OR44DsfkWuxNqBohCvlAZsCQEh9EJClOCnZaqKibranI+9bDWF1Ftg/J0r/Obqw1SlxbByuqnSY
 QK1vEB9clfTFxwQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1NSBTYWx0ZWRfX5KcO+JoKv/8p
 Npe883kmqkXjeQucL4KFOrGr+WYA3P2ABurWtUkOWQJCXBTry8fErfSgDa0bxx3si85WadLnJH0
 oR20lQ6xsXzWPMXlUcxHlABPJWg7EIU=
X-Proofpoint-GUID: _26UHsrhPwArk8Y32W8AYR5aXW_VKzIh
X-Authority-Analysis: v=2.4 cv=Y6ttIReN c=1 sm=1 tr=0 ts=6acf89e7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=nicoSRiWgz3tUqmGXlEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1NSBTYWx0ZWRfX08BQrYm3P6iG
 nGEuCou0x0YCrLtgXLC+Ar8gjxVfPjXNEwYTSKODHIrtEEzviokCy85WEuTDlVQvUBaN8p6MKdH
 U4GHIXsEW8gL3pp8YnyiQuWAUcEQPaboZvjcGkssymcnllWP3cFN2bSHb93uCo62wwWycb86KVF
 O5JmBhfEp6OCNDHaBUFHoDVN0dRcjnuRYZOPULCoxVilSwjnvrfalDLZwCJsvu4RWnEQ7PKcARY
 cv+fvG1mloRHlKQUOCeCzCBtqL58CdJDELY0a3H+Y+U4Boj1dr2xMhemHm7WKnF2ZOmBfHNoaQD
 hggDreoejcVSIbTnJ0zi/psa0f6Y9v+dF3L0o+PXMsDY7HE5Y1jiQUgoKNAW73iSWfDkPUMadil
 qc9PDN7s5gcWuXmgLPUrZj9ydxxICf1DIS73tIY4XXuJ5yNGoUJo6Gq2lFItLbL7bLTYha5COFF
 ttK6Muv/bDtIDnjCUWw==
X-Proofpoint-ORIG-GUID: _26UHsrhPwArk8Y32W8AYR5aXW_VKzIh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140055

The linux,cma reserved-memory region was carried over from the X1E80100
boards, where it is needed because the PCIe SMMU is reserved (owned by
the hypervisor) and PCIe devices such as the WCN7850 WLAN end up doing
DMA to physically contiguous memory.

On Glymur the PCIe SMMU is owned by Linux and the devices behind it are
attached to translated IOMMU domains, so there is no need for a large
contiguous DMA pool. Describing a CMA size in the DT is also more of a
use-case policy than a hardware description. None of the other Glymur
boards reserve one, so drop it from the two ASUS Zenbooks as well.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts | 9 ---------
 arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts | 9 ---------
 2 files changed, 18 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts
index e96e65a0c5b4..83d15abf9b0d 100644
--- a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts
@@ -263,15 +263,6 @@ vreg_wcn_3p3: regulator-wcn-3p3 {
 		regulator-boot-on;
 	};
 
-	reserved-memory {
-		linux,cma {
-			compatible = "shared-dma-pool";
-			size = <0x0 0x10000000>;
-			reusable;
-			linux,cma-default;
-		};
-	};
-
 	sound {
 		compatible = "qcom,glymur-sndcard";
 		model = "GLYMUR-ASUS-Zenbook-A14-UX3407NA";
diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
index 95da35125d75..207190f2be79 100644
--- a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
@@ -275,15 +275,6 @@ vreg_wcn_3p3: regulator-wcn-3p3 {
 		regulator-boot-on;
 	};
 
-	reserved-memory {
-		linux,cma {
-			compatible = "shared-dma-pool";
-			size = <0x0 0x10000000>;
-			reusable;
-			linux,cma-default;
-		};
-	};
-
 	sound {
 		compatible = "qcom,glymur-sndcard";
 		model = "GLYMUR-ASUS-Zenbook-A16-UX3607OA";

---
base-commit: 1fffefb00cc0b0da1f2ae24e3d33364530ea6515
change-id: 20261014-dts-qcom-glymur-asus-drop-cma-591289d6d491

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

