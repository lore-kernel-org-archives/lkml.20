Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F179A378D72
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 22:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788215225; cv=none; b=CEr11huHpK5wWizWmNDHn4s7SBMXjyD0L/PyZ/nwuHQlwOfk+PR0u/2b/Xoz/baSX+dlWWS7ojmpPTznfnuV4Vsw2yBMgyHXeh1PGSBo/zB2j8pcTJV70pXa/MdeZporrhLNn7MbnDTnUP8e3l7T6BkJx9IxFJ7JEd6B6snvnSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788215225; c=relaxed/simple;
	bh=ObpDhIDtaPFmVq1A0Tfct/Zf70yCF46d39cW7lRwX6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nZfWwA6Y9IiRiryJNDCSxsrckcj/Abbt7FOcOvTu5+RcVNVIk+BnQxU+TtmI3RUjYybCcpvIEgKwWAJ5H3Zbq7ZB8Kib2NN88enXa/hSgbE2VLTfWXKr0h1QzougcrmnclBjBj+/2MsTL91aa8V3pR6KK+J9+/EVxAj6j85KrsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r0nnaIXB; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r0nnaIXB"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d3b445a84fso18105ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788215223; x=1788820023; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IRt+Et4enRDJl2yrF6XadJrav4xwHstUxCtXFADfmWk=;
        b=r0nnaIXBLQg3HouHh9xNno2uiHdoG2++IAooMXfecW+tUGiKo0dIzNE058KIdFM1Va
         l6nMM2Cq5QI3QgR08ec6VZbQHQwtpueYAxaMFwxbkeOc60pEEEDFyjrxUq1+Xtf79ZYU
         l33hdPXv0eATP8QCCUCelnOvuOUKBqA01zLPT8Zaex0ome/47m53UP6rMjLWPq1IpEPK
         qYRh67muhk9yIna1AEV6lEZkEH8LjGhZTADAZ4MtzNF7Jv/X8ffKdo1OKJYRLlX+yT8J
         OWFW16AMN7+lBBOIHNLUrLhHRDprZ9rp3RX3VSbnhjGp5THX4OZFJ5zoDoBZqnJwbL1g
         XTFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788215223; x=1788820023;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IRt+Et4enRDJl2yrF6XadJrav4xwHstUxCtXFADfmWk=;
        b=ruL5KNdCynzDfrasOVzNkbW9gjUfr2SNB9ls7orKCWqCKdUv4U586yAbx9pbOhteRm
         itQHEYIIrAyz/LQMNeoIT6jgiAgBJQZ/oDrQiBvAddgME4gw/WJ8R1pv5mM0HK3adH53
         rhyw0OK/qkoCOrLopXQdVayoj3cwEFBgqM7JrJOGPwqwDM/kBNQ71tEJ3HbIoM0B1POJ
         IW0D9rR9IBeVMBNeIQpc/kFO8grhH0tCs8W8j69OMZMpiPodNxkLA5m3OBmJICAbBo9V
         2xThBAUQHxRF9V6VsKxQTnFinMm5vn9trhyBUYTwvEaAWeqVuh5c5jJt9RY1Wy8JRer4
         rMJg==
X-Forwarded-Encrypted: i=1; AKwUvBzjl5lYFJqaKtV2IktwJ6gqiIQlPeljMPiiL+lW13uDkjw53YGY4VaLzG9hWlnryveEJI3eF7WrX+ASyc8=@vger.kernel.org
X-Gm-Message-State: AFuF++nYgjmPehV/Ab+QM5jh285QhVJKOq4l/8knL8sfwkVtR2ALwcrd
	/GQ4ZNC9csJTiYfQ+dS+Y6TiWBLtMvEAikyXjMNO82ButZP5s/w1X35wcFT7PHpm4BM0HUaJ70t
	Ntey4VA==
