Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793189723;
	b=MzDK0PBKMkAYAWVgltmyIBxHylxQmgROvQerkJVcYdww30gZvLJdkI/shEjztmIgdESh
	 iADhAnwnjd0dEwTLJd5B9k63LScQf2AVwdUVv8kZgthX/trIlphv19sAdjGFBFu7dbmF+
	 HV6QUefmI1p5CXoKRdGzCymFvpDGj42LLnfa7AQ11ERz4K7w+ialunS6uUZJa7ypioRzR
	 GYOtUMFuokAkMBTo0qRE3J/1ZaPxsr5/XDk1eVnuvJGwBONbixCmRFsNe4QDa1gxfArnY
	 NAYvdobK+kahhun4jtHd+JCub56TAfR5Iht13p91ZJp5sQR+Lr3hrhas3r1+fi5EEhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793189723;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=o0mJ6J7o4PLKHim6fwRObNP/dYi0kjw6fq/i9RTusvE=;
	b=5GUtMlvD+mTUYpt6Qkzm5fsK4wRFxxAtXVAbI8kHVEKlz3hgvUlagqwa8DiFd3eyv+s/
	 JmMb4tPVrvuDQq4fTS5vay1MGCmPcrwFWrdhK1kT8I2q0AqndFVThOvnmFlGW0IDJhiWh
	 wRt3ZPy5DQFpW9YI1IjBrBuqjGWLdgHWXwWjaxhbTV/mxco0NBGpT//VHs8//4hYQ8LLs
	 Wg8HUG5sR3ALnTnG4RHlVleHySKVgDGWUWLcqRqeH9D/281z5fshBm6pitjEX4b59t3x6
	 DPEyYMtpJCS6IzuXH3Rf4zPq4iYJRGw+7WsSKoaa2twPi3y5JIYW2T1bRWbSNR+/J5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=R0XU+uMJ;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18570606A321
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:15:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18570606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=R0XU+uMJ
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b1a86c0316so1484607a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20260707.gappssmtp.com; s=20260707; t=1793189721; x=1793794521; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o0mJ6J7o4PLKHim6fwRObNP/dYi0kjw6fq/i9RTusvE=;
        b=R0XU+uMJJPYTcoaGh8jMXXJQVUNu8kQqRZbSQ/BKfsUPW/6O+4A/6mlnglarHX8+2F
         VVtxU+auDjWuhUVbswmQ9y613w5C535K6Svep+IzM8bEtDleU8BdIfFZTimWUaYmRJ2p
         Po6R3dlPvjpt4OP2Lqpu7PUsHUp+dIBT5kSjT76k+0UIB32ndQ14VBHm4Pp/ZVX8f+oC
         +pAPdnrYa9gyHdLNkIktePXHMddKwmMNBSDv6hhsnzxJL2hPPBYi2Q/JgCS9kD8NIrwj
         xPP6Ob5x311wyv2FjgtKmhLhtV1XglFQ4w+OVidAW5NJYHfSgGixe2l9nZ0ZSOsOiZ9K
         QYXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793189721; x=1793794521;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o0mJ6J7o4PLKHim6fwRObNP/dYi0kjw6fq/i9RTusvE=;
        b=DfhXLW3WkC4cEBNZHmFMfLe5L04fFjHm+/9xAu192Qn7s6llO6chvOMkRoPpWQ+OoC
         jY0Wgkhe2PdkuqPo/08dUGaC67VwJKStygSUU6+yJFOQrjr8ACJk05CKbSSN3aXlWeAc
         yM6NChUKl3iChQlw6oN8AQfVoZc93TXFHFrTWQz+zMcrgbGFWCA+IFBKHyC8+oGCw/q8
         SC443sfSpf864hAijYeSj7TzAKQCSSiuzYK4zhOzY2cbVgaRa27KcKM0zhMRPn0LyRcR
         C+Xtr/SJi+6fCp58ggiZ+2mKzGRdoRuLQfsoz2btKdKtGYu0V2KeuO3vQ/vvVb2ivb5z
         XPLg==
