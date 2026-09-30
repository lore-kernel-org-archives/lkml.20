Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051CE51AFD6
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790793539; cv=pass; b=WXhjj9aaRpjxrm1FqGH5duOkxpfmgiRScrE/lcjk7R5EVE1+tikwnZ1OlYPzDbPZNqNvOF4hCRSQ1HawDULaTYyQuEIG+gtGwyvFCzIa9XduNFqrnQZgtbOdlxZ0QXpzJpIQw278nbmF265jE7nDNQCO6mk+B/v9PcjBIIsoMT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790793539; c=relaxed/simple;
	bh=NHeV94WugdmVD28bFMrZnAa3jDv81zue6/05rbrEI3w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SpFUGEzP0g6VmOl4rnapwcCfZWE28BKznLLsMYneIG4c8xtlZPKDgGYEQWeAZRMQ1/9HLXyY8JvopbmzOflxp70Xkm5gMtQvBPFQZ09DxCXlLfNSeDvQJvuCXajOzwmlxFEi3Yl9Qynj7m2+LJu9JDWa33bRVKG7+bJjkMZgx68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bAg/Modx; arc=pass smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bAg/Modx"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2e1d2d7dc9so69985666b.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:38:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790793536; cv=none;
        d=google.com; s=arc-20260327;
        b=Pyc6OlRr/5FvlwiwPhkXevLk9NSmMR1VY62tjCTKYjoE4q2yH11ln8VIDna4Ma+9Ew
         YkbyPZbdgPe3i5PXf4CM/CitJePYC0MVlx0f+X4F4txwchN+MVdBtcZVdQuDtxkDtjkn
         pbJJExKan0FRnK5NIhfP1ypNBnIJrAZaSJ30ZXVXiz0HSNNjz4if8I54ld59WrTKoF7a
         rs5f4DjNUIjFILclnhUI39jKSMItANub8M7cJQY9M9a/pGRrHSxM/F71Bgx48G2fsNGm
         GOiiF34GPYW3ImOJ3TD3Xj5dXzr/VehcgBxiQ6wbZDczkymg4Qw1DL7sywx2AQqk8SKA
         SwEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HI0jJLmE0KCx7SJ67izympvHFVqsl1F6acyVdnNn58o=;
        fh=JZyW4Qw8+t14188fWFIeM8n2dkgPJz0BGrUqeh1Hx7Q=;
        b=kAl7ptDavtC5GKYDwNT3Uqe9hs/nGcbSGB95Jwk9lClzKkCw3h+8+9yd/ds2Vg7RrZ
         /KxRDFodsAOU0U9kagG1XbIKXLOFha4Ktq7iwT2iaA0MJuEeiwz45fRMPe23kRVpAs8T
         35a2nhoy9KYZckU3Pmi6R3NK/BQ6lNaawOLH6c4Zx4hxC6omRJW2U/I3l+d4RyD5/N+j
         Zn37/IaZJ2KlF5UeudltWMym8+fvFoyPxAGed8Ah0K9ROzeBmBYv+tiOLlkIa6KMdokG
         Ep3xDe26J+snfkG1qCQ16T7RVUR9F3LN3hTborHeoa6smnUOdHVMcsgy5H6ZCa09FRk0
         417w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790793536; x=1791398336; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HI0jJLmE0KCx7SJ67izympvHFVqsl1F6acyVdnNn58o=;
        b=bAg/Modxf0k68QX6jyn9V1xldXMPhone3+S4H+AL7uQ5fGFBfBTgxPg6jB0TdTVlNr
         yaSRPnUOzciQ1ttDaEuZ9RM9CW1pdWk4LyfxMAkFu/9vcbgXH9KqEYfGpkwdZoDA2wxi
         Smxa4Td2TO/TaAnVPCA14donfWy+bDTIyGlVA/CfYL8SOpercVLRoeYGCeiOw86V30eq
         U+L+ZiRXcx0IWFfIaIDiflAXQ8UKuL6o0+4ohEsu9UpqKK3agiiZHJC5E+32usS0Kh4u
         JGl5p7UVkwD4g/QLixUina1vv/1iFtDm7rosEc+I9GXqhTRK3CAPigIiTb/xrx0bObNm
         ptYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790793536; x=1791398336;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HI0jJLmE0KCx7SJ67izympvHFVqsl1F6acyVdnNn58o=;
        b=sr85RV2IYpUVPmCPnefLUhjXGFK7KzByfLaE68Y+V20F5OmT+I+vgGe/dPZuAx3it7
         WqppOl0w57T9rfMQ1DTg3N4owTzBD1CHae85E+5Kwf4F0k34lP5OhQfYI6xshcanQxCP
         KesAdneXuy0J+1GufI5t822+ZOtqUkEmeTg7AZHqMuVHMA5PSM/GkMH9FycVFPoZ3fgR
         794oZd3hG+odrNAOC0aszo3HhQ9GdVWggeY6xI0Vaf0R95hjuc86o9YKKGTC7dicgnjg
         dbvrdsnCu75T4Z9EoXCPTd6BtJBDSwaPbuiaSuyKta+ZrZ+DV/jW0NgYjD2Nvzpnnemq
         dWuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxPWcjrLySmOCV6ZnDjhEvVxvWHh2BxN74qIGNJ627oVUqU7N6TK0YOn5vArSJOIdAcTpBqMK10IWcgKZw=@vger.kernel.org
