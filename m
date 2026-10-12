Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0237C4AB1B3
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820364; cv=none; b=N8wkLNSQXdxPAtiTfTqGvdtL8u3sjxHnxLxnVDbUKyuLGGKKbM6XT5Z7Z/SyxlsoiDaz7eqj+DR8q1jPZSSSE9Rl8DVYufVDKgzdTcIgXs7jlyj1H+ctpY8d6Q9w83CL2c9Xm8BqemH9sAMj86zzJJ1Qfn9428SoybCMLZ6U/QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820364; c=relaxed/simple;
	bh=xE2JB362It+KmbkVX14MVsk515VD8Prc1e4ZQqkz2jY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XVV//B3zsO0pUh84KPPcXg4tcWjJs35zDpTQ3NaFKVWkSL/kXaAYjdX6BP86eizzmWRdUciyFhPW2d1mYz18Cpn6A3ctXcg+VMu9+0fFjpkYKC8XEp6uAiMTUjjvOApQMGpE4aywEsC949oiFTai4C+ianUZ14/jZ8AhmjjHeGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=V165sRxq; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V165sRxq"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b1aa377c61so2085908a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791820361; x=1792425161; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gMm76zmK3ArrseSrDrnVi5kZ0suPc21HeqCjahf5xGU=;
        b=V165sRxqazaBg1RVIVxnP68mcObBUc/xSmH1skO/9xnBiHrEb788tNJUBaG5Gs0fDG
         6J032eLz9ioSOlihL/QNdpBpb7wrcZJ7kmDHSpBms4OZ308jqBDLLGaUU2O/57BdhhAi
         s0x98R/BCxjJGmyOOkYI3OAvK4HD08iBqqv8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791820361; x=1792425161;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gMm76zmK3ArrseSrDrnVi5kZ0suPc21HeqCjahf5xGU=;
        b=tXMRrSAtvxGE8Pij9BrpgzvgAZ/MhTHOGbjQfbQl3eHj/hY7aKUbBoJJjcT9cpabR1
         tZCCD8zUXaLchHYnoYa/ku1u1/LxF8g3Y3vkmeCYce3IgKuOUr+O0HEDBBEY4lnAhyZZ
         KhlpCyYI6L5O+CD1swNVpEEqIlvpcqTKmSzNR7/H9nFnohZ6LErDe4mhV6P37Ia6fLgm
         Z+5a3+/iIEQ1Q/NPCjaPgvRLlZSCx52iHyRjdXXyhdcQh3r7h7AkhHrHcz3wBJz2IWDL
         dxl5WB7Iy4SPb6DnMMMBygK5Dc5k/3bgkTL6t3RNPh24Z8b1NvLQ+ChEQSItMjcPVFQn
         yxoQ==
X-Forwarded-Encrypted: i=1; AKwUvBzENfT81i2v0L16EEPh7savFAP/YUEnOuTaCxP05txOAUJ7A+BIWEYIBSsmOnwPfP9GVa1/af+N3DGKpsU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKiyKjKcUKnCFJMrKVdOtpgJw98OCZvkbWJGbRnNQfp7yhDXxf8
	d+5oLbKE79/skcf4/vO4JY+oerPV9MCfqVYnSDcpMSCx7ybFezgTVJl3itX9vJ1XcAeMKIj35e5
	shyR8vw==
