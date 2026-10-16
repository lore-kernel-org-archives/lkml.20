Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2DB246784
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792144706; cv=pass; b=Aal7cwiXHQKfXJHkREt1KB0+e/nn0P3FBcFZqJBjmd5vJZmXmgbFe4TXfsnxtghz4T8P6Sa7gjAOU5sb/frT0QkUqGO1pD6ZJiAzDRnU9v6kVy7uv77R1z0y6pQAN0gKm8ZC8oluj8wIjlUok2A6N+xvdjWr/AjVUeN/y0z6GwU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792144706; c=relaxed/simple;
	bh=g0bkKD4AoQdQ4ykmVGw+TsyNIkXEnt5mP03If2spoq8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oFwnXjuXcx3vrWnN83QEqqRu1WflnHerWmLDppYqNzBDDy3hakXu8ibknrLDnVo9dRSY7MrDJxBKBKlz0qDIBIQs/s6Ckd3KCLLmgvNi9M4iXbVKzPIAGaWmN+YNV3DHKsEOYmzCLY75TxrZlEob7Tmo2P5Nozo49cYqiwspexg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JcKPAIQz; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JcKPAIQz"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35829219da8so926948eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:58:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792144704; cv=none;
        d=google.com; s=arc-20260327;
        b=dRbtT2ds8YNXPdqJvgvWum4eYyYhgzgGW54d4nrnQImG+ugwe4DpEJNs9wtR+8fneC
         WEiPy/MYZLrkn7p2OW5S2TaLH3627CqMpVJ3FzP1mcbRnuxNKom9tdDLUQyw/rhZdWV0
         xI5HIELbNhVou4aKTBgUiduYFOrNVPbfhLS6acV/vKK85uTmmTDUvvjLNjB5VjCRxGsx
         eVf+bIRCSU7a8H+b9w9CD/KgvoyNCZBS3Z1QQmElMET+SLgNwuXRrztrzivrIq49i9jW
         AtKePC/gPAnE7uBqXSVOEMhVPYr2z8c1UMleek91REmpMlF+FLpfaxassMGkEgMx1+rS
         fnXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DstF0YWFmK5JdBudlHFkRfSjj5pGVTDMoAcvWNfEpaM=;
        fh=jCiHHRhMWm5MsE9tsCtc7uWFlYC5qvpt1qjyo4wEY64=;
        b=RoOPb4fMpPW5cxgPpdRl6lIvWqdnLH7qGmc6+nMifDpbLfiBLyuNdXuALjAqGRS0xb
         Xb5DzOq2VHFrfplyjRd8VMgP4capWyi1u+sksRE1n/IKR+bwsZ17oS2tMNVRuOVLh3NS
         3ds5i52hWFyArSfT4aAL10FGflRp3Nj0m8wHIrwWUvAKqQG/l4EnIw3sBniQJY6sTEUJ
         xywoB/AhE/bWPiJ5lFPM3OxIBBYODcFZ9ZOGoF6xVaLRoD0ChpWWSQUBh6+w6Rz9GeMq
         errXrDlnArhR576TX7Mq0gttm6pI4DU63JPwF82EdDFaqB/19fuM/FphjCXRK6+8MFya
         +YWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792144704; x=1792749504; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DstF0YWFmK5JdBudlHFkRfSjj5pGVTDMoAcvWNfEpaM=;
        b=JcKPAIQz+fFIfxq13uaQ9e2NCNSeVSQCrJ+d0S1GbwwZhPPBwY9jW+uobMF6UDYT1C
         G8bg/5kb3tpY5ziDQLm1/x3bgy1z8WEyYlh0zZ8aZSYHcFphXEQb0q/AgVvNR7Do0+WN
         aaTlVmXhLug4c0EKobOV2fRnSvaqix4XwO7yNr8awITMAweCJ09O9t18PK7KxIVRec7T
         D/a6cXok3Kvp8dlKB55rcLXXUwB9C/q2mJrxQuljz1rePZ1U3H/AHsDyQKwLcadCVYBw
         9CYHU3g3LPw3TLlplF7VLcJ+qHk6+EF5J4VJrhKawXAZOqMqhgHwwIR369WZREVRTjIh
         RVZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792144704; x=1792749504;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DstF0YWFmK5JdBudlHFkRfSjj5pGVTDMoAcvWNfEpaM=;
        b=LY+lBrELms0u/ROzq+QphzR/75gzHqCSMCgSduLaRuS/Yqa99hbXt0LNuQiWQ0hHsj
         GnB0oxR/BbRdKo3k+3hgGUPdb8eDeAXOdVaRx6aS1Cp8UlVoL2ljKJ6lcNTrIskf1GZ6
         YjSjBcI0gil9NjAAyj8Xm9JXkSeEdWFr34a6UeC6AoaY+FluLquTqKXl4TlX8AREnLsZ
         9GcofHaSoteCLn5vgnXOjeW0rNwVBaYmxxxAKKDx63EwfCaXHYF+RmXcl23jtgJElmhF
         fVrrbG3aBMhFVJB9GKD/dy4jrh57ky1GpNDOQs6yOxo39XULRoyCbWBTiWr4TiOqkV8T
         hXpw==
