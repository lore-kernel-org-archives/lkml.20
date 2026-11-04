Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818003;
	b=t9cZRIm1HjcoMXg6BqaUaJ47dt/BMCZkAJUxwAGNSCVdw4Mj7S3G8hJzrArNNe0IEvZu
	 mJAk5D2sVa0dtHxhX+aj+BfHhg7zpS6yWR3a/OPQDrLzaRMA2FXsI65U/pgBEwG/S9S0k
	 6fEgJFEyabjW63WoyyVvnotjxPf4gG7kOQWO1upMa+6FGKq+uq0D9cI6dQHRUIw3vUVA6
	 bNlJQhKx+ZizPdmfU9OPWlKY0DZnQ/215Y/xWBdIAaLxgWCaN+E2GPTveTIuMUeN/3mDM
	 zDz08hS8w0WT1elsdXLPPvvgxiHasoMVoCFUoA6kcy5DWWUZMPT1Bdp/A67gDbd2cxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818003;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=0YhDr+3iNQXZpzi3ONHbQbAMo5PLwYKn4EglqMWvWgc=;
	b=ev9n8Av2R3oze9i7mZyBt/qffwjwH4EOU71ujdHctiSv/glyMPMhz/bkMRmH3G/iK7H5
	 QmwH8rIUVWFiHhJ+g7Kik5o2PiZGWpoLNRX1rJWrf7LF6HaNopzHV31ZXIbiF3RtSyx83
	 VUBCxBXUq16DLruX8mzd9lMOtcl8TzFMbUUtpxXTMyjOdG5YOIXyqSYp0kTRhappC8D4N
	 9Ky9Kz49lsDEgGjFtIdQpKWvlcpYotbgD0ee4WeTa+eGDzlJgmdElYwMlHn+NvWvfs6xL
	 1iB0MPjlFk9mJg9dP6aCxFOSWssnXynARpS7Szjo98QoGN5y5kpxDqu/s1PCzsl3j3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--chriswiseman.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JaJHWPaG;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818C5606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:46:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 818C5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--chriswiseman.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JaJHWPaG
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso1837361eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793818003; x=1794422803; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0YhDr+3iNQXZpzi3ONHbQbAMo5PLwYKn4EglqMWvWgc=;
        b=JaJHWPaGW31Kx6pQRaYEHHozvqPJgbHhQanEMI3dXn2EJeal9e//RA2fgp5yB0gXjU
         PVAB50mIXmNGeGmFTF0jINbpTeNQ1G4bz6dsHPD2dQ/CKT5DYK5cC4IuheSR6m9xS8/R
         w/RhAXuS1ldZE8L0VYyVQcoWC02UCwP+O9UTQ0eUrJg6oVzVpDwwZ3XEfxSxCNmUiYCq
         9QqekZsa25m+GM3PPKocAnMkxZlPUrIlcP9/sDFlFNtf30snz57yoB5E+m6wCLnfcy0B
         fbRwqNkf+zYo6zqFptP8nht5/NuG1kNuD5mXFf92b53/KaX6+VmZ+cGWTTpR6LwanQJq
         v21A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818003; x=1794422803;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0YhDr+3iNQXZpzi3ONHbQbAMo5PLwYKn4EglqMWvWgc=;
        b=oQwrNiorKIx5N/xD5VGoZE5QRW3GG4oECgGNoRPqkaE5dYcc18QjK13IpDNw17pvhW
         GYF137anCOhegbehypMtbLRXEYF+9z5jxWOw4HJa53+YsmR06MN0848zQHZ57eHd+HKT
         AYkoBZBvo/d7aVH+YHF5zdUq5ReTg/9U9GctudJkg7B7GwM3eKmh3aV4Kip/5yrSs13f
         gmfNHI4Q7IsH0bYDvSbBY2OwB/QZjwQ/7IZkP49jvGUHsFqbPAyFuar7MY0AjM+XJyA7
         myOIh9//YjxsAl9wpSwMvxrGhczZ5o0llUPHgzaRp8/0iJYD6NQYYIFrjcY6aKnPHIKg
         Jtww==
