Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D6E4FFA36
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419393; cv=none; b=gXpVWIk+vOBcdksxU0coDfizvz4IXkA/6jKqrFtFro8I82SjAG41UN5QaS/m1ftsiFmH16/GKJ0mvlSr+bpPskVvdRMm4c/dJMXv/Io0koYTz3SDOE5Y0SwLjQ6BaPgZeab+ocdi1PkY+zS0GT4QOKSFADLdjTyAYzP/k2r/IPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419393; c=relaxed/simple;
	bh=u6jcQh8TG/zvY1ya1u+1OUlNtq84z7U924g7IErDvzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S0c0JvFn9D4PYqeEUtCeDDEOFUBussZiF8SBkkA8BgFeN3dGHuPSyWs+pWy6BE69LfbfxOXbZGfLYLsh3VkNel6V1wMmssAJzuf0W8h7fRSImHkk0zHDToxJhE+ZZ+FMLvlBG0FPHBu0Noo7fKMlnVXdO8fOXDt+Ydb6bw+KVt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=iPUEyMz4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Zi3gaDNK; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="iPUEyMz4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Zi3gaDNK"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 8E626EC020A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:16:30 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Mon, 19 Oct 2026 10:16:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1792419390; x=
	1792505790; bh=E5BDBmKtEvtgQjQjsp2zDIOZYhK/Nfvm1AAxcyduDQo=; b=i
	PUEyMz41tGGTyXZgZSQTk3tQ0uit7mVOJlHNzgbSb1c8j7DOZCXO1u+BdDzGYz97
	wIW87Vr5MYxmqp+AK5NI7qhudA3OaR/vvfEdljJZhjrMs8LVYk10GCvTaMi4HjhG
	A+jlSPkq/KYRY89vws4ez08kMl2LBJCvvATr4r1lhOPJJW0liaTVqwdcwFn/APqW
	iVTSgwhGkkrH3x68tRn384mZLptRJNeErwfp0bS3L4Xjrqw40lvV3WABi5l4r1mu
	WHloOwU2QT8uJyykR08dz2Zz63J0m/ihTCVpc4mtxoCjm/Zv4MQ7t+VVIhLghruv
	tx4v/lWXePR2yDMqpumyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1792419390; x=1792505790; bh=E5BDBmKtEvtgQjQjsp2zDIOZYhK/Nfvm1AA
	xcyduDQo=; b=Zi3gaDNKK/1HNVYk+L/SRqTqEq67pyVr4++dxjfC1uiUzKCZRi2
	2u/4A9mhUnbx2P9dfkMxJAsn/NA7o3NhRMEZJsHhgqtK/ORxpbueUFF5SYBt+sLq
	77IBiAhaGxfnTDAnI6rjRA8SUbW6Z8sR/XZQdqh7RdSYQd/JXG0zL4oxsTF1tBRL
	rZwW6WZpyLsUwgztVyUI8+7G6HbFDn+GOPfHTqftO7BWVKmVQLkzC76osA3+gQQs
	yzEwyLedmfSrilkxfo8oFs5iN5tnKuHp1kMrJAfE3Eav7Po6tvXL87UjfUnMMUX0
	/KP3JX5kYhrDlYcuUPGtqY0fOau1tVcC5IA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=shutemov.name a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792419390; d=shutemov.name;
	mf=PGtpcmlsbEBzaHV0ZW1vdi5uYW1lPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:e7VFcXyPKUXtOe6ONm3IvCyxaFcUk3JJbCniDldTEclXNfx
	ulQPb4JiWsAgr+Q9vV6XIjUPibxQVlTnuwy1EHnsMWxOnLpj1s/AZm4P+9p0Eaj4
	ezjjyOkiyGrWF9mBDul0sV/veREpXEwiQofFrcuShs1le8eFHDYh4V/Mf1gYcT2e
	fxWw3dCsH5kMsODiDIYJFF5IZKeYEk2CEwnxGl+R4b7XxE/SiE/jdUpf6Rie2noi
	Zqq3qITrafh9ixbS01fxmRAH3AOSe+Tana4nt5+QOu+oDERdBNUBss4VADGGab5A
	NXf+zqX+ESdO9YqZtJoiEaChJnlj9qDb/QF0mtw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:Z7CgK+L4iXGjNVXlHZTfLQbOyoaJ7CM9F7sgZ4RrVV8=:u6jcQh8TG/zvY1ya1u+1OUlNtq84z7U924g7IErDvzs=;
X-ME-Sender: <xms:PibWanY3pecYEIXZMQUBxUoGLV_YQB2V-9DoLX6wL7Z3eekquJ7-yw>
    <xme:PibWan491ki2a-0mCIl4cdrcxvSjzruQZjhLaIq6uXWBCe2RWF-fng1WTKsi01CO6
    QjvhcLfLJfGOUiomH4SRjVR2dbOpYfAzzuePWu8bHKdLfG5EcwYahTQ>
