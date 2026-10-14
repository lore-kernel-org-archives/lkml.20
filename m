Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FA33D891D
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791994838; cv=pass; b=HhzwC6TI7eNNZgIgGrllIoPfS87bzg9Ww0Wbq63X2rHpXJjaSUEYDAwObFqzzZwU15cZNsKFbdi8EoPDWTAS1Llt0iGz7HllqmhmkPn8uuJkaiiNIrxJOELiCkBtudW+53CQHuxiE3yDeoi4WC/huvVXh11FSKOoawJ60CceE7U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791994838; c=relaxed/simple;
	bh=ABisDeC4iVxV+9gW83Zl4GmnT6Sm/4rrAekgHT4OJa0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HZ6Krbl5XAK4+KeUCPwpvEMytI1Aa/2hD/LVwMujuj4hnxLyWZkFMAs9sVSVAaQRNV7P3odQwTYQWJ77hyETQoSEp/45FwWYF5yzWvYnN6hhpVeXUizm2L69gh0CS4eSH7jUYKeoTVSHZQjqrperXwLak1WqC+8yUqAYa3OkTMY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CbZsryyn; arc=pass smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CbZsryyn"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6f8a519e215so2378616eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:20:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791994834; cv=none;
        d=google.com; s=arc-20260327;
        b=SfRd79d3hMR0orG/yrI8N3wJcrdu+UKpBdXos9zpLKwQzJ3IaA5fCzTv23Z/2DThmc
         aZgZU7SdbSsVeOlqmi+1VwZBN9Hr8JzzMzUkKEZYPESQlUeXv/FG9ogqZWgRl2m4rtrp
         7EETPaBdLZ3GlM9ZMkAnaKa7RJP5fkdphL09C4Frt6oF61Nz3tu69kwKv6xHuVoML407
         lrtxyGFaFiB3Lml07fePub9pWx0W+K09uGBIXB8nd6u0r6u+iu7VylwCQjSZ3EB3+GC+
         x1IDfcPDmGFC494CPI3lRjnwS4YY41jhhdocEJeCFU9S8e09IVV4Rc/2hZcHkPXVDoDX
         HZbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ammrCi5lWW8CQm6Nxwkl2IMJ3J+LU9Xyj7wXDb4386U=;
        fh=8fBljittGGYt87+H2LsOcz8+3q+KEEY5GIMzduAoFLA=;
        b=oPiowr101snGZVRtOXGcYl2FQspBvzHXVHgO8RD9+NdYeqvuD6gxa3USffFYxuSwjo
         T6nHe1tUa4fz1guV4CII1eDgSUT+qNeFPy1oIrPr2VR7GTMT4mqftAQRCUhJ+VK4wsVC
         i6idhlorTQTW7csWNkAP4k3ZRSEWSOOAGiJyDGFq+puxNicncIEARhZ4XR2LK5Rdj+LL
         jMpAR36LjpxMjJ8Z/KaXdqAMCdvXkFYahPu1ITa3A681u+vey1V+NudhM6Usk4h1u6UB
         94GwUeQ+RcxW4Az03il16EsdC+aY8HptRjM9Fu4QWNpeIwlLebdTVxUN9h90CGZeAJBM
         7V+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791994834; x=1792599634; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ammrCi5lWW8CQm6Nxwkl2IMJ3J+LU9Xyj7wXDb4386U=;
        b=CbZsryynymhrkJaJHjgQ8fZNaf3WzWvQDw4XqzyBqYPzcAAqNEVdjl13hcqYhbvDEt
         Sk7w34fLmDjdkEUv3M6k8J2S0p+fDRvwU4KPLBfPyrJ4N3ylWiDH10r23Pb2qMy1ocKj
         63zcjwQ2+0AU0RwStNWwYUEoNPeKDbY5VobgQB0rpjkTwHpNoBMoT6LSqZqDoajfFzLc
         GzaLTtOUSHntMSuP23mYih1zQgHlg6lSO9Nt5PEG2HxXNaxIXnmt6rqjvapswLYF9kkd
         tWwRm/rwwcbQ5lGmgSPNMH3kQpoqNNmAhMrUkc7Wug/8l7D7u557codX7+17QZ74+S+2
         pHgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791994834; x=1792599634;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ammrCi5lWW8CQm6Nxwkl2IMJ3J+LU9Xyj7wXDb4386U=;
        b=AY+srEATzNMH/UneKup3gjpTz0h9Az+V+LDACsnDXALImycWDjp9TBDlExO2TOU5H9
         5i9wT3iILBcYTVwkBg1QV0qfdS4XEicT4ZQ2dNxvvNjqkrsVmwaoo67430Aow7Ht3QvA
         1SU/hg2Df9essNZm3ltCOEacbAcDseyEauTOunD5Q579abNUd4LBraM0IF3vtYTa9zWN
         2k0VK/YBQnr1HqOVF9CgK1VZU0c5sXvYpQvy5TZVcCdqA0i8g+CPtx/ZgUSiQVAZSHWA
         vJTIFrVfWkS6JgVeR3vmo+xdjPicrV62RLJzdZyBmRXvQLMDcIVSBjOs/YMlwlQ0FJWc
         YzkQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9NVfpH60eGrB8yn1uU252NvpC4VcWHRRRRjvwhQxkZse4kRDjZmSmgrDeSIWclmUEMktgylMRFz39CNg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKR+BiwSa+xifPVKLiupC7e/Bsc0ltSYx4fq/2teV65n8YpjnF8
	wOwmm8h5Tly/5PcuzQGjq3r0z5hKfB+4vnI7tb78gd7m5Z93nVhxI4EVJl3P+JfvgXsOKYxWjcG
	/qGb9cwjACF+JEdSIczOpycpPv5gj+gtLDdMVMoY=
