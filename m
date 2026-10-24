Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792809480;
	b=NWVepSdI5Ww+Hi5DlA/y6i1GKjrXrj+CS70t16V0gNbILL398KIYzCgupXwPAZQTzvKu
	 FvmYIGl+pCBvndSmr8taj3B0CxisjQ5Bykhn8DnWOn1WlrlDaC6uTeIbDyq4JZQgMUzCy
	 01yko/Udd5aNXpYsUHIe+ksWEXDJM8FHj1H4na+6cD41B4ZgCiHDwTRTHX5ssQtdnh5yo
	 yMjIcsJghIIg3f7zCRMn/wEaRPZOksDPkBeGHO5IdVqC3m3lO7baHT28OUEHQbQXrb1Mi
	 NXP4rdiWOapiZgDlIUCKlOze7s7W42BtX39YEk1DpJwXqH9DJOu67M1HQj/0cAzuxHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792809480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=4aeP3BkhskeN4vpePbdVXng4dknkyS1fsNJYB/+44kg=;
	b=QJ9gLPqn1v/7t0jaPCtNhsn4vn9pFV0g1+RbMecZdfusVhuFwPb8zjtAjez1eCVLUlKa
	 ERvg+KQ3kv30aDKtHWeFvWhF9UGmNSmiMkJJU60dFUlWVmU9D2m0bqibsGEcTfzTss+vj
	 eq7Y6eYO+EUsclfwXglZdKC5nupCkU4jTRjqNOhQtScpdXGnnCHVFFrwIsqd4rFE3FPG1
	 t5kIDb+TIMTAP8FVT+L3HgqvP2KRH+XZIbPL0pEuTLRx00pakZ0KMTIPkw1lhPPDCKenw
	 jIcO9eXqUt7zJjN1o6kTM9Hdj9UZDcIZjSleyYypFAcUsQNjf2UFu8qmwok2w7pUi7w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cHXI9gVe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEF8606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 02:37:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAEF8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cHXI9gVe
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c3f8d72d7ceso219208966b.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 19:37:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792809478; cv=none;
        d=google.com; s=arc-20260327;
        b=Lnt2SFI9Ykftrrm49sq+Bx7zKDHN4ipyQ9v77MHufaMGqrkFBIIpqLvjgTxAFGgRFw
         cvX3VbEG1cu1aJKb6dtt8s8it6tdbC+OpBFV/vijBkk/yyTcbJDG8d+RfKHF+8GarCW5
         5VR2s1+AlhYJPAgtP0FlJE2Tm7YnGtr8yuZziq01UroNydyoJzNKxZl93QgV2YiIKx+P
         IqDBGSQvBhEZAz3JGXMSpWJQ6SYib5jIyjaqknHGTtoDF2eCi9nruKWVp52Mft8oSLyG
         dTb1gc4vJNYlibt0sQfvNYr1k3E/skNMPG2gQDebt6T2ivF/yuCpQPCIrbsN6uv53bNU
         mrHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4aeP3BkhskeN4vpePbdVXng4dknkyS1fsNJYB/+44kg=;
        fh=dT1y6Kywmj6RgKRQlRI3cSc0KXCqHlJXcnDWH5XpJf8=;
        b=CojrHVOmMIl8XyvaHG49bY8WQ3BGQI4xKYiNqaTEAzfg5KVqNkNHlMCAfRQYlLRyyY
         Du3HDae4rkDhzrV/sc59hwXWaagmwZLB1dYTy3WWHSXjLrq2uNI9o56gEmSF9Mp5oEdL
         3U0FJRy1EHIkMo+bd4cN4uTZ5e3MY45g8l03vNMell4AwNzxdgzFL82NiT9SguN4RO3z
         t0pwT1cieOEIAqqYdbGuSeuXTVgt88cUdMkUdmEmjMmSCDp2wRiTCcAWMlfxw89JJIJC
         cw8Yl8VlqUioSeTWKSLBHxDRmK3PRujxJQY/pGgCMEP2Dp3M0UtYDNkZDl3TICupWXEq
         lSDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792809478; x=1793414278; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4aeP3BkhskeN4vpePbdVXng4dknkyS1fsNJYB/+44kg=;
        b=cHXI9gVeD8sE91PEZUydh6dBr+8qqrQI2BewRuGH7xgj4r1m2gXAi+t+jvDU3Tui3s
         Oszp1rnq1V45dG+SuqrIlUaNIt0EDHKNXx2XkDWiiCfrz6IuksJ3U7XoOdCgbfCBxrt7
         NY0ZU6jWbvAXs24qzXj9qt+qkTk2bpUuxNs/tORqx0dRhM2YLUvVqVQ6vLy2Ee9IWRsV
         us0Ic/Ywnp3/XU+nkdEt6+Kc8xYPUqgkm4TYxiPhYECCvdHSiPdV9gTIO7rkqkaHgHYv
         SB47Ey9y7n8ZylZytaNr64YmBNb93hL2Spn82VGjY8+A5nqkt3GLJeytH7yGXh3qDz4A
         ob3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792809478; x=1793414278;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4aeP3BkhskeN4vpePbdVXng4dknkyS1fsNJYB/+44kg=;
        b=P2wNHBE/gBOsJKWCQDPFEHfh8+vDg+lY3NyEtoXZZarYnU3ohRezFpQeAKceIlEn+P
         +MlupXF9nSLZguspoXE6EVDoCyWEnC9as8ERElICGrsqTw073I2zNBV/zHRqG3uovWfS
         GTOIInu9RkLHP4DHkFofX/vlOwiBNHzpLNz8M0PqxhBcBk3MdaR8GgxDpg2NOSFmUO+G
         9HMsaom2WWdNNUiXY7a/Kb0jzOgM/Yb0gboXunTVsGhnkIMlGjFMDs8Gh9sDRuutNIJI
         N2Kkj/GghWUHJcSNtnC8wsfHTIS0CxKobKZoEyBWVmiAlV7qWVDs3OjpJ25OokROKO7u
         OXOw==
