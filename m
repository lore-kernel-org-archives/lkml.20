Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255A03019A9
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792156723; cv=none; b=pZ0NpbKQbAUBSUI5M73/fTIgkHzqku4dE7CPf0ZxkS03TYoUDcTAoKk9KG5jKxv3B2uLj/ZcGgIyIENjP+ojnx+Ex5U3iPYCr52vFx7P4Kd/1edmOjHSgyUJvc/VcHgASymcOWH50jGs51oWwy7jFHhgcFzXQLP9aWidbWKaU+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792156723; c=relaxed/simple;
	bh=QL8io3hFYe/v8PWzmMCFcoQk6f8JTOuZ0YD1MSHt3Ok=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LoO6mR6Yp6HHj/FbSJNkMW/ybD3ldW4greW/f5aNCmeAd85LFKiWMmxTnzcNZB4e49JkxBBIBTQtie0jI27srgDr8sCKYRyvow1NjVLDJu1KijTv+FfU7u0eNOzbuCZKJa6XmDZmCAQiy7hg3nzsKgGRkm2xCyo1iwyqSh6k9rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=okonski.org; spf=none smtp.mailfrom=okonski.org; dkim=pass (2048-bit key) header.d=okonski-org.20251104.gappssmtp.com header.i=@okonski-org.20251104.gappssmtp.com header.b=jJJ4uC6O; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=okonski.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=okonski.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=okonski-org.20251104.gappssmtp.com header.i=@okonski-org.20251104.gappssmtp.com header.b="jJJ4uC6O"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a0794669a6so2542184a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=okonski-org.20251104.gappssmtp.com; s=20251104; t=1792156720; x=1792761520; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fWhFq5kg3woqxSUvm+Zp+h0Q0CYXygiXnJMyVN/bSws=;
        b=jJJ4uC6O2JMRJv7OeWKJwsY3POZY8fsv6V49MFD5oelnrD8R6cccslXjFUFDzMyll+
         kJr9M8Tpw3TFo2g0WTm1sY3d05x3fwmEm0O6A349xPBCyvxHsiR0AMFJ8Kf0l7nO8M3r
         9HGD42hVmCL3z0YxrUZfHt+7mx0rNCFYHLDX/zgE3E0zsHLkiuj0WTM1+zshaRC9dPtk
         jVBin+mv40C0ytRte8E4f1EyY9a+YYVapQyTnpVmesfxBQ8Q60JTgwjqVwK3FHASNeVp
         K0tY/3Wz2dSrKvg+E34XULxCWYQRwkLCGNawpDtjoPyJlcWOwC4WU8rpOtdF67naTNu2
         RcyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792156720; x=1792761520;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fWhFq5kg3woqxSUvm+Zp+h0Q0CYXygiXnJMyVN/bSws=;
        b=O54MedNTabk3R7eLc+2UdqlyAI6UHean98dpr2vdNtMeNqqeCcvvJABDQLFDp0sA57
         qKUnIt27qE21jXT4T5095wjNjBwT4L6FEX5EPxh4qK+QBQSAviQF4rTsmB4ZGWL+6ftE
         BH/o3kCVXLkM37w8xuOKkEJ5ASOPyg4nUWjoEmOvoF0zBoW3YpoHnqBpWgrII+v0HeWt
         tDbCiWIMct782juCXViN91JfzXA+iYuplemMjv168pDPwLCgarVD8mEPkZ9cCSwBJnXr
         fOMk0F8H4puUOUcyKmrHpxJyQ75ly5Ro964wwQ4IX1MST7SMwhl1aLB7iKpIs3ZYcYy6
         OdHA==
X-Forwarded-Encrypted: i=1; AKwUvBxjlVGxcfyoALqxfBc8/3as0iE/gaRQfNxG9c+yRuNA96Pyvt7oO9iGeF96ow88uTzF3HBONWSEVddlC38=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOJTZRDb9ifgAlac4sHnPec61QYLMk++fyTkjAd3jtB1x2qF9F
	nxtcTovuUXpWwbZtKUyMLSdPNEt69NVoTV9w8JITtYtGGxPHc0U0HuRTwg3h0fdfKh8=
X-Gm-Gg: AYBFou3Emx5zBBdD/iwOLJKJnhjAlwHAt1A83Z7yDzRDPMa5NwoGuOy03Hnh1YfycAO
	AZr+feuCWGoXvcw1yvqCQCRxzZCfqHw0xXfkD7YxMSAapYETZFiurm3zGNgO+fjF+DeXxnKO8U7
	G2ewB7PP9l4wfvUP3HD/D9S/Yz8PRKw6bOVlSCewolsp/gRdNvg/gxH244oGpRpeY4eV8y5J2cl
	2MFuXS/nCd04hLvqvXPcFP3+9DKK2CfeetKCGjiAZHNxsUVkIDdqoen6d5OBrOkgYiajuCFEB1L
	vcqDM2xQt9rMqPjFOgG/U0wiSfqwcsPpJu9eFUuAJz5KujtU8QQw+AS7AixqANN09cn/yVLAaNY
	tV2GQ3YNc4hI2DWD2MkEXMY+IgsghS9J5XUZ4urbHLreIo6r5vRpQ2fLsOnjCTIJdLY9fgMvmIr
	VXODCzXrDW9bysUgr4Lbnh6Nfk+eXRLPe6LkLA2wsQbTE3jZIhwanXWOOEiXWmiMSvZTs57VRoB
	Oz7qHGk89h4lfisJlS29o1aI8hW2Eac/AUeFkmI+YaLUqYc5YJijdu/cIWFpinSwIeWVKFMvYJ4
	Q0sEDz17fkrcyNNSMfFpjDeSniN9Z2cEe2s9/7bla1IYvhdoVCoQYg==
