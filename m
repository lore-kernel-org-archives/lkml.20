Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792807118;
	b=YNNhxm9dsWs4KjnTG+Gi3i4D5lGuC66bnoOnn2UdX6Zj5pVQNO60Xp8Zkivmea6Qp2eb
	 OJVPs2GeMnRlRttEsJWTr9XEUm+0Hj7U798bWoM3yvXp/v3zN4MU7cIjwC0ASr4cxs1lQ
	 6fB8BPVQTzoJGFpxwPKajUCX0tOlQAyQLIK6Yf7fraOvjYBnw82lcgzFuS2cLUaAV7nhv
	 txxBtfwTSoJLcpzGSeqZAF1kBFRhla0au1D48oUGQpx9CWK4JRSvRwDJLXOKFcqWqJLkl
	 +7rZnsPFWIUY3dKUmQ34NOt9DXcqQ+z2Da2wheKELGdqTQqARWpTw1qi5KjiqONkP1A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792807118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ECHij8PdbURaFnqvu+XeUPXdEa8GHm6DzxM6Ksh7jCc=;
	b=J7taODXVt8xEHs/YLw+yt/jB6SjWdv0Zsa7clR6rNpoeRmo5X4/3OGXVu0IE0YHY9XFF
	 Z/pZwEWAw7ziMtcLtdpSW9RixzhbAGkmYeXi8M/Jh2PrfUryNX9QInnS6L2BxFQBHzlgZ
	 ilY/B6Rt9Aiax1iF0zFTr8D5AjE4rjTZXe0cRr6c937yCWWiRpaaDwaYdB4KcUlDHVeW8
	 YZ7Z7Me7U6AyvGVJCBZpKKuNtkWoIYbsj1gw+3Hs5Lne9jD/QEAk1goU7u6kulR7+hNSY
	 dOIVuPhPCeYdNiPPwksbFSEmyUclJxjMTwIr2hTZ5Vzzvr7cPcgb+QtaHc6S2gPlk1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="C/eJlWo7";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39025606A320
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 01:58:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39025606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=C/eJlWo7
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c38ac26cc5dso216189866b.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 18:58:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792807117; cv=none;
        d=google.com; s=arc-20260327;
        b=UrJBKNr10fr7Id2Jk3OerZ40gjr4F7Q1U3TOd5wwcWonrpYoyxdB+s0cdI6XDVT/y+
         PaeCHxiF5/yU1w5139i0Ng5/ddRb5vi/1U4hWMcXExQpXO/E30K1cos+hdE1chH7fWtd
         W4VjY+/ODA2wrP2qfabSitjCsBbVsFSLJLEJaS/XlJQsOByX+z4+Z5ObCLnVpYWlk48P
         3TaSWAYH8Dt0YFbmK4Y9WbFrTiXjVjjbVuQzqru7bKQnjYq/GnSUwWXAOG5tn/5WMfAv
         Xfst7O3H/7OinIrjJ/3b+ftMSTAP6YtvQyn7J9Hg7mjsnN1rsUo1zDr2zkio3q9juuwv
         owdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ECHij8PdbURaFnqvu+XeUPXdEa8GHm6DzxM6Ksh7jCc=;
        fh=YuubAsQbWa/EV2xjYNUVfP/bS7AntYuQVaoKV/yVYSk=;
        b=N0btXR9p/wDmYnGBnqMPZulNuXPgabzLClnhggfddmTwt8zcYrCJ3cKdvXxQHPZrwy
         1QSqkC1KE8cQurm7lYMmF5mRUTzqzHTtEVsFsbZ0mXIz6OdkmvyjV7RPTybITiVFsCAc
         v57pYVWpvT9j+1RU3vYKhEjcSnC7VT9zKET3e3ES5lN8UeS7nJ7dUwRiGeeUbKwFxMlZ
         ZN2FL8oGlh2W7vLq4mFSa4iL3stUW7Xzwo5B77XlcHXHCgsDT61w6Bt+e5qwxXXd4deA
         AHIyL1ONqJoL7ja0rsr1ZyIG2XjIzdUCAYFuVsBJ25o8EyNQCOfGD0kAR5ZNwJHkyf7j
         1L0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792807117; x=1793411917; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ECHij8PdbURaFnqvu+XeUPXdEa8GHm6DzxM6Ksh7jCc=;
        b=C/eJlWo702NdxfX4/AfNaR3w+0w8J1lGdQi179AJXND78n1ikL9XutvyX59o3EuNy9
         wMK7MGwUFMTkiVUuQ16JOWYX+9uvFGUv9vn+HJ/olaPkNggEmdT99DLWw0LVAxU7fevS
         SUysNNzZUOsM+aZ65wJpwECzGtJtu87BzLvvKNdMpvQhHORryLjI9TihRPZ1K6gBhjaq
         Gi8A/C8tuMn8E4Rvnqr35hMQhg+fYh+J6N2qn2eS98SeNyYxM6TJU5QxzIIzACA4+WTm
         rXSkMnK0PVQG0ZXT6dH1wgfJ1YulLm/UKadhHVLTKEw8VfS/pNlDv2CwAg3c1BHVz1BH
         jZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792807117; x=1793411917;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ECHij8PdbURaFnqvu+XeUPXdEa8GHm6DzxM6Ksh7jCc=;
        b=dK8Avl3FwW1FIP5wGcOT9mo1vVLVmkim0DeIoWa1F8XSkLS2Apz657+hezji2+KQbz
         vZDs5GB/UbpU5c5s59uTZK+Mm2D3Fgzt171WSfYTJRSoQQUwmSQj9BEof3Iz/FzVhjgf
         JVuKeJNTb/ai299IZMswHp65pOV7WzkLLxYWW0By3KzQuw45yn4wXDVlfus3I8xP2pz+
         iQnIJnkjJ2z2Phdp0gFkic0KmY1036E0twgmag84MKSz2ZSynD4NsoFcQsC0vz8/0WhD
         ESwHvnVD6WeVLAz7SB4JQyiuhl8ntv1P6kjMtGmhg3lslLcKCwU/TX7YXdVKUJTjowCW
         ZZEg==
