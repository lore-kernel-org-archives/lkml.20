Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E7739A05C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 06:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788935128; cv=none; b=s5CgD7BWy6MwNGkRqU5TCh6kGXX9jrKetUvYWJR8M+AyFksaTba+6WuNzAGrQK2XalJn13qOZpvNBmi+QKoVTeIiwqerYRdNVGY+c2WsIuip46PtbXe93ZBBdBH7V+GD05FqTPD5uHg7t8w6ySISF5a0x5fIVXbm18kuS2s/SZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788935128; c=relaxed/simple;
	bh=FDQ9oLvB/9iSSTVI500C2ZpyBJeQzPCDbocIK8dDvhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DL0HFqsT8PNy7ziXfrixQ8fFLRsdSaUMK/Dcgk4BqYTN+7iIgeUQbrVYId9rtZsyIW8+OCi6PSd7jZsQbpp0WMaj8cHLzAewtpEuvr2pwfhDrTiU2HQSUZRLb/uInqRquQ1Q0E/oUW7Q4/iV3LBq68isf0p3hIMtKAKQ+P0/Th8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RqHBwc0m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JqH6mPw/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RqHBwc0m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JqH6mPw/"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688Mg1Uf965188
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 06:25:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0ix6p4PpyFStk4fVNnc9uhQH
	KpowRpwa/lE/9HRH0oQ=; b=RqHBwc0me+EtdiXAUcxn/DYJuHnggAZZu/EF+ge9
	LpqGj8JJm4SQ+PYNrUj8IrTskEQFFyPeGpJSH1ERl50gPCSEHXgPXN7QANAtVi9S
	62DrXWF/myxYtEX5BeuH0pZIyrbVKe6pVTyh25wJyPpkXVkdmYhYE1/Ym7az2U1p
	rf6ThAXzgyRFKweuw/1TbsbFnd1a+1M/8Uebq3nBOLaFvB0VNEn0xQOe4uk3Ho9y
	Zp7U1ILH3swoEYRotG2PkWfjZl0RoMgWpXCLA7oMUacJyccdyuhJIJXoW9TEF4lE
	Lns1LefHGv/6PUQawYCcogQqRE8tGkE5SuSEvfqRcXbSlQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqha2hvw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 06:25:26 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2db050d469fso42394015ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 23:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788935126; x=1789539926; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0ix6p4PpyFStk4fVNnc9uhQHKpowRpwa/lE/9HRH0oQ=;
        b=JqH6mPw/WkULHQ0XnnN1nreRCnZi/ZSGE2iTzDICFefK7HNV5DDumhCsGmZEwG/4mk
         sJLTiaXr93SSKN4zM4P0W9IRswhxRSut5e/DFEGD2ixRP6J/p27jZy7/Niky8wxVLtmB
         3T7dAfMRewZRLKGxyLAnNl1HaoOQdKLvGoZTOJLyEzZ98wxxP/VmiXIFr1/RLlO4AVUA
         Ulp0FvPO7WfMHIgPmdOuckvjqDdEKJl2VLYGiaoC1r38zu3h3Yungjm7W9lrZKMbmNPG
         2Ho4Q9NKCAtka9NJmvNHqHE1OJltmmwZMY4J6FmQcC7lZH5K27Z/r8br+f5P57auvW5r
         pcLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788935126; x=1789539926;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ix6p4PpyFStk4fVNnc9uhQHKpowRpwa/lE/9HRH0oQ=;
        b=n/uUDP/ievo7ZPn5RSyhzXVgo6669Wc6lWhpMu3aXJcMD/y5wago6/Ipt0zUZd74qK
         rixkMNx862PLxb/FvIaxrX2ZQfe5se2MWWSP+09ld3Eap563NKeltVOHH3xy+UkDPGsK
         Bd+3HAzB4JNVZJfuOP/EItQaPWDh0uYq5TNeHXYdNahbjVmL3TiTrVoM+6+TXIAoObco
         AHKGqKrmxC1oKIQlMbPfNLErC03snTNLG3d1AGbE5OcrB2OZTyuMtqNXxImVvAaFKoNt
         3pKIYUelt1+cja+HeOtnCv6LMnRJBpugpz5W+bjDMYk9IvSgLhMc3K+9u0qqzVLjYSqh
         2Hog==
X-Forwarded-Encrypted: i=1; AKwUvByUzN/PW71J+afJix7/9l9w4kTHQ6NyK3t97FHC9BIe2dgrh+6d/QsFzpQDBZoLkqfPzEWe6ld7P/3Wipo=@vger.kernel.org
X-Gm-Message-State: AFuF++mhZ19/5TzcTrIeYNdG9qJDp1X/G8fUbBYrdSzm0I4HnqE002hC
	O7z3Udhu3SkK4ptwoSfZw6x4BnhLvyMsED8dLNwf2l0Yp2ez6pYgTgkFBLAtiE8zfI4eZQLvspI
	RUWx6BrViY8lfGpINVb7nRkWLYkDIH5zhdLhmFPtQFM+pw9quDjWQtxlSGBYYwn3cAIs=
X-Gm-Gg: AYBFou0drt0AES80KOyfdV0kpm5gEARgBNlGKQF+1m3Pr+CIoPCOwaZZWYM0BmuLbzA
	sxf8Y7CZen2K+D9Jnj1b72nam9FtwETZ1aPDA6fMga5T7b4EEXhfSXn7e0V4L48m09jzJJvgjFJ
	nbTrIUWnVgHYxB07ZQI8Tg8jA7vtg+P2brloDsGJKURaivnoyDtWjQy7np5myvZ6Y4KuhD7hZjN
	tcr7+YXVm6n1btgxUKyAioxXvGud8efZMXvU0ZfEveLofPRZV7VG2OtwexmSwuUCQdyhvZ1D0ax
	xzRvhgNKy06EpbFDQYgwF9xmX4r94x4SmHwrYKVU7jXh3zJcBcr99MvkYspUui2KhAPXw+bVJH6
	Y7gZ/M4IIRtRseTvF8/1xiD4AQKs=