X-Forwarded-Encrypted: i=1; AKwUvBzDWbKd3ciamr/V7ro8QHZZLu2Lh/1pqIqkgI0VTo6eCcLj22y7DQWvFzgWub7h3ixHJFCFBNUMOkewyaU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIf+t1+ZrNLmt/tCeCyPYX9W6KO8E3IQbhmo3rcqKH1N0sMwKch
	ktsQ4jMD3G4SWIlDl01SrjjmKBiXdVnv9mjFxUtnit6+aRzGvIT7gwI16Xl11AHGhTs=
X-Gm-Gg: AYBFou35e3t+jA1GwBPnkhYSpntH6xyKAVQ1DPeTQAg1CQSvCPTOC0IHG3xJTBLGcy3
	IdgUpAgdFf6CqIZt7JQ85VfWyrGwW5kjNjmz5ZggwjuNY9p/odUjC3L+XWG5nPxSYsVLUvGsy4h
	q3ixcLFF/+mcGgcpprk6qk1QPbhba4vNuKf2SoBJKwR44KBXzunLklw27+3UGEM+F8Ei4bKqcm0
	fGt2RhirCkEOtBioFdJdPMjlz/3gJ9FNDbaDwepPiZ26y7W5+0x2JsjA2cXalQzBnQe2zGy5J80
	JnHP5V/S2TfqKHI86tsmz9DYhUX2Hf6mS13eGgTRLXJxtuzoerdQ/dFFREvmFwgN7xFxbh+HYou
	m4x7v7Aum/UcW6T7eg/AwMFZG1M9hMUO/M7Pobxpor4KEjDWaIw8a2FiVROY4v6HfCtAaF9d4Mc
	ZqITzy3NGXds+i58VceOdWgc7QXHmNCLu+rOGm46PGqapJIQcEnsmoH3neU13OAbxtRn4txdU7p
	bKnfAYpRu0sIG3wLcciCcN0ECJiz1ScjtOr3Mj5hGKbfUUVzX+Ey2VGhHFEojl0FtnRwoXLFUWr
	AzTLs8X2yJSKJTC8tM4Kcu1OeAMjENI/zQVfiZChh98CBInZLjPauxCYPP8l
X-Received: by 2002:a05:6402:280a:b0:6b3:d0a0:39e5 with SMTP id 4fb4d7f45d1cf-6b49cbd88d8mr1464853a12.9.1793189716918;
        Wed, 28 Oct 2026 05:15:16 -0700 (PDT)
Received: from ehlo.thunderbird.net ([185.253.98.82])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b49640ebadsm1375699a12.18.2026.10.28.05.15.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:15:14 -0700 (PDT)
Date: Wed, 28 Oct 2026 12:09:43 +0000
From: Qais Yousef <qyousef@layalina.io>
To: Christian Loehle <christian.loehle@arm.com>, Ingo Molnar <mingo@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Vincent Guittot <vincent.guittot@linaro.org>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, John Stultz <jstultz@google.com>,
 linux-kernel@vger.kernel.org, Wei Wang <wvw@google.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_1/2=5D_sched/uclamp=3A_Fix_race?=
 =?US-ASCII?Q?_condition_leading_to_imbalanced_uclamp=5Frq?=