X-Forwarded-Encrypted: i=1; AKwUvBxGYT6i4iwNrbP1dmGoiMwg2wWl7up6kmfr7h/+A73hByQSE7rRn8D7SMOozwXFR9XFSniIWGXjLlwQuCM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZgY4HsMgRtwuqtDtl0A1nJ0fAQ5p72gcwDCjbxCpvQItmNenu
	QRd/TmdfBr08ZRX1eXDQxfe7pflmmNITnnMO6kYWcUpf6KiL6AUClxJUUwkfaUxeDd41m63TyKv
	7oYHBCcd2hxhQMzqNHAC4Jp6OUmvIqw==
X-Gm-Gg: AYBFou20FSAm43bxGez9++2MKBWZ60HQJ65aqWehrfj/ofilTKAmrJb183X1SSHes9r
	KqU4eAkVPxv8MFQW4EBXBvwQSIkt27KIF6iownVhitZqA+5zpgZE1e8KLIl5BUemq2JJj1i6qky
	ZJ2thV6b0pymUjUAIxZFS9yA27Pz0YnOHBKxXRSbIva00FZxxYm2abL00P6aHRjbD4uJq9Zku0V
	PZfvY91KUtZgsS/okmIlz5CkZ+yMpDSM5ruDg9V/dKyZ4zTDZ84RR+LenfEI+drwexbvsra8PIc
	ZrRIG9dNL0gBNfyVRdde/Mm+I9w/zMkaS723bLWqnRoQCwHbjAX4V4H3HgUboHYQUR3q99aSGM4
	KEn1JOMmLsxlWqI0IITl/6VLzsAg3zE6ZC4EsCX6jyB6SOG81IN5P16lKzQu86RsOBtoSmVPTIN
	5qa8RurI9JB5UOT1CECwGxfW3dPgZAiaC0wW2nFVTKEfoyRXR3Zg==
X-Received: by 2002:a17:907:3d86:b0:c46:b9b0:8e81 with SMTP id
 a640c23a62f3a-c46bde6432dmr71858566b.32.1792807116388; Fri, 23 Oct 2026
 18:58:36 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018020357.3845586-1-mhun512@gmail.com> <atSacKtZ3e4YtVBy@venus>
In-Reply-To: <atSacKtZ3e4YtVBy@venus>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Fri, 23 Oct 2026 21:58:24 -0400
X-Gm-Features: AclHuK8Ag7gTxqfkD21gDaNpDDuyN6cwNOPCWb1MKdVXj4liu7mcdeQKwDbPgu0
Message-ID: <CAGEsz8E+=f5Tx-Nx6OLEMJF24S8LV2oEz4zAssXysvgDU+kpUQ@mail.gmail.com>
Subject: Re: [PATCH v2] power: supply: act8945a: Disable status work on removal
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sebastian,

Thanks for the suggestion. I'll follow this approach in v3 and add a
shared mutex to preserve the serialization previously provided by the
work item, since the two IRQ threads can run concurrently.

Best regards,
Myeonghun

