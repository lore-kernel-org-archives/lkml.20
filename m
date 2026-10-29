Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793290786;
	b=3npRst7zxSD+/MNedso/TlH22stqZaykVDApjDARe79fUtkFfhOSHOQMFCSpdmZHkwDf
	 J/gAVI0EuccU1cn3SUuTXhHGfvrWDmbZnKWSUQ99YmVGlcpdo82/mzMbIx51BgCIjxCq0
	 1X3Uy4CoZVbi6yW+6sh5PXrJ5rN5c0iy6LwW75x+OFg+Wa5XcQKqEIUEzESfp7wiLhKVf
	 1reueINerxhpLYGL2pRYHf9UGVeWCe2Qi8DF5BYWyZcLWK/HnognFrGMEF+XFI39zGF7a
	 v5PYsZgNaqjxc4DfxYvE7OQQli5vTgrDT7aO13/8VvcfSGKTpqAlJBN7aClXRSCt1gA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793290786;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZrLXGPOeZtKb/0Qmj4iU0Alw7tw3rFlIHiedf/XCtcE=;
	b=XE49XWmihfhL7ziMrQ6nl+4fpV4QIuQusn4tlcnwmT1J9NCoLMZ7Rq+MWol0dvFKObDM
	 RPoSqBaZ3qZ2CTMbkhga7gsvwkv9rLwh+2wXszgxwMmZhJPrxDbfj2iFeXrbJIwKknx63
	 TMraffuri+LV9tS5mU6F+nF5XjqpajHOavejc40kpDH9VUAb55kmhnC5BO9HuKqdzMx9+
	 8TqlfvFUnxj5iLZCW0vhMyBeKL7mHxATfzs0sPxOHdlR+N2W0X18JiYs6XgC45EQUYpjA
	 T5mvf+eWkAeOkCokFY2AX4ghnip5CO63kDKmEtspy6GAXMCXjco+BSytqY8vWZlP39g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tJCNqvxi;
	arc=fail smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43EF606A320
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:19:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A43EF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tJCNqvxi
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c434376dbebso210956066b.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:19:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793290784; cv=none;
        d=google.com; s=arc-20260327;
        b=LX/VTMOSt23hlFf1wM2l72XBLKThFmA436Yr+YYk8vgXoXEb0oAGqpljoeFR/EnC3d
         bZEXcM/7z2pBGmfHCltuWtQImLYZ6AoMhrgeHFjkEgCTIf8cYxwo/Gg0mrzW+HIHVK1d
         e4bR79KQzPsZahWWBQeOc1QJHIKdD8GAHpwIgPksp674Whg5EfjATpQbDsAJHTA0902J
         g0GquhkrvEySBQz/R8jqGzVE78/SxvSd3tgblXaTbj9W/8b+FI71+YaUF23QNZXzp0Th
         EiLMpMMtibf0n1Zd6sNtF4pas/iVyJQb5hnXXvgCOP6qonD8dYaFDDe7u/H5H6vHB7F8
         iOcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZrLXGPOeZtKb/0Qmj4iU0Alw7tw3rFlIHiedf/XCtcE=;
        fh=SQnPP1k1HG6E7vkQpz5xkG5VS84h+GWXMVeyRydZqCk=;
        b=pbOKhG59Yon+BVebYLWyR8lk0pI/V4fqvgbXPiOP6WrcfAg+7aVt3bdl7gCa13+i6i
         fvexvCc6BvMcBUJm7uYOgVoH4C9O9fuQBq9HLNDH0OjObwEZ9FQmKxaZXhlbKY6QIs/Z
         HsusKp1UJ3h/YOg3TUntE6XVHaJEHZ5Q6+OdPukpMK9ZQdCqh8XEXbcYihl+XFGtNk2e
         JyBPgN/6m0vRT1rfEo4DeZDeOHA6qZWGAgMsKInyLtzTq9aMeicCEtNE0GWx5aIkqWBi
         VjSu/IMTeqKPRJnC5HrRXTZjh9XhJxXzYGJC0hvm7JqVzNe7P7lAzYe6JK31IJTKlo96
         U3Ug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793290784; x=1793895584; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZrLXGPOeZtKb/0Qmj4iU0Alw7tw3rFlIHiedf/XCtcE=;
        b=tJCNqvxiSy3QxAKlEFW90cKUFyyBgpoSeP/Y5ousN6wPGZSrolLGcLaPbCYXA1fxRu
         hyVsewX0wFmTmBY8TlvUBE4oSRdUuvso9BOhMBlz92LV/gs0YdGdUPu/SeSx7yKSEgae
         DtK5weghFzRSq07QuSregfqRkrGn/HYN/qGVPOgb0V9un5TOuBcJn+HH3XRz6Qjb5Ymc
         h0a6dkLjD8hKH+4gxpX/7mtBpFAWTESYYmgPzoV9mN4JS+7JztM2c1PCNt/nj6uvIrHD
         pmt2E1fEsdla3c4dbYIo+nrE3KwsGfTJXjoEixBJJpLcsOlyR70ckXgO3VHTl+Le1l7x
         +gmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793290784; x=1793895584;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZrLXGPOeZtKb/0Qmj4iU0Alw7tw3rFlIHiedf/XCtcE=;
        b=S9a/DDQbAgjVUCXfR3hD4oGD4VJbVFCPCutzAobfq6DDC/9CIDcDa6K86Xmrho5T3P
         SiZynqCQPmX+k6fLLvyJEOqnify/ioV/IJkWsg2BML8k9k9hFhH8eX83KMJhHkWtMWGC
         xIHEs+I3p0Dt30gy8ddxF5JPrjKbJ2kbzFiVALo1P/zidy7A03aePSnasF44uohnM5Sj
         L4oe6b5/14oiynCn2K920l/zTMOym4kt8uX0u2K9JwtbJZhH7rgDan4SFmwWt8mvUsy1
         4TCIO6UOXl2jgS4oKxhgtu69VD7AqYQQ1nIy4Of12131OSYv8CsmpjfN5ZLc8nqHFKU2
         +Rmg==
