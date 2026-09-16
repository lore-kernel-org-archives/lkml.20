Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE1D3A6EE3
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789572301; cv=none; b=eRJSJgU+MBRff8fi84YMeh3IiqvnSBpXIjA2n1bnQ7LdO8ke7nIw9SuQ7/7rNjG6zA6yb5QMvcR58oTJOEj4xM8uSMHrtJ2wOBnhMuryKgKaih0VovUm8fRdajwwjLiU2aUFpVBq4TSsoy1jozG1RUr0IUQ0Ar0GForZIM151Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789572301; c=relaxed/simple;
	bh=F6CGvSWmEKc9sQCb01q0ewzZ7EI1u8urw/X1ELlmnDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AbOc74EPJymYnUAkMnnFipdsBIdjCu28LfRaMhA4zF7ocIqvIoUxji/XYfn65dI9LQ3L1dmhgl/WvOFZ64u/4wP5EqkWul+lGFBeHyZWgFuDXTWpWn8AG2cT5qOnxpNyn8FOHEaalEGN0drDX067DDwdYTqA5d9+CsQwjfgvbd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=pWVqs8mm; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="pWVqs8mm"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GEW0jK4047273;
	Wed, 16 Sep 2026 15:24:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=bmSKfJ
	+DuEp78ohwrZ9bi3DjkEQISwc3a58ABb7nYFg=; b=pWVqs8mm1KLVHeVpN+DVF+
	D+4VpOYnaa7x6Ulv/NLU+GcY89Z36FvacSjdpOizWvz5x8KQbAR3TzBN34jILMvB
	eKSvAGJTGENtghBND1S0vzI/8oIzfsQUj8sIO/AnK3hQbf3FRdk6adNs1XVpQh94
	thDD9kqo1UhhUGB9ilAkdNuyiPTM7GMNx938ekwvZxgBoLs+Up5yXPhYCtfDtv+F
	HJ+E3YX4pVQvtTmSn7T9iUqL9qIhEen6KpjT2g5ifVA3cAINAz/gzxK5CmR3Lc2O
	EWCp2ojeSUHVHeTs5V4dXnY5AZTmxthay8CNTuLxTUe/zJQEf34qeNBJjxc4iRuA
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gmxcv4yb4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 16 Sep 2026 15:24:34 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68GFKEnC1601859;
	Wed, 16 Sep 2026 15:24:33 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gpyxsf0m0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Sep 2026 15:24:33 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68GFOTsN52494718
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Sep 2026 15:24:29 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 78E4A20043;
	Wed, 16 Sep 2026 15:24:29 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9EBDF20040;
	Wed, 16 Sep 2026 15:24:27 +0000 (GMT)
Received: from fedora (unknown [9.5.7.39])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 16 Sep 2026 15:24:27 +0000 (GMT)
Date: Wed, 16 Sep 2026 21:02:13 +0530
From: Amit Machhiwal <amachhiw@linux.ibm.com>
To: Thorsten Blum <blum@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/sysfs: Remove redundant wait time clamps
Message-ID: <20260916205928.ed6f9a7e-66-amachhiw@linux.ibm.com>
Mail-Followup-To: Thorsten Blum <blum@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20260916151254.120629-2-blum@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260916151254.120629-2-blum@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIwNCBTYWx0ZWRfX1MKeEM5oGno+
 TD/yKnMp+E9lWMFOuVrOppA4MS4jKaGUM5Q+qTyICZrt/9QaUon7fuzNZP0+IdXD1QhtOMeFlxH
 0rru5dfRTkU+rGlMAgF7cdNjd7YvEZM=
X-Proofpoint-ORIG-GUID: h_8GQgs1B2ldWI7eBrB5MBw1c6gErRxb
X-Proofpoint-GUID: iP8mRjI1rMc7DlK3nD45BzSs0JD4b3kR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIwNCBTYWx0ZWRfXxw4IM6GsMJOM
 LqbLtNdR6IERi5mWtXssBuFWpt6iTLMLQvfCbthVTsI3UqdPHoNY+y51FFA4Zc8JliOxAVRuFZA
 SaqQmv9CM8lT0ufqj3PyVA9qcpAKWNAlxVNH9YhXCpkGPzTrUGWaFDPN8zH9247B9lhBi5BcMZB
 xG7aandOjo93i3nUsio5zUCDgoP3rk8zISZ1sD21BaZZ5J47EepUzgMCWzsuRy0khEYmPgXa0kY
 1TcyUOR7fVyQmzOwwjqra77Bf4WIgj/McB0XmGkeBjfd4V8aYXaGmV7irM02wT7bYxaAQ8EBpvl
 VCGHwc5SkVTDMEHXcPDhiq82CiEV6Rj9f05M/isazaE/+Y25iQZY6kwUTpn7RtSKrOyapMSSAtD
 PUUqfd8LfXtCuoDCdQ95KzQq1NeDJT+YzYdsuEaBb5q2mn3uI+1g45euSZTtA0QjjiwE1uFNvoM
 020YeEtBzeKxlesOEVA==
X-Authority-Analysis: v=2.4 cv=F+7C5ahN c=1 sm=1 tr=0 ts=6aaab4b2 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=rBgiJsE2jx_ROkl76MsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160204

On 2026/09/16 05:12 PM, Thorsten Blum wrote:
> The wait times are u64 and cannot be negative. Remove the redundant
> clamps.
> 
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
>  arch/powerpc/kernel/sysfs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
> index 329c1690b5ed..2100c5e2c821 100644
> --- a/arch/powerpc/kernel/sysfs.c
> +++ b/arch/powerpc/kernel/sysfs.c
> @@ -338,7 +338,7 @@ static ssize_t show_pw20_wait_time(struct device *dev,
>  		time = pw20_wt;
>  	}
>  
> -	return sysfs_emit(buf, "%llu\n", time > 0 ? time : 0);

The time variables in both show_pw20_wait_time() and show_altivec_idle_wait_time()
are u64, so the expression time > 0 ? time : 0 is indeed a no-op for all
possible values — when time == 0 the ternary also yields 0, and negative values
are impossible by type.  The simplification is correct and removes a subtly
misleading pattern that implies a signed type.

Nit: the commit message could also mention that when time == 0, the ternary
still yields 0, making the conditional identity-preserving for all possible
inputs — not just the non-negative ones.  Strengthens the rationale a little,
but not a blocker.

Reviewed-by: Amit Machhiwal <amachhiw@linux.ibm.com>

Thanks,
Amit

> +	return sysfs_emit(buf, "%llu\n", time);
>  }
>  
>  static void set_pw20_wait_entry_bit(void *val)
> @@ -460,7 +460,7 @@ static ssize_t show_altivec_idle_wait_time(struct device *dev,
>  		time = altivec_idle_wt;
>  	}
>  
> -	return sysfs_emit(buf, "%llu\n", time > 0 ? time : 0);
> +	return sysfs_emit(buf, "%llu\n", time);
>  }
>  
>  static void set_altivec_idle_wait_entry_bit(void *val)
