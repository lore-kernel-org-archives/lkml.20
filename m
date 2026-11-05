Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793890166;
	b=ZZ360rp3rDvDDt1GeCO2mUTpx+X9atgiS0q0NfD7VMWRMU7SBCMyFggL2NN41icTtrbz
	 mE0gQ1sGdDuF0/AcnWav8Vqw4BisrvjiwxsHcvMkGHTDvOV56JVFOm8fy5lVDYe/AF2vX
	 UatPOywvtAjeSo4buWQMfk0lRLNKpPZScWFgmyR4/938XtsElYsRfCghqdjacUUPojcu1
	 Pmo9gsziAUF0ackWTo3uXFKKfYASbFUsH+lOJshM9Mjjpj1Q8aa8UGO2bb3pDDeACCgTr
	 S+24VhBPtktXDK83gjQXxihzZzbLvVHzTPSnQp2q4JjPyW1zM/CeTJAx1nVUR7OBl9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890166;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CNSQ2u2fdcn6xU89GMiVA2i17h7TVWSzkOj+YndWHWI=;
	b=GyrCP8rvR2NYJM1ni4OpX7SXcm53mOztnpti1Qg45YQU8gfZNNwCrh6x+lhzSjAcsp71
	 k2h5oLuU56MpOOx11STqz6QqD5gbv8QZCNxmId/T4ttWY+dxyv37TNzclGZ/oWZk0QKj+
	 iw3dnlc3pQ/RHjcHH8lVKNsl5YuIzrxLr75gEfMrdwGoXtr5MkRqoGZSNy8gVRY6zKn1Y
	 blV78rp3aphKDu00dWn/hJW/OKs46gca6WRA1aSZlZMgDMeRn6ix018zrEkXDFiYnHIUG
	 VENT8hAiPOAGgAHIWPVCJzHLqHB1ZMyo/ZVJUE9e2YVgDmhrTv7WvdWxUP2nj9eKQSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ToF8LLeI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D9B606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:49:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57D9B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ToF8LLeI
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc147d86bebso567241a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:49:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793890166; cv=none;
        d=google.com; s=arc-20260327;
        b=MGpCcBXMvZfCCFuYiq9RPfbMoWkCsD7JtqNK0DnqXq/zgOkbDzcg8WfgefjkVlC4mK
         Xv+PyWt/NILVeO5btgCUE+l/sEla8PxRQSULsrSxcVb7+d6iKFT3y3Kl3PUHAQQtsG4a
         6KPuyCenIaGwamhOcfxzOuTbRPC0YFTfWfYV1QQPfjW/UEz0Nm7pHq9WlJsDd/e5utHO
         PRnAnbzHEEaaYhEeekPFqKGTagoTFqAFJNdvqo55wlVurTBBhm/QjCnSz6OW72dcka62
         qIMEXsSETfG0bBPxy9Tvx3GyL8ZEfU2orMgSgE497RUq7Qgkk6Cinfu5hIwD4lj3sa5O
         h3JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CNSQ2u2fdcn6xU89GMiVA2i17h7TVWSzkOj+YndWHWI=;
        fh=7IkN3P+F36lIqWpAB8za8VTtWI/zXA/QIT5oBPMGvYk=;
        b=Pdk/LWB0AaKBysahBtQZbAZz77bpW2SuBfbJOZmx6N4tv/eXaLTt4Uevw5A066tq6f
         N+kKttsitgtoXzyLjUXUBSm+xTEEHgh3wfsApWp3IGjzXrzsmn432ugJ+QGXPjUGVFZB
         HULn6L8wcggTWOvxfmfaVjOp8o/EppVq8QHPtVsOSKUsRj3GZqkIi1nnb7Wc+PPXoLET
         K7NudXumAfQScIEYEMlgSb7PQM/iNyv6/JcfVaFsbXeMFClFusLgPxeh/aT/A+exeaWh
         fhg1YxqcZV5zlWPy6BTGIlYI8kwHJxF/Wz4MPtfxGVEDtxQ92+Mgno+T5xcQbBwDFULI
         q4sg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793890166; x=1794494966; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CNSQ2u2fdcn6xU89GMiVA2i17h7TVWSzkOj+YndWHWI=;
        b=ToF8LLeIaaP+GNEDDk68dv8hZyCHB1Ns6HmE9NgF9lc5WRDrzd0wGnIHuzkT9rviv6
         49lyBZqPiUa8udzzL/OMdqkG3ZwrK9E3yDjhSPEER6+foNDJy+MPwmb+n3+zI5c2rclt
         +cWa3sc0OlEA46tOguSeyt55hxMxicHp8V41KpLKIjKUEWTk888wr9cOs9pwZQ2GzbSz
         yfyi3v1I0bcLpvBqDcfMXAa268n1nSAvzPdfqrt2nOrBteP+Hw79eSiyWwx5QOfy7lJF
         nVYKaqVlBCZ9Fcatk6FBcyoNIhtZEdyMKWYWQy3DsTx1+d+fpVEehMb2wP6zJAT9+t76
         rBbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890166; x=1794494966;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CNSQ2u2fdcn6xU89GMiVA2i17h7TVWSzkOj+YndWHWI=;
        b=rzgnpCTXpv5hCUYmiFFsTiXBT570R7TbOaxp2niF38AmQLKxFf3equ7lnhPXUoNM+l
         3Y3Vw0Wgo1IEwtWzIrPqraYywh8ymwVv5sUvvabEPW2+P2KhxYg80NKVMvEGCK20SaYI
         lGj7j+NMqB56r03ciOgCHgVDXPe5COPhlir7nmFDaSFhs1utbzvBAxiM1md0J2CTvRYN
         S7QuzVTQl08s6x3nxtZDJYj7m3p4Iv9PtbfBw+gwCLfdqCcNnBo6dYgmJph2IuiGwVPH
         PzyVlxhctybbPNaUq1ZbyjS5acpmU4OM8xUX0c8Ma6GxkFrqXl3SLczL6tW4qFnI2Z/f
         G/6A==
