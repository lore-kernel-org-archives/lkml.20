Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711E24AF667
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 13:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788441798; cv=none; b=lBi82VVfc0Yce6k/j3jRriOskUfrF8P55xG/PfnocwSfydt1S9tqJ9a6YHTh/FN2GDzzDkXvMO4g73EUKGcrQ/yhQNUqochifjIClc77L25toTVfIblh0zCgBNAhR0fkm76CGkr7TZafKq2tBisLYsqwy9ltXNCxitFf4r30evo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788441798; c=relaxed/simple;
	bh=degx7nhJT2AUSifCshGpxZomdyz6i/wdqKZcuSCRLms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iNBR7pDnUPbcUd5cJGkVNFhD+3EPOEMniKrJtfmhoTxB/vVvw9kc3e5dgqcVrPfS21H/CvkgaGOp8PCf10L6Weqlb8XdaSj0zPupuMB4RPqnKLVBy4T4my8mNtAWSx64OWDGegZ3kLxcSGkH1dsQhCTswiqbJYU4HCWBslfz+Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sft/zSB0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gY3ZkVOh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sft/zSB0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gY3ZkVOh"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DAkAD708044
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 13:23:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=a67eEv58fAbLQ4CqoD0i9gTm
	udIxhzIVuWNoAajgcE8=; b=Sft/zSB0IO58CgKnabbIjCEtwiCEqKy5mchOW8Z7
	gzKyoB+quBUn+3BgFkamNKwiVgP3BIElFSQsuMKIxn3t1KqsSXJDkojrg5SOGEXJ
	uEOJi80faONRWcQduSSv9KCYZv1AnkpMXxyTO8S+zkn8rl7qu78/3l3shUmiIfeZ
	x40RCY9Ox79sIjVUGOIgouBCa5Ejd1dG25Ky+XJ5UcwubV5bKByhnYF3fmHvFO2q
	VZYN1qUS3yrzEIQOdBo5uJHkxbSqKS1I50mAoQQc2tvrQv8Wrb1DssOGj5339XhA
	ZrU9BTQYrBbOqTYS4Dhvb7A3AzOhj2bK0OA2ZELq7UVnwg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf4ekhedc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 13:23:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93975d63ffcso76981285a.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 06:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788441788; x=1789046588; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a67eEv58fAbLQ4CqoD0i9gTmudIxhzIVuWNoAajgcE8=;
        b=gY3ZkVOhIQzsr2iufPzqVgRP7QFn0WrHN3OyFOvQz4dP3Cr5EIUk2lZPIsZfKMxMWt
         a3o3zcNpi70qZI5NE8u6Ev08zhzD1zuZ9BGmvckY7o6xz7v+QybA+Md0hJTMgswffpQ1
         L+XOtzbhYySp/yyCPvVfMjm0DWEsvvhhf79JCvkedVyAPJ5vML2+ilGzLdmSkLV2Jcls
         Pm04VdClA7LF+yVKD8VuMwEn0MlxAhXYJVN/3BbiXm6+i3VDHx0ez9V3Syjo09twyvm1
         Tn1qEZaiTb17ylJgM74OIWXtfcw1VaCfAuH66+9R+fAgZe3WknU+46b26F4p3pLsEzO/
         vFCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788441788; x=1789046588;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a67eEv58fAbLQ4CqoD0i9gTmudIxhzIVuWNoAajgcE8=;
        b=fulOKgq3C4DTTBXmfOVvbP6DZc1gRaBB6iWn+2ngu0gshguKZErzw/HQ2nIsTv81/j
         jw56VbPJz+nBUH+9bpfFESqBA/bvUwjX/bwfgq4UsSdewh1aSeXO1YUJgkwZSWnK7umj
         QZf7D7tXzTKlnlF6Ey1GKpkkyVyJcs4mxMwvYQf4BkNDcIUZUzv2bNGaD9l9A+q7safS
         PoPBorMcFwueGiIH9Rd7q63ftH3kHsHqv/GHVRjzw/U9V5V2eUQ9bOIPUEjdmNJ3D4ZW
         vstfW5Zl0Y6wabumk/zijESklBwNjphW6oPV41hZuG4R461aoCFKPg5smckpAPZn7+8h
         Fn1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxlJWq1vkrQ6PuRRs4B/D0tt6LmK6eq9UPzOt+r5VE1dPVNjkB9NCWHGTCL0x/MenMDPQjBHKPdFjvEprM=@vger.kernel.org
X-Gm-Message-State: AFuF++mSF4AE5IQzZmb8XFQO+umfum55sKfmNGWogt5d5g+Lf28yXWxg
	FvsP0OVOdduHLUBQQv1k0kUvOoNJ7ri/j0DyTQ7vQgs5hVqnD7X3K+ZZTqCvQDRoPTfgeJzdUim
	fyWMHHJTC0b6IaRn0BUridmENGFRap8s/yeJ0nDzUTb6zOzw+HPeU87IttCV7NThEofk=
