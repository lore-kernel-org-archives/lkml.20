Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26892C1586
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 01:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789175492; cv=pass; b=GxY9d8yRYwM2P/6HfFnNVA2orHpa6fb5s2AeKv7beRjpz0hTpsj3qiuM0nPm8yFtnmRSHkVF9GSEjx30sUeaaUr/fPNx3LJ+4W+cGfnMkjjFxzsLH16BX4t7cSc0ZAEnShpMfkcddW0vii24VwCgeCygmhj/yaTNJqRHzPLkhgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789175492; c=relaxed/simple;
	bh=ivHv98UdkMx1tNUXp0u1i9tvsMHfppuazLYuOELJamk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EPKOVOTVREb2TLmdY1bjw0FhjFcdzro28h02OIYE479lMNrami35SiV2uEx0/dT/EEcJE//TGltDfOHh0J3mfWU1l9yDEoRYInZZ+DJt3muHDb/H8OBFewEinqaIhcJYzDvE6YEaQ/ph4ipZu49ovpfi6W0Gvrb69TBHo9+UU20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wg2/OpXT; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wg2/OpXT"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4ab2029eso328934d50.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:11:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789175489; cv=none;
        d=google.com; s=arc-20260327;
        b=s8H39Cwg3whCbOkUrYGX0ob8C9bRpQgaWvaKO2lBXmiEKE78OvE8Y+NiqT7KiYvDDL
         xl9Jd2nJ5H6+KSYIkFSuRtvLfSr4SYY8c9nnEYY/s/ix3JVWAXWxyKTZcf6azx2Qyf9P
         YWSMUgweOYOa5yvkaWAylYb/ofEMdWdjYKHmGlYHYmgz5/xLlc3yfhyM8YJN9UlZByt8
         7pRrivdb4Qku4+3nZtgHliFP0iXAkM5nO457NN8vITvfomzX3Ai2SkFLggrOSJnV/rLa
         DlsS4jfg+iHh/h5onOqcVdgvXemm4jue8W5ez4R8wt73QhXtIGlpWiGuCE1F76YpCHzF
         QDBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=22PTpkoIp5WvdbaY/vm5LSTUvfhXc2qCbslNQIxRLso=;
        fh=znPoVlN8nM0GcufCjQqHvila1bavgTPruewUlK8wf9Y=;
        b=U2oY3DVM8e+BMdypUTVOkJXZO+u0ND7KVElEk9EmcAFlDGknBhTwd/L7/eLUKmIxr6
         821RNC3Yc7AKvNNvLZJznO4G2016nK8hhGd2rDHs+ltp3UW8WQBuUmTNH9Hl3mQLA4J1
         4ssrBiWQiWuFcr6YasG/JQgTv/zz9KYAuikIZ9/GE9Y6xwDiLQWxxnUyNq+sC906uDKa
         UWo6n4Z23PZ9X+TzF7afjjzyrsWwZL3osJu05ecdinoc1euZiEWN1N/YzNFPVXwwhYgo
         uhWNK5oXcjRx0Xp3n0cefD1/MCjL7aJr8PRvZSjEcnrjDKjrYysNfF0vBQKgi4kKxHtA
         4+Pw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789175489; x=1789780289; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=22PTpkoIp5WvdbaY/vm5LSTUvfhXc2qCbslNQIxRLso=;
        b=Wg2/OpXTRM4qryEpCwQJ7czKFMnVXTi+Kpk1usvstc5eq246IdkgXjPn6exTBLhplz
         oCScouXGxuBoTUe3Q70e+qE7QRwNqRFzJKoOP8bSuCN4jE4gllmGchv/zVmJV2oA9KCS
         oRKCzGH+aLhOGPqrlzDJPLSUNEvnUYGStjXEh2agrtkUdBH/G8JUrqUKUn5GSUVEt0v4
         txdQ5mq8QxBU41wYESKn4OejHX+ckjHp8yVfZGuz5ebR3OLvT0uD0crEHGtS/8EMASLE
         dFrHpQhaB3pU6UFTi2IQFwVE8Wmek4iWrBVuj1R/Bg5EwJbWTGPtJ1c+TazPuQDOSnmf
         SzGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789175489; x=1789780289;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=22PTpkoIp5WvdbaY/vm5LSTUvfhXc2qCbslNQIxRLso=;
        b=cX7+/7IqZgsFPx93dIQeowi89dhLU8oP3Ujld6RDsKZoMvNGCSOFdGGIEQ/OWD/2Mg
         oIgXjevwlE5e+UJlG+VMQCNsvfrtZJplIavxBMPhbxrUXURWqxkIEzARIEFkrJr7mdko
         WjW6sgdLovyuo96dSJG9EnbQrWGsuRgHWcjrzq/sDZULJyEjaWvboZLzQq8oC/x6/xP+
         i6OQSHtmwIzIi59LDh/mQsDBJCWZqofzS35nLR8llYQPl4n3RctrBlhbS2wvJAgICkSC
         MXr0+/L19Aw/Kba3nSFpntFGiFaM3TClLRHEcPau466ED2ZRUvdfHpmshhcSFsCjPkaJ
         7t3w==
