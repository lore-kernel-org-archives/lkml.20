Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB3F449992
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787920688; cv=none; b=o5mbHJBgPViW1UCZO9RZrvtTORELlQulOlgxrEA1NdwEvRaaTXEtxhe5Smmt1uwBdJruMNSfiHNM3+SqkhnP3jDScS6PGxtphS+bTNAWg/l/9E7vYtJaJluX5KpeufIGDF6voIq4JyRkJ9kHbDmEIXsxt3MLDTSZb+s4TJQXsw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787920688; c=relaxed/simple;
	bh=lhOkX0bAEuU2vkMrtMKuIOECLVx/nzsStPQ6p0lySnQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z9oO1SXqZUC809aoHgudq8gtiKvCbGxkixdCXbvSg8Lc2sX2yEMH6Vwkm4Xn7lYNo39kD6CI5ScK4VN1mLGOz16S5R+VZAgZ0DigWFnUDni79VlNsiOvcsPMX/Kq5dYvcZAbD2ylzVdvz8Ugdc3+DSweZyDZuHd2TyJabQrIRLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a3eZNbvC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=McZW9+MK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a3eZNbvC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="McZW9+MK"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA81Nc3750826
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:37:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lwp3gqC/+ox0T47BtvmV6ZjMFuXKFUJ8YN/FtBU43dc=; b=a3eZNbvCPC/fQdhj
	x95ao6RZRpgsMCgzn4LYPLku8/DeE7cxjELM6+FzNsrI5To/9tb1C/RwZS6sBvgW
	/mYINQlZgkpz+1OeJNlL6UTwCXmzmA2JxoFwln8i+8HBHXJuz1wI3MoB8Xnd7CL5
	pc8LjSiAZivZsTLQA9zWPmUfpF66KsJti6gtuAF/WDkL526gxXEt5c5H8snI/dOQ
	cZvunzWkSTG1VXwVlzC/rLFkdZpG0o3t4SfDJiHCv3afP7GQRQacvDh/8WHTZ+Gj
	XGaJ3lWLwA8oQ5es0WFc5qTbCiyDqjcv4Xun802Xg6bBooRLiMkEU7MhCQDyuD/v
	1ivRSA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb8afggpw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:37:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52fc3bff8bdso4624391cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787920674; x=1788525474; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lwp3gqC/+ox0T47BtvmV6ZjMFuXKFUJ8YN/FtBU43dc=;
        b=McZW9+MK78qf9MjgOoRdO7OyraM4sJZJczXWqXAoB7UIcsp8S33zJg3RQnSaoIsODj
         X2n3qnaYxxNbwKUQJLqgczpGPY9TXJEEr2KKG96cgQX8sqR3IsFgahtZqmKtoGD9+8EX
         rizIPRXQ9hr3tt/En0+fqkodfG/7uWZFwQoftb43PUd6tnDxjX7GlgZNRbjKG4vdYCxO
         c0u0SrUry/LkrKOzck9c0Y/NTaOyw6WeZOUw56K7U/e0ZtX17MucQ9TJ9fIgWUpRhpqy
         7i1ksK/fqYaCfFypvux4IKEIfLsTBRRShsUnIbzGwW21+gYs9/VatFdwGHwDJWEka/it
         FJGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787920674; x=1788525474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lwp3gqC/+ox0T47BtvmV6ZjMFuXKFUJ8YN/FtBU43dc=;
        b=VXKjbfx3xTeBxdUA7CUjl/azKCqcFMwp0g6kD/+SZsSZAvosWBMba7u2qX/D5MP6ih
         08BitI24fXpqWDm7WpsrjXHEdOyFxfeC8YvXNnHzW8v7+a4J8GvDsjK5iYzdg9ztF0F+
         v4eKgAqpidT4t8IhAeJwK2klY6Ho9YGX+9+mfVx9Uk4PZHI6/gRIajqxvlXqOFc9E5/X
         4kr7vOJDDr3b8NnO41JNVETNQ2Dyw8wHvJJHjtzcgKeYeOtscimIQ2cQqsvsPnZx7NUM
         jcpn2jsKWz6VujpuCavHAekR/AIrCQ9eeiFxRzmDkZKffI6tl6IW1sXwgRY6yTmcZ5G9
         Y1Lw==
