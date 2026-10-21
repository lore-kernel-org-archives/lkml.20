Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792609066;
	b=wdQS3uQoZtnge79fhRBibJPS2V74HtuMFeUI5qvzzB9gdCFkmxVfIxz4/UqfeuTcOUpu
	 TH6nfe0QngxcYs7loLSyu9STBdxIzNsp4HQyisWLPZX/IL5SleXSA1dUrXmgRQFWnfesb
	 6bM+0eV//7k6Kei21nCgpXn1BnZCRxlkkn7Vk/eKQUkfJlwc0RBgdj18urX6GRmxESMgq
	 7IYFg6WFdqA91/n4mdkY/iEvf+bVz5uDwtWKyr5ZpeDSGvRbrv9ZMvub38IuBxSLIon5/
	 vPVpxSJWPmrgcMTZhnqd+Tw2tU8DbLRnNAjH4shA+YTEmhsMlsIDpiQqSMsAHec/mSg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792609066;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TyL9llcsal4SOiVQ33XFom8NGFxfymW1uiK43kazgp4=;
	b=vf9NDpzAE6bvUEnjZjWnbQZfwNiW+j1oTjA8UgOXgRF6wTKH6NNZ9n5jEVh3xsaSodrU
	 t/SuG/WYWFtzqS9qFTHRqpu856Fs75A1rwhCWxyik2nk+J+ZrIQMplNJvApJqncriYaeK
	 YE5V7mKoEXPAvXHwY0WCQMrATbca035JmOH3a2EtwqNHitRUsnbpMwhMLOtHfCYmfcpYa
	 hNgw4tLS8PBTBExVRd5TXRvSZgfIfsesiB8GE+uaVEEDVxRlfQO8oxZi/6p5A2itp6U9l
	 sWz/vOJYpgMQ2i4lwNp7LMIMt+4ySw2tQZBUgY6fydM+5SUuPWfPj/1MA3NszTO80eQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kjGOALsu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CBA606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 18:57:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56CBA606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kjGOALsu
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91befe703c4so8011086d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:57:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792609065; cv=none;
        d=google.com; s=arc-20260327;
        b=M79jvczTDucyryGWKIs8iQ0ejJ6Avxa7CkzCfLhad1qaxKSmgSfsRZs0kGdsSAQMD8
         bA3vyoCW+cEuXiA6mb/TirwAWKcx0cA2AM/UGB6xLZBLMptK9uNegTSB9q93RZoQnaGr
         H8BKbwpgrXsVft3w0OEfJ5PSmlgT9xhtpteVAWx9dEw3WP4HLbqyFBSf+NKLQLBiAr2c
         2ZiLz/LYajcMtj4CGawr7eDhHyt46UVqod2XSxk5Zr+kO2MLpTLSGaqRRMvisxzlfAHo
         tNtWiwUkyS93yl/jOJErlqxenmR04DvTzBjUpfsU4Bhu9duBNc+oAiwRUMNOcWOHGX0T
         RQTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TyL9llcsal4SOiVQ33XFom8NGFxfymW1uiK43kazgp4=;
        fh=JQsnQi70cW1qHdFQ1sBeYwAlyqRmwYPVGBQ3GGJaIzk=;
        b=AhezU6DjnuCz6ASDoPuOI/CG2OXxVAk3AduOA5ciENoowSMmsIdVeh+LUhqa1mTAeX
         O+4ZaNfDXcBn53FKMMi/b8KqTVeBGZhrPm7BATeoAYARAii/aXsqXnuD5FTNDb6VZGEx
         5LnX278rpL126HTmAG9fpLEoMpaEwXltVDUZPZIjW+fqj/fhV+yDufykcvqh4RY0mGwo
         6LpuVmTl73lBmU3zosKJSCzVGAULGs4DZstgU2EKVVp0zlrOWxkfZyXCH7zFV5gaev95
         WOvEqXOa5MC2ECFQYc7mALpgigrNgZiycepz7cusEWF+y4EU9zXxKZRXEDvV+tcowq0w
         p7xA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792609065; x=1793213865; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TyL9llcsal4SOiVQ33XFom8NGFxfymW1uiK43kazgp4=;
        b=kjGOALsuRc96u0lbbBCHd+t/kSgHPs10UzG2JjaWN0A0JRVmmpjP+hr1FELaqqlIkc
         a2VxPzU2BjzlRqvebHagLCCoTnlxIn+hRgVkVnmFUg6+KB9wRNBijyH9EWOdT1eWUHFi
         d2sNdW29OMq6hggPg6S1bQUzcW+Vjgdb3ckPTvd70RuODMYSEtZl/s48Wcs2JBQh3yWB
         AgmJwDXmuUPTMUinlm4I1FkxrxxrFyCqgZkRfF6ArqcIIVz7T+pl7eNLSdvLk0RE6o6f
         k1KLciec+Qjw4Ope+zrjrSrXqtLdsmJX4PUgPOZAjf3vCcPQduHNzs7t31mMdnaf8Jwl
         e12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792609065; x=1793213865;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TyL9llcsal4SOiVQ33XFom8NGFxfymW1uiK43kazgp4=;
        b=v95y9bX+Z7l854qcVSpN8h12RgAVEad7OHr03TbvAVYUw8vI49y15UJrMarycDGAB1
         ZpnbqDt5cdL7epB5KRskP2W1LYeuvo/1C6+EsuQhXIE1rhlMSjx6mPnUSSE2+pM3HFOb
         MopyW0RrcxP/6azWomhKKYUrEMUxKLlemM2XluJuq8jcFzXdEXYjjhTaCnBDp5VQKVj0
         V+OMvrJt2DzzxW6wYGedKnPQibbT2PXH1KQLu6bZpbatrPxsj7HGkPbokqrGJXsETkzo
         z/VuyfUTs/WAwSYM1DnoNB3piBywCz32d5ggfCXIMK5uBr7SYmpyc9XcrWZoCQ9th37T
         b8AA==
