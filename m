Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794268231;
	b=KofFcu3cDwbx9RNdND3gD9jnhvBd8mlR5Io+y1t5cE/sXo3NjkuMBhfuT1L4pNICU2Io
	 vqlvz5aVc1XR0enT5K+q45gGIrn7YCO5RmhAih/CfWbkuVD8LYQEsjLqBu+3s/vniJpPI
	 5VzjEA4ZLnQLOiF67CUkf/OSHYxC4zuQcfkvg/bRfl+8bKch2ItWDsntzRQDiQJOIHDAE
	 sOCta8kTx0xvQLI7Jiq5ulQESA6sn+xvNAE3DH48ihdLbjOvQKce7VxCRTBMeAaJhcvHX
	 q7Vo2V9oUY5G5o5FT4XLTstiKhqC43ZutrH7DpsPw/bxBFeZ8s4TFcrlJLAsw8H71MQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268231;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Vza2x9HGOdRnVL6x5ThMuKrNvTJEW1pcwRqPDlTpKgI=;
	b=piDoiHdneHXJEgV4oipXTSqSjn4v6P2EqIHNe35OjsCtK7UCtIkcBYzV97WXeSfe0cFL
	 IJbRZoTEnm/XK6My2cCDWF+RM5DtBP8RIllrxkd+WyI0EhNVlC36qskOGVAkrLBrgW2Cp
	 15s5t3RGH3R31LZjG5hvqjMf8ldaPRyhM+h6tAz3QBqPnSkarj/blPJJT3NwhCuO7Wfiw
	 NmkCoHZflWfqj+iWEIYoUzrmJscIV5wNWzIs8xtc893MRAsbg4OLFHDHufuspmV4DFHeo
	 2K++SuAdjyh9ShCYpedys+2lQSlLSwawWgLOVbNVA5dOxHRVnuOC0ZqPYn7WxUxnKPA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OTwMsJsN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48DE606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 23:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B48DE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OTwMsJsN
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5c00d7ac49dso1315e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 15:50:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794268229; cv=none;
        d=google.com; s=arc-20260327;
        b=pzY60vCBM6ey3t/IxEUOgVC3kugKanjzwG3qDu0qHcBh7JOddRRP8bmb9nt1t3JpgK
         PDlVHlGIrU2ks72DYOdjsMlM/2JI1BnkWbyQ/G3H0i92HRXZyRfpKJccCVGcTrw0vWHd
         OG7NFlhm2BMKiaN6HUzpoeXG8WcvmrmETBJnExBVQ7SE+vcYefNyFKUUJf5d9NDzj2P5
         cAr2OrW6ljfY2yhOwH/iU3OHNPf1V/nacFUi1xwyrI/jmstw3w8Tydvi1RmV2Q4uKv3v
         SfjGnQQAjGwmKV62tj6oMuEY/3oR/QMg/l4zlXHfve5s8ajXxmUmgmkw5ymNx2OExJQe
         voOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vza2x9HGOdRnVL6x5ThMuKrNvTJEW1pcwRqPDlTpKgI=;
        fh=2/QhcYm4B9DZD0hz30w0zgn1mULHcTOxvJ7Kpl1fC4A=;
        b=q5mpEoLwn7dkLTX9AwyRZOwx+zUrmaXTp9GvIuIyuupSYGK+89qGTwemU9M8Z5HHRW
         2CwKE1tNpWv0f6/UBVRVGGcZwlWl/zTb17Qp1yPdlyyPkJGzD+PHRkIUmHQP/eu80+0E
         piJjT8Tp84V4movKJSz0GHmGN4qJxA1rEu4LfAyIkEGmOwMslAfAV91iZDaQykG0wqen
         oQqqVuhOUwc+HOtQdn34ESVwiJSnIVOHQf97BW4nkLB0eRpsllkJpdSKOG4sOSrVIiFE
         M8ycCh/RwBz3vw1nWhihxZjdcVRWYtvjbsF9rWJZmGu0KiBsXCWrg7h6IJ3Ey2YWTVrS
         vT2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794268229; x=1794873029; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vza2x9HGOdRnVL6x5ThMuKrNvTJEW1pcwRqPDlTpKgI=;
        b=OTwMsJsN1OXe2/m1HqZ3c9RvUqA4ITqpYSvy9gDBsIDC3tiAwG9w1b9fEMBe/aHJl+
         RmYYaY1GBW1F8uKoFNLARXwt5JQltNKR21b5DOXrHkevnE5LgjjrkC+6zNs8BcwpRH3j
         fejTy8aqNE7jUaxJj0+2QLZ438zkhu/6lYdRCQruXC4TPx3nhiWowd/GW9J+csJYjrEv
         drt8Jw94tHsRmMimBOj3vmhm9gfGukHcuvysC1I6QivVXw0tH+A9TLEMWvLx0711TnIm
         cR2TDK9gT3Nu1u1cubvac8wVTIhbIu6jLsmb1quMSHPlur4iByMP28Twt6ffK3EcR0Ot
         0PRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794268229; x=1794873029;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vza2x9HGOdRnVL6x5ThMuKrNvTJEW1pcwRqPDlTpKgI=;
        b=hP8YKW3h0VnA+rYHUX00zoKVIp6gtkJ4nMfT+lTWfSfGeIhpFAfEfKPewLrfvOVenW
         0ijlGJmFKeC3gnsBc4PytED2A3qLBnuHUE6TV3Ebrq9CgJMKkv+o6pUhPwu5tPFQJ+PB
         +U2ZgMp0soszcEgTZfS/O8vAL3dJYsMQgYQpoPRoP7Mo1tCh6cQZZ6K7HEeoycObT0T9
         XVOgB+pLswQ6NBUH1UEJu6fj6Qa/xxgRpO+SWsfw7v+mDEWZ3ZTrIMDdNTdJgGdD+5uS
         pXz5cW9kRUAuGU/IOM3WJWtl63bGdcU/tT9YlRZb13FhmZtYvOhn7IZj2odYRv1MY6Jk
         S0vw==