X-Forwarded-Encrypted: i=1; AHgh+Rq71T8BxFQweTre9dIC+9yuXiX+Tj8dAPcv/5Y2/1vHYXzW0XAByMjowQGdc+R9kC5dKUtEkN7GwZJlSxo=@vger.kernel.org
X-Gm-Message-State: AFuF++lcn2Lvt9J7ixrO0OyIYYHEeJ2Rdei9QO1GCAvNwTnnPlcIEzSb
	w/MCqoNxSsx3x/b5wKAdHcRnSdZTfAN3yErumOqubih9Lo34EE4Z5ixWv/PsCDHL1DLxoY4FJYQ
	kqMGpBk7xEERV2q6w1nHZ/ZWzJMiwTzotzeycW5XKHdMtc4bDKjSCRXn4zajibTIss/pFsB8abV
	U=
X-Gm-Gg: AR+sD10PXRca7OVlEBnjJGiKEJp6TDdVLmtJ0dOWa9BxeJtN90cLzR4zl7pkSGHW9DR
	LwqaSUeWfxSVc/EQ8auwKNnY7ZhdLtquYu7IoqLmQCJYej6cE48RzwUMpY4sOdtF61dA1V7vZ5E
	5OcJd6iNAZcl9MH4d9259q/36LlaAHkOb+XBCq+m1yxToVDaHV6YrS+Bl8XElUFVbGF6zmxr182
	Ub5JCvSd1VZgxFTbEd4rl7Hm2z8FZw7hLuzYLm7W9wjo6Z9ov3GCCOnED/Ckj3ZG6EsNSyKtKFD
	OpDOqHufZtgHNlH2kfzwIjwpq1n9GjTQICGm400YOIt+Ul+XAFiO2lmOc67vx5SLC4YcGxAjLDO
	8b5qhoAY=
X-Received: by 2002:ac8:7f0a:0:b0:52f:9fa5:8a38 with SMTP id d75a77b69052e-52fb96a94e8mr72838941cf.38.1787920674272;
        Fri, 28 Aug 2026 05:37:54 -0700 (PDT)
X-Received: by 2002:ac8:7f0a:0:b0:52f:9fa5:8a38 with SMTP id d75a77b69052e-52fb96a94e8mr72838081cf.38.1787920673646;
        Fri, 28 Aug 2026 05:37:53 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b92671c0esm39338965e9.2.2026.08.28.05.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 05:37:52 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 15:37:23 +0300
Subject: [PATCH 04/11] arm64: dts: qcom: sm8750: Disable Inline Crypto
 Engine by default
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-b4-dts-qcom-disable-ice-by-default-v1-4-1d6e0c2f5a69@oss.qualcomm.com>
References: <20260828-b4-dts-qcom-disable-ice-by-default-v1-0-1d6e0c2f5a69@oss.qualcomm.com>
In-Reply-To: <20260828-b4-dts-qcom-disable-ice-by-default-v1-0-1d6e0c2f5a69@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1860;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=lhOkX0bAEuU2vkMrtMKuIOECLVx/nzsStPQ6p0lySnQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqkYENVG0kBv63KhZW22Jynq9XH6NYauP4/RGze
 Uu9Z0iT0UOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapGBDQAKCRAbX0TJAJUV
 VsKWD/wJ/wYyKit2axMf9DhnxmRWHe+bZJ2Ta7BP6JdhyD746qhjIYW07YSF4fTLhMxkXPE9EW0
 ov+pmz0ii9MniIzChyyA9BpJj4Aahg835rFDQuPLGULr0M6HWCIpw9a6sEO3URSjFyDBWf3UuY8
 1mgWM23OOKeehbwS4roU5k9j3A3xqZcx8WVWsmzkReBFbmYLxjsqygj3Uqwcr/aWA3gEB7IXFl9
 xKag9+rXii3Negyo8loLVDIzqCaF1T9Q9pNJc5JaWifs0qU5p/WD98LTe5EX69TifqaAs/Tel0P
 Sq6gDJ7k7mydjsqg7gh/FAtodpY2WvkyV52tNcFus158pn/uOgC8DvyDX7OuiLyfWldbbjwz9WH
 45oDyqAdN9h7PyOdrmxUOuXkqy+a0XfwOOij/bxznIUZcBA6wUeryw4Va840FDa1k35yEfoFnOs
 X8lPokqIXuTheyNzOCmHgtxm/RhLMGoRXmRyuqjOhcLBi/fVbKcSBGqrwPPKhMnQBY6p5fFtZ5Z
 ZkprwSPsMLkBei9iuADTcXO4b0FllRnf+6MqwJVgXsoBQtV5Xc+k2FxJ9cp/bqrmkJHLFUVRWs6
 s7/RQvYlbM/D7sEsZlwR+/9Ed40gK2Iozh52Kk5IGMdYuoQ/pu8GI3gijQYHCv+llZ7SsTP4ed/
 kPukOSc1TC4Wa1A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: WWisMQzPi-noL4lZXTZXkik-Hs51JtsX
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfX/nF50yMav10g
 mPqwfqZswkTFrYiFfgY0BxK1XGaQVRx/UmiGduwlg+O6DqKi9izDp3Ha3Ie20cvcP5Gtrz4bxUE
 MrR4ehXrPspjFeBzniuw+CHuYFEzK6o=
