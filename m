Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560C039D6D9
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 18:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788978996; cv=none; b=r1/qt1YoJDdX8zVaGPN6fPDXD++TG3q2HNiHOjxZ/3ruA3e2Fhri1OknJuhFn0p7sx1u4KTYwJu3AgicQcVFWIeGSpNaptFNCgMCshWK8NGjTXHjeucowmKGBVSrtjKzEYcds6qySGGeR8trSZqCxC0slwGxQXOVL+hyXgtFpuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788978996; c=relaxed/simple;
	bh=VTIfmTGTxvevC6B8X6TbPKbB2RVm5xX8myttI1OJqdk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BPT/gevJIcfnXavqnIr+4/68Y2dLtVe42g8a8xOmYB0Z7iV5ko4/MDwXkXLdY2yJ2y9Q8xwhR7O0/7Rr1zdL1JKO2LrsMTYREVcUxfjQ3+EKmH3Vu7DnMtMHiWuU1IFrr+XFwBKAsH9iG17LKNsgwyypjCnqQAIKwHEgZ/Fy6/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f9fHyVhI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PmHvIKNp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f9fHyVhI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PmHvIKNp"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689H7anL2600047
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 18:36:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mIQgohTE2rOvQzNapNCth9eVCnLrSjsevoHbhxyKhm8=; b=f9fHyVhIBtdv6EUr
	DlNghKVHtEJRyrLKeXFDlVLXSO1UAA+Yn7hGbI1f0UYI1DNCkSV2lKeExYYLGD6g
	CSPcVJVcKhiTXh+Xxk/ETQTYTWiD579T5wEStNDRoul/rvzTnmVWP+boZ79lxeYB
	FXY6hC14K1DEc4aUkeAYYXllFrx0NuolQS0A1f6pVA4SDRMZaY7G+8AWxlJU+/m5
	q6QTEC2o3J+6eOxTUhYEmqbFUC7PKOZIsJUYrpGkhwey7ynH8YGPR2uJl30S6bXj
	1vlfmR5qjsJ07tSDg2GrWJP2dkDKKKIPmCtHs7DDLTuwk43KCYv1lOSTaNjljB4R
	hLNSRA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk87r1nb9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 18:36:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398dcfabbf8so4918315a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 11:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788978993; x=1789583793; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mIQgohTE2rOvQzNapNCth9eVCnLrSjsevoHbhxyKhm8=;
        b=PmHvIKNpVc6ZotrI6heO/ZDvyuB8TevD4Rs95IxZbut4Euv9d4quBKttlnAtVdmx/L
         mgKydzdugHxlB0MYFjo6gM+QQmSekCKdN/RH5YgCZzPc+9OgFalJKBAn5vK9WsVBNt9a
         5jygq7OwaT0I95L+uraqQn+SYIzNbGAxsu2uf6nPfWma5fzSyzzAZuKFupafXy6C0qO4
         8ut20mizBpsIyNoP3eD9GzEk57O23xYrEfNkiPcMjx5XrSeVBHrqFM6OX0XrfG3w2Gtu
         hmbq/lyuproOr+EHVwn2Rfy85wkZWUi1ZknIZNzdD81bULFVkBly95Y5vcigMdGd2fFV
         hCFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788978993; x=1789583793;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mIQgohTE2rOvQzNapNCth9eVCnLrSjsevoHbhxyKhm8=;
        b=bTwoG5dBbqRbz7462IKwWYykZ3yMcF8NPJLSYGODQI6FBVvrQCAvalYDmTNKtdtcpW
         /lE7E9RY+vV/oP19ERmmSgyygCk9UGf4ZRi1dpDBBD0eIBb1g3VjSGof8zNN6z2ElTPK
         EYGY9Js4woo2tJlhFFaTQBSTdrwbwZEl3vROHh2fFhlOLsYlLYSvOXBT2Sel0IXSudOO
         E1cBo9I0t14uXH8CYRSobM/2FTrbCGbxPbwMDlh984AvOxNUKJ04Q0h7uRiNHivLnk0t
         rQptl+nUqGQwW+nn29BVZo4Hw4yXD1KeA1Rx0dzvx/DuIBo09lNEO0qdhg0Pia4dHLAh
         r2UA==
