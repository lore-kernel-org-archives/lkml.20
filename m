Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479523B71DF
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787874068; cv=none; b=CRkDBaQQsL3/bDevwTFMZyYgBfFAaHl3R842g8PZPdlfxY2Ae3rppI/upJ+BrnXuy/pybIhbZehpj9wCTvYWQTmK/I13f/fVGW8rXuIq/85Q7j9DW0FA7BIX8KmbTcejv87o+iscIsfAJZhFKow2vAZ7/xfJ3ZmQAdUDlUgy/50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787874068; c=relaxed/simple;
	bh=VhXID8Q2Dlk7SGe+8uD8VtqeZ11RIRSkFnVIvMqoK1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M14q84aEIEXqc7KG4/Nc+fZ3teRFsRp+F9LFv4FLG557MRqNeTDeX5wQz6NmVCzOdVuoxpiF11ifHPcDa8JUzr9iTw+7SlVoeNmRvBCaSUU3uc8oLT3SG/1SkNr2fghHSk1imX0ypv4tFzn1QNBwvw1L4QpRz2nqmSom4rNjJYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=Wj4kbHJr; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="Wj4kbHJr"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso769044a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1787874066; x=1788478866; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gAjqfC0SW4nxG2w1tJx7WfUnmE/BSNkbt+YGxZxti/o=;
        b=Wj4kbHJraKww5MW0qB++UX3yBLjeqjvLWC5TVjCxGn8HsiYdf4mXM9gII73C9GbAER
         So4Pm+xsD4RXICdYcvRJ/WXMpDNISuAfJ4K6uz/cYlEjg7nR6zQKjfSqOVc07Kv4eQeD
         dFbXQfRggl8iWyexbPVw3y0dQsY/uLA9k+XNrS3VDeWWKvbsbIIuXcCkfnA3/PO37+IQ
         bMeFhCk6K2LY8bY+rRIsmD/sYipNHj28/hsR4edJrHeyn4ECBgPoN6wpLc1xW8Z2+dGo
         LnbEmmfrfrbRN1VvlM9av03JAx6YCJX0os+4A66yIDXfkLLZ1NdlaQNJJuuCpUukCpfu
         64NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787874066; x=1788478866;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gAjqfC0SW4nxG2w1tJx7WfUnmE/BSNkbt+YGxZxti/o=;
        b=sRuR7daxvJOUClf5uxE8zLqw7PccHXA5WAwVBCAiHB+KFVGla7mXDY2aXCABo+ifsE
         Tirihj6FxdxHlwjnWJn/O/ELsE8X6T+hYJBeyD/CCA2Y9b3PfeclwGxktc2KRJkxtr8o
         jCq/zflySo9vCWnzxT15aOAVIGcUN5OyFu6uLd0Z1eEW3/TCNq50w4auoS7gRq+YcqTQ
         4Ez6oWbA11kS6kO+1kUhfUF8VV3eHHyrwbRuQJsD9mZuYNtTEnXuNFDl81dxJbsSw/F4
         xwo9lZhM6/B2qknHuVpAyMerYVaKcwspcxrssWddB39HtjfvV6s3c+bSpxHpvSCBdTmL
         WYwQ==
X-Forwarded-Encrypted: i=1; AHgh+RrMgkLZrhi/xUU/To8d+54/ZFp0u0u3u+qcnaZdQ6xG3ke3K0aoO22NyEyU3WeVRFtQKhfRSeniywUoV1g=@vger.kernel.org
X-Gm-Message-State: AFuF++nANAwVxjofOyifRN1xRqPpNhhoRWvvYrI34jcpVo6mMeM1Ss6O
	pl4MwZdDE5ynZREXPo1NS7kbsgGNff3Nqo5DjBfYhjLoa3V2u7x1fojC5dtI4XPRtBE=
