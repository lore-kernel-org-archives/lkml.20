Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70BA1E47CC
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 01:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791939697; cv=none; b=oOJrZfdt0OZNcNPyHF8e9x0appBi1tPtqm2eIgxj9MJeNyEUIliPVeGj0qS6eCFi6Yd/vu6Jorj2siFLMiQ51IFIwlsbO22/OpdvW5S2FE+ITpPjVl8ev7c9TOb0qIfa+DSHsHQq0+ypdqV/g15h345DptTo8AzC2S6LQcWhtF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791939697; c=relaxed/simple;
	bh=AwRPdt5xIdbOdtIrmjRMF3i2SFwbOZGxrI/2zdeiMKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ttxHiRRO09Gk8fQOvndpMscjLe+iqA9ucTKljVuy7FNgzWHps8eAFVvJIRs4BbmjPcqieIYZcaAHfj4SvX+ZivdGz1aFBLch1ck3bIizhiDzmYVgTtpAIvd1xBeJF/oApQPhR2lbmojESRMBY7V9B/mMkAlEJVW90Uhuoi4G59I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=OUYNnrdJ; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="OUYNnrdJ"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6acb57c2b88so577097a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1791939693; x=1792544493; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NcyFLOR307IwCd4Dy0GBYyDYcbdMnlagtjknr2E8Tlk=;
        b=OUYNnrdJTTcRx4V9jh685tlK8hCjWlNb9EnhktIE4y4sBSGtjvDv0cgN81IEqlA1DN
         NDNwrNjjnzjJCq93JWTpO2nxoEG85qzd4dZVMviuE7h3R6ysPTlF1Xjl4pttz2pcZnW+
         9xm/6h19LeahgO1323L9zPSz93dsNS6gtxALA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791939693; x=1792544493;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NcyFLOR307IwCd4Dy0GBYyDYcbdMnlagtjknr2E8Tlk=;
        b=WFG3dZXPgWyRMLMuVA8solN8yAtJwbSZY+CMtrOIaoFYt92abgceteMgw1DxdVHphH
         Pd7hOVKEyHcztY0uir6971weJhvWGxETOq6JbE9lS4SsfpTUs+Ndx/rgXphkD020EJwv
         Q7qR2woI/hZUoaUNdWBlIOuoACWyABRkqjpUIAnQwyjyVRogkc2usTV1VgHvcJe91hZu
         +T5hLVwn40v7xxonQz0w3fSPdIWMnYy1pROZXpoJM+dNYSm47EgfpEUhyvVjgjlB2P5P
         6D85KoedUAlq1az1lVCCw38rkRlq6sdXVBPUwXph1y4WxpjWxW7pfdDs9IB7CYvVwmcA
         zPEA==
X-Forwarded-Encrypted: i=1; AKwUvByWUlkyjrsQWeBCuxbqK85xFYM7dmmqKM578su0cR07+hfHyuvpWwpTAamdBzfdch2jFM4y5NYjdCMM5e8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+yxDDeSnO3+Nc1TT9Qr7JISSXNdTN0LvV8d6acuNpfCnVvbs7
	kQWyHHADj0ZFPnhxeiRvuryK4rqzDZoqt35X+oxlRQMFHgPJrJS/4NvJNXw3BCEAe7tE0aqBAx5
	vVgURJaw=
