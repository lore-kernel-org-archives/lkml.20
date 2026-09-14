Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5253D5C05
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789383492; cv=pass; b=ACqv0PhLqhdVR3+LDCmgETh7YwKZkd+X6v4WliYDdPda2fA3Mj6M1tQ+MZjiQxc/I8kKQpy5lOA6lzkQroRV0FtY39WEmsYwf8zUYZSsBldTbhoaZQpCQOuBuVTTgMVqw/bPqi4X6KqUuYpV+QMnqmRArfiGRBkFnHkjgdq5lSw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789383492; c=relaxed/simple;
	bh=ctSjyms5FYhlDQXWXqeD511TmiPd3o+lZbaQdu4ST1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=laVLmnIniy77ovfOYgVi6aJp7tr6O40YYF0lQLo9BFBdQzweL1HTWMuygncFsIjpdYrhKxRf0jolGbm9SPZ0+u6v37q/i3Q+K9MGVdUB+1QOCPD4LYm/NgUDujBeDxW9qTgXhOlYa3EkFMMeWBbhxvK2Gaexvf2CpjHQi2MIgCA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g6XGIwmI; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g6XGIwmI"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a601ba6870so5793817a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:58:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789383487; cv=none;
        d=google.com; s=arc-20260327;
        b=WPrn4bCDjRuqhq6vOOINRikiUC6gtwmz9QRN2CQPTKne/24AqpcwPsHtHZfg6WGv3w
         SSN0mWD0lp1ufJ+WM2QA4M7YStppsavjHKe9VbkHiE3O0vlnK96kxFElsJPVUKmJW36Q
         eWUv096I9Dwo3lQag2UIMZleG3KEcULpzyQpmlGf+nC+potRU2NtLkPvO0laCpdryhas
         GpYTj85qR2Y7X77RYEksdmdb6fMQeIPsjWIqNbaSnTd1n02yNkc8LvEdQwUftZdr6cPL
         5MbwsSJ/Le+pIFlIQELx1SBSAUWFeiaj/Y/Y5zzGchdyhJE61z+FiYUxWyR0UYe+jNUO
         drsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7HbvJ559effrX1oZMhom9NMAuGQzZm3TFV5OOXNcnto=;
        fh=tX+M+sXhRgpng83jVv1XeAXk95YYhqNBz+ryv9Y6wSc=;
        b=Rdkv/IQvljX4JVy/2bAaZQL1RYHCa3um3GjvHye55Mq5swNAJsD29K5YksF/ar5yq4
         vcPqBqYNHdphVIMahKrdJNB6mgXuArajgH7E/slPBX+PlRI2+YfH8YLgid/vv+CeXWpW
         Z65C06/PEXikL9xlhvfc9pqlWSXJLRl3ntCmSWSXmaRwbeBzmgIfknePGgUWVz+jypVq
         vyDwPqBM1fvO24a01JiFyOlgHft7vpB6eK8ccSLQsOHJIS12YNlm/dnmDt077BrxcBk6
         F1TvgYDFTiFstj4OOohXcT02WaH8nvDSILRtArfGi3sgReRIhTm3lwrsmPNDcrHTe3Bb
         ykaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789383487; x=1789988287; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7HbvJ559effrX1oZMhom9NMAuGQzZm3TFV5OOXNcnto=;
        b=g6XGIwmInuRHYFgQAFjZ3yyLFhL9/psdEalBkpeWveTZoV5ttaa+4AnUld4kx6VCwN
         eOlj5FNb/zfxxlNiOALabUK+t+jNsJ2DMKnOrnhx/7Co0aOyK4TKaYk/s4022/o4yY+v
         3gHP/HO2ovlTwUDBlgATdwsYQwyjQirlQS+zxKh88dlYyKlbHlgnVg2+SIe2lHLEQ/fx
         FVcqn5ClfCAaiExtG3z73JosuEr2JDDu+KlFv3stC3Gl39uR1PUHgwmFQ3ZyC7yfFCKL
         i5BJCPPMOqPaiioUaFOaILC98H49zuxttAiL3H7DheHbRDO9ZpHUUK+n2OfWPiFB5lHK
         PaSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789383487; x=1789988287;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7HbvJ559effrX1oZMhom9NMAuGQzZm3TFV5OOXNcnto=;
        b=BTNfTLzROTFS7BGQMNcuI0lriUn8KLm1gCnt0SwUcpPAJ0UNZo9WOGSkO789R1hHVd
         99FZyV2uXt9gV4sY7b8zGSPNHYM6g5PQETx01LmH9iVZF/v4+c8yUIZPbTjgmqMlckdx
         muC5R/gMQiflhyN3G0xDRIPB/8SrLjVZ1IuDxBOJl1F9/Rxb4hvF+p7L96zjlLyaJbfX
         HNoFhmHglauVK286gNe7qYnPE0FsGuzSJUaQ9cDa+Q7MgIOHHYRLlc2K4vURBsKUhNPk
         UE/rIsYf28e2pGMq0CcokkEHe4qBfBlM+tGNJmiIi9/MfeUcw37C+HtwJ4Z57IaBMUzm
         H4KQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/PSgOpww0tBUDlNKkvtImLOrVO2OEPZMIL1QsL0HFPKKmMQz2SiMzeVo6sauZ/uv8EHL9wVBK3VoQzdY=@vger.kernel.org
