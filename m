Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005EE497381
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790102707; cv=none; b=F1kMj/uRERbt4WXytGP9FFUizBgMD6suT0Uo7r2fM6mXpfruJ0mOaSP2NoVw8dpso8FM68pGkViSzVOGmUCSX7wMbOi7Tuoro+EBdxn/Uy/LfzXzSHmjIo3ig4EVWjoMVyVOk+6svpGqYE8mIZFn0Ey/ihFtgyMc1eFMwGFBZa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790102707; c=relaxed/simple;
	bh=IHl96VfDfSLC8aLKVP1o5N9BHbNNzUMjoemjAMwnB/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tBDLcnDCoBOs/3v3lFfuNUuBP5T0xcjYSDG1bT0dRZPqrZDx+Jvvs69xhU+N7GN7GXgDdNqpqe6JeaMjR+Y85IMfdU+R62g2eWYaWdZ6lG9UQiWC/S0pN+OFEccRmbX2hY+0ZTIfJUIJ3eqk5eEQ8o06v88H0vFzGARMyx1ICxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FfqWqFB3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CLqJ8NXP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FfqWqFB3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CLqJ8NXP"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI79va1024455
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:45:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eEmsPPYN19I
	2pfZSXr0Sunn8u9Ec3DlWKgauxQhoZ6M=; b=FfqWqFB3ULldsfn+q7fem/Pbrq9
	x/eu+G6pJGRmDai0e7nNnha634ATzEsQb9o/9mISrYBVq0V3WPqscFv21CRLfTEb
	emS+cV3LVV1sUSm/UECict73J8jl0/QTTY9KBEhcIGb+q+VwIuEKrg+99dcRclW4
	2z51dsmdgQH7bclEIa3ZVcHAyOZESA6g210xkidhb8qa0j1OlyS4AGsYHP+RJtP1
	otXdlDWPUC9AVNDvOvLKZ/XUgT8mJtKTyvqmZ1RvWouNCrEkcqr3Of1BVa6VYQ0n
	7LSHUh5bRQ/wiyFAimKqiCxhO4fUeVIbvq5swLLqo7lZ2sXXASE8/BlFgNA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gujkjbuqb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:45:01 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c96449cbb2so112550e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790102700; x=1790707500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eEmsPPYN19I2pfZSXr0Sunn8u9Ec3DlWKgauxQhoZ6M=;
        b=CLqJ8NXPUJ+VHYixExMTi0A7o7xCByrNvUKkJje2jh3QUObfW/8j7qvAM6/PUJ1BQn
         M4Sr1GddjUsbssV4xE+WKytp6BMVFR1JoE+dKGpXKGlvOt95RlPRvytWVFjnxI+pzIpv
         jDzpgbo6+Istj/A0b2X520jZo+PqoCd7cigNHcwxJFrV8H6uAPlLoeBU89aUVTn1qNuf
         kyf/61DPrskNxM/Ca7YQdS/UzwVgJw0eNpCUL6rJaSkj05Q2Sxq1128oVm7MnO5wUEJ+
         VdY3Sqt5xa9ijZFzpkcmYx5qsukJ1nHE7IwqV+jo283cm9y9OPX0WPa107KUEWh3+QfE
         aWVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790102700; x=1790707500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eEmsPPYN19I2pfZSXr0Sunn8u9Ec3DlWKgauxQhoZ6M=;
        b=1lMy+6kcLY9nCijx6jytiw7QskyI8rXjeitQE8q+5blZzn2d/VVPErBykF3+kPVqlg
         W9VKjfC5WNiNm/E7/bfyNKq5MLjFSQJ0reSMw7W5AEIHkmykm7tEipq0Dc4TzKJKjlPj
         AsyFI6+nKRWPpqxIc0c0zQaS5vUP0tVVSLHkWtJmI5Js1iFqtsJBJSYmC692Fyu5098D
         tZHyowIjBGU4MumVj1Ri6GeI5gKRGhgtyCGWfJZmiC2Z1Ze14/8uE65YFL1n7WgBFwL8
         yV08A8SYcNa/mEkf6bcH7G04A9TVMtdnsnFqCfWrT3UH6kIC3jGcNiMeG+O5dU/rSB5R
         ONKA==
X-Forwarded-Encrypted: i=1; AKwUvBy7gVo1QXN7XNYbDVSdS9GJAdNSo7ZAZ4ZKoDVdbK5ID5XJcHrn4LW0o/4kCHEa6b/e2INsRccxs+Ejuzw=@vger.kernel.org
X-Gm-Message-State: AFuF++kNvea8/L8jjxiwqtU1GE6oUriHU3hhR3mQ1R6Cq4gUospyKsoj
	fPjKiYGSRUEK/LKIy9xCHR1gvb8h5QImIIUChFvcC4lsllv4NCDGlgTx2RT6seKa7LupoiCZ0o2
	tX5HKqTfJt1Uf2xZEbSHHp7yR8Wv3rvRYi7CIjSMBwDT4A11+w23edhpqzvfybRzAlao=