X-Forwarded-Encrypted: i=1; AKwUvBypP3TOHTRrSFi8lNBFBZSkVh1JFiU1fLMs75AhaK4hJzL3b3WoCKK7OJvZFWsrGmzVGeVxNLRFyVR8d1E=@vger.kernel.org
X-Gm-Message-State: AFuF++kDziIrGX3G1KFSepEU2bNH08zj7YqCrZ7Gf52nrXkpLf4Na8bH
	DTbwJEBlaMkH4U0cAOREl9jqm7dhjzz+PhdIV6J/Xc200/mIWSBTJZC0R7ndl8A+Cj5YXM3D/lp
	+XWR454Gsm3VHZ0NE9eTjb1vt4ZNlFDIUnajvmlxYxAZQVPFImqMR2sOuNM83IShIYg0=
X-Gm-Gg: AYBFou3Eigocpm8NxPSccAzw/Qf+kFrMH6GTGmRWUzBwgbFhmV5zfL2d9OwsutArwIX
	MsBYQQPt8k4UEZH21hDsSmTonmC6DaHpCWAfDV5x4H3Jz7VWeDZ9uZv0LvPFIuH7NHbiDxIGuFR
	raamvesq/LC8eBde/2TKaXTnHeqifddWH30oAb8OqWokveonZC3WM981UNw/uzGX2rrIVH/u0Qw
	ApDZg1gDMYMezlEFxYo2BvcSYX1c6CMfb5VsKS9JXuJzt11ZCRhw4/WNwXzuNt8VuvnpR5Fn89m
	C2QeB66r0S1jNPQ8Igcaxw4Rn8DseuLFjobYIWQl1Vf+Q2mDeyOIq9ctkEQCwO2roeWjvc+2lYg
	6hRHz9Lq3xd5Rk0jkJ+/CezknrE8=
X-Received: by 2002:a17:90b:1d4f:b0:398:9be5:b417 with SMTP id 98e67ed59e1d1-39b26221eb1mr53821147a91.18.1788978992928;
        Wed, 09 Sep 2026 11:36:32 -0700 (PDT)
X-Received: by 2002:a17:90b:1d4f:b0:398:9be5:b417 with SMTP id 98e67ed59e1d1-39b26221eb1mr53821108a91.18.1788978992503;
        Wed, 09 Sep 2026 11:36:32 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1433171a97esm50371041c88.12.2026.09.09.11.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 11:36:31 -0700 (PDT)
Date: Wed, 9 Sep 2026 11:36:25 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Oleg Keri <okerixx@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Beata Michalska
 <beata.michalska@arm.com>,
        Sumit Gupta <sumitg@nvidia.com>,
        Prasanna Kumar
 T S M <ptsm@linux.microsoft.com>,
        Russell King <linux@armlinux.org.uk>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert
 Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Sudeep Holla
 <sudeep.holla@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich
 <dakr@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, driver-core@lists.linux.dev,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH v1 1/2] arm64: topology: fix arch_freq_get_on_cpu()
 overflow above 4.19 GHz
