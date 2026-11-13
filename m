Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794592054;
	b=R818UdGnzzPOIhQNJ8w4Ky2LVeo8tAOElaAYOuet/x2Sd6j449Cv2DlQnRe3gInGqnZd
	 a/lgVhgF29hBAoIueJkN6qlfhG+shm/9ki4FdnTYVYsjL9v1X0SokbdC7IygeqA6Rdlva
	 0+b7asg8gpRNmW5TJdWN7z8f5BJBo1L8bL6vRyGVymVddoW2Ee/09FEMV80AptGJSvjMX
	 HRGX/8IaQX9QxsHwOPRVCrN9hAjLI33pxnpREUIUaDG7LJllWUmRCB1EksU41NHGt4PTW
	 FyOw+peR/2MEDPn0XE8OZ401Kzc4YtC/YCWS0FwSiKLADuzf2xKJEy3c4TY3ngl4l+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794592054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=9tvCvtyBDwclMOHXQzuvgqL/VLhDVcOm2ZijhPSIJ6U=;
	b=vA1wbkU/clORsCk/gqymI/89iqnTjcLunXE1L3HTZrmWmVkPoz6YTiwSIBX4DGPGXnLA
	 ucgZiQrErbOqTB6VZ2kjDJT0DiNW+50Qkq+WuM8Shh3Qe8PLRbnrYOmC1KqMvH+dpY26x
	 yZfw/sJa0JkcSMg4TpjpNKOQ1LXlviATxKw6UVSAMZatSgJqqE2B9bWEluQRqFXdcTkIO
	 nUjlRHya+aQcSJydRFnv00ZSAIySPNX/MQc+KclV01kHfKBatypc18XwUfD9Lp1nwxkzU
	 DCMOfWQfgt7rHSYr2XjbAd51KZpozqqEeOKtGb24WH/twmKLFO9/2ItmDjviTu9gIfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Nomnlm3K;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F83606B208
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:47:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90F83606B208
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Nomnlm3K
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c445c95d553so234976766b.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1794592053; x=1795196853; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9tvCvtyBDwclMOHXQzuvgqL/VLhDVcOm2ZijhPSIJ6U=;
        b=Nomnlm3KVk2SH3x+pRnl4j/12zZjkA0kehlq9qcjUHe6uuUkIa435eCwRF1aRnpW9i
         PEyHa6BFGde0haHm4S8YK8hzU6fiSSWid1YE0x3ZQfIobd966It3bt9KVF9p04Sq4k38
         x7GpAq61SGXL7NEgLw/q7iiDAfCXBPZTDB6PU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794592053; x=1795196853;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9tvCvtyBDwclMOHXQzuvgqL/VLhDVcOm2ZijhPSIJ6U=;
        b=drmmMlqiCv8mqZy1aTKKq1hW30lfwp9UZSiTuDyRgstKY0HVzJ41ulL0vDIjPd/9Mn
         0a12Dsch9Ft344+d0FjjkW2mnN+IxryEe4PuoQFK0IpbJGSY6qAb1EtJ/tzwk7HdK+zD
         VmXVQeULdAVh3PFofGgVzbzSDGVUFZwGepIi8jEKKY0QqGmWNbOvoYCcQ+ernP/jmlZi
         r9vs0zTM40/B8UPz9trE1K2ZRYq7Xnkk9T1CUSzar2l/6ulOzyv85zbE4eV6Q6s3omGW
         9W6R+gU6F4+4wKXuoXroiuuQ4QfuoPSa1OfprfT+biVMj9hFr0UPZI6f6ZpVdmh3MXFo
         9EUg==
X-Forwarded-Encrypted: i=1; AL+hErGOGzqpgTUNGfUhoIDUj058DuF4xSJRpcBcVSXUpYz0wGfhX+L+A7ZIndTwmiYlcJtP1krlvxuGrJsz77w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zxWbGZpmwoTtH2OogAjLJMO41SZ346EBCvz9Aa6BJMrPJGYF9
	hgLvIAe0kl15Kfmowi7IIC0H1epDJ1ckGU98tHuD1nwPOqIlsP1IlCf37MrsFGqYSsNIWszovUN
	YP+ul7HHAwQ==
X-Gm-Gg: AYBFou0W7Ct//QQoMVvUMGYe6C9N9ai3Xf5TfmyX/eGFPXi+jTKDB/tmMuDVfhGyd+K
	oYSoNfIw7fzv18Dodam92/MaUh3wE6IHEcPwCOYvPVN850PkOtS/yC/s3vts/xkbeeiCTIj8Caq
	cFTogro1fdgAUlyuiwdHQC1fim3QY9FGFTt8rW90LMEIcZULfUCFyTRPaKVma90DTLenK/AAPYJ
	xVwjPRFd4+B+v88NfxHoWH9Y7a5nGrQcL1JiHeQizgNtocF9B5IwD1q+Py+vd7ncZrqEWrXgzYo
	huyPX1VRtkIgrSG1kNF/cU1+yrFMDEk88Xm4iktVHHWgoMUxTbqI2O12KWo7avxc9Z4kzXOfgpi
	rDkIBSKgPS4wU+gPoYAZiHnB6v0keJLTxSP75bxnwORZJwBlmBAO+ea7HkRxPrA4wK/JX6Sa0hX
	7cfh/P5YhKUjkPcV6D6DZ4F7tTHVRoMxZAdjgOCV1CVqHa8EbSH9JeII5FgC5rdiEjG2lPnUitK
	Utc3YjJKrFotzh+/nK+UHYfmYioP/8qQN2fFPMXzORHHgPdlwRCmZlqxB4RG5b9bvoFkTU5QrqA
	AVx/3hH3NSUtzyOCOKmZMzX6Gz/AEat0D5OfJ0XTgAghbxwLU/7GXH/LMosgAarE/3/+VmvQmRV
	sjtk=
