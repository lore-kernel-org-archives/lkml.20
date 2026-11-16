Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794868123;
	b=isTPTX4C1aabAyaLCF773ZQlHHOVaWeFbV3EZeZEiACLEXP3eAaFeOwm9N5WRvgkBzei
	 at3vvBYBNk1PUmpc5eOZn8DaaQa44Z+IUipGlY3RxYx2VSP1WkL5jVx4/Nzc5t+HKuwPw
	 xwvNp60Llzqr/ufYR5CeQDvB7GfRZO++K/hqVz2uuJOfQ4IWHURzw3KO1fro6rmMcx3NH
	 NaawXiQtFyWZcoa/ZMhgsbra+FSveYbtvnOkbMkk0KrlKhoEMOxcI0HBiGeQI0THnjBLQ
	 y7kxdXcoKIMSCsWitZOPNroroEnEJv+JBGYqpMhEUMYSQ9UD+dYfE0ZSdjugoPovz7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794868123;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=EN+xjqjb98UaRHMjBVBOXaIhAP0+1stF7wDJi81/iGY=;
	b=h3AGAeAB8gMWdhgyaDMclSAc/bt5lHMwNy2AYWuxOt26hRzJuwK3pLD0jDYPrxjFbV2q
	 MCnNmpkqZP9ShFztYEWuscmOkPHMI4pVX9u/Yjxut2xrHmxOmvLMHgLjXsgrZhBTgCh2J
	 feI9Ve9DS0/+xyYYPgcRzbed9/F9CpCTFrIPMKOKjDH25UtGs/gdoBFV50TPps+CzWWPb
	 PqzVN4BVXLzhCp/Mdpk7JJ/qHeW61CCGt092nG0AjD4nbafG1qUUCalaMbq2+YZiKWEvO
	 8EkkIMV+DH2MfHqr64yoBhapyZghDjA+mbXuHETDBNqDc/CTljNdS9OH7feHT1qkjOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DS8ntiIb;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A199E606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:28:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A199E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DS8ntiIb
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so4223316f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794868121; x=1795472921; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EN+xjqjb98UaRHMjBVBOXaIhAP0+1stF7wDJi81/iGY=;
        b=DS8ntiIbMjgXy/fvT72WvnhHCiEtVQV//0o1lwqzzhWXt7aHFAyu/GMtRGLqnS1Blt
         T8TaHlU0utThuxFkOqTcEftXdmS2LuYBYZwSQ5bLwaNl7Ut5taROwUrxq6hHnsYgMHGP
         g4IyihxhDqsdice7WXk9cdjmBlg96wWQ6Qox3lc2qgO+77waI0OBsG+AAZvYHfWTqxM4
         /mSZaFGlukGthyhCm2HideTsMusaPabxjwykJ8PgEQpc175YRJfWrim+WreubP3xp5uj
         P2neVj3C9zHdpHYsqrPtWDiDKL9Do6z4h4+nYbFKLMEakGe1GWOk+3bloZTjIKVOsy2t
         orew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794868121; x=1795472921;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EN+xjqjb98UaRHMjBVBOXaIhAP0+1stF7wDJi81/iGY=;
        b=JupbozVefhB67B9CQ4FwsZcH6IlVFU4NdbBUX9joAuxrHosLjiX6Syx1pJt06e0UGK
         NpwAZ0sFXbUPlnYBwre/Lyw7xMRu2XYkcscZduUXSEKg8PnpGJwMk+27KWfw0W4GHm+6
         TNC2OH+ljHLyOmOEj4h6/Q77ATraf8YWfDpqkMovM4lvBkWSJYSyfLInLEOnLFCqVv4e
         9nXNChWBVSBD9opTljuRxHbc27vsNUFfiLcOPt0Oxw+1u20KZ091eXWYTpzVwF6Fo1P/
         ZqgERVGe2C3s84R5BAjsk1wbIRBhyeufJbkshk/T96G31FElBTP2u+cjD89JKocMEq25
         f0rw==
X-Forwarded-Encrypted: i=1; AL+hErEeQ5dJQz35SnPz9KOltYsDazbV0B9ce+HYLcF/srAf1cN6NCZLMJlCXMioKkrZc5MnkTl28Cv74+HdJOA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7myzEHgofPimi097pBfmzo0nXq3FSO7yT9DoXkpG2DTYshJJi
	Mjkk/QOMBNFS1+4t+rnc95KzVxEQ+Q+7eh8cA0bazsFV5o037RMDP4KzjhyIA+a5
