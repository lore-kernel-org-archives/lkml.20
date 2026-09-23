Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6292C55D893
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790191155; cv=pass; b=fir1SNKSz+PBl5+MKjE7zNqePdZUqtT1LAhQrx71ZpMejcKYcRRQorDPJux9LjUudczGWStSfhBM2rESBRLABiTrkT00iPa4lVtTawWsLWMOXAqcTjiD+0ks6Kakccwb9H/IF4+fCvjYY6NaZZyruvm2GLeNCdrB9v+r/vUIdNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790191155; c=relaxed/simple;
	bh=REliDhaH9+1Oq7CbV+dKfmJpG98JSKZR8x6JKNYcStU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LlOrL0ZCeDaCa40XPnrpPfbr6v5d/zJthTn3EcPe9KDIHOmQUc14KqeTY8hmvpP0wk67MCCkJdXxn6XfvRye8uQSXBLvqI4VM1bIfVdp/14BO2Bk3D03F/pf4J5Rnm9fGt2K9ZLMF/4CghwO3RuyfuwIYayBcostXcOmU6xzADg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YZ+Zg5nm; arc=pass smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YZ+Zg5nm"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a6287d59b2so10330631fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:19:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790191151; cv=none;
        d=google.com; s=arc-20260327;
        b=m22Adp83/2mUY4vH2GTBQlQ2lq1NC+VCIo6jbVFdyDAJviX7Bld9B70lIXPBzrgW0d
         UrKZn18BHPT3kE+dYh53RbMa6W5FTi/H91sXJjiNibnXH5++krMByuF2+8OUAufO4LVr
         Cpwwgxx1r+H1FFf7yY191Xydcfp9GHvlVzYK4fglUTIfLMTMTjtM8J53iLNPAY/S8b+W
         u5PUR5FM2VryRC7NnPzZkxDeT+RTDh+H5vUCiH+UYHbtAhIOJ3ZH666UtD9uZZFRpfni
         T7qE0cx0/nbl7Modd9k5A0+ISLsZiCDOFYtQ2kACoqykurgCYOKmXScg3ILiA3BJsM2L
         jW6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=73WOzeiX39morD6/5z/QgMfS5LWgdgnhu2L7icH2rx4=;
        fh=rKysLjc66uYqurLSsoKG/tK3umFOKTsFsgrE1AaZKGA=;
        b=qwISgYs62K++GY0wj96pBPlvE/SdNmi4UHahFwzwoquUUTF0x2GVkFLXTQ5XzrH9Kj
         CU57Lo+6jPKJ5RmMbozGpBg3uDN5kXVxr6pstDZ3bVB4/vElPZYj5JLGZQ22IfH/egdP
         UZLjWdancewcS7KkuAxKv2Dfvhdjzf4kfJrQOep+eqr0CclG+NEKnv7se48nLCW+TMxM
         rkK/LRILKD8P0m3f+42gdFoQ3wtqJhBcq69rK362ewIGIw0IyaQfvaFiBSeA8cAkoFHp
         RDPLT0z1nYZEa/DTgxpLKFMKTb0dzAX3AKVyYdwqMYiuzVVFVeupIzum6ZiVn/L/8eGI
         YnyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790191151; x=1790795951; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=73WOzeiX39morD6/5z/QgMfS5LWgdgnhu2L7icH2rx4=;
        b=YZ+Zg5nmsvS1gx6r/JZHOUDYNeh1uJ141Um/09khgJiACqXA+sVxvybc+OCKrvjcGe
         0389+Nmt4eyn9JhgMiKxGgQ/fLFRI+3/iSZ9wcD4YRIbtKPjbGAtyYWThYdcKuTICyV+
         gYgnTtnN7XMcMa30HLz3Ogo0aNnaYeBIppKZN3J/OxoA2z4nxu/bURhtx1ld3a3vvnsx
         BbsxPw+mmla1KZOMKqMvEHsmq+WA/MjqyYr/y1rYDkg6GGLAKenjiKVFFrIAwmZ+0PfE
         b6mGCmtMrECwVlAJ3gmYFjIUcQ7yWBk/olKnIXA9aSN+/Pn8hDeCbOV3EDaAnpqn+zes
         rRqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790191151; x=1790795951;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=73WOzeiX39morD6/5z/QgMfS5LWgdgnhu2L7icH2rx4=;
        b=aREV2MgS9NPujT2AESWNqh6/MtfKczkg5DKZ1hA9Tm1RKV+8WaI6NHHyFwDh9Rq0pK
         wNZsMy6+P5Z3792u43K0dfFf0kc5C7sn9G0rTLwIhN6GvIgXhiTgy2jLDtN1sqjZykCE
         tvm4siESL7JHRqXpup2xrmJH6hWne//HxjrRxax4xB4EGet8+sKPKi1YXCcsnSgdEevW
         YSjAmgpEtJMyLKbYdUnObDdOshdHuJHOE3tjh5krwjLD8Exw823Zm2WGjfm0YzEevNyQ
         KKKI/OJEHXBNf3+bqdxgzlDXp+p9J+/Wc5z0EL6I80fz5t8VpM63sTI0yLDzVLLX4Fqa
         445Q==
