Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580382;
	b=cwIKSOCvQXLNIYsETtCFm1uV2hX2wzouwVuwmextTF3Nq149R2uQe33Vj1ECa1K1zafS
	 YUFidzN8Bt7V/x3li3jdU8ckXs9GspJWqvY4zp1GjPqloXM1a3sfm4bZEPMLByEuBxjT/
	 7cJzSVY7pzquAoO9eeP2JJ0lIvrsnweDCHo9G6UfiO/qIe0UYRfpVha9mpcPkD2TFsvHH
	 oFiF+mfJMtJYGAqyjz0ifCiqVPEeGWCNtyMkmqJW/MHT8q8RqQCQaAkbFPyMhmJXcxZI/
	 v1xpi2Ic6+kiJDHUEOmZ1LV+kNUhs/Palcd/JATD1p4lo2oAYITX6lLLMV9OczIrdpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580382;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gx91eDJpaU6S9gSHrYisO86Vlpx4mJs+TeI82IVUj98=;
	b=d9mokrT37HZn69XB1cGTeXzMd7+MUo/ZUzBmL8Chmb8RhmVn5Z78KtXdfSfVIZlXUuUH
	 wH7NDFoPnSTgqXkmM5og6SbE7WYB9ctLNt7aVFIeFxLqx4sB5vsUdWU/6Zy6ylpNYCEsP
	 bKVIoR4/Gy1rtg80zTrU1wVZKxTdSVaHbDUv8YfEI3Nj7HgyDmfvJsciYMbnaY06fMGLH
	 nKyXcTYWTvy3NreUh+GIGpZatpRirE9kCj41L54Ao+QHU1dnShuho74rYojKuRyHWskwg
	 XwthaGexwOJg/maE8w4OG6QTL+37AI8BSRS8hv9s9dqMgKupOEIHhOh500ZNmdu05lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p6LcTAxS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JCzP9o40;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C8F606A8A8
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:33:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68C8F606A8A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p6LcTAxS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JCzP9o40
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJQEB1525303
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:33:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gx91eDJpaU6S9gSHrYisO86Vlpx4mJs+TeI82IVUj98=; b=p6LcTAxSLBPS48Cd
	MH3YQQ1EsSIZjcS2uPf7SdzFAu4A5RxpP2eMpW56ge6qo6vfDIhLmF03xEqv31x6
	14lWdjH88HiDAd+UUR7HtMHeZrIr5xhHfLgjQxdGkgpeet7X3nEXLBGs/eEk6B2N
	nHfIl7NAPKN5KaLX0hjwYCrk8GVDTRVm3kHR2uOSggAyeAfS7LTeOnpBU4IXdfwG
	PHgL1oAU0eYSVC5QVyfNbPu5gHxZMn98EspesPMD8O9VhgWB+ZP8egsyOGZAsGHI
	DYIfHf6xqfteN/8zXKBcO1y3p0vw2otSOKiYwwPSID0PzVzEwpRpBJjl171soltE
	rGNbow==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx0g20w3b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:33:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f5844cb60so212619085a.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 06:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794580380; x=1795185180; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gx91eDJpaU6S9gSHrYisO86Vlpx4mJs+TeI82IVUj98=;
        b=JCzP9o40ucS9Xd8yC6Pj0Sg4E6M9RNEza9icZkrlgBQbf5pETQvpsPhnqoSZNvdgOL
         cC5PJAxpWKt/X4EJbNipl2YqsEGwEFqq8IjZEm31PHJTwD/kr5IdOxF4g5FZhYPhpan5
         WP3dmJtGDk187w3/ITY3DcbJaicK5SJRFvseQ3oGq/Fllu4Yp1jGluXhYpI3YqtB7ud/
         kSAPZCeGHuS5ivpVo7WEqnxwQC6TfdDFr6XoV/qeqjXufgx0duAfH/Md0+zSLlMVn4+c
         PBOERuDvZwd7LgkV7BNUMaM5vyehSayp0UPk5cZkUn2X5u6J+GQbiNAOjC231XdTO9yV
         rbng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794580380; x=1795185180;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gx91eDJpaU6S9gSHrYisO86Vlpx4mJs+TeI82IVUj98=;
        b=D/Tme8C1JuBBqpFXkQbR5SjPjotvD58rYft7ENvSR+Tgfp68px5tVc6WUNdSb7NcBq
         NKMTMd69VDbDJ4lO4qhBA7H5b/mNAxzWiAdM7RYMnP9u3XuMCtL5CZS2q4AhwG9UZU6Z
         W3RvTeVaB0ZazN0X7hcyriANBkOviOvnPJed7Qx17YAtsylWqfBr+fr4hcreR7FVefef
         oW5xBvqCs0tLXrTGmgXxiCy2C6yq9flYkOwcLNMmnYwHNNTTM5NylelnwY7+J4x4Nnn3
         EvC8e12+CJ9TFSTIxXuVVsobkwlQxSzGFoSxTsmPCXqBVq7xH0D51zYCC9Jr/E5ktr9a
         Jn7w==
X-Forwarded-Encrypted: i=1; AL+hErH4e2vsC3afOXNT51XDfG87h2vEESPUxQ06HZinkbZaMfl0sFIQJ7xge6g4sSPbE3uwzADgN1pVeShIMcY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QPgqxgN9rAO5PW4bjxMVhQ1C5cUSTwmm71jnkG9EOV1OBRR4z
	cl3aakqLtt/ckfiFb4vkxKevdoAFmw0Qn2YqM/qGuNW6V6YSFh7SThPyxWqxiNeFflgZS8GkGgi
	vMAbO6RxzEmGVuitEh9IJaUpP9WMFVDK1pSeyzOnau/1RacQfRZCxJzJGG74g7hdv4Z4=
