Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793331146;
	b=dSH60DCtLCJAQG4n5bsST76XulkeK2B9N9+qi1Az71+asskr1l8JvbiNUXAoCcqo+rrM
	 oQ9SHKtKxl2hHHO8gVvsa+VJBHQ9+8IHEWxz9N3LJikEMvnc8RY9kaQT8YvJ9L4N/z4Ez
	 K2bv6tPjDq50HY+EyqMyyXZImlcW3Vouhnz/gsaRWQu4dDq8y/xl2vXj7yTERySpUJQ+a
	 EF87jKUEnDOq6O/fwPmTivLKr2gZ9r6kb0xPLZKYu5TrkQN2x15q4LFUnEFNJRImo4bMC
	 z4xmZGPAnqAR5NkACVYdVxiWpvsatO7cqfD5qC5krMnaVS76qkop+hZvQT3e9ldToxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793331146;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=xPP2Iq+jG/OXOp1muTW4wEvJS9Nxy1yt91NNhV76NRc=;
	b=Jy4bnKzd0B/DESk4XxWAr0/PbOd0975+2t/mZDHs+hll/V2J3duVkoJlE92bnfmtbAGT
	 QmNWHWIjB7QV6c47NwEdRMtOTA4J029aBeOLk/7M8lzz97CGyt8HpLGXgK0ap/Uhcya5o
	 4f1KI74hFfm3wP1HuM+knWDgwDhxtjAr6j/j+OlpPYsa81YwzjLOlpcBEbTINiohHbC4I
	 UDTOysdaojGK9TuH15m59OSpUjIDWFe0gR0YAcEtXD/MH764wYRCWs9E6bKIzk5tcXEeF
	 0lP6XIg1x/CsjpF4wWhWSOVRw+t7cQL5XXt6Tv7/9HXxWGBsWfBn88z2XlRPCHCBv/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hY7WxPts;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B518606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:32:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B518606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hY7WxPts
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-156cbe59524so210120c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793331145; x=1793935945; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xPP2Iq+jG/OXOp1muTW4wEvJS9Nxy1yt91NNhV76NRc=;
        b=hY7WxPtsWjkTqkdfESwA+2iZqA2DIbhW2bMUHDGRQcQrxl104W+MLpIWNI8Iqaca2c
         qudjtjfNRzj9z43m2QXk1oawndAx6xZ1J+Khsf/PpCfynqpKT5I2XacIqiyIl0P/EfSG
         pITmubLtXFOxycCGUP0tyh9c1nFVPKE8jvL9l0SMfD599Wxq5TafvsVb8EnNvMrIe3ae
         Q1ccW1Dpq5gRAIAp8HqXvO7FLnlg48LFjFSxowOMjNa9nu3CnwU2mlNNQjH1HXX35tQd
         gmhUg49Ht+rTCJfEzJTrN2Y0KKZ79NCeRsHBkkf0ra/GZ9Asdmmno6dcl/pTDqxeNz6X
         MEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793331145; x=1793935945;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xPP2Iq+jG/OXOp1muTW4wEvJS9Nxy1yt91NNhV76NRc=;
        b=hHkqzxKFQQ2mPFS6xMOMv1eabanD6VfYjspco2/lhbJDMY8eduItb2NNJaImrbijdY
         xmkl7MQPcLj71s5PRQ/VJ05d8F1x+tFA98MNfd68XUkMPX1SbFzgTxA8wNbHo7vyI6Z2
         TmPY9UZzET7pwcx+7KRw2kjzp9aTGOZJOOc5AA87wos4iC8A1SJFAoa3ysEu++Lk8p2I
         Mh9NIA4fc6/Zx+tBw8VzXC1g7MIDmkXHw/L8e05EwugaZq/Hi34HqQ00yUT8yKd0OHXz
         GioQ5SZtUtwbE8jhIqusXspGEsI4B6M7q0BdUmGG7u0wCO0fH3uydpfkKB0SjfupOZ6P
         tDOg==
X-Forwarded-Encrypted: i=1; AKwUvBy4AL9Ft8ue2fUbRFKGAl6CHAwu0f+d4lqakhyHrnOjDhWqMS+biak8ZtrWzwDxFKRFIWF2HsXRAqdO3us=@vger.kernel.org
X-Gm-Message-State: AFq9FYKeawdupVf1v7coK3B1uo/pDx0zGQgBDsiu0madX0MxRV5t5zUK
	daBpMe3MJF8SpQii540/Y47dNZVekeGAo9VRL5TV3V9MZrOK+x14BqTF
