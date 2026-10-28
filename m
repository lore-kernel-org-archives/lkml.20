Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793207980;
	b=F31wZsIoGg6krsrXsa7s114jM7QwmxgXBy5dlAE1k8RGG5ykWv4spUitgqss44QdgGRl
	 gQ19nC1VbzS03TbLhj9/Udt4Wa1akGPkcC+uZqqpZzFfyUs69p0QerCWmr6vKlnIKEjB7
	 J2BfmwuVO+X2aJrhi+G3XXtp7sVzCUPWLEz/xmiL4D5oEqemE9DzatOZeKKabpnorQJoE
	 cmSTpOoi6/vWOgyPTzx02Dj0BVNR16iTox7nvUPISO6JhbWuBTl6C+hXjcRto31UzrUjh
	 cHIhcz9+CkPOHNfztfMzCK1+pI6ySDVEOGb1aAsDnPuo5gsqthnj5JP31r3W4Ab+fJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793207980;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=lAWulrjtYt7mxpMPX+OHNKu4/oFhSzNqEFCQHqnzkJI=;
	b=0PoqWKSh/+DgC90LyYvRyM0WGhfrZUTAEMP5h2ZwB3zQB0rFgb1AcAWWrwC1BPuU0VQG
	 C7Vke9CT9P2IE/ZHTA6B8vZYZh5LKceEj57BJ0Y1kHNVoeLcNR/Q7qxvjBnKoZJGve928
	 zAMbyrg75k2xS48aoBsJy6Rf7h9dfzWCd2Tw7piXbvYb9Kn76Hrcm9+03Ok6cZ8C8zRQv
	 FQRjJdAi7FWdByVOU73mTNAV/TaAP8o1+qkMiJy6+IU1wFXCv2ppKPdP80gM/gAaUSALd
	 eDbUZtKim8/C+bnIknYKi4ZKzNFrvC+hXLqYZJHJVo/OYq8X3rzbUM5PyQRFQmOQgSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=QiJeCnIE;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF446606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:19:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF446606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=QiJeCnIE
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1a2761c69fbso2848691c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1793207979; x=1793812779; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lAWulrjtYt7mxpMPX+OHNKu4/oFhSzNqEFCQHqnzkJI=;
        b=QiJeCnIEkvTsz1dMLNll2jCBX1FloSjtzFMmwoNze9PuLefK0/khYJQiKGATDK5GpH
         +xf/JzDZWB9Ohk8VNkWWd/qxlACDRGpWM7Ln/oG/41lrjtbBTvpDqNAwB5S5YPKFKq0o
         +0iCEHlPlwhfj3J8tHOijpVV0fhl+VnhU1D0a3cVe6qOgnan55CwkqRt+zSJWaF++3ju
         bXoIbzzpBfZ3dA9bSuQ6mnAAKEwZWVZvHKBqn9bonmQ1m/A6k6rA9wgnxLdc2BIWCK9l
         auELyD2R1ND2X+Nphu/6cSQTvPgUW+B2U7CxLoKZxyjEURs8l7/Flshwmpy9EhTx1QtE
         0AlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793207979; x=1793812779;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lAWulrjtYt7mxpMPX+OHNKu4/oFhSzNqEFCQHqnzkJI=;
        b=afzuGAA6u8/UWogV0qyhnBDRlDYQyks00+l1+S6Wvc/ReMU9D20FbtjrMqaF01t6vU
         lX1LNKcc5MBJmVLooapRVU/D3ykt2X3dvVXKIuIr3qsdckwZFAwnIvjKQm2u2c6mOqaS
         fWtMrQkhOOQ7UBRg1OD1ujFvZ652sqHKAsGtuBIz5JYveKrLdMQ9rn8K63XpKQINMz2i
         C40XaD4gfBtNCpUIITPS18M4sQV61k+mTDg5fr6cH4UBtUvmYN/nu0JC2KGdZj3dWcpS
         OSuSXKqUsEqDpeDMZsg6sygDDGATYS5kkApkNUwtAeDhHYW86qp16CMgCu3w5G0Vi8uk
         jpgQ==
X-Forwarded-Encrypted: i=1; AKwUvBxjcFK+GbwWuoEcD/1cTpTkDCrm0sufNdoWtcnBPpVPLVe2asI0FIua94RdCg4IVv2zOyXZdXA8aRMTnkw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJS+i+2npyQ1eBNEwPC8yFNg1s37sZVXq9aK3A7fWqohmMWGW4g
	bwh2Ar7rKp1fRRTmCxoHx+FTA2tb6oxR9cerR1VDN8D1tPVUX0Ex+Z2oov7F21QFhys=
X-Gm-Gg: AYBFou2k8DOnB3v1okgWz9qluOQn81hTFV+y8jV8RtysfrwVtMcfgfZEQuqfNnoWmRc
	inGxVkoEgoDZkOsByz7l8vsZnLUatinI0DyXlCLFXbwwlfYiw8HGa0ZW2mefNCZ66iLuHBM0N7W
	arnFKKc5e+/gvzdEV05cAFKdWLBrd0OhsOnK9nXgo5U9XnRoXOlIIOnbmTpvuU5jBhBkFoU8YJr
	X8KtQlYz0mM1nde+Gz3XE7U77/6y5ffWFzulzyLsE6/ByNqO7aP0uk16t2yvpUH7hmo2TahoGVo
	U6KNWGzEzPKc5gjzWEeG7N2VuO7wT5zvTvmUM3bap5s9+YteISS80ECYNOuqOpVJ7BaqtPgCQU1
	V7KyEDNF5SM6RNnDji8kanERhPAo9LlSoxyCpzepUybQfejLRFqy4M64Wj7pIs88v9SCm8LWCPZ
	JX92R+xQWxJvyzXM7V+spDLg/Kuf6tv5wdYe3T0gzrD+nMOa7BAnfc5BCjxZAvOU18gTaaT/Nj0
	kj3Lb3rTxsmQv6z/DjCpy26x2WAhdM6L40VKEs91aXCZ77GrP7A2SH1UFpqn01OHNrzsI9G2Tx5
	K+XpEJPDoBobk7+iSTlxw2XamnmWeKNVhZi643h3baXq4G1kcZx2wkSpa7jPtc4lLcVCJtU=
