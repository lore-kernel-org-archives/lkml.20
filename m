Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E9C521228
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792068972; cv=pass; b=H2RUl/PsYmQXGAy09J2ciqx0eLacCsg6GIpWFvR07oJXIPDXDAYylDdZCpA6XnN8vF5bxeoTthsS6UMrtuSmlkpMd9MwJj7LvkHxSc/E5tjkCIvVUamRU8ImyB1h3K0vyhYgwi/49JFrREfZ4mSESXxrGvYda0j2d9YJoyX5xNE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792068972; c=relaxed/simple;
	bh=xJZzNgRQ324//rzTuOjELrAp8ovgVJgs5PkpDayBXic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QYiiTJUXmpecbIXDDcO6da1q+85uJrFsuRupKMT5sqZN5jS4Eex1UjwBFonkdBq4yeSvQ+ZR2i6hYZZhsmb2ifdvYeeUvu5Uc+Vz6XvSoXY5pojPKuWSTzsElDDqOnheLzHlzO4Rgdm4xoVaUzDxo1h61/by5H4Zwk7rTKiH5+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q1mkMmzE; arc=pass smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q1mkMmzE"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-91b63bd2030so63087296d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:56:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792068969; cv=none;
        d=google.com; s=arc-20260327;
        b=F2E60hmPfOMrP4HgCzKdlZrThAUWHVG9QSqZ5IFMnUKbtTOh57tRInQ2pkrwjMG8MF
         AbhCcgCsV951N3bIT+T+jesRFJsRD39P/jDMEsb8Fn1iwJC7aHezGE2ernLfv5SHTdxT
         66vGzxSP63xGVQXfeZArQ524qIfNa/jcDcBXRxLxcWnienOWE8x/RHSiG1q8q60XHL+J
         c2VlIR/wgkoDQf/bG2GP8bK9/QnxmU57/XxvQMOGzhgIFAEKBMewINMYSJQuFzt11GHL
         DYKkqJwzO0Gkj74j3aq0cvWHwVvrgbKu9XFoc7IF2iGNc6ki4I78RwaN/jVW5KkVZCCA
         kC4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xJZzNgRQ324//rzTuOjELrAp8ovgVJgs5PkpDayBXic=;
        fh=BvkgNNQC+OLhA8Io01lhyUOd56QUyCPuMHeY119adT4=;
        b=l/uVovZiU4nccfPFYPX3Z/BE0WZ4euzGpC2O25Zymk9siPaQyNxHgb8SOZXAEASi4B
         AL81RP9tsOsK+Esfb4KHIFXOLNJYnERAmdljMYP/wReZMic7NdZ0pVBjYE1MVT1maxGY
         leYqw8Rj5ZecmFQ1MfjoWR6pbnRuupTwlTKtrkf9FYTBGG9WnwsvhMKOM0fs2uB6+yk0
         NA8CVIeTRw+gP+OUjtY31vRONbcW3THsX4l3f6G5BEJyhTZl8rRCD037oELL2p/cJqSt
         Y4ofbEqdT8MFK1zbBesfWay6DOVL93OkUZ7RX2ZrEWEASbuZWN/FHD2PZS/03LD3q0Uj
         QJFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792068969; x=1792673769; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xJZzNgRQ324//rzTuOjELrAp8ovgVJgs5PkpDayBXic=;
        b=q1mkMmzEhHmj1FwM6JvEOkxVfYGMKpBu3LI+SwInDaAk7NESl7XBGb817suDFkQ9/l
         bR9cXz5CUwJchupPjMQO3I60qM/H6+nqPS/DxmtFsZy1JhzScj/4yKQLYQF+yBF/gueN
         RmkBTWnEWwRGdo/b0uVJBfNg4uG4h70tKsCYyAvpH+FqDrk2/QVLcM4c1qY+JL5ni7TU
         /7iipAO1rHzPIwekf5TVth5t8aJQ9PLyTWgz2d72Smr5syw+7BsYYuuxCAbHpYdMKpJR
         r9u1gO0va8UcptWTVztmX84MWCmwwqXy2m8tIPN6nEV983twCD1jW2bX2v3fIP5bfRS4
         rcPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792068969; x=1792673769;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xJZzNgRQ324//rzTuOjELrAp8ovgVJgs5PkpDayBXic=;
        b=VDRYEEpx/k/x7IP4sOQl1D5FD5DIktvZi8ibDHUJ0CCRzZ0pbjMnMAYQBLxt5tEj4L
         OKYhUMoopUzFxIDgCVDszGm2V9DYZTFJpump/nYCaPffa4ZuDvuW9grkerVpWhcbsx2b
         jIa9KX5u421hIZsido5m2QhnudnZVHTE3BFgitLYSyrX0CBGyMhO567E0ULQI2bSm7t3
         DDkaRqlQEY7mlUxM3kZ8358GLYyrxYyrVC6bac5R+2DFh0Bh6z38UJ09nvWDKRz3iBS0
         nEUxVqHzlNv516qNpj62TkvWNKYONckjsJl3cq4J8/X2ksPS85v/z/wFQK/2F0NGWgc+
         MdBg==
