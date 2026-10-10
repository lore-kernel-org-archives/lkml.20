Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0983722157B
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 01:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791596329; cv=pass; b=sHme1sB19YmnfGK8zHpPi//1Fs6w4B9hEWfV3q9LhrxNN1wWRBHlhbKJ7CMSVU7o4YbAmlY4rqhc1V1yOWyVpohV6H5KjN69YjKEV+It3fbKY8TmGV9MJ2sgH3+iBDFWG0xH83ETBygWWXWJyUWtCzZYUNH7k4Y93MQgo8/O9CM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791596329; c=relaxed/simple;
	bh=YTCJoB15q85m98YBfoe4EA80dDxBYWKHug0syEFnSsY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o4WQrEiVu/Infw1y8Xu36Goa0XvsbHqCYCW9n7+DJc5o1tZ0Sl74KwGUOHozXj+/yiv42xRGhMbe88M3Y1qX+fkX2dkvN06HPgRbvYAyQqhJaVY7TJ927m6AMSKZWtASIYnxvHn/nrnFFh1GNxekxNjW4PSJyddzPkpuEtqd9XU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PL3F5Q/X; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PL3F5Q/X"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3a20f06cce6so5447311fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 18:38:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791596326; cv=none;
        d=google.com; s=arc-20260327;
        b=LBFbpJ4lr8OJPuUAb3IMt9HXKZPNM/T5KPdvSbG99AVCxspzCTRN82Tpj9c2JHijuF
         R2a2cOw3SvsvPQdvs5A4ckWEgf7Slql7wh4mNoyFgnYC6Wq/lCy79FWMLULloBjO8VCZ
         f9PPfKiGTscEhovAhhhiI2QOO4qM7vDfE99czeZjMbsEGCm7WqBF8unUK4eZLkXTxW/I
         h+doDnUIXVyB6pJjUQb2qmw9m/sNt7EJ8tNSUKZzhJ8TP3Phvp81b5EtzKYy1sSD37GP
         FyifSoFo+PNVNom8tQ4dKPbEkKFmWfW8ngypYR9oyMVd19z9weBfH9qdfrEx5L2gOpRK
         WwxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4IiEhtbUL7yY60m+lBsH+lg3QCK9RwkIZ6GM5fNpGBE=;
        fh=j5n2Go2POC7a5Jb1g0jXNLJpR3NOMQqddtccyMmM8EU=;
        b=GRJW6fhPFXBuMtRu/LS5hQxwCNi1tv/c5NjteM3QrO8pA4l7OgQGwpWzg52UKzTaPS
         dB4R5kHZ155tYkhSwfHpzaTFS4hE/n+7AaYgVgbb9w6XxicCBBk4pWkr//s2fteJT+e2
         Xbq9S/WTAAmd7T0YMEzxvI5vwiJi0pO8OrDP7CuPfSPhAPbu82aakC64v+2B3zHgfoVR
         qTuN7OuUOU9U6BLM+1eGncKy6WRaoIHq9Va/iwAbHSy8Tuz4d2xIg0oKC47mC8ulaPVX
         /sL58MaFn2NZM3fRXIN341dm4cBZr2udRg2mSfQ/v3Zqpq8pQ1LLWqhXK2fQ7sNYdCaR
         agqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791596326; x=1792201126; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4IiEhtbUL7yY60m+lBsH+lg3QCK9RwkIZ6GM5fNpGBE=;
        b=PL3F5Q/XFQJGZAYB62IyCy4BC1kCwQ4COb70YeIzcDzXCLxsdNvMYKJTUZ9LMRi6SI
         qn7cp9NgrSP5sjM2lhC6XsuR++CwejaKfiy07xiC9H9XpNyROSgjj6NoApmz+9zWXw86
         sOJ6DH+ohvcBIEXeZFgNpJLDhSZhMgx2XpeaftrdVi0OGsdaeIJph+zZKqTCblzukT2w
         GyKeaouJY//UAK3V8nnmzdJIlvmZW3LUmStDbyH2q4zO45W7JYLdMtZswngL6HlrfxK/
         H3L7NW1siiXaKf0VhZc3Q1hYVfv62/1TerKUXtuvi1p8ktKaw0ICrLYdOmhl21U8WKni
         psig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791596326; x=1792201126;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4IiEhtbUL7yY60m+lBsH+lg3QCK9RwkIZ6GM5fNpGBE=;
        b=iFJyBs8cFSarxpLS8xbaeV7551iS90yDrP2AiyzxGlmei1+RdST2FI7OtjC5wuWPNA
         bCfIBGBkB/AYWKXQAfLSZcjnOIHTbjkTO2DyvUMPvRe/S3PO8638IwqnQzPRfXuBKmx3
         l/WvXZ5glEpui9Xgoh5crjSiFJWNibOAltCgfABNJ/QkVb4rQ5Cp4Rbc/FJPzDiQjUnQ
         TWUpdI1SkTLqsm2jmR5eep8oL8jVSxQ364J7SX9kVrz2xHxFEIcqFdB3C1PePY5FYRe4
         RRmLlqkUNw9Htqx7EuLvwJWBGhsJvtfXEOblEICW5YHqMEY2uMohIjiQvFFoch+TFIQU
         Igiw==