X-Forwarded-Encrypted: i=1; AKwUvBz58iI3koErisNPR8uzd909II3S/7ro2PmgX/6MdqE6eN0s0jrPeFv/+Y7bFkpLgdRFn8OtUVEQPvZycAk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMPAL6Y6QfPP5sCXT7sjCs9MRIxfasbmeK7tsJsuBYc8dUj4Qv
	hX4dzT9WkzT/Q5UV1Tlcql9hjkTe3CMoKqe3KWSfV9usxn6JkcHXR1sf+swkughxwq15SHf0mn9
	fAbvNjZKiYiUAxxllxGTxCnF7c8IiL30=
X-Gm-Gg: AYBFou18jzco09znh2PxKEzQ+re6c651MfT9EXt+V/uJBd+aytTLePHn5eqhnSYHhyY
	XyJXVMjEYuYcnQz0PsiadLpIUz2gaSKKp5ednowhVwJiQwayA0s0L7GPa9+2Y7Kjx4jEEGxLRvI
	u7Cpw8piLexUUpKAVfT7N4mcyjyY3wdNWflBhzO4JVE0wetlqNs4xBl700rbCM20/sAd4RLzODG
	0r9kvnWNLyJZ90N/31euDR/PMnxXEhaaDYLT1CkLrdzvVqoWXrbumgJGAliqEk/czQw1rUwK6ew
	4C0kj2Gy7nqSGsZnXxPtE/pJofO9m76tHriQb5+1ey+uCdPq8q/qJ5woEq5KjlcPacEA9WXPrFs
	9JCULT4FRjkuaYwFSMdOHX6hYaC+So2bk9JGstDAVsuXD5P+mLWQWLf1Vz8u9pPDV/svC10qFeH
	2OXXb2+GOFLvpAnXvB
X-Received: by 2002:a17:907:d489:b0:c41:4512:a3b4 with SMTP id
 a640c23a62f3a-c49d13b6aa3mr277245466b.20.1793290783798; Thu, 29 Oct 2026
 09:19:43 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260831151235.64076-1-notmissinge@gmail.com> <20260831232157.27037a5e@systembl0wer>
 <20260904042215.0e21cf29@jic23-huawei> <0d584595-4479-4116-a52b-710e01f20bb3@gmail.com>
In-Reply-To: <0d584595-4479-4116-a52b-710e01f20bb3@gmail.com>
From: Not More <notmissinge@gmail.com>
Date: Thu, 29 Oct 2026 21:49:30 +0530
X-Gm-Features: AclHuK-5tg4KowTUoVyHp9syWpuH0yweez4JYRJMVbYb4pI6PQlKfsVZtbaG4Ig
Message-ID: <CANU2TT4bTZYouZs=WWrYU=g70VcnjiBxBZRTh1fT3bqkbhz=BA@mail.gmail.com>
Subject: Re: [PATCH] iio: chemical: add SGP41 driver
To: Lukasz Kulga <lukasz.kulga@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Joshua Crofts <joshua.crofts1@gmail.com>, 
	linux-iio@vger.kernel.org, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-kernel@vger.kernel.org, 
	Andreas Klinger <ak@it-klinger.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lukasz,

Thanks for reaching out.

> I'd like to pick up SGP41 support, taking the approach Jonathan
> suggested above and extending the sgp40 driver rather than adding
> a separate one.

I have a v2 nearly ready (binding as a trivial-devices entry with
vdd-supply, plus a separate driver). Hardware testing on my SGP41
board is still remaining, so I expect to post it within the next 2
weeks.

I kept it separate because SGP41 has different commands, CRC-protected
two-word results, a NOx channel and a 10 s conditioning phase that
sgp40 lacks. I'll explain this in the cover letter as Jonathan asked,
and I'm happy to rework it as an sgp40 extension if he prefers.

I'll Cc you on v2. Testing on your boards would be very welcome.

Thanks,
Akshat


On Wed, 28 Oct, 2026, 6:43=E2=80=AFpm Lukasz Kulga, <lukasz.kulga@gmail.com=
> wrote:
>
> On 9/4/26 05:22, Jonathan Cameron wrote:
> > Whilst it should be a separate patch, the route here to use
> > trivial-devices might make sense.  Only thing that might be
> > worth documenting would be vdd-supply.
> >
> > I'm would be looking for description in the cover letter of how this
> > is different from, and not suited to extension of another drive
> > such as the sgp40 (obviously there are more channels on one than
> > the other so it isn't trivial!)
> >
> > Jonathan
>
> Hi Akshat,
>
> I'd like to pick up SGP41 support, taking the approach Jonathan
> suggested above and extending the sgp40 driver rather than adding
> a separate one. I have SGP40 and SGP41 boards on the way for
> testing.
>
> Unless you already have a v2 close to ready, I plan to post a
> series in the next few weeks and will Cc you on it. Your review
> and testing would be very welcome.
>
> Thanks,
> Lukasz Kulga
