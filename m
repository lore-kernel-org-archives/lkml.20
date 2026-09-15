Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF29F4AA41E
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 11:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789473426; cv=pass; b=KGX7ugaz6yAo0NuC2n/lzoOfsKx66lkwWxOFNAsv1Uv2pp4gBl+bxFHrzJfHnc3oB8HeAV4upZkGwOFdLKyn/ixdzJ0iRRqN5TpourWMguzK6GD6ce+8Zg/5vd83Wjf4IhaKLJrAbQvHtumLv+UqC2Om2zoavtdBWNQDneb8iQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789473426; c=relaxed/simple;
	bh=O702NO6+x8t4oueCHGrqNzciQ51830wwCSmGBWV3oeo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I9pI7DfoB1N0ftJ5vh6olBUgjuLtn+X/PCIxJXHQwtcjVIoatlrSxk4MPBx6zO38M/ShdFyP9KaYoLovDXsiaECORa0UOxIOajSeByx1pG1O/qQp/a+4+vhJDx+P1NnINOXutFpFBsQA6K9NV+0aee1AlR2k69wbAT+PtebE+yI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eAMSG56b; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eAMSG56b"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f5603a0so30130766b.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:57:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789473423; cv=none;
        d=google.com; s=arc-20260327;
        b=lW5OqIqngarlbamphsmuooF1yBnjQqMWQ5zAZuFm8tp/Luv14O6aMr5euSK2PQD/hj
         SlUZ4Fr17g6cwpg0aRCNHIoRuzxVvBRE9Y/l1FJEtNHvjURZX/g4LsV+U+5Lb3ULNsc/
         95hNde6YgIOk6z5dcinzKPTHMW2Xl6aglMG/RnM95L9prxixC8OAnQIKatpAw0WSsi3Z
         Bf/J8qEYIj79eXgZYc22aZFb+HBbPDnHzpGKZayUfSXIKJ0ZOS9+XIhpEMzxisZDP86n
         vov2lLb2ihlFBXNgJGeSb14rsdZEFoPWg5nUP21bLnawvZnHjfUDGxFo0pUHHq0OSpBn
         UqmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=10GLZhO6+JTh9diePN9diWSDt+s9t8sxCRMcAPDM9Rs=;
        fh=znTTELGuf4t1EV2WYXMl5/vljfDCxqnBZ/0nzA8vhJI=;
        b=JxIuKeciaC7sD3rQDFI10KOqOcypSqC8cUBhUSuTbSdG0wKLBPcUET1srjDSeuTY0d
         pWvTdnsiyk21Fxprv8Sh9evjddCPu1zhvUOuvjcS2/6bNBfc6HIWNYP9citG75/KB0w+
         HbUDAz0Ya4CpFGLgmbnNUifx2v6a77IGMAfapc8xofO+EFqK05HVOZLwqsnIdhKf0gZB
         PchAEyBzFSeFheTDa7kPPyWtghPKKFe2Db3Mn+twGFeUv25ypuPrbCZzO6Ggie13L9w5
         5d7dqcOSGlLGZZgQt0Ec6Uf16V6Ed68/R6FxEhnbGhPuIrt6diBsjbmPDsFL1lKBYquU
         yckQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789473423; x=1790078223; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=10GLZhO6+JTh9diePN9diWSDt+s9t8sxCRMcAPDM9Rs=;
        b=eAMSG56bxm4E5yISQuvhMruYdFElIJky6+b6+ONUvP8A58TnZPjzwlWSC10hhf99CN
         Zx/KLHvMSqSFSA739eOWWSzMfFTpZ0edKPgBhZ6FzqAcLkXgl7dZaF2FEyAuIkkYEZj+
         vvUkBnXUaL+AL9YVZgVCkbpo4iVc1MFoISL1bR5Xe6sY2kvQZZ2E8+KvKJZjD3AbRXXP
         +4hHnT10fZRh03DnD+GLyBT3RJPygDjleZqVgMTdKS9FoQC8vBGuFH7k6Tukb4jeXrjp
         jIk+Jo9gr3cQz3sgHgxGzZo7keS2bpuJ8gpN7YT1TWldznHkA3ybnkCJgfSxvhMewx/g
         dPAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789473423; x=1790078223;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=10GLZhO6+JTh9diePN9diWSDt+s9t8sxCRMcAPDM9Rs=;
        b=o+WBJ4R/TS01bHMmp2ptpIORL3ce01F6YDNEHdllUrZTELZb/Yo/T+OKIcxoEsN2On
         Z8kH6w2KCfI1w3soB5Upp2l72Eh3EQeQPGtzv1ubz8MOMD9ZWv09RvHcwgCqgfEmkItw
         rLBLV7WA75J5FgVrsFI21wJ6gZnJICYWyPvHqGgE0MFP0DJfqFlOROqC6q6AtR4t255O
         Ol4RqIxM3AZTspjmEmAozgh7ZJsahDbdleKSEb8OIZQMTimdA1C+VMtWkyNLURJAczvs
         dVeMFF1f/gYJB0mwC2mt+6sbA8njYiZWucCB2c2ysgVF7KiZZWeQYWD6XBQrufl0P//A
         avrQ==
