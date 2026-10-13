Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD484E3232
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885654; cv=none; b=nLCAd/i9hG3aItEZXs3PT9Edm3/F+Or3ft1AhSIxVmP5OkE8zyKzpqY1Y8MKAbXlXxEO3YV2dbmvleQ+MjMMWRU0qopOLCVA/ldwViSNA6pmV2sDr+9+z04VrrnrCgWZ+fkEw1yIfOFmX6t3QtOISNk6yXUtO+MKG6VvOv0TiAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885654; c=relaxed/simple;
	bh=XnVrhANqeuMVIu0XygOlFG8ZPBZkKQaNjD3lYtvQ9wY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L35vIq9VY108e63hetU5iZNQzfuopOQifpCm+GXhRxnPyLIwaPTJS8B3olhxglOxifmDi6jWs8YYYWKB2ps6bRj6peRN7Jd6rAg3cPLsLJ8R3sEP+F58Wx3zzUHl5HtuAF8U+pCSWmFrZb0zr9weYWtErK9kjoa9V/y610Aahi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.win; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.win
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6afbc363efeso3221970a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:00:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885651; x=1792490451;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XnVrhANqeuMVIu0XygOlFG8ZPBZkKQaNjD3lYtvQ9wY=;
        b=eg89O77AvvEQ+drPFPHLZFIPjDZ++gZNWjTiX7/HO0JSC+X9hQF7vZk/Gz6YVFxgbz
         poQ0NmvFOSftI4FoRX6jLH3OZ4KYTe4R1iVdDB77cJNoAO606PsU5Er26aJ5bCoSCgWM
         mmJ+ALiGveU0A3OWJqHHSFZB+GwSQKIdd40hDAv78h/hoHhCD8IcF+OYhA1ctoeJ0FoX
         zM5+W09w3I1oARyUMU60z4CujHdZZul18VBLq1UVVNGiFBj/2HjwPtpHVOY0A2qA+PvO
         Xv/XnSFh4J9IBmBOJ8psisy/JlXZqT0lcXdUzWS/UkGdK1ywtpOxyaTTv5AV5hqTfYk8
         jcng==
X-Forwarded-Encrypted: i=1; AKwUvBy30wo2m+IX3OidsVSdW+N1h/F47k7JJpqxXh+dYypbIj+RTnBtkg4dv1Pppowf7720QKczgA8t3IpDK14=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcef6ozHQqj32M3APo4UxuepuLvx5aFx0tjyjiM9sRcUGCT2sd
	UAKo1vmtfEOdf6qp/ay1r1Kr3eVpXcFrgX9SQNxdLFjReJJ5XENrao+DjAufsrTNWjs=
X-Gm-Gg: AYBFou3uylAWdR0Y4laR2X17ziXHYpx9SckvfWX/sk6Alozn5Cb4waB4koaQcpxYPFF
	/r6PleSPv0DFN/d0cEwFuNM+vIRQc+gRaUteCZ2x1red45huTwTT1AhC5BnKxRqwNx9QU/jKMkO
	T/7YUk8Oo4KoaoL6+OvZIeSkwJHySEkSnvMWl1MLcT5DOxUMGiqI2uioLQWpoWgs8lCV7NEzn9d
	kiLtb/yG4VU3qHW/qvFG9FG/1ImKGJLRJbMPe390M8Ou0qfkbs6LcHJ8LHqzqBzr7doPda3IGri
	mVui43xAHQsgAY8psxBSD1eQaPJ3l1dxBq9GYEFnF0dgNUfCkXxeEykVmCX64S5mNcL/A2bQVZO
	+QmtSPuKgUgtUZrj9MSZ+wy47YtmjE3m456qjge8DWO7N3ilxqbgXeH05xhivngBNQPUvWUcNfJ
	/OYP7SCweMb0wSjO1WrTw5B06ubZVQB9eYOK/Y2Tc6xH7Phb221cnL99uv6XxlZRPjNqiRg0lZR
	ib6XUZeARCsryhTV8pRTR1qu6rA2OU=
X-Received: by 2002:a17:907:cf93:b0:c29:4634:5c99 with SMTP id a640c23a62f3a-c31a9a06099mr1066932066b.4.1791885649470;
        Tue, 13 Oct 2026 03:00:49 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9767227sm556651466b.11.2026.10.13.03.00.47
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 03:00:47 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6afbc363efeso3221879a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:00:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzCZVub4ZLzxnjD09CKJkCIB4Jyx5v4ZysUFs8m+McCHyosx4O2sJmeWdj3JOA0fjXarLYWrccxFSfTdBM=@vger.kernel.org
X-Received: by 2002:a17:907:9411:b0:c2e:3464:6e36 with SMTP id
 a640c23a62f3a-c31a9ff9da2mr1106851466b.41.1791885647302; Tue, 13 Oct 2026
 03:00:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928042641.307683-1-pawliczekerwin@gmail.com> <asMaVj3KFINl3je0@gondor.apana.org.au>
In-Reply-To: <asMaVj3KFINl3je0@gondor.apana.org.au>
From: Ignat Korchagin <ignat@linux.win>
Date: Tue, 13 Oct 2026 11:00:34 +0100
X-Gmail-Original-Message-ID: <CAOs+rJVXSTC9jx0+aHJ1Qqu+SmenpG7hFboE6cU0Q53esg9f8A@mail.gmail.com>
X-Gm-Features: AclHuK_tAyYWHxgKHcntS-y-sSXdDkZXIzV1YAVb00w5795MU7hR46YRHM7QTf4
Message-ID: <CAOs+rJVXSTC9jx0+aHJ1Qqu+SmenpG7hFboE6cU0Q53esg9f8A@mail.gmail.com>
Subject: Re: [PATCH] crypto: ecc - Use constant-time modular inversion in ecc_point_mult()
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Erwin Pawliczek <pawliczekerwin@gmail.com>, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, 
	Lukas Wunner <lukas@wunner.de>, Stefan Berger <stefanb@linux.ibm.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Paul Louvel <paul.louvel@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 5, 2026 at 4:32=E2=80=AFAM Herbert Xu <herbert@gondor.apana.org=
.au> wrote:
>
> On Sun, Sep 27, 2026 at 11:26:41PM -0500, Erwin Pawliczek wrote:
> > vli_mod_inv() is a binary extended Euclidean algorithm whose branches
> > and iteration count depend on the input. ecc_point_mult() uses it to
> > invert the projective Z coordinate, which depends on the secret scalar,
> > so ECDH leaks information about the private key through its running
> > time.
> >
> > Reimplement it with the Bernstein-Yang divstep algorithm ("Fast
> > constant-time gcd computation and modular inversion", 2019,
> > https://eprint.iacr.org/2019/266), and keep the old code as
> > vli_mod_inv_vartime(). Only ecc_point_mult() uses the constant-time
> > vli_mod_inv(). Signature verification now uses vli_mod_inv_vartime()
> > because its inputs are public: the s^-1 inversion in ecdsa.c, the
> > inversion in ecrdsa.c, and ecc_point_mult_shamir() and ecc_point_add(),
> > which only they call.
>
> Last I checked we have no in-kernel users of private keys at all.
> So does this actually have a real in-kernel use-case?
>
> In fact we should probably strip out all the unused private key
> support code from the kernel.

This is not unused, these are used in the supported ECDH algorithms.
Hence I was rooting for ECDSA private key support anyway, since we
have all the blocks.

> Thanks,
> --
> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page: http://gondor.apana.org.au/~herbert/
> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
>

Ignat
