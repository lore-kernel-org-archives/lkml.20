Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792670743;
	b=mHIbcg1Cki0kXQ6VoiBnRXRcqijSwsDJROTK8YmNL3Hen90K9odRrwsTxM+n3wriqcYt
	 1rGWXYzM0yTe0nq/NnBb6fabCEktg1whUXC/Oj/l4MWnGr0yYniWSWnSN7DROxcW9kurd
	 HYZorYvmt3R5AbEVxlHqUJ/dbSeVWGcZD34QgY+7necmHW/GldWwUY8CyGalyjzQQyPOY
	 HfmLZQWsdjTvzKIiGX30nv8kW8/OMYloz9PeLiCulJt1fHkTyfAH9byHfwHAhc1p4FYjY
	 /AgkRhGrJ1JRbj6h/fz+l/JY47zwbpPOoJNsQ/u3OMz+/lJ/RVfjYSt3IAIgIyQCPBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792670743;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=1lD9amVrEN5VBKxfAQDsDxJlbpUbXAXUW9BovN0dNeo=;
	b=N4OlT0Nun8qdi36bzBPcl2ir0E4sMYtnlRMSOoCq0M39n8zhzV+mdk76JurqKtdym5SU
	 htiPeb9UYQU2ogkHC10yffJzEke7EVq8nmxHSi468E9V3IiiuM/I6SX9Uy+jg2545SWb4
	 /0Sl7EDdfVSHUwk/YHpuSk24c2I/RxY/GQmLKVH0MxHO1Wcy508T9H8hAFG81QUpcoyqY
	 8VW2r3JG/K6XMFa1QjLuX03zmB1uyY2K3FhFOsGV/Ac3hqPukxjATHZPPlSok1UtY91gn
	 Qtr4IrVAf3Kslpulq9CTt6Wks0IGe8LEZnpQyJdSGKx+kJFwMSz/jlxDlv8BflgXeEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=okonski.org;
	spf=none smtp.mailfrom=okonski.org;
	dkim=pass header.d=okonski-org.20251104.gappssmtp.com header.i=@okonski-org.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=TFe0b1FY;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588B9606A320
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:05:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 588B9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=okonski.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=okonski.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=okonski-org.20251104.gappssmtp.com header.i=@okonski-org.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=TFe0b1FY
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6afa651700eso2465048a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=okonski-org.20251104.gappssmtp.com; s=20251104; t=1792670741; x=1793275541; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1lD9amVrEN5VBKxfAQDsDxJlbpUbXAXUW9BovN0dNeo=;
        b=TFe0b1FY9C3TGA8Dl67TnvQoj1F18qXwJAPvi9MzJ/df3ytvAibyfiIdATWXBsI9fl
         MCwA6ZLW8v36el5BmhkkSPbo5GEunLpdo3db1TvPsHsSSb14YOQ5+h+zVSIcovu8rwOd
         wjg1YGSJXECAgDsJZ0o0omuQO7Xt0VXnt6LCdMTOGS5DyS0bnMY+IT4GNpvFbcJeQg51
         8EhC9Timl6zYN6M5dJgzc8EFw7TgjubHR2kG/sdVIJnokuwQMB6kRMdtm9DSj0UMugP1
         1HGeMnaRsZyerpM1+sb6S0r1BQyQHZpmIqnX5Nwoi3iSOol2z5TfFxQTHE828/Loquhp
         mRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792670741; x=1793275541;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1lD9amVrEN5VBKxfAQDsDxJlbpUbXAXUW9BovN0dNeo=;
        b=Uf951Yn5TeMw59wE4iH49eA8U9jsoXh2T8QUi1KN1xKTMzAc61dsX5H3g/4VvR5lZZ
         Ra7CGdS7Qgu0x2qhi0evQQF1Kt9gz2R7puih+dBr1KTrJiIZm6B2t3hXqA4jzhDEFH/9
         vzOGAuMXqQn9SiABiQ9GKk+ZBbAeFsvNgqP41x2yT07hdmCNj06wRccn/XC/6tVhsHS/
         sYIvI4Zdtt8h1FmPPVagRvut0y7eZUaJcneoXWkeTSvFC4xOI+nlxiDd77BvC9vX54Xo
         WTxHm/JwgPVZS8gMcnGdO2WYE4/etAJ+6bGEKZX7gP4O87Y56WW5fRQ2lwzuOLwQCuva
         fN0g==
X-Forwarded-Encrypted: i=1; AKwUvBxj8wXc/vuZibVsoblrv1yOo07TcFWM9gfuZ9/kELjl2dBIuz/SEPrUeUNiEkR2ZOjhzTu3/5fBnXnxyq8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNp+4lPd08QjcwgUEUmDm7ZWfaWeTUJEahHZFn3bSxBCF7qmhd
	ZnZcXKwe5ZQ6hoBbBaInSC1PiJblc02neojqbYVktT7Mqyx/IrcBwX5BjRRRQ/wx3D0=
