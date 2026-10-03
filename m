Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C619041F357
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 10:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791024956; cv=pass; b=VMxT6ySOYjDFCSajDEm0Q7ZvrCYqw6lEFa8GDsbecJDZCydVJa+8+AQivqm0L0r+uif9HSgO11eHWS2GXso9hgcUwNiCAt2N0vIoTtqMTnvYaVp2XRNfVa8pTgnv+MkIU2LoVGFlmugrkFEnCtZe62RCAHUG3mgC3VrITCewczo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791024956; c=relaxed/simple;
	bh=mJ8zc3y4Yld328Gl6e8lpiZpI8fEQoGkjf9tOKbvhto=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HYxYocZcIaFuaQC/LuFAVk6YkpQzCYU8xiPF9oHEcfWlIwy/IZY3oFeRpWH7RITt7nJhEWU8jmpQN3vhqQPyu2zmc3Z9MJZEP2e+ghthIXFCtcFOC2RvAMPezABGRJQ62pEyHwwSUluXG7qdT+iMrAQW4hXKUPlERaFjbkgVTvE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l04ZQuER; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l04ZQuER"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-67124ad7615so211448d50.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 03:55:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791024947; cv=none;
        d=google.com; s=arc-20260327;
        b=r4dkFhPBFbswCQgtFHJJ2gn7c00JZFvcmQGGCl+tpQF0gaf42iiQ3baUMWpCqwZ0IE
         VMSYleTkvAatwco3fun2stihwP0Ktp0VeSHH34w833vBiC7TgWUbugarJUuQoFdHf2rs
         O5RgnSr+O6FnrVwc52aos4XX/MW7UAIgMz7hf2iF5EiPHtb7Rw836RrDlKYYPbwEsZ6o
         YIV361LDPI8Cf5NNkhwXOJMWPYV1LV3gw2WUh9/UqPmm/9NRTL2OVLGGMxn1vdYY/DZe
         0OqyoxFf5Vxw9oEKd2uyRRx+eic90aIc53diK2TzdsxdvpB0v/Puk+4fEsjZH0fJTqTB
         PQIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5Hoplvp4zRZKaEo+Yo3JBF1Ab6jSR1XjM/Ch3k4K9FY=;
        fh=/KTOubJ/XbkWvq5ydXfr5LlaI74wIyicAU1MrRm2xD8=;
        b=Ep477w7b6nUaaV6tmi021UJRUqqU10tuvxaNEXkB2X0qP00MaHt/XtLSDH0fFoH1g6
         3rO5Le03vD/Uh0adT4VWCk1rosQY7B4QCimQ90D69iSMft3/i8TO7JUp7K/yVLSbIzDe
         WX0q1f7ry6WlduAFUPVLNigSzzHkqtxNbh9n4XpKLUu14xElKDsy1AAr6is9AdwxYylb
         1zHT0Mz9XIAAplAfhgIEzaNhJQumpIkNrm47O+/JwUCWhMEwYXuQ+hCU222CE+H4XnUm
         KJMEYJpGsyHjPZ5dKUf0reRUDP/nhK8l4WWx5DIw0Uc0DB2X0WsyeN5BOQgMefhP3zAt
         OI5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791024947; x=1791629747; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Hoplvp4zRZKaEo+Yo3JBF1Ab6jSR1XjM/Ch3k4K9FY=;
        b=l04ZQuERGkM+542ipkWJ+0/+6BETkGVXeOnPXhRe2sIRVdgqzkSgLLt/c2wdWldgkd
         wOQU38j3DVFaP7Ak4pB3C6z2z81rGT58M740I6O+dBeKSs1Yw8RkalkUQl9TMETEiAua
         wNAl67rGM77p/TijK5kVRkEWZrXyR6KUApu+9TE0QfY3QYOvpP/JHScvskH3nIB817/T
         uJJEdkZkZ3OknIYQmvFe+c1WV+RBJH6bZsrz4TBFO9QacwVVpBVkiijNYe5JCSQGxnM8
         4c122MHuQr6ePH1EJ67FxJJdJqqxXWSd29SDbdEACJLfi5Jo38v14mwsEAPEMScZ1oYi
         fqyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791024947; x=1791629747;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5Hoplvp4zRZKaEo+Yo3JBF1Ab6jSR1XjM/Ch3k4K9FY=;
        b=oci6qys+W3OBeRKX+taFV43NYl4L94M7KwyOgvS8OTogI7PDQeMJnAN9pzpjx63Y9Y
         EJHbk9Wb+eqH2MOOrqm3Zn9jMjtUy0eaBMRwMPhFM4BWG9jq017QTJ+A28ftn4abVQgB
         vNm6z5LUH7E5iSRNmvs7CTM1SYMrNBMD+P7ymWYh+EP5N/SdoDt0QbdQ2sOGqE2t6qMS
         W5l5vNgbvG7Aocf7N1X5hRtYJXlsjFK/SKvC9/8v3gbSebaT8WpMmM6s7+Zw3RdpPR67
         hvym8u3vBwea6e5T13vFQjdSgIOmv5nn9TX8VHYjmwBvQIYQ9jzCRJECvt11KN0wV9ui
         Vv8Q==