X-Gm-Gg: AYBFou0VNh9XfAsyqg0Lf1jA9iRZzkko46BvcelUlLgaRDwjbqip/a/XPXcxhreeIXi
	U0cptF17DlWewbijY6cgOH19M4SwH6Ydc1aOSyKH8G2PIDR2+xcfjZ5HA5P8weRS+RXNRSZ3J6F
	u3kTHvt+7Q6gBXjbjMvPeWaOT7w7QavVxUxzxkXj7QBZBFssfcdRwKJsbs2XOg6/61yv74+GrER
	12nUpML8n015KowJ48hT+BlHwlh/7z9wTODvgfpBKzczwe0ThfjbEAtHgzQrW4rjldI3JO+aicf
	yZmKACmpraPAweoU0pGMBQeKna0Xl5XAp0PAPoCKxezuOXaV592HuXLDNRgfz/BcsAoBOEqtDwq
	o3fO6z8Z69fgd7OH2Qxaipm5Q1JOFswKPNDn5nLYtsV3JoxMQIjhRvbaCxRwJvmAMl9x5uQeMUg
	OlmVXhuzV9qY76QIxKX7AptWSfC8O7FSz+Z501UiZ8T1R5sJK7JmWtfVda1vXwZX+/5CAGqUROE
	W+1TtX/qZa4IxYAsyw+v9nRneqYjP3gaWqZPBMcuQmX3TXu
X-Received: by 2002:a17:907:e0db:20b0:c35:d50a:1356 with SMTP id a640c23a62f3a-c35d50a286cmr384110966b.42.1791939692907;
        Tue, 13 Oct 2026 18:01:32 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c363d61243fsm208447666b.6.2026.10.13.18.01.31
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 18:01:32 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c3156e7705cso83137266b.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:01:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByR8nk/swd/wzNgN/TICPLcKaU0Rw2aAfbvUOwR0kRlKtxrt70Vh4SGCf8QDgeh6ZadPg3gzG8bGTT8yRQ=@vger.kernel.org
X-Received: by 2002:a17:907:c07:b0:c2e:3d17:5259 with SMTP id
 a640c23a62f3a-c31aa0bf51amr1323546966b.41.1791939691728; Tue, 13 Oct 2026
 18:01:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHk-=wjLjgfwgSZ1RDk4YdNFcV0ntosMO5AmBoHD76Zb3HFY7Q@mail.gmail.com>
 <as690Xcu7FxIDYjf@thinkpad>
In-Reply-To: <as690Xcu7FxIDYjf@thinkpad>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 13 Oct 2026 18:01:15 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiak+h+d2tZ5W_MwRzatUP=hJKn7cpGjDxArG-gwgHLXg@mail.gmail.com>
X-Gm-Features: AclHuK-7BzKDDoP5wgoiVMN8_EAgBIxPIkVd2eugYnHCB-lOaGFTkQDZImU89yo
Message-ID: <CAHk-=wiak+h+d2tZ5W_MwRzatUP=hJKn7cpGjDxArG-gwgHLXg@mail.gmail.com>
Subject: Re: Improve page refcount scalability
To: Harry Yoo <harry@kernel.org>
Cc: David Hildenbrand <david@kernel.org>, Kiryl Shutsemau <kirill@shutemov.name>, 
	Ilya Gladyshev <ilya.gladyshev@linux.dev>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Pedro Falcato <pfalcato@suse.de>
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Oct 2026 at 17:10, Harry Yoo <harry@kernel.org> wrote:
>
> There should be a limitation on how much memory can be submitted to RCU
> by the page cache, otherwise will be a corner case where we have too
> much unreclaimable memory waiting for the RCU subsystem to free them.

There is. In fact, I tried it a few different ways... It's not quite
what you suggest, but try it out.

> For the same reason, when a process tries to create RCU-delay-freed
> pages much faster than RCU can free memory, the kernel needs to limit
> that.

That was actually my initial approach - making the places that set the
PG_rcu_delay bit throttle themselves when there were lots of such
pages in flight.

Except I worried about slowing down simple things like truncating big
files: particularly since I believe firmly that slowing that down is
the *wrong* thing to do from a memory pressure standpoint, because
you'd be slowing down the very thing that is actively freeing pages -
it's just that it then takes a (short) while for those pages to get to
a usable state.

So what I did instead was to actively then expedite RCU when there
were a lot of pages in flight.

That worked quite well, but it hit a problem when you had lots of CPUs
doing it: since an RCU quiet period needs to happen on *each* CPU, you
still end up wanting to at some point wait for things: you need to
synchronize not _one_ thread freeing things, but synchronize across
all the CPU's.

