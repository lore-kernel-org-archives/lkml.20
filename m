Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794898101;
	b=NPRfnnFxwTkd5KhMbGgrJY0u/teI+a5iuy42uWGJJ9cVCTiLqhWBv/DtKhj+s+qLUL7C
	 +sgTGx2HQbEFQRCFugIakifEtykhHy9mQ+bCxSGJJ6LAqxPU9hzWqmIix42Ofhji+r3FQ
	 LTiWeWGI/eEbHZqBhho5glep8TUttkNgHNB/FJHgMhesa9VdzB2NezCM3Qo5vtvkTejq6
	 2SyZaYZ5i2ndy/ClnLsTxTlpui4/KBwXblzQbWyVh8tCCS5JbJQj/pag0HZSoNCcG/BQd
	 RDQgQCR+IrAknXg1hdaV/PRbpVilrA7CUTA2pE8amY6sNCv9k62ImF0mKBMmik3h8Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794898101;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Z/dnX5/SV/KEoQ3eZLEz4TQa4serIPxwyBipxDqbnFc=;
	b=AJnmqg3fAD8lh2JtF5Ub/26pz4jZbHt0Yu7MF+V7R0HvqBytB1zchi5s/5MjUs3LVxN3
	 AiYDvv6BppDc7gMFjbiB+XNM7lGTyFGY3+0Dbf4k7MsNxSq05hkWBEaSMH9pihAE31XpG
	 xLMkYM3zRumiiit2IOMuP4yeWSQ62UKHV0/6RyqBAlZR3Yo+Jsiishekp966N4UnZv3k3
	 Mr6iMz6fC1snqPE/AMTkZRWMUDAZUWZ8sxTdYXKCh1XX78MKo9jcryy/uFPOtRxTGxsla
	 NWXaPrm3B+bSU08Zo6fRSsi20WEbK4IVxLKb7h6G/qmRjdjXZ2wFWJWjl/KUapSbY7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S3TgUpv5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LVkZCp+G;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAC8606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:48:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFAC8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S3TgUpv5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LVkZCp+G
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aGPn200074
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:48:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z/dnX5/SV/KEoQ3eZLEz4TQa4serIPxwyBipxDqbnFc=; b=S3TgUpv5OLUytlAv
	DR56eDkDTn8PxKqOfhPj37kOtZVgNYkPn9vEIuortZeI0tM/5/jg7gqMnsEYD+ro
	zUGMfLbDjFmx7s2bg02aOh4JnDXGGhxCpi3AR3PIxhp/u5s+OmQ/YQ5zaBEK1sVQ
	qzkIPnDtJWDkCktIClhd8sKI2TqcPre0WBmLkySIs/lhVQ6D2a0GfwTgZoRhFmob
	oFWsDjYqqjB8uHfZM0pcYKHj4ZjoaTP270+kCx7qKK5szodp7OeBjEy713CkIMcT
	8GxVqui2K/nrmpCPDJVcQsTTT/FLXnOBnA1O5wicJQkHwQAzDMDVgguUpz86ZBDA
	MV73IA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j038mbdm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:48:19 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ae19907a31so712749a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794898099; x=1795502899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z/dnX5/SV/KEoQ3eZLEz4TQa4serIPxwyBipxDqbnFc=;
        b=LVkZCp+GBNyz/MKzfHuJBEDv1rSR2sEtu3LYkZCNb6eGU15jdH37w5kHUjWT18w38p
         5e+sP/oJ5Uob518MYg7T0+VHRTxiDzyPmZbGtyu8obAM8lG0BcVltPpvgkriqcEUUCU3
         4wD8xMc6CeybjG3Ub/qOKj0CXzozys9dJv9Up1/iv7+eaVunKFNAyiNhBCCc6GEwGcxz
         MpacsymgedCqCyzht3FN0DNEnz3GyJPeKyXtUCVzLxNJsK/OaRgpTI7mFSPcdj7sKj1N
         lOUM8Y3z/jw21aFmU3X6vidg1dBnQoq45sMOevv0dV1+UmubRuF5kdTsN3VU1KTmOoKq
         JEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794898099; x=1795502899;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z/dnX5/SV/KEoQ3eZLEz4TQa4serIPxwyBipxDqbnFc=;
        b=N4aWKqirHSWWY6nhDZ0xdXBFdrQ4vF+oJGoNhI5NX/5eJzRM9NzERI47Tfqx15HVZU
         huH84lgoMi4/Gttg/E34xOtR875s3S5QwPmMgfm8qrAZYtwscgESGaF7i4Ei3fHSoveQ
         d6Ivsk58vChDCY8YGSgIpM65bJlXHPY9Bw+HJCaFkJNxiU34gteHLGHn1fMhYiGvBkIA
         wW7FSFHj2qNMzAcWWx6UjcdqRXJkzyg1rS4D87UU6AjF1xpqYPO2c1rDirnlXezdlxWa
         atdYd1Qub/E5obDc/EevILhX88FeXf3yhdD8cmGLVvxhlhRz5sgQoTbUDCaQl84B7Ebw
         wz7g==