X-Gm-Gg: AYBFou0BvOX65DeTa8BHs+pAI7eM+xq2VlPTqWe199hinsT9SDty5no7up13SfJM4xm
	5KyqjbcORtQXGEUg2EPAY6bOqRzfD4fFeYYOfDZrWzDLwBm2sm1uvRjiWpUvQUlhYAEunspRE6T
	czoGDpar6n9yvmhJ76v7ahg8H9u3ksdiFc2uNisR2CWCZSCOEM9ZhDKWM2Tb7lONnhkyCGVj3oL
	p6ZDvqjizqfZpDv7pUlgBf5Szcdi2cUT2SWkXc/VL0W09UXmBWyEO2Yp1TPQg4LOb/1W40i7t4C
	R/q40LcFYj+dWqvhjZAdbLdzLslVyr+q92wY2TNy55EniI0ctuNpCjLsyI88VuVeXfzCuZrQ+uB
	jcLvJk75OV6vKgIf4QtGk98gvdw5H/r1oh6FAuf4/eXlMMsZuN2sNgRshZqM34oI=
X-Received: by 2002:a05:620a:a719:b0:949:5cb8:6bd8 with SMTP id af79cd13be357-9495cb86f22mr83104185a.22.1794580379694;
        Fri, 13 Nov 2026 06:32:59 -0800 (PST)
X-Received: by 2002:a05:620a:a719:b0:949:5cb8:6bd8 with SMTP id af79cd13be357-9495cb86f22mr83099085a.22.1794580379090;
        Fri, 13 Nov 2026 06:32:59 -0800 (PST)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9495a5ef5c4sm71948685a.6.2026.11.13.06.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:32:58 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 20:02:21 +0530
Subject: [PATCH v5 2/3] dt-bindings: remoteproc: qcom,shikra-pas: Add
 iommus constraints
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
Message-Id: <20261113-shikra-el2-v5-2-8aca743de97f@oss.qualcomm.com>
References: <20261113-shikra-el2-v5-0-8aca743de97f@oss.qualcomm.com>
In-Reply-To: <20261113-shikra-el2-v5-0-8aca743de97f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794580360; l=1410;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=AP6m7K9bcNvLKnjx7yin31NugzckAmQBmT7FmQR5FW8=;
 b=3grAOrtRV282qWHFnvr0tb1SE6cYWndVBqaZAYbo7EGP8AmopSFDhWgbOvmACGOGHjHaUAlCp
 RCF5uyMrJ05BQEUzi2/HAtn57bemSJCmsfbesJuzu59nAB5M2jy6YwJ
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1NyBTYWx0ZWRfX4tnXnDBqh1Om
 A1oJCuKQPDu9yD6uqu9F/C2Q/p8cM+ZV0sOXpyux7n+HQGxwRBxS9iW4RK4SC7SAJ173roeWiLh
 PCGeOSWwrnm8ofOs2axYnAGttdCgNs8/9GM8CEQBcbm+VW+zzc80L+E7OapvRNbLDoXvxSU3t0+
 6s2Fg+Df4qMSj40GimVQ300B4sQZbJ10VM5lPp17PvUO725FhAZZlwZUnO8dUUDwTo4bybZJysr
 AEqEcxBfjCOqRSHFlpKQyrpuMm1j5TDOS++NIdjBGr35j+3uAj948Ev5WRK9Zfg1UsX862ZlQc2
 H2rMfM4HEoo93GUrDY3Iz76KJCNh75kzlG+lmqIFWFn8ZiW2uMdMo5gnFzKFb0g11ZgsYgN88+J
 sBXNtuAaGtpbrlWUMLeQWRQ68li4stwppVZ+8A28rLSFP2cFFFcAPxiGphO4wBaV21NN9AJtT/B
 5hGKkwkN1XVgvtvyfog==
X-Proofpoint-ORIG-GUID: wQGmw2xDPx_-XQuQryZoyqVLsOAoIlgm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1NyBTYWx0ZWRfX+Cx7FZG0CB1I
 Ii5BnuvNWRapDtZb248+erSmw5kz9mm2UFyTMuEa3bHXCIZ501Ux2k4v45UpLwK1QASzwOsYbCI
 xFCtvM5Vo1bajxZoacZ84honKMCOPkY=
X-Proofpoint-GUID: wQGmw2xDPx_-XQuQryZoyqVLsOAoIlgm
X-Authority-Analysis: v=2.4 cv=SpIFe/O0 c=1 sm=1 tr=0 ts=6af71f9c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Q89ptBQ9mced--_tLTIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130057

Describe the iommus streams of the Shikra PAS remoteprocs, needed when
Linux boots at EL2 without the hypervisor: CDSP uses a single stream,
while LPAICP firmware uses three.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,shikra-pas.yaml  | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
index 34a2f15e9361..1688d198cc5a 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
@@ -119,6 +119,17 @@ allOf:
           items:
             - const: cx
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,shikra-cdsp-pas
+    then:
+      properties:
+        iommus:
+          maxItems: 1
+          description: Firmware Stream
+
   - if:
       properties:
         compatible:
@@ -134,6 +145,11 @@ allOf:
           minItems: 2
         firmware-name:
           minItems: 2
+        iommus:
+          items:
+            - description: Firmware Stream
+            - description: Firmware MMIO Stream
+            - description: QUP Stream
         power-domains: false
         power-domain-names: false
 

-- 
2.34.1

