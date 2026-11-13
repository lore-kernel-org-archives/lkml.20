Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794560307;
	b=X/v780eA+ShTjXnWytp/q5Pl1LvPI4RtYtbRnxOsdin333tlZZ7EVyLPBIaGI2NY2hKD
	 Z9V/GQQIFjR7uzIiHZsbA0izN91hwql3/q5XKOIhau89yVIrVjNH5o24FoA0hxDYngs1p
	 HQzMz1VA0jloiNi3olhCqtJvVSQ4ur6Efp7+flEwV0rxQi5oLg3ncGC2duTpNapj6FFyC
	 q/gJjfCqqwen7FpJPrklVoJCHOYu1UYEX7jjeKz9AsLeo3oxddqzS4nlYmqfzIN+UODsd
	 LrmTYNlks3Id7/0X3scQnEafE66KSrS10aJ7HUP45OXw3rvRu2b8UH/d3tOY0J1z6dw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794560307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zdODR8oMvC9u/tbpB8xQBzqRf2Zx8GIT7V8LD+QVHbk=;
	b=HxUtOid7Fff4JDzG1JTXI2lN+pwOCnMI4d5OASVWW58bGOd9S/FUUVybpUoPlBgJOtXW
	 sTIrMVLIcx4UbBX26P9lcIwB+/Ctdq0A+K8AO1PLpuglxvlrRIHMKS7jXGuhGKQQB38o3
	 CoSUm2QAY5CvbxvLOealfdrPc3zKFmyKh2ZNyQNwZO+h+q4b2tYseuCVYVKRI3k+qGBiH
	 D8647FqY9o4yuI3OUFGc3/Q+frxF+m8G1iZYUpa1SDMi0AYQMq0eAbImCQzoE8W9gXkdM
	 TmkYNIfkmYdo5DZqhgeXckxM81NLEZdVLxG7ie279rbAxsJ70a71NUD6YrTKR3pIaUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=riuEvSnN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0E3606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:58:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F0E3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=riuEvSnN
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b4a15c84c5so6279367b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:58:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794560305; cv=none;
        d=google.com; s=arc-20260327;
        b=ZVjR0xHNQJGZOeYikpPHIzqYHJBPkk7O4k0e2Oq0qvjeLr3dQxD0W9NYCgMNMZ0XEx
         vOU262AzEEyHtr2nTYJFSt/bMvl5ciovjuOwBeLhj+EzmYJJMVAJF2+J4hRQ3L3haaZe
         uBskGCx7Mrz91PDieYQgSKagDHCzxF+GI9YqyXFzNDwfWMdiekkJPa8eHujlLEBtEzOk
         qk1qEn06B6vNwGPS37wL39kkW3J/Q/C5Ji7eEXq4w2z6vqpfZsz1/DnwdZ8SwznRdh/B
         fxOIFvEbxH5qbbbVUKGcNzr82dlPkkIK1mjV7VLbeR1pWLD9OHKgUrKROQCmmWFx5uoO
         mC2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zdODR8oMvC9u/tbpB8xQBzqRf2Zx8GIT7V8LD+QVHbk=;
        fh=FErJVZmtxaj040agabdaNzNstnfwP+LIPw2zJnJBnw4=;
        b=cJ7+50ZozXZaiXha31BfDM2gIiRw7lMKanrsia2MZA5+ofJxckExZxSxOaXXK/plTA
         1oqJ31bcy091gN8/Ue8PSNhI10P6lE6MLf03jLR+5DkYq3Oo4/i+AQHqNYEiHeOgbX6n
         xQbZ9wK1zMV1k5o6BXz4GvEfPt1LPWWnRwD9EV2PGKfFa8ctGDRtcvWbnKeJ80rEhsEr
         TQug6P8AMz1PJGibfHqCAJkBwHe1+28Centf7xor7utRWsVDc0z4OISvLG2YV5abo8eU
         WUOBBzCEtp2iD7keduOKQZyZgyu8FUWJf2JiJCUGuU/WDKpdHYA6LrbaXi2MfuUPckle
         tegg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794560305; x=1795165105; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zdODR8oMvC9u/tbpB8xQBzqRf2Zx8GIT7V8LD+QVHbk=;
        b=riuEvSnN7JmdLlXxo1i14j8AdCq4QwCe+cbdOjeCp7EGB7A19vq5maOIEqo8K85Ji4
         yW2a2Bu0TQAzsaVZGGVeCNrHSMAHXQJv78EtKkBmqq0VcYwmuXjOOAYl84PWZGKWvbNN
         ZhLJF9aGs07sLs8Ha6u+1VQR+l6SlJPbL3oiyZQnL4vCnGYgQjYwU8a578Tl1ec06TYR
         OGLQyjS1avlivz7inCsRuFUdcVlj6MHB4XY8P9SZqPFun7vOibhXPifH+Jgk4fH86wDP
         uv3mYbZ4av7L4+NtVtvvDqpkp0aG4GJbByEU+fgMG5zzRG2XmZkG1j+gwLfwnoWBaJWX
         o7FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794560305; x=1795165105;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zdODR8oMvC9u/tbpB8xQBzqRf2Zx8GIT7V8LD+QVHbk=;
        b=E7aKJ65On0J8ciBmgLNqg4sC7/A3xUCun+XfPCzinEDCqrRwyQoL85KxitPgZ78ki1
         wLoDLdFMzhgMoofDnnA44vf1aY6r7B4HorY+tlq07HcncAGk/tF8b8I04DRGte9PjF34
         FjgDK61PBXj0vPk9rSREEgdAxLVXfYdKvENzzfEKUtATWveFCT12uoJLX4w/IQ+sGwuq
         JwfYlI1ktRw0T/0RVlHag1vAIibsswJnZtqAcNULcnGIu/o0xSqKKO2D6oUVvmkhhExg
         pgYChMuRDIkbdaIqIi/0RxWtOBK1DBBC/zvfjtI8Z1sJnv80zAUQgfW7UMqeCeEljzLm
         JR5g==