X-Forwarded-Encrypted: i=1; AKwUvBxasVn11qGVqeT0I8+TAvlQa/MfEejDQprmGEYtDhnsJ+uObbERZ9ndEJACfY/LGNcD57DxdCi2RPsxTLQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kJ3Fg41XWBsflkpE2StW7aBTPJeEEvnd1DhPZUcqv/X+5Fzc/P
	zS3/2mXnGQPorygsWnFmuIhyVXWlGFFUhMgla8GmLhcvVYl8fsvSjOeakO08bMDPKYfVD8Q4yce
	Z09EgN7eOpBPySu6JZBBUZ905LzJudYM=
X-Gm-Gg: AYBFou2Emns9XVkTVa2mIh2Dg92Sm7p5V3uNOphQP7qC4rYRiIsXUPaQ5nKqsjtg0Hy
	9mWN7QAHn4zZskaC/iSKnRU5dBO6hjY2eXYhgrjl4p0LqciRt6bJpThXexXuKnmmat4JIGI6ESt
	VkqzNwMrYNPv1aZZ9lM0HxzKHv5Z7P/P8oODkvwvvqjPTUvSXfhBXN6XQeCqXfPcnWPEERcziFS
	rSVTDO14nabwRiJf9LqezHGHW97GK/Ef22TVfM7APqVJ2wPQKJpMqq7Bno/Z3LaACtEoIQrp3F5
	EmYIVP10rwGaUdDVb3gntEph3qVDrW62KyU6g11p0Mx2/EVCKXVfLqc+JsSr3dxB3n1/VDw3zoC
	B
X-Received: by 2002:a05:651c:15c5:10b0:3a6:32a5:efb0 with SMTP id
 38308e7fff4ca-3a63c427924mr207641fa.28.1790191150200; Wed, 23 Sep 2026
 12:19:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922193653.16086-1-vladan.kalaba@gmail.com> <f6fc1427-f771-4709-8153-f9814254a50d@sezginduran.net>
In-Reply-To: <f6fc1427-f771-4709-8153-f9814254a50d@sezginduran.net>
From: Vladan Kalaba <vladan.kalaba@gmail.com>
Date: Wed, 23 Sep 2026 22:18:58 +0300
X-Gm-Features: AclHuK8cg8iU0N6lQ8j6fa9jUz41AkITQWJyDQNLWNfRC_PbGhUmbmDrR6aOYiU
Message-ID: <CAMfJq187r9dLgwnncT1zmCmwYYFiY0kNg102=L4wmfzuw=12gg@mail.gmail.com>
Subject: Re: [PATCH] staging: sm750fb: fix const pointer declaration in sm750.c
To: Ahmet Sezgin Duran <ahmet@sezginduran.net>
Cc: gregkh@linuxfoundation.org, sudipm.mukherjee@gmail.com, 
	teddy.wang@siliconmotion.com, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 10:28=E2=80=AFAM Ahmet Sezgin Duran
<ahmet@sezginduran.net> wrote:
>
> On 9/22/26 10:36 PM, Vladan Kalaba wrote:
> > Fix static const char * declaration for g_fbmode[] to static const
> > char * const as reported by checkpatch to cohere to Linux kernel
> > coding standards.
> >
> > Signed-off-by: Vladan Kalaba <vladan.kalaba@gmail.com>
> > ---
> >   drivers/staging/sm750fb/sm750.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/=
sm750.c
> > index 1ea3dd8b8f28..79d0221cdeae 100644
> > --- a/drivers/staging/sm750fb/sm750.c
> > +++ b/drivers/staging/sm750fb/sm750.c
> > @@ -12,7 +12,7 @@
> >   static int g_hwcursor =3D 1;
> >   static int g_noaccel __ro_after_init;
> >   static int g_nomtrr __ro_after_init;
> > -static const char *g_fbmode[] =3D {NULL, NULL};
> > +static const char * const g_fbmode[] =3D {NULL, NULL};
> >   static const char * const g_def_fbmode =3D "1024x768-32@60";
> >   static char *g_settings;
> >   static int g_dualview __ro_after_init;
>
> Did you compile this patch? While SM750 module is enabled?
>
> Regards,
> Ahmet Sezgin Duran
Hi Ahmet,
My make defconfig didn't compile in SM750, my bad sorry.
Will double check that in the future.

Sincerely,
Vladan