X-Forwarded-Encrypted: i=1; AKwUvBxWd8QCqBq6fozWk3jcmUqpjzaRI1Nd+dQ/KS0aOIcfzDopR3K7dO6ir+cIYm2zQKNDvN/wPBuD2P/AwYA=@vger.kernel.org
X-Gm-Message-State: AFuF++lR4Y2A8YPObF9zevScioyiAK0fd2Rr0Wuhgc71onmuhWSX1AMo
	KC9dzyj3DF7s3yyOQsvIrNtIaKs8npWsbAj1PB8/8/VdyDzCOQEcBtpsZiTzajJJ2NFqZjI3kkl
	M44TxNaW4Mbc3x+wFtVsEHN5yODvXlxk=
X-Gm-Gg: AYBFou2rn1AN1RewFa81fXbZ8RhWIuQh7PcFrQpY8A6kfT6SLcuH0ecGXzXFIHS4Ggc
	G5couISUFBp/qz/klXP2IabsxG0BDXBPK191oE/JVR07YJSCM8lnij2CNyZ+CJZ6W1Kz1jlTcYC
	/px0osgkqpIWUd2Qdoiv2+1B6XowI10fK+k0YMbVlAXfq4OO9XRD7fu5E8RHTkk9B59tfNI29tr
	+m9puCiHVGS/l3m53v+fV9yZIVYuYL3hn8NxZtFeaw/I70G32F4VX/Y5WWTi/J6YYwU/TwOE+68
	lJ0q4C9mIpK/PdSLDSxCkWMmdaen5+C3V1u7JDMNTvtn1OI6vsZsCX6d/Rq89lh4UTefW+Ev2JV
	2lffEDPcSLLRWeD6+203uyxmJ8XEBphCviHISIQ2v/zFu1Q==
X-Received: by 2002:a05:690e:c41:b0:671:2a94:b4ae with SMTP id
 956f58d0204a3-6712a94b628mr1658998d50.36.1789175488898; Fri, 11 Sep 2026
 18:11:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821114854.12218-1-kartikey406@gmail.com>
In-Reply-To: <20260821114854.12218-1-kartikey406@gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Sat, 12 Sep 2026 06:41:17 +0530
X-Gm-Features: AcwNN1V3fWj5K6wqF8if7WrltpimdvvzgHCiuYvtPlf4pmG6r8o8plNVskWxjLw
Message-ID: <CADhLXY4TxUf0yTxjCJqBV0s=tpU_JaCFEduLznjS7jm4RZ_oWQ@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: u_audio: reject srate request for
 unconfigured direction
To: gregkh@linuxfoundation.org
Cc: kees@kernel.org, pavel.hofman@ivitera.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+e1d0e66badecc32d45eb@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2026 at 5:19=E2=80=AFPM Deepanshu Kartikey
<kartikey406@gmail.com> wrote:
>
> u_audio_get_playback_srate() unconditionally locks and reads
> uac->p_prm.lock/srate, but g_audio_setup() only initializes
> p_prm.lock when p_chmask is set. On a UAC2 instance configured
> without a playback direction, this results in acquiring a
> never spin_lock_init()'d lock when a GET_CUR sample rate
> request targets playback, triggering a lockdep "trying to
> register non-static key" warning.
>
> Reject the request with -EOPNOTSUPP when p_chmask is not set,
> before touching prm->lock.
>
> Fixes: eb3a1ce6f5ed ("usb: gadget: u_audio: Add capture/playback srate ge=
tter")
> Reported-by: syzbot+e1d0e66badecc32d45eb@syzkaller.appspotmail.com
> Closes: http://syzkaller.appspot.com/bug?extid=3De1d0e66badecc32d45eb
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---
>  drivers/usb/gadget/function/u_audio.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/f=
unction/u_audio.c
> index e53f2927b539..ff811ea1e25a 100644
> --- a/drivers/usb/gadget/function/u_audio.c
> +++ b/drivers/usb/gadget/function/u_audio.c
> @@ -575,6 +575,9 @@ int u_audio_get_playback_srate(struct g_audio *audio_=
dev, u32 *val)
>         struct uac_rtd_params *prm;
>         unsigned long flags;
>
> +       if (!audio_dev->params.p_chmask)
> +               return -EOPNOTSUPP;
> +
>         prm =3D &uac->p_prm;
>         spin_lock_irqsave(&prm->lock, flags);
>         *val =3D prm->srate;
> --
> 2.43.0
>

Gentle Reminder. Please let me know the status of this patch

Thanks

Deepanshu
