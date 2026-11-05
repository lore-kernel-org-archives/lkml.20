Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892766;
	b=onF6gH+1UkOZG9h/AYoiFckpTPhuqLmd3G57t3jmuCU6Yoplw7ePQWlfuMxE8D0CH0vo
	 iGCOQYS6XTZ6SwN86+0Lk6xQaveppTaafDT9cRsLLrJWQl2Tvnz8sVZUzI0u39SvpGaQ/
	 jf9u/O+j+oMMs9uq8HBVa5OmOUry+Rw+GeG6GKoU6DSycUkFosQF+F99I3M2KcHc1NhJm
	 zpmGx3Swu8/utvWCqFuFm55vaLPxUC4sA1aecBRKOTrYTjz8ao7PGoiJpzS2ZqoJEDq6z
	 v3ro2llFHVGwSEv4lftbZiZFcQgFmrRdnpXmwgIUCk3JI3Cb2vUpBpwzvsk1C+tKa0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892766;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=7umyZ/YrHoEtmXj0FGuivr1Hxju6M5MLAM0VoOLTr7k=;
	b=0lkOoOd3841uARFgiVCWHmcQU5TExVD2DbwXlEEPHiSGQc0EsWRW/ixyvE3JP8as0Vlh
	 3Sj65WnQr0yJa5Y0jTdkVNg5k2petHLnzjl0yneCQtOKgTYmrnMHEY2pOJ+0tcOX2TXmT
	 WAm54Ri94jVBhp+xyBIsBdJ6jZIth7yEygzUgW1E1EHRZjls+Kfqf39wPs3YhR18BgJtT
	 pO5O+BuErCgbS64DGfrq2BNfdAUaQhlZaoCfnpMF/t3ElIJOhwH7ucE01rfWeAxyfJIms
	 GjggedEJgP5pFQdQ703nV3w+dqIg0BoavC8/OgLB6TYhsTHMcGIo+BiKybXNmTl+NLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PorG3Q5F;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD4D606D80C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:32:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AD4D606D80C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PorG3Q5F
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36ecc11bd26so45393eec.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793892765; x=1794497565; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7umyZ/YrHoEtmXj0FGuivr1Hxju6M5MLAM0VoOLTr7k=;
        b=PorG3Q5FbLcdyCew4BLa5t0nPmnihUHn0qUvey+nts0JbhpAd0tIah3NA3fALyYQM/
         8mj/jdPtaz6P0A4c7a0TBqXy6BiBW68/XxzkFhOE+C/e33HbvtvDDpTGMHB+BUSkfuyi
         YHWgrOP0zY0o579kom3sSaOoOGUOKgW+hCfRDrgmqvTjxRXEoKfsXuUiy6+EFtgzC4Bi
         Dz4Lcw74fD1umnxX+RaYphP/c88x24b0dxCvdxpxaHhbKZUGRL7jlXiaHnKQOpTZKnzZ
         nyxK0np7Eq30QoygPMUqZtd64/8OR1bOCEu+zwwaczyV4blv6SQiaNvJCKKMNvXa36aj
         tfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793892765; x=1794497565;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7umyZ/YrHoEtmXj0FGuivr1Hxju6M5MLAM0VoOLTr7k=;
        b=z3yRpv9GDORs2cgDqn57tMccj3QTuxVoKWy4XCWUFkRf8ubfw0zlgXs1p7BtAzASbP
         gtqbdUeXpDH/9yn99aUKJs1l0OfqMwtxyZKJxuKmL9NUKNaiX1LXgtL//r7fdZIZmWmg
         xYhHC9rVqoaFe146DrukBxz5QKdyM4iGT83csBIFtxxxy9U5EPOFxWCwiMjYzk4KWZis
         GUeJDSDPVkXJFcp7Sgfmz8MQtjB7aSCcM6u8wJtNK6zfdiRYFeVCKzXujRgX7eowGDMU
         vCrtW5hoUE/6KfMkLwkevPVpPlFAANX09HE0G2rGhHUuskHKPo2NUrnLeC1AwLA3ooxI
         vSQg==
X-Forwarded-Encrypted: i=1; AKwUvByzXJzQYoXIUTX3oYYzFZSehbft7SfNCj2ozydc/vc0JD6ElitAGBh1DSojKRWzQBNlIPaMxuciVKy0Jb0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Z9YzI7ph6YayxGwvRu/n7YYhA06HneymZ1NsruI3jx5URbbpi
	gbraj2NL1cLOooPiqM0hAhXf3Bm89Qr7hjJJbpzy6iOk5/095cOZvmpb
X-Gm-Gg: AYBFou2X9qP6GS+vc079NiyC0XNT/WX6fWlaU9vW9f8xu9eZ+mrdzLksLHG8wLdswVe
	sPiJP9MiUlzqcZmydg3Pg24rh+fkqkYsJjttVLi3/WXM6VdAOODuhKF3uKZLndX/M/fYavQBfIk
	EO0UOUdUfmQXyZfXsuHZrL55otJta1iw8irSky95coDS8OrsF/4tB4sFVRe7xPfvgFM1vTmj0IU
	SCOhLJn13Nb1xv0xtr1ptktpPbkWuMAQIUwrEiVAEQUcmLxjjTgpJMfQ6I6wv8wWqQkMXcNEcYg
	AqJ5cMXBdveM/1R8185fHUpD1t5mrURRGuURGy5bCGmZcL3k+rQs5zYjNhhBofrJYPJGI/DcwVD
	KO1BUBf9eiFn7ceLuLcGm4O8u2Wloqu1r5jDNvIuLZFVGgBbqfwGut6k5cX+x4R/kXV30sRQS/t
	aXVMCB5oJMUZO4MUCNuLVviXmIuyKyNw+mVKDxOsEGQo8T5td70GAEfIlz1EjxnH131YX6nPSL9
	MZm7lNrHxs0yvFqWfTty9JsH7Uswee0c1XFekMw/YUrgX6cz2VU7OSeAOv5YE0uSZO9l2TjF+mG
	rLYFwdxsSJm0gMIbjp/7iVhP2BsY5CzS8+BxJqUfrZQt+YJ98UTih1rFQQCIYx9kvbc=