X-Gm-Gg: AYBFou1NBXH7rHBXlSH4G/DFnIsR3aa+ykoId0xX1Z0AdRvCkfOVUqilFgO9fkf1Lk5
	99C5juge8yyeMTZJWawnxYpG0ie8/kSjhiG2ZN6S8rkCEnTyvmeskUtDlZFpu0f3Ll88+W6la3q
	IaisaeWhp+aXaU59OyzF3L4EAQPysUkMdnqOn5DU8vuPTZauaDJjPvQu4JTpcSb//QE60gYlRMX
	YE0hwRhAuC3XZzxVmwisQw8MolsjdHytwG93ssYGQx3n+8wQ9TH8gbdKm4jFpkBczypvpC2szwK
	XA545MD+zvklmRJcDet5NJyjCmXjdKzT6qWZWZ2kcto4YCOp0Mq3kLxOXPhN3xWXmKCzQvat++i
	XYNgWHy7PkgXHoonNSXAByTWhCLRitcOpgHB0TsHgjc/gOkz2lvYelS7UbL5uAQNR0QnYOjTQUl
	vWfNHBk4pMcYOQWewFD3TVtdmJwJLukB0fNoMmMGgoLT9pEg9Cc4PXajoe9GYFRW79XoXH96fox
	1EYTz/oEXGIilcDLdDoIZaQq/8yqjOEAVKlcvPbbMA7wyR8HEYqAnXeZg5Uqg/9C5A7H0SAo3Jd
	D55XnzZ9g9HgwIXZn6YyenJEA+tMJQHtw/4bHvgewX8U/gCEnA==
X-Received: by 2002:a05:7022:121a:b0:1a9:cad6:5b58 with SMTP id a92af1059eb24-1ac5ffe5b8fmr1322800c88.39.1793331145164;
        Thu, 29 Oct 2026 20:32:25 -0700 (PDT)
Received: from kernel ([103.219.206.15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1b0a628bsm2767972c88.22.2026.10.29.20.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 20:32:24 -0700 (PDT)
Date: Fri, 30 Oct 2026 09:02:19 +0530
From: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: David Laight <david.laight.linux@gmail.com>, ardb@kernel.org,
	Jason@zx2c4.com, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] lib/crypto: aes: use memzero_explicit() instead of
 memset()
Message-ID: <auQPw4dFFZM6XPV4@kernel>
References: <20261028142636.5888-1-raizudeen.kerneldev@gmail.com>
 <20261028155134.GA4041913@google.com>
 <20261028205633.7625d789@pumpkin>
 <20261029173119.GE1862@quark>
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
In-Reply-To: <20261029173119.GE1862@quark>

On Thu, Oct 29, 2026 at 10:31:19AM -0700, Eric Biggers wrote:
> On Wed, Oct 28, 2026 at 08:56:33PM +0000, David Laight wrote:
> > On Wed, 28 Oct 2026 15:51:34 +0000
> > Eric Biggers <ebiggers@kernel.org> wrote:
> > 
> > > On Wed, Oct 28, 2026 at 07:56:36PM +0530, Mohamad Raizudeen wrote:
> > > > aes_gcm_decrypt() and aes_ccm_decrypt() use plain memset() to wipe the
> > > > output buffer when authentication fails. But the compiler can optimize
> > > > that wipe away, so use memzero_explicit() instead of memset().
> > > > 
> > > > This matches every other sensitive wipes in this file, which already
> > > > uses memzero_explicit() for keystream blocks, tmp buffers, ctx
> > > > teardowns.
> > > > 
> > > > Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
> > > > ---
> > > >  lib/crypto/aes.c | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/lib/crypto/aes.c b/lib/crypto/aes.c
> > > > index e1c191551736..7814ef525239 100644
> > > > --- a/lib/crypto/aes.c
> > > > +++ b/lib/crypto/aes.c
> > > > @@ -1733,7 +1733,7 @@ int aes_gcm_decrypt(u8 *dst, const u8 *src, size_t data_len, const u8 *authtag,
> > > >  		 * Clear the inauthentic decrypted data so that callers won't
> > > >  		 * receive it even if they fail to correctly handle errors.
> > > >  		 */
> > > > -		memset(dst, 0, data_len);
> > > > +		memzero_explicit(dst, data_len);  
> > > 
> > > This isn't for "zeroization" (making the data unavailable in ramdumps),
> > > though.  It's just so the caller doesn't accidentally use the
> > > inauthentic data, as the comment right above it states.
> > 
> > It is also a parameter so has to be zeroed anyway.
> > memzero_explicit() is used to clear on-stack buffers.
> 
> Well, that assumes link-time optimization is not done.  The kernel
> supports being built with link-time optimization.
> 
> I guess the motivation for this patch would be:
> 
>     (1) Shut up LLMs that think the use of memset() is inconsistent
> 
>     (2) Maybe the caller really does want "zeroization" for the dst
>         buffer, even on failure -- and this guarantees it for them, even
>         if LTO is enabled, without having to do it themselves.  (Though
>         on success, they'll have to do it anyway.)
> 
> So I'm tempted to apply this patch anyway.
> 
> But the zeroization stuff is getting kind of annoying at this point,
> when it's unreliable anyway (it's not like we zero out the registers,
> which can then be spilled to the stack and/or written to the task_struct
> on context switch) and can even be counterproductive (by forcing data to
> be written to memory so that memset() can run on it, instead of kept
> entirely in registers).  And Sashiko likes to flag them as Critical
> issues, which is not at all accurate.
> 
> - Eric


You are right, the confusion was caused by my commit message. I said the
compiler would optimize that wipe away without mentioneing LTO, which is
the key qualifier. That only holds under LTO, which I should have called
out. Yes the comment above the memset() makes clear this is defensive,
not zeroization in the rampdump sense. Without LTO th caller is opaque
so the store survives it, but with LTO the compiler can potentially
eldie it... memzero_explicit() prevents that.

Should I send a v2 with just the commit message updated with LTO?
