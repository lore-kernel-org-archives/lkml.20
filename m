Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792751364;
	b=C0JzK55r7soLjcwajh7zBNmdGvUAxt0C0im847HzIwaBGSZnjyE8TJe3LxB0tKu7OLLK
	 7RElC7u5GxaRRWbkqia2x6h1LkkxXPTZg8NBA5QujxtX0wEDtRFZ+QhGf45MI9PFWRw0g
	 eoWbLZPMaej286cmwAYzx5bwGAl89GUXqo4ZhvcDcA8MzpzV5n6MPQgQ6s9ekKZAp2/5b
	 WE+vm+TVrcKVMDy1QGjIFUrN2KParWNyO0vdKJA7CmrAlbKz/8hiXfVPYLvZTa1Gm4w1t
	 Z2IOfCxu2PsEbEc8A3Mbh5nKaFT+/5UN8q3cravAsZWhkOPVNipeiCUknCLwdZt9O8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792751364;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cCW/jm7dH9kl0phMtb0fBsyflK+VoPQNP2x119EfJr4=;
	b=VAIQzYXGepHlLTyLLAXURz1LAfl7YnMfTFfA3oyM3+doIM8jDsPmfuIDbyMXp80vfUPW
	 xdlIyVWVAWwWjYlVWdRvyzhfbSx1GvU9vIAhSaMBjNkYuQm3XW1ZIKNVmlmWQo/WO2syp
	 2jBRW026+CAa/8pWs9Z4yECZQAOHn6UnwwHRkXH5W6VOOeA8U/XMjx5Esj+HH8UE4DNZ9
	 wl66R+Vax9d4fsf06X56xqv39YvoI2BS3YG5oq4tWWQSdQrMM1dSrQLEa9e3SsP5WcgzE
	 WMWioG20oxpyHjDKStPsWhlk5mSsmgJLiOGYTHjAPvEsaFcH08Xclob3eiPg1KGUEJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MH39zxyH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="h/Fes1PH";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6788B606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:29:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6788B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MH39zxyH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h/Fes1PH
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAHY51597388
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:29:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cCW/jm7dH9kl0phMtb0fBsyflK+VoPQNP2x119EfJr4=; b=MH39zxyHuB5CCCo2
	SWh6/VP08eKv6xc6yoBUEv+GXXhc45BU2KqKRZzknfuP9exSxdmGbWs+WSytX9+5
	kvrst5N0j7sSPGq4mAhp9Q+tyBS8SBSu9GULSf2gJD/sxUmazFKL9CJmc/sAstZk
	dcTbXORAr9pgSZG+ij/2jVzr3W7guDv82T1au1/Isn3CTrBXrMoS6535aZxszheS
	kLT0Bjts+gqbFPdoHlSiGoukaZn4y80RskTEydffAB4dXzgV7NOp7D4OlDL0SA2y
	jOYZsV2ayhnC3xz3tFkvjFMUSTJjiFCZJyxtoQrO+Vchv000ue4hHPhyxqh8i9dl
	+idRKA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms377x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:29:23 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab868fe362so1264250a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792751363; x=1793356163; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cCW/jm7dH9kl0phMtb0fBsyflK+VoPQNP2x119EfJr4=;
        b=h/Fes1PHw2wvABnhEaxzJ5IKRzK0wuHNbRdzU/PjxlhGb9EYu01y2p5HUA2VmWO0dG
         +2GDcTsjG4p1uaHexTJQkwaiyfmsFpXcrzNF5bgEFdvm3wO6fHmvI69KviPgwQGexxeL
         MmnCyK8GObDkBWe6QMhI0z4IemlFNzPUlqzsUae1tUaphxck1L+p6kb/GcQtwPf9fjor
         LbwWR++oysi7wd9zePvZ9crX8jaj6Y69dN86vk4NuM39UzUVq4fPqjX91ZMLJGnWLUaB
         MynYoe8oV2CUe2u72DOWkCKgiDGan5gs2ibqoAIp3zlh32GqLXRvAWWg0N7RuTtvQ3Ie
         hjZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792751363; x=1793356163;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cCW/jm7dH9kl0phMtb0fBsyflK+VoPQNP2x119EfJr4=;
        b=gWGePYS2VDURiizMDFWfqeTIVYngy3lpVxYndz3XmJua/LXa1uP3No9KkkmRQQgDaI
         pDyJxPGp8e0IwwXgSj4GCtwn1W6h9o8MlNSZca+uZm1K5efDqnqKim/tE0nkPKsq1SgH
         ue5e4I5OtCIbUEqw3NvzYqoGEivv85ERO/z2w7hs826Q9Qnq2DBmmWa2cEezvFvmLeLq
         c8EYJJlTx4qE1bM33h289gJEqeDhGeR7vD32Ht5OY7ixhVbKnhSHY5WAm1Tzvz2Dd1Kd
         cSXcLddON2HNh2W9mW15sNf1EOFaVwS6RNPqXOQddK/VB2B07qm83zKZUwBHB+10izkD
         dfmA==
