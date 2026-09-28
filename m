Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A323A19F40B
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790590859; cv=none; b=fnoj+Ih6YhNbUpK4bw4L/PbBN6yQbdatmWIWmllnFgmxVKEgg8gBfyFNMpJ3Cifwm3VL7GlHIwLiITYbbNxkdVdIfa3oV8UNtNRmpZC0Q9xnO8o5HPVvPvQqj+EE+ucTkYcyPD33n3ll1/0pHFidS/2GkG7q7ciVLpyW1Wtby0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790590859; c=relaxed/simple;
	bh=ObulXsSUbt5b1BlK/NY/o/9kun1M+44BCZu4NGNgZZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sT1M/ZxQU/cbMOkX9RLh+cEKEaIAwqMWZ3J9hLfoQlDipLJ2QzgL7JNfrdUMB9QAGzl1sdh4/mp+MS2JfsrcJVXCA0MpO5iNhVWyso3IIW16610INj8o0ga8aMTDHx/cDmrmqxpy9IYPYxpDsq7Qw3jOY2YiOMD0q7B+ADhzr1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hKFVFnf5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jwe1rk+V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hKFVFnf5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jwe1rk+V"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S9MEBx954452
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:20:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LNvreq1RRV6+/G/WXMIv7HZy
	uYx4WiTqcHV8qcpeqIo=; b=hKFVFnf5bWxCxr/6oIfHPODASy6vBNTHh6i07HZS
	UTbq/qoAv6JZVNBYZwH+1aBstmm+aN7BWrn4Ebh2ZakOLP/kdDenS7Tq24jfFvtt
	L/r6BXWlloTHkc+Bv/V1TF+8Trl/SqsEw1jfJ0PukKSmHDEmppsBFeKBJP5mjupG
	1JPsZOzkj/DQN4B+vT7OMHUKLzgJBG9RAyMBhIekq8OoO9Ngc9eNoFYshJkVg2G0
	TFuOrqHa6anHINX+9K6bspSc1R6lEU2TPlRO2gbzJ2b8e/pcSKIsAdSbWTyszEC7
	cF+3irStk4OYHwitYEGO1W4Kfap2y7BwESqGCiMxtZ+3Pg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynbc08w4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:20:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93c5ab5c136so297929585a.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790590856; x=1791195656; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LNvreq1RRV6+/G/WXMIv7HZyuYx4WiTqcHV8qcpeqIo=;
        b=Jwe1rk+Vg16gEDtRi49s4YoEqmWt+Y48Bd9iH5EUe4gRB4Gg+55rhP4cYW/GkoRp+W
         VWE6LJBScx4AtUIRDEaV2EQBLf548itSOnDtHbs4rCDAyl7pDV7UG/tshuHvZJ4Ta6wk
         6bZtPCmZ/SXFlwRQd8zBd3SWmiuVV8oU+MW1GBEhyMg3C2ZP5HGFqNUImgSj4J9iJEXF
         LllJtwPBwQmesydatgdMYorVAYRi70oXwIkubLDV3GY7dVA31TfpZSh2k13m8uaX2eVj
         fN0eolvdPF0dv+uZ5rz8/eMYnbfMUeZClTrF5i4XNEsLtRtq8xBhLXK1UqR4UxI2lcxn
         vQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790590856; x=1791195656;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LNvreq1RRV6+/G/WXMIv7HZyuYx4WiTqcHV8qcpeqIo=;
        b=EP7kjRlbJlc2+/CMYHRnnDoZZ7EDxK7slW9TH6PtDJepz+DzbJvTSIHO1TZ0GtTuDR
         Oi+S5iWBSND9KIfXatXaQSLOjR15BkakoEPzshYEURDolUYruliNyevhOwiPqOZVgYiO
         1qRuo0BM8i/utMg5e67Y19cntYHu3iTqZEK8nrX6ufYlRhxURo898wFKbio6v96DYZ09
         gzqz91v1k/xOgcvBGKeu0oLEkjhEsFWhJOEY3NRPhWxGR3DeJQUqGnSpNBZB/wkQ1jmb
         lq/R+dnKpyA2lOWWUZcIM4pIg4VRXR/gyIvJrW15mP7A8fNxplwC7DUwASl52BT6s0t8
         ECYA==
X-Gm-Message-State: AFuF++k9V9eaYylYph8Lx+jcpClcawBwwj/pYel/1d0kdvR0j1+akTqX
	fb2YcvkZ+mdrwz+q7EuHfIfQ+VPsMQyFsf3jI6dXZQIzjG3DT3oZi4kZsboZle9f/bzfNxcFlTL
	nCxLTtgXuy8pl/zAZhUeo3tAoUq8ojbJ2gs2BJNjCcAkMCMkgrbjXf3KS6jDKbDaKX/Q=