X-Forwarded-Encrypted: i=1; AKwUvBzFsqraUHRx1amjzL6gbbofdMAwX6i6NHYQDSZv7tUGmzHrFQCeyFselRxDAMkiRo69d5ExlPZi82Re83c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLaBdoWNxVROlqscKvo9Rod9UpzN9rNMxtON32sIjaFHuHpih5n
	hbOZRl+5WyUlmCPKD2zvWGCFMX0Oz9ZSIuCyTrgaTWi+Prvix4ODTyAOvrwy6/mKhBJdLqLXMJV
	6bLGh6JeA4dMTmQrapGUP0wTErQRt2yc=
X-Gm-Gg: AYBFou3WAfXg/bVoSHbne2OOlqWgv/i1uUxhPFn7jFjTYzKyK/VF1g54aZ7T/bp+IR2
	3IsCKKpYnQVeg8PD7r0kZhWsyS1+tj7FLvnRpjB99Vs0eEULpifnbqYgLsnlQ9ukjahQlLS5zlt
	TCYyJKY9E/oI0xcy0EvZcZb5F0EAVr1cmkpr2UgTYZD6rekHv2hWMw4M8FFn7c2o5hcaQc39y2l
	7pPusVsMXE8/pXOytazWnYkQMIsU5/kiGC17moGXTuLNQx4m3o/tUTngv15in2x1Wz0AqYvhBdd
	5mv6fi2G8ZMsT9EIF3W+jogGESgz/5FmRdLSclCrKP/OnvF/V1vu6A==
X-Received: by 2002:a05:690e:11c8:b0:677:bf19:f0a0 with SMTP id
 956f58d0204a3-677bf19f699mr492292d50.90.1791024947570; Sat, 03 Oct 2026
 03:55:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930-b4-include-mmu-defines-only-in-mmu-code-v1-0-291eadfde23b@imgtec.com>
 <20260930-b4-include-mmu-defines-only-in-mmu-code-v1-1-291eadfde23b@imgtec.com>
In-Reply-To: <20260930-b4-include-mmu-defines-only-in-mmu-code-v1-1-291eadfde23b@imgtec.com>
From: Gyeyoung Baek <gye976@gmail.com>
Date: Sat, 3 Oct 2026 19:55:36 +0900
X-Gm-Features: AclHuK8SBcDcAw3IjrnUcRnWC_HF1LllwA82Z0gOcS9YWz92DsLbCevsVm-z4Xg
Message-ID: <CAKbEznsnKevHokY-ip6g7+TG+NQLJcKxaYEbqsKa47dM26s6QA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/imagination: Switch to kernel-style MMU defines
 and access
To: Alexandru Dadu <alexandru.dadu@imgtec.com>
Cc: Alessio Belle <alessio.belle@imgtec.com>, 
	Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Alexandru,

>
>  /**
> @@ -442,18 +424,18 @@ pvr_page_table_l2_entry_raw_is_valid(struct pvr_page_table_l2_entry_raw entry)
>   *                        associated with @entry.
>   *
>   * When calling this function, @child_table_dma_addr must be a valid DMA
> - * address and a multiple of %ROGUE_MMUCTRL_PC_DATA_PD_BASE_ALIGNSIZE.
> + * address and a multiple of %ROGUE_MMUCTRL_PC_DATA_PD_BASE_ALIGN.
>   */

nit: ALIGN is now a shift, so "a multiple of" in this comment no longer fits.

Reviewed-by: Gyeyoung Baek <gye976@gmail.com>

-- 
Thanks,
Gyeyoung