X-ME-Received: <xmr:PibWank7RZVv52IieIK5vrNqw2hTAcdky1b9yqYN7X8izerUALpFcqBR-WM>
X-ME-Proxy-Cause: dmFkZTGB/LU2Bh7x+KJneHJ/5PiltiMSyEIuSO9AYIXICItJnqBtVMZLJSzSJj1leOgzXj
    f2ZyTkNsJ5fPKk4kK2aaQb3smMOAtMxwEC8xuXQv2OtWSxqzViviQS2MxNw0LcMxPOkyhJ
    tmRO3CQUjYdJiR0u0Ol3BV2j9l+Lx4KCHSjZes7R5cTl4RaTGYF2CoHt9dLU3e3t+Pv0fg
    2Dnb7UlYbTq1KneDfEAa4juMViGCIcOM0xjdsxY3P8LIb9Jw1xxbLu2oiVzjZFBrJ0jSpl
    xfxUBSJQf3iajVLNbCb5cz0GCqlZLkql2JIh9JOrLMf6hG8ARPRpAtvwrbaZrUPd3hBoV/
    Nw4/aKf0POdQCf3nsb3ruUIlScBIvseQ8kJ3MJBT3sDS9mcwQBKP6DuiUylFmrEJFqmfcI
    lCRsM1NxfgsiSmdIix9zPO+NkhfxvrME3K50iuVwvBqfBo3F7S//y0WbS7nUHRMmZ8HKi2
    ojxbCdsvGXgB2UsMJUxLc8IHqxBC+VzWQNcbNE63I1mmHsPKuWa+5FMbZ1UWlRExjvmn7e
    VA+1wEw2Zp/tTQPOhA5aCEKra4dKEecVPNr+6+0ZK0T0r29qoymPucZqdQyRZvV9VISIGr
    GeU4xro8+rV2oQQUq1Cv12gTLubej83f2VerwHPrlFtXP54u4W5luuPSy8kw
X-ME-Proxy: <xmx:PibWalG7NJCuwvM1fOd4Gy9IK0l_nkcahkUsQeHMDiHbJmBjGf5dyw>
    <xmx:PibWajEjk1A2hzHyw3kD6ns_Fn2JBA4_ns89eHIwzMydt6A9ufIdNw>
    <xmx:PibWal0hD7pFBBrRNa_SCVSrS3PiEBe-Qc5zDNbNEiCKUhV2Whn1eA>
    <xmx:PibWatdZQZpS6pX0TqcawPeJ_z-bowepjnoBh27qaJADwIq59nPICg>
    <xmx:PibWarBiky5cA2rEeAp8U-6cQKFzV1NqY-C7JjKH6tB8SZ4hCioRo8Iu>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Oct 2026 10:16:29 -0400 (EDT)
Date: Mon, 19 Oct 2026 15:16:28 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>, 
	Ilya Gladyshev <ilya.gladyshev@linux.dev>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Improve page refcount scalability
Message-ID: <atYk-TcWs056Mz_b@thinkstation>
References: <CAHk-=wjLjgfwgSZ1RDk4YdNFcV0ntosMO5AmBoHD76Zb3HFY7Q@mail.gmail.com>
 <atI0edrmeiRuRtNQ@thinkstation>
 <CAHk-=wha6UNEv+7nVi9zSxa4p=4K-HNMZqxMR-RcspjPTxYp6g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wha6UNEv+7nVi9zSxa4p=4K-HNMZqxMR-RcspjPTxYp6g@mail.gmail.com>

On Fri, Oct 16, 2026 at 07:47:48AM -0700, Linus Torvalds wrote:
> On Fri, 16 Oct 2026 at 07:40, Kiryl Shutsemau <kirill@shutemov.name> wrote:
> >
> > I've added a cutoff to the lockless path: if the folio is large and the
> > read covers more than four of its pages, leave it to the slow path,
> > where one reference covers all of them.
> >
> > Sounds reasonable?
> 
> Sounds eminently reasonable to me.

I realized that we don't need to re-lookup the large folio in the xarray
for each index it covers: a large folio is all-or-nothing. If we found it
at one index, it is at all the indexes the folio covers. But we need
*one* more xas_load() per large folio, for the last page we copy: the
folio's size cannot be trusted without a reference, and finding the
folio in that slot proves the range is still its own.

So I dropped the cutoff. 64K reads of one hot folio from 64 threads go
from ~93k to ~1.37M MiB/s on huge tmpfs and from ~572k to ~1.36M MiB/s
on ext4: the cutoff sent them to the slow path. Single-thread large
reads stay at base.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
