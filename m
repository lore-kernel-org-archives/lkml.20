Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5842D9796
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161618; cv=none; b=qgAoTeYV38D5BWW9jyLACiGjfdkfdbhzS/c4uLBPrI2qHZmNBYDk3+FsZhwh/7/h/R2tHVYqw1sEYXKQ1aVW6OeWfk/IHKgcE/VTiN6HnXW2aeYZUULkIIIIBPl4A+RuoAnNQh3/F4q3Rj/AtbaOOkaaB/a+uiAhOAb+oSYk0Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161618; c=relaxed/simple;
	bh=0OINjBzUgfq3udtQxoCTHXGH+jsqc7bmQ47D4WpdvIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TnWuA3joPceTEt3hLQqHualuq0LAt+nHDSmqPJ7KqBTKpIOuUof2Y+ejHBtt9dliC14EdzqBzaK2MELHljXbbq+QeSE7RqJ4ooxn2HO3GrvHRf+3TWLlxSucgmDtHeHagKnabXeZmtypnK0xVP8a7ongGyBJ5eF0q4mnxcOF4iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=Q9FZH+yD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=myyfzQVq; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="Q9FZH+yD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="myyfzQVq"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 6A97AEC01D2
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:40:15 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Fri, 16 Oct 2026 10:40:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1792161615; x=
	1792248015; bh=ZWJBtz7FZxAJXDEKnJv7+8CcY24QkoJWm0ZykJIucZs=; b=Q
	9FZH+yD7MuFwdoFP0q7bS2B5y1K7jmGy9QSkXc6YvgLux99zG/SqiVFf74x/R21N
	RTQfgB38znZWhmzPfmLAQyXT6FqAE6Yo+ZLstHOJCmj1OnJwshAvPrE4I13Jt4TL
	LR7kQohxMP2SpszDO03ZS0fBQy+Oo2tbdHJcIZk9K/yikS7mdBLd7EWgbdt7nixw
	KToj6mExZ4qllEJ5+FC0WaldDgn0l36kWK3kvWARd8OvP48wlvwFn5jjo/Kwp6+6
	0eMJ/BbWE0tE5W2hJOYKBx8OwpCYdDTxBxPm+ofxXTwczMgt3SmVB93zhjjoknYO
	CYjFO2IFIr+fmScTPVq7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1792161615; x=1792248015; bh=ZWJBtz7FZxAJXDEKnJv7+8CcY24QkoJWm0Z
	ykJIucZs=; b=myyfzQVqzEtnh1e6ODhMMaNcTy9+9K5S3b+q6//7ozZcF52VlMI
	k+WdXQMlc67KLDYinFT/VeQ9BVqNebKnd7L4/+1mOkSbJKibOG8etk8zWkcFEBIq
	xlFtgXsAFEhba0IsnS/Yi3hn5Dy46q/0Ag3uxeFx5A5JUyUWQNxSpmbSw9h2hTKw
	CJiNSlbsHsPCWiZklg7SdIqcRDa4fAJ/NDjZWjG2AoNPWo1Pi0FaQb8MELqOqbAT
	Kl+hY5WObMVPiLEyRbmI0/uXwwIGSpyiyj56ijrHIIjRcUx/BsbH2BczCZarDULI
	XzRkc9dxmMrZ1vaWALYNvPHJOeYDgM8atDg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=shutemov.name a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792161615; d=shutemov.name;
	mf=PGtpcmlsbEBzaHV0ZW1vdi5uYW1lPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:dRvVViFEminCZWvo3UkxnwJurZvZA4fWnB4u5RDw5Ly1hc0
	+dNU6HkoyvopcDZ4vpNnCkKJSBCf30cUxi1xnpRStq6oFLi6l9ggyAgcdajmdV40
	4tolNw+Jz/ixapzTBRdjOUzlYABWF51SWR05BhxBTTc4n8zuI1xrFevdy84ve5vt
	kCzrYy3xB78S1bJgFL2f6Qn/PedENIpMuMNbIlGtWZeziRj2WgXXtWKhoTw803pZ
	TCzCEhNEs4XzBC19FWt30Ypt1SL/1UV4DD5+KKTesJva+aaPSj8rVp0/Amkf/ljc
	uKFvJ2fxVhwVDmOz0W1ThgbIRlprJWvTs5yF9AQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:qyErXaUNoSfBuFl6tl6flP9cK8g9RJSj/ZR/bKAkC40=:0OINjBzUgfq3udtQxoCTHXGH+jsqc7bmQ47D4WpdvIk=;
X-ME-Sender: <xms:TjfSam0YbROYPNVfP7ecFpRYKYgYiKUWWWGZtWh3Mab-XrfHTQUvFQ>
    <xme:TjfSalATJp080vU3JdEPV55Unk55iZxUM86zlh031lef0YsOuTQpq1x8S5BUQiHs_
    opxpqK0AHN8BkOwfEVeRytSkAilxeT9xXDbij1pOjqkNTVlxFq5GJ0>