X-Gm-Message-State: AFq9FYJbA7WHW/cisFH91m07vbrNOZJp626EGiYwxVEXxBuwURR0QGk6
	He7mQLsFxir+ud7c+6T5L1I9lLwXbrz2XdK2lpo/EwXrgPvN+Knoio/uCYJQpFoS/oJZEUVV5u4
	0TRnK0Wk26cihBS5htL3eyp5c9y7emw==
X-Gm-Gg: AYBFou2qfDzXDu13YBZUmyByDpCSmMRBYrmw7PHH0YiX8JMaEEI/cZaXTTPibNfxzwn
	i5cj2UZTmBifrOESMn+eULMlAixGvMOTcaa43s+HmFW66S340kU03LtfviyFVIwo/XjdO/mKChG
	Jp2xj5v9c1nBsiri/+8efXIV0mwHJwY4VZk0SzkNRs36wT1EcK5FwhPjIArAOSVbCBn7WXdimNv
	wLF2HeLgfAok0FflGEHVGoi1zq7N3xosRRa9ZYU5M56rXRXwiUiLIU//peEcAGYZISJFQDtAmGK
	Js2jwBS0nVi/JkEqdjkQSIe7ln7svcjTNSu514Y5C4B+8ASUkuOIMuVGYkIkM9mGMjN83pX6FgX
	dL5+XlDzb/giUUH1DE0LtIGEVGynNRQby9ZGfNNr34rZn5Cc8Y0ecS3vRGza9ZzLIe52FtuwkQE
	u0DFaaGo1Tui8bNXA/9jZtsx2iPLJkswRg4GKeoLn2WYF4d/52Zw==
X-Received: by 2002:a17:906:9fd0:b0:c2a:b1cc:158d with SMTP id
 a640c23a62f3a-c46bde97dbbmr85486066b.32.1792809478280; Fri, 23 Oct 2026
 19:37:58 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016013918.3492835-1-mhun512@gmail.com> <atXYWrNAI5pmyMHD@solitude>
In-Reply-To: <atXYWrNAI5pmyMHD@solitude>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Fri, 23 Oct 2026 22:37:46 -0400
X-Gm-Features: AclHuK8ISi6y0PGRQ1melezhjTDPOEdeAo6Lz8Ja0WFr0Na_5A0mSRW3u1OesuA
Message-ID: <CAGEsz8F1x+nDPe4tAuQENFWfqRCwkSKif_Jn1w3iaqmYJEu8vQ@mail.gmail.com>
Subject: Re: [PATCH] platform: cznic: turris-omnia-mcu: stop button emulation producers
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Cc: linux-kernel@vger.kernel.org, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the Ack.

Agreed that an autodisable helper would be useful. I=E2=80=99ll look into a
separate follow-up, including the impact on existing callers.