X-Gm-Gg: AYBFou1p5dFixvC2P6AU5A1l5lj9Zy2m8E2WKz18TX8jzJrUqlZSNzemaYva+GBWlsu
	g/WmnWxxxamnlbelaGWpKJUslq07MyGrv8pvUg4xO2F6D4AyhCMf/F2t42kAnPsxD04ksIh6hsF
	hLovWbd4wups4mm/KVy+PY0QhLYyYxIRwQ+bwfkPazl12y93KhwVBsFM9hbxCVsV7Te+XMb8Oh3
	YFCsJqCLwabFexz2HZAeS9OqhEjhYkYVZCuiirqPlNV+qXqoKwQNZBkk4Wax8n0uiuwo9AEjIJJ
	e1AfdA+zzidDIYvEjdgemPkAhgqhWLA4NHvpgvMi/ZPnlrbLmcztmmXpj+OP3KhyPJnHrfJ7wBY
	HNNPwXkTqi5dRMOBwWBnAmCSe/1x4KjEuhH5FCLWrhPvaptvMaS3TJYIxodQG+Xkt
X-Received: by 2002:a05:6122:d05:b0:5c1:781:7122 with SMTP id 71dfb90a1353d-5c9f15812c5mr813163e0c.3.1790102700094;
        Tue, 22 Sep 2026 11:45:00 -0700 (PDT)
X-Received: by 2002:a05:6122:d05:b0:5c1:781:7122 with SMTP id 71dfb90a1353d-5c9f15812c5mr813136e0c.3.1790102699722;
        Tue, 22 Sep 2026 11:44:59 -0700 (PDT)
Received: from debian (cust-west-par-46-193-35-178.cust.wifirst.net. [46.193.35.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c500sm374681f8f.19.2026.09.22.11.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 11:44:58 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 2/4] dt-bindings: clock: Add LPASSCC and reset controller for Glymur
Date: Tue, 22 Sep 2026 19:44:23 +0100
Message-ID: <20260922184425.56114-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922184425.56114-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260922184425.56114-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2_4IJ2gu2BX1cBB6aJCoKoHG3MP0V6pW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI3NSBTYWx0ZWRfX4yvP+cXHpqQz
 /AEq3++Uu2k2bi6txpRkvxdRsj4mC3pXNdKt1K2GOg46K3d+ffbB/4Lw5a2/InoR4wKwYYlBEda
 LUHSq9DYzO+MEUSdC+6IhAfekkZRw+dwVkXn4Q/zk2yoqLcZeHbb5jaCj68eJPEtY54dr6bwRpA
 JiSAi1nQQyT7b6MUCfmgZDFtH+hyid/vyZDRftNARMJCv8N38TDAGrbelSeQNGmpn+4n3Nwzpas
 1xxTXrNWx+Tjp+R3Oy6h5HoQHqHNEjzNI5TaztQkvrx0Q3BTs+BW3ooTyZQpbeoD2GwcD1WEBud
 5nCHDtLxDVAQA3Z9hz0jk+U206Ba1SPGxwIhxajuh55nKGo2vPV0CCLoLlhimy9UCt5vRjeFh1u
 RC+wCUe+mtcQ/ingK1OEdJxdCARYye6jKbFuSyGXdbPVm+WgjfIeQroN2n7kVJt/XjsMJU9kc2G
 9HFZNBB0bc2QlVGUjKQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI3NSBTYWx0ZWRfX9P8KX/Qd2DOu
 FvE40YI2qPe3FopoFIYBZOVe7O1J8a7DSy56Pgb+hIGP6PbGU9Z2DMPSNdCtgRgBmAfA0Reuiqu
 k/bNAip+SSZpghENwzOOJyzQmo798IU=
X-Authority-Analysis: v=2.4 cv=SuAFe/O0 c=1 sm=1 tr=0 ts=6ab2ccad cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=Hji71o54RgNgZYqDgtlrhw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=-l7Lzzg0JijIaF3KBckA:9 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: 2_4IJ2gu2BX1cBB6aJCoKoHG3MP0V6pW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220275

The LPASS (Low Power Audio Subsystem) clock controller provides reset
support when it is under the control of Q6DSP.

Add support for those resets and adds IDs for clients to request the reset.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,glymur-lpasscc.yaml | 10 ++++++++++
 include/dt-bindings/clock/qcom,glymur-lpasscc.h        |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml
index c047c0174a93..916ab1b3dbee 100644
--- a/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml
@@ -20,6 +20,7 @@ properties:
   compatible:
     enum:
       - qcom,glymur-lpassaudiocc
+      - qcom,glymur-lpasscc
 
   reg:
     maxItems: 1
@@ -47,4 +48,13 @@ examples:
         #clock-cells = <1>;
         #reset-cells = <1>;
     };
+
+  - |
+    #include <dt-bindings/clock/qcom,glymur-lpasscc.h>
+    lpasscc: clock-controller@33e0000 {
+        compatible = "qcom,glymur-lpasscc";
+        reg = <0x033e0000 0x12000>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
 ...
diff --git a/include/dt-bindings/clock/qcom,glymur-lpasscc.h b/include/dt-bindings/clock/qcom,glymur-lpasscc.h
index 3006b12e385e..3fc8e7313cab 100644
--- a/include/dt-bindings/clock/qcom,glymur-lpasscc.h
+++ b/include/dt-bindings/clock/qcom,glymur-lpasscc.h
@@ -13,4 +13,7 @@
 #define LPASS_AUDIO_SWR_WSA3_CGCR			3
 #define LPASS_AUDIO_SWR_WSA4_CGCR			4
 
+/* LPASS CC CSR */
+#define LPASS_AUDIO_SWR_TX_CGCR				0
+
 #endif
-- 
2.53.0

