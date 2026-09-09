Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3705471276
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 22:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788992425; cv=none; b=M8ca7H2pEIHMwpXQIut/ZjP6l7HFyqntA2mEspAYBgZNXG3nDaTIJmlfWoDVljDW4kKqaCNtw5kHgYyfskU0jZupXNeX9WPt3xfHr5CsEU7PSSbarwNZjz+TuNktEY1u5+Wx/JLQRlVCqlOTFcWHutKvf48GrDkuC7115BF+C9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788992425; c=relaxed/simple;
	bh=8l+ami9ldrVu3hr0kXGLYQ6blpuZnPW3oAN2iwaBd/w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WQyNKuz1dT3ho+yVQ2T79pemCIL4ljW5S9h3Hp27d0ZXhl+qwI9Q7iISLv0Z5ZAOuJqeNORAq2q1Rh4AogXxYyPzGUkuZtxBpkGh6bKWl0+cJ56zci5M5fYXpAQdbbWBSHsjP8kdTJzgThjG17MDmCVYGSCLtYOBfn65Uz1z5uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nz85hBmb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D9jrlQzW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nz85hBmb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D9jrlQzW"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689M9kgF2595512
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 22:20:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BeK/1z0Ffq++309QbXgeNFfaNMYbnkujkRsfU6JzN9s=; b=nz85hBmbk8CF/1HF
	vTbyg+KZf8S/LNo2l7OjmmbgE6jb/RLqXJZdXx/7KYe21yZXFTVCre8/zf9vuEjT
	Gwnk4rQ356tz9ul05I9yxskqShI8GX4s2iQeZXOABk6ey4K1iSCCJ9V5i0lPpxv4
	V9tPOriHxMK7eLuOgElzHggEBXrpL4HyySQPlJPFhhW+gi5N6+1W2ULGEKGB3eTC
	vW+C5kul7NAkiIj6B4eKLhIkaSolGj23ti7/B2aRh095fvIMj+wOG/YdUMb3kUwY
	KcoH9tg26lUD3KFlRiFzbuVd3gufBeg0AK9RL9ToYc3SG69/O/VhL4agBbyLx0mr
	cXB2lg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyfgvx5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 22:20:20 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-396b9ef3070so9830017a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 15:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788992419; x=1789597219; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BeK/1z0Ffq++309QbXgeNFfaNMYbnkujkRsfU6JzN9s=;
        b=D9jrlQzW20KzABKaS6Xo6XZYM2BbqZ7JR7g56v3cNlmXYMdNRgNAJ0ineJC10sGgUG
         ESLBU5Yrat1SEmfo9Ew3snzg5NWt9AzBhXrf4NPzzWa0e1lPY0Wx6TfzdTb72KpkhFqo
         YdJ4xviy/nJ77pYwtB4g+XLXlJOdH8VaDh1N2sqMB+F36foxkhOFxLwCmbFhp9TOVSRH
         HrOHocCW0l+jOXSz4CluoCt8Sq1xpgPmNyfU666Gx3c8vtzPnsDwnKfGxPscln2orHxp
         uRVl1/6JMw/2EuNoJRHIx1TanDHhS1f7mEg98rkhVFvP+9JD8WEZkwj1HZXAOlvKEaBr
         lsiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788992419; x=1789597219;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BeK/1z0Ffq++309QbXgeNFfaNMYbnkujkRsfU6JzN9s=;
        b=PSG7wecgCuHdq2P0MYwWQ4haX3JML8PownVmsotrb/kZQNbBmT8ZxP3MALdsj0d6RJ
         1ua5AOaK4rRvYQSDqzaIxbF3Ouk+entbD2xZQH4KeQmYDFYQ11alPTmxKwodZ836EUSI
         pSSTRMqcyXuEcv0uZZIe/ImMeKbk4F/9cEr7NLIHlcrRfZafrUF/srbamSJBgrLkXfwS
         IaWox0Dcco//lSrlhwViXdd1U+qJvXGCYhWmQX1/62D10+PDqKJwd0F1BUsHqvh8Mj11
         bEzco2fqLC3YqtcyB0M/uufxlgQCe0v4rtdFhEVMtLbr2eT6LN+//S/P/5+cI/ndFYP1
         R3Ug==
X-Forwarded-Encrypted: i=1; AKwUvBy/yyja0I7BXxlWkJpzGqRFDNnlS0Xi742+dOJPD4lPtrQKVCDBXHSjnIzegO5r3ynVcF1ViZjFLSxBfsI=@vger.kernel.org
X-Gm-Message-State: AFuF++lIvW1yCZ5+HRhS2yUnwjMJLbBav4Yi3rKvk04+dsYBW0js2YH4
	euNIpoKoEFSmjjG36qdu9AD4HkTyllXUvZtryiCAgwVeDGeo1vWbWfPt6Xg75m0pXcyX0Lv4j2P
	onxZZuYwLtqYo+N9+sjwCFi2gulIvUqjZHiI69qi+voHpgImASXRXpwVBUAr7ymOOEuQ=
