Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA1A3C3F6B
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789027534; cv=pass; b=rZAPrFkf4aHfOl9lOSsR6hw2p/+qSGOKg2x8XqZcw5Px+uKwc/u30FoGmWEcSD7KfTukR+m1I9VuWCje1mBZUpzpHjKCfzOXFjHaehjhsEv00DVrfKblfzSaZrof7TVTQs+OH08ml1gR8+qSInweUGi6c8ge2rbT1D8NOZYc5UE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789027534; c=relaxed/simple;
	bh=L0knm0WwBNsA4D7m6jWr47bQPvrrL5uG4WzP1rJec+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cT2VpgXJ1PyYqWZ8ub0/klo3SKcdicmkxNBaisdONP6paaCJIy/Aawmq8ulWpdTd/WY3RoH3p/vc8IhiOtxyQL6IKFdsRLqwHsJ17Al40zLgD16x/S00Rb4l5rYZpBlrUJmtyrSgB9adGoBb8PyzAbAPm/aJXrfr2yvesDobSYc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cU47aJDk; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cU47aJDk"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c2055573c8cso944734166b.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:05:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789027531; cv=none;
        d=google.com; s=arc-20260327;
        b=Z6YHNxQ2xkQqLNORKL2BQlVsk+WKR/1tVE2Ac88iODwzKwy4+RtrFJAbUaBJVd3WPS
         FRgWzZm2Cfb+vUlCTuAkCGUxFz4pkVMaxEiNI9H8fgCBhEWAimi9jSC7MgZh18aSXdFx
         JXPW4kwaNmCBin1VnZYByBXc+w4nMoXsnA6f/2gfwTnY4SGnV2KwAszrp7YAMSO+RQlF
         aQ392RRLFaqlX6iofC9gjspZ07Kzbh9DBMdU9UKtQqUs2wLnmfyQf4He0brYle2P3Aon
         iJhoBvKZ84A8EK0lsDTD8KvYz60pAXnL2u97/3M+hXm4iuABOe+nVF7it9gjwrCP4sI6
         LULg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=idTG+kIgG4BE6fViCSY/GmRMddNGdFY103Ar/WRtmPE=;
        fh=ZJSPCNji2wxcABxnOkuoyiud2dq9ml6XWMNZ1Rab0qU=;
        b=X0jb9w68RceC/54QC+6tjFjgZANkXB6rNlgAnzgugv7NmxCBs+ZpisCiYAAljf5NHN
         Lb61G6/zEvnLsxzCN6I7jirzI7KM9DxOmAliRjf2UUBc/Kh26Ockp6MIOTfB4JUlpl1B
         aeNR3L1ak8KXpPnlPJUbczIei+QZ6EpT5E9IzZcQqBt0xyZ7cuUWNhlEfvoJHV0idJci
         l+OT9phitzKyGs1vw2bVIMe0qEo4MT7QADeED0gu0eCmIhs8A/bU4jM/2kFeh+r1L9JI
         cVptLotxC8at47vKYdMlvMuUD35qknatkseX25Td7iLLt+t5deo+2oABy8BJod8ejTkj
         IYCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789027531; x=1789632331; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=idTG+kIgG4BE6fViCSY/GmRMddNGdFY103Ar/WRtmPE=;
        b=cU47aJDkfFJmaeKaNxEc2FTZmBscN1a5MIuLC5VRsAuUl44/MIxGXLiApy+WAC8Jye
         pXvzGPcwOlPVWuMAn4xYPAk+lZlcbHjLdoKqiRbrARkAzfuIPkoYzIlLenapU7rH4VKL
         TUvbASJoXF0cK7DaU0v3AP//Zh3IQ7EhMaZPhSDnjLdMf0ssABTvdsY6tjEWEsIUg2vn
         lAGmH0pY8nzW7vwBR/dEA7pK0bAZFLWjm18Eh+NHAEpnfMSh8G6eiYKvVP3mueI2tGud
         WoWfc01Iy3/49J8UKD8+Zop0vMEVll2aEFxf84JuYvxulbtjIA03Ptbf5lBTqTpOtLHK
         MBbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789027531; x=1789632331;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=idTG+kIgG4BE6fViCSY/GmRMddNGdFY103Ar/WRtmPE=;
        b=o9qZv41LEt6q3S4JT9rlGb8WfQi5LYYoeHjYx8LJdwDr2oEpCoSa1xEsPn+IDHpaP0
         B4NN9YugCIrxXsR7Wl4BZwzkNwCC6oVFxdguIKzA/HOeeVLQ/85mUulWIGZBlGo/hypo
         qUr3Mo9WTSe3ZE+c8iCMY3jXw3b6mh8I8u3/xeqsj00Ji1VEM7yCQ6XBjqCGpcsy6xSS
         0ZEarIYL3uN1+YYkhaz/n15U6F0qWStwHklhhqRER2AC5qZLPbGI5oxOjiRN5V/R6tCC
         9ZEovzj/8lsphvcmHK0Se+zXnl2GNuASAMKHDc7O/QqzbvLuh/JbIY55JbvxYW8sJ/lT
         j17A==
X-Forwarded-Encrypted: i=1; AKwUvBxCSJLXZPPwkTewiQIkETJDiIj5vve3YWHizRkwfiXT4kTN9uDeXBYUCkhh+A5/cmjGi6G0uHLVBejZRpc=@vger.kernel.org
X-Gm-Message-State: AFuF++nm508oSns4iBifEqQaZVTlbm/ARwuXyjllKMYyZtZsBZLPblV5
	fxuv64DAyEMVrAUEvOyz/B0UxOcffiAu3IYI7WilCsbO+DOzJjPgiCpGSACl5vObzZKDJlTWj27
	F729yUvWZIx5LS0yCz7hgY/7JvB5grAo6vJoXZMMqsw==