X-Forwarded-Encrypted: i=1; AKwUvBwYbsbokf+bwdgrtxsnGcLG7Egp7BrdM1FnhNXKQpyUwJnLX3POGG77u5cBMfgqYYtCP2AcSgiZTtoKeaY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmsNjMeKipkEEGdLlxr9g/s++NLgqpWysq4RXPIOWDgbTR8i7L
	ixafhXmh6eytL96j+Wafl8lrhYv56ZI0PpwxgyFTlylv0Oj4wN+4/uobE9RP5a0tThB0ydB54iS
	s11gcRIxZ4WJVUPspCZoi1V/rfILP0gfVXU8PqjXZ
X-Gm-Gg: AYBFou130/NuVulyiYEu/kOrVP1e3gMogPDQq5EYsFMDGAG2M13Hye87TLmU7hc6tkF
	nz04yKvLQTS0/JGs84c6E8N0nY/5lDNq0Pa5T9U6FzAtjvsLH9qXFjvCvkJT2iHbBvBF77vU5Gl
	eNlK0sjeQEm9jvOm4G4hgzfyEVRg0thyT7m0oI/qRgPzqv7scV2a5+q5fxCYcbAwgAFn8l4vLE6
	uhU00INYolTqkRK+vU9uhxIsoqG4J7iOxu7GB4GRvKCqV/1Hmh/Z9ABJq3NPbBT3s7hAtk9Q9A5
	xVcRzcCf2K/0iyOpMSeelBvUwcQoPrT1WZ/lF0CmN5skjnSgafDQiO7zhcW2qjj2WUIe8TBF8IL
	8F7XmZCwwheI=
X-Received: by 2002:a05:7022:fe04:b0:158:8ced:662d with SMTP id
 a92af1059eb24-182570ecb50mr4120622c88.7.1792144703495; Fri, 16 Oct 2026
 02:58:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016062011.103059-1-chelsyratnawat2001@gmail.com>
In-Reply-To: <20261016062011.103059-1-chelsyratnawat2001@gmail.com>
From: Marco Elver <elver@google.com>
Date: Fri, 16 Oct 2026 11:57:45 +0200
X-Gm-Features: AclHuK84ngyf5--C8t5QFdHzGdXGufu885cEj14C65NuMJTtpEsd8eEKB6R_F6Y
Message-ID: <CANpmjNM8H=4xRy0sgFTwH7eGFTXdG-s9zq1uMpfscv=8C9ermQ@mail.gmail.com>
Subject: Re: [PATCH] lib/stackdepot : Remove logically dead code in stack_depot_init()
To: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
Cc: akpm@linux-foundation.org, glider@google.com, andreyknvl@gmail.com, 
	osalvador@suse.de, ckan@cloudflare.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 16 Oct 2026 at 08:20, Chelsy Ratnawat
<chelsyratnawat2001@gmail.com> wrote:
>
> Since scale is always greater than PAGE_SHIFT, remove the
> unreachable else branch and simplify the conditional shift.

Is it on all architectures?

Sashiko noticed this as well:
https://sashiko.dev/#/patchset/20261016062011.103059-1-chelsyratnawat2001%40gmail.com

NACK.

> This issue was reported by Coverity scan.
>
> Signed-off-by: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
> ---
>  lib/stackdepot.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/lib/stackdepot.c b/lib/stackdepot.c
> index dd2717ff94bf..0393801ab1d9 100644
> --- a/lib/stackdepot.c
> +++ b/lib/stackdepot.c
> @@ -247,11 +247,7 @@ int stack_depot_init(void)
>
>                 entries = nr_free_buffer_pages();
>                 entries = roundup_pow_of_two(entries);
> -
> -               if (scale > PAGE_SHIFT)
> -                       entries >>= (scale - PAGE_SHIFT);
> -               else
> -                       entries <<= (PAGE_SHIFT - scale);
> +               entries >>= (scale - PAGE_SHIFT);
>         }
>
>         if (entries < 1UL << STACK_BUCKET_NUMBER_ORDER_MIN)
> --
> 2.53.0
>