But again: the good part really is that this "lots and lots of pages
in flight" only happens when there are literally lots and lots of
pages that are very much about to be free'd. So you are in a fairly
good position when it happens, you just need to *understand* the
position you are in.

So the other part is to come at the issue from the other end: when you
have trouble allocating pages, but see that there are a ton of pages
in flight due to PG_rcu_free, you basically do the same thing from the
other end, and do synchronize_rcu_expedited().

And in testing, that worked really well under even insane loads where
concurrent hole punching or truncate calls would generate gigabytes of
PG_rcu_free activity each second.

Now, it turns out that Kiryl also suggested another approach to the
pages becoming PG_rcu_free in the first place: instead of being able
to easily trigger gigabytes of such free pages by just truncating a
large file - which marked all those pages PG_rcu_free whether that was
useful or not - the current version actually comes at *that* the other
way too: mark only pages that are hot and are *worth* the PG_rcu_free
treatment (because they get read over and over again) with PG_rcu_free
in the first place, so that you don't generate that flood of
RCU-free'd pages in the first place, and now the PG_rcu_free flood is
in a way throttled by the *use* of said pages.

So there's effectively three different things working together:

 - mark a folio PG_rcu_free only when it's hot and keeps being accessed

   (See commits dabc522cee5b: "mm: have folio_mark_accessed() return
whether the folio is hot" and  bb5908b733a1: "mm/filemap: set
PG_rcu_free on the folios that reads keep coming back to" for details
- both are pretty tiny and not really all that complicated)

 - proactively expedite RCU grace periods when there are a lot of of
pages pending

   (See commit 2ce8df4627fe: "mm: expedite the grace period when a CPU
has many deferred frees")

 - teach the page allocator about the outstanding pages ratehr that failing

   (See commit 82fc13ff3a1e mm: "count the pages waiting for a grace
period and free them before OOM")

and it really does seem to work quite smoothly. But it's not like I
can guarantee it's perfect.

All those commits are fairly trivial. Of the ones listed above, that
"count the pages waiting for a grace period and free them before OOM"
is the biggest by far, but it's not really particularly complex or
subtle.

The actual biggest patches in the series are:

 - 65401f4102b9 ("mm/filemap: read from the page cache without folio
references")

   This really is not very big or complicated, although it *does* have
subtle ordering issues with i_size as pointed out by Kiryl. It's
mostly really just a simplified version of my patch from two and a
half years ago. And it's simplified because now the RCU freeing makes
everything more natural.

 - df0b133495c9 ("mm: free PG_rcu_free folios only after an RCU grace period")

   This is the one that actually runs on the page freeing side and
adds a page that is marked PG_rcu_free to a list and sets up the whole
RCU machinery (ok, there are actually two per-cpu lists: the 'pending'
list and the 'batch' list, and a RCU grace period will free the
current batch and move the pending list to be the next batch - not
rocket science).

and even those "big" patches aren't really all that big. Both are less
than 200 lines of code, and while I wouldn't call either of them
_trivial_, both are very much doing one clear thing and there's
nothing really *strange* about them either.

So it's ten patches, none of them particularly hairy. I really would
encourage you to just take a look and take it for a try.

Now, I *will* say that obviously RCU-freeing pages is an absolutely
conceptually *enormous* change to the VM. But it's in no way at all a
new thing: we've been doing the same thing for kmalloc() for decades.
With the right pattern, you can cause a lot of RCU-delayed kfree
loads. And we've had to tweak things for that.

So do I believe that branch is perfect on the first try? Hell no. I'm
sure there are things to improve there. But there are few syustem
calls more important than 'read()', so I think it's worth doing. We've
been doing the RCU-freeing for almost every other path, and I will
argue very forcefully that the path handling RCU code is an order of
magnitude more complicated than this particular code is.

              Linus