X-Forwarded-Encrypted: i=1; AKwUvBxtRL1ZREtLQf9btRc11FpGYBVovBlqS1dik/r963fAvtkHAKQnhfZ0GMChbLHnLd14beJ1ZhkmPWr9xA4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzH/j8Knv+VL4HZ/nSwQtGXqnO2fNQpa4xBh62A4PmB1hI8ozI
	mCW4qtC3cKc3et/dWRLbA3nPanJnSWdFaajy/Yl9+X5YyjbYVgIbD9qWkWwrXQktsDV32TIJw7d
	my7qhpRnaTt5RkhTKvH+/i2ZvCVucaxENTP3X8cQfnFtLYff2KUveHHkATjt4HxlhPis=
X-Gm-Gg: AYBFou38PmXvZrBhnt8jFAiWMgDQbzc7kSgbfftbt3eb7+uVc/xGeePA9N6ec6uAfxd
	KzDAIrHD7VM9UDeU13DPTY2Y/Ib2WD0Uda5km5xROj8a23K4EUe4i8sDs/yN5pxZBs4kBbz+u5P
	QfXUyzHeG40QPzfBCZsnqeZNGNLpEd+/BvFbked2vRdeN/vBremZSB4RGqhEnAw0y3i0WWShnKB
	SHojn/CcWxkM1RDIFAJGPSqWNeBvNTmcynbp9y/xUjyVUJZGcdFCvP+1yo20EPANJ49H+B3+m3L
	mKCrvzgJr3HHPpwhK6LN6gVFOBQtVeMpee284LHKLjut9CNoScMbjOlJgK6faY+YSUoSU4+7g2t
	vBtpPpdttWaqisGaSMBp3c5wMvBmtuucFEPKXhUH4p8CApAZ/9VZhGcMR762+MkHR1qg/GA==
X-Received: by 2002:a17:90b:3904:b0:3a8:6045:5a24 with SMTP id 98e67ed59e1d1-3adce45d61bmr1402630a91.38.1792751362669;
        Fri, 23 Oct 2026 03:29:22 -0700 (PDT)
X-Received: by 2002:a17:90b:3904:b0:3a8:6045:5a24 with SMTP id 98e67ed59e1d1-3adce45d61bmr1402592a91.38.1792751362084;
        Fri, 23 Oct 2026 03:29:22 -0700 (PDT)
Received: from [10.133.33.122] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3add282a8bcsm1061164a91.2.2026.10.23.03.29.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 03:29:21 -0700 (PDT)
Message-ID: <4de40ae2-3661-4fc3-85a6-63eede38e7c0@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 18:29:16 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND RFC] sched_ext: Support RT task within sched_ext
To: Andrea Righi <arighi@nvidia.com>
Cc: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>,
        Changwoo Min <changwoo@igalia.com>,
        Cheng-Yang Chou
 <yphbchou0911@gmail.com>,
        Emil Tsalapatis <etsal@meta.com>, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        K Prateek Nayak <kprateek.nayak@amd.com>, sched-ext@lists.linux.dev,
        linux-kernel@vger.kernel.org, trilok.soni@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, abhijeet.dharmapurikar@oss.qualcomm.com,
        rohan.tabish@oss.qualcomm.com, guo.chen@oss.qualcomm.com,
        haojun.zhang@oss.qualcomm.com
