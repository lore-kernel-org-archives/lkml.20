Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792531213;
	b=PgM541CvBaNRH4agTDoa8yoEZuRo/M3zVXdFa6C6l/qUlT9DbeOuIR1XKNG7YOSzT/iY
	 vRNJpYh5lHxd+CcShAcud0K4gGbH5E4jr1q44Y867JvbZ0yiOF/CvT0gjxYPlADfn9F72
	 +YmnBMQLMEKWoJjNCOqu86Akg6nvtQ/l7mcW0V55fJFoeoTNKkevCrDRpr9Zpq9E5PGd7
	 FEUrOWWTlTd5WOeGG5FiXuS0Sg5Wfw/3Lpc4DyWgeWdOQ9ReDt4Ph1h0/xm2E6E8B7YhY
	 VrVkicgH34Tc33t/8/QQwiGgLvGi/8rf4Voh0uUbHaA+Ucv3O6uOZgoxBR+YmBi1VlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792531213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=wkyaExlLLt2nx7gNqNXwfDrIgcs0VQWcw2XolzKkMKU=;
	b=IlsmZf8uVUetjWaIMpfgYcz7H9O/b5eleg9BwUBTs13HGSFiZF4KLzUa7vz/XAqWfEWR
	 QAziBw54soePdCtTmOcQz8eMU0h+rah70XJT/XrCtAK9QgKFM/7Z4pHtVLqKM91Vle0It
	 T3BukQppcnwKprpkGmwta7xKSDFmNuAeR+Jby1GiWN+NUwe9P8gXH1kKxlJgBu6GbgWf6
	 qMGEP+NEoiDlJU1yL6pZwmqsWpDaY87Dr4tJH0/RPtvcT/BJaYk2hynmzJHtp8kEQ8BqR
	 QLs/wBfkCBzcYYP52U/FBoNDyFu4QpuuCfNOKjnnM7aCjmpAGrfjGLO2+LRfulJBcrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SUS10gxO;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE4A606A323
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 21:20:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDE4A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SUS10gxO
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48df8fe8513so69067f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792531211; x=1793136011; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wkyaExlLLt2nx7gNqNXwfDrIgcs0VQWcw2XolzKkMKU=;
        b=SUS10gxO62r557Q/YKDnnSdTSAxSrE3t+mP4K0wNuuw0F5n518AB6Q+kgUp0okUMeG
         lR4dfUpW231vTgQhJxTNMnH/iFqiHpVlQuGRl+dmMBCwwycMakFXDM3BGUyEZLk/VwDD
         +OsLVGVM8gDx/g8yeMsfrcorNXBKjrmpUGQ4OWN1vd6UCLKTTdQf/oJtSrDk6ZZjzgV/
         RMIAvYQ9Wv/tr6zjrNWVKU+GCyMX0z9Y7hcvu76G6BGSkcVnW7lohCEGctKNyua+e4Vz
         jkI+9mxqhlzt1vmhVCbWVfQmt2GuZelQMTnjq9sGbOvqG3QRhhpiacNi1FoXV5kNaQVu
         WA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792531211; x=1793136011;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wkyaExlLLt2nx7gNqNXwfDrIgcs0VQWcw2XolzKkMKU=;
        b=NV3e4XvUvUPzInvuRduffU7V1UbHe1mgueH8kNBrHwm/tVTfDANfk9Mcf/6fXFusWy
         E+4SiZv0RsvldL1XZJclkEW3M0X6znmPLTFrPjmjvzojgO/pAh79I0wj1lmn9jZZF8h/
         g+4TKLDgdusipPVqWdYaSFI/j6+PE+Pnh2aSlq7syagLchkglYfc12h3lr3XaHv35rYL
         JUmem87VspyAs/yRKEdZXa7xQKUm2k+0zMxKHYYCZAE9KchcOHIE0D5BXNTElqSZdZDO
         jnKuhygeCfEdVQkP6R/IwDzZny6+41xJFHD5F/MqpMIsRv1exklRH3RNqzv0v9uHgmI2
         e9ew==
X-Forwarded-Encrypted: i=1; AKwUvBywhZr5pX5AHlwxvo2XJlbSQ0G6/yu4ltKIJH+dyzEGlaVY1/pIHeFnBrykz8IF5dddpGqMl64Eaiv+Pgo=@vger.kernel.org
X-Gm-Message-State: AFq9FYI16Oce39JgXM7FwcKTxXCOuUPnh6H7xOltFA5RUbe8SRGl/7r1
	wp5dOQFB9Jjtnc/HgkVLefBwbHpJjLbbMEix6/H8lllPNtylTC6JyXo/
