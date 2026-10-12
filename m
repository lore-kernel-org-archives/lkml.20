Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440A74718D7
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791807340; cv=none; b=tdw5RjQ8NLwNzSTT1jS3puObhtNlaw6Hk5qo/bj6Bh4vDJZs7/OwDP/lRyJJBLoa3tQrmbUqXlLkUlOYpyiLa/kg4EkYrEYzg/XSLFUrRgOSf1aS44cIiWI0fo2BbaHdXwea89oQX3V1OQQFpLkuVQLPdQ/qM5g/dKFw33QuNvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791807340; c=relaxed/simple;
	bh=se+g2TzGdTctpUMNd/xcXANjKiqqMubtTpq386HTE5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pvX3XMLUdJp+MmjvKqiUbauXQzuse8nqNzC57aTbIuWOgrGpg/YW2qys9HIiHAYG/ajwYn4RMZ2f89K74EWP/oItYFhq3Bn9m0nzZ2il5jh1EWxOZpryNqClOg/QHBzgYJr7SczBjWQMUGc9VR1PcejB4/U+3VOndLIKUWwt5uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=aGB7gsYP; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="aGB7gsYP"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CCEXRi073794;
	Mon, 12 Oct 2026 12:15:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:reply-to:subject:to; s=pp1; bh=A8T/sZONYbolK1axECXP+
	DQc9J5foQik/6QoS9/0G6U=; b=aGB7gsYPgPUXG8yjSHH4pYRO78pEFR3XcnGuR
	RnqLkXQYtofVJKisFBDpxEf2tWSfVX4dfrLc+epfUXkPTBjhUIk/7K8aIu97QK4B
	uMDGa6egl3blQCR8I6e4yN/utR4KCweteM1YpEKDgAJQoqdc1xP56nH9SFaN0vr2
	EBlVnRTzc7lMGC4U/L5jHl3Pax0azbJZ7uqix4wtBkgaEiYspO6mR9FzE8TYWsoI
	2ASdFX56BA5f3FiJi3wpqiS1G3lAMq50uW0zfPGWe8j0FyxHlEU5uIU3+HqrZnmq
	Rd0wkDSGGLKUsMHW5v9oEIA18MPyWDO/TF0Y+bE3lJVLIY+ew==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4h7dwhrg85-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 12 Oct 2026 12:15:06 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC4upO013440;
	Mon, 12 Oct 2026 12:15:06 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4h81wfvvqv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Oct 2026 12:15:05 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 69CCF2n146662056
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Oct 2026 12:15:02 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3A14F2004B;
	Mon, 12 Oct 2026 12:15:02 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6EFBF20043;
	Mon, 12 Oct 2026 12:14:59 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.126.150.29])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with SMTP;
	Mon, 12 Oct 2026 12:14:59 +0000 (GMT)
Date: Mon, 12 Oct 2026 17:44:58 +0530
From: Srikar Dronamraju <srikar@linux.ibm.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, peterz@infradead.org,
        tim.c.chen@linux.intel.com, christophe.leroy@csgroup.eu,
        linux-kernel@vger.kernel.org, ritesh.list@gmail.com,
        kprateek.nayak@amd.com, yu.c.chen@intel.com, vineethr@linux.ibm.com,
        vincent.guittot@linaro.org, npiggin@gmail.com, mpe@ellerman.id.au
