Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871A143713E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788275038; cv=none; b=FPy9OPeANe+shvvaoUkDHoEwPW5qdgigpVHuy225AOivcoEA/Vbd2ZXzRaTJLGyMUt9tUEUFMi0sJHmKo4Cxj2lIxrBPx8DwVWe3xhvcfZ5L9FYPhmAa6Z8yZ/TQxwPOtjkUcAMHkb8IjvNr/3Ob1UPZnt2HWXqdjVESrO+bn/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788275038; c=relaxed/simple;
	bh=EV0luyxrE4VBTkjaX8NMlEgGp6/Xt54MDGLWoiypEoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H97vVPGMhzDoBCjTdh7JF8Q8+WanzF15bd6+GQ39EdtQjlUJXfDMMIgCBesAbwjJS++8oORBAIwkLC675ncLGq7i0HdnO1Up+7RC/QRM8IGazP29Vq4sE3dIarz7WV+X+uTx0nLXsqFkod4aDM3y4R+x4EgHDK16jLaTXoUgMTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=Wc/NGc2k; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="Wc/NGc2k"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8518b3ff3e9so4807760b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1788275036; x=1788879836; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nYjWdRobMhFwnScsH6QAuV5nfOH/dqs6pUr1givzmCo=;
        b=Wc/NGc2kO0hzZ56egklVW7Bp/A+N/J5dMOx8cO+Fat/8MGLbBhMCxs25SAk+snlk24
         GrEvL15mi8KVN3ghZCWWW4yN2zro9/mYHvgvXsVUv+gCPUPnlbxmVGZFfnmY9bvJD0XQ
         VHX+SyydAbVZ+QR2RNX4kF+HeMpFuCWgR9iiPOBibCtYqgbymHit+hu3Q0rZOWprBtDU
         JXW0c4xh8EI4QVDmwsKfBGGxFOYpQodICoYS5E8QyVDprYHy68f1cZMDLldKDLGLWb4W
         wNyRL2G8tcbFv48TtwC9mPIm6ahqYgRZWLoxfzNdtdLVsuZQaou/7ovWS8SBus8OwFaJ
         N07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788275036; x=1788879836;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nYjWdRobMhFwnScsH6QAuV5nfOH/dqs6pUr1givzmCo=;
        b=no3mXpJ/jSY11QU2wwUqGSSjEafhzR5dd6lrNQOwhIqRnQwc7D4KSjlpZDeKYk+YsK
         5qOjwR2iJxbWyZPwKvzfwBxxjd1hlXSw6+bLkU5gl6P2RrWpSBmy3AcnymTXAg4LDl+q
         ZdyYXRacfj6LogL9jQaS81Copn+8hKjuLmfnerfuX5sQh4GBj+RAQxo1zPfzRzFmev2I
         gV41dezMJNzld5nuQehpou8lrj7P15eul/22QQ54CAz//Nodx7SqyNjxTv+gNBg4WAGZ
         2cBDaiKcAynO2ZxeBZQw/sOxQtQeeCYAHJ20R4Ykj6mFTk4554Sw/4aJVg0PL3cm4KIg
         xEPQ==
X-Forwarded-Encrypted: i=1; AHgh+RpikfFVexsNu1CDi3k3ucqDxknD7IbRkNBjmZGf0QSx/oXkW20tDhIoi3DR7F6+VVfs+PyiF0auuYxaYzY=@vger.kernel.org
X-Gm-Message-State: AFuF++moaOd1B3GI6XHGV/2mgQ2XSPz1O7qQcVBE5zWwvVbxKHcd5KJP
	LSkl/j3RMmXGnn1to4nWIeJ1QsqiYpZ4/fLxZXBVbWdjRaK5Rr/rBGUtxQBbN4xj8es=
X-Gm-Gg: AR+sD10yIQ103umK9iSrDnh7Qw1HqM55FYmpQnTlmvvX63Tuno+SSE39f3g5YGpHRAb
	Xa2u4zBSQ5N+XhD2yQnYqtPuxmSuLP3kCCeVe9HQXZejXTH7p2KqH/Y7vyFLKFdbDcJGhSF789D
	PJdgVDQ3dW0bIFOlHOPcdVo0TE2ZF1WHBPenM6964vb6ikbBj386By2K1SC7LAn/tnnRkRhdUxG
	fQ5N4XXq+wUb088OWmOKZr1gygbiht04TUzRLQVQy/ygooWz0/ePygBBXO0Y5Sa62Rg7QD5jX0Q
	TBu1iBEdKqszoOfBjp73rf/eVJXsrtG/46XkyCIQgperfZ3+7/8ZoQHlWjd9rVyzLqu+Hl0SzG4
	JWgApSEca+Mb056+2ZDpquHh6m+NimLuiISSBnpwT/YynDflVy10R5Tt51FswAXUCuDY81RQD1I
	uLXfpN3H0md/AejcDMoTq+Sd/K6/vU+M56E7Q2qudCONU=