X-Received: by 2002:a17:907:2d1e:b0:c4d:28ba:f221 with SMTP id a640c23a62f3a-c50963d46dfmr276414666b.42.1794592052931;
        Fri, 13 Nov 2026 09:47:32 -0800 (PST)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c236110bsm1318569a12.7.2026.11.13.09.47.30
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 09:47:31 -0800 (PST)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4d28f75d62so314619066b.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:47:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHnjOwJ+6c02nd0KHdSK5w9dB2mGc8N/7HwgoZ+Cm+GA6yZFWLU8Xyd9xr/a6nscF4xUz3BjSGAmYHPV4Q=@vger.kernel.org
X-Received: by 2002:a17:907:9811:b0:c41:9228:baef with SMTP id
 a640c23a62f3a-c5096328cfamr296705566b.8.1794592050271; Fri, 13 Nov 2026
 09:47:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <xdzcyoou73blpfdlgy47i2ktrcsffnclerzojpgrxphid54gjc@nicdcvzqx447>
 <auqtTjXhD8is-y9f@gondor.apana.org.au> <CAHk-=wiE0KG+jkhmJWifXuAVivtB63WCWtdEpGAex7-T0SHd2g@mail.gmail.com>
 <aurAxRpCwzeyXeVj@gondor.apana.org.au> <CAHk-=wgPvbYRcKpQ8WTH-EYZRgMG0KSH+cZxY5-Hyf+X7JjWsw@mail.gmail.com>
 <aurJZ81qnbiHH_P1@gondor.apana.org.au> <ausS3LQNkdc6lBy3@milan>
 <auxDm_YO4oACA_d2@gondor.apana.org.au> <CAHk-=whXvVO6a5AreZu3LPBj_wjpzUanwhvu8WqWP2q7g5S7Vw@mail.gmail.com>
 <auy-7TvVzJ-VCrG4@milan> <avcKfEvln8_2a7fJ@gondor.apana.org.au>
In-Reply-To: <avcKfEvln8_2a7fJ@gondor.apana.org.au>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 13 Nov 2026 09:47:13 -0800
X-Gmail-Original-Message-ID: <CAHk-=wg9baZ9EDhZr7ONxjuO65+vvWFo5E2hgxt+3rYo1vnhyA@mail.gmail.com>
X-Gm-Features: AclHuK_LoISNmN1EyeTV2FunZOXs5TWqNCSWTUd1ttcLDz0e07xK1bcusX84qg0
Message-ID: <CAHk-=wg9baZ9EDhZr7ONxjuO65+vvWFo5E2hgxt+3rYo1vnhyA@mail.gmail.com>
Subject: Re: [PATCH] mm: kvmalloc: Bail if called with soft or hard IRQs disabled
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Uladzislau Rezki <urezki@gmail.com>, "Liam R. Howlett (Google)" <liam@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, Michal Hocko <mhocko@suse.com>, Baoquan He <baoquan.he@linux.dev>, 
	Alexander Potapenko <glider@google.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Marco Elver <elver@google.com>, Michal Hocko <mhocko@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Thomas Graf <tgraf@suug.ch>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, maple-tree@lists.infradead.org, 
	Lorenzo Stoakes <ljs@kernel.org>, Chris Mason <mason@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Andrew Ballance <andrewjballance@gmail.com>, stable@vger.kernel.org, 
	"David Hildenbrand (Arm)" <david@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Nov 2026 at 05:03, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> OK let's try this patch:

I don't think this is wrong, but I do wonder if we should at least
have *some* way to detect these cases and report them.

Also, it turns out that in __get_vm_area_node(), we have

        BUG_ON(in_nmi() || in_hardirq());

so this call sequence already has a *limited* test for this all. It's
just that it explicitly allows softirqs, probably because it used that
bogus BUG_ON() pattern, so it wasn't a debug aid, it was a "the
machine is dead"

I wish people would stop using BUG_ON() and friends. They are *only*
valid for things where "something bad happened, I can't recover".

That __get_vm_area_node() is not such a case. That function has a
perfectly well-defined "what to do in case of errors". It already does
it for lots of other cases: just return NULL.

So using BUG_ON() is wrong, wrong, WRONG. Commit 04aa71da5f35
("mm/vmalloc: do not trigger BUG() on BH disabled context") was simply
not the correct thing to do.

The correct thing to do was to replace the buggy sh*t-for-brains
BUG_ON() with the right sequence:

-       BUG_ON(in_interrupt());
+       if (WARN_ON_ONCE(in_interrupt())
+               return NULL;

and yes, that would give a warning, but it would actually fix *two*
bugs at once: it would fix the bogus BUG_ON(), and it would deal
correctly with broken code that thought it was ok to do vmalloc in
softirq context.

                 Linus