X-Gm-Gg: AYBFou1DN0t/9UxWeEAi6rBLw1rVkMYzP1SvqpvJYGVKMrIgUyserUG1/tbiEYooAT6
	z1ahcxiHS4i0duGn3e+d4GcVn6eQGQk2VCgGWanXsqXHXFG+gRx5e4o4VelCGnwa4+fiJ+3EWIJ
	Q8GOlRA4ipRETxUJni9rV/TV6wS+iUUmuFQf8Z2xUuQ0NR+VP3NzbCWHEbUDllWVrd/qV9TpSbz
	cV2M3/lhJIwS0V2vTERA9ozludzwwrdnjSeh3wDXSYdiGt7/Cm6v1lQMqQ41gvzlrNgOo9/gnjz
	9Roy/nxLFSufHOTyOoiyqcw0pWbhStvnYFkjAT9E4t2KJdhDm/3aVrT8TmnTYnT8Vb+5hbVwK4A
	W0yqjayeP+R/wNVNgZcuUahjVqnCqnug4rYA/gA==
X-Received: by 2002:a05:620a:40d2:b0:93b:fafd:3adf with SMTP id af79cd13be357-93c43d0ddf0mr1872144685a.48.1790590855747;
        Mon, 28 Sep 2026 03:20:55 -0700 (PDT)
X-Received: by 2002:a05:620a:40d2:b0:93b:fafd:3adf with SMTP id af79cd13be357-93c43d0ddf0mr1872141985a.48.1790590855273;
        Mon, 28 Sep 2026 03:20:55 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a64ef3asm26815729f8f.30.2026.09.28.03.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 03:20:54 -0700 (PDT)
Date: Mon, 28 Sep 2026 12:20:52 +0200
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: Re: [PATCH v6 10/16] irqchip/riscv-imsic: Add MSI address list
Message-ID: <ocjk3jylktlomol75tprkquallwhajlrcrjcjfiycfnhlsxcep@nk73eccs2gqc>
References: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
 <20260925151659.419512-11-andrew.jones@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925151659.419512-11-andrew.jones@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Sq4Fe/O0 c=1 sm=1 tr=0 ts=6aba3f88 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SRrdq9N9AAAA:8 a=azrel2x1CCEZ_N9yfE4A:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: RuxyU4yUYe5p2eHPYPd5lqRsSPr_NfDU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0MSBTYWx0ZWRfXzaAqOsoK5V7S
 qJ9h+E6DkEttES/rv9BsaQu4UusMDUJbmln1DkQWEWhQm0ZGqXGJEUCxkzD8uOvb6Plx/T3IzsH
 iqlI6n1YZYbxaPdlSMSSHlaEr9s4iyeh81VZxZIyG4kuJV16qkH4m2eJhJPCmWHXSYZ0mv+clbV
 Ogo8C2qplwwEjFnk6K4Vk38g+m/kpn+HeyH3A+kJdALM5agXqV0WzYPY7aBQgHgB5uK73Bn4ZJI
 ZA37rriF/MzsUmgREMyx5YVFEKPYHS79aV/pICRDtmrVkjMLm4XGeejHiCUtNsEWa22vuN5CS69
 a5/RJfqWKkH3BCFN4b+xCsT6FejhBPVKoLrFJoKkUF4V9GdGXzlhYAnsjI6MD0720d8T5JY0EAU
 3f4seLaKxRW/oT7fMiVCwcNSh3Xk1/BENBmdAAVpJMrR8LykPlDAen+2e0YE/vK/9CRooS7a3lB
 sxivcLDbKqSH78LK5Tw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0MSBTYWx0ZWRfX6eBoXKH0dmPn
 A+q4NrfUvd3qqe/CBBuKbE//2mxfhQrhng2ZiFEuFi3FTpe/HEO73d8aEQZnukiO8kDzUwvP0mw
 AyFcMdHY+VviAJPQx1GRVU09erB2BwI=
X-Proofpoint-ORIG-GUID: RuxyU4yUYe5p2eHPYPd5lqRsSPr_NfDU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280041

On Fri, Sep 25, 2026 at 05:16:53PM +0200, Andrew Jones wrote:
> Upcoming RISC-V IOMMU interrupt remapping needs to map every possible
> host IMSIC target into one contiguous MSI IOVA range. MSI message
> composition then uses the target CPU's position within that range.
> 
> Build an IMSIC physical address array indexed by logical CPU.
> Require every possible CPU to have an initialized IMSIC page before
> publishing the array. This preserves physical address zero as a valid
> target and guarantees the array has num_possible_cpus() entries.
> 
> The array size and each target's index can therefore be derived
> directly, without storing duplicate count or per-CPU index metadata.
> 
> Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> ---
>  drivers/irqchip/irq-riscv-imsic-state.c | 32 +++++++++++++++++++++++++
>  drivers/irqchip/irq-riscv-imsic-state.h |  3 +++
>  2 files changed, 35 insertions(+)
>

Regarding the Sashiko findings for this patch. The first I already
responded to on v5[1] and the second, which is new, is complaining
about the error handing in imsic_setup_state() for the new call to
imsic_init_msi_pa_list(), but the error handling follows the pattern
of all other error handling for that function. So there is nothing
to do for Sashiko here.

[1] https://lore.kernel.org/all/20260901133835.345001-1-andrew.jones@oss.qualcomm.com/

Thanks,
drew