References: <6b295276-4f42-4f46-b5a2-50c3ac83b412@oss.qualcomm.com>
 <atD4U-L-Dx8LKFaT@gpd4>
Content-Language: en-US
From: Tengfei Fan <tengfei.fan@oss.qualcomm.com>
In-Reply-To: <atD4U-L-Dx8LKFaT@gpd4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0MCBTYWx0ZWRfXw1P85I3+brql
 3Juh3d9Fqm0f6qZJE0d36sMyZiLCvhuYnrY8roaL/+Q/YRjW7QFH9KxcbzLPC+8BBZQnlFfb821
 6gkyAamCn+rQbilPbwuhCLxIBUXP+8H/0soeZGdCdet0KhZ/WPf/m04kyIPUjrY8w/o4H38XL4I
 lh5i8n489Ziy/y3lJexILiWUeCULtyCj3G4h4OW7q2t82Jq2qQEG8psY8vEN6mmhSDqtyKkvIZf
 Bstq2EmsFGcW+loA8/RM5O5lDiVdH9gr3DvD1Q6v5rWshuB0jU25/C1DGgv+kIuHmNsAoH5K06r
 ssXQ7Ekidv2gpoJYuZbOmkRGyA3/1WlMOgoV3qd3pIiBRDTFOrs8X/h1ZduoQSzqVPH4LSc/ely
 NevhO4XmFh1D8QvNx/u3l/QJM1NEW1NqFY8gefKvtfV5bPtRNTI9I0JYBxg0lHUAmajvVQNkRdP
 7dm1Q8mk3M3QYTrcx5g==
X-Proofpoint-GUID: L-WH4bebk9J95lUUKmwzAV2CS14dq80e
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0MCBTYWx0ZWRfX6v0nbFQPMvsN
 Vs+sjcUkkkoq9Mo9UAQGOQQ9T7C82+M3wuPa5XowOsgqeBJazchAfZ7M4X8KSgv6b/fLj5d0S99
 X+E+IlM1WITvymfxAHb0njVX99zM/g0=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adb3703 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=OGjWj8McAAAA:8 a=obxQQfhHTCayOKgLE-sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=UYjydHh6ynBBc6_pBLvz:22
X-Proofpoint-ORIG-GUID: L-WH4bebk9J95lUUKmwzAV2CS14dq80e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230040


On 10/15/2026 11:59 PM, Andrea Righi wrote:
> Hi Tangfei,
>
> On Thu, Oct 15, 2026 at 08:47:12PM +0800, Tengfei Fan wrote:
>> Sorry for resending this as plain text. The previous email was rejected
>> by the sched-ext mailing list because it contained HTML.
>>
>> Hi all,
>>
>> We would like to discuss how RT tasks can best coordinate with sched_ext
>> for cpu placement, cpu balance, and sched load reporting to schedutil
>> governor. This RFC is intended to continue the discussion in email list
>> from last LPC[1].
>>
>> One of the options we would like to explore is allowing sched_ext to
>> schedule some explicitly selected SCHED_FIFO/SCHED_RR tasks.
>>
>> We received feedback from Changwoo that the issue is valid, and in
>> LAVD sched-ext, they tried affining RT tasks to a limited set of CPUs as a
>> workaround for the scheduler placement, but we do know that it is not a
>> flexible enough solution.
>>
>> We also had a discussion with Andrea Righi, that he acknowledged that
>> he understands the scenario and current problem, and he would suggest
>> not changing the current core scheduler, but instead using bpf ops to
>> bring the RT tasks under the sched-ext control. We are trying to explore
>> more on this path, and welcome to suggest or comment here.
> Yeah, we discussed this with Maria at LPC, thanks for the follow up.
>
> Essentially, my suggestion was to run selected tasks that currently request RT
> scheduling under sched_ext as non-RT tasks. You could retain their requested
> priority as metadata and let the BPF scheduler implement more controlled RT-like
> priority classes for placement and ordering alongside the rest of the workload.
>
> For example, the userspace part of your sched_ext scheduler could manage this
> classification. When the scheduler starts, it could identify the application
> threads suitable for conversion, record their current RT policy and priority in
> BPF task storage and switch them to SCHED_NORMAL (which will move them to
> sched_ext). And it could explicitly exclude critical kernel helpers, IRQ threads
> and any application threads that genuinely need native RT behavior.
>
> I would avoid making RT-class tasks generally eligible for sched_ext. The
> sched_ext core uses FIFO helper kthreads for enable, disable, and recovery work.
> The enable helper runs as RT specifically to avoid starvation during the
> transition. A priority cutoff may protect those helpers, but it does not
> establish that other RT threads are safe to move. Threads that genuinely require
> native RT behavior should remain in the RT class. For threads using RT priority
> to express frame criticality, I think a classification within sched_ext would
> give a more flexible and effective way to coordinate the whole workload.
>
> Thanks,
> -Andrea
Thanks, Andrea. This direction is worth exploring.

