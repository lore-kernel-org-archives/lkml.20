Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA1E3E2746
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789140803; cv=none; b=jKpTr1UN6gdT/xa27W7pgxts0TEynYerzK6xm/5HXs+cFebsKqL+TulIDiVWYfMooLy5+d5iOm0b8+42tv3+e+yTnxQnxuCzyxIdOZ6chQCP6fWjSTu7kqBFp7nmy+OhQQYvvXLLnyAFsLoxaYW/Htgeyxaw2ay5usXcniJgpBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789140803; c=relaxed/simple;
	bh=Jxjx7/IZ/oZcJi7k9UeBKSIKhEVAXb20kNUg00lhbfk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I1+7j9xRM5i+qyMMTbxflWp2gi778bWX5rNrTbzfjsgB4islD1lr4SBJv+bM1CgV2VF6gJ1YhSwVeE93GL3uBIWb4GP/a9/AArUaGmUoIcExB5Y9FgLiknSceffsQhsTFdKLdMQeB0in0PSXPEqAP+U91ajoJ7PBvwBKtO0du8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ctopJ+5d; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ctopJ+5d"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb769ca02so15351661cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789140800; x=1789745600; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HUm6FsdO55jOVY3JrBx1R4mKoNfkbT3ZZvod1aeZi4M=;
        b=ctopJ+5d9pRisEbYgo7H537PqWg67RWXKzXEcxNTroMgCBIf9XnQohp66WfMCZhy/e
         2eb+kTb5jV4plF2AG4FUxqKmq2UPWZ2HNyNiFnzTN1wwuHwHVCZ+t+FZILxPQjUiLNzm
         gJCj323qqArKFDHiDrgUXdD7FbrfSpH/DCn6Ft9rAojRgisSZAlBG7DRcZjgeNIx8S0/
         Xjda0NBFKfVyP5KW/aLO8Db0dleZ8Ej9onvaRyR8FRUngsgUPtGrbOKGVzNYch6hbXnN
         51dmhvUm35WGAuxZOAx2hX+eUgvCxTyLdGz3x2Jx3jSYNL1O4mm/RD9dwLXln3rAYuBv
         aUdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789140800; x=1789745600;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HUm6FsdO55jOVY3JrBx1R4mKoNfkbT3ZZvod1aeZi4M=;
        b=MZwVatLe7xNekq0jzcWMJusO9Luvd/PnyFvxQtMolxdqWR+du4P+9gpY/AJ2+eDhrB
         nGJeZptVknv/cjsaozKxfLdEtDKi5QPNSHoQ3QMpi5VtMnCamv5YpbQdr6MhHoZv/7eo
         ugbtdyLPC1F+OBZdsJGfzzwIyaExO703aDA7RdcLXLDbQ5YbwLCapUtX0eGvkX8HQQF/
         ZYiQ4adHJCrp3tYFt49dM7mSb9Jb/Ez50hrOIXcHglUSX5+bwGNJ2cuYuQXyIHa7b3RY
         RJWJSEuAxFaCfcwWuh3ZRhiikGjukrgHnXMfQcwWaliJL6qpOJgGNvIa3hXw7/3YyRle
         t7Sw==
X-Forwarded-Encrypted: i=1; AKwUvBytRAaTpxce8Qh1o8c3LrJ5yyqNmork2m7/G9Vd+s1NAnWFF/m/JBiZLJ4BqPn6qzGpnq6MyzCp9YtFNo0=@vger.kernel.org
X-Gm-Message-State: AFuF++mz69tJS4ySNpozdAb5RVLUrAQ+y2Spz0kAaqq3Xo9ml+txO/EI
	p8ktYxiww/B33Nd+RwdkLSj5Prqm2acpVv0LGrZPLbo51uYGfIxQinU6
X-Gm-Gg: AYBFou3Gcm25gsvCQi/QvfwMoDQFf/Vu9JcORq5d89/8NVqfHNoaLvL0az8+7iW/9Kw
	2rl1N3WuvWgHayYCJtGsHUrf598P8kyj49F7nRScAEQu0NNoUslr+0XR4clBS9MuUXEsf16b/a3
	72+dA+FOXjta/0goaVY3Wc3pBpBGeHVB1QLQq8koXlil9JOJLYewxtbXLpVeNeMDuER+90USKHq
	IurQD9NYBGjFw8bLGCNYz8QnjWNvyP/ectsMaqdudJpQBwDkAz1C4thV4BEJXjMW5RbvMIzPAFh
	S8SxMHP+ok/0LYdoZz3DPOp8dvGB2SqwWMpnCdCAfQ6lN8X83NOOzYUd2qC+OCppx1E98QlrHeK
	BJJGPk8D/NQ9b49fxNrSmH2hEL7ZMleMV+amgJMOIZZA+8WSoA5vCF7cIiUsyyXGrGEd+AJ4ggs
	geKEKY5eobu9s7m1b/kPi3cAV9gxY2XSHs1wpMxS229WWL9Zk3xkzOpt9cIErp5C3B4S3VuiNj7
	qlarEVqbpXiLwFWhNHJqADwHgr0AglIHNiYwtd1eszbh+Ab9eQ5fZhU+P0o