X-Gm-Message-State: AFuF++mVUeieh04aT9dld+UgZXP6VNaeFCGoXs4PTGYHkicCD79TsMRb
	cxFQNKrotNvGdNG6bChjI/YN5E98xlERw+I2U9NBu1PszPSmkeiu+gt2Kd0uz/3fPIOe7uMPjB5
	mSDa9hyw07A3BIqXggMsRMji1e8vZ9bU=
X-Gm-Gg: AYBFou0+b16CH0hpvNfOLIRbiOkDA3Y8PAzYlxt9+2b7KFPXq6KbPyF00NCgaBNXUZC
	FHS94hJiuYlEwTqDOwiMveadnUL2hmco9aUGZlSH4oSvqFclDulOsewNurXXVPLLPhJEUjBAEDH
	aAkj8wwEbqDPtDi9LgY4t8dnCq+fThz6hTFHB4FIUgrmzyJUg43SEha7XH8FoWgIcMRU3ATrY0K
	zcSDLAluL2bybZB8ZQVmv4N8N3cX7SLvgR1llvc/AWLST1GjOW/plJQDQHZjnrLwh69H58iWRYT
	FuB7sbO207QlrCgFKQjkt/WU4IM+2eJINl6Gq+b7ziD74wPqyebcFMQjXAy0V9lblcPGuUkoWpI
	PAlldT3ZuYfjtbd8BnkALaZ8IML8QCoTuy5gSpNwXUOKB/0lEn7eaL6Hu2LPSdEc9aYFaQ3ZD0D
	w+L1DcXmQK7BPs0uiauA3pCBEQz4b3YJc0C/5ieT5Y2wwyrZWk0/w=
X-Received: by 2002:a17:907:980c:b0:c29:45ad:7af7 with SMTP id
 a640c23a62f3a-c29b86ee829mr131881566b.30.1789383486731; Mon, 14 Sep 2026
 03:58:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914090858.9939-2-manuelebnerli@mailbox.org>
In-Reply-To: <20260914090858.9939-2-manuelebnerli@mailbox.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 14 Sep 2026 13:57:30 +0300
X-Gm-Features: AcwNN1UCS4c0mLENuPHDYDtqcMcsoOZID1y92p_Z79HcLzYNNZxrCUfwyzX99MA
Message-ID: <CAHp75VfApqZk6jz0TzQpm8H7qE08uqpJ44_dWdGLOcq8r+y-xQ@mail.gmail.com>
Subject: Re: [PATCH] staging: fbtft: replace number with sizeof()
To: Manuel Ebner <manuelebnerli@mailbox.org>
Cc: Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 12:09=E2=80=AFPM Manuel Ebner <manuelebnerli@mailbo=
x.org> wrote:
>
> Replace integer number with sizeof with the goal of prevent future trunca=
tion bugs.

preventing

>
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>

So far I see only a single patch, what are the "future truncation
bugs" you are talking about?

...

>  static unsigned int read_devicecode(struct fbtft_par *par)
>  {
> -       u8 rxbuf[8] =3D {0, };
> +       u8 rxbuf[sizeof(u64)] =3D {0, };

This is an unclear change. Where did u64 come from? Why do we even
need a 8-byte buffer when we only do 4-byte operations?

>         write_reg(par, 0x0000);
>         par->fbtftops.read(par, rxbuf, 4);

Perhaps you need to read a datasheet for this panel and come up with a
better understanding?

--=20
With Best Regards,
Andy Shevchenko
