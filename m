Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC8352CCFF
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071456; cv=pass; b=XCqavs+jq4W0LH6mj8IsgBeEIwyUxAin0O2cUNHrpzYMeEyH7q0ypS6XIaK/3kbzjYXJSKEdGrrWAwm6ScXffOrluz8iTJN+efR6wa5bBb049P1E45uy5G+Y9lbl/z5zORqAocaaAjZUV3sEz5UEdI5Rv0Vx356aPUU25rN/KIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071456; c=relaxed/simple;
	bh=TXj3NS6P/eZrWg/Se3J8n7sYemCu2uKUUC5QwX5p1qE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oB7enc5HQbPCob11AvsYH3vanNL9uws25k3ZJ/uQwSSF7TTNxXBmMN/MJAHZ/0Cb4hFZhcPfiimUcnb0cRBf4IxSwk69h5hnF9K4FZutpOgdmDYh1oQKVQUpbi+v8EjWYoCDZZ0DEeiEVZy/0zJR7EIK7AWW53/hnC6RT6LPoM8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TnQkdHoN; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TnQkdHoN"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2e2007dd8bso880442066b.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:37:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792071454; cv=none;
        d=google.com; s=arc-20260327;
        b=rZ//fCaVmiqkJf1H26VF+hFyw5EPrPYcKrsCziftT9ebfAQH+0ruZ8sRM14Ts0aj1z
         oR8eqn+gcLRMe2UbkbYHZNNeBuPUJa7HYRtxLsUt8sulQKNd0yc5UrBwYWyuxCmuy7Mz
         pvnJAaBHjt70P8zfmUD37jGNk3kIBtfn1tB9Hx/tH/Nrj3KytqazQA/FhEiaTnSSHDjy
         rjX5cgXHObII/n383sCm86DXmB7d81YYzhyMG8MjB1Drf6K6BHPdZaKJNhFOIkq8S/aN
         026wh75WsQp9jvqkVrNOnulql4075CLo/ZdtC0DSZYdjGdnJYnmiy+0lQ1A3I2ZE1vME
         DEVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=st4ZmCpXjqsFhxZXZDzUQkmMc+ZJJRyqEg8qR1MiObI=;
        fh=oWyX5dG6FOVcjL2tHrNg+53Pv50dN2f7oLvF0/X9F3w=;
        b=WkJvBMEoNU9GQo5ga0txZersB+Id1KGaPUA/V5WCVlQ8fvxH0m+5lk2PotFYOHv/5p
         9IQxt1M3azEVW4KHMWiCDlxZFfCghtqv8N3bUuy4cw+toBZaXAHjKHxmAiMXB0OI10ga
         t7Dl/r/8LF5Qq3D5MRPx4E2VlnTh1ht1NrLVKZUMbmOfOf2aPbAdczUZB8iMXvaECiSk
         mssJMHaXb1IvN7LFZGYxsQGa1acwuPna2CcEEDuUlDvaT/5VvVD4X/mQ9MUYpJDgd66Y
         SB/7KrVzdFliUYXKf8VEHeoUUuwrmRt+ivENGs/LJEuKVCX0oPX9er6a7H0kOkVJI6Ro
         EQjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792071454; x=1792676254; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=st4ZmCpXjqsFhxZXZDzUQkmMc+ZJJRyqEg8qR1MiObI=;
        b=TnQkdHoNYjJ3tEU0KvbiZPVgW0gv7vqoer0QSare9PssJVfvgHR9qoFv8E++SmXwxm
         rdgM7VTrGgiLvgs3s/uHZD04U1Jy1ZT0MOQVqi9zlUZW8fpDXMqyvpFk5xzOu2dC0Sdu
         bLkQK8eBLf0ppHUr5wx4sZgJfZNzWKwQ50UPNxh+UjxA3iqM7mUm+ZRmjznn+GLs8vAq
         Rm8j6LumtU8d2rXd8KcdoT2jLFdw5OLNvJvoZWAZ3So87vehh3yN13n24W0H30IAqFCw
         qH3iK6H+xAtGTgcug5B3+ZJehs+EcVrdepcUfiDzvucdU2sh2QwGkQZdiCVdHFAVx64W
         1DhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792071454; x=1792676254;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=st4ZmCpXjqsFhxZXZDzUQkmMc+ZJJRyqEg8qR1MiObI=;
        b=I0G2/sSEfqsXweDSzI/RpCwYfD9eAqzdeMczyrsJp4pIe79vLLV9Uvl/o8rSsjV2Yb
         alqSdUunoVWmDefKHDj45Ho0sgEXO5ljd8aVBWmBsBPpZGwKxDh9zQWXQE+I8hlW28Rs
         A3hDC1UKHv8m2bQuC+Raqk1kfYxItn20cDN71Hmhu7f2uAxB6GJZaLFw6mkaYaKnuMcg
         qiviY/MO+MNwIVCrZqGExq6uBrZGsscCAXfy4LJNX1lk5AgSlY0mZwm9nFd9Vk6TA+he
         fH0zpajUiqJ6lvWZYBaSAw5A45OSPPDxQ3WWwqPXo2a426Pkr57CpS1IW86GxUhtf++y
         fLxg==
