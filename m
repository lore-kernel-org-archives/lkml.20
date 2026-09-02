Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3002D35F602
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788362236; cv=pass; b=ACKo1CYM80jCMl3l8hHNd4BknapusaFsX0+i3x9fxHFf7wvOiy50Qcvucb6NSOanAPRkbNLGFUufFgrtrdMRfSF9aVxy/Rez+BiKBTkBuix8UwwWUb2DGDlObQa1Scck3jU2sEAzZkOrTJJZEDGQGpj9hIoOqIxVWmfcWDG/W0M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788362236; c=relaxed/simple;
	bh=HCC/6KFEAMm4V1Cz9W4xpNmgiWKlwwdYoylYCLylISI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oFTp+OIseHGg9ydYl/QKQQ7Hu6Nbwidw9rv6yDPTnBOxkNH5ElNgzVhmCgMc+OFbcM111++HOBrvts0CfwFbBzO9WoNsqNn8Gih3D1HzKptKCzN2r08YZGEl4O9uT+ovHrrSYavI8/pd6z+4L9G2cNAvoemlTEIC1sNuCaK2ynw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Km7FOWj9; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Km7FOWj9"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a0c8283146so2107463a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:17:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788362232; cv=none;
        d=google.com; s=arc-20260327;
        b=nwtcz53Cg9+XWiStC/cFPpzt0Lsu/AxnXzzbQ4wE+NBYZzZJJCFOrjTOAngrmEQABo
         VKvvGi8XA4LenCw+CR8ZtVli/b42i6QroV6SQtQ2oP8edxjCu0nz6gc4sY2LXI4eidBQ
         EYuNPEJPTcHYfBb42yQVzxBUr4GqanVXlprHuA0hCbnWuBuijK4lheGr4qwkHqBiWZ27
         GAMcwLmrqUYocenrAuHOUNYea8VFM8/UV8Xigiv9BJ6Exjtt1HHTK7kzl6XOymO3DM7t
         Ddms8b3KDdN+cyBXCbFwcRKyWAOn3/Z96VFgKxVXn0PliEFFhXfuWpd942TYjcfRroQu
         qRRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tTGWO4BQiMMCPhl0MvJ6+ZmQ9g+J0+MwZKIZjv1m17c=;
        fh=bK90TNJeJgs/6hsRqFAQbKAlwIhr2BYxrww2L+VRrhg=;
        b=U+eqANwa5rc40gDJZR0y3O0gsdVaLZNvH7JzYRs7KPAYhUoiOvZd9K+TJPIvL1VpGR
         +aHkGrlVY01d5E+ENELJHwEPXm2uUia96szXhfZ2r4cCNSmn5oeMYlahYSJzgkx1akhA
         OFMVZJgoB2r6AqZ/i5+rVus/VIU9yb2PQzlIv54Y4yjixbb31i/aHI2wCuB6v5vhQghO
         8dkunl6czyJWTPRxn/yz0TeXfcNNY2tIsdPHv8PpJO57nWlId2xEnIUWE5OjPEbapxV5
         gIVI4ZwnHs8byKRSfhg4UX+4mQsXZNX/l7j5k0ZqDdeKBLMAyqZ6Tg1Ad8chPeEoOM9R
         yFNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788362232; x=1788967032; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tTGWO4BQiMMCPhl0MvJ6+ZmQ9g+J0+MwZKIZjv1m17c=;
        b=Km7FOWj9iAsHrAuGPOMSehIQI5cmQuu7+c7ILfW2qfx+TKzMDvXmUq9Oe+jb1gVuBz
         mucS4sJb0JPITC6cx2cCz9jkuEILDSwk0p363+l/+tm4uiYE7jMJPkJ8pxnvkkCUQ3Bn
         AahMq3iJjmvxtUBpFI7y/6T3xN1jwXyImZXyTtiO8JhQK9Zirj0K7YChb1c3iEG9LCWO
         LWJ34LwaGJLTAQXy88oaDCN40LQdZIuZqvO8DRrwXqd71ZJdbfLAE1OJwisWmBuin7ac
         z+4TxOANkLZvH41pgp0jJsmZIUW6ihg7F+uhVtUSPqXMoUqwazdZCgEfCBtPULb1hsoQ
         EeCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788362232; x=1788967032;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tTGWO4BQiMMCPhl0MvJ6+ZmQ9g+J0+MwZKIZjv1m17c=;
        b=o3gZQjPbvBfge2u/0OxZj1BAOsIaJSU9cyJBIZHNb6y9wChTVIyKvf80eDbj4gN+BP
         nMGusjU2BU7Ny0ZizUfe+5EFRge1gVSFMozXtm96hoDSq32BUspwf+U28hwp6d1tMGar
         eHQ4Md+4v5sBZzEKt5I3lCxGIns2JDvtj2VwSvONYBPPR3pwLZx4NmsqdzOorTOkYyo2
         uaAD42niWa/95AQCZ9IejALOxeVNx1vInurNnQjLq9PPKgLVpJqYn1OcxujpiBKGsWWJ
         4R0kFA2etDvpSCmDF2XPLi1T2oue2XWi1SimQX9IznxyzOYYSjYqQbf/y+OXgAm2VsBg
         RNZw==
