Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A194D4718EF
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394214; cv=none; b=OTkikaA8qTV9WxkrSqNsttkITK0dt2WmLaOu2/0okJO70m+xXacdH6WozuCkZdxAm5P2Qv94dIwYgaxAmFE4u5cJYIeGzho7aufK8H9Odo0IgwoURGogqEU+GXMk78w38s0KDUJyAYoQU3Ak8w6fIwDEKyC5aJeS/4GgvnO6+Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394214; c=relaxed/simple;
	bh=M+6skgex2LbjIffcqUB493F4H69t33R9/Nvqv1Ylk1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OdTuyvZtXOIfqS7Y9cH5uCd099ZJO8zn3clHRqlzzxFiVj1e5LLnyr7IDVhHpnS6OsFzFStPXQoG1MDfSZLmizYKkromBrP1LgZLBWNgsHVAhFot/A9pE+sj6WWiZgv11VmwFenGfsIAUikbcvyVr2SLFF6aSFrXBVTqaziBukI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hMV/ZtK3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hRjBlqhS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hMV/ZtK3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hRjBlqhS"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0NlR4090502
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yQZu//0K1s9pcLymof9rDsgR
	75pGuXjqO8YGkCYwTZE=; b=hMV/ZtK3+GXgbYpoksDHzpZSkIsTOaqBgOmBbUzi
	0LSxipFA+Eoo+Pdwx+o1SbgPTx06vSoQDVFAJWamlLrBw+uwNVh75jwX1sRlWS/e
	uK8l2sEy3QhFcg56tJEfx0MGDVtFLZxL/8jfcETogCVm8ADj+1Vvs3ksW3gyim6S
	0IFemGHV+e+aF7+Q/1epZDeiebsM3igtat+K9V3AU2rOG8rjLLDdZ5ooft7q8pW4
	nu0gbnVz8PmkzAwDZnUDTufBQPZlVaWexPSmZEt+x1/26Gd7rDZIV12jSfGQGkg0
	Zj2ZfdJHyOkWEiMcc1+hNqanxWGoY9IVt91ETgnK7NOUCQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpcjg1ee0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:56:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93918756165so617185985a.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789394212; x=1789999012; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yQZu//0K1s9pcLymof9rDsgR75pGuXjqO8YGkCYwTZE=;
        b=hRjBlqhSF9TeN6Wm/MpUM/N/DNXiPPLyEqPx/+P/3WDswDHBJnM6Gh0FMRnLv4cd9i
         cet4VMyxeyPHHrFqeBbnV+BNGc4Nn1IqcGb5GFnWN2aiOVjfGMx/VYZEOmAdYd2Q7UNQ
         tJLimNMnS61VeZpgDTkg4la8n2zgm2+fzbBaqXlx30pccxTWEDkT4/Nvt6HTb8/cj69X
         EJXOfxtCEJOwI4PVTK5wBjmV2bMAQDA+A0kj1oW54VXENAvqdLK2hm2+FRs/az9++MIF
         Bzy6Wo1+ZAqkNWYpTwhgInIFnLUwmUgufffg7lC3es2AJdrOtKFEacXB0YVNzTPjOhfR
         JvVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789394212; x=1789999012;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yQZu//0K1s9pcLymof9rDsgR75pGuXjqO8YGkCYwTZE=;
        b=DB5ziY7mdNvW2Nla3jFohU86R4saM/FgBA3HxmxfnNEQ9k8c7OoK2OAnQXOwcjRn2I
         xEIHVCfP/ms4eeMP+tvyA1DPaToDcrCf3oIyyRqFs664nkekAIK9uwfdfS3+0aZBX8EN
         Nj6N54NznxOOMsY0iOlGFlX0mDmMDOREpoVMRztKAYuxrCwGaHwT7LSblcBZaI4wsRsO
         Hth4l41fZOo8xqDFYuTPCz40UBUUCwLmhaHg5SHaxMB1SG9DFd32P/paX5zU5R9/iGay
         CcRJW8i2TScdGioJD3FvVYkaHYk97i/PTxFyC69CpOeFw6YYpTL26/nN2VvWU5ymH0j0
         gpXA==
