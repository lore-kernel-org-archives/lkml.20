Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1703EBF14
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789541768; cv=pass; b=KTr7IoNBI6SKBvgZzfFh45jGfd5WDy64WX5HU2CgLgJtyjMXypNslI4dHQuigAb13jwhjTOpn542LH/lomILFYrueGmsEpd04NyUsAI2AbSU2wY91Yp2d9u5fDhfTSnv3nG9KszDYDWTcMOMWqGaTBIhEYDlyXL4q62vfYPGhn0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789541768; c=relaxed/simple;
	bh=NoE9nFRvmp4Ea/sSZ3r0K/eoMnt2p4WDblnCN36FMbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pVwRvsTL0F1K7PVjICCF0nr8G+GlmVC3X1HxeHDphKABLLCnBTeurBkCp18JZYwBx+g40M20VDZPpI5O/mXpo3JFoShFX90ah4DmI8YR2J7NJyeNsxPXNz3Rmy32WoRAeEKMdfnpxHlHoxeVHVZLpvhxkRZJrSakAIgwTAx1yFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NnQlTS57; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=oeXMEgY3; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NnQlTS57";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="oeXMEgY3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789541765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OSGe38PhJmGSFK46iAJT77WdJWyV03W3gLiL5YZ41tI=;
	b=NnQlTS57GqVQZ9XP/BpVuvInB2NVBruiZPRVi7gckzGy5E666X0ufgjThv+WAGEHXTpNGx
	c9mAnKwzL/pSg0j3ExdF/dqhsb125mImJJjLL/hnw+XSplPeGaCrLaPvY8BaBNjo9WHJA2
	OIUXg1/f1o4u/0lsmgG8qoOsC7IapVM=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-ojIFg_8QP8-CNmD5gZtGLA-1; Wed, 16 Sep 2026 02:56:04 -0400
X-MC-Unique: ojIFg_8QP8-CNmD5gZtGLA-1
X-Mimecast-MFC-AGG-ID: ojIFg_8QP8-CNmD5gZtGLA_1789541764
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8563c2a53dbso81081627b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:56:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789541764; cv=none;
        d=google.com; s=arc-20260327;
        b=JCbbj13ml1p7uFz6ubzPvGRLpA/Qzdra5Vr3gB93zk2dRg3kzqKMXCur00iCbqa0wY
         CxuWZBt7kQTh3hdabHQo/OZstDvCnnGLhZD4s7m9l31G/RNp4dB4+rRSyttfm/nvXUy6
         h/3nkgKE04L7S1qjPDwibGVrhyXZunh+cxenSu9PqQ/rZ+GQcUhPiP5TNchBzYJ3BntZ
         pBRMRnnQJiB2KFCvUrzaVqbluXj5ddj3K9yLIe7TcuOvBIvNOBcwhG4DiAnNZelmLCEZ
         JDwf4VlsdTw3AQ9/FfOsx6lttJ5cTSnkNh7OslFBPUptXL6UMHxDqQwmhm3w4RJ2561L
         YiQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OSGe38PhJmGSFK46iAJT77WdJWyV03W3gLiL5YZ41tI=;
        fh=Bd41QYgsLZ7XQ7MdZrEqLwFo8cndNn1Z/DmuaBQg7z8=;
        b=W+TOeqgjw9nvhBfx/qUw8G+NYCdSspwFGlayz9JNO5/6ecLHjXa/78xbc/swgk0juh
         OwV4wQu0DGIMLPUClIdST/wuQlY7U1BHuZOoJJd2QZs3yvNvt5NoLF2PeIMYGmY51EB0
         ekWa/+OI2EE3A64tSLK/Ggu0iYKiQo8gBWLsLO+TIlQJlhy0cBSgvfeH3Zwn6ScVZMC1
         JdceerNp9/Uz2SEix6pucj2AVsGcq9gSuJU7mva7j1BY9SAsyXF9Hp7ueN5p+LfDwmhO
         mV7H4/KdxUam2/oAZJk6e3Vfs1BqqcijOLIkBQQ1yjN9Rpq8egTLOyZyPL7b5l0fydB1
         tvCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789541764; x=1790146564; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OSGe38PhJmGSFK46iAJT77WdJWyV03W3gLiL5YZ41tI=;
        b=oeXMEgY3lYoyPBurjzRTiTf4GunGAxst3Rn03wSP5untF9LPsMbV21WKleYIrHhJFu
         J2AYfa34U60WeW+6bcy/3luhpMvxN6QQYoQ4qITeTwFMbEA0fF/YJrdc7BzHtxPe6kkR
         5wB8R88nI3DHvzfwLFlzfJZMefFzl/p/CDV7898Q2KRKNxblZOAQEa4BAfHAVIPWW8R9
         YTbAkbZtBCbGiC+60AGBvjfAeouZ/03U45dyKgw3ZaN/mdlxNyeg/Pjiy/3MPVCOf9Uz
         114DTPDhZ6d7kbQU46mO8mit3U8Pwz5c9Gpi5Exz1uWK2ytNLFhi1aYBdhiFAlibVFiM
         x6ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789541764; x=1790146564;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OSGe38PhJmGSFK46iAJT77WdJWyV03W3gLiL5YZ41tI=;
        b=MPkMICugohZzEQ3WU5X3y2tnIyK7qGkH17qYcCjwUswG6/VctEqHVWtxePW6wklNst
         rUsOsOVRB9SZoJfFaUd4lOxKcnKi98/a07SUReT1OG74a7PDIg5xD9gHyxIj/3YiCM3P
         Y7lcRvkrfY1K85/JHWftBc0463cXNqPcFdyz7T8kbmTPRNQY29rqdJzxwGDSoXxVE0ip
         D6TnjBSGNbeLngKyGZFG8Df4lmjD719jTzxGfBK4aeCZ235OJhhhsE3a7t8+Vfn283qG
         mnQBZ1Ls2IgEjq/0qSGfmdWtJ0sj0VxOhHK2y25JVAIlo56AF0n7CZVmeIuxsaOWATO0
         9F2A==