X-Forwarded-Encrypted: i=1; AL+hErHCwut5Qb5IkBk0aHtyi9TS+Rfx9ek9PZHmIRy0ZevttEDOB95sgsBnUEzbykx9KWHPUcJI1eBf3hRHe8M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/a4Y+rJysz6/dEXdCvk72tKVcrwIyDzIFdFcV/WepSDyEr3KR7
	P2QyTEUThwX5EDxEuNsMbofM8uQ5TCxzZWp+UcbP9/6oV4nYg9Y5ndPOPqYBFKy9goIKTh1iB+F
	RtAEL5NxjVrXHkBHK6JBZDejZHlP8bfA=
X-Gm-Gg: AYBFou05m4j6plex2QKQKmQccMNT6/D7+GhLzae9QmYXA3AkBl+fI27t3c+qm1OH1yy
	gTwRycNjt1e2A2ucpbJBBT/66se7iswB0EWrPqwON/eJIB+1GP0UQVekuCHqauwOaCo1F5Nnqof
	cvlmwmD0nzzSIEmBXdptCnFsaP+bTYIroOesUJxZ4QVI5F9hAQjYIe11ABA+swqeIXsveQkoWew
	2raanbACQgWppiXwpgRKxSp7x1V+G3R//dWF4ylA8pA1jwk9caalZZFdR9THVC3Ki6vNoz6QaGK
	XcphsXgW6nKRd+9eLv0leHK6mg71ecvenSFPprncz1RavfNXsgH9XtxNQThYrrIXj//eJh1gloz
	7ulD7rgDCHFovzEFppIH6gHsivBElHgtyjkJQdVQkj0C9eAhe6xGGNV2JLrAQFr1BfFGjkIHDJG
	YoMGwMkZHmg30WzA2TcGonVwiSt8f1AOh7LpTd3zjyHrjg7uNscA72RuwXja9EuEQCAOclyWkjP
	9fKwytT5nSCBq2/33Z5N0a8n98A41hwxR/+2oscz1yfCmmfKR+80wSzqsljxg==
X-Received: by 2002:a05:690c:7:b0:8b3:22c:b40c with SMTP id
 00721157ae682-8b4aa0d0fb2mr13819027b3.7.1794560305368; Fri, 13 Nov 2026
 00:58:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112065037.1800467-1-dmitry.torokhov@gmail.com> <20261112065037.1800467-2-dmitry.torokhov@gmail.com>
In-Reply-To: <20261112065037.1800467-2-dmitry.torokhov@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 13 Nov 2026 10:57:48 +0200
X-Gm-Features: AclHuK8xbnlVzSxLbVaTLM1vgALdMGppH-yIDCfls_fqrQt5T114mrDDfzRO1l8
Message-ID: <CAHp75VfKx3DRa0hU+TeFmvi_24_MLVwhmwFRsHO+ggMZXYvWbw@mail.gmail.com>
Subject: Re: [PATCH 1/5] Input: tsc2007 - drop platform data support
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Svyatoslav Ryhel <clamor95@gmail.com>, "H . Nikolaus Schaller" <hns@goldelico.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, Andreas Kemnade <andreas@kemnade.info>, 
	Johannes Kirchmair <johannes.kirchmair@skidata.com>, Yuki Horii <yuuki198708@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-input@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 8:50=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Now that all in-tree board files (including SuperH ecovec24) have been
> converted to generic device properties, legacy platform data support
> is no longer needed.
>
> Remove the platform data structure and associated hardware callbacks
> from the driver, check the pen-down GPIO directly, and remove the
> unused platform data header file.

Very good!
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--
With Best Regards,
Andy Shevchenko