X-Received: by 2002:a05:6a21:a0a:b0:3d0:abdb:de03 with SMTP id adf61e73a8af0-3d7ad788edbmr15943018637.2.1788275035650;
        Tue, 01 Sep 2026 08:03:55 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:4c::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f32f727bsm6432687a12.7.2026.09.01.08.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:03:54 -0700 (PDT)
Date: Tue, 1 Sep 2026 08:03:54 -0700
From: Joe Damato <joe@dama.to>
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Kalesh AP <kalesh-anakkur.purayil@broadcom.com>,
	Rukhsana Ansari <rukhsana.ansari@broadcom.com>, horms@kernel.org,
	colin.winegarden@broadcom.com, linux-kernel@vger.kernel.org,
	raphaelcf@meta.com, stable@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH net v4] bnxt_en: Bound SW TPA IDs to prevent crashes
Message-ID: <apbpWrfu3VQu+CUz@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Kalesh AP <kalesh-anakkur.purayil@broadcom.com>,
	Rukhsana Ansari <rukhsana.ansari@broadcom.com>, horms@kernel.org,
	colin.winegarden@broadcom.com, linux-kernel@vger.kernel.org,
	raphaelcf@meta.com, stable@vger.kernel.org, llvm@lists.linux.dev
References: <20260828190900.1767611-1-joe@dama.to>
 <1c87458d-7d76-4da4-9981-51756cef391b@redhat.com>
 <apa9qofhuatqGTra@devvm20253.cco0.facebook.com>
 <b8b6db7b-353d-4d6a-b0b6-3b5e1be22008@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8b6db7b-353d-4d6a-b0b6-3b5e1be22008@redhat.com>

On Tue, Sep 01, 2026 at 02:10:04PM +0200, Paolo Abeni wrote:
> On 9/1/26 1:57 PM, Joe Damato wrote:
> > On Tue, Sep 01, 2026 at 10:16:54AM +0200, Paolo Abeni wrote:
> >> On 8/28/26 9:08 PM, Joe Damato wrote:
> >>>   - Moved bp->max_tpa_roundup_size init out of the early return path and
> >>>     documented that TPA is unsupported there, as suggested by Michael.
> >>
> >> Clashiko quite convincingly elaborates that the above is not enough:
> >>
> >> https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260828190900.1767611-1-joe%40dama.to
> >>
> >> Could you please have a look?
> [...]
> > 3.) "The new assignment sits after the max_tpa_v2 == 0 early return, so on a P5+
> > device whose firmware reports max_aggs_supported == 0, does
> > bp->max_tpa_roundup_size stay 0 while BNXT_FLAG_TPA is set? ..."
> > 
> > Michael commented in the v3 that this is a false positive, hence why I changed
> > the code from what it was in the v3 to this.
> 
> This is the comment I referred to.
>
> AFAICS the problem is that the driver sets
> 
> 	bp->dev->hw_features |= NETIF_F_LRO;
> 
> regardless of the supported capabilities, and that seams to disagree
> with Michael.

OK, after re-reading this here's what I see: NETIF_F_LRO gets added with no
capability check and bnxt_fix_features() won't strip it afterwards. I think
the fix there is to add a BNXT_SUPPORTS_TPA() test, as a Fixes for
f0aa6a37a3db ("eth: bnxt: always recalculate features after XDP clearing, fix
null-deref").

I can send a separate patch for that, but it is unrelated to this patch which
fixes a crash on boot for Thor2 devices.

Maybe you want me to spin a v5 that rewords the comment Michael asked me to
add which is currently technically incorrect, but will be correct after the
separate bug mentioned above is fixed?

In other words respin this to make a v5 that changes the comment to:

  /* TPA is not supported at all, so there is nothing to
   * allocate.
   */

And then when a fixes for the above commit is proposed, the comment can be
re-expanded?

Can you let me know what I am missing here?