X-Forwarded-Encrypted: i=1; AKwUvBzmS26u1wTG9ZgESf2xhIBN7Pm41sBrg2cYEiFGWiRHwcivimWVaWBlraT0BLkHrm5J68zRNN9SwhdlqtA=@vger.kernel.org
X-Gm-Message-State: AFuF++n5yzqNIdsxVFZ4WPy4o6crfsv+wBqRGVVevJpyQNBnEAvywt30
	vR5YKvEKMbTgb6dMn9n+/jmElCGHalyX0LdTzKMCzEjupAY9rXiceipoS3ZTx/mLj4PkpyKjJc9
	1fweNnMKjG/0zAK+5wfRpkZmgGMFWKKPOjwhj1OATw2QRxCRnXmwknK/o8jLNO941UkKK7eKQws
	qPwd3mT+1FdMq15w0JlZU/8L8P+NovlGHt3C33vXc5
X-Gm-Gg: AYBFou19Nw8m7Vk4vhXTHfEWbPS0UPrFfCj7m3NDDX3wKJQL8AgK2+YjjwN8mun0nxE
	M+Ut99p56ptB5aeAA/fNy6fMdVZEB4ltX/0lM9va1g9mJVvAIrfbK5ttRWQLpIREEkQ0IY3VYs4
	C6f6u0GakYqEQKyUxfLh7X+FLSjJlBybZCMGCjgJWDmIXZlOlZjdgffg==
X-Received: by 2002:a05:690c:f05:b0:873:5c6b:a303 with SMTP id 00721157ae682-892287f189fmr4701807b3.49.1789541763828;
        Tue, 15 Sep 2026 23:56:03 -0700 (PDT)
X-Received: by 2002:a05:690c:f05:b0:873:5c6b:a303 with SMTP id
 00721157ae682-892287f189fmr4701707b3.49.1789541763437; Tue, 15 Sep 2026
 23:56:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-fix-ath10k-dangling-v1-1-15c5089682b1@redhat.com> <aql_xwEy5POcVmyU@google.com>
In-Reply-To: <aql_xwEy5POcVmyU@google.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Wed, 16 Sep 2026 08:55:52 +0200
X-Gm-Features: AcwNN1W5FaZULdrsdUU_R6G0qyPldCKGYGglzM9AHIv81gsd1ujgPjiFMobViKg
Message-ID: <CADSE00JiEr+k3ykLq+D9C-WxAcPpzXdF3uJnv_P47G1V_-jeNQ@mail.gmail.com>
Subject: Re: [PATCH] ath10k: clear QMI if failed during init
To: Brian Norris <briannorris@chromium.org>
Cc: Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Govind Singh <govinds@codeaurora.org>, 
	Niklas Cassel <niklas.cassel@linaro.org>, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 7:26=E2=80=AFPM Brian Norris <briannorris@chromium.=
org> wrote:
>
> On Mon, Sep 14, 2026 at 03:05:19PM +0200, Albert Esteve wrote:
> > A failed ath10k_qmi_init() left a dangling
> > pointer (ar_snoc->qmi) in the cleanup path.
> > Clear the pointer on the way out for hygiene
> > and consistency with deinit().
> >
> > Fixes: ba94c753ccb4 ("ath10k: add QMI message handshake for wcn3990 cli=
ent")
>
> It's all going away (probe failure / removal) if we get here anyway, so
> this hardly qualifies as a "fix". In fact, in a cursory check of the
> driver, it seems the NULL-ability of the ar_snoc->qmi field is totally
> irrelevant to this driver -- it never is actually checked.

Yes, I agree...

>
> I suppose you can still call it "hygiene" though, and it's probably
> reasonable to do the same here as we do in deinit().

... that's why I phrased the patch body that way. I hesitated about
using the Fixes tag here. I can send a follow-up removing the tag if
you'd prefer.

BR,
Albert

>
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
>
> Reviewed-by: Brian Norris <briannorris@chromium.org>
>
> > ---
> >  drivers/net/wireless/ath/ath10k/qmi.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wirele=
ss/ath/ath10k/qmi.c
> > index 0d74548a5f34..08a64f737fb4 100644
> > --- a/drivers/net/wireless/ath/ath10k/qmi.c
> > +++ b/drivers/net/wireless/ath/ath10k/qmi.c
> > @@ -1128,6 +1128,7 @@ int ath10k_qmi_init(struct ath10k *ar, u32 msa_si=
ze)
> >
> >  err:
> >       kfree(qmi);
> > +     ar_snoc->qmi =3D NULL;
> >       return ret;
> >  }
> >
> >
> > ---
> > base-commit: bc35965f6940a9bf834d54187b6088b8eb09206d
> > change-id: 20260914-fix-ath10k-dangling-15676d427cbb
> >
> > Best regards,
> > --
> > Albert Esteve <aesteve@redhat.com>
> >
>