X-Received: by 2002:a05:693c:87c2:10b0:36c:a1bc:6114 with SMTP id 5a478bee46e88-36ca1bc69bamr13207496eec.0.1793892764837;
        Thu, 05 Nov 2026 07:32:44 -0800 (PST)
Received: from o6.lan ([2602:fce1:44f:115e::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca394c2a3sm17793828eec.20.2026.11.05.07.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:32:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [RFC PATCH 0/2] mm: zsmalloc: make shrinker compaction
 budget-aware
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: Nhat Pham <nphamcs@gmail.com>
Cc: Chris Wiseman <chriswiseman@google.com>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Xueyuan Chen <xueyuan.chen21@gmail.com>, 
 Xueyuan Chen <xueyuan.chen@vivo.com>, Barry Song <baohua@kernel.org>, 
 Yosry Ahmed <yosry.ahmed@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, 
 Brian Geffon <bgeffon@google.com>, Minchan Kim <minchan@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <CAKEwX=OUt4=wqDLiPvYuiTnkpuZYnszkuNQScNR93hHhVPRRGA@mail.gmail.com>
References: <47ed45b5-de67-41aa-aa21-a3ba3479a7cc@vivo.com>
 <anXJ-5_vO7-toSe1@google.com>
 <CAKEwX=Mm2tXcen-quRXHf1Y2qSHYvpEUe4xiw-mHYaJnRUR-EA@mail.gmail.com>
 <auKqt6b4AxCLziIH@google.com> <aufPMirl4cD7tz0X@google.com>
 <18e4542967ebdd10.3137322e32332e3235332e313736.1dfc41.0000sendgmr@google.com>
 <CAKEwX=MV_xEUvz91pz6uc4qXWnWOUDtXZ2zASdNVOBHBLeA60w@mail.gmail.com>
 <18e4ebf806e937ec.3137322e32332e3235332e313736.1bf52a.0000sendgmr@google.com>
 <CAKEwX=PFdgEbba+H3fEnJFDnfkxCTsvuHEb4numVwJRaiMgwKQ@mail.gmail.com>
 <179384102494.19062.12740032892044628762.b4-reply@b4>
 <auwOBaRtM9p_Wxfx@google.com>
 <18e529a5ab0738f7.3137322e32332e3235332e313736.873cb.0000sendgmr@google.com>
 <CAKEwX=OUt4=wqDLiPvYuiTnkpuZYnszkuNQScNR93hHhVPRRGA@mail.gmail.com>
Date: Thu, 05 Nov 2026 23:32:38 +0800
Message-Id: <179389275823.111354.9600793327477116515.b4-reply@b4>
X-Mailer: b4 0.16.0

On 2026-11-05 08:08 -0700, Nhat Pham wrote:
> On Thu, Nov 5, 2026 at 6:36 AM Chris Wiseman <chriswiseman@google.com> wrote:
> >
> > On Wed, Nov 4, 2026 at 9:05 PM Sergey Senozhatsky <senozhatsky@chromium.org> wrote:
> > >
> > > On (26/11/05 09:10), Xueyuan Chen wrote:
> > > [..]
> > > > > SGTM, but I'll let Sergey chime in!
> > > >
> > > > Thanks, Nhat and Chris, for the discussion.
> > > >
> > > > If Sergey has no objections, I'd be happy to send a follow-up series
> > > > to make the shrinker configurable and add the unlocked pre-check as
> > > > Nhat suggested.
> > >
> > > Thanks.  Sounds like you and Chris will to have "Rock-Paper-Scissors"
> > > to determine who sends a oatch ;)  Just joking, let's first figure
> > > out how exactly we want that zsmalloc-shrinker thing to behave wrt
> > > zswap expectations.
> >
> > Haha, Xueyuan is welcome to send the patches!
> >
> > Dumb question on the zswap side - aren't the zswap shrinker and the
> > zsmalloc shrinker independent?  Even if zswap's shrinker is turned off
> > at runtime, normal swap-ins still free slots and leave fragmentation
> > behind, and unlike zram, zswap doesn't have a manual sysfs compact knob.
> > Would it be simpler to just keep CONFIG_ZSMALLOC_SHRINKER as its own
> > standalone config rather than tying it to zswap's runtime knob?
> 
> Yeah those 2 shrinkers are independent! I think we should just let
> ZSMALLOC_SHRINKER default to the value of ZSWAP_DEFAULT_ON.
> zswap_load() (i.e zswap-in) by itself is enough to create
> fragmentation. The zswap shrinker is just another trigger (and it's
> also irrelevant if zswap is disabled anyway).

Do we have any numbers for the zsmalloc shrinker with zswap? If it
doesn't help much there either, do we need to keep it behind a config
option?

> 
> How do you feel about this, folks?
> 
> 


