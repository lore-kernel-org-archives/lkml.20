Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com [74.125.226.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8425921767D
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 03:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.226.235
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790395021; cv=pass; b=gITBjoDNOY5sRCOkvRd4oNKyPxb2AuRnYmFP8IjVwd/jpyuQiJmqQquGdTusRVFPdNUtPihHmVQKIPLiz2H1ATJNXkZF34fpQx33uyQAQs1KZbwS64NwDgxBKuameJAXWnVdmM3gjBitVaayX6WLrkczhMVB3cLSa24x3f3lMTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790395021; c=relaxed/simple;
	bh=kZy9FlRDjUea/4cavqBXm9PiQeLiuh2i8j3p75iGMn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jsICqzS28xORa3r69NRmz38yQj2p2tgHCZS3L3dii8tMo3NzzUf2wNUZtdN9VgYL4KFU0ubLWqpzXz7BmCDa7Jgotr+YypfYniXOSf5O2o/ttoVRrsiIIvJ+neWLhZTHQKsTDtOiVabaB1yY5gPTGN9NYTPVAtDWUnx4BHe2C2M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rGIRSrWV; arc=pass smtp.client-ip=74.125.226.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rGIRSrWV"
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-98334af2ca0so508249241.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 20:56:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790395018; cv=none;
        d=google.com; s=arc-20260327;
        b=sQDtO0XdaTw7RSiexfOAJ0NMOfBJZ0o2vX7Bf/ymfXN8n50cQEBCvr46wRqK7+Xhlf
         JH0x8F0IMg2HQGkhSnyeLvxFa2GOfvsnACjKqVtG7KoxnoTu/Q1wBkk+LlZSnyTfgqvp
         XQyuLS8T4mMIes7WlMU3uU5G4iSAIlTGMTepDinzLmyUaKUU9XUTQ0EK/R9ajYri/ly1
         5yRfL2tlvLqtQw+7N+bbWtkc24mnlM5lr2lhd/ZtEbruCoMqgEzsPeY59AIsc8afoHwS
         U9scN5XehdadmBZQsB8emZ6XAWBD3gEQsV2m42t+qfzmFtFz4suTmN7LOpliWSQpD413
         fD0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=31bXx9DDYtYaMyGphvOilRAP9jmRVAn7WJ7/Gygm+I4=;
        fh=YDchlwIcxYCkrxptav/nQOTwLfAtEV31FOnGGBuwaFo=;
        b=CeEwv9dgvznQDwLyS5hoLUiX6lp9ZOwEo4vGbZ5BwG5qSjwIVKBFsiz1S+9IQZMhLl
         H26XFYY104zogiVjaJxAFHujZRbBkjGW2xhCMP43mA0gVwIuWCipuCcMeIOd2xSZIEe6
         7X0i+VvkA1zt0iAGFzjiVq99UGCYPNkyzZxofeYf5l/qvZMlkxs2fKwMH7ACAjwkwf2z
         Sgi8pExjleJynXTS1hPptGpJiYvpxH5boA55DctHFMJpzvmIMGl1wMcwl1iwaZpT7TDV
         +jbd54MwUP81GGTKHsGHwaF+xA+TWCL4dfomoUulJB4cItY8gO/S7uYR84Lin0CJuxfN
         gmmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790395018; x=1790999818; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=31bXx9DDYtYaMyGphvOilRAP9jmRVAn7WJ7/Gygm+I4=;
        b=rGIRSrWVGL8wlG5UhqAbQoK+F7yZOaNmc9nLdr4Jcac2tQr22wQDB1r3Vx+7aFJ693
         HDQT7ITvxNmAGSX7dFMFDeagsz6AyUCD7LtY82rYgqL9RCOxm4vleGeWruEY+Fpi2q0H
         69Me0ZVT+136JVQBHGWzqphA2NoBrifKcJ3oao7LMtxa+QiccmHPjSh78RyjhSqvVOMl
         28QaEBZYBZhGFHnMfqGA774hIykG0b56sGRkG3A34wIdoA8Q9j8YaNChwSzCW0Y0mDvq
         J9dM7niD5sDpOEUePPotRlMRd/4Hgc6lgf4pJ+UQoZYU2XeEli4yPXkYBVkpjI6hhrYP
         PEWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790395018; x=1790999818;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=31bXx9DDYtYaMyGphvOilRAP9jmRVAn7WJ7/Gygm+I4=;
        b=Qr1R0mznMQpyJo3r0XT+ExzLbPFHCUvkux+TRU1SRNnMBPHs+UR67KXNFp/5X3qLQ6
         C3hW82JJRt2L+DfQMi6q2h9ktD/m5/ynL1CM5Wp+2VimkHA4HLY0422C6vyJ/4rW3kpk
         OjhfskUoGEXc6wE56lFkpwPcFLLOfbGnBqmlOgzCBnmDWWQeQUesUHvtU/KdRYTS3GDK
         k94mv1t/wmnoOK0elG+KZK9Jk+PI5W1rmA1FTuLrJ3LqdJ9+dL5KagF2zzIFtVYX9DqL
         Nz9j2Djn5Dibeo6Znv3l6RR0exGiYdHvfYZK35iiLE5kCE+QXD2wP2ekpgbWYjYqkut8
         f12g==
X-Forwarded-Encrypted: i=1; AKwUvBzPRpgE47bymIQ+/ittLSS3Iw4h3Gl54fodxiwOtkKi0tEljMzZn+0fj1XHvONh/YzXRC2WtVzA3lfg4b4=@vger.kernel.org
X-Gm-Message-State: AFuF++mEXjnrnOmeoOOEmCvq11VjqkRPC09e2JhR6zyRTr5Dsy7GuIyW
	7fFxIy/1tvhZSXK/3B8iQvzI2M/+dfi5Ht+ODRIFWN+4NG2Cih5t9gMWLFozaGzlqvRGtHCdUvM
	1FYtrFnXPH8RUYlivFZ8rapqPKU8cFALO5D4OsRU=
X-Gm-Gg: AYBFou2NRLxH2A9LSA9zOuZjSN1S1S9EZwEQyqjilHYeKpNr2oLZZQ5+vY4XprjYxuw
	abXRqd7UUfB4eWf3GkXBmLEkGh5ucrqn2UhPYle1NkMoYV/n1nVzcSz2TXFEKeYwHJiRNVWBVQz
	j8B7ewmLskQFdmiLnGLZdFVuGa2Dz/U3q/qMWADGeb7AMC2jzQmFn5CNxHlG7ghRmcSWmHa8uh9
	maVQZ/ViDQMYO5ltPVPB2No8YK6BM0dVZtTVICcAw/BNaUC9WQdwpykVQxEaTulyZOo3B8enDnD
	Og5rvb8yZSiC5aOwKD/nx3ARmq8Bmxbus1TKlO4B5xsfUrhMYa4iB9H1HVenJ9UkfDRmbsIE4Wp
	5EWX31GxwbnXeXwjaohI4
X-Received: by 2002:a05:6102:512b:b0:7b3:5cb7:49 with SMTP id
 ada2fe7eead31-7b35cc64b1emr468961137.31.1790395017546; Fri, 25 Sep 2026
 20:56:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923055320.2602534-1-morbo@google.com> <SN6PR02MB4157A2693AE5369CA19A84DCD48F2@SN6PR02MB4157.namprd02.prod.outlook.com>
In-Reply-To: <SN6PR02MB4157A2693AE5369CA19A84DCD48F2@SN6PR02MB4157.namprd02.prod.outlook.com>
From: Bill Wendling <morbo@google.com>
Date: Fri, 25 Sep 2026 20:56:41 -0700
X-Gm-Features: AclHuK9ZglMRgpOjf7nJE9QEEZwUIEVC7ZTeuasL8ipLCjkjknKZffHOUZ4KyBI
Message-ID: <CAGG=3QW1HvN9Rz0k41jnDv4YMY1-LA0NhiA1B+CqzRfZThspbQ@mail.gmail.com>
Subject: Re: [PATCH] Drivers: hv: vmbus: annotate struct vmbus_gpadl with __counted_by_ptr
To: Michael Kelley <mhklinux@outlook.com>
Cc: "K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Justin Stitt <justinstitt@google.com>, 
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, 
	"codemender-patching+linux@google.com" <codemender-patching+linux@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 6:55=E2=80=AFPM Michael Kelley <mhklinux@outlook.co=
m> wrote:
>
> From: Bill Wendling <morbo@google.com> Sent: Tuesday, September 22, 2026 =
10:53 PM
> >
> > Add the "__counted_by_ptr" attribute to the buffer field of "struct
> > vmbus_gpadl". This allows compilers (GCC and Clang) to perform
> > compile-time and runtime bounds-checking when KASAN is enabled, prevent=
ing
> > potential out-of-bounds accesses to the GPADL buffer.
>
> It turns out this "buffer" field is never dereferenced. The value is save=
d
> here only for the purpose of passing into set_memory_encrypted() as
> called by vmbus_teardown_gpadl(). The memory *is* referenced, but
> through a wraparound mapping created by vmap() from the struct page's
> underlying the buffer. The mapping is created in hv_ringbuffer_init().
>
> Given that, is this patch still appropriate?
>
Hi Michael,

Huh...so it is. The buffer is converted to 'unsigned long' (*sigh*)
and then passed into arch-specific functions, which do what you
mentioned above. Given that please feel free to ignore this patch.
Apologies for the extra emails...

-bw

> > The fields "buffer" and "size" of "struct vmbus_gpadl" are assigned
> > exactly once, during GPADL establishment inside
> > "__vmbus_establish_gpadl()" in "drivers/hv/channel.c".
> >
> > To ensure that the count field ("size") is initialized before the
> > pointer field ("buffer") is assigned, we reorder the assignments in
> > "__vmbus_establish_gpadl()" so that "gpadl->size" is written before
> > "gpadl->buffer".
> >
> > Cc: codemender-patching+linux@google.com
> > Assisted-by: LLM
> > Signed-off-by: Bill Wendling <morbo@google.com>
> > ---
> >  drivers/hv/channel.c   | 2 +-
> >  include/linux/hyperv.h | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/hv/channel.c b/drivers/hv/channel.c
> > index 7e4cc6f55237..7042de2dd481 100644
> > --- a/drivers/hv/channel.c
> > +++ b/drivers/hv/channel.c
> > @@ -548,8 +548,8 @@ static int __vmbus_establish_gpadl(struct vmbus_cha=
nnel
> > *channel,
> >
> >       /* At this point, we received the gpadl created msg */
> >       gpadl->gpadl_handle =3D gpadlmsg->gpadl;
> > -     gpadl->buffer =3D kbuffer;
> >       gpadl->size =3D size;
> > +     gpadl->buffer =3D kbuffer;
> >
> >
> >  cleanup:
> > diff --git a/include/linux/hyperv.h b/include/linux/hyperv.h
> > index 9e109d91aa14..408748a05440 100644
> > --- a/include/linux/hyperv.h
> > +++ b/include/linux/hyperv.h
> > @@ -780,7 +780,7 @@ struct vmbus_device {
> >  struct vmbus_gpadl {
> >       u32 gpadl_handle;
> >       u32 size;
> > -     void *buffer;
> > +     void *buffer __counted_by_ptr(size);
> >       bool decrypted;
> >  };
> >
> > --
> > 2.55.0.1082.g2b9226bbc0-goog
> >
>