X-Forwarded-Encrypted: i=1; AKwUvBwsJ36MwQ+37h1TzsF+kxQw8VjvClcoOFCbeA7HMCrForY38J0WusK1LbEvGE+1SeviCYxy8NREkdtyLSE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIF5y29W5aMMiIvgZmXDzJpeuNAifKl/gjmLPp55PDGLRklW2VK
	/48WftNL7tYOjU4ca8IBs2tA/xYSsqJR+lm2/SgiejY97iDzlWdu2kshxissLS73XgSzVm2HmiE
	Ly4UNONzxHuaRqQyg6vQR3DZgKbf4huNaDA==
X-Gm-Gg: AYBFou07ZECiRQJoNLujbPaxRu+Nto0bj66rY4F7kX5FLnt8WMX3mvpCPMLDo0zi3q6
	B3D2RZYg2VbSW/n7o49Z6HiBwLHZ9gYOuGlHZqxXbNcdSd78/isfMjybho8xWRHmq4JvdrheQcR
	8BvXBODHrtiqh/ycc54nvwssPKJOkNSVgLfopkHb1oUpUfu+vQPggfcudjlxAc1xv09WKy++yAS
	umy3esZCP8rjJT+NpREEC/571WM7IkRpTmUZ0y8uhtcRFvhwvQiVwo+E3qH2KQET0ybRiu6NhPa
	AVaskzWw2iPVSBTdU7/1V+KY6NTFFZRmN46C5uWqjbuPadhpCBAy7+MxD/Hs2cxyqv6KCwp+Nxe
	4Ko6r4beln9wKpY3naT/R7D58jr7d2VPfROnD
X-Received: by 2002:a05:6214:2026:b0:91b:5d3a:4fcc with SMTP id
 6a1803df08f44-91c12f57cd8mr50541036d6.57.1792609065159; Wed, 21 Oct 2026
 11:57:45 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260927041138.4112920-1-jinmo44.yang@gmail.com>
 <20261018124755.850888-1-jinmo44.yang@gmail.com> <20261018124755.850888-6-jinmo44.yang@gmail.com>
In-Reply-To: <20261018124755.850888-6-jinmo44.yang@gmail.com>
From: Jason Gerecke <killertofu@gmail.com>
Date: Wed, 21 Oct 2026 11:57:34 -0700
X-Gm-Features: AclHuK_ejuCq64puYEyVI0F5dBdnGQ6uXcliBiinZhl_jRQ73tHCVePIfkfF6W8
Message-ID: <CANRwn3Sw1r6PWqZVynBdtqDC=T6SjF86y9VcNM7WYBhhX0LyJA@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] HID: wacom: add NULL input guards to Bamboo
 touch/button handlers