X-ME-Received: <xmr:TjfSalC1MQ9AnIT7otAxtCymFb7NsLwMFC0A567Sufm7SFMArzf6VBPjV20>
X-ME-Proxy-Cause: dmFkZTGXHfcSLLQdNmUBrh8iVg0mYe5Otx4TEolme1BT3Ui+/AiTgIVzb4+TEe6FzVwFQj
    psr4zEC5sqQkXAzY8D5ZGT5LvAg88fz6e4MY2ys09QnxzyG6IrSYcTsBWki0MGy23JhK2q
    zl+K8zxFdWYC1+i/B2TZYNHE3MFgG37Jwgbmr8qXYQjDs3jKlZFpNY4SIXQ0NlyexYUvBG
    lBepFWZBqfzPSL720Ucz0JOnCApwGFq1Tk5AdO2eUEDRl2jY4/QzDI8itJ16lamREZmZAi
    fdTOq4JHhsam1qQOyJYdmyQaSQJvgHb5axgJGoPYWDiShD54RmB5DkXZlLVfYNFa7Nvcfd
    4nBZeeYUw8+ckhzo5dL4ZWEI5R+go4pvNaytqcEZ/I8LcnPwz9e7d8izoiiX9dWYoI61b8
    9tKSOShgnZ5EFgnxe2jVSWsxY6t4tUV664w/XkscSTgI+sRrSRXnnHOMD/vf5BJ8RuQrxR
    Yi9iIoYITD6sLJKDIfk+6rVGVBVYIIR6PCGtt5zR5jJBXaLX++Ex1EH3I67bFM6NvG6KIp
    CDuBmPbBeStRlP9edKBOXakJ2UPV+cYu3s+6UD9R3JaQOlR+9aWAsPxazFtG0ZHcpc0dUt
    ejhfEPX2+oJtg5VeVb/xrXx2jb6g6iWXYmP6/2wk7FPq7TwHd7bsSa5aJO3A
X-ME-Proxy: <xmx:TjfSauPrdclSOysNh5lPcHwPFpu-AgIq8N4ZFrXNV-qMxLtC1b4afA>
    <xmx:TjfSanMUJxXDfOXS57dWhl3osncdfoR6X8wpuQDlL-Q08UZWFXFW6Q>
    <xmx:TjfSaquiL09tv7G0rx1DbzB38LVDLgd_v8dBg9h4DyCf8THjBoxk9Q>
    <xmx:TjfSak8EsQ2QXHxyD15RbhDDDqYVFBKUP8S_i6s3b_mUa_BN_a-3Ag>
    <xmx:TzfSaoBPvS7c6nIP5WWGSbmkkhBCMFeCdo9EGpZCzf2ynBIGkUAZ78aE>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 16 Oct 2026 10:40:13 -0400 (EDT)
Date: Fri, 16 Oct 2026 15:40:12 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>, 
	Ilya Gladyshev <ilya.gladyshev@linux.dev>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Improve page refcount scalability
Message-ID: <atI0edrmeiRuRtNQ@thinkstation>
References: <CAHk-=wjLjgfwgSZ1RDk4YdNFcV0ntosMO5AmBoHD76Zb3HFY7Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wjLjgfwgSZ1RDk4YdNFcV0ntosMO5AmBoHD76Zb3HFY7Q@mail.gmail.com>

On Tue, Oct 13, 2026 at 11:43:14AM -0700, Linus Torvalds wrote:
> Comments?

There's a regression: the lockless read loses on large reads from large
folios.

In a 64-vCPU guest on a Threadripper 7975WX, 1 MiB reads of a cached
ext4 file are 9% slower from one thread with rcu-free-v3 than without
it, 64K reads 4% slower.

The reference path looks a large folio up once and copies it in one go.
The lockless one walks i_pages from the root and calls
copy_page_to_iter() for every 4K page.

I've added a cutoff to the lockless path: if the folio is large and the
read covers more than four of its pages, leave it to the slow path,
where one reference covers all of them.

		if (folio != prev) {
			if (!filemap_read_rcu_can_copy(folio, index, *last_index))
				break;
			/* Many pages of a large folio: one reference is cheaper */
			if (folio_test_large(folio) &&
			    min_t(unsigned long, folio_next_index(folio) - index,
				  DIV_ROUND_UP(offset + iov_iter_count(iter),
					       PAGE_SIZE)) > 4)
				break;
			prev = folio;
		}

With it, ext4 1 MiB reads match base and 64K reads are within 2%. Small
reads do not change. The cut is on the folio, not on the read size, so
files in 4K folios keep the gain on large reads: 1 MiB tmpfs reads from
one thread are ~30% faster than base.

Sounds reasonable?

I've pushed my tree here:

https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git rcu-free/rfc-v1

I'm thinking of posting it as an RFC to make it easier to review.
Objections?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
