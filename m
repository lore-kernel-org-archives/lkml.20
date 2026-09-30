Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37125158B7
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.167
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790787500; cv=pass; b=qFU64jU2x60z/hBln5MhYPauUjqoOUePABzWWk0Gv1vRNdNzcLAEgJ0acFgDfucwJLS3G1jDq1phWkF7ge1iLu+GiVqV8IAyUK8FuLEbIdSPfY3f92z8x7lTttxkt6gnyyU4NfWE0uyFX2NO6VDL7BBceEKrcKcijQlTG7VLQ+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790787500; c=relaxed/simple;
	bh=PFVmbYn7wXum97HiWvItCdk8J0+FslrKg4VqBVCXr+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a2LDe6TXWEOucQk1JcbKS8gJi1XutlA993zLZHt2tnDMDrpQlTFX50b7g6fWtvJqhGRRLZw+Gf1AhK9fDcp9aUhmR8ZwHa1XTcW3JIe0FYhhrvxGjI/aKRj+69pCt0ZO3u72F9NnrmnzPzws6ZRymxcR5KMlJ/hjginDaWN/Ghc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=0iyYpFzN; arc=pass smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="0iyYpFzN"
Received: by mail-pj2-f39.google.com with SMTP id d9443c01a7336-2e2d2bbcab2so7964295ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:58:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790787498; cv=none;
        d=google.com; s=arc-20260327;
        b=KLbthg9iG0c2HTa6tX6mSwT0qfxsgRPzBCrNz1eRdHE7tZs1vub0uh1IdNOkjvLpFj
         qWex2rKO1cU5XnoUGxhNXV+ZXaTD1dfxY8V4CIp7xaq2do52gdO+fvb+xq3ZZNjgkMpg
         /wxOrSV9kirm18OoX20TTgtOdKhd3TVy/G7nGaHEnuRcDVqSA7fPMkEFtS4JeBREuTkt
         05HRo9i3LsF5BSWZ6DJ4SkzEFlAfji3d+xiMXL2+YZyGVzI9bOHLmYicH4Hdf4CptOxG
         WZf8BtWumqtpq937JCraGx4Q9LgjALzeVfOfmx1GsF1KgdCAwE6k0cwVm1M9gFGXgEK1
         3l7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8tHU8kM38mvHPaqIAaeYccyBz2KlL0E8vxrWEOhOZSc=;
        fh=UU9G7olcWaHGlWZGRVAXQJDPShSUFSSAQxDjMUaUfCE=;
        b=EjuIGdQUhCEh2gDhs6wO+xJLdzan05H7yQdRyGpA3VBpXwbu55xu7jxCQ1r1cLT+8L
         PGf0ql1RLbD8oF9bXLQu2QTWbL1jTMIuuX6N3kQKK53dr57PCAIdDoYZzqKRGt/DRsmu
         sCjqykjbwHd6eRMgCx/M/LjKy0tyxxq+MjxV88nKUq/cmPh9RFLk3P4KefCOB5Hne7uu
         eHSMjF7U0Mf5A8IQP6QZ0FA1WS/EfYYafFRHFoUB6tyEy93xiogl9OMHQI9KCuEDuAdu
         Fl2XQVDGN/dpDI2ft7yXHnU15GQ9ZmovsvqeUaVwXtp8Bl3X3/Aakp2qPP+OcolrmRKx
         nBUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1790787498; x=1791392298; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8tHU8kM38mvHPaqIAaeYccyBz2KlL0E8vxrWEOhOZSc=;
        b=0iyYpFzNR/ZwfG4pxkOSw5wVbuqDlRBNsG7rLRw7FrCadsGu6EJr3i/tvUrfYMo2lF
         UeOPzbD0IwEVCV+wgJcj67Ybh+E3H0Z63BZU2hwPwLvG1YU1gea6NVd5AF8UbUrLRRla
         KNm9t/lO3UFBL4vNpSjCahfLGBiuQ6NOpPvPZkJ/s9wb5TzlVxXkOkpo56yPD5ihuYDL
         2af4aO+V43i0YN5FjL/NSfV57Du7eCjsGVvJ6KuoKefoft3y1/hzhqyxY3I3l6e1lYNk
         Hcxo50e7gpqXV+KOnpiTD/zurWT5zeF257S02oK/l0GEy27cfpSDaLlFkTDf1/taXa7Z
         nC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790787498; x=1791392298;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8tHU8kM38mvHPaqIAaeYccyBz2KlL0E8vxrWEOhOZSc=;
        b=uqIP967zoaE7cS4raaVeayRRMrrsffyXvq1EQ/8+LuiCknIl6/8UTKIziXlwOgCaNB
         6H0ThGn1ZN6kAoX7ETWnHQwXTHXbKhfRQXCoLxckzVybffLTCsQl04QimKXttRA8/b4P
         VVyt843NGQpJ5XaqkSyDfLvYfVC2REppKAbGnqYKgNFrCPHJxM9Y+g04huvs3UDcXY3n
         0Swnf+Rse9m5buStLw5AJEAU4u9N3xf+Xr+gGztAtXBQiS+AuskL4fWuNPXomLvJjL84
         1HUFQZ5H5ngC8WLOLj3v9YtJPatCZM/6B4ETLWZ1EEGgXXFkZa1/z10/qjYnFyS5xMe9
         8VBg==
