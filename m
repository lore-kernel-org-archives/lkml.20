Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D552F8E9E
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 20:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788727741; cv=pass; b=HwxxNyLmMgnUzfMGZVlMSmfnIzY2WtmKUvhbJ7hHmDy/1S3Hn1KkzrU87CKeWUfH4PfBtIBlvUn1CBZv/xgV+maX6Wqvu+eMFLTsyASFK1lqhpsDJklo4XBVdnbccOVUmoewHWKk4UB1HeMxI2np1KH+IXz8g3xrqHtxrp8cNZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788727741; c=relaxed/simple;
	bh=L82HQAgQ+2CVzu0Q2LDItaAOLTBjlX7/PRc0nX33wE0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T/DktgWgvN5c0b1ELOvvgFE9+l0sx9CRRnOyBq6pq7+vBPmFER+febIysHQcESBXiDS9BrDSetUW0ey/OY1sCcJjyigocnQtvXxSMKZbLkolmiyZFzy1QpsO0Ulw4uktQTTu/h6n5bxIlwpk37qL0iAZxQ+3TmDR8HRNrWTm210=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cZk5KDXz; arc=pass smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cZk5KDXz"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3a33307ecd9so31551881fa.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 13:48:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788727738; cv=none;
        d=google.com; s=arc-20260327;
        b=gv1wP7A0Uu+yb2NeOtu4WeVEx2gkeaRF8ApAL92qhKNTZoJQsYmV2sp2NHT0dC5P85
         Ynv9HMU+RyzwFvsJHStNZNcMbDGDdkVXdtyvau7XJ2rpEdM5Gg+33bPc0nazgKDcfBGo
         5/brxcj5uLMXsDRbyTGiw8LAA1ivyLOjTAQqC/5BXHmXI4offiiWWSWwlJmGtERRhtkC
         X2Hej+SgfthH+jgjK2DVLYpReVK7NzyjgXoJOruAKoywagUaF0rbGpJi5WuiOK6Ha2pT
         ++EEJom441wi1Kqxlpql60mg9NR0f/pWxEJjakYKg1JNWIgXi//Yo0dHpDh5EDEXIqtj
         vfWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L82HQAgQ+2CVzu0Q2LDItaAOLTBjlX7/PRc0nX33wE0=;
        fh=oIIbfSJZBY5CcfNAvhbwC3qp5aM5SjiYtMCXU0+UvZ4=;
        b=BTdwhoCl/HyDBgYyrLj2pPwSyWXLGRY4N+Iuea4Z6+Qw2dsDAXASgizAqqd6XXQVZl
         hkqq4C9Okpilj2G5y15sxJpYzAWx9mLltAp52VSCDKf+ISIJrtvxNcdbIHle3GE09Hh2
         0XIkSFyIe0Uu58IUbCs3jbkQWBu7tpMamaoI5uzYdmdOy1pD+nniITMgSvQqXb4kmVn0
         j9v9uj8C4bwpEFBlQoEj5qtW/UujHGze3DQYKXuvHvCv45mr3mNjNzxk+3b9e5Ylqtjr
         LTmzctlpEVJzEkDE/ERbXrL6gdfQyHTriV/pL87gfdX2s/S7KemwIvmmr9Kzqlh5S5nR
         83pg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788727738; x=1789332538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L82HQAgQ+2CVzu0Q2LDItaAOLTBjlX7/PRc0nX33wE0=;
        b=cZk5KDXzUETzj8RP8JTI9IkiZEty11Uz/+7XcIxIdfsEdrw4wen89Gvqxcjc26irGP
         Fon3+vr1MngpXMTwXeyjEcQ/OIjz/vDjLR4EvT0P01TeWgBxnT5Vw8YMqu4W0H/jhdvQ
         NxR581SALe6XyO0zhxuz4HJsnq684Pa3R8coRqaEntbIVbOsW3iGgpACx9bWFpW7sGSA
         tm8x5uY55U6S9aHUX8RCXDpAXtzWEZdtW5POhbJn/VNYNBs2ulN9Rk6Igx6Fdr/9CKMR
         sZ+4lZxRH+JwaR0hpUYqpxWgS/rftIxaeGgUwjgDkNUUuhuuXe3xLtc8KpIjPlEPwZY/
         GSqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788727738; x=1789332538;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L82HQAgQ+2CVzu0Q2LDItaAOLTBjlX7/PRc0nX33wE0=;
        b=ErMq8eG6B03mF6A6sRykJBryy5sdJu7JFrziDtsI6uHj0qZ9ZCWQBwHQLHayyE41rT
         5KL/JItJe/zIuwhrgbzaQlTKkAFXzpiKYA8Yo0LhNKyi7CvaOgXKujy7VWzyA/CGzy0W
         Md7oNM9T7RcDpyTvmiMRsWXIxMdMwFyCEk0TWVyDyp/JqN6G2tW/9BZH4LnnfhXb0KIl
         WGbHTKzV06uAeLaUsCKUaAFXsq93wZmK+DWbvQpb30Wq4CV1DI9JWLOlVZ9f8n6eMACa
         c2KY0Px+xxYjVshQxYK8Pq4e5GYhuIqzsn15MAgBIUx3Aojzl7FkAWPrnlimE8uSbRaK
         fWsg==
