Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BEA3F58E0
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791995170; cv=none; b=ncxr9uo6iGqpDiyAH4oEBCwrg92tSwV+St4qNZeMQ7bv6cgZ2Ym3tpAaXy8isURQYXEBTR4tr6vun6YHBbOgmSD2u3pIRpZbBysD17mbQzH9xBEg/q5JBa2qD+KNczFb0X0n+/LjYRfu9tysoS6A2iz9nJOZxpKXErxsvb/Y7lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791995170; c=relaxed/simple;
	bh=lLX4tFGPYI6KAFJ/R5NlT85vFU/9YOCKKgwjxdQV++c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wip0yAmWaLs9PJo77B2jmBMeieZMIWFiBL/6H+VwMPMKtpmc4UuGGtE73h9Qy4pjr/UlCyP55rMGEEEwloix+lPb8gfVvTOFYL3mcna9iqbpGZdoyX9Bmmb/EnWJYNRrymC5XZFEHx50qxMFawwchBTiPDpfBRLKUPCe28DWc5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=FAhkfvC4; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="FAhkfvC4"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6acb57c2b88so1577424a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1791995166; x=1792599966; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PCdj5PANVocN1j51viXw7MkFpoeK7XeNk1w2hTLnH5E=;
        b=FAhkfvC4oaOZF3H4LiwhHO0BXQRDlRvhdh/3MwfPKxpWRWDdSfcYKPzFprDeLCww0y
         BAxROfMsIyp07vutSG4hzGEobrz9/MchE0SOKP1jPOttiZw4Vb1nMCLhh6WSrLROQIS8
         LVg4McZPWMd5v0qZ2uVp3QhGAuY+/iCGJ5Hhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791995166; x=1792599966;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PCdj5PANVocN1j51viXw7MkFpoeK7XeNk1w2hTLnH5E=;
        b=lhVlNhmS51Jc7NY3YG3b9gyhmM7A9c/RrE+PDVDCRfPcWT87e2zTdPfVjketQQy006
         +1nN7RZw+ooVGpbJDreVxlntEsLLjYgZt7HYtvNzi8/4i9zgNQoVAp+BZd6zMKqWy2Sp
         L4leF4NQ8MzEbgNSMr1brg81M8rZRCVe8HUjFEL5qAaUhsyjM3OJfK33VgbaBwX4RG5b
         1DasreT+q7XKL5ID9S2cThZL24Ixhr7RN4WOWfX9BuLBmxRZ9NgldmTeU7EfMMowWEpV
         avCjY+BZQtujo6ZiqO015JgRSkTaEiVv3ZvLaJXNTq3Bqa3UD//pC3n0H0AL/amMzDzb
         F/VQ==
X-Forwarded-Encrypted: i=1; AKwUvBzywjxJwOECFrfWCFWDTVB3vtZwS4ZWIsW0OV97GfzVjN6fIyuuA/eDdJZHZ3GNJHX3RYP9dl0AkGTHsQU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLe/ol2Zi3JDUFiPlDX3nE8m5+Krl4t8Jti+VPLEZt0VcU4V1+R
	PbGyr4kvBpRaLFB6wegsMmkoH0198oPT2LR9QZil7D9SkS3liKQ9SHpYqmMie4MmmIvzBQ3WYrc
	b/MAL0tg=
X-Gm-Gg: AYBFou2t1YzFTrUn5DrDYFG/Nine8gIHoL8Vfo14CvfZJEwacSpGI6cfiaFCySrHzM4
	wQO+dmGnR8QVNgxmmj9H+AESAq1/xWeZJ6S848/IZVtNI94qK4HpssIZgaEUSF99wMPrmevUrim
	TIYwgHZ0JoZ7becoT4cVEBMMoKMhj/M2SuQVBuy+DIxcty2a/QXp2uF+8jCIrh2h801UxhesbDm
	To0MRnDQZDUvKmFPREvOk/EDBVNsRM+v8w5TT31filcWo2szu4GfQtP0yKPDWa8OTNGTrRqI3Vp
	v5GDI6k4Qir9GSzqmu+uoKjJQpXA2mp0HUFqhzkHvzSwyOofwAsrsaAW0j3HwlG699zZlV7RIpD
	Np9JF9JpCbil4HnCiieeSte5Lelrdn1Ss/VRXL1LvTxSHUyalYJH2eentxHx4j0WGgjh6d7MI55
	bzhW15BI3wnt/YF0Kpb+vHJj6Bguzu0LwQ19vwhNGQqLwgJFB50v6PlsDsyAX87/8gxUgJ4LIEc
	KTPcb/xRogjgZiTJRuLZcZ2WehfHjeKHU/fvmUTv2FwmsRW