X-Received: by 2002:a05:622a:4019:b0:530:198c:12dc with SMTP id d75a77b69052e-530c850fdd0mr92777781cf.12.1789140798640;
        Fri, 11 Sep 2026 08:33:18 -0700 (PDT)
Received: from ?IPV6:2406:7400:56:e503:ad72:fda5:83e8:be95? ([2406:7400:56:e503:ad72:fda5:83e8:be95])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca4b9a97sm23226571cf.18.2026.09.11.08.33.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 08:33:18 -0700 (PDT)
Message-ID: <56587aea-443e-4aec-81f6-e5fde844afc4@gmail.com>
Date: Fri, 11 Sep 2026 21:03:09 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] pmdomain: core: Allow a non-CPU device in a CPU PM
 domain to do power on
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org,
 Abel Vesa <abel.vesa@oss.qualcomm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Christian Loehle <christian.loehle@arm.com>,
 Maulik Shah <maulik.shah@oss.qualcomm.com>,
 Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
 Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260907111659.263324-1-ulf.hansson@oss.qualcomm.com>
 <20260907111659.263324-3-ulf.hansson@oss.qualcomm.com>
 <02b29827-3ca3-414b-9377-972f3d46eb03@gmail.com>
 <CAPx+jO8Cf_NGJ6h30+cd-arAJGQL=V1HayRZqaTrM-xg9eUhpg@mail.gmail.com>
 <CAPx+jO-ZP_09poe0rHm+h4QQZBbHJisCdQGa6kA67sQAkU-BfA@mail.gmail.com>
Content-Language: en-US
From: Dhruva G <goledhruva@gmail.com>
In-Reply-To: <CAPx+jO-ZP_09poe0rHm+h4QQZBbHJisCdQGa6kA67sQAkU-BfA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11-09-2026 15:46, Ulf Hansson wrote:
> On Fri, Sep 11, 2026 at 11:06 AM Ulf Hansson
> <ulf.hansson@oss.qualcomm.com> wrote:
>>
>> On Thu, Sep 10, 2026 at 8:31 PM Dhruva G <goledhruva@gmail.com> wrote:
>>>
>>> On 07-09-2026 16:46, Ulf Hansson wrote:
>>>> A driver for a non-CPU device that is attached to a CPU PM domain (the
>>>> genpd has the GENPD_FLAG_CPU_DOMAIN configuration set), is currently not
>>>> able to power on the PM domain. More precisely, to power on a CPU PM domain
>>>> one of its corresponding CPUs needs to be woken up if they are idle.
>>>>
>>>> The current support for a non-CPU device is that its driver can only
>>>> prevent an already powered on CPU PM domain from being powered off. This
>>>> leads to problems for a driver while probing its device or when it needs to
>>>> call pm_runtime_get_sync() to turn on the power for it. From the driver
>>>> point of view it looks like it all works fine, but when accessing the
>>>> device it may end up with various errors as the device may not be fully
>>>> powered on.
>>>>
>>>> To fix the behavior for these types of devices, let's adjust the behaviour
>>>> in genpd_power_on() to wake up an idle CPU that belongs to it, in cases
>>>> when it's needed.
>>>>
>>>> Link: https://lore.kernel.org/all/CAPx+jO-sCierYj8jnoKQHckJG16dOBxnNrsZVYO=38R2cLV8nw@mail.gmail.com/
>>>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>>> Tested-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
>>>> Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
>>>> ---
>>>>
>>>> Changes in v3:
>>>>       - Moved to atomic polling, pointed out by Dhruva.
>>>
>>> Thanks, but even in v3 we still have potential issues.
>>> It does not fully address the consequences of polling for five seconds in that context,
>>> nor the parent-lock nesting issue.
>>
>> Well, I assume we will not be polling for 5s, as it would be an error
>> and it means that we fail to wake up the CPU. But, I get your point,
>> 5s is really an unnecessary long timeout.
>>
>> Ideally the timeout should map towards the deepest domain idle state's
>> entry+exit-latency-us, but rather than looking at what is actually
>> available for the PM domain(s) in question, I think it's easier (and
>> good enough) if we just pick a common value. Usually these values are
>> in the range of a couple milliseconds and in some cases up to
>> ~15-20ms. I suggest we decrease the timeout to 300ms and see how that
>> plays out.
>>
>> Also note that, at this point I don't know of any use cases similar to
>> what you describe, where the device in question is in an irqsafe child
>> domain. Hence the polling would not be done in an atomic context at
>> all, so we should be safe. Anyway, if this doesn't work we would
>> simply have to limit the support to non irqsafe child domains.
>>
>> In regards to the parent-lock nesting issue. I don't think it's a
>> problem as genpd_wakeup_cpu() is not being called recursively, but let
>> me double check this to be sure.
> 
> Confirmed, I could not trigger any lockdep problems with my tests.

thanks!

> 
> If you are fine with the above suggestion for the timeout, I am
> thinking of amending the patch when applying to avoid posting a new
> version of the series. Please let me know.

Yeah I am fine with this, will monitor in future if I suspect anything arising.

Reviewed-by: Dhruva Gole <goledhruva@gmail.com>


> 
> [...]
> 
> Kind regards
> Uffe