X-Forwarded-Encrypted: i=1; AKwUvBxZrsB8Ruzmh1QNLropPidGruMiLJfqiXjfXgrBcUylyrUpVSZjJzfZreGL0ADvYzXvmsBEyBkox+nVbgY=@vger.kernel.org
X-Gm-Message-State: AFuF++ne7AxHvOzXFYYce/8IHpH4QyYKTtEJa2ztgnmyERWEU8oAmk6c
	tZw81DJ+dOp8M0/GxVKjiMrQWqT+Mm0X2DO1NnQfB0LEI2mdqLoG5ddS4/BnJ9ITurWfB+f5+n0
	ZtPnyhDgW18aj9JnW1zExIyCIMdQE2dc=
X-Gm-Gg: AYBFou16E9Nt019FWuMZhUw6q4Sj4TRxIFwUwPpYyQFJ8LIdnZQ7+g4YKN9KLZ/F97m
	60Zw5oMKqaPt9tw4je7gF8BxqhUjxPQkocm5EaOhBpL3vMRQH4IvxE3eCnncpOZoW9XL2noDwdR
	Y5ziBp6K5OoUCOCrglMb7h8Hk8E9TmA6g54Kdx928Hht2TnOBEIeJ3TM6vYSZ8EKLhlUeJnTbgR
	77e8w8B/alKj03dwbiWkU4uX1Y6GkCxj9NLfpEnjmU/1mxTYU6qOdICtpbTAwb+D9sIHSHkExSm
	H8/YoXyskhL3Vo8pKOCs6jONdTGWTzQilBNi5TXTd04243EF3MqdxW4UtjErGeeaLxid1g7LzDF
	0Sb4=
X-Received: by 2002:a2e:bc0d:0:b0:3a1:5172:c287 with SMTP id
 38308e7fff4ca-3a371b1c774mr20550341fa.5.1788727737292; Sun, 06 Sep 2026
 13:48:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260905-arch-kconfig-options-v2-v2-0-83e8245761a2@gmail.com>
 <20260905-arch-kconfig-options-v2-v2-21-83e8245761a2@gmail.com> <CA+=Fv5SC4qL76Fe_wk50p=8a069mKJ8ZAyUHMrP82DgvoHAsFg@mail.gmail.com>
In-Reply-To: <CA+=Fv5SC4qL76Fe_wk50p=8a069mKJ8ZAyUHMrP82DgvoHAsFg@mail.gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Sun, 6 Sep 2026 16:48:45 -0400
X-Gm-Features: AcwNN1XRBHy89Hz-biLi2GuAv1p3kMnxoZpJdzyZFQd3kQ2qcC8_lvRB8_pS3ck
Message-ID: <CAEdQ38F9KRFWj4BuzWYvbN9xf5brhwfUZuj2DC92iR-b+2fhFw@mail.gmail.com>
Subject: Re: [PATCH v2 21/22] alpha: add HAVE_PERF_REGS and
 HAVE_PERF_USER_STACK_DUMP support
To: Magnus Lindholm <linmag7@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Kees Cook <kees@kernel.org>, 
	Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-hardening@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 4:44=E2=80=AFPM Magnus Lindholm <linmag7@gmail.com> =
wrote:
>
> Hi Matt,
>
> On Sat, Sep 5, 2026 at 9:30=E2=80=AFPM Matt Turner <mattst88@gmail.com> w=
rote:
> >
> > Implement the perf register sampling interface for Alpha. This enables
> > perf to capture register state and user stack dumps with samples,
> > supporting --call-graph dwarf.
> >
> > The perf_regs enum exposes the registers available in pt_regs: r0-r8,
> > r16-r28, gp, pc, and ps. Registers r9-r15 are callee-saved and live
> > in switch_stack, not pt_regs, so they are not included.
> >
> > A switch statement maps perf register indices to pt_regs fields since
> > Alpha's pt_regs layout is non-contiguous (unlike architectures where
> > direct array indexing works).
> >
> > Assisted-by: Claude:claude-opus-4-6
> > Signed-off-by: Matt Turner <mattst88@gmail.com>
>
> I think this patch still needs kernel-side work in addition to the
> matching tools/perf support.
>
> HAVE_PERF_USER_STACK_DUMP makes the generic perf code obtain the user
> stack pointer through user_stack_pointer(regs), which on Alpha returns
> regs->usp. However, the interrupt SAVE_ALL path does not initialize
> that field, and do_entInt() does not snapshot USP. A profiling
> interrupt taken from user mode may therefore attempt to copy the stack
> from a stale or uninitialized address.
>
> The proposed perf register ABI also does not include SP. A DWARF
> unwinder needs both the sampled stack contents and the corresponding
> stack pointer, so this cannot be completed solely by a later
> tools/perf patch.
>
> Would it make sense to drop this patch from the current series and
> submit the perf support separately, including USP capture on interrupt
> entry, SP in the kernel perf register ABI, and the matching tools/perf
> support? That would allow the rest of this series to proceed without
> waiting for the perf interface to be completed.

Yes, let's drop this patch from the series.