X-Forwarded-Encrypted: i=1; AKwUvBz3Pl2jJCHPeYTp8z8GFJQDbs8fWSEr9Vo6VBiINZ2kE/Sr9zWnLML9dI0CVXFJx0htKeTsUFJOtqQWUw0=@vger.kernel.org
X-Gm-Message-State: AFuF++nw6iqMyew1Hw2i3RzFnLi0yxdqyHna2sMFHf8pnUFN2WDTrGQk
	wcrGJ7cQIA0FdvfJmoVNm63Ph1i2vX4i1G3kNKURUR4jdUGkjnGQgTTSNcvWsWtMrIsTmP3AFAT
	jp9mBn1Zc6Nj2cVInx5mbt+hJc2u4dDFYQnG0CtjW0at1zrdbLnZot4F1bHnwtnh8vHqALW5ZO8
	g=
X-Gm-Gg: AYBFou1Rcz/teWsOTq2pURpoV4SKb3phUvdhbbiOUBbSzWUyeGE9GXw7WYjmvOIf+pA
	dPsLL+9+rU4VW1hhSFrXMwtytY/mRTmSA7Cqm7/3wZtb5QwanzC7E91krE5lktympKCnljEoBoN
	OJzYBZnyS2jPcci7wRFQbpVAiS+TJkeYSOeFIZ1rgR9tlM0GgRKfYQaYmd2+woaMJJAmmZXM/M6
	Qgmp8JEl4P2s39w8rIN2o6gVkoycb/sqpixL6dJYa8EeK3IhAT5i9gVad2ec7kCLlqUPb82g3OJ
	9loQI5RtmXkGToe8mLoRL9kXf7gXeuF1Q2WwQTrohzyU754NSaUG9ATV/FKeOPZb+QKu0AqVoHZ
	zQxHcpLvlm9/LbA==
X-Received: by 2002:a05:620a:4089:b0:939:6de6:9516 with SMTP id af79cd13be357-93a29a5a848mr332587885a.45.1789394211656;
        Mon, 14 Sep 2026 06:56:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4089:b0:939:6de6:9516 with SMTP id af79cd13be357-93a29a5a848mr332581185a.45.1789394210989;
        Mon, 14 Sep 2026 06:56:50 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaee4sm479951375e9.14.2026.09.14.06.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:56:50 -0700 (PDT)
Date: Mon, 14 Sep 2026 16:56:48 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: Correct inconsistent indentation
Message-ID: <czb5ip5ndan7dbp2psu6mzycyv3rrk2sq5ngc7czdpen2czchz@odfmpqm2hhij>
References: <20260913141440.177169-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913141440.177169-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=CKa/zhrD c=1 sm=1 tr=0 ts=6aa7fd25 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=tPLuR_csD6jfBswSsDEA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: loAe4w0ktzD8ReAbM6G5eJOzpJhgfXRJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE5OSBTYWx0ZWRfX+CMowYeRvjCx
 YQKhoOtPuovDl1NzaK0lfHzpvSx7Xkd6uezUUILSnUmcBC5rN5Tb2WVoXfSGCWqTWhmtmo4XFPE
 XI7fFkKkftxriqBNaSXGpGQ7P9bjSBY=
X-Proofpoint-GUID: loAe4w0ktzD8ReAbM6G5eJOzpJhgfXRJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE5OSBTYWx0ZWRfX6b2vjMOkCnn0
 ZLhmdIlMbeLTxaZ1CGv7XAD/ZbQqGMCR/rVNvmlUkQYpMJkD63hSK1M1X+vzrc8ZEYzyVq3SIvU
 F421j3rsXLhWLs4N75S5VNplpvJ+FxyzSc8B3HSn3IJUkpTqwgvH8dyLoDB5B9DzEs7l5tU0+jJ
 cic88hqjKOyfnO7qn9XXk4brqLSVXeDjNbmE0D5ziRX7shIyMmJ8ogqIWGA2eOZd3XlQz73XX00
 5gFRmYMpG+lOkEMP3EKF6P9F+wm4/YkRv8IGu/GpRUi78NmARg3hMV5NNEfH0FB53pV+yCrwteN
 DaSaRegxS7m+3/8SOxWJEcvKwa1EsxvUgn8prJyfkDLX/pn9WEtkkQSuaNxtnmKbm00k5IcyAju
 PsIG4C8aipLN8XM6zjOvMmbXuwLIhSqbiBEKeyx/2ZSr25RNz/RfWbj8YXKd47PBv6DMt3kMeS2
 DsCvdrH5yt0w+1bMveA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140199

On 26-09-13 16:14:41, Krzysztof Kozlowski wrote:
> Fixup mis-indentation, e.g. spaces or tabs mixed with spaces, to fix
> dt-check-style warnings like:
> 
>   talos-evk.dts:39: [indent-consistent] indent mismatch (expected depth 4 * '\t')
> 
> No functional change.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