X-Forwarded-Encrypted: i=1; AKwUvByaoPuG6MOVrnjI0YNTmK3+g9hBXgDK4p4dQZLNEQW97r9tHunZS+V13qc4n71TXr+Mze3vcsCziVI1EEg=@vger.kernel.org
X-Gm-Message-State: AFuF++n5Wfqudtdz8er5cjIN0YN6LvgRzpP5LrareFSPHnHLjWV7uWEZ
	Srf4XnCh0PQMUbBS2J6cMMqRiVJe+Pur4ri978wZy9pooEVXY25CWWoyV1iowhjr3zy88KPySfY
	0dP0hb6r+QAxmltMMd0hYHq+JDE7pHQ5J6qWyytXzlsqA/tevUeTV
X-Gm-Gg: AYBFou3wRdKUEtBxYjGCmS5l6o3udbwoPjmX7up/NpZcduvzHgACDGxiGakxpC5bTTO
	lJq07SqmvScoYvpFjNqESrfTzPD/xjMQj2Sqdt2Dra2kp+ucOpb+LM6UorxYmblLsk5eQqljJN9
	b2CncvR+hqZuoOHQnxIHAi1ugu5/tiKA7NUQALshQ0tt6WFWut37I0v0x3XqJmPGnq+5N9jmoMY
	KlwSbo+TJog6xDGIqPJh3hQSlG5qV7KAQ/0n02XkVe/c5+BNeO1P0lesFAwMr0DMLtTqk2DAtfr
	OPn8zz3acy/JRpLHBK2dPFgXmmJoDvcZ5/8JVAR0Pb2toO/PRu7/wlcN+9COG24cNFoQe0dRCTB
	vWE26aPcddXE=
X-Received: by 2002:a17:906:7944:b0:c26:19de:912c with SMTP id
 a640c23a62f3a-c29d78c8a1dmr57686166b.31.1789473423171; Tue, 15 Sep 2026
 04:57:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKfTPtCQUndM7NfMYpz8S6vXhwbwrOYALr9dNb+971XgZ9GqnA@mail.gmail.com>
 <20260912040804.3391229-1-jackzxcui1989@163.com>
In-Reply-To: <20260912040804.3391229-1-jackzxcui1989@163.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 15 Sep 2026 13:56:51 +0200
X-Gm-Features: AcwNN1WZirNaiw9RjcHSd_CK3jYDW40ichnI17FAHKAOtDXt0j5GBRE3oVDmc-E
Message-ID: <CAKfTPtCa-Aycx7Lt9Nj7JDs8bdq0oZCt-k_cZR3WiG7YJhBTng@mail.gmail.com>
Subject: Re: [RFC PATCH RESEND 05/10] sched/fair: Introduce
 select_task_rq_fair_thin() to select rq when LB_PROMOTE