Subject: Re: [PATCH 1/4] powerpc/topology: Introduce llc_override debug knob
Message-ID: <aszPQppmUXcJER1x@linux.ibm.com>
Reply-To: Srikar Dronamraju <srikar@linux.ibm.com>
References: <20261012102037.2477378-1-sshegde@linux.ibm.com>
 <20261012102037.2477378-2-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20261012102037.2477378-2-sshegde@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0OCBTYWx0ZWRfX6y9g+98Y80zg
 Hf9VnGx8KKCqtOSpyYwe+V+7FyD7xOWY6ySZay8duffa8ELZBoavmrOb9+iW7Zg9DJnfxNpjtri
 q4wAfGbR17055+KHuZKKS7n3mTuYby55LAmkK4AVwGj8DGJ5rtGg6WqF2X7J0sOC505LAXP9cc8
 s8EXh6SHY8euWdK9K7FCKvchk7Rz9yvDJQTePFdhlI/oyfllqeAH36p5+82xR5u/djp7XWDlAQo
 g2zUA8WSNmJ9uh82UYzMdm1BllRh6ElvS7n1NIAFgeEptd0EFwFlcpj12W6SDwQFtukmMKJilWP
 tDvCuctaOJ2V51TqnF3LsplOKxIf1069kxBacmZKZE2Cwp+ooRPAYplLYHHCFABRGky06HbOxaW
 UeoSwQcvaUrvKrk9yq9LLnLGRYA9kZq5cnwtZMDmlFhD6yiin/IGMnq8D1VEPidhFdrnOhHpmTL
 te/qTN8weyu26IDIyYA==
X-Proofpoint-GUID: 2cuUwQ5KEcxni8N6IxmeU7JYiff81cT0
X-Proofpoint-ORIG-GUID: cRyUIli8e6wfR9VL_M0INNbuS5_TP662
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0OCBTYWx0ZWRfXxOgiZLG5IZel
 eFZ72b5J5iQOuWNCvGWf91dPKlNA9ebEmFfqY1Wq4hYaOr98fvmASEKImivRpBGMKzIuTr6shfQ
 Q0d3BugErC18yAzdA1JA2VULF6agZZY=
X-Authority-Analysis: v=2.4 cv=btHZl0ai c=1 sm=1 tr=0 ts=6acccf4b cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=8nJEP1OIZ-IA:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8
 a=hudXqxXAy8cwXFPxgu4A:9 a=wPNLvfGTeEIA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1011 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120048

* Shrikanth Hegde <sshegde@linux.ibm.com> [2026-10-12 15:50:34]:

Hi Shrikanth,

> 
> As a result, it may be enabled but has no room to operate.
> Hence provide a debugfs option one can set to try experiment their
> workload with cache aware scheduling. This also provides ways to explore
> it on system with SMT=4 to see if there are any opportunities
> to improve or uncover bugs if there is any.
> 
> This does not change the hardware cache topology. It only changes the
> sched-domain level at which SD_SHARE_LLC is set.
> 
> Initially start with,
> - New debugs file called llc_override. It can be set/get on
>   /sys/kernel/debug/powerpc/llc_override
> - Adds parser logic for the debug knob.
> 

This is a good way to allow experimenting to know if a software override of
the LLC esp given the latency numbers within hemisphere and chip.

> There is no point in setting NUMA as the LLC domain. So give option
> until pkg to experiment with.
> 
> Actual flag manipulations and rebuilding sched domains are introduced
> in subsequent patches.
> 
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
> PS: Split is deliberate. If squashing all this into one patch helps,
>     let me know.
> 
>  arch/powerpc/kernel/smp.c | 90 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 90 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index 6a5a5469aaae..433757511adb 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -36,6 +36,7 @@
>  #include <linux/pgtable.h>
>  #include <linux/clockchips.h>
>  #include <linux/kexec.h>
> +#include <linux/debugfs.h>
>  
>  #include <asm/ptrace.h>
>  #include <linux/atomic.h>
> @@ -1826,3 +1827,92 @@ void __noreturn arch_cpu_idle_dead(void)
>  }
>  
>  #endif
> +
> +enum llc_override_values {
> +	LLC_OVERRIDE_DISABLED,
> +	LLC_OVERRIDE_SMT,
> +	LLC_OVERRIDE_MC,
> +	LLC_OVERRIDE_PKG,
> +};
> +

For the current experiments, would it help to keep it simple and have just
SMT and MC. I mean we can include disabled and pkg based on our experiments.


-- 
Thanks and Regards
Srikar Dronamraju