2026=EB=85=84 10=EC=9B=94 19=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 5:48, =
Marek Beh=C3=BAn <kabel@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Acked-by: Marek Beh=C3=BAn <kabel@kernel.org>
>
> This makes sense.
>
> But I wonder whether the devm_delayed_work_drop() from devm-helpers.h
> should not be changed to use disable_delayed_work_sync() instead of
> cancel_delayed_work_sync().
>
> In this case the initialization function in devm-helpers should be called
> devm_delayed_work_autodisable() instead of devm_delayed_work_autocancel()=
,
> though.
>
> On Thu, Oct 15, 2026 at 09:39:18PM -0400, Myeonghun Pak wrote:
> > The legacy MCU IRQ thread can requeue button-release emulation work
> > after its managed cleanup has canceled it. Since the IRQ is still activ=
e
> > at that point, the newly queued work can outlive device teardown and
> > access freed MCU state.
> >
> > Use disable_delayed_work_sync() to prevent further queueing and drain
> > the worker before the IRQ action is released. Keep the parent IRQ activ=
e
> > while the worker completes. devm_add_action_or_reset() also drains the
> > work if action registration fails.
> >
> > This issue was identified as part of our ongoing research while
> > reviewing kernel code.
> >
> > Fixes: dfa556e45ae9 ("platform: cznic: turris-omnia-mcu: Add support fo=
r MCU connected GPIOs")
> > Assisted-by: LLM
> > Co-developed-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> > ---
> >  .../platform/cznic/turris-omnia-mcu-gpio.c    | 31 +++++++++----------
> >  1 file changed, 15 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/platform/cznic/turris-omnia-mcu-gpio.c b/drivers/p=
latform/cznic/turris-omnia-mcu-gpio.c
> > index 4e430d6c3fc4..8f43bfa92373 100644
> > --- a/drivers/platform/cznic/turris-omnia-mcu-gpio.c
> > +++ b/drivers/platform/cznic/turris-omnia-mcu-gpio.c
> > @@ -11,7 +11,6 @@
> >  #include <linux/bug.h>
> >  #include <linux/cleanup.h>
> >  #include <linux/device.h>
> > -#include <linux/devm-helpers.h>
> >  #include <linux/errno.h>
> >  #include <linux/gpio/consumer.h>
> >  #include <linux/gpio/driver.h>
> > @@ -841,6 +840,18 @@ static void button_release_emul_fn(struct work_str=
uct *work)
> >       generic_handle_irq_safe(mcu->client->irq);
> >  }
> >
> > +static void omnia_disable_button_release_work(void *data)
> > +{
> > +     struct delayed_work *work =3D data;
> > +
> > +     /*
> > +      * The IRQ thread may requeue this work while the IRQ remains act=
ive.
> > +      * Disable and drain it before releasing the IRQ action and the M=
CU
> > +      * state used by the worker.
> > +      */
> > +     disable_delayed_work_sync(work);
> > +}
> > +
> >  static void
> >  fill_int_from_sts(unsigned long *rising, unsigned long *falling,
> >                 unsigned long rising_sts, unsigned long falling_sts,
> > @@ -1082,21 +1093,9 @@ int omnia_mcu_register_gpiochip(struct omnia_mcu=
 *mcu)
> >               return dev_err_probe(dev, err, "Cannot request IRQ\n");
> >
> >       if (!new_api) {
> > -             /*
> > -              * The button_release_emul_work has to be initialized bef=
ore the
> > -              * thread is requested, and on driver remove it needs to =
be
> > -              * canceled before the thread is freed. Therefore we can'=
t use
> > -              * devm_delayed_work_autocancel() directly, because the o=
rder
> > -              *   devm_delayed_work_autocancel();
> > -              *   devm_request_threaded_irq();
> > -              * would cause improper release order:
> > -              *   free_irq();
> > -              *   cancel_delayed_work_sync();
> > -              * Instead we first initialize the work above, and only n=
ow
> > -              * after IRQ is requested we add the work devm action.
> > -              */
> > -             err =3D devm_add_action(dev, devm_delayed_work_drop,
> > -                                   &mcu->button_release_emul_work);
> > +             err =3D devm_add_action_or_reset(dev,
> > +                                            omnia_disable_button_relea=
se_work,
> > +                                            &mcu->button_release_emul_=
work);
> >               if (err)
> >                       return err;
> >       }