X-Received: by 2002:a17:90b:28ce:b0:398:a649:8fa3 with SMTP id 98e67ed59e1d1-39b08799871mr40500091a91.23.1788935125575;
        Tue, 08 Sep 2026 23:25:25 -0700 (PDT)
X-Received: by 2002:a17:90b:28ce:b0:398:a649:8fa3 with SMTP id 98e67ed59e1d1-39b08799871mr40500048a91.23.1788935125089;
        Tue, 08 Sep 2026 23:25:25 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3369856a9f7sm21872041eec.5.2026.09.08.23.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 23:25:23 -0700 (PDT)
Date: Wed, 9 Sep 2026 11:55:16 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] dt-bindings/dts: qcom: Consolidate
 SDX75/Hawi/Maili MPSS onto SM8650 fallback
Message-ID: <20260909062516.4mtuca4jxxz4s26a@hu-mojha-hyd.qualcomm.com>
References: <20260805132129.2713174-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805132129.2713174-1-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA3MCBTYWx0ZWRfXzoLbgYkVqJtA
 vzW6PggeoiEvnhvaAZ6GpqzzKJ1hHokJlgInDYHXNY8ohIuW9gSQsJeFZqH5sKCi7nOMHV2NvT3
 h6pHcNwEKCS9a18U0sC13qjcDvWBWuAPtMGmSP/z/Ob7vrcHKS1PQDFQp3Oj3sQWEQSdeFXaBQe
 zbSNVO+wEz3f95oGgh9+KDQYpw6NXsNcRRO+MDwmISW4KavgC+UCH/8YuiXrV44SmzrnIF4p8/5
 FwFOfVS4yj/yQtkDrP5c6SIL2RgBlUDW3jAaPaYN4ZimHVz5EbWajGo1WaUI0BCI6+zgc3UEMdj
 LZer5oKquYOMtvkDx5aEtmMnDBYFAnXILf6jCUpVVs2IvA7qIo9rdaVOTq+lKulGyYfkQj+Ifga
 Vr6K7SjL9E9AS1d/Wm86J5i1MfVCuyPFip+20xzxXDgRe8CxJW4xus+qtquiClzKk2PHA9+04wQ
 U2HXWTLFDIQ6RxzWsUg==
X-Authority-Analysis: v=2.4 cv=Z5Xc2nRA c=1 sm=1 tr=0 ts=6aa0fbd6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=Ze5UrtUNWv7jlsdZOrsA:9 a=CjuIK1q_8ugA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: DofdsEuU3HIdyoNe-oYgdroHh2YfEky_
X-Proofpoint-ORIG-GUID: DofdsEuU3HIdyoNe-oYgdroHh2YfEky_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA3MCBTYWx0ZWRfX+2Oe2H+AwcgA
 8xjSGFnFvUfPUWxdF+g+NlCzbeb93d/fn2mR4fQfPSwF2RGio9nGCmua0QZmfV1QewlVoe7jwXF
 F5xDonTurmfF3l76t7FhwEu0eQgYLUk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090070

On Wed, Aug 05, 2026 at 06:51:26PM +0530, Mukesh Ojha wrote:
> The MPSS remoteproc block on the SDX75, Hawi, and Maili SoCs is compatible
> with the SM8650 MPSS - identical interrupts, memory-region layout, and
> power-domain topology. Today SDX75 and SM8650 MPSS each carry their own
> standalone compatible and are repeated in every "mpss" allOf conditional.
> The duplication hides the hardware relationship and grows every time a new
> SoC reuses the block.
> 
> Move the three SM8650-compatible MPSS variants into a fallback items
> block and drop them from the mpss memory-region and power-domain enums,
> letting 'contains:' on the fallback compatible qcom,sm8650-mpss-pas
> keep the constraints firing for the array form. The binding change is
> split into two patches so the SoCs with no in-tree DTS yet (Hawi,
> Maili) can be introduced independently of the SDX75 move, and a third
> patch switches the in-tree sdx75.dtsi to the fallback array form to
> match the tightened binding.
> 
> Bisect note - patches 2 and 3 are intentionally split
> ======================================================
> 
> Patch 2 removes qcom,sdx75-mpss-pas from the standalone MPSS enum, and
> patch 3 updates sdx75.dtsi to use the fallback array form. The tree
> state after patch 2 alone therefore fails dtbs_check on sdx75-idp.dtb:
> 
>   sdx75-idp.dtb: remoteproc@4080000 (qcom,sdx75-mpss-pas):
>     compatible: 'oneOf' conditional failed [...]
>       ['qcom,sdx75-mpss-pas'] is too short
> 
> The split is deliberate so the dt-bindings change and the arm64/dts
> change can flow through their respective maintainer trees without
> cross-tree dependencies. Patch 2's commit log documents the temporary
> breakage in-line, and patch 3 resolves it.
> 
> The driver keeps its standalone qcom,sdx75-mpss-pas of_match entry so
> already-deployed DTBs continue to probe. The binding is intentionally
> stricter than the driver; pruning the driver match is a separate
> cleanup once the DTB rollout is complete.
>

I have a series dependening on this, checking if this can be
picked.


-- 
-Mukesh Ojha