X-Gm-Gg: AZFdTZe3Uu4YQVumteTp1f007QWOpUY355F+Vg642mU7qNC8ljFfLcHYhK84i0QdgDB
	ixjdO53PSC63vVjfOuq8E92QSJlq9WytkR46+7Uy28Iuuo54VMkP8VQjKHj3MlTC8OoEHY5pDLU
	lAtR253rTH8+g5oz4Gi4w+a3VsBH+++HNmtyBWlVYrZLYeuso8lZ+W3XflQzN7j7uXgu8/vXhwf
	aAGM7PMYWm3OZ7sDbNK6/Zsln4CMvTBtUtVEMfiUAllEvvlvishvYPdC1rmZLO34rDEOq7vjEBR
	NUjg3/1VPjADBnxmDxS64yj/djz9gEKYftBHLyPj1flpHTpTb4IfJ1dnEQHa2v0RwNBWvULOekG
	7H4DaKUYOFQp8FwY3+ixFLcydb8GPcbYo8S4X2tOx1Uz7ZSrnYngzaQ5TMBzPvCvkmvr27SZmdF
	Z1m+wwGIkkchArC+J4pIMKcwIxktZ4250UrDzuMbV1m2gTDRJLxx491Sn/m43vZcTpHMuy6mrv4
	kaesYP+29rtPA+0oSXNsVJBf7PHlifKGUyaNe+lF1qz6okG8D60aLdVd9cp1TaPKormbvyT51Bu
	ZINkKYakf7WXuvLYc6ZBw6+FFFPp3LMQELfR1ed7vY7VxtWKzvZth0IyjJkQXZzO9g==
X-Received: by 2002:a05:6000:2513:b0:48e:47e6:fdfb with SMTP id ffacd0b85a97d-49c70ed7c9cmr23140856f8f.13.1794868121017;
        Mon, 16 Nov 2026 14:28:41 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a32155283bsm2125683f8f.37.2026.11.16.14.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:28:40 -0800 (PST)
Date: Mon, 16 Nov 2026 22:28:39 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Borislav Petkov
 <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] x86/build: Do not allow X86_NATIVE_CPU to be enabled on
 non-x86_64 hosts
Message-ID: <20261116222839.4b4a04f2@pumpkin>
In-Reply-To: <20261116191120.GC1036192@ax162>
References: <20261113-x86-no-march-native-on-non-x86_64-v1-1-cbc8b096d1c4@kernel.org>
	<20261114202524.GBavjDtC9Z3j7PrV3Y@fat_crate.local>
	<20261114204605.GA173332@ax162>
	<20261114205806.GCavjLXgsKNNwK0zLz@fat_crate.local>
	<CAKwvOd=f+ib1XVvFfiW2mF8NoWo1jr55fJo=QOuZCJmzQCVmtg@mail.gmail.com>
	<20261116191120.GC1036192@ax162>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 16 Nov 2026 12:11:20 -0700
Nathan Chancellor <nathan@kernel.org> wrote:

> On Mon, Nov 16, 2026 at 10:28:54AM -0800, Nick Desaulniers wrote:
> > On Sat, Nov 14, 2026 at 12:58=E2=80=AFPM Borislav Petkov <bp@alien8.de>=
 wrote: =20
> > >
> > > (If it were me, I'd simply whack that native thing. It is such a wast=
e of
> > > energy). =20
> >=20
> > There's always KCFLAGS.  i.e. we _could_ remove it from the x86 build,
> > and <whoever cares> could still do
> >=20
> > $ make KCFLAGS=3D"-march=3Dnative" ...
> >=20
> > (I'm agreeing with Boris here) =20
>=20
> I have no objections to deleting X86_NATIVE_CPU but as Ingo notes in the
> v2, people do use this and it is much more convenient for a regular user
> to adjust this single configuration option in their local configuration
> file than fiddling with KCFLAGS (potentially having to modify their
> distribution's packaging file in the process).

It would certainly also be nice to put something in the .config file
(or at least in the obj directory) that selects the correct compiler
for the kernel being built.
Otherwise it is easy to forget to request a cross compiler (etc).
(Maybe there is - but I've not found it.)

David

>=20
> > Nathan,
> > Was there a bug on file against clang for this?  I can picture a fix
> > in my head for this... =20
>=20
> I am not sure I ever found one. I can file one later today.
>=20