X-Received: by 2002:a17:907:72cc:b0:c2e:3ed7:7d94 with SMTP id a640c23a62f3a-c31aa0d364emr2098881066b.37.1792156720081;
        Fri, 16 Oct 2026 06:18:40 -0700 (PDT)
Received: from ?IPV6:2a02:21a0:10:748:1::2? ([2a02:21a0:10:748:1::2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40918c6e6asm68799166b.53.2026.10.16.06.18.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 06:18:38 -0700 (PDT)
Message-ID: <58dc8e8a-7260-43ce-aebb-8d9c29a6afc9@okonski.org>
Date: Fri, 16 Oct 2026 15:18:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Jakub_Oko=C5=84ski?= <jakub@okonski.org>
Subject: Re: [PATCH v3 7/7] sched/eevdf: Move to a single runqueue
To: Peter Zijlstra <peterz@infradead.org>, mingo@kernel.org
Cc: longman@redhat.com, chenridong@huaweicloud.com, juri.lelli@redhat.com,
 vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org,
 bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, tj@kernel.org,
 hannes@cmpxchg.org, mkoutny@suse.com, cgroups@vger.kernel.org,
 linux-kernel@vger.kernel.org, jstultz@google.com, kprateek.nayak@amd.com,
 qyousef@layalina.io
References: <20260605105513.354837583@infradead.org>
 <20260605124052.227463677@infradead.org>
Content-Language: en-US
In-Reply-To: <20260605124052.227463677@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Peter,

On 6/5/26 14:40, Peter Zijlstra wrote:

> Change fair/cgroup to a single runqueue.
>
> [...]
>
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -9916,7 +9837,6 @@ static void wakeup_preempt_fair(struct r
>  	if (!sched_feat(WAKEUP_PREEMPTION))
>  		return;
>  
> -	find_matching_se(&se, &pse);
>  	WARN_ON_ONCE(!pse);
>  
>  	cse_is_idle = se_is_idle(se);

I think this changes how cpu.idle affects wakeup preemption.

With the single runqueue, find_matching_se() is gone and se_is_idle()
reduces to task_has_idle_policy(). Wouldn't this mean that SCHED_NORMAL
tasks in a cpu.idle cgroup are no longer treated as idle for
wakeup_preempt_fair()?

I tested my existing 7.2.9 desktop against 7.3-rc6 with the setup below.
cyclictest doesn't reproduce it because it just sleeps and wakes, no CPU
burn and therefore its accrued EEVDF lag keeps the latency low?

cc -O2 -o wakelat wakelat.c
systemd-run --user --collect --unit=spin -p AllowedCPUs=7 -p CPUWeight=idle sh -c 'while :; do :; done'
systemd-run --user --collect --wait --pipe --same-dir -p AllowedCPUs=7 ./wakelat 1000 15 200 |
  mlr --inidx --ifs space --opprint --barred --right label lat \
    then stats1 -a count,p50,p90,p99,max -f lat then rename -r '^lat_,' \
    then put -q 'emit mapsum({"kernel": system("uname -r")}, $*)'
systemctl --user stop spin

wakelat wakes on a fixed 1 ms schedule, records how late each wakeup
was, then busy-loops for 200 micros (wall clock).

+-----------+-------+-----+-----+------+------+
|    kernel | count | p50 | p90 |  p99 |  max |
+-----------+-------+-----+-----+------+------+
|     7.2.9 | 14998 |  11 |  11 |   12 | 1869 |
| 7.3.0-rc6 | 13853 |  11 |  12 | 2029 | 2116 |
+-----------+-------+-----+-----+------+------+

count is out of 15000 periods. rc6 had 1147 wakeups delayed by over 1 ms.


wakelat.c:

#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <sys/prctl.h>
#include <time.h>

static long long now_ns(void)
{
	struct timespec t;
	clock_gettime(CLOCK_MONOTONIC, &t);
	return t.tv_sec * 1000000000LL + t.tv_nsec;
}

int main(int argc, char **argv)
{
	if (argc != 4)
		return 2;
	long long interval = atoll(argv[1]) * 1000, dur = atoll(argv[2]) * 1000000000LL;
	long long work = atoll(argv[3]) * 1000;
	long max = dur / interval + 1, n = 0;
	long *lat = malloc(max * sizeof(*lat));

	prctl(PR_SET_TIMERSLACK, 1UL);
	long long start = now_ns(), next = start + interval;
	while (next - start < dur && n < max) {
		struct timespec ts = { next / 1000000000LL, next % 1000000000LL };
		clock_nanosleep(CLOCK_MONOTONIC, TIMER_ABSTIME, &ts, NULL);
		long long now = now_ns();
		lat[n++] = (now - next) / 1000;
		while (now_ns() - now < work)
			;
		do next += interval; while (next <= now);
	}
	for (long i = 0; i < n; i++)
		printf("%ld\n", lat[i]);
	return 0;
}

Regards,
Jakub