X-Gm-Gg: AYBFou3csfa5qyMb6Bz+7dmKd25VA6oZmr7mbizkblwpS8lBjhD7bkL8RE2v8irs7la
	QDXdHWg/5JMz9wuSKjAVxm5SFskP+vmwHt69b4F5RMsuPdEde6awqS9hM7COwW10lsiFevhJsUl
	9EhCYgBx6cmjWXFpb0ZD3/pns9SNEgufNHiat6JPDwLynseoDmk2keVgUOckMUzfyx7yAJ4sD90
	I3LssXZanxml4pC+vnqvM6LRuBWqwLtH1uca0FL49f+VGPVVx2kyov3RXESX1w8iQNcyUKGjqMG
	X1jItzI+jvf5wANFTvdqlN8nQFcQoIY/Bak0W5zFjxbqq0ZFLpe6t1MbORyOsnhd/0BN1+dYbsY
	+A+9Di3n/w4CqHGnEYdibM3r+LXPByOu6O9MpKeBY8PeDmPUmyJ514HncPdK9mW/KJ1GVk8SlKG
	Pf0329zQ8wz1PbVZF7sU/dP/36UAIUe9Yqk++B0fquYebKIdzGoI98DwPfSn2pwPlIolS+LCAL9
	jrs4hXmf8PC7b/1fQ4xZHOhg4UktQFIKMmaNPUt9yNH2HenCJdSi9xfPG86G79iySDRUCQXzxS3
	/Hz6YGfqiv6zy/6FZyMbvZfGKc+yuklsEnuh08lqKmTcCCBFmPEgDeXdEoUGAbgUlQsuMbMlQm3
	9GiaBOmN+n4DM5O8E2OXt8eh9
X-Received: by 2002:a05:6402:4284:b0:6b4:29f7:f951 with SMTP id 4fb4d7f45d1cf-6b429f7fb5bmr881676a12.39.1792670740302;
        Thu, 22 Oct 2026 05:05:40 -0700 (PDT)
Received: from ?IPV6:2a02:21a0:10:748:1::2? ([2a02:21a0:10:748:1::2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b403110a23sm1638992a12.17.2026.10.22.05.05.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 05:05:39 -0700 (PDT)
Message-ID: <a82eb30e-685a-4ee3-af49-36b1102587de@okonski.org>
Date: Thu, 22 Oct 2026 14:05:38 +0200
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
Subject: Re: [PATCH v3 7/7] sched/eevdf: Move to a single runqueue
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Mike Galbraith <efault@gmx.de>, Peter Zijlstra <peterz@infradead.org>,
 mingo@kernel.org, longman@redhat.com, juri.lelli@redhat.com,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, tj@kernel.org, hannes@cmpxchg.org,
 mkoutny@suse.com, cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 jstultz@google.com, kprateek.nayak@amd.com, qyousef@layalina.io
References: <20260605105513.354837583@infradead.org>
 <20260605124052.227463677@infradead.org>
 <58dc8e8a-7260-43ce-aebb-8d9c29a6afc9@okonski.org>
 <b1002150c3e4f877d04790cd8e85d2149d17722f.camel@gmx.de>
 <atZM6uF0CqCNh__I@vingu-cube>
 <f1d0fc39-6939-4fb3-a422-273cd5c347c4@okonski.org>
 <CAKfTPtB_gMM7axqM167_Tb=WiChskGPXFDgQ4YjVz4Bj+ZiJ0g@mail.gmail.com>
 <01e25832-955c-4f39-a902-6cc253a2791c@okonski.org>
 <CAKfTPtCVknqCO45p7oR3s=1fNEmDW-jv7-wtQh7vwkuJ=UmVcQ@mail.gmail.com>
 <CAKfTPtBVJZ7DUeDci=JkCs1kstoYXsBru46VchZV7DE5=RB2+w@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Jakub_Oko=C5=84ski?= <jakub@okonski.org>
In-Reply-To: <CAKfTPtBVJZ7DUeDci=JkCs1kstoYXsBru46VchZV7DE5=RB2+w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/21/26 13:55, Vincent Guittot wrote:
> Which is the correct way to ask scheduler to make a task to run 1st

I totally get that and will try to make the changes in my workloads,
starting with https://invent.kde.org/plasma/kwin/-/merge_requests/10192

That said, I hope both the cpu.idle and nice 19 issues get resolved and
I'll be watching those conversations. It's too disruptive otherwise!

Regards,
Jakub