X-Gm-Message-State: AFuF++khMFDW4pEqmBzdkwqL2VyJWq1oOsVM7KOhwp3OZm1ckcsRynZZ
	WhqJmQLB0xgPhSRmH/YxI04aDEijf4Ul6grKJW4nY7PsBhUyYsBCAyqw0YTS9vvt/Asud9E4qxk
	Fs6BpntrQHNZidQh8Y/rVgUO/GcbpUW8=
X-Gm-Gg: AYBFou31Z3TaQGKGQ5qfduKRXqBWj/ms6NxiziU2SVwgpSnBasTnbaLO1mi51sJyk9+
	pXpiaHXWXuekJ1EsLE6Ke8B7jIlCt0IkslLrVuTUKnarkn8C8TktvaeyZ/3gS72RPWmT+YV8AvV
	PyJiKU31X+lf/kMfWFdT0rgSl/D0YFdXho8u3LpGkO4LZQp03RcoPlmEATlN2DFClljYDMLe3X4
	8gi6Nv/EYhS8hLfohsjeFQLyGBiwUS4butjXa+vnCPJxfzqRDHTImJlKjO8jKuCr16+qNki4+DC
	IbEDfZLygQV/gt35bcJjFB+3Rl6lQguAgpN9FOybJ6p++s+wOhOJfn5lEy3zZsUtOBnX5nBp1t+
	56XSLat2vOD/7Vpr3uA0kCjHyEy39Ir9Z7/6TXxo=
X-Received: by 2002:a17:906:f583:b0:c2d:c57e:fab5 with SMTP id
 a640c23a62f3a-c2e33cec3c6mr41556566b.7.1790793536002; Wed, 30 Sep 2026
 11:38:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930183018.49629-1-meatuni001@gmail.com>
In-Reply-To: <20260930183018.49629-1-meatuni001@gmail.com>
From: Muhammad Bilal <meatuni001@gmail.com>
Date: Wed, 30 Sep 2026 23:38:44 +0500
X-Gm-Features: AclHuK9lQpT-wa7Q6XhMKeuCXwZ9qOLPqpfv3FTdw2GVk1xkzBB_NuWLafKSDzQ
Message-ID: <CADqcGB=tjzMS4xP8yDQrO5hKyoq0n=wDJNTBohdnDErDwK4gBg@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] platform/x86: hp-bioscfg: string buffer and
 password fixes
To: jorge.lopez2@hp.com, hansg@kernel.org, ilpo.jarvinen@linux.intel.com
Cc: andy.shevchenko@gmail.com, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

Please Ignore this patch series, as I noticed an issue.

I will send a fixed v4 shortly.

On Wed, Sep 30, 2026 at 11:31=E2=80=AFPM Muhammad Bilal <meatuni001@gmail.c=
om> wrote:
>
> Fix string parsing in hp_get_string_from_buffer() and make over-length
> password writes fail.
>
> Changes in v3:
>  - Drop Suggested-by: Andy Shevchenko from patch 2, tidy its includes
>    and declarations (Andy)
>  - Return -E2BIG instead of -ERANGE in patch 3 (Andy)
>  - Drop a blank line in the declarations in patch 1 (Andy)
>
> Changes in v2:
>  - Split the hp_get_string_from_buffer() fix in two (Ilpo)
>  - Drop the lib/string_helpers patch, use @only of string_escape_mem()
>    instead (Andy)
>  - Add patch 3
>
> Muhammad Bilal (3):
>   platform/x86: hp-bioscfg: fix OOB reads in hp_get_string_from_buffer()
>   platform/x86: hp-bioscfg: fix non-ASCII truncation in
>     hp_get_string_from_buffer()
>   platform/x86: hp-bioscfg: return -E2BIG from validate_password_input()
>
>  drivers/platform/x86/hp/hp-bioscfg/bioscfg.c  | 79 ++++++-------------
>  .../x86/hp/hp-bioscfg/passwdobj-attributes.c  |  7 +-
>  2 files changed, 28 insertions(+), 58 deletions(-)
>
> --
> 2.43.0
>