X-Gm-Gg: AYBFou3klGZneQu+btiehDIB8pvAO3hlNfpAh2vqIbDPrnBsc0jRaOAEl1gbDztBvpX
	/d55XXYvi5rbm7Dkn1pT/EiU2dsF3Rc/+h0fx0d7TB7OUrQxNCqrfKUmcpmqKC7em4+G23JIYWu
	HJUoJW8aeuqnW1aL9QNS1h49C6FZCpDaSz2DZeGfz+SLqTQgG/zXr/DWfr3fyw/eHHakEEVP8XE
	p2QucqOKAoo4A3idKTW/0FlBFu4dWgpkR5xx+elMu+s+Hf7vtyhRzUWN0mKHUM210oHly0OAqsj
	epSLRIr+sl0HLpOq422imHO7WxvJMwIzdmoKdKC4/rT8bN089Hj3qAgV3/HQmoBKtwch/mk4gdI
	nxL+N2O+ScCACtQ==
X-Received: by 2002:a05:6820:4c8b:b0:6d9:1ba8:7e3f with SMTP id
 006d021491bc7-6eee446ec53mr11086455eaf.49.1791994834621; Wed, 14 Oct 2026
 09:20:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012170857.199561-1-hjf3108@gmail.com> <64707239-eac7-4259-a8ff-7ec43d13860e@suse.de>
 <CABOQOSXgG2kBzs2sBEE69mmPcO0cKVgjyk_6DG5RST_4uL2+sg@mail.gmail.com>
 <c9460a8d-3fdf-439f-9655-82b60617b85c@suse.de> <CABOQOSUE17pQQYydLxCLHg1Jg90dwCEvMZYyo6TzYHMn9RAL2Q@mail.gmail.com>
 <fdc5b911-407f-437f-ab05-33d1287e20da@suse.de>
In-Reply-To: <fdc5b911-407f-437f-ab05-33d1287e20da@suse.de>
From: Jie Feng <hjf3108@gmail.com>
Date: Thu, 15 Oct 2026 00:19:57 +0800
X-Gm-Features: AclHuK8O-BspYB86WXY2JYISSnm83sfhUSUuKRxBs_LC6CJMRni-SeacCv5PZgs
Message-ID: <CABOQOSWf1Yqt2E+hXC5bPxJhjKNJ_W3AMX30k-stNZzQG32F9g@mail.gmail.com>
Subject: Re: [PATCH] drm/format-helper: Add XRGB8888 to UYVY conversion
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 14 Oct 2026 at 17:03, Thomas Zimmermann <tzimmermann@suse.de> wrote=
:
> >>>> ...
> >>>>> +             v =3D drm_pixel_rgb2_to_v_bt601(r, g, b);
> >>>>> +             u =3D drm_pixel_rgb2_to_u_bt601(r, g, b);
> >>>>> +
> >>>>> +             transfer_buffer[dst_offset++] =3D u;
> >>>>> +             transfer_buffer[dst_offset++] =3D y1;
> >>>>> +             transfer_buffer[dst_offset++] =3D v;
> >>>>> +             transfer_buffer[dst_offset++] =3D y2;
> >>>> Rather that writing bytes individually, use put_unaligned_le32() or =
a
> >>>> similar helper.  Byte order within a pixel is little endian, althoug=
h
> >>>> I'm not sure what this means for UYVY.
> >>> This is meant to be sent over a usb transfer, so byte order needs to =
be
> >>> the same on both little and big endian systems.
> >> DRM formats always refer to little endian. As it is implemented now,
> >> it's not clear what the endianess of your output is. Please duplicate
> >> the other helpers' logic. They all pack the output with appropriate
> >> helpers. If the USB device requires BE, you have to write a separate
> >> conversion helper for that.
> >>
> >> BTW, you have an OOB access if the line width is not a multiple of 2.
> > How should I handle this? Rounding it within the helper doesn't seem
> > to make sense and the function return is a void, so it can't return -EI=
NVAL.
>
> It's the callers responsibility to pass in enough pixels. You'll have to
> take care of it in the driver by rounding the damage area accordingly.
> It's not optimal but it's not a big deal either.
>
> In the line-conversion helper, simply round down to the nearest multiple
> of 2.
Yes, that is already done in my driver.

> >
> > Other helpers ignore the -ENOMEM error when drm_format_conv_state_reser=
ve
> > fails, so should it follow this convention?
>
> Do you have a specific example?

The call chain goes like this:
drm_fb_xrgb8888_to_rgb888
drm_fb_xfrm
__drm_fb_xfrm:
        stmp =3D drm_format_conv_state_reserve(state, sbuf_len, GFP_KERNEL)=
;
        if (!stmp)
            return -ENOMEM;

Since drm_fb_xrgb8888_to_rgb888 is a void, it calls drm_fb_xfrm without
checking for the return value. Similarly for other drm_fb_xrgb8888_to*
functions. For the uyvy helper it could just return without
doing any work if it is not a multiple of 2, like in the -ENOMEM case.

> >
> > Alternatively, drm_fb_xfrm can be exported, and let the driver define
> > the rgb->yuv coefficients? But I think it is fine since _to_gray8 also
> > cites BT.601.
>
> The current constants seem fine. With the 2-pixel alignment, there
> shouldn't be any other cases required.
>
> Best regards
> Thomas
>
>
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstr. 146, 90461 N=C3=BCrnberg, Germany, www.suse.com
> GF: Stefan Gaiser, Jochen Jaser, Abhinav Puri, (HRB 36809, AG N=C3=BCrnbe=
rg)
>
>
