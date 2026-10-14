Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE87D30B517
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970491; cv=none; b=nxyhGo7am6cQ8q/a88qtkcL0KbnIumhTval4FEy5Ki8WJPx5K1iwjA8+Msd3CAiMsR+MpuxKwqDMjOhhy1zOetF1yvKPAsnDwtIct1ZBlfGYW9rNVZzVVcC2rMSQ9XnvBTjh7CHopsFULcwNmfMtqRxiOPp7lUbSfVa6rZwQ01c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970491; c=relaxed/simple;
	bh=TV7JX2n5Idrq3SpvZlmZfMYa3lPEpCROHfKqL8FffIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WXfZN2AK+0cwu8Hs8gpM4Ddotv2SHuwEymZnsVQho6mCIaNwB5Cv+6wud8E3QESzE0i/wrQI0JYdeX+gLON50FUzGZvDGxTqH86pjzaDzebXOgHW+nUM3o9btnVIgyJxLbENmo8IAQNKV0Gc0JLxsLBGx7Nh6I9MXUXvTtM+6GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eatnyml9; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eatnyml9"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48de6a62a4cso1053684f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 02:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791970488; x=1792575288; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9pY4KLtlrbSAhzhD8CHnP37WDwF8VZOjA0J8k3iIcIM=;
        b=eatnyml9Mv0e51Xd+17dxXuLy7EHrrljftGcaOnI7+LP/6r//FDUNXpWc29YA3+AW8
         f/s5IPthfUUpaWz9WKy/nFabJCChYNUQ9xZqfGbzAMH3irNj+748CTpHgYqszWJ0Eq7/
         aYIDZzkJnBqwfiKI3tj6oyHojRKc+YPHt733Sbm3PXC/gH1B+2kNuDGfYRc9id/A/R0O
         NUGzsrTwpSP+Ex1Wk74h7UDUpGUJwR9fo3qlRYE4u9JBmuyQdm0RIOrscGYWdreSgyxr
         7eWZGAVgbZFweKG6rMkrlFU237YMmnlcrOB6KwOuzk9OJLcio2+b+E9/tDvm5YKFpWMx
         IbZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791970488; x=1792575288;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9pY4KLtlrbSAhzhD8CHnP37WDwF8VZOjA0J8k3iIcIM=;
        b=iZ7jZ9CQI91tpfd8y7WnMoL2zSYniX4Z9proXTymEkBpKx0fVSK4DR1i19mI6fqK2q
         msu8BjBm2OWfonCi026PnzhExOJ6pe99D2NKzQUIiURvLbeBAZNiFw4Wx6HpPXZndpYa
         Jle69EpxhZTv3KkhhdJXYamjqxN2CB/mGwfuTzXvwiqfsIudmNqEL7kGr0YPGTzto2YK
         5sRdvV3pPtqOUyqIa+89IZGlhSGc/y/U+OGshEjhzLQElh57AmjoKSf+mbMaD6i9Wtic
         wrQjB0n5gdq3cqDaeOhh1asVlTANJjpX+1fAA7s7oUj0/PLVfEnkE/S3cpJjZgX6jhUR
         GdSw==
X-Forwarded-Encrypted: i=1; AKwUvBxJ2GBJTIangBNLSxJ1DUKLqvyOqGoRbH5GTaQfl9MeG4kD26vfmvQRtK79eeo/2PTgq8DK73hLyEjdMVw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXyweLmJzOqv434DUITVY6hH/IOCeQ/o8rVj2ecX5cLFrG+eYd
	q7AxaAiDDWUpkoWa6erdL5bwAn1R032KyLcraykSuMFiHR++1VV9fTVlH9eb6JMgNNY=
X-Gm-Gg: AYBFou2Nh6sP3IGm3DQ8aGuy3CWee+ylOYp1S7ojkNB9lXIt4Hgg90C2eySAKKVu3WM
	WRme6cI35+oE8X8P8SYOsg3R2NH1RiAfsfDGlqMzp7aSL4n0OsMx49C/wfkQlq0eJWZboCu9iX8
	vGN0tUnamYvsWs/kyVAdOtbvZGNYTp6fcz90GWCf/kNaWdt8UcrDuGqx2XrOMShK16cso1lu86/
	T+1TH2IbGplZmG8H21iPzrLQcFxshGkWryzaV0y0MVHdDkhtYSUoNQA6xSeHnzeXBhmCYm6T3sG
	IrSOaJkpvi8xyQJYBEDJ15ImTDRNexmBAdsqtrjKjlgBO74b1ViNhoH+hLHbm9Cja9Kl4sAVDFt
	8Sy+lV6rqH294t1DZ9pRu89BnMrGajwzH4uumYozLNWp3MCN265xa5HB7q6/XZRRWBPzgiVFFym
	RgQlthqoOf57/et805QCbafVKyuOyBPOAy9lufw0fEctDTWnhS5y1yoIlX68Mvx4oOJrHwAx2e
X-Received: by 2002:a5d:5f8f:0:b0:48b:42c:8b44 with SMTP id ffacd0b85a97d-48dbaaee9bcmr30612939f8f.32.1791970488122;
        Wed, 14 Oct 2026 02:34:48 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48deeadc0b5sm1282874f8f.6.2026.10.14.02.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 02:34:47 -0700 (PDT)
Date: Wed, 14 Oct 2026 11:34:45 +0200
From: Petr Mladek <pmladek@suse.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Tamir Duberstein <tamird@kernel.org>, linux-kernel@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v1 1/1] lib/vsprintf: Use EXPORT_SYMBOL_IF_KUNIT() to
 export symbols
Message-ID: <as9MtfUWfFqHp1YB@pathway.suse.cz>
References: <20260714122143.743227-1-andriy.shevchenko@linux.intel.com>
 <CAJ-ks9ky8BxXmmZQ5aayyXtzQsWF-Bpxxs_+-=pUM2uT4shAyQ@mail.gmail.com>
 <as6XcMDhDGoCHYP0@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <as6XcMDhDGoCHYP0@ashevche-desk.local>

On Tue 2026-10-13 23:41:20, Andy Shevchenko wrote:
> On Tue, Jul 14, 2026 at 03:39:23PM +0100, Tamir Duberstein wrote:
> > On Tue, Jul 14, 2026 at 5:21 AM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > Replace EXPORT_SYMBOL_FOR_MODULES() with EXPORT_SYMBOL_IF_KUNIT()
> > > to mark the symbols as visible only if CONFIG_KUNIT is enabled.
> > >
> > > Kunit test should import the namespace EXPORTED_FOR_KUNIT_TESTING to
> > > use these marked symbols. This is the standard way for all KUnit
> > > tests.
> > >
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > 
> > Acked-by: Tamir Duberstein <tamird@kernel.org>
> 
> Thanks!
> 
> Petr, does this fall in cracks? Can it be applied or do you have any comments
> on this? Or may be I missed something?

Yeah, this has fallen through the cracks. /o\

I have just committed it into printk/linux.git, branch for-7.4.

Thanks a lot for reminder.

Best Regards,
Petr
