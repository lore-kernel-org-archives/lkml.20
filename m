Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC6B46AF1B
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790151244; cv=pass; b=d7/JsXHc8XZMkPtuta46LR96nAfXzL2ObmCpB+7Fhcew03ubmBEuPUoDJKIOJsQVNC0ZAZcDQjE42ECQg5LyYLxZTzo0Hmg2qITAhDzXr7RQ4yST6Y8dBbJO7r4sIsA66NG4y1m3p9S95ICFS+Bhe3pHeuWF7jYw+9sNHc2P4Js=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790151244; c=relaxed/simple;
	bh=g8p2y5h9Zq0bo26ThNpQVMYPb69DIVXvUL91DVTUVlw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qTV/lc8dmJHnDHsJDl6Cw85vJXCY05erKP0OAxBsgD4reVLFbVqZJdgQHIa6YbTaah2LDSsiKPEEHKRIew6ZJET+r+NRQgmMGp1KWw5q0ggUeUxTPXP8W0X67De7MoiKVC7mAJajrcJBWI9IcYs2M4Uibw/acHdXU2hmXn0XzxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Kaskz8Ew; arc=pass smtp.client-ip=74.125.227.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Kaskz8Ew"
Received: by mail-vs2-f41.google.com with SMTP id ada2fe7eead31-79022baa364so196215137.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:14:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790151241; cv=none;
        d=google.com; s=arc-20260327;
        b=ZoLNSOHfnfIwchF/MtOjab99bTaoLFIUamGDa2DVYKuGgPIFa7t7N4OS+KmmgJQqUg
         HaRPsZcZ8t1R32C+uQgA4EyDjC0pmGg1jvcNsvjT2uYiT5t4h1DlXyINU1uUjxpu99UF
         3xdM00GhFx/icLsm32KW68qgrfpxqB976+mRl2kVHuYeLwcHRRVefVRvtEr5+Nj2Rr6m
         c1WITm50Ruvr+DOOSzOxMvsrRKhpJguya1ysyv/CUfHTNAhf65iuNn6FShrjY4AkGbGm
         rxEiyfL0pDTvJ3YkU2CM3KJLAEx0JNJGcdeOnTeB2q8Wolz75SiwErJeLXM3oONbgDxD
         1q7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g8p2y5h9Zq0bo26ThNpQVMYPb69DIVXvUL91DVTUVlw=;
        fh=UTa2dIM7tW8YEk8YYfBlJifmd1pbn0SIbndu5N1ZBI4=;
        b=EBFq8zDR2jCku+xFFCaMuQJCiAvpTlScypg8v2WZTDyIHx5XUwN9swyTSvGB4EHbdM
         6nHU8zWnHkkimSafNJXIK2loIDK/dHp1XoZH/Fj7IqUR1zQYlzNyDZ0tT6TOGB1aaC7y
         oQWEUXyOF5CJI5R7kiCnIVB2Q9Shm2/Sq5Hr5ql5knIdpoyhUmXLUY8cqSjsTSNoU+JC
         6n/79JvJk0FksOdXpALTnf7vi0sKicQekNd7phY/ovqZn/yX6h2Ix8hRopG5DFJJG22v
         Jj8q54TvkXG0pgxlnCaBgyuzPDYewFsN2nsUOVkJNV2xmSxLN9m/rBoSSes0r2TctIyW
         0tGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790151241; x=1790756041; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g8p2y5h9Zq0bo26ThNpQVMYPb69DIVXvUL91DVTUVlw=;
        b=Kaskz8EwzJ+afxaDUNKLop4pDXpSKomt6wSPdJQWN8dOaRpULv/gU+hr4vucy9nnDV
         RKVKd85lNizWo0ass9d5Bdwg1QDrUyoVFMQwWLVBLHmUOc92GI0rjAP17k255PU0W7Tn
         tXmYta4wSW/WyNMHchZ7tHnMMnBrJ1qFCBS6Ut2cSIUvMEClIGXY7v4UuCavC1TrY+ab
         YK6d2T/GboE0+ZAcZcddfZUarr9dbMO3lY/SgAIzxZk8HdU1EO8NAwZqtYm236wtuoCl
         RUr5FnEKvfFhnWNkVOrCaiYAilq/A6V/6B0xI6qv5nKMwbOFMNImvdh8MJHGL5rSFDVX
         geLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790151241; x=1790756041;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g8p2y5h9Zq0bo26ThNpQVMYPb69DIVXvUL91DVTUVlw=;
        b=nNo/rZ1/W4GyjfmBHs3X+GTUMhjI/+BB8IGhdvj5rHQwv1+Svfxm7ZWQx7l45qUxOI
         k8BpuEKnKfBvILo47VNX4ptNyA2E17CevD3K27bsczpoYf+Of960v+OYMyg1gOUY9unw
         StSqst6N/b0K4RmNWAIVkjaJbTsRlOcRbfjZ359lo7rHHE3/CrnjQmsr01ly3yeHTwUo
         OGKzZnib92tT6KcDgjct1KdmnvdEk7Z1zuQ2eNklififCFMxNUkLB1XeR9ePFgEvInb1
         e7oxVo603xvsLEbNCCI7ePKyI01RMbv66WXNnpgsCnJs/GBzTYDUIFm2uVZHFgTTCY99
         CLGA==