X-Gm-Gg: AYBFou3nWt8nNVidEebozVIy3S614+BJpVz613jcsyg0UpYe4uAP3xEdW/dQ4cOCS+p
	RwhPBSfDkd9ZuC6IENE9aXLxqsZC5FShsFpReOfsX19PTYwBM0HkErx4ZNT3dIISmdJ7f8Z/JFO
	IiEqVpsKzPvXH2XIjcwEt7djfazDGy6qOSw0peLEd0F9J/LNymO+K7QJ38MKZjMpXjNCYDcGDI/
	UKYkaR8gpQ2L8m8fhCXK0+emqb97megmnbO2QhpqMjpQJILppKJneJ/nk4QkZOAfNPhRgTqYmFN
	sgphShF1oWJJFQWcN4JOHL95J9ZXo1vJES2gMT+aaEgXxMmsp/KncEwBR7ET51du2kmrTf/xS5a
	2+lH1A7yUGGg+3qFs8dZNgGnfSdAYaoAjr6QwC8PS+pISjmRY4CgpYpxXFr1Fh57voa9B++gMrR
	z7Ss5VgncALyqlCSDDxdMMjfV1X7KVbsLQGNO6IZSIy6+yXp7+KozZrtWb1sO3RlePtId1wwFwu
	FTV1AYhq/V/IiIEkJs4nckCvakGKnH3YlFD
X-Received: by 2002:a05:6000:260b:b0:48b:efb:4a64 with SMTP id ffacd0b85a97d-48e07f98a9bmr26362540f8f.37.1792531211037;
        Tue, 20 Oct 2026 14:20:11 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e258424bcsm913222f8f.55.2026.10.20.14.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 14:20:10 -0700 (PDT)
Date: Tue, 20 Oct 2026 22:20:09 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Ian Rogers <irogers@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>, Stefan Kerkmann
 <s.kerkmann@pengutronix.de>, "James E . J . Bottomley"
 <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, Andy
 Lutomirski <luto@kernel.org>, Vincenzo Frascino
 <vincenzo.frascino@arm.com>, Arnaldo Carvalho de Melo <acme@redhat.com>,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Biggers
 <ebiggers@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, "Jason A . Donenfeld"
 <Jason@zx2c4.com>
Subject: Re: [Regression] [PATCH v5 2/4] vdso: Switch get/put unaligned from
 packed struct to memcpy
Message-ID: <20261020222009.54f6d35a@pumpkin>
In-Reply-To: <20261020202744.55c52a49@pumpkin>
References: <20251016205126.2882625-1-irogers@google.com>
	<47f8c30b-e326-4ff0-a2bc-5683209a9e2d@pengutronix.de>
	<20261006-dynamic-succinct-woodpecker-a36c7f-mkl@pengutronix.de>
	<2f6094ff-f585-4b8b-8c25-20c11d1bfc7d@app.fastmail.com>
	<CAP-5=fVt81pYz_EXj+QNG+hFGomb-xcpm-6=ZNzNm+c2sbP6UA@mail.gmail.com>
	<b2a50293-d6f7-41eb-854c-c43bc9874ffa@app.fastmail.com>
	<CAP-5=fW25k8uOeamGRhwbFUUZ8D0D1n5YK-NFF7_2JMJcGOsiw@mail.gmail.com>
	<20261019-rapid-loutish-porpoise-ac4efb-mkl@pengutronix.de>
	<CAP-5=fUwDOv9k1Ptz22h9kKYFJowg9UPa+LzWnnswJ72ptF8tA@mail.gmail.com>
	<18c92ae1-deaa-4c09-adca-157819cf005b@app.fastmail.com>
	<CAP-5=fV5OBeri3T5U9BsKyjDRUiFr7bgFiV62yQr7fO7Hf3rvA@mail.gmail.com>
	<c049b368-9cb5-44a9-8172-fcfc842e79be@app.fastmail.com>
	<CAP-5=fWHDR0--hMYM5UHXaDfggctPbJKxNUnM0hjpupUSVNQ5w@mail.gmail.com>
	<fe4c1225-d5bc-444c-b457-001799a3f648@app.fastmail.com>
	<CAP-5=fXQxGBYnCKbGpxvtaQxxhju2UXgzn1vy-8rcoNVOvSqyw@mail.gmail.com>
	<20261020202744.55c52a49@pumpkin>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 20 Oct 2026 20:27:44 +0100
David Laight <david.laight.linux@gmail.com> wrote:

> I suspect it happens less often with __packed.
> You can probably add volatile to stop the other merging.
> 
> It really might be necessary to give up on the C versions and use asm()
> (at least for the unaligned access case).

This probably works for unaligned 64bit - and is much better than the code
the compiler generates:

unsigned long get_u64_le(void *s)
{
    unsigned long p = (unsigned long)s;
    unsigned int shift = 8 * (p & 7);

    return *(unsigned long *)(p & ~7) >> shift |
        *(unsigned long *)((p + 7) & ~7) << (-shift & 63);
}

For native BE the two shifts need swapping.

Not worth it for 32bit unless the alignment is known.
(And neither gcc nor clang do that for misaligned members in aligned struct.)

> 
> David