An RT priority cutoff alone may indeed not be sufficient to decide which 
threads can be moved to sched_ext. Following your suggestion, for the RT 
threads we are targeting in these scenarios, we will explore preserving 
their requested RT policy/priority as metadata, moving them to sched_ext 
as non-RT tasks, and using that metadata for placement and ordering 
decisions in BPF. We will start with selected application threads and 
evaluate whether this can provide the placement and coordination we 
need. Threads that require native RT behavior will remain in the RT class.

For the initial evaluation, we are considering a simple userspace-based 
mechanism where the selected application threads can be specified 
through a configuration file, e.g. by PID. The basic validation flow we 
have in mind is:

config (e.g. PID)
           |
           v
   identify selected RT
   application thread
           |
           v
   save RT policy/prio
      as metadata
           |
           v
   convert to non-RT
           |
           v
        sched_ext

This is only intended to validate the approach; we have not settled on a 
final selection mechanism yet.

We also need to consider potential consistency issues between the task's 
scheduling attributes and the retained metadata. For example, if 
userspace changes the task's priority after the conversion, how should 
we keep the corresponding metadata consistent? There may be other issues 
we have not considered yet, so any thoughts here would be helpful.

Thank you for the suggestion.

>
>> LPC topic:
>> [1] https://lpc.events/event/20/contributions/2561/
>>
>> Slides:
>> [2] https://lpc.events/event/20/contributions/2561/attachments/2025/4612/2026_LPC_Support_RT_tasks_within_sched-ext_.pdf
>>
>>
>> Here is a text-based description of the main idea presented at LPC.
>> If you already have that context, you can skip the section below.
>>
>>
>> Background
>> ----------
>>
>> In most of the Android gaming, video playback, and livestreaming test
>> scenarios, non-RT threads work together with RT threads to construct and
>> consume a frame. Finishing the frame on time without frame jank is a
>> key performance KPI. A balanced workload across CPUs with fewer
>> unnecessary CPU frequency bumps is another key power KPI.
>>
>> More specifically, taking a gaming scenario for example, UnityMain and
>> UnityGfxDeviceW are the critical normal threads that have significantly
>> higher load and usually run on the most performance-efficient cpus in
>> gold/prime cluster. Other than those high load tasks, the other normal
>> tasks mostly have similar workloads.
>>
>> It has RT threads like the display HAL tasks, SurfaceFlinger, and the
>> GPU related tasks. Those RT tasks have workloads comparable to those
>> of other non-high-load normal tasks.
>>
>> In our tests, sched_ext runs in switch-all mode, with
>> SCX_OPS_SWITCH_PARTIAL unset. It schedules the non-RT tasks
>> covered by this mode. SCHED_FIFO/SCHED_RR tasks still run in
>> the native RT class.
>>
>> Below, we call these non-RT tasks "SCX tasks".
>> SCHED_DEADLINE tasks are not part of this proposal.
>>
>>
>> Observed problems
>> -----------------
>>
>> cpu placement:
>>
>> In our tests, RT tasks can run on CPUs used by important SCX tasks.
>> This can cause the SCX tasks to be preempted, waiting longer to run,
>> or lose cache locality.
>>
>> Here is a diagram for easier understanding:
>>
>>          RT task + important SCX task
>>                      |
>>                      v
>>                   same CPU
>>                      |
>>                      v
>>                CPU contention
>>                      |
>>          +-----------+-----------+
>>          |           |           |
>>     preemption   longer wait   cache impact
>>          \           |           /
>>           \          |          /
>>            +---------+---------+
>>                      |
>>                      v
>>         SCX work may finish later
>>
>> RT tasks have higher priority, so the preemption itself is
>> expected. However, from the whole scenario perspective, better CPU
>> placement could reduce this interference when another suitable CPU
>> is available.
>>
>>
>> Load balance:
>>
>> RT tasks can be scheduled in the same cluster of non-high load scx
>> tasks. This can also be a preferred placement decision. While the
>> load balance within the cluster is also hard to maintain.
>>
>> We sometimes see RT and SCX tasks on the same CPU while other CPUs
>> can become idle very shortly. We need to check whether those newly
>> idle CPUs can pull and run the scx tasks. While if RT tasks are also
>> in the same scx scheduler, it is easier to make decisions from a load
>> balance perspective.
>>
>>
>> sched util calculation:
>>
>> We also see a difference in load tracking. Our implementation
>> uses a frame-window model for SCX tasks, while the RT load signal
>> in our setup uses PELT.
>>
>> The SCX task load is flat and steady, while the RT task load
>> sometimes spikes. An unnecessary CPU frequency bump up can be triggered
>> by RT task load spikes.
>>
>>
>> Why CPU affinity is not enough
>> ------------------------------
>>
>> We could use CPU affinity to keep RT and important SCX tasks
>> on different CPUs. This could reduce the time they compete
>> for the same CPU.
>>
>> However, CPU affinity is fixed and strictly limits how tasks can move
>> between CPUs. If the number of background tasks increases, CPUs perferred
>> for critical SCX tasks may still have spare capacity. With fixed CPU
>> affinity, non-critical SCX tasks cannot use those CPUs even when doing
>> so would help balance the system load.
>>
>> Ideally, the scheduler should be able to choose CPUs dynamically as
>> the load changes, while still keeping tasks within their allowed CPU
>> masks.
>>
>> CPU affinity may still help, but it does not provide the
>> flexibility we want here.
>>
>>
>> Possible options
>> ----------------
>>
>> One option is to let sched_ext schedule some explicitly selected RT
>> threads together with SCX tasks.
>>
>> This could let one scheduler choose CPUs for both selected RT
>> threads and SCX tasks.
>>
>> For example, if other cpu is idle, or running a low priority scx task,
>> or running a low load scx task, an RT task could use that CPU instead
>> of a CPU running an important high load SCX task. This could reduce CPU
>> contention for the frame important KPI and help balance RT and SCX tasks
>> across CPUs.
>>
>> Such placement should remain a preference rather than a fixed
>> rule. It must respect the RT task's priority, timing needs, and
>> allowed CPU mask. The other CPU must also have enough capacity.
>>
>> It could also allow RT and SCX tasks to use the same utilization
>> model. We would like to study whether this can make the load
>> signal more stable and reduce late CPU frequency changes.
>>
>> Another option is to keep all RT tasks in the native RT
>> class, but provide enough information for the two schedulers
>> to better coordinate CPU placement. However, this would also require
>> placement and load synchronization between the RT scheduling class
>> and the sched_ext class.
>>
>> After the LPC discussion, we'd like to explore option 1 and use
>> BPF-only hooks to achieve current needed RT tasks within scx class.
>>
>> One option is to have all RT tasks with a priority lower than the SCX
>>   helper thread go into sched_ext.
>>
>> Migration thread, sched-ext enable/disable threads and IRQ threads need
>> to remain outside sched_ext. With this option, we will need to verify
>> more common scenarios. We can explore the first option first.
>>
>>
>> Open questions
>> --------------
>>
>> * Can sched deadline can used to optimize those scenarios?
>>
>>    It is possible, of course, so we put it here, welcome to share the
>>    possible configurations of which tasks goes to deadline. However, here
>>    we discuss only the topic of plugging RT tasks into and out of
>>    sched_ext for these scenarios. For different scenarios optimization,
>>    there is of course no single solution. It still can have different
>>    scheduler optimization to make a specific tasks a different sched-class.
>>
>> * Other ideas?
>>
>>
>> We would appreciate feedback on the problem, the possible
>> directions, and what we should try first.
>>
>> Thanks,
>> Tengfei Fan
>>
>>
