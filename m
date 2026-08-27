Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70C92BE051
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 13:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787838337; cv=none; b=cPsJ4UIxi/N4kf3C4ruZwvda2Co6mIf6R++1Y6tA5/ApwRVQE3E0pMt7mPi8WxkBPPjSyYus0+mkkPo5BMx0qEIZFGZw1pwdRplO/JQlz7XExjlN1Oa/4qpI08UJv/ZwjM+L6iiSl8mSnfxLyGXeiiCUwtSeB0RJOdSYBEUxPeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787838337; c=relaxed/simple;
	bh=/S4gsVH8mJtWJta8ygXhwcguDk0Wa7KT/h1dqe/7BO8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GDVZvaiWTt35Xc/AhiE95ob5p4qjdVKjQ+0xbWYOrWGco7g4wOkvVXuMcBRqcaN9xkY3RqeikQkZNBpgcpGzRgbWJsnzOra/4TyKaIRj0oaYM0CuRvvoOQq4EvEaYJnee8I+jqDTJS61+s/I+3pC+L6XaouDmMUke6ktLTRj9rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GS/X6FpB; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=D5NMRANt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GS/X6FpB";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="D5NMRANt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787838330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=CqL5GR4/LfSzZQaiC+djEvxjAQw4ctnck/dWaLycuXY=;
	b=GS/X6FpB1I9YTC9GAThNbYodj5TWC+c9Qcq9qfKt+SVJmBCpAmdypxnhbHyfiGR4gV0b8N
	HDuBZDsz2/ng21vgaszR9YFuqFm8pQqKy0yppk9bi9v+eialjDjUBozlrNYPX3JCWqAbcP
	B1+mRRhYntiFvF+I+1qhQ5Aphuq+uSs=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-48-G3QVmGASMHqZufUS_QD96g-1; Thu, 27 Aug 2026 09:45:28 -0400
X-MC-Unique: G3QVmGASMHqZufUS_QD96g-1
X-Mimecast-MFC-AGG-ID: G3QVmGASMHqZufUS_QD96g_1787838327
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c1c25c44d15so96213666b.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 06:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787838327; x=1788443127; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CqL5GR4/LfSzZQaiC+djEvxjAQw4ctnck/dWaLycuXY=;
        b=D5NMRANtSMsVz6CbppTmZ5tNCMNNNboJEwv8krg3G+zSe+I+hGa7sTbIw6ufzbiCY2
         bTV04XFiet8ki2ZCIAB5FToToIQD0+U2WZS9tCJqBkJMHvOcYlTdeED76C6joljCOd1R
         FpzEMCapQX5+r8fsm1/p99tRmNNjFbArZtfmSqAzn/EedB51g0YMWj9hVi9pnWSRylx8
         n1f2yin+tJUJ459chaKQ1r94OV386hEIUsP++sEu6TM2VDaeLg3uWWnRmfdkwRakKvqH
         bzCAKB9cPlUUgtPYhGc6QP8KW2JIExmMNLYBagrHsLtsnEh2VngttxDru5IoPzJ4djA3
         78tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787838327; x=1788443127;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CqL5GR4/LfSzZQaiC+djEvxjAQw4ctnck/dWaLycuXY=;
        b=HfC3Q8lf611rsIO3Ilpu8uqH91HJwSBsmWY9gQO+ri8lwv1EvgTG9XSI3+JqBMm9ub
         9X+hbv2XnltQWydxWClQFaH8m8ZtK2PUXcBxctGc2+wq8a4l/fQDl+horZ/KebOV0YdV
         /l9YV1oUF5+fc25NQgZU2vMxDy8OkiiyMORiRxOqGMt1Ll5HuQgSR/Mn4wQMhDPp8/ID
         FwgD6kshsJRfMMzk4xYkgDzZ1GW5ySLUb0UDreJe/SzwRCthuT+kgoatRJdsbLtQExKO
         Y3h+29jso4AYc5Vc+o5TH2Y5agBN3QRBCLyjfp9T3AD6ZDS1ba38QuwSyFsPPdB9nGiG
         Td9w==
X-Forwarded-Encrypted: i=1; AHgh+RqGJHD27hQGU579fjfLaOdbuSQ9kRJH7OpPpByHT4RbS+hhFQauIGrFlJGUdzuk5LAoFS06nmea5pVTq/o=@vger.kernel.org
X-Gm-Message-State: AFuF++kLmFMlFAFBFaYBcRSQJY+FV3V6gY/NrmDGpJ6l9SWvkErcSy5S
	fv0GPbTfkQ2i2j/lNNcdj2rmKJqJObH1JvYEBcyWzZwQdtvMQ/p3+1MotalLuEd6bHWnPXfY3n9
	LhnZGjaLQ/wtLty1hAn5KK6qoMMsrcBq9wLknSuDjETVpky3FgqLZ+4NwAyue90bDUg==
X-Gm-Gg: AR+sD11ZHwKyHrVt8OmJI9NzGsM8FrzTfQ/bl3tq+lpkn9OrjXO0zi+Rd+eAloHAfpL
	LiP/sn0WETkp+YTQ69dXJ+jmAaQv/C3Nsp0XFgYGYUCXRdTtM/akcscZxfsnWYrcHWjBm2Zn7rO
	Z2YZwUEASVSt6vwWM8eYKWoyJMzqE0+fliaWZ1q1nGR9Zh30WIxGlwESQvPz1zTd9Yy0S+INRNw
	fxCZ3iy7oldMsAteE+PBB2r/QuFJbYHavYfmzFKCxib98sdnk+hTLCGQXZH2cZ2/xhDH6Nw5xOz
	6P0YG4NcrHHVnGhSLjxZQ1Y15EgjooFpTAHoVvCFZtBk+owMRKvcw3RkI+tIKxz7jruAuSgVCs6
	V7gouWbOJTCfy2WIaxw+uq/8KETy/JGeVGP+n9EuTg/38SvXcgVEP0WbAeswWnX6ktn5n2w==