X-Gm-Gg: AYBFou3Ig0frLo90CVup6SPxrWamK8KOCrD/KAd0P0ve2GgCMpczJfZlSsAsm0YRSzK
	CNcfo4sMrxfxLUe6F+T6EgOE37SP62Zw46pIJO5qYR/garTCygjR+npXu+D5ubQ0qRrT3xxAn64
	Y2iHlciYwzOShVSdyvEp18PoIxK3XMMcfooshlD6N+OgS/gR5pNKV7hdaq0a8gv+d9sMTY8Girm
	q7VfVVjAhYyhipmWqaUXk4xPRZERVj/fjIb6DDfX03lJMBGaPcqSVeUMBvTY8K/Lmy2aOqb3A6E
	tybsS1kxEMxr1WmrCX9yDmsmYO4gHve9OG1xYdQvYET2uV0+FVY9Hjr6C1W3t79mvwxU8BzTIVr
	gWQnNProtKi8MaXxSHiYjTY5h4e6zDNZHWG1x1O2/R573S6EIr4qa5QMajyadkZKw13piWch7Fx
	bCVbhFrH4iivNupDlxkdYknsjIXkBRbLnAaorzK/lTR3tfqTv7HS/80FyOHwWVhbqMqn6Dg6Krq
	Z891AYR0y4tCEWuBHKmupUwsVK7ixaF2vBo+Q==
X-Received: by 2002:a05:6402:518d:b0:6af:f8c6:7859 with SMTP id 4fb4d7f45d1cf-6b17c28bef2mr8110745a12.41.1791820361129;
        Mon, 12 Oct 2026 08:52:41 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179e01101sm4993684a12.35.2026.10.12.08.52.37
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:52:40 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48c4207ac26so1985141f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:52:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz6ChLToirQG2UzSQ522lftw+Cw/DJIE1GgzBpvq95IEwFhIKI1XEMggJ1Ta4Bl6Pn4uODwEguv3oh7e5Q=@vger.kernel.org
X-Received: by 2002:a05:6000:60c:b0:48d:df08:307c with SMTP id
 ffacd0b85a97d-48ddf083082mr1731696f8f.44.1791820356342; Mon, 12 Oct 2026
 08:52:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714152138.7.I5cef580a62c86ba6c3465ad336fa509afbdf1476@changeid>
 <9099b92c-d456-4dbf-95c7-dcb3f1004066@web.de>
In-Reply-To: <9099b92c-d456-4dbf-95c7-dcb3f1004066@web.de>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 12 Oct 2026 08:52:24 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U=kLK=p2xmcjP8mENApKNvtyU2L8OvTW1-EZM5+TMk4w@mail.gmail.com>
X-Gm-Features: AclHuK8lwjKGleC0Qe7nH4WggNgPyU5z0A6glLw0RKkKSL75lGBBduv0_ttODd8
Message-ID: <CAD=FV=U=kLK=p2xmcjP8mENApKNvtyU2L8OvTW1-EZM5+TMk4w@mail.gmail.com>
Subject: Re: [PATCH 7/7] mailbox: goog-mba: Introduce the goog-mba mailbox driver
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Jassi Brar <jassisinghbrar@gmail.com>, LKML <linux-kernel@vger.kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Brian Norris <briannorris@chromium.org>, Joonwon Kang <joonwonkang@google.com>, 
	Lucas Wei <lucaswei@google.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Subhash Jadavani <sjadavani@google.com>, Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Oct 10, 2026 at 3:15=E2=80=AFAM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> =E2=80=A6
> > +++ b/drivers/mailbox/goog-mba.c
> > @@ -0,0 +1,567 @@
> =E2=80=A6
> > +static int goog_mba_send_data(struct mbox_chan *chan, void *msg)
> > +{
> =E2=80=A6
> > +             spin_lock_irqsave(&goog_mbox->lock, flags);
> > +             out_of_space =3D payload_words &&
> > +                            (goog_mbox->outstanding_msgs >=3D
> > +                             goog_mbox->msg_buffer_words / payload_wor=
ds);
> > +             spin_unlock_irqrestore(&goog_mbox->lock, flags);
> =E2=80=A6
>
> Under which circumstances would you become interested to apply a statemen=
t
> like =E2=80=9Cguard(spinlock_irqsave)(&goog_mbox->lock);=E2=80=9D?
> https://elixir.bootlin.com/linux/v7.3-rc6/source/include/linux/spinlock.h=
#L642-L645

Sure. Once everything is resolved and I'm ready to send out a v2, I'll
make sure to include that change.

-Doug