X-Forwarded-Encrypted: i=1; AKwUvBxLgQcoP+4vtFlX9Ftlr84gBwRSr3R+1PI6VmHM5erDl6T3h8cT94x3eK7quwf6kHl51ixabWuMaO0ihmM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cAzS3zZOtHYZvkDmuvZVrTfwti9R/6IZWKcuwg64hC99ChI42
	kf/zsDg1cMin/JYHizjv7/vKrdyioI5inT56rOC473aTJzEV2cidFH3JmRBbDFIO/n3Z0X9oPHJ
	utaQd1kdnS23XDSgF+VvgOPRJO+vZIWY=
X-Gm-Gg: AYBFou0v80NETiKuyY+SMou9/IiACAR8OtjcoRwVcjW77CpT6zzAg0ZGSr2faHVzK3P
	7U0Z7FV2QfrTtQppo+giQHNBKbkJCnqcCIvI9KIU4MLO7iAn1xJ37wmzTxXry3UtX5UJfMcqBKv
	KcldT0mJsRXVtev02VwEum2Fybb75ZNU7RrdlBkF9mxYMc4/rMWlH58Kn8Yc7d/UHTaEfbvp7P0
	QbGNpOpMBuj73XOsAstfmHQzdW1KKWfsuYrgMkf35hb51H4ppvpbK+OIaTfG1hZO69xdwq38afR
	+6FoKntI53BGuPxLZx8T20g3OSJ6FSrBwnnIA0Cfe15G6rtgtp+mE61HI6yqZ2F6+Z4ouMBP4aQ
	iPAZakQp9W1wU1y5HPCjfZfyS5yO4f9pyNiOEp8wYBJsuO0qr+hukAW44OUH7eb2xzlbRT7A=
X-Received: by 2002:a17:90b:3ccd:b0:3ae:6e7d:7fa4 with SMTP id
 98e67ed59e1d1-3b0afe69796mr2135935a91.50.1793890165432; Thu, 05 Nov 2026
 06:49:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030195025.5153-1-muniquefeitoz4@gmail.com>
 <20261030200827.24648-1-muniquefeitoz4@gmail.com> <CAD++jLkYC2Fjwy_LFEP1=uUioGX0QGJz3pXrZrqzuq=oT_5EDQ@mail.gmail.com>
In-Reply-To: <CAD++jLkYC2Fjwy_LFEP1=uUioGX0QGJz3pXrZrqzuq=oT_5EDQ@mail.gmail.com>
From: Munique Feitoza <muniquefeitoz4@gmail.com>
Date: Thu, 5 Nov 2026 11:49:14 -0300
X-Gm-Features: AclHuK8yQLLiHYDlQTq1hRvCOMFp64maFXpGwrEHIdQgobRQ7mPOh-zouQTHhKM
Message-ID: <CANA1Dbk=Xw==LBpLSsYAxBDQMzxpcvkWajwzuZUZRC5-w4oT9A@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: amd: Clear interrupt enable bit on spurious
 GPIO IRQ
To: Linus Walleij <linusw@kernel.org>
Cc: Mario Limonciello <mario.limonciello@amd.com>, 
	"Mario Limonciello (AMD)" <superm1@kernel.org>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sashiko-bot@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus, Mario,

Adding Mario to CC as requested for v2.

Mario, could you please take a look at the v2 patch?

Best regards,
Munique


On Thu, Nov 5, 2026 at 5:19=E2=80=AFAM Linus Walleij <linusw@kernel.org> wr=
ote:
>
> On Fri, Oct 30, 2026 at 9:08=E2=80=AFPM Munique Feitoza
> <muniquefeitoz4@gmail.com> wrote:
>
> > When do_amd_gpio_irq_handler() detects a spurious interrupt on a pin
> > that is not configured as an IRQ line (!gpiochip_line_is_irq()), it
> > currently only clears BIT(INTERRUPT_MASK_OFF) while leaving
> > BIT(INTERRUPT_ENABLE_OFF) set. Unlike amd_gpio_irq_disable(), leaving
> > INTERRUPT_ENABLE_OFF enabled allows the pin interrupt status bit to
> > keep asserting in WAKE_INT_STATUS_REG0/1.
> >
> > Clear both INTERRUPT_MASK_OFF and INTERRUPT_ENABLE_OFF when disabling
> > a spurious GPIO IRQ on both the main and RGPIO banks.
> >
> > Signed-off-by: Munique Feitoza <muniquefeitoz4@gmail.com>
> > ---
> > Changes in v2:
> > - Drop the early return on !ret before writing EOI_MASK to
> >   WAKE_INT_MASTER_REG so that spurious GPIO interrupts disabled in the
> >   !gpiochip_line_is_irq() path still receive an EOI signal on the
> >   controller.
>
> Loop in Mario on v2
>
> Yours,
> Linus Walleij