X-Received: by 2002:a17:907:7246:b0:c2e:7daa:23e2 with SMTP id a640c23a62f3a-c31aa0dd74amr1603768566b.48.1791995165641;
        Wed, 14 Oct 2026 09:26:05 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed9b33006sm3341066b.32.2026.10.14.09.26.00
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 09:26:04 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c31a34de844so177631266b.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:26:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByI7qTyqc774IgzWMOvjfwByJqZGIB8vIY5JPSrepLYL7AYhA4iLJclPEKItsaPiUsYrPtqlJLP95i4LlI=@vger.kernel.org
X-Received: by 2002:a17:907:3f12:b0:c2b:ca9c:1379 with SMTP id
 a640c23a62f3a-c31aa04ac69mr1609899266b.28.1791995160582; Wed, 14 Oct 2026
 09:26:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHk-=wjLjgfwgSZ1RDk4YdNFcV0ntosMO5AmBoHD76Zb3HFY7Q@mail.gmail.com>
 <as690Xcu7FxIDYjf@thinkpad> <CAHk-=wiak+h+d2tZ5W_MwRzatUP=hJKn7cpGjDxArG-gwgHLXg@mail.gmail.com>
 <as9-2cIuGuXwE2Oa@pedro-suse.tail5790ac.ts.net>
In-Reply-To: <as9-2cIuGuXwE2Oa@pedro-suse.tail5790ac.ts.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 14 Oct 2026 09:25:43 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgkoAuxNXga29nQ8w7GxdqR+4vPAUhPsbfp+gzKrb9EgA@mail.gmail.com>
X-Gm-Features: AclHuK_pD_yiJ_EL5fvXHW6fwc0LStnp8MOP0VvBwqqfrNX1h2hGyUqQEybsEuE
Message-ID: <CAHk-=wgkoAuxNXga29nQ8w7GxdqR+4vPAUhPsbfp+gzKrb9EgA@mail.gmail.com>
Subject: Re: Improve page refcount scalability
To: Pedro Falcato <pfalcato@suse.de>
Cc: Kiryl Shutsemau <kirill@shutemov.name>, Harry Yoo <harry@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Ilya Gladyshev <ilya.gladyshev@linux.dev>, 
	Matthew Wilcox <willy@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Oct 2026 at 06:59, Pedro Falcato <pfalcato@suse.de> wrote:
>
> On Tue, Oct 13, 2026 at 06:01:15PM -0700, Linus Torvalds wrote:
> >
> > So there's effectively three different things working together:
> >
> >  - mark a folio PG_rcu_free only when it's hot and keeps being accessed
> >
> >    (See commits dabc522cee5b: "mm: have folio_mark_accessed() return
> > whether the folio is hot" and  bb5908b733a1: "mm/filemap: set
> > PG_rcu_free on the folios that reads keep coming back to" for details
> > - both are pretty tiny and not really all that complicated)
>
> I'm not sure this is a good criteria for checking whether a folio should
> be RCU-ified.

So my argument really is that there is almost no downside to marking a
page for RCU freeing.

Yes, it delays the freeing, but it really doesn't make it very
expensive - and it does make reading it noticeably cheaper.

I'll argue that PG_rcu_free is cheaper than just marking a page
accessed, much less having a dirty page. A page that got marked
accessed is *also* going to make freeing it more expensive: it makes
it go through the LRU lists one more round, and you're effectively
delaying the freeing of that page. On an average machine these days,
it means that that page will be delayed to happen after many other
gigabytes of pages. But nobody even blinks an eye at *that*, do they?

And it's not even *remotely* the problem that a dirty page is, because
while it requires that "wait for RCU", it won't cause the kinds of
fundamental problems that IO causes with writeback.

So marking pages PG_rcu_free isn't "no cost", but it's a real upside
if it keeps getting read, and the cost isn't actually that bad
compared to things people don't even give a second thought to.

> - you don't need that many accesses to get an active, referenced folio. LRU
> batching makes it a little harder, but not by much.

I thing it needs  six accesses with the current mglru and default
settings as it goes from "not referenced at all" through the lru
generations and then finally hits the "no more generations => it is
hot".

Sure, if you don't do mglru you hit that final stage already on the
fourth access as it walks through "referenced", "active / ref
cleared", "active / ref set" and "no more stages => it is hot hot".

But if you read the same page six (or even just four) times, it's
clearly somethign that keeps getting accessed. So "mark it for RCU and
fast accesses in the future" doesn't sound at all aggressive,
considering how low the cost is.

> - rewinding along a folio doesn't tell you much other than the reader
> went back, for some reason. It's also natively racy so funny things like
> multiple pread()'s to the same fd can easily confuse this mechanism into
> marking this as hot.

Multiple poread()s to the same folio is exactly the case we want to trigger.

Can you make a load that marks pages active without those pages being
useful? Absolutely. But if somebody does that intentionally, they only
have themselves to blame if the end result doesn't perform well.

And if you don't do it intentionally, you have to *work* at it. The
read() logic already treats "continue from the same spot" as not being
a new access. So you really have to *actively* do silly things to
cause a page to be marked accessed six times.

Or - and hear me out - that page really was accessed several times and
should be marked for fast accesses. No?

> How many pages (as a %) are you seeing as marked PG_rcu_free across a boot/
> realistic workload?

I haven't actually checked outside of "a normal boot doesn't cause
even a single accelerated RCU period". But I'll go reboot into a clean
kernel and see what a kernel compile does.

               Linus