X-Forwarded-Encrypted: i=1; AL+hErGk9j0UG6lqzLtFnp+yrcQL+35DZT2Fx3ZShvLTx0DzHCrM106dlOgn0iCxQDRbStKBn/QNJ7QXVi9AYaU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2UnBR9r1ZTdhBmN0xxwtz116pIWCFWMqIW0ZMF86BctPLupnC
	KsoGbmkHGfU4lmr5Dfn/nvjCIQ463d4W5DyGKIApAMGudcs03Wt4flh0pQzjRLTBA8FZgXRsFp5
	Qk8K9EtU6oc2/oO4QsVtQ3QAWeCxCqUG0U1jBSBojWvthn81FTmj5/EzI7UKN8eHlJPk=
X-Gm-Gg: AZFdTZd3Pcp5EyeIJ7RUjhgMGosHKqv0BlgS+/iP2BuOC7uMyuDoZP3TjTOhEWMsmfn
	DfvsOhv0IyYoGxPeF4Pr+AoIUNX7iloA6Z/L+BH32QTO8vpZYCW41a6XE9z79eJSrhn/rBopqF9
	stDdWGEC6C8LB1fvQSMU12nE5SLYEHelxL1HJTCmBKYn+2csgYii9E+rPD2Yrdhe/SSBEj+0T5T
	TUWkQh8W9HSSwqsMUFqhBJ8yHxtdGvC/G9gTA9glh8rx3IBrnJlBXazAYdQJwvb8S3xRcxz3zSN
	XIRKmE0nqWQwDnDqnj7VPwJRlqGSAAR+rrqxv/4EWR+Zq+0WoOUMqllrTXXD84mklzz0sr5jLEF
	MCx/EEvsai0QEnaWRGO9aGN3gpBcRPrN5aHMlNfgE0PEwUWjzbgpobaQqifSxdh5rO2+NsVmfUJ
	715QY8jm4=
X-Received: by 2002:a17:90b:5845:b0:3a7:96c1:f6f6 with SMTP id 98e67ed59e1d1-3b3ac26b7cemr1409364a91.34.1794898099074;
        Mon, 16 Nov 2026 22:48:19 -0800 (PST)
X-Received: by 2002:a17:90b:5845:b0:3a7:96c1:f6f6 with SMTP id 98e67ed59e1d1-3b3ac26b7cemr1409351a91.34.1794898098527;
        Mon, 16 Nov 2026 22:48:18 -0800 (PST)
Received: from [10.218.24.187] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3b110c0sm10212191a91.3.2026.11.16.22.48.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 22:48:18 -0800 (PST)
Message-ID: <c0922a29-7a2c-4606-b479-5dc6e76ff2d6@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 12:18:12 +0530
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
Subject: Re: [PATCH] perf: Reject group leaders detached by CPU hot-unplug
To: Daniel Wade <danjwade95@gmail.com>, Peter Zijlstra
 <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        James Clark
 <james.clark@linaro.org>, Kyle Zeng <kylebot@openai.com>,
        linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261116081248.21059-1-danjwade95@gmail.com>
Content-Language: en-US
From: Aditya Chillara <aditya.chillara@oss.qualcomm.com>
In-Reply-To: <20261116081248.21059-1-danjwade95@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyNiBTYWx0ZWRfX9iT9gI+h+czz
 h2/uHLSNVpt9B0WZAuzaEqk4JM0g8lKHqgromhC1xqXfaQZjpIK9ovLDecm8jHSEa65phEgXLmT
 duE+lsQ44CI/wrOcJvCyE1Rn0tWsquH2YxVHXSsSa2gO0XtF9h0Vc7ViImNtD+4AyULhDlvdkZr
 PRnC76AtaTWkxzxKaoOcIDO5alLvuS7KXTrBAk0wzWZuVYspq67VjxytZ1iqN3QnGxx4QZ6//xv
 57M9AyCzyNXiUlfw7qxwIQkxqC3Evgqj82byKu0Wb1QeCuYmsEsXdU8rGqgUMsInyk4/iLeFDpv
 IfMsgohtk4+DZThPS4i5Pa9laTeNvCoCU8qsaAHa9qzYMUJcTf+lvmX9nW6kLdTz8RqrrTK+ep9
 FUkYJF+nCRsy/qpRy5fdzShe4pjZtdUKSa85A6bamhOA3mU+O6SfqX2V+tOgP9mYvMlQbG3+K0b
 m04Vg1ZllTYSwVw9peA==