X-Forwarded-Encrypted: i=1; AL+hErE2FsLmkzboXN8cYof6bicn+ESGInGqTZ/sXeiwdxuO3n59tO+jaSe3iDKb4pT8VLoy1UuSoGXQKyz9fY0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZfHE2bgJy6IC7nTGS6uVjLwMsBlrwsZDqH43JPkYvDePEWo7Y
	Yra6uu6pPaRYerGJq98azGwNz5z2eZkUudPX5kBkTUCYRTM39bdPBP6A2YsSfQoZRKRhuYeozaM
	PcIrRISaMKCZsfM7wo7YtZ31Ype2tKezkXY+tlywl
X-Gm-Gg: AYBFou1E6REINSvpuNFGxfN1J/Sg4To2TwlAYanh+qntAMRSWgXOp9IPi3evmyZNy0b
	7FdbneLfIyG6chnrvHy+cIcDbPR3BX+I+GsAekq6WYfoMcoBBDJn370DvX+ZqUvPem/qytT7PWm
	Y9HdXl1T1nIzqj4bqjf1Kv5QauIZuxQZx1UwF9m6K4CTdLrQLWZJlS0XOAEgq0oRQ1oK/xwMONu
	sTyMfjGX/7DH+zU+l3Ly/Sq+gUrTIQ5xZmMyk0UbDoUEoP5qBNw56UhXDTru7pmcZT3Z3PhVI9r
	fArtb1kg4dVknrd63FG0R76c9ONXRiOKfQW316EiXoTzwltG//bQKHI1PmvVz7JT0ItZrk3e1y5
	8DAn5bpASqbQMYthFgSu1EXXY2iQb8ygGrwg31ILskDFW7kWFAbjkH+fKlx/+pqro8SG/lqx8NP
	+iM/Zxb9MRsAVW8vTuUhvv2o8=
X-Received: by 2002:a05:6512:4025:b0:5c0:7223:9ac8 with SMTP id
 2adb3069b0e04-5c15714d3acmr60103e87.6.1794268228471; Mon, 09 Nov 2026
 15:50:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105165525.011876858@infradead.org> <20261105170157.616859418@infradead.org>
 <20261107113639.GK2668200@noisy.programming.kicks-ass.net>
In-Reply-To: <20261107113639.GK2668200@noisy.programming.kicks-ass.net>
From: Josh Don <joshdon@google.com>
Date: Mon, 9 Nov 2026 15:50:16 -0800
X-Gm-Features: AclHuK9eGoxp8VWuVuu2-3kZKeXkygM4dgOZJkbgQ7drMbfxSEdftPi-CFIL3F4
Message-ID: <CABk29Nuee4RVMcWGtZk4geGMigx-dTkiWUhex1LuUv-N_ub-8A@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] sched/fair: Make cfs_rq::idle the sum of ancestor tg::idle
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@kernel.org, linux-kernel@vger.kernel.org, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	kprateek.nayak@amd.com, tj@kernel.org, jakub@okonski.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 7, 2026 at 3:36=E2=80=AFAM Peter Zijlstra <peterz@infradead.org=
> wrote:
>
>
> Rather than keeping cfs_rq::idle as a copy of tg::idle, make it the sum o=
f
> all ancestor tg::idle. This makes it trivial to tell if the current cgrou=
p
> is marked idle somewhere along its ancestral path.
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  kernel/sched/debug.c |    1
>  kernel/sched/fair.c  |   88 +++++++++++++++++++++++++++++++-------------=
-------
>  kernel/sched/sched.h |    2 -
>  3 files changed, 56 insertions(+), 35 deletions(-)

I think this needs better handling now in the next patch in this
chain, but this one looks good. I'll move that discussion over to
patch 3.

Reviewed-by: Josh Don <joshdon@google.com>