Message-ID: <20260909113625.000063be@oss.qualcomm.com>
In-Reply-To: <08ee55292c1cedf26067d1a2b02fa5657d9650e8.1788712186.git.okerixx@gmail.com>
References: <cover.1788712186.git.okerixx@gmail.com>
	<08ee55292c1cedf26067d1a2b02fa5657d9650e8.1788712186.git.okerixx@gmail.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AImJJIpd c=1 sm=1 tr=0 ts=6aa1a731 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=vZYCpiARan6kKAuTxo4A:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIwOCBTYWx0ZWRfX0zb4/ZnpPlqZ
 ib5LkFR0HjXkAGG2MPQMvpmvjxSJFrjuHktucaKRnBouxsttZGA7lw+C4ZnyiCJaUJE/S6tAoI3
 yedlu0vYZGilDjdCuQiNRz0LHvbYGhF1J80COsQyLyG7lKTZ3vmKxKbF4kIjNcF3syUzFTbx7Ur
 SxrkUIkvDvRPcNmIn9lXVcJ+ShgnjYxFZp6wZV+1OxQ/B4Tpr9h22p8gKu3A9UPYRYS6w7BPxTW
 wsfWMhmC6b1wc24oS74QiHttSlvmrUbC7ZLqLPnZvTyUC1ez0WM2V7QW9DjTDaLvfQWkfsYI5DY
 /IADQKnc/QruFPtjUgPSxRQgijyIliLTPJqbJlCgVZ1UaRNmbK020VEb+PbUFp5nQO+EHIu4tSU
 DA8xp6yRAGO02Gp6idjWrd5t9AFzpZyjcz0Xg26aS0lLmYYRxaxlhKvJbeaGC0Sd1F12YA2SLd1
 j5O4tdceoNb3fkx3v1g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIwOCBTYWx0ZWRfX7uUQ5KoZukNw
 vmfTNTgHLtow6RksDbZLy26LEFm+DtA72eEFHdBIPA9uVObMbGJolYc/Cs9ykwLS6cTdhuzEVht
 UekFbbrYokjz3/r+c0gC72FwkR+N5Zw=
X-Proofpoint-ORIG-GUID: DekXrHj_qsvVxJiILyy8nyUoyKgsEVQR
X-Proofpoint-GUID: DekXrHj_qsvVxJiILyy8nyUoyKgsEVQR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090208

On Sun,  6 Sep 2026 18:37:14 +0200
Oleg Keri <okerixx@gmail.com> wrote:

> arch_freq_get_on_cpu() computes the product of the frequency scale and
> the reference frequency as a u64, but assigns it to an unsigned int
> before shifting it back down:
> 
> 	freq = scale * arch_scale_freq_ref(cpu);
> 	freq >>= SCHED_CAPACITY_SHIFT;
> 
> The product is truncated to 32 bits before the shift, so the result
> wraps once arch_scale_freq_ref() exceeds 2^32 / SCHED_CAPACITY_SCALE,
> i.e. 4194304 kHz.
> 
> On a Snapdragon X2 Elite (Glymur) laptop, whose boost OPP is 4723200
> kHz, cpuinfo_avg_freq reports 524283 kHz instead of ~4723200 kHz while
> the CPU demonstrably runs at the boost frequency: a fixed workload
> completes in 1.72 s at the 4723200 kHz OPP versus 2.01 s at 4032000
> kHz, matching the 1.171 frequency ratio.
> 
> Keep the arithmetic in 64 bits until after the shift.
> 
> Fixes: 16d1e27475f6 ("arm64: Provide an AMU-based version of arch_freq_get_on_cpu")
> Signed-off-by: Oleg Keri <okerixx@gmail.com>
> ---
>  arch/arm64/kernel/topology.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index d28438f8b83f..804758eeb63a 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -245,8 +245,9 @@ int arch_freq_get_on_cpu(int cpu)
>  	 * (see amu_scale_freq_tick for details)
>  	 */
>  	scale = arch_scale_freq_capacity(cpu);
> -	freq = scale * arch_scale_freq_ref(cpu);
> -	freq >>= SCHED_CAPACITY_SHIFT;
> +	scale *= arch_scale_freq_ref(cpu);
> +	scale >>= SCHED_CAPACITY_SHIFT;

Maybe just do it all one line?

	freq = (scale * arch_scale_freq_ref(cpu)) >> SCHED_CAPACITY_SHIFT;

I was going to suggest that you roll in the arch_scale_freq_capacity() as well
but then we'd need a cast to ensure maths was done in 64 bits and that was uglier.

I think this should end up the same as what you have.

Thanks,

Jonathan


> +	freq = scale;
>  	return freq;
>  }
>  

