Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5CE44604E
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791790208; cv=pass; b=pWBUVstdxICcRRDfaRX4NFAfcLKZVNJYq7Vg/tYXmbfBbs7n23TCAwM3RQuI492viAdstOjIOPLuowrFW84ukE5Tx/XkMPGamGHatxo9szcDMEHl/0yk+Vyauq0kiYhCiVIo1hkAgdmYrGEJJfJopo3qQJJ6XH7NwlLCCAEn9B4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791790208; c=relaxed/simple;
	bh=N6mLuR1l27zY1n/Bm/FmrQ2JEZPbTzgF8ffkDQm+M54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d3bIeovXCjS/VIsJkDRzSAREQQWeHrJQyKpIas3+1vYNI13a1U8L8tVNaPGp9dtdn2kX+Bbse7FvAJzOG2ggjt3HSlN+n8jV4vNMZgbP+Lr7I2eGY+r7TCash/9CkeUJeaFV63KTeuLNtagOL+hik2KM+aL30PnyM/gM+/d/DkQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=I6iiuQIm; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="I6iiuQIm"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8ac8a2ac52bso13852857b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 00:30:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791790204; cv=none;
        d=google.com; s=arc-20260327;
        b=sOk7A9DevojS+hLS7sAxez9RcQEW4dOGYQhoXp01mmYu0VT1MtHjSsatZR8yN4yivf
         kMTHtbrpIyq3tdzwEgSs7n21EQuDlSHdvAcyKeT0ltL2mFOwV8XaY6f2MNLaMSEXZo8I
         NxqmrBJTtVY/FyjPbI+D3iiO+jG+1Ih+9cz6Pv8huz/lvrDMKcEjChAwe0y1r09fhW6q
         rCK+u8EPJTKhxF3ZikCo9FKYIOxezPoPx0rpSvRTX+NLZqn70EahE3fuMOk61jWcJNbk
         FVTS1A9ed8oJdqigbcAlsxTQ43JdfPrfVtpAT8u7rXqGHn5oBj4joZNptT/PhxnSJ/do
         YL5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5en7PJpQu8TaJH/MT1mHWBu9lJiWdALawyT5kwxTE6Q=;
        fh=aCPq7lh8XC3fIsRxhDWI+9Uid1Z+NDcwX29OpVXVpz4=;
        b=nkdq29OjqkXRzWj3VVegqIBAJoEmdphb8GIdWshu5y+psWq0zMZFzyQ9pLzIjnDN+O
         AMdlbtwuIxuoWIxWh8MEBRr9aIS6yT33MTguTirHwRUcpjK6tJSSfgKxA5OPxfFt9Q+g
         u4I0jU14VJMEue7nBxlzQjTfNr8fuVM5IN/vr00QPKORfKm5M9vGysuDDBA4ZNMxMmsR
         IUL6+mbjv/GnnuczmCsi2Oln5fSHHOHFFLd0wq/o2CmZIpz2sNjAXajCrpStHJf0cqlK
         CORSUKI834+qTHcFJ5r3m87BlzcfW+gGvSigqt+nc3U647EjgGa/hbvgL5A8ZuaCKe4e
         bv1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1791790204; x=1792395004; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5en7PJpQu8TaJH/MT1mHWBu9lJiWdALawyT5kwxTE6Q=;
        b=I6iiuQImYthm2MBcQVoFraDTG0BkWaBAf+nryhe1HY3yF3dgIPOSkNDXJx5Fca5Lau
         lHf6NTuDicLVFf09uCwXWFypVVwURvDGrTx/6PGnrWXRDoF/MMUBZ5Xj4qja7M+TQwd8
         kX12tWnzFGvfjDYAQw+1OuZzxdj9BcyCuLxzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791790204; x=1792395004;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5en7PJpQu8TaJH/MT1mHWBu9lJiWdALawyT5kwxTE6Q=;
        b=Tt7DkV/MpCv5uF8UW+7/gts5HzZS+BTfri6C9eUmh8VIIyXjDggNdn6PsHsOYnSFvg
         lrACo2cHnxvbe1Z5BzCeeuJMeXh5qfW0p/f3dxQByHwLBz2uVPyDtCRFse01ozJ7I+gc
         ZMNhTdErGKrGRBjxbCcIDFuRI9JaKx6GvU1HWC+YmIzqeUyuw5zZLymRuZuwKHt8VtBq
         z3JpdUxdCWuJDAHQ4PkenyjFWI0Y+KY5tYolIU5ogY9xxUO44MDQvaild6+0b6OVkJ3o
         wdXdBlU+H0BnTXUKqiZgoOLlGBH2qRATU+n6MVCVYeOSQt7KazMyJ08ZYGKd6yDyAd+F
         BkHg==