2026=EB=85=84 10=EC=9B=94 18=EC=9D=BC (=EC=9D=BC) =EC=98=A4=EC=A0=84 6:19, =
Sebastian Reichel
<sebastian.reichel@collabora.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Hi,
>
> On Sat, Oct 17, 2026 at 10:03:57PM -0400, Myeonghun Pak wrote:
> > Clearing init_done does not synchronize with either status interrupt. A
> > handler can observe init_done set, be delayed, and schedule the status
> > work after cancel_work_sync() has returned. The work can then access th=
e
> > power supply after its managed cleanup.
> >
> > Use disable_work_sync() to reject subsequent queueing and drain any
> > existing execution. The charger allocation remains valid until both
> > managed IRQs have been released, so a late handler can safely attempt t=
o
> > queue the disabled work.
> >
> > Replace init_done with the work item's disable state. Initialize and
> > disable the work before act8945a_charger_config(), which registers the
> > LBO interrupt, and enable it only after probe initialization succeeds.
> > This keeps both status IRQs from queueing work before the power supply
> > is ready, including on probe failure.
> >
> > This issue was identified as part of our ongoing research while
> > reviewing kernel code.
> >
> > Fixes: a09209acd6a8 ("power: supply: act8945a_charger: Add status chang=
e update support")
> > Assisted-by: LLM
> > Co-developed-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> > ---
>
> Having a closer look at how the work is being used: Instead of doing
> all this complex stuff this should just use a threaded interrupt and
> completley get rid of the worker. I.e.:
>
> 1. get rid of init_done (done in your version)
> 2. switch from devm_request_irq to devm_request_threaded_irq
> 3. move the act8945a_lbo_detect IRQ request after power-supply
>    registration to avoid problems with spurious interrupts
> 4. move act8945a_set_supply_type + power_supply_changed calls from
>    act8945a_work into act8945a_status_changed
> 5. completley remove charger->work
> 6. drop empty act8945a_charger_remove()
>
> It results in less and simpler code.
>
> Greetings,
>
> -- Sebastian
>
> > Changes in v2:
> > - Remove init_done and all accesses to it, as requested by Sebastian
> >   Reichel.
> > - Initialize the work before either IRQ is requested and keep it disabl=
ed
> >   until probe initialization succeeds, preserving the probe-time gate.
> >
> > Compile-tested with GCC 15, W=3D1 (x86_64), with OF, OF_IRQ and
> > GPIOLIB enabled. No runtime testing.
> >
> > v1: https://lore.kernel.org/r/179211805459.3650807.8742309660995961596.=
G171@gmail.com/
> > Review: https://lore.kernel.org/r/atPtc_jKLo8RhAMU@venus/
> >
> >  drivers/power/supply/act8945a_charger.c | 16 ++++++++--------
> >  1 file changed, 8 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/power/supply/act8945a_charger.c b/drivers/power/su=
pply/act8945a_charger.c
> > index 7e4b087..7d47052 100644
> > --- a/drivers/power/supply/act8945a_charger.c
> > +++ b/drivers/power/supply/act8945a_charger.c
> > @@ -14,6 +14,7 @@
> >  #include <linux/power_supply.h>
> >  #include <linux/regmap.h>
> >  #include <linux/gpio/consumer.h>
> > +#include <linux/workqueue.h>
> >
> >  static const char *act8945a_charger_model =3D "ACT8945A";
> >  static const char *act8945a_charger_manufacturer =3D "Active-semi";
> > @@ -78,7 +79,6 @@ struct act8945a_charger {
> >       struct regmap *regmap;
> >       struct work_struct work;
> >
> > -     bool init_done;
> >       struct gpio_desc *lbo_gpio;
> >       struct gpio_desc *chglev_gpio;
> >  };
> > @@ -444,8 +444,7 @@ static irqreturn_t act8945a_status_changed(int irq,=
 void *dev_id)
> >  {
> >       struct act8945a_charger *charger =3D dev_id;
> >
> > -     if (charger->init_done)
> > -             schedule_work(&charger->work);
> > +     schedule_work(&charger->work);
> >
> >       return IRQ_HANDLED;
> >  }
> > @@ -587,6 +586,10 @@ static int act8945a_charger_probe(struct platform_=
device *pdev)
> >               return -EINVAL;
> >       }
> >
> > +     /* Keep status IRQs from queueing work until probe has completed.=
 */
> > +     INIT_WORK(&charger->work, act8945a_work);
> > +     disable_work(&charger->work);
> > +
> >       ret =3D act8945a_charger_config(&pdev->dev, charger);
> >       if (ret)
> >               return ret;
> > @@ -625,13 +628,11 @@ static int act8945a_charger_probe(struct platform=
_device *pdev)
> >
> >       platform_set_drvdata(pdev, charger);
> >
> > -     INIT_WORK(&charger->work, act8945a_work);
> > -
> >       ret =3D act8945a_enable_interrupt(charger);
> >       if (ret)
> >               return -EIO;
> >
> > -     charger->init_done =3D true;
> > +     enable_work(&charger->work);
> >
> >       return 0;
> >  }
> > @@ -640,8 +641,7 @@ static void act8945a_charger_remove(struct platform=
_device *pdev)
> >  {
> >       struct act8945a_charger *charger =3D platform_get_drvdata(pdev);
> >
> > -     charger->init_done =3D false;
> > -     cancel_work_sync(&charger->work);
> > +     disable_work_sync(&charger->work);
> >  }
> >
> >  static struct platform_driver act8945a_charger_driver =3D {
> >
> > base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5
> > --
> > 2.53.0