X-Received: by 2002:a17:907:97c3:b0:c25:378c:6262 with SMTP id a640c23a62f3a-c25378c6a8emr504967766b.22.1787838326717;
        Thu, 27 Aug 2026 06:45:26 -0700 (PDT)
X-Received: by 2002:a17:907:97c3:b0:c25:378c:6262 with SMTP id a640c23a62f3a-c25378c6a8emr504960766b.22.1787838325861;
        Thu, 27 Aug 2026 06:45:25 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb (212-8-243-115.hosted-by-worldstream.net. [212.8.243.115])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a73041asm818532066b.28.2026.08.27.06.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 06:45:25 -0700 (PDT)
Message-ID: <abe07f686da0a2127a9078d55cf5e96c41611eda.camel@redhat.com>
Subject: Re: [PATCH v6 2/9] rv: Add generic uprobe infrastructure for RV
 monitors
From: Gabriele Monaco <gmonaco@redhat.com>
To: wen.yang@linux.dev
Cc: Nam Cao <namcao@linutronix.de>, linux-trace-kernel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 27 Aug 2026 15:45:23 +0200
In-Reply-To: <16b5866f7425a94d42ae370e8e6974911ced9513.1787243842.git.wen.yang@linux.dev>
References: <cover.1787243842.git.wen.yang@linux.dev>
	 <16b5866f7425a94d42ae370e8e6974911ced9513.1787243842.git.wen.yang@linux.dev>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0BrZXJuZWwub3JnPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmjKX2MCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfIQuAD+JulczTN6l7oJjyroySU55Fbjdvo52xiYYlMjPG7dCTsBAMFI7dSL5zg98I+8
 cXY1J7kyNsY6/dcipqBM4RMaxXsOtCRHYWJyaWVsZSBNb25hY28gPGdtb25hY29AcmVkaGF0LmNvb
 T6InAQTFgoARAIbAwUJBaOagAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBMrKEfgLgd0WcK
 eo9u9KbElYeE3yBQJoymCyAhkBAAoJEO9KbElYeE3yjX4BAJ/ETNnlHn8OjZPT77xGmal9kbT1bC1
 7DfrYVISWV2Y1AP9HdAMhWNAvtCtN2S1beYjNybuK6IzWYcFfeOV+OBWRDQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-08-21 at 00:45 +0800, wen.yang@linux.dev wrote:
> From: Wen Yang <wen.yang@linux.dev>
> +/**
> + * struct rv_uprobe - embeddable uprobe handle for RV monitors
> + *
> + * Embed via DECLARE_RV_UPROBE() and pass &name to rv_uprobe_register().
> + * The caller may free the containing struct after rv_uprobe_unregister(=
)
> + * (or rv_uprobe_unregister_nosync() + rv_uprobe_sync()) returns.
> + *
> + * @uc:=C2=A0=C2=A0=C2=A0=C2=A0 embedded uprobe_consumer; set handler/re=
t_handler before
> registering
> + * @uprobe: registered uprobe pointer (NULL when not registered)
> + * @path:=C2=A0=C2=A0 path of the probed binary, held until unregistrati=
on
> + */
> +struct rv_uprobe {
> +	struct uprobe_consumer	uc;
> +	struct uprobe		*uprobe;
> +	struct path		path;
> +};
> +
> +/* Embed a named rv_uprobe inside a caller struct */
> +#define DECLARE_RV_UPROBE(name)		struct rv_uprobe name
> +
> +/**
> + * rv_uprobe_is_registered - test whether an uprobe is currently active
> + * @p: probe to test; may be NULL
> + */

I think kernel-docs for functions should stay with their definitions (in
rv_uprobes.c). This header should have kernel-docs only for what is defined=
 here
(structs or inline functions) and the source should have complete kernel-do=
cs fo
r what's defined there.
Use /** only for complete kernel-docs. You can validate it with
tools/docs/kernel-doc .

> +bool rv_uprobe_is_registered(const struct rv_uprobe *p);
> +
> +/**
> + * rv_uprobe_register - initialise and register an uprobe
> + * @binpath: absolute path to the target binary
> + * @offset:=C2=A0 byte offset within the binary
> + * @p:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 caller-provided rv_uprobe (em=
bedded via DECLARE_RV_UPROBE);
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p->uc.han=
dler and/or p->uc.ret_handler must be set before this
> call
> + *
> + * Resolves the path and registers p->uc with the uprobe subsystem.
> + * No heap allocation is performed.
> + *
> + * Returns 0 on success, negative errno on failure.
> + */
> +int rv_uprobe_register(const char *binpath, loff_t offset, struct rv_upr=
obe
> *p);
...
> +/**
> + * rv_uprobe_unregister_nosync - dequeue an uprobe without waiting
> + */
> +void rv_uprobe_unregister_nosync(struct rv_uprobe *p)
> +{
> +	if (!p || !p->uprobe)
> +		return;
> +
> +	uprobe_unregister_nosync(p->uprobe, &p->uc);
> +	p->uprobe =3D NULL;
> +	/* path held; caller must call rv_uprobe_sync() then path_put(&p-
> >path) */

This comment isn't necessary here if you have the kernel-doc up-to-date.

> +}
> +EXPORT_SYMBOL_GPL(rv_uprobe_unregister_nosync);

The implementation looks alright, but I still need to test it.

Thanks,
Gabriele