To: Xin Zhao <jackzxcui1989@163.com>
Cc: bsegall@google.com, dietmar.eggemann@arm.com, juri.lelli@redhat.com, 
	kprateek.nayak@amd.com, linux-kernel@vger.kernel.org, mgorman@suse.de, 
	mingo@redhat.com, peterz@infradead.org, rostedt@goodmis.org, 
	vschneid@redhat.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 12 Sept 2026 at 06:08, Xin Zhao <jackzxcui1989@163.com> wrote:
>
> On Fri, 11 Sep 2026 14:27:04 +0200 Vincent Guittot <vincent.guittot@linaro.org> wrote:
>
> > > I did overlook the detail regarding the SD_BALANCE_WAKE flag; our project did
> > > not change the default state of the SD_BALANCE_WAKE flag, which is set to 0
> > > Moreover, as far as I know, most embedded Linux projects have real-time
> > > requirements and generally do not modify this SD_BALANCE_WAKE flag
> >
> > But if you have real-time requirements, why don't you use the
> > real-time scheduler ?
>
> Due to fair scheduling, especially in a 250Hz system, we often experience significant
> scheduling delays. Therefore, we have already converted many critical tasks to real-time
> in our projecct. Currently, there are already a considerable number of real-time tasks
> running on our system. The following is the data on our system:

Ok, But mentioning Real-time for fair scheduling is misleading because
fair is not  a real-time scheduler. We often speak about interactive
systems in this case because we can't put any real time limit on fair
only some best effort.

>
> CPU ID | Total Tasks | Real-time Tasks
> ------------------------------------------
> 0 | 369          | 197
> 1 | 293          | 132
> 2 | 166          | 53
> 3 | 103          | 27
> 4 | 89          | 26
> 5 | 63          | 29
> 6 | 173          | 61
> 7 | 215          | 39
> 8 | 181          | 53
> 9 | 77          | 21
> 10 | 90          | 47
> 11 | 119          | 63
> 12 | 55          | 23
> 13 | 50          | 27
> 14 | 85          | 33
> 15 | 143          | 50
> 16 | 156          | 40
> 17 | 159          | 44
>
>
> The RT tasks/total tasks percent is already very high. It is no longer feasible to expand
> the scope of real-time tasks, including tasks like kworker, ksoftirqd, and kswap, which
> are not suitable for real-time scheduling, right? In particular, within kworker and
> ksoftirqd, there are still many scenarios where insufficient scheduling timeliness leads
> to increased processing delays in the entire pipeline.

Regarding timeliness, you shoudl have a look at eevdf slice as a way
to order (up to a point) your task scheduling

>
> The LB_PROM feature and its associated series of patches are specifically designed to
> address this issue. One of the most significant core changes is patch 10; you may want to
> take a look at it first. The remaining patches (patch 5, this patch, patch7, patch 8, and
> patch 9) all contribute to improving fair scheduling delays.
>
>
> > > Given this situation, is it necessary to create a new branch for such a "_thin"
> > > select_task_rq_fair() variant when enabling LB_PROMOTE?
> >
> > At now, I don't see a need for a new branch nor a LB_PROMOTE. You
> > failed to describe your problem and came up with thos
> > platform-specific solution instead of fixing current code. Putting it
> > behind LB_PROMOTE, doesn't make it better.
>
> I took a closer look at the implementation of sched_balance_find_dst_cpu and believe that
> this function already meets the requirements. I'm wondering if it would be possible to add
> the SD_BALANCE_WAKE flag to the scheduling domains (sd) of each CPU when the LB_PROMOTE
> feature is enabled, and then revert it back to 0 after the LB_PROMOTE feature is disabled.
> Would that be feasible?

I don't like how you use sched_feature to enable the "LB_PROMOTE".
sched_feature are there to ease testing the impact of a feature of the
some results not to enable/disable it dynamiccally.

>

>
> --
> Xin Zhao
>
