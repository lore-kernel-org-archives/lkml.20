Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793024500;
	b=3aLJdVsO/lh/8X05q1oXtGTjSeAFGRq7TMzLz2pj7vgwKxff5SS392bTJxXGbTofTAog
	 9aBzXK4Wb07EbPJkTXfQMdVrDQ1JWCFHuRkgv5IJZ4awrvT7Gt3vdz8QmMI88jMKdtWqQ
	 9HFjpoo8e4g5bfcwHa5B37z+70sQaz1jXhoSvjYXMuZ2G5rCrGnJmVHzP/sGhrgva53QL
	 C/c9xvdqckihXA7GjRkbQC4mWn1heK/sesuM8zZXGP6fYhnxvgaPdlhkFukAfnrojKs+p
	 KXExlfwEHTDj3NpsXNTx2F1a0qn/TLDWeuSGs8x3T9gwPqaCGs5M5YtLPmBfC6ZWnug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793024500;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=MwdXN1TCWe2BL4b2dfairQrlmjtBR9ajoa0+SCjXZog=;
	b=VIXlJXlbtzFJvgJ2Ct2M+3ZwDEJheEP7lA+22r4MFTswc+tmS1kU0aVKGzU2wGsINOEr
	 QQ9X8tH/nLB7/iFr4zXvCZCPKPKQq7SIErAwzhKTKdh6A0ibQXz6qiXSuw+QV/xw1HuBz
	 /Nk9bHFibtyOe7zxCjZBDHKWqGhUcEiwN2OnHhA7CnhSrKvj4yppXFWZgk37BzCRZz5Iy
	 dFvk8Rtg+lPufNiJOgI91mle8nhenZilhWcSvPuj3tPVu2W83B9dVO7ubWz1sYE3lNAMR
	 Iin80cWIHRN7WPG9srOH/PnSmn0sIRzbMa6f2HuDY8GNuqUIa8/k9UJ2+EOUAafJP/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aLGjbnY4;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79173606A321
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:21:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79173606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aLGjbnY4
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a208d93758so35807805e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793024499; x=1793629299; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MwdXN1TCWe2BL4b2dfairQrlmjtBR9ajoa0+SCjXZog=;
        b=aLGjbnY4YqWZICNGtjWxs4lRVA3bjXXY7CKbgPyRyQlLvc+9cdycQj1oe2rKkgQA29
         no6pwmzDV3pV9qprfLknsiWnfdLmcV8h+X/2Z6l+AiaPaamSnsD9UlJIn5aP7r1VOYHc
         XDuAuPbQAegZQz1tJBn/P7f1QQptUYMIuNJpAFgPAMSeC2b3j1nFBr4o7zO1OOT6qwDp
         auZTvkPUqt4kgwxCnCAP3tUNWw/SeT9vtUj0Jltt4tarbisSTwLbghUXJmcbu2lEOCX1
         uNa1ONDz5FuKxxJsPP/7y85v06hqMTOFo4wlTGHTK/4bJFU606IXsFETl1W7RIRTCW3H
         7MEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793024499; x=1793629299;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MwdXN1TCWe2BL4b2dfairQrlmjtBR9ajoa0+SCjXZog=;
        b=m3sLGeGhaI+BDXYPh22GjSzqfBwBHgBScF1iHMhJSKBYPE0qnojSkqz0r2Q3CdIghv
         RtiLTAK42xwdBPf7s5c8YZEYlN+X5nE5zSao7e3/RaMJviQZd5qPr7hmOP/jiml1Dyml
         0wWtE3DDtM3TVcXhjlU9mf+reeW1rcsq0NTOv3jalKTDJ8SvzS4ILx7p9DeVuQMzyyr/
         Ea9u07G1y8CA+ghOLZhkouBXayrBGvOvPX+/QRIbqkRxuO/KVhuVF6kXXhlnde2DB19o
         gmROCUbxX3YLmfgRCSx5MBvbj9salh2U4+5/ILWuJq6V7+jH8Aj6xcfZVpXjzjc3iFXJ
         /zfg==