To: Jinmo Yang <jinmo44.yang@gmail.com>
Cc: ping.cheng@wacom.com, jason.gerecke@wacom.com, jikos@kernel.org, 
	bentiss@kernel.org, dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	"Claude Opus 4.6" <noreply@anthropic.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 5:51=E2=80=AFAM Jinmo Yang <jinmo44.yang@gmail.com>=
 wrote:
>
> wacom_bpt_touch() dereferences both touch_input and pad_input.
> wacom_bpt3_touch_msg() dereferences touch_input.
> wacom_bpt3_button_msg() dereferences pad_input.
>
> All three can be NULL when the corresponding
> wacom_setup_{touch,pad}_input_capabilities() returns -ENODEV during a
> successful probe. Add per-function guards.
>

Seems reasonable to also add a check in wacom_bpt_pen(), even if (in
its current state) a null pen_input is not possible for these devices.

Jason (she/they)
---
Now instead of four in the eights place /
you=E2=80=99ve got three, =E2=80=98Cause you added one  /
(That is to say, eight) to the two,     /
But you can=E2=80=99t take seven from three,    /
So you look at the sixty-fours....



> Fixes: 2a6cdbdd4cc0 ("HID: wacom: Introduce new 'touch_input' device")
> Fixes: 862cf5535c0c ("HID: wacom: Introduce a new WACOM_DEVICETYPE_PAD de=
vice_type")
> Signed-off-by: Jinmo Yang <jinmo44.yang@gmail.com>
> Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
> ---
>  drivers/hid/wacom_wac.c | 25 +++++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
> index e0bf03123cf9..a34db1505625 100644
> --- a/drivers/hid/wacom_wac.c
> +++ b/drivers/hid/wacom_wac.c
> @@ -3151,6 +3151,12 @@ static int wacom_bpt_touch(struct wacom_wac *wacom=
)
>         if (data[0] !=3D 0x02)
>             return 0;
>
> +       if (!input || !pad_input) {
> +               dev_warn_once(&container_of(wacom, struct wacom, wacom_wa=
c)->hdev->dev,
> +                             "%s: input is NULL\n", __func__);
> +               return 0;
> +       }
> +
>         for (i =3D 0; i < 2; i++) {
>                 int offset =3D (data[1] & 0x80) ? (8 * i) : (9 * i);
>                 bool touch =3D report_touch_events(wacom)
> @@ -3185,8 +3191,17 @@ static void wacom_bpt3_touch_msg(struct wacom_wac =
*wacom, unsigned char *data)
>  {
>         struct wacom_features *features =3D &wacom->features;
>         struct input_dev *input =3D wacom->touch_input;
> -       bool touch =3D data[1] & 0x80;
> -       int slot =3D input_mt_get_slot_by_key(input, data[0]);
> +       bool touch;
> +       int slot;
> +
> +       if (!input) {
> +               dev_warn_once(&container_of(wacom, struct wacom, wacom_wa=
c)->hdev->dev,
> +                             "%s: touch_input is NULL\n", __func__);
> +               return;
> +       }
> +
> +       touch =3D data[1] & 0x80;
> +       slot =3D input_mt_get_slot_by_key(input, data[0]);
>
>         if (slot < 0)
>                 return;
> @@ -3229,6 +3244,12 @@ static void wacom_bpt3_button_msg(struct wacom_wac=
 *wacom, unsigned char *data)
>         struct input_dev *input =3D wacom->pad_input;
>         struct wacom_features *features =3D &wacom->features;
>
> +       if (!input) {
> +               dev_warn_once(&container_of(wacom, struct wacom, wacom_wa=
c)->hdev->dev,
> +                             "%s: pad_input is NULL\n", __func__);
> +               return;
> +       }
> +
>         if (features->type =3D=3D INTUOSHT || features->type =3D=3D INTUO=
SHT2) {
>                 input_report_key(input, BTN_LEFT, (data[1] & 0x02) !=3D 0=
);
>                 input_report_key(input, BTN_BACK, (data[1] & 0x08) !=3D 0=
);
> --
> 2.53.0
>
>