X-Forwarded-Encrypted: i=1; AKwUvByF41hnZqSymiUb9m4Jtd2LVnaXvGLwVDN+YvLa96K6lFAp2CiIPMlK2Ftmqvij54Urq5BqO3KJhexy9SE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmLs44zp1YoVbsF1MhQweABU3nSStkXGyFORaR3AJN5iapD3kD
	CHBH5WK+ZiiwJ3yoW/3jxhEcoDfeRwxAf7LnCYkYNfjsjDnRj+IIic06+wtJJ0TUg4YeqG+MZ5O
	q80wYIHrUP0gvwjKc2+bR+l7NkOi4J6s=
X-Gm-Gg: AYBFou1mUiSlFrQ0tw22JN1d8X0u82KqQG/9k42kSgu3eL5Kv7MeMMCpCGT1RMh9YMS
	o5+URONmAhBDfp75NE15+Q29mXR6sOCXjN3H14XeHD08Fj85mLMRbpHpJHwJDCWIFwutXBWTkJg
	a/YeOehTiP5EHrQxvqMeOTwabMhH5kyjvrZuJvBP58UH6ctIqjXA1pXErTgul8sqlz3ER58tjpu
	Kbq8VHSWBKuNQAftT9+ROxa9NsIRvD1Sormlj2kD3zaAcorFdzunMaXII4yIs0hEXGuxxf73bkx
	/rb5O5jYyyTrk3UC/KIt0yQJPJp2wi1R8tDvT3bs4x3ZoX5JrXE1t70KPqoIS7TwugxwGj9P/L0
	bu8faK30DR5kTm26bRFP/7BIs/lFg1AIxf53qg65ujPsMalHi7inpw1z//k1nyS5xP90XklI=
X-Received: by 2002:a2e:9fc6:0:b0:3a7:7cb7:6fc1 with SMTP id
 38308e7fff4ca-3a9c2b33e46mr8206521fa.18.1791596325760; Fri, 09 Oct 2026
 18:38:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009115627.969047-1-linmag7@gmail.com> <20261009115627.969047-4-linmag7@gmail.com>
In-Reply-To: <20261009115627.969047-4-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 9 Oct 2026 21:38:32 -0400
X-Gm-Features: AclHuK9Fi1GndyEHj7ANB-B3irwZ-xExWAZmGHD2ngXtyZ5q064c9xKFsIu1uhI
Message-ID: <CAEdQ38Ghh9rBzHSMoJ7WwwVWgwhou5d74KStxwEwRNG6hOJUEQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] alpha: bound EV6 logout decoding by the processor area
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 9, 2026, Magnus Lindholm wrote:
> The ES40 correctable logout frame has only the common CPU registers before
> its system area at offset 0x58. The EV6 decoder treats those system words
> as extra CPU registers and reads beyond the 0x80-byte frame.

Is the short frame specific to the ES40? I would have guessed it comes
from the common EV6 PALcode, in which case Titan and Nautilus have had the
same problem. If you know either way, please say so here.

> + if (mchk_header->proc_offset != offsetof(struct el_common_EV6_mcheck,
> +       I_STAT) ||
> +    mchk_header->sys_offset < offsetof(struct el_common_EV6_mcheck,
> +      EXC_ADDR) ||
> +    mchk_header->sys_offset > mchk_header->size ||
> +    ((mchk_header->sys_offset | mchk_header->size) & 7)) {
> + if (print)
> + printk("%s    Invalid EV6 logout frame: size %x, CPU %x, system %x\n",
> +       err_print_prefix, mchk_header->size,
> +       mchk_header->proc_offset, mchk_header->sys_offset);
> + return MCHK_DISPOSITION_UNKNOWN_ERROR;
> + }

ev6_process_logout_frame() is also called for Titan and Nautilus, and
this has only been run on an ES40. If some other firmware builds its
frame a little differently, we now print this one line and throw the
contents away. Before the patch an unknown error at least got the frame
dumped.

Could the failure path dump the frame raw with mchk_dump_mem(), with the
length taken from size and capped at something sane? Then a frame we
reject is still there to look at.

The rest looks good to me.