X-Forwarded-Encrypted: i=1; AKwUvBycsGSIj+HgyofY4QNNeP7k2NIvatyr69W/El9QXqgDckToW3irqVH7SdcasfhdCb4yiSzx7OH4dp88VHk=@vger.kernel.org
X-Gm-Message-State: AFuF++kzSAb8fD7BgjkrxbptkpRcwjV5t7oxPo7gI5f21WzjKUWw/ROW
	5FFVOuogbxo8g/bQpmPB2cXRCnd7V2H3WvrvKDW+bnoMkR+yMDxvEb3l5jtkerpTA6KERukbvC8
	l2nwLT7YCqZfx31ZdugZddZ1l83USN8M9xOlChk8=
X-Gm-Gg: AYBFou3LIK9Dyt1rKWJVsJr7dyLg4ezHYgjNTHNI2n+ms9pvYK7es96kLCZDtIfPgFV
	jadlgKI2qwW7epS+L75qMCczmT6GRp2iKkze374UN2tnswZTeIeKSEPdnMvhYXJAx9C1VRUaVpe
	jr38UVK71qA7nQqZjUaf15YUIH4TxHKuEWIepafUBNwRmeqXP8OR6whyFI35U+Q7cOb7eETkjR3
	PWOh3ptSjX7O7+QvaRzNgCG0pHDRAo6gEp3ul0J9EbEyM5uN7C70zRz4SZgJg0yoSZ7eXhL8dtD
	nqZlJWQtMFPTMbW0k7A0kUt0uXWVrKLjNyBw4ynsQ8sTl/TqgY5lK7pZR2VFzIKMc/og42LHZ7K
	VTflU4i2nLUc/73ktZGWo
X-Received: by 2002:a05:6102:4414:b0:7a1:f2b4:dae0 with SMTP id
 ada2fe7eead31-7ac0d12c7b6mr1858808137.13.1790151240916; Wed, 23 Sep 2026
 01:14:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923041630.2553973-1-morbo@google.com> <202609230023.C2053303C8@keescook>
In-Reply-To: <202609230023.C2053303C8@keescook>
From: Bill Wendling <morbo@google.com>
Date: Wed, 23 Sep 2026 01:13:44 -0700
X-Gm-Features: AclHuK9CRP64XWkh5O-lp0iZIS46BhsaKQBJZ_3Cwu7viyTTfI9mH9peB9qjiC4
Message-ID: <CAGG=3QXNoR_EpkUiTi4Rh5c7HNZCsVVTFneOT+TzuPiv9Yy=bA@mail.gmail.com>
Subject: Re: [PATCH] iio: gts-helper: add __counted_by_ptr to struct iio_gts
To: Kees Cook <kees@kernel.org>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	codemender-patching+linux@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 12:26=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
> On Wed, Sep 23, 2026 at 04:16:30AM +0000, Bill Wendling wrote:
> > The compiler attribute __counted_by_ptr can be used by KASAN and UBSAN
> > to detect out-of-bounds accesses to pointer fields in structs where a
> > corresponding element count field is available.
> >
> > In "struct iio_gts", there are multiple pointer fields associated with
> > an element count. This patch annotates these pointer fields with
> > "__counted_by_ptr" to improve runtime safety:
> >
> > - 'hwgain_table': counted by 'num_hwgain'
> > - 'itime_table': counted by 'num_itime'
> > - 'per_time_avail_scale_tables': counted by 'num_itime'
> > - 'avail_all_scales_table': counted by 'num_avail_all_scales'
> > - 'avail_time_tables': counted by 'num_avail_time_tables'
> >
> > To ensure that the count is set correctly before any pointer is
> > accessed or assigned, we update "iio_init_iio_gts()" to set the counts
> > prior to assigning the pointers.
>
> "Accessed" yes, "assigned" no. :) Let's not churn on assignment ordering
> unless there is some problem I'm not seeing. The only time this should
> ever matter is if there is multithread visibility on the object already,
> but that would require both counter and pointer be set, so that'd be a
> general locking issue, but ordering during initialization doesn't
> matter.
>
In a separate patch, Sashiko flagged the assignments being "out of
order". It's not an error, but I did submit a "v2" that reordered the
assignments (that Sashiko is still complaining about, but I think it's
a pre-existing issue). I can weed out the needless reordering changes
from the patches, however, I like the idea of people thinking about
the ordering of such assignments.

It's a small thing I know, but I need something to hold on to. :-D

-bw