X-Forwarded-Encrypted: i=1; AKwUvBzV9qJcw1oV+2yFklkQbBdYLKw8wOzN9ODqR71iFpRPpYd5vWFjbR4D1fzxIL2tzgLQw5LvpZ6OCQw+utk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKeHpZ3XvUF6RLMGXBSgr8wMqZ6B2Xy+r5Wyc4P5qRJNGA6aTvD
	+3uZnIKYG+3nwKrEFHst+m5JHZNn/FdRa8TXMt+MVMmSFlT+6mfOgsN5T0v2cHmJSmCzs17CG91
	eviX/LLzW3smXNQbyKgtq6N0+8LLdzE+ADiNyFT3n2w==
X-Gm-Gg: AYBFou1Xi+TGmK10KK4Vd2Q1RfEjqE4gFgQ2UON7UgZmEcr1+QVA77gvUNnKlrS4Y9a
	WfY0FP9Kj6jIk4lGnaCvdFyfZUCunENS+alZFlMpTNEQddvmfSykP4ZVCJ4qB0d4onpuF/yvjdW
	reZzArTZHK5yndC7ZMv0DxdbihyTUkMoColmeayYUFPWrua1a6YsO7DBR9xxZUxrSZmLmlL6aXK
	X4YpXQxHbq2jHQ9E7lXe+60Sh3j/KP6UnXrDqsbLptHIb6REYXFlqwS4P6d2qvJoOzKIwLxidOS
	cbu35/ixMKZEmSGzbCemDao3UMOn7kf5CmSozeQnG0ounKylsIQx2UIF
X-Received: by 2002:a05:690c:6d03:b0:8ae:68d9:cef4 with SMTP id
 00721157ae682-8b07d46649emr26351717b3.28.1791790203639; Mon, 12 Oct 2026
 00:30:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007052914.888956-1-daniel@thingy.jp> <20261007052914.888956-2-daniel@thingy.jp>
 <20261008085923.4f141f4a@pumpkin>
In-Reply-To: <20261008085923.4f141f4a@pumpkin>
From: Daniel Palmer <daniel@thingy.jp>
Date: Mon, 12 Oct 2026 16:29:50 +0900
X-Gm-Features: AclHuK_eqKOVj5TMpxlQQs14ujaGtt9tV1joQpam6AG0BfFnaDVQ_SuiLvCZ_h8
Message-ID: <CAFr9PXkn1u=Ou9_jGfvZMixfiuTJ7vXuq3x+O-wmNuvWDa8FNg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] tools/nolibc: Add dirfd()
To: David Laight <david.laight.linux@gmail.com>
Cc: w@1wt.eu, linux@weissschuh.net, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Thu, 8 Oct 2026 at 16:59, David Laight <david.laight.linux@gmail.com> wrote:
> > +/* Internal dirfd() that does not set errno */
> > +static __attribute__((unused))
> > +int __nolibc_dirfd(DIR *dirp)
> > +{
> > +     intptr_t i = (intptr_t)dirp;
> > +
> > +     if (i >= 0)
> > +             return -1;
> > +
> > +     return ~i;
>
> Might be better to use a different name for the variable.
> The two return statements look the same at a first glance.

yeah, I didn't notice it until you brought it up but 1 and i is
confusing. I guess I'll change i to fd.

Cheers,

Daniel