X-Forwarded-Encrypted: i=1; AKwUvBzjjd+zoZpeEsqJJhF1+oSISslhAsVtN99fPu56Jv5Z1p+Bl8wOgseYnpgtOd3ccNRNOUPYkKaRqiy6RsQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JtsXtJguyMkbMpR5fAMsXHLBcVyHJbSjbJRkgCmL+SXZc2wcQ
	e6VQgt8fpMvqx90tVCbFeKU4/A0R1A3oxgBKFZrTKZW1nnj+pwSO5uoRjUPZXo7WYvkbuS+UJl1
	oIMCiq9MYdd1G3antkYi71469WsOL8g==
X-Received: from dycnr25-n1.prod.google.com ([2002:a05:7300:e9d9:10b0:369:f343:e68d])
 (user=chriswiseman job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:42c1:b0:36c:9bc6:3ec with SMTP id 5a478bee46e88-36c9bc60702mr6170036eec.3.1793818002106;
 Wed, 04 Nov 2026 10:46:42 -0800 (PST)
Date: Wed, 04 Nov 2026 18:46:41 GMT
In-Reply-To: <CAKEwX=MV_xEUvz91pz6uc4qXWnWOUDtXZ2zASdNVOBHBLeA60w@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <cover.1786003779.git.xueyuan.chen@vivo.com> <anVWZVOt-xeD0dMH@google.com>
 <47ed45b5-de67-41aa-aa21-a3ba3479a7cc@vivo.com> <anXJ-5_vO7-toSe1@google.com>
 <CAKEwX=Mm2tXcen-quRXHf1Y2qSHYvpEUe4xiw-mHYaJnRUR-EA@mail.gmail.com>
 <auKqt6b4AxCLziIH@google.com> <aufPMirl4cD7tz0X@google.com>
 <18e4542967ebdd10.3137322e32332e3235332e313736.1dfc41.0000sendgmr@google.com> <CAKEwX=MV_xEUvz91pz6uc4qXWnWOUDtXZ2zASdNVOBHBLeA60w@mail.gmail.com>
Message-ID: <18e4ebf806e937ec.3137322e32332e3235332e313736.1bf52a.0000sendgmr@google.com>
Subject: Re: [RFC PATCH 0/2] mm: zsmalloc: make shrinker compaction budget-aware
From: Chris Wiseman <chriswiseman@google.com>
To: Nhat Pham <nphamcs@gmail.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Xueyuan Chen <xueyuan.chen@vivo.com>, 
	Barry Song <baohua@kernel.org>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, Brian Geffon <bgeffon@google.com>, 
	Minchan Kim <minchan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, xueyuan.chen21@gmail.com, 
	Chris Wiseman <chriswiseman@google.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 4, 2026 at 9:57 AM Nhat Pham <nphamcs@gmail.com> wrote:
>
> Is this precheck basically checking if we can free at least one zspage
> of the size class before proceeding? Yeah the number looks good -
> let's add that, in parallel!

Yeah, it just checks if a bucket has enough wasted slots to free at
least one full page before taking the locks.  Sergey pointed out those
two counters aren't atomic together so an unlocked check is just a
best-effort hint - if you and Sergey are good with that, happy to send a
patch.

> Ah ok hmm. Sounds like internal compaction isn't that helpful, i.e
> zsmalloc already does a pretty decent job at packing objects that
> there aren't a terrible amount of internal fragmentation in the first
> place...?
> Should we do CONFIG_ZSMALLOC_SHRINKER (default to N or to
> CONFIG_ZSWAP) for now, and remove it in a couple of releases if users
> in the wild do not complain?

Compaction still helps when we trigger it between bursts (freed ~21 MB
before the swap storm and ~10 MB after).  It just wastes time running
mid-swap when new writes are filling those open slots right back up.
Defaulting CONFIG_ZSMALLOC_SHRINKER to N (or CONFIG_ZSWAP) for a couple
releases makes sense to me.