X-Gm-Gg: AR+sD13ZEW5T6iXnHpuqQFSpis39xDZutXl5ms6WPXOvj1ATdonB5eemRCoszu1Cf5o
	9lbRAid5Zh9O3Ejskb9RJK085EbJmTLZ+EoJhtnWzVRXtfSxCC9RS0DUUja/necyL/TNmAuIyfm
	q+inMk3nZX0EKyXMTevgVeQWAK4fBDX6r2TTJH+1++nVwZSih3dsakTLHgpjulG29S3Yifg50Cl
	bNX8zG+h3+3k/8wZEgZioTOgf27cyeFwWhuXrvtcJ2RWL0Jd2PmLvGnCatvssmRVRUEplRC6m8w
	93YxWo3Gn2uz5YRM5tpuYF8EsUUD20OwJV6gwmnkHVe+NW36Q2FLU3jjib9yNQFBYiXEktcGkkc
	XbPVdlSTY/svtMGrnNCzsQ9LrWKb+wb5I7C3KUsIZsmiFcg/eLzOIPMK3hiovE3YXDJaqryDXaG
	lKhI6Eqiwvd4u/R/FqRYaunH3jpxfTBP4ghdmIaURGEQ==
X-Received: by 2002:a17:90b:51d2:b0:38f:26c7:165e with SMTP id 98e67ed59e1d1-396d0f8ffdamr5528045a91.9.1787874066635;
        Thu, 27 Aug 2026 16:41:06 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:74::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b1992e05sm4677116a91.15.2026.08.27.16.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:41:05 -0700 (PDT)
Date: Thu, 27 Aug 2026 16:41:05 -0700
From: Joe Damato <joe@dama.to>
To: Michael Chan <michael.chan@broadcom.com>
Cc: netdev@vger.kernel.org, Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Colin Winegarden <colin.winegarden@broadcom.com>,
	Rukhsana Ansari <rukhsana.ansari@broadcom.com>,
	Kalesh AP <kalesh-anakkur.purayil@broadcom.com>, horms@kernel.org,
	linux-kernel@vger.kernel.org, raphaelcf@meta.com,
	stable@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH net v3] bnxt_en: Bound SW TPA IDs to prevent crashes
Message-ID: <apDLEbEu1PLTGU+f@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Michael Chan <michael.chan@broadcom.com>, netdev@vger.kernel.org,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Colin Winegarden <colin.winegarden@broadcom.com>,
	Rukhsana Ansari <rukhsana.ansari@broadcom.com>,
	Kalesh AP <kalesh-anakkur.purayil@broadcom.com>, horms@kernel.org,
	linux-kernel@vger.kernel.org, raphaelcf@meta.com,
	stable@vger.kernel.org, llvm@lists.linux.dev
References: <20260827185700.2157164-1-joe@dama.to>
 <CACKFLikJiCdjej4ezF=U16Leef3oAjSZGQAyetRnF=nLRvUfZA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACKFLikJiCdjej4ezF=U16Leef3oAjSZGQAyetRnF=nLRvUfZA@mail.gmail.com>

On Thu, Aug 27, 2026 at 04:07:16PM -0700, Michael Chan wrote:
> On Thu, Aug 27, 2026 at 11:57 AM Joe Damato <joe@dama.to> wrote:
> 
> > @@ -3831,6 +3834,7 @@ static int bnxt_alloc_tpa_info(struct bnxt *bp)
> >         int i, rc;
> >
> >         bp->max_tpa = MAX_TPA;
> > +       bp->max_tpa_roundup_size = MAX_TPA;
> 
> This is strictly not needed.  If we return early below, it means the
> chip does not support TPA at all.  We skip allocating the TPA array
> for every ring, so it really makes no difference.
> 
> BNXT_SUPPORTS_TPA() will be false if we return early.  LRO and HW_GRO
> will not be supported.  So I would say it's a false positive from
> Sashiko.  Thanks.

Sorry, I should have been more explicit in my last message: is it worth a
respin to remove this? Unless I am misunderstanding something, it's harmless
and while not necessary, might be more clear for a human reader?

LMK what you think.