X-Gm-Gg: AYBFou2hz+rlSaEcoCvupLL1T8K2TqnTfgDVSZvsODWwKtbkI+W8Zc+qJhguA/rGA72
	/qU+eGB+haA9M2oVkjzNZaOY62HYZbFsF7KQ3P3pcQRgBCXtDtbDpWZYz/cqxyjbzTieshBSpj0
	PW3L18qGp03miPHWCrFMNguCj32CorBw/iMyeNtn+HyPSggmCxgBoxjsXd1gKDg43ICB2g7QA3M
	gjqumaXd5kJfuBd+IRB0fcR4PpCDQtVZ3aFC7yKzZjEdcMUroUAgFRfpBYShUddDT56pCzYZUvg
	bLsLlZD/oFv/59jK3xDZBP5gZxB5X/+sTrdZP5/pswATdxFPA+fGy68EcLlYTvs/yukMroK+4Cg
	ZmYReN5zumwkT
X-Received: by 2002:a17:907:b049:10b0:c28:ec7c:27ae with SMTP id
 a640c23a62f3a-c28ec7c34famr682895366b.25.1789027531169; Thu, 10 Sep 2026
 01:05:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821073927.455475-1-wujianyong@hygon.cn> <fea033f4-a680-445f-b231-2a0cc1dded8b@transsion.com>
 <F16AADE6-B6B7-4997-9CC1-A2E323498B7F@outlook.com> <CAKfTPtCxMA-7BX20LNhdOT+BQysdnOxOALrLvhTFNYJLbdsoCA@mail.gmail.com>
 <SI2PR04MB4931F65C44962845CE345B79E3B72@SI2PR04MB4931.apcprd04.prod.outlook.com>
 <44993024-f1bb-4b4f-802b-a22f95101171@transsion.com> <SI2PR04MB49315D05AB89CFA3B0E41BF3E3B62@SI2PR04MB4931.apcprd04.prod.outlook.com>
 <f38d55b1-68f8-4cfa-8b97-47fe58bd9ed7@transsion.com> <d709498b-9572-44bd-a93e-bbed23fd7372@amd.com>
 <4e39e935-2339-442b-8b14-a688b605c35e@amd.com> <a9dc111b-21cb-4bcb-ac91-f6be04bc2e06@transsion.com>
 <a2466e7d-2dd7-4de9-963f-6eb8c58d4a49@amd.com>
In-Reply-To: <a2466e7d-2dd7-4de9-963f-6eb8c58d4a49@amd.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 10 Sep 2026 10:05:19 +0200
X-Gm-Features: AcwNN1VH2gMqHpwpWnaAp6twlTnwHZeNCf0JHsNbujw4sKknNgTyNhM_v95_0BM
Message-ID: <CAKfTPtBji8dkr5ixhtZjkyrWLA68TF-KHLrNYWoewPWLyuUd4A@mail.gmail.com>
Subject: Re: [PATCH] sched/fair: Only apply cpufreq pressure where frequency
 is invariant
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Hongyan Xia <hongyan.xia@transsion.com>, jong wu <jianyong.wu@outlook.com>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "zhongyuan@hygon.cn" <zhongyuan@hygon.cn>, 
	"huangsj@hygon.cn" <huangsj@hygon.cn>, "Rafael J . Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Sept 2026 at 12:05, K Prateek Nayak <kprateek.nayak@amd.com> wrote:
>
> Hello Hongyan,
>
> On 9/9/2026 9:39 AM, Hongyan Xia wrote:
> >> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> >> index b898b6544069..97f4a3ba5107 100644
> >> --- a/drivers/cpufreq/cpufreq.c
> >> +++ b/drivers/cpufreq/cpufreq.c
> >> @@ -2586,8 +2586,11 @@ static void cpufreq_update_pressure(struct cpufreq_policy *policy)
> >>
> >>      cpu = cpumask_first(policy->related_cpus);
> >>      max_freq = arch_scale_freq_ref(cpu);
> >> -    if (!max_freq)
> >> -            max_freq = policy->cpuinfo.max_freq;
> >> +    if (!max_freq) {
> >> +            max_freq = __resolve_freq(policy, policy->cpuinfo.max_freq,
> >> +                                      policy->cpuinfo.min_freq, policy->cpuinfo.max_freq,
> >> +                                      CPUFREQ_RELATION_H);

As long as the reference frequency used in cpufreq_update_pressure
remains fixed whetever boost is enabled or not this is ok. We don't
want the pressure to change when boost is enabled or disabled only
when policy->max changes.

> >> +    }
> >>
> >>      capped_freq = policy->max;
> >>
> >
> > LGTM.
>
> Thanks a ton for taking a look at the suggestion.
>
> >
> > NIT: I do wonder if we need a full __resolve_freq() each time. We could
> > cache the highest achievable OPP on max_freq updates, but that's future
> > optimization.
>
> Sure! We can cache it in the policy object during
> cpufreq_policy_online().
>
> Jianyong Wu would like to take a stab at it? If not, I can send it out
> early next week.
>
> --
> Thanks and Regards,
> Prateek
>
> Disclaimer: Hygon emails are routed differently in our organization.
> Response might be slightly delayed until my NNTP rule finds the email.
> Sorry for any inconvenience.