X-Forwarded-Encrypted: i=1; AKwUvBzklTw+PwnoDrh+uzcqglvwdsGrJ1/0H5Tow+nN77uqIGqU1rEnsWR9s3WZVZg3MLNDFKQArDtouFrOOz4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdBIvLXFntGOAp6KVnmn67rrtoCTaE3byJyWOiNqOELIpsfAFU
	zRbByPRGWlFluFkq4ymK5bQds+bURWUzTofQOJ/rH0PLYEHB1V5kQ9217ZHYLPh1ugkfdnLa9tW
	CWUMDU1mFqBjxDRrHx0N0LRrvIzCrBFY=
X-Gm-Gg: AYBFou359tKVlbL+qeS+zqX5WkqOk4k2gSdHGXH9OkuWCGMVY7JZ63ISP7dsog6xgDu
	ZYkupCR3GYEUlfhFXC0eNbUzAqwIgR/2Lx2/x7ypI08KWXzJU30Nmc/HABJqXABXNQuaPR1Xs1x
	AXBDconr8Jvq8vDNOmS1UIC1QufnlWFJFnv+0NYdWLKD5u0hXhi2hL03vQgZlPqm5SyhFnAeOex
	TN8CPx2DK9SLlmcRlIPPDAwNvPTsngJR13af+RhBzbD0iFwE/1LYwzk/+AWhFg8IFJKA9gXoCxn
	jGdoQ0wQ3kBv3rk27l9GDgzyH53+kEbJOMBFqnN3pk5nlthL4nXhyYFPbGg3/TvpIG4Z2u91Nb/
	6BH9qNqXaTODH
X-Received: by 2002:a17:907:7ba3:b0:c29:f159:ddd4 with SMTP id
 a640c23a62f3a-c31a9d31be3mr1784113666b.26.1792071453546; Thu, 15 Oct 2026
 06:37:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912-alpha-kernel-compression-v1-0-ce9d55330193@gmail.com>
 <alpine.DEB.2.21.2610120106400.55767@angie.orcam.me.uk> <3a8312daad335c9cc7efdc497155af7c8a32af83.camel@physik.fu-berlin.de>
In-Reply-To: <3a8312daad335c9cc7efdc497155af7c8a32af83.camel@physik.fu-berlin.de>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Thu, 15 Oct 2026 15:37:22 +0200
X-Gm-Features: AclHuK-iitxx5wr2i1EudyqnO0aicnVXWKjyL2GUZ6w8krvfSpmRyFGLWSzLups
Message-ID: <CA+=Fv5RS6tyB28U1b-OJFLkwFLLA6r57amPCsfuMpc4ZQ9JZNA@mail.gmail.com>
Subject: Re: [PATCH 0/3] alpha: self-extracting compressed kernel images
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, Matt Turner <mattst88@gmail.com>, 
	Lasse Collin <lasse.collin@tukaani.org>, Richard Henderson <richard.henderson@linaro.org>, 
	Nick Terrell <terrelln@fb.com>, David Sterba <dsterba@suse.com>, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, Oct 15, 2026 at 3:26=E2=80=AFPM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
>
> On Thu, 2026-10-15 at 14:09 +0100, Maciej W. Rozycki wrote:
> > On Sat, 12 Sep 2026, Matt Turner wrote:
> >
> > > The SRM netboot path (bootpz.c) has its own boot protocol and keeps
> > > using gzip.
> >
> >  Reminds me to dust off and upstream patches for making an image suitab=
le
> > for netbooting via MOP, which is the only protocol supported by all SRM
> > revisions, since earlier ones lack BOOTP/TFTP handling, such as with on=
e I
> > have in one of my Alpha systems.
>
> Please do so. ;-) And maybe help getting the LRA port for GCC done.
>
> >  There's also a fix I already posted for cross-compilation support that=
 is
> > required to avoid relying on a.out support in the build machine, which =
may
> > not be there; I've come up with a better way to handle that and will sh=
are
> > the outcome hopefully sometime soon.
>
> aboot is also not cross-buildable and also needs some tweaking:
>
> https://github.com/alphalinux/aboot/issues/5
>

I think I fixed cross-building a while back

https://github.com/linmag7/aboot/commits/crossbuild

Not sure if that was part of the PR? I need to check that.

> >  Thank you for your ongoing maintenance effort overall.
>
> Yes, Matt and Magnus are doing a great job bringing alpha back into shape=
!
>

Thanks! it's fun work, especially now when things are moving forward.


Regards

Magnus