X-Forwarded-Encrypted: i=1; AKwUvBxvXaTj1sTVgb9aRjGV5Ag5nnHdwmFIpU08YsGfQI/Htztl6bSPib/gm+vtA6/iRza7P9Pc116PL8M/jl4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3WcwJUpM2znbgoyZJQdm3DUnIFL9AmDs7N/MYo0fE2AZXBKYj
	O1cr6kI8h88k5pfauYX80J6W5LpmsJ1ESae8yQn4KRqhP3HCoe2Aw0wj0sLvnwGcNdOhQ1+8Xe6
	Jw/sKEb67QplEViynCF7wviqhCcQPED4=
X-Gm-Gg: AYBFou1BqCqB4A+4cmTroQHydICp5tCdFVN4YxNZ7SEsA0Xy2k2ygsGynxqdquJXlZM
	MbKjKf8nCkm0IxbNPqXYt4nUnH+mEp7cLA3G+3KN1C2ndVYbmM6xWotGWIFdPQnXK2Nipbo+k1K
	UYlPL0B+5IWVCYRQcF2pGa9pEjIZ1u420CdV1DMqVgn6rlIM8KD28Sk9g7GhYa/YjUREEciGUr6
	m0dGJjMIl62RJVgQSSZTphK6ZhXWS8bHmaaKNQRgfhg6jNniq+msndLXrGHC7AnxdrYJGtrf++V
	i+BlqkDenGi6hTjcgRv9hPA89cAPRdPu9ZV0ogm3Kw1GF/3sn9Y+yWwBJSNJSobCdhwfNIww1Hq
	0uo+jN82UwAmUA8xIRihhCXguU2zoiyXdXhV8HfHFpl+e96NkQQ4eVjfgMc7v84Eskw1sFA==
X-Received: by 2002:a05:620a:711a:b0:93e:c12c:f12b with SMTP id
 af79cd13be357-93ec12d070amr2974615985a.70.1792068969457; Thu, 15 Oct 2026
 05:56:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013003702.5824-1-danielmaraboo@gmail.com>
 <20261013003702.5824-2-danielmaraboo@gmail.com> <atC5u4RPzVkVgTNm@wyuan.org>
In-Reply-To: <atC5u4RPzVkVgTNm@wyuan.org>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Thu, 15 Oct 2026 09:55:58 -0300
X-Gm-Features: AclHuK_GybjK468UjbNVzrWUTX3KGAPJSmhXF07BfS6LCMP087rHpUpK_iiw2Dk
Message-ID: <CAMAsx6eef_2Gcf_WhvTkFWz-fOjyaWjP+h3US0v1=w-W5RdHBQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] docs: doc-guide: add a guide for translators
To: Weijie Yuan <wy@wyuan.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Weijie,

On Thu, Oct 15, 2026 at 19:32 +0800, Weijie Yuan <wy@wyuan.org> wrote:
> Thanks for doing this.

Thanks a lot for the review, and for confirming that a guide like this
was missing.

> Current practice of the field Original in zh_CN is:
>
> :Original: Documentation/xxx/xxx.rst

Agreed. The example now uses a plain path, and the guide notes that the
documentation build turns "Documentation/..." paths into links on its
own.

> For the Translator field, zh_TW just did a cleanup to totally remove
> them.

Makes sense. I dropped the ":Translator:" line from the example, and the
guide keeps the advice to leave contact information to MAINTAINERS.

> Requirement for "Assisted-by" trailer has been changed recently. ;-)

Right, I missed that. All the Assisted-by references are gone from the
guide (the AI tools section, the tags example and the checklist); it now
only says that Signed-off-by can only be added by the human who
certifies the contribution.

> Shall we Cc all the maintainers of translations for more comments?

Yes, good idea. I have prepared a v2 with these changes, rebased on
docs-next, and I am sending it with all the translation maintainers in
Cc, so that every team can comment.

Thanks,
Daniel