X-Gm-Gg: AYBFou3IkQQG4bxZBOXf4lbWYcd8Uvd2rsumFwMBgaTW6U15rd78sQxGN50TalRaSXN
	lmYh+atEdEwTdea5txxPHnrKiI/iv1vGvfwOrTNNGtWgmlKmexvyEi2D+JOWabzglL+k7rgznTo
	kZgeFlQAMcvpMV6v1Nmfp2YPB/ARvkvPwMCVnsMBOVMHDvk7e8zAJvW6D2hE9sgpXMThDOQvySK
	tMODE4BjzI1INPPCYS3b14t5JOz5hSDiswKRiz6eAWxKp0d9Ma78tbz/Rp3Ys9ZcVRblqCtEPFp
	TKi8BrgdJ5CnQySOkn51xZ23IDdUo4vwYUXzesi5hzUtMwc+A1KrG+KWDQ2SIwoCzrWk31EYvZW
	/PVVxHSO7jmOglbqwB/pR9icMDtoBnsO9WmNLo6UJL/8vED0W283Ch9l/hrtpGEbx+cIco/SBlO
	XGUXAHEi5nGEDa7XF5yeaZDY6H9Wydk+o/7dG4KfMx3UEKT9YXcTlBqeYUxpJb72mDRfE3XW49o
	a8v3J50rzW5GWzD8pDM60XyQyQGbnrwjbUtW65p+1PdLDTT10Bfe/l/0OCQvQK7Moc+IH/H/Jdv
	kOwkH/s=
X-Received: by 2002:a17:903:174e:b0:2d5:db3d:1a43 with SMTP id d9443c01a7336-2d95213ffffmr2991545ad.16.1788215222431;
        Mon, 31 Aug 2026 15:27:02 -0700 (PDT)
Received: from google.com (193.67.125.34.bc.googleusercontent.com. [34.125.67.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396d7759bd1sm5651120a91.3.2026.08.31.15.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 15:27:01 -0700 (PDT)
Date: Mon, 31 Aug 2026 22:26:55 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Suren Baghdasaryan <surenb@google.com>, dave.hansen@linux.intel.com,
	Liam.Howlett@oracle.com, ljs@kernel.org, david@redhat.com,
	willy@infradead.org, shakeel.butt@linux.dev, vbabka@kernel.org,
	jannh@google.com, arve@android.com, christian@brauner.io,
	tkjos@android.com, dsahern@kernel.org, davem@davemloft.net,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, netdev@vger.kernel.org
Subject: Re: [PATCH v6 0/5] mm: Unconditional per-VMA locks and cleanups
Message-ID: <apX_r59k4e-XiI-C@google.com>
References: <20260813193433.3318288-1-surenb@google.com>
 <20260829185625.f5ee1b2931818843a78af88d@linux-foundation.org>
 <apVhzM2501wSiGGg@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apVhzM2501wSiGGg@google.com>

On Mon, Aug 31, 2026 at 11:13:16AM +0000, Alice Ryhl wrote:
> On Sat, Aug 29, 2026 at 06:56:25PM -0700, Andrew Morton wrote:
> > On Thu, 13 Aug 2026 12:34:28 -0700 Suren Baghdasaryan <surenb@google.com> wrote:
> > 
> > > v2 version of this patchset [1] was written by Dave Hansen and per his
> > > request, I'm taking over this series.
> > > 
> > > tl;dr: Make per-VMA locks available in all configs. Simplify some
> > > of the per-VMA lock users now that they can rely on them being
> > > always available.
> > 
> > It's been 2+ weeks so perhaps a refresh-and-remind would be helpful.
> > 
> > But it applies well enough and is adequately reviewed so I put it in
> > there for testing, thanks.
> > 
> > AI review might have found a couple of pre-existing binder bugs:
> > 
> > 	https://sashiko.dev/#/patchset/20260813193433.3318288-1-surenb@google.com
> > 
> > and a small rusty thing which you might wish to attend to.
> 
> The binder bug is not actually a bug. When using VM_MIXEDMAP and
> vm_insert_page(), the vma takes a refcount on the page, so there is no
> use-after-free even if free_page() is invoked without removing it from
> the vma.

Exactly! I agree the refcount on the page would prevent the UAF.

However, we should still reject mremap() because this leaves the page in
limbo since it is not given back to the shrinker and also binder can't
make use of it anymore. I'll send out a patch to fix this.

Thanks,
--
Carlos Llamas
