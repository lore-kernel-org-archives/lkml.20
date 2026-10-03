Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85F8361656
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 14:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791039352; cv=none; b=nWpJ+QDXzS9KApDBEHVNu9jNSQ6E2VLQK2xelkxaBLNP6uX8Gc5hB/qn/yi34aFfpiZ8XoolV9q/3V2sgaoO7j7tmb05mp1NVgfr8MGZGEBx4DJuUSSU+nL/fbJaistyR7EbPh5X19NsRRdJkRWbYAltFLwm5krV+FVymon5dNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791039352; c=relaxed/simple;
	bh=WArJ0ScyxSii9H7PaRiQMtAEomtM/1fqi9qP13gY+Fw=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nXuWJXUTMQp6l0W7zhXch/g4Ob0te+h3XGrKemvTYfZNVB5+V7/mts4RhSCYaklbYp4CH9yfba182Dvdwu3q29XwHUa1aMBcXEL3wK6rHO/Bp+Sz59qQuCbBmzwIrGFulBbXvko8fbCJMJc9zMMhVg2GB1bU/u2EiipYzlzB3lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h/q6Aa8z; arc=none smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h/q6Aa8z"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e3453dd0dso125372866b.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 07:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791039349; x=1791644149; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o+Aejwp62NAjE670ErqLzn8fectXSGBwtu7EOzdsFnY=;
        b=h/q6Aa8zL3NcPwkVgFAOFpWWoHQ8DTSnzUcLfq70dZxZnsSeWLoHeZnju9wAXx+O8/
         ZF8radJ2ZnC8vFOfuVY4dFb0ytlaVYj2/fWaEm1NHJRGAVW7od2sh/Gs8mo9KrAQa1r3
         HyKjo9ZwiTlvDgKyB0U2UwJuxD7mriOrVB65H7vhphap9PtH4yZwKLGbqdzoQsPv3jhw
         W8ZMrnRil+NC1rUjWloc05Dnogoi5CDF3ykNUANGSuua84ZmB5NU8qcg9/PaEHFVROsI
         TRVaHyVyObbodtSXSaZ1OpdjY5bs6OFm5n/Rv2pAy1sS33Xx1hsQzIzZ67BCizdO6el6
         IPpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791039349; x=1791644149;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=o+Aejwp62NAjE670ErqLzn8fectXSGBwtu7EOzdsFnY=;
        b=Ig2xZE1J4GAREev9O4odSZkwXdqFqaRM6YVSDhzRAk4K1ueCFuoI1zDrk6NUOIiUzv
         j7mi2evfLF4kBEMiEc16CFwd0sezKFh5BJBKRCvxbwrg+4odvC+/pbo1pw7epFBrxEhs
         qtpzgsll5RfTIYS7YOe/cBSMa55jzTxgs19zzgmMAAZRmeNes/Xh/fGxEu/Jo17OUtLl
         tPEOUrVhDdCeGjy4KoGN4bgmwhQGJtBU8vSOwSvHlRsZ4M1hL91lsBbw9EktGNzHi/tv
         xSpIyXNqvKmPafNHftGMh5XS9NMOE3V6Cvf08xJXkhrx8BbFPwkMB8iOeQaJ+/oXqUcC
         sA7A==
X-Forwarded-Encrypted: i=1; AKwUvBz83US16hpqDChIlBRqZ+mAJO3brCoXdGx/w/nhAh4SmsFTNbpuJnpvaOgKbRR7kQfrt0MyKV+qGYmvH+k=@vger.kernel.org
X-Gm-Message-State: AFuF++kIow+qV+4xq/y1ZFXX/N49nxbDzG7UAe3wyO5nHV8mM5NxmgLh
	KylDU5+ZD3LEvjF5SeZ0esKqS9i7ENJRKCO5OMwO/PmFPeMpo4uRStHx
X-Gm-Gg: AYBFou1kbsaW8zQDOP99Av/qdNadpTiWCfNcXCjehBWKNkdEuECBhsrCgzD1dq2EJJL
	LNzk63IL/YIZ3VHLgJUBEIlaJcYRHFys5Cmieu5hU4YQDDxyu43lKNj1QklKuQlZL/TUkoPjCSL
	1iiKNCblSgA83ZXhyfQuvj2iBj3CuzqWKJWSre8QJz8GdpPbsvD+KLdaaA20y3ACTVCPKE/tNiz
	KR2fUe+oKsS3APY1/FCCKrr90Fc9S/pE/irHGFW+9G3bNROxii3qmHNZlBVO4iWc+eZthe9WqjK
	2JCJJZCDiWUprkvTFVhRf2vDP95I8FFCVfpSAnxNRO1xrT6WFAUyKsmLUC4Xj7+0LwRTswexzjE
	yHa45LeFzhlJ6qt/liSSDh0+yxe3D0MXWzU1+5lNGVJdTi8KnuEnvjYqPSY1qxZWQEbRaWZHZOr
	9vsu8SPfoW8brKuelFCHakZVu0fKBKSa4MUhIvgNvSNjxAzpg=
X-Received: by 2002:a17:907:7fa8:b0:c2e:4292:d26b with SMTP id a640c23a62f3a-c2e4aac022dmr509937366b.17.1791039348809;
        Sat, 03 Oct 2026 07:55:48 -0700 (PDT)
Received: from pc636 ([2001:9b1:d5a0:a500::800])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cd26bf8sm198418566b.35.2026.10.03.07.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 07:55:48 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Sat, 3 Oct 2026 16:55:45 +0200
To: Barry Song <baohua@kernel.org>, Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: Wen Jiang <jiangwenxiaomi@gmail.com>, akpm@linux-foundation.org,
	urezki@gmail.com, dev.jain@arm.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Wen Jiang <jiangwen6@xiaomi.com>
Subject: Re: [PATCH] mm/vmalloc: bail out early on invalid page_shift in
 __vmap_pages_range_noflush()
Message-ID: <asEXcVSK1XL-tIa3@pc636>
References: <20261003090430.91664-1-jiangwenxiaomi@gmail.com>
 <CAGsJ_4xWAd=VHPdGhS2AHKag2WhFA=_3MSOPuyt3ksKH9ezQ7g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGsJ_4xWAd=VHPdGhS2AHKag2WhFA=_3MSOPuyt3ksKH9ezQ7g@mail.gmail.com>

On Sat, Oct 03, 2026 at 06:02:37PM +0800, Barry Song wrote:
> On Sat, Oct 3, 2026 at 5:05 PM Wen Jiang <jiangwenxiaomi@gmail.com> wrote:
> >
> > __vmap_pages_range_noflush() currently only warns when page_shift is
> > smaller than PAGE_SHIFT, then continues with the invalid shift. Return
> > -EINVAL instead so the bogus argument is caught immediately.
> >
> > Suggested-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
> > Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> 
> I have checked this carefully and confirmed that this is a correct cleanup.
> 
> However, when I applied your patch, I noticed that the author and
> Signed-off-by do not match.
> 
> Author: Wen Jiang <jiangwenxiaomi@gmail.com>
> Date:   Sat Oct 3 17:04:30 2026 +0800
> 
>     mm/vmalloc: bail out early on invalid page_shift in
> __vmap_pages_range_noflush()
>     ...
>     Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> 
> 
> So please send a v2 to fix this, and feel free to include:
> 
> Reviewed-by: Barry Song <baohua@kernel.org>
> 
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

--
Uladzislau Rezki