X-Authority-Analysis: v=2.4 cv=TckDJhQh c=1 sm=1 tr=0 ts=6afbf8b3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=nm-bDwiz_l59bqb5HEoA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: f0flWYBwjPosN64bHNZ-pn5Y5WQmH_Rf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyNiBTYWx0ZWRfXza7iy9/8JG6V
 ilhWkBzlOKrprUfPSQiSA3VgGmTqJT0+i3DFLGd/ZJ0ilBk4iDw5a0XB3dcfJYfGHRzdcd6Rsff
 c8WF7a3rV7ekreJwFC8fxp78VatBZww=
X-Proofpoint-GUID: f0flWYBwjPosN64bHNZ-pn5Y5WQmH_Rf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170026

On 11/16/2026 1:42 PM, Daniel Wade wrote:
> When a CPU goes offline, __perf_event_exit_context() removes every event
> of that CPU's context with DETACH_GROUP. That clears PERF_ATTACH_GROUP and
> PERF_ATTACH_CONTEXT and leaves the event in PERF_EVENT_STATE_OFF, or in
> ERROR, while the file descriptor stays open and event->ctx keeps pointing
> at the per-CPU context; nothing re-attaches it when the CPU comes back.
> Commit fa091f46c383 ("perf: Reject exited events as group leaders")
> fixed the same defect for remove-on-exec, by rejecting a leader in a
> state <= PERF_EVENT_STATE_EXIT. OFF and ERROR are both above EXIT, so
> once the CPU is online again a leader detached by hot-unplug is still
> accepted and perf_group_attach() links the new event to it.
> 
> perf_group_detach() returns early when PERF_ATTACH_GROUP is already
> clear, which is right for the double detach it was written for, where no
> group is left to break up. With a sibling added after the hot-unplug
> detach it skips a sibling_list which is no longer empty: the leader is
> freed with that sibling still on it and still pointing at it through
> ->group_leader. Closing the sibling, or a group read or ioctl on it, then
> uses the freed event.
> 
> Commit 42c5ca1f0a28 ("perf/core: Fix group leader use-after-free after
> sibling detach") fixed the mirror image, a sibling detached by hot-unplug
> and the leader closed afterwards. It promotes the sibling from the paths
> below that early return, so a leader detached first and given a sibling
> afterwards still reaches the same free.
> 
> Reproduced on v7.4-rc2, which contains that commit, with KASAN in a
> two-CPU guest, as root:
> 
>   BUG: KASAN: slab-use-after-free in perf_event_update_time
>   Call Trace:
>    perf_event_update_time
>    __event_disable
>    __perf_remove_from_context
>    event_function
>   Freed by task 149 from an RCU callback queued by
>   perf_event_release_kernel(), via perf_release() and __fput().
> 

Great find! Just for clarification and my reference:

A typical failing sequence is:

  - A group contains leader L and sibling S.

  - CPU hot-unplug detaches S and then L with DETACH_GROUP, which
    dismantles the group. 42c5ca1f0a28 ("perf/core: Fix group leader
    use-after-free after sibling detach") resets S->group_leader to S
    so that if L is freed, a PERF_IOC_FLAG_GROUP perf_ioctl() on S
    does not dereference the then stale S->group_leader.

  - The CPU comes back online and sets cpuctx->online = 1, which
    allows perf_event_open() on that CPU again.

  - perf_event_open() with group_fd = L attaches a new sibling S' to L,
    so S'->group_leader points to L.

  - L is closed; perf_group_detach() returns early because L is
    already detached, so the group is not dismantled, S' stays linked
    to L, and L is freed.

  - Closing S', or a PERF_IOC_FLAG_GROUP perf_ioctl() on it, follows
    S'->group_leader and dereferences the freed L.

> Opening a CPU event needs CAP_PERFMON or perf_event_paranoid below 1, so
> an ordinary user cannot reach this on a default configuration.
> 
> Reject a leader that is no longer attached to its context, rather than
> promoting siblings of a detached leader in perf_group_detach(): the early
> return there is right, and the anomaly is a leader on no context taking
> new siblings for a group that can never be scheduled. Test
> PERF_ATTACH_CONTEXT, which only the __perf_remove_from_context() path
> clears, so every detached leader is covered whatever state it is left in,
> and test it under ctx->mutex, where the leader is already known to share
> this context and every detach path holds that mutex across the removal.
> 
> One open that works today fails as well: adding a hardware event to a
> detached, pure software leader takes the move_group path, which installs
> the leader again before the new event is linked to it, so that group was
> valid. Events removed by hot-unplug are not scheduled again, which the
> commit in the Fixes tag relies on, so it now gets ENODEV like any other
> open on a detached leader.
> 
> Fixes: 226424eee809 ("perf: Fix corruption of sibling list with hotplug")
> Signed-off-by: Daniel Wade <danjwade95@gmail.com>
> Cc: stable@vger.kernel.org

Reviewed-by: Aditya Chillara <aditya.chillara@oss.qualcomm.com>

Thank you,
Aditya