X-Authority-Analysis: v=2.4 cv=IPoyzAvG c=1 sm=1 tr=0 ts=6a918123 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=R9TnukjFd2VXrOE3MjoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfXyP6AVP6F/6bz
 wT4r42u2JtZ/yuLqTZwFzh/afQkBYV4mHbm4oiTqsgvlB4amHlw/EEQj1IMhF4bBT1iSL4+4kn1
 bR+tdkR2KtfFtFea3zOfPooLhw7dO8uLgXS96w6re5vmZ/590yG9vS0z0iUNW/Abkx2CTAkoEwi
 nB9mU8q1GNMbWp7h8+v1NfLpReYzMLj/+Cik9ofzRU2Tk/cvfIoiQTefBXEt2nYM84a4Or0tiqj
 bSvKiPc7Omi9xge3bbQUVmEZLIsRx/AbGOxRbeejWQR/hZhSWf/iFlCwVEL2/pnx49pz/eUG9Uc
 GOUCjgDp4GmuFV0TENb7KpmE6CbTcqBv/Yss0hlwgz0LILzYTzMkmWqbLHjDZGpsoSTXS0h09MY
 nYZQ+Uv9+8vKZ0yrbpFsSsLgdozey5VNiCtG417YrVbzbzG94/eQBS5JtvYk9VtfSvAvsmShlym
 dEF5VfmkFOMSEByyRoQ==
X-Proofpoint-ORIG-GUID: WWisMQzPi-noL4lZXTZXkik-Hs51JtsX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280109

Since UFS_PHY_GDSC is attached to the Inline Crypto Engine and the driver
does not currently enable runtime PM, the GDSC remains enabled while the
device is idle, even on boards where there are no consumers.

So disable the Inline Crypto Engine by default in the SoC DTSI and enable
it only in board DTS files that use it.

Fixes: 081ac792f0ea ("arm64: dts: qcom: sm8750: Add power-domain and iface clk for ice node")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 4 ++++
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 4 ++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi    | 2 ++
 3 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 9b5fbc004df4..dc7ec23183ba 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -971,6 +971,10 @@ wcd_usbss_headset_out: endpoint {
 	};
 };
 
+&ice {
+	status = "okay";
+};
+
 &iris {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
index b56317cfa9fc..0b28b381cf9c 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
@@ -858,6 +858,10 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&ice {
+	status = "okay";
+};
+
 &iris {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index dd738d13df8e..76ab96633f74 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -2140,6 +2140,8 @@ ice: crypto@1d88000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
+
+			status = "disabled";
 		};
 
 		cryptobam: dma-controller@1dc4000 {

-- 
2.54.0