X-Gm-Gg: AYBFou1pmYm2QIqAPPLEpz08TUXftn+FCRBi3lpSnglaI47EWb5QRUp+7qwu4q83UTh
	9vO4WTOEUVA+aNMmPg2K3497bVPI1lylddZrm2F2fBkSqrio8OiPf4bxM6thB25NPrEzgtSMOsC
	tyrpCE42V/eA2ER7JWr1+IopY8JmPFX3/CEkERWfFCGtgum5xhA/tM6pZ5JGjEdZnKQnEphSK+8
	kPk5dZEfhKxydb2gWzJj7ZDH7t38RB3eLfVueC05q+vlYOH3Z39INUbuSVq5GQES6dye+BKJ4X3
	hUT0sqgOZpwE53xKiqUkGSHotTVLn93dRTuMt9sHW65w6nPTrllZT8FwrG3YWDd1/uE3AHXd7ts
	+rp8VexXBxa5pOgGtETCEkz0Q3PU=
X-Received: by 2002:a17:90b:4d86:b0:38e:6aa7:68ad with SMTP id 98e67ed59e1d1-39d70980956mr4531191a91.5.1788992419286;
        Wed, 09 Sep 2026 15:20:19 -0700 (PDT)
X-Received: by 2002:a17:90b:4d86:b0:38e:6aa7:68ad with SMTP id 98e67ed59e1d1-39d70980956mr4531105a91.5.1788992418800;
        Wed, 09 Sep 2026 15:20:18 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b9f68e4sm51299924eec.24.2026.09.09.15.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 15:20:18 -0700 (PDT)
Date: Wed, 9 Sep 2026 15:20:14 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Oleg Keri <okerixx@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Sumit Gupta
 <sumitg@nvidia.com>,
        Beata Michalska <beata.michalska@arm.com>,
        Prasanna
 Kumar T S M <ptsm@linux.microsoft.com>,
        Russell King
 <linux@armlinux.org.uk>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt
 <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, driver-core@lists.linux.dev,
        linux-pm@vger.kernel.org, Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] arm64: topology: fix arch_freq_get_on_cpu()
 overflow above 4.19 GHz
Message-ID: <20260909152014.000055d8@oss.qualcomm.com>
In-Reply-To: <20260909192351.33910-2-okerixx@gmail.com>
References: <20260909192351.33910-1-okerixx@gmail.com>
	<20260909192351.33910-2-okerixx@gmail.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDI1MSBTYWx0ZWRfX2EEk4d9ZqimP
 0tpOww31PsQHjv7RNA9nhutVry8U4MoxH++NIYX2oEysftjHV3opQFKQh0CcUictJnFhJ6Cd9J/
 m8lJk+YFBo71sXp/4iQ8WBQxAGumsYc=
X-Proofpoint-ORIG-GUID: 1y7bnNA9Kg-h3HdJ8BtxLwn2umi7CRRc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDI1MSBTYWx0ZWRfX7pPjyFb48kyt
 M3z0wxMlCJJMQdHixyrMHhBo/NrpSDF6mRfYHYU8/KtE1VqUOSeJ6m2OaZHo2YZGjsEXBM8hrYN
 VzsfbI1O26l61nNAnPfh2GYnksQ6tW3K1dXSPRX/EjvmZS0CtZISyjg5UuDEtUSNuiHx0dfuDy1
 2onuWCLPFFBGTHdde6MXdXs8Akct1bGSI7K40Jeitup+Np0ppt3GyThnvrriDK1DuV2shPle8gv
 bI4aJvs/aMJMV/pBDIlz8h01aS2rHmJ8M8oE2S7mBAbuvNe8y0CV+8v0+PhbvQA5uq6awZaCujf
 4PBpDqOu4tr1hK8BMRy2MX2yPLIK0Mp5aPdvRXHZ3caabmMl9IGukl6bluNscagKilGrmxlABSr
 E2odIU0RL5zOpfL2QqrFCPmBpJ53MOyavithGWb56rh9BH6dd3c8olx5wKtt+Mwk0W0vvITQKD2
 eq4PyV0WktD8B0OA4vg==
X-Authority-Analysis: v=2.4 cv=H5pOUOYi c=1 sm=1 tr=0 ts=6aa1dba4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=GPoSAeC3DJVMy4bTL1oA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 1y7bnNA9Kg-h3HdJ8BtxLwn2umi7CRRc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-09_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609090251

On Wed,  9 Sep 2026 21:23:50 +0200
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
> Suggested-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
You don't add that for a review comment unless it results in a whole new patch.

+CC Sibi who is a whole lot more familiar with Glymur than I am!

Jonathan

> Signed-off-by: Oleg Keri <okerixx@gmail.com>
> ---
>  arch/arm64/kernel/topology.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index d28438f8b83f..0eca321ff113 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -245,8 +245,7 @@ int arch_freq_get_on_cpu(int cpu)
>  	 * (see amu_scale_freq_tick for details)
>  	 */
>  	scale = arch_scale_freq_capacity(cpu);
> -	freq = scale * arch_scale_freq_ref(cpu);
> -	freq >>= SCHED_CAPACITY_SHIFT;
> +	freq = (scale * arch_scale_freq_ref(cpu)) >> SCHED_CAPACITY_SHIFT;
>  	return freq;
>  }
>  