X-Forwarded-Encrypted: i=1; AKwUvBwUmZVxzk8XZIs0ho7QVLsyB+3IM+wZS5PskRoLzlpNzNAEx4vVTruZYEjZPTmQocv01MnvEdsuNX5lTg8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmkOFO3lUQ5O603e92zlH7dLCmHxCz2OUc+OEwTHkKOjGi0WNB
	SkhguPPZ082nENM1mcmh6YdxWZdgdM4H3fWGZfCMryER2O0kMN5OIXS6z6WckQt4cMZi98Gloep
	XMjzYTP8UvMoM2+0PP6PCKOfvCFrk2LhOoV4objzv1g==
X-Gm-Gg: AYBFou1nsOwC60xttLnx9PmbCFsSLZs/Izv1mR2rLVjmWaTxrM9GausBr+Oqx01NGkP
	j6uzg772vjwbPiKa2nMlpUeK3Xp8NPcgmx5s5s/a7NI9khBPm0Nz/LxMMj5eJVwTUyRTN1v8ubl
	TOdAza+t6j7pCPCVq13h0ZjiEUI6ScZVUPw8U+JswcFyxl1EKFOnJFuM8cBS47nKFqCmhvqUnWB
	j8yBkkvASSI1b/U1wswzQ2kIPN7jvLmmTpFlhfdaxL4cd2t3iT8wsMw9V+y0j5YnmGULzsce3ee
	6KK8ImbAUVIvquyG/S9n6L4HaiuG1ELBSUVz+vB2Xno+PJUg6P1o7My20/PdLqtBOuB119s9QY1
	3B1iEgZE6ZITf03+N66QJ7CZEeqZQmD17620=
X-Received: by 2002:a17:903:19f0:b0:2e1:24ec:df51 with SMTP id
 d9443c01a7336-2e2e4bf6e86mr18103575ad.53.1790787497948; Wed, 30 Sep 2026
 09:58:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930122305.293686-1-robert.marko@sartura.hr>
 <20260930122305.293686-5-robert.marko@sartura.hr> <3fa11f0a-3b08-460f-9355-72011dcfa7b3@lunn.ch>
In-Reply-To: <3fa11f0a-3b08-460f-9355-72011dcfa7b3@lunn.ch>
From: Robert Marko <robert.marko@sartura.hr>
Date: Wed, 30 Sep 2026 18:58:06 +0200
X-Gm-Features: AclHuK-zCx-hRo4FQHcXpEa4B7tZt8c59IzcCUddj-jkCNJ_V1CZ_hahpuYPcAk
Message-ID: <CA+HBbNF6Z9uSBbktH8oOCRrHgaOujqEaLozge3zAw4ROUXi7OA@mail.gmail.com>
Subject: Re: [PATCH 5/5] net: phy: mxl-gpy: support MxL86211C lane mapping
To: Andrew Lunn <andrew@lunn.ch>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, hkallweit1@gmail.com, lxu@maxlinear.com, 
	michael@walle.cc, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 5:35=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Wed, Sep 30, 2026 at 02:22:17PM +0200, Robert Marko wrote:
> > Configure the MxL86211C physical TPI lane to ASP mapping when it is
> > described in DTS.
> >
> > MxL86211C supports per lane configuration.
>
> I assume you have a board which needs these features? Is the .dts file
> ready for posting?

Hi Andrew,
Yes, I have a board that requires it, as pairs are reversed intentionally.

DTS is not yet ready, as there will be another revision of the board
before it is commercially available.
But I wanted to get the ball rolling on the missing stuff in the MXL PHY dr=
iver.

Regards,
Robert

>
>       Andrew



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