X-Forwarded-Encrypted: i=1; AKwUvBwTiBi9oI23sJ5wTc+NTUEzOQzrEv5AuM/2+llC8zvs3fTxYTCEGvcaRN5/R1PIkvCcvNnzheszMaDaqGM=@vger.kernel.org
X-Gm-Message-State: AFuF++nxr7PNC7JxzqXqHvs5LhTLKT0v6y/Ji91BahpAs7RnRkWl2ktG
	RUVoJU7uqdw514ljf6jbsJMgxIbGQyqPEaOvVAUwg7CjSfMxoazokrr5n0g6FbW7HL5LQhsT6R4
	MbmTKdYY6NhqA08oQwUi1dRsGv7G+zfI=
X-Gm-Gg: AYBFou2DxRFMX4YNFVIgfIgh8daOS+KbkpJOpazKHRedAIA5+OFS2iw7vujPj5cn206
	ZkXk558yvCGvC210lERXKNtvb8bBfAVXaGvcL3IBmRdmDqft6VATBqQMZuWbm7jOBGcIvnhG2rA
	BUGA+xnjYbt1T/vtIgr9eX7kiyeT2W+Pj1r2+fxXWSgSYpuWQtGhGfTv6ek+4dXHpCpkw90UXo0
	d6whbnoYd4ZLBhqHQIFOdsTncL3PwXcIUDmozs0MSjIOveuR55H2g05AdHn/SyKNmwXwIjbuv7C
	mHrRRUCNW9KGtFyYKhknAOQdvrJEsJu/JYnTgyAj65ZDcwxt0xhc/rE38sPNa5jNax2RvyftnmJ
	t5Q==
X-Received: by 2002:a05:6402:3216:b0:6a4:ae1:333a with SMTP id
 4fb4d7f45d1cf-6a682799fb3mr4537168a12.12.1788362232011; Wed, 02 Sep 2026
 08:17:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901185600.2725678-1-2000jedi@gmail.com> <2026090219-democracy-chip-87fd@gregkh>
In-Reply-To: <2026090219-democracy-chip-87fd@gregkh>
From: Yudi Yang <2000jedi@gmail.com>
Date: Wed, 2 Sep 2026 10:17:00 -0500
X-Gm-Features: AcwNN1VqxlHP_AWnjy_mt0418fNXAxgUYvArTOP4_3ID-w8R8wzD-318rfyEZwc
Message-ID: <CAN3V2YU0a7Mj_Sdv5VLLO6AOCbTYXJZkRwfKKyZtB-yPb5COOw@mail.gmail.com>
Subject: Re: [PATCH] staging: greybus: audio_codec: fix stack overflow in
 stream name parsing
To: Greg KH <gregkh@linuxfoundation.org>
Cc: vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org, 
	elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I found this with an internal program-analysis tool that I cannot disclose
yet, then manually verified the finding. intf_name and dir are 32-byte
arrays, while the unbounded %s conversions allow tokens from w->sname
longer than 31 characters to overflow them. Using %31s limits each
conversion to 31 characters.

I do not have Greybus hardware, so testing was limited to building the
affected object and running checkpatch.pl

Yudi

On Wed, Sep 2, 2026 at 12:55=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Tue, Sep 01, 2026 at 01:56:00PM -0500, Yudi Yang wrote:
> > intf_name and dir are 32-byte buffers. Parsing a module-provided AIF
> > stream name with unbounded %s conversions can cause buffer-overwrites.
> > Limit each conversion to 31 characters.
> >
> > Fixes: 60e7327d54b2 ("greybus: audio: Find data connection based on id"=
)
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Yudi Yang <2000jedi@gmail.com>
> > ---
> >  drivers/staging/greybus/audio_codec.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> How was this found and tested?
>
> thanks,
>
> greg k-h