X-Received: by 2002:a05:7022:7f0e:b0:144:c127:dd1b with SMTP id a92af1059eb24-1a6cef7a4d4mr4060949c88.39.1793207978208;
        Wed, 28 Oct 2026 10:19:38 -0700 (PDT)
Received: from medusa.lab.kspace.sh ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-1a75e5c6d4fsm12731604c88.14.2026.10.28.10.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 10:19:37 -0700 (PDT)
Date: Wed, 28 Oct 2026 10:19:36 -0700
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Haris Iqbal <haris.iqbal@linux.dev>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
	Keith Busch <kbusch@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Subject: Re: [v3 for-next 0/3] block: delay support for error injection
Message-ID: <20261028171936.GA122209-mkhalfella@purestorage.com>
References: <20260928221634.43239-1-haris.iqbal@linux.dev>
 <20261022202326.GB2931-mkhalfella@purestorage.com>
 <7efb1e79-f4a3-48a1-a08c-20eeb6369bbd@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7efb1e79-f4a3-48a1-a08c-20eeb6369bbd@linux.dev>

On Wed 2026-10-28 15:51:38 +0100, Haris Iqbal wrote:
> 
> 
> On 10/22/26 22:23, Mohamed Khalfella wrote:
> > Hello,
> > 
> > I wanted to use the delay injection for a test case that I am currently
> > working on [1]. Are you still working on these changes?
> 
> Hello,
> 
> Yes. But currently I am moving houses and hence did not get a chance to 
> look at the comments. I plan to send a v4 with changes based on the 
> comments next week.

Great, thank you. 

> 
> > 
> > 1- https://lore.kernel.org/all/20261022185920.GA2931-mkhalfella@purestorage.com/
> > 
> > 
> > On Tue 2026-09-29 00:16:31 +0200, Md Haris Iqbal wrote:
> >> Error injection can only fail a bio today.  This adds a delay_us option so
> >> that a rule can hold a bio back first, to model a slow device.  The delay
> >> happens above the driver, so it tests the code waiting above the block
> >> layer, not the blk-mq timeout handler.
> >>
> >> A delayed bio is marked with a new BIO_ERROR_INJECTED flag so the rules
> >> are not applied to it again, even after a split.  Christoph asked on v2
> >> to avoid the flag by allowing a delay only together with an error.  I kept
> >> delay-only rules, as a slow device that succeeds is the more useful case,
> >> so the flag question is still open.
> >>
> >> Holding a bio back reorders it against bios submitted later, which breaks
> >> sequential write ordering on zoned devices.
> >>
> >> Patch 1 is a prep cleanup.  It moves the rejection of an unknown status
> >> tag into the parser, because patch 2 makes a rule without a status valid.
> >>
> >> Tested in a VM.
> >>
> >> v1: https://lore.kernel.org/linux-block/20260827000115.128093-1-haris.iqbal@linux.dev/
> >> v2: https://lore.kernel.org/linux-block/20260830012002.80275-1-haris.iqbal@linux.dev/
> >>
> >> Changes since v2:
> >>
> >>   - Patch 1: return bool, rewrite the commit message.
> >>
> >>   - Patch 2: drop __submit_bio_noacct_nocheck(); the flag alone stops the
> >>     rules being applied again.  Log the error when a delayed bio is failed.
> >>
> >>   - Patch 3: trim the documentation.
> >>
> >> Changes since v1:
> >>
> >>   - Add the BIO_ERROR_INJECTED bio flag.  v1 only resubmitted a delayed bio
> >>     below the injection hook, which left the remainder of a split going
> >>     through the hook and matching the same rule again, so a bio was held
> >>     once per split instead of once.
> >>
> >>   - Patch 1: tag_to_blk_status() returns an error and passes the status back
> >>     through a pointer, instead of returning BLK_STS_OK for both the "OK" tag
> >>     and an unknown one.  A delay-only rule has no status, so the two have to
> >>     be told apart.
> >>
> >>   - Documentation: a delayed bio is held once rather than once per split.
> >>
> >> Md Haris Iqbal (3):
> >>    block: Reject unknown status tags in error injection rules
> >>    block: allow error injection rules to delay bios
> >>    Documentation: block: document error injection delay feature
> >>
> >>   Documentation/block/error-injection.rst |  39 +++++-
> >>   block/blk-core.c                        |  14 +-
> >>   block/blk.h                             |   2 +-
> >>   block/error-injection.c                 | 167 +++++++++++++++++++++---
> >>   block/error-injection.h                 |   1 +
> >>   include/linux/blk_types.h               |   1 +
> >>   6 files changed, 192 insertions(+), 32 deletions(-)
> >>
> >> -- 
> >> 2.53.0
> >>
> 
