Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5ED83806AB
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790134296; cv=pass; b=tZpaffNXYhas62TihArFlOyvaWDnAx7wh8fAk06pgC2fPxQF8MnqbAuqOWZapiHvqctD8B8H1C3jVkgmmHftPYtjQs6+ypwjJ7qhTMBshUSWhyycNCS3pJEKOaNShB0pwZ1gdZhrMbYZIXBDXiOlj0/DqboRqvZYF6QrA+FLSgY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790134296; c=relaxed/simple;
	bh=kLqjJwxQBMRaJcZV6HUdDnhO8moqJR/ZPOOSCIQmbMo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ADmInkqC45KsF1iDv32/dOhSBH+amcAFT5zvQEuUUajpxsMSEFFRFIkCAIsYaRk7kAphHtLc35oCTjbh7T2Hcsm5tFWJWmFnI67re6vnPmKhCbsg6AyV4US4VtKzoY0GFx4Tb8XRM4YTnKLuiRDREj8wQjyml1dhboIetLL2NrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hjuoPCPr; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hjuoPCPr"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4ab20f4bso562981d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:31:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790134294; cv=none;
        d=google.com; s=arc-20260327;
        b=YhX86zZEUdIXda6gFm4j4kSWNJ1WrDgKVM/NXaYQ/AGEPIy09k36Ch/8tdI8l00sLy
         NAwsBSLbdiosaC5DCh9GIpmgxfZ0BOiDkyiSdyAbRTMj0camaUOpDuR/ihvZo518yOGa
         pt6sDHhvcj0fw2+NED7pEEg/hKWR+5QJP/tS+4qEyRDo7QBv5RLS7JGAt2jTzRANMdVV
         w7dG3gWXMxb9L0O4lNQn+4A3/BU6lnvhmQlLiCnmQdPIZvjLj1wlNsTeBQoc6xSkMgZP
         oNNFrRuvpwtFIl2htqFw4+cOQB3ILSpXvSKMuv5eyJ+b4yMgG6Yg22IfN/KAsNdbK6bi
         UtQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GGwyAjv+0/JlwYUUu6lXLzy7ZN4zWkdGhNND/q2LGC0=;
        fh=uaZSWQykJSDsZJcv0NjqOi2kNmNLoiUAphT+lH8gfh4=;
        b=lNkRpk11jMb35XA7uRnnjVnwHqdNdzos2XCq04+uL5V/qjdqPuEJABX9EMmrWztMiQ
         eJBhQsLxxJniQ1nyRCOiRi8hmSlhqe3Sd8AEazwPVUdqJMR11kLTCjl0Xwe9WXKqf5hs
         SBm+ULYegDE90Sgmd3yGFNsTWM9faRol2e7Mvg6cyqUYXaCg6+HrbYo0l0GLuwpi9hcD
         uSzlPWe27m6b07gt3fpptv+hOZjlrMUhAVht+BGY/U/8hOAlgidZQMDjsV7x8jfHk5Md
         PNmvzQbFlNxSpLxg/GQYLm6cAKipDZZM7St2d798y5XCabii4Dt1KdWtJVGcmG+/JHGV
         YXXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790134294; x=1790739094; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GGwyAjv+0/JlwYUUu6lXLzy7ZN4zWkdGhNND/q2LGC0=;
        b=hjuoPCPr9P7SEA4vAkI9s1Vn3z5GmNr44tNL1ClBWIpgHP+P3fSMKH/AdbjTWGTGpd
         5q8pk+ZFUhxrMutik5xhzeHpE2ZszNks1yBVxNZEJmMcdGe/+zw8f17qK8NL+Cvb5vIs
         iaylpIznygFeVG9kF1fh1yFovLJJAWXcAWMJqy864w3B+IoM+ihUmV2Zi7QqjacdDjmY
         Bvg25d2Veb33I1X50OKiAA1tyyIgBXnwYX69v8iHm4uCUdQRZ/RP0KtkvzNImFgaCGCS
         vA7opxCrCy9QYd9u04DO7iw+Pb6a0RDCFvVugvILB91TzKzhv8okBWLeDgnjsa46G6lf
         2TEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790134294; x=1790739094;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GGwyAjv+0/JlwYUUu6lXLzy7ZN4zWkdGhNND/q2LGC0=;
        b=ajipVP2MQNST+3X1qoZCQofHLki0VyJJgOGL7LXVoT6AdnN7vpQTP7/H3g4vQzi77f
         FkCdhIB/YpR8lEpZgfTZeQbQNA451DAA395a6hRKdDcXNl+bXrTawLmozbURE84OeTzD
         7mqm3bkSqM806fqxPIEoRwA17fQ2x6B7WNaFW6mDW6R5HnbN2jEniMY0CsUsf2h98NL9
         XKbO9ijZl2SENLtIHg4wjRxCVuMYOqWeME3Z2hjqqkAO4HDiSV4cSyYHy0gOanFEWelE
         lpS8hrjhDcuD8izFBjIFnGdaDj1AEFIbdtsm2mv/SmedvskMeLJdNT7A7eqMKLPTNJyR
         +waQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0ErMwE/sNktPkvF1xIu6idmKANyoAvwRW82SnDr0+eQTZ86DtGUTUJ6aHbV8lSgy1NCmTjQvRB+I7Pag=@vger.kernel.org
X-Gm-Message-State: AFuF++l5KCXSM1AgbWz0OA8LDW4ejLMTS/bguB7fwqB5nndePhnon892
	dgF+axBo0Jd3bLcV68S4390Rrw899Pw/p62p0gQ4ff/mmMXlKgXZMuMh+ZxEX3ePlSnnqczzVwC
	NmOooC5UC1qcwf3TswQL04SL5ycZrgIE=
X-Gm-Gg: AYBFou0OolVxZAWQD7EDATxptqopI0W6ewaBOCWLgEvLVziBwypj+9N0M9wSPggMzwE
	TQTCuIT2ANCRdmDHRcnhaAfazCsEF+BNFcUKknuSDOU2Hexq/RAxE+gIBjS/3Heq/2+92dibZha
	BKFsXO1Gsobk2EHi1d7hke2L29y55UI54gKGoEpdbv+Kcd/cLNl9ioD4kd55acrFia9fa7zZSl4
	E7YHEIZjFxKcKL5eVwrR2WEwLEMd6QJ7jSIks++f5cX8y+jqKz/TsIFMrXxzCcUJLeittyYQlEM
	Yd1YdNAQ77OlQP/5sLhiHAOGJzRI4F0l96K7Kgo98cgu0H6P1zr5qdz9D1tuzyRJ5oPRPTe1WAz
	yR+CPwn11eCkncndF8Ceq8fyALP5C+otrruMH/ZgOr/Y=
X-Received: by 2002:a53:b089:0:b0:671:499a:26fd with SMTP id
 956f58d0204a3-672d577b164mr476926d50.43.1790134293543; Tue, 22 Sep 2026
 20:31:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821114854.12218-1-kartikey406@gmail.com>
In-Reply-To: <20260821114854.12218-1-kartikey406@gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Wed, 23 Sep 2026 09:01:22 +0530
X-Gm-Features: AcwNN1V6mUe9WdT8j-R4ug1gRy07h_eAxdnOll35Iy1koOgQkSFlHP8sS39EPFU
Message-ID: <CADhLXY7fD6jo+xzPPLTh28n9Rw-yhhKYb6ymcyT8iMUjri_GsQ@mail.gmail.com>
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

Gentle Reminder. Please let me know the status of this patch.

Thanks

Deepanshu