X-Gm-Gg: AYBFou0XX51UQhs7/gAU6oJk9PYaKyEnW2/Z+gaSqq1Uc10eAC49F0iZ0Lw8TYFXRaJ
	ase8QG4rCuNhY+8u2Fg7S9sCmKTRxFmH+/uqga5YK/PQ/htIBJWs3vAUNuPFhNMpBB+NOSwDL2N
	GyVGo5MlTOy/CpP8B3awGkEK8b6xQxr3Tk8F9ma2knDcQb3UWfmAhzC35D6AFs0Lis98Ab+h6N3
	UogBjG4+SfRFr0GO57JO5wbTqsUqSV+95le0ENsPH8NyiFEnMBZwU9dOBy96EExac2xxLOa99eZ
	gwR2QzVQwZ79jrAz70kTwQVv0O+mNLmfDtMl/rzv6MyAgnG6IrqOyFHuBQXTGnJKdV3se6tImTa
	m/pi6DHAN9Z3oyQ==
X-Received: by 2002:a05:620a:1709:b0:939:74ab:c1b7 with SMTP id af79cd13be357-93974abc7eemr331355185a.23.1788441787788;
        Thu, 03 Sep 2026 06:23:07 -0700 (PDT)
X-Received: by 2002:a05:620a:1709:b0:939:74ab:c1b7 with SMTP id af79cd13be357-93974abc7eemr331340585a.23.1788441787066;
        Thu, 03 Sep 2026 06:23:07 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee60d9c6sm72882415e9.11.2026.09.03.06.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:23:06 -0700 (PDT)
Date: Thu, 3 Sep 2026 16:23:04 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luo Jie <jie.luo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        quic_suruchia@quicinc.com
Subject: Re: [PATCH v3 05/12] clk: qcom: ipq-cmn-pll: Add NSS clock support
Message-ID: <t2uxcw3dl2dnb4n7zi23bjkixa6iisciiqgizrrp6xldqziism@fpuflpaahf4r>
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
 <20260814-qcom_ipq5210_cmnpll-v3-5-21c3db378611@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814-qcom_ipq5210_cmnpll-v3-5-21c3db378611@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ctIGo1IgLcx4hTMb1YM7vfN1WNZh2QfY
X-Proofpoint-GUID: ctIGo1IgLcx4hTMb1YM7vfN1WNZh2QfY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDExNiBTYWx0ZWRfX0Y2zkEJSdKNC
 xKp80nwS62nTDRks+5nrPF7Ge/Ijr2/Hg91xT+yU4WIDT/QKxe7SPr0atToE9gFNtIJFiF2LN3o
 BgYhPZkSBKKQQq3Ie64CiZekuYQLep+iM5ZR5/oGGxdDp0xt2XLJ1m0R48WN7jbFbsXT+e27Zdp
 EgacvJE3/LO2hERUqm16gb0ytuLoNYtjn/Y/eQFTjHAN5Pz3eDo4PwD0M2FEtFu3wU/7vERulMP
 hdBzJxaeDR9ufiJlczRQeCa9y2/ZoF4SV9j7TU+ccuRo/nNS/GWGLQc0BVlGMawenSBDSzzNOj8
 cEqI/H5Wm3T3BLoa6Pk5qV+5CwzzNBqoZ5AMrGihruQHCE1t4MtN/FMXfEMrhcWYxC7U3/M22/X
 XNTR8Fcx8lqfE15wpPTSx+bgxaxu0sStDeOlZprwrN43V7taviNLmPK+7qU5zmvgSnrZwF1tMhZ
 Hdj8DJaDQzvhRueHu6Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDExNiBTYWx0ZWRfX2Bsrt+9frQ9E
 iWMEZhXX3QrOoTbjqFu4RogueZU9Cevko/fDuuTrwMMCO1l+tGkpi+dxFbyfy61KLOsDNnddHxy
 AWyraS/3/xLIocx0CXPSYgJlkxBzFS4=
X-Authority-Analysis: v=2.4 cv=PKc/P/qC c=1 sm=1 tr=0 ts=6a9974bc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=bSJSfGj242zlhJVEaKEA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030116

On 26-08-14 05:48:15, Luo Jie wrote:
> The NSS (network subsystem) clock's parent is cmn_pll_div2 (CMN PLL
> rate / 2); it is then further divided by a configurable 6-bit divider.
> 
> Register the NSS clock through a new ipq_cmn_pll_regmap_div_register()
> helper, built as a plain struct clk_regmap_div instance instead of
> hand-rolling recalc_rate/set_rate. The helper takes the register field
> mask and clock name as parameters so that the upcoming PPE clock, which
> shares the same register with a different field, can reuse it.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