X-Forwarded-Encrypted: i=1; AKwUvBz5gipstfGJSaEm0Rri8Kkxb86wXaCbB8mF2D4rs36RpqVDB+OZ9Xg3ByXuY2uYTBTK66paz+LYnADmRZU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLi07efcuO0UfCgsUdp3UEd5DKSKlT7bsHGQpyS9izI7/z+qWf7
	+60cM5EBsEHqbHXdPE4Azw7B2AMjszDVfssP6hFWMc92GeWxLH5VzOrP
X-Gm-Gg: AYBFou0oiFAAojvWzu62QhsEs7Ymk4nxxVFctfYM5dtL0r7vhgcm18Te8E44ZoZ/q30
	7aXUUpoNzSWUwdkDcXESKW2QedDE8KYJT6kHZ8quWlUcmzB2dHEhqopnVVzYtbiSJV5mQK0GmsT
	EyHR36BxWesHd/YIB2hgLbGxBI32qv2lf5Y9D6y6tDQgyFP9qhqxZSPR8ywnQo40+EVVUhN6cAV
	1fgIezmTyTk6AGq6BlEMyG13c9kAHkScTRtcSkUewsQKDFtCjSVxCZ4pp/MiL/v22L0hSmjBvzK
	zq07Zqv9lM+aIgRifvj1XEh0q4hA+EfQjzqHY89JknZbNd0E2hHmjk2YEOrIV/EWzFy4PWfdH3g
	KB98ruZDKNkntbhHNML/1wNIs/qBhaX8jkgI6fd65BmtpiDqU1isVHu7AFBxRy+nvZEn0m+QASm
	0Euf6gnVDbE8QEwnj2zmsWNu4bZodBWvvCvF24qxLfeXSHqg4/lvm4FOFlumXdPXau5OFJ5M8Lu
	9Ca8h34BaQ28+M1BRkNkX0W53V1cegzNesSm2BCL4ACYh/uD/K6piGSpaPyEodsIyEPa65taua8
	UZC8ePJOPPw03F5f5xe9eOeJtdQt5ilyLK8AGieRx68+GkqM2EwF7I3OXtKga2pAxihGEu1RInQ
	wdW91FfRci051IXhgP7BOFEFqUj3lVjVRwwHwHD1ElafDKjTfY740B/RK5z3uqCJEsf5NQ4ms2x
	JwzNQjls5c5eQ15g44toCHXLBpwIFq0Rbdqx/we7ivycimiixGjZsgW1XVgm/ROg==
X-Received: by 2002:a05:600c:4e47:b0:4a1:fb2f:eff with SMTP id 5b1f17b1804b1-4a772d05e3emr11795885e9.18.1793024498731;
        Mon, 26 Oct 2026 07:21:38 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd48fasm16668508f8f.31.2026.10.26.07.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 07:21:38 -0700 (PDT)
Date: Mon, 26 Oct 2026 15:21:36 +0100
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Arnav Kapoor <kapoorarnav43@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Andy Shevchenko
 <andriy.shevchenko@intel.com>, Gwendal Grignou <gwendal@chromium.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] iio: proximity: sx93xx: keep the IRQ balanced
 across suspend and resume
Message-ID: <20261026152136.0000047d@gmail.com>
In-Reply-To: <20261026112342.65917-1-kapoorarnav43@gmail.com>
References: <20261026112342.65917-1-kapoorarnav43@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 26 Oct 2026 16:53:03 +0530
Arnav Kapoor <kapoorarnav43@gmail.com> wrote:

> sx9310, sx9324 and sx9360 disable the interrupt in suspend before
> anything that can fail, and don't enable it again when suspend or resume
> fails. Without an interrupt line they also act on IRQ 0. One patch per
> driver, as the Fixes tags differ.
> 
> Changes in v2:
> - Send as a series with a cover letter (Joshua)
> - sx9310: move the wake-up register writes into a helper that uses
>   guard(), so resume can use the usual early returns (Andy)
> - sx9324, sx9360: no changes
> 
> v1:
> https://lore.kernel.org/all/20261026100322.16720-1-kapoorarnav43@gmail.com/
> https://lore.kernel.org/all/20261026100408.16874-1-kapoorarnav43@gmail.com/
> https://lore.kernel.org/all/20261026100450.17023-1-kapoorarnav43@gmail.com/
> 
> Compile-tested only (W=1); I don't have the hardware and haven't
> reproduced a failing suspend.

The code seems good, would be great if someone could test this.

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