In-Reply-To: <97ab857d-9d9e-40d4-a243-253d1c2e411f@arm.com>
References: <20261028020512.10245-1-qyousef@layalina.io> <20261028020512.10245-2-qyousef@layalina.io> <97ab857d-9d9e-40d4-a243-253d1c2e411f@arm.com>
Message-ID: <57277276-2115-446F-A339-DBD5373E4F1D@layalina.io>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On October 28, 2026 11:13:55 AM UTC, Christian Loehle <christian=2Eloehle@a=
rm=2Ecom> wrote:
>On 10/28/26 02:05, Qais Yousef wrote:
>> Static keys are not guaranteed to be enabled atomically across CPUs=2E
>> Which means when sched_uclamp_used is enabled, some CPUs will return
>> true for uclamp_is_used() while others won't, leading to asymmetric
>> ulcamp_rq_{inc, dec}_id=2E If we decrement without increment this is sa=
fe
>> as documented in the code=2E But an increment without a decrement is
>> a problem and will leave the uclamp_rq in a corrupt state=2E
>>=20
>> The race for increment without a decrement is interesting as it means
>> a CPU has seen the static key flipped and incremented while enqueueing
>> a task, but the task was dequeued on another CPU that hasn't seen the
>> static key flipped - we need to be wary this might be a symptom of
>> something else going wrong=2E
>>=20
>> Plugging the race is hard as discussed in [1]=2E Take it for granted an=
d
>> do correction actions on going to idle to guarantee this state is
>> transient for a short period after uclamp_sched_used is enabled=2E
>>=20
>> [1] https://lore=2Ekernel=2Eorg/lkml/CANDhNCqyXsZ6G77z+9s=3DrTO6BZifRG9=
+hVxMTah+tAv6pB6h3w@mail=2Egmail=2Ecom/
>>=20
>> Reported-by: Wei Wang <wvw@google=2Ecom>
>> Fixes: 46609ce227039 ("sched/uclamp: Protect uclamp fast path code with=
 static key")
>> Signed-off-by: Qais Yousef <qyousef@layalina=2Eio>
>> ---
>>  kernel/sched/core=2Ec  |  2 +-
>>  kernel/sched/idle=2Ec  | 17 +++++++++++++++++
>>  kernel/sched/sched=2Eh |  3 +++
>>  3 files changed, 21 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/kernel/sched/core=2Ec b/kernel/sched/core=2Ec
>> index d7c3b43158dea=2E=2Ec6780358a7975 100644
>> --- a/kernel/sched/core=2Ec
>> +++ b/kernel/sched/core=2Ec
>> @@ -2111,7 +2111,7 @@ static void uclamp_post_fork(struct task_struct *=
p)
>>  	uclamp_update_util_min_rt_default(p);
>>  }
>> =20
>> -static void __init init_uclamp_rq(struct rq *rq)
>> +void init_uclamp_rq(struct rq *rq)
>>  {
>>  	enum uclamp_id clamp_id;
>>  	struct uclamp_rq *uc_rq =3D rq->uclamp;
>> diff --git a/kernel/sched/idle=2Ec b/kernel/sched/idle=2Ec
>> index 76f3c84ca6846=2E=2Ec722b23e07dc2 100644
>> --- a/kernel/sched/idle=2Ec
>> +++ b/kernel/sched/idle=2Ec
>> @@ -502,6 +502,23 @@ static void set_next_task_idle(struct rq *rq, stru=
ct task_struct *next, enum snt
>>  	 * lost_idle_time of clock_pelt
>>  	 */
>>  	update_idle_rq_clock_pelt(rq);
>> +
>> +	/*
>> +	 * Due to a race condition when enabling sched_uclamp_used static key=
,
>> +	 * we can end up with imbalance where uclamp_rq_inc_id() has happened
>> +	 * on a CPU without uclamp_rq_dec_id() on another CPU that hasn't see=
n
>> +	 * the static key flipped=2E The race condition is unlikely, but ensu=
re
>> +	 * the uclamp_rq() state is set properly on each entry to idle=2E
>> +	 *
>> +	 * The reset will cause the uclamp_max from uclamp_idle_value() to be
>> +	 * lost=2E Since we are imbalanced, hard to know what is right=2E So =
just
>> +	 * cleanup=2E This should be a transient error state once we recover
>> +	 * everything should work as expected=2E
>> +	 */
>> +	if (uclamp_is_used()) {
>> +		if (unlikely(!uclamp_rq_is_idle(rq)))
>> +			init_uclamp_rq(rq);
>> +	}
>>  }
>> =20
>
>
>I haven't checked the other cases, but sashiko notes a few issues with th=
is=2E
>The sched_ext one and the core-scheduling cases seem legitimate, i=2Ee=2E=
 the idle
>task may be scheduled while the rq actually isn't idle and clamps should =
be
>maintained?
>

I need to check in more details, but we can add rq->nr_running guard=2E Mi=
ght need to audit other updates here too since we update clocks and load av=
gs, which might be fine

--
Qais Yousef
