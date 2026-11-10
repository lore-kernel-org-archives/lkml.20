Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794334697;
	b=wjcHqzX8zl7EOHlqljZPtq2mUDiP9nAlyBHYae6/4BnbDHtN3Tm972J7sFHGMS7lrcWE
	 2jEqYV5bK9YSVi5/Te1GlztuvdRhp71tjfvKUEPaqALFX6qaXu8oiMnZQu4smsCbAMXFs
	 zbeCH54IEy4k5XTc5xGM0AxWNl67xYsoWVlY4TQq3l14YmkypPvmmZ7meo9uUIwhQi71Y
	 0/gHnBhZP+3wKWhFikxy4L11vBY+E+V7OiMKxiQXJOdpp/HylS6KWIYNphUoVK9uCsAfC
	 UmaRu4vYfBhe/LpURpK+09fumuo673bE4/cp/+3lUglj9ihVwI2KibR1+QgKUCgJpTw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794334697;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=80LZM7vxA2rau/UmsJfrKvz5NtsF8B/PIiFDePQDDVI=;
	b=ziDHmy7+OXJcaWswFGe67NUJmGJeRHFMM97vUihfWDZifQSjoO9aMfiE6xeYANqMq8wu
	 AS9bYj7HvWTegXNF9HqfR4e63dQtdtZrE/n5LZ+G4mLlw2d0Avg9b3sH+caP+57+WDOyA
	 sTHSPQyYl1nBKBlK0+KYqbHo/zwC1dBbkuFGW1JaA96i9CVAUZRN3w27QUxc+4NJ4/jCx
	 B960BP3HMf5y+0s8KlyhKzqNSKnEpPMSxnwJH34jRAc2HHt0UmKcnRHfHDkbU3KxdWiEL
	 DH3bF0VK9kWzR+IpwmXQQagcpaZTp10nryCDEECT1ed7GYBy6pfXnsl3yUD6XmCv75A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=Y7M5Lxs2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21717606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:18:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21717606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=Y7M5Lxs2
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b633ddfad6so3131966a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:18:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794334694; cv=none;
        d=google.com; s=arc-20260327;
        b=hELbGdJVT8yZxkP0ATamxpj9u9oB1J15jk/5B97SCDtkwrnUThy4x+zMLWRdDGD5GG
         4qNvS0FjVnC/7Kb13qD8vlnKG9vblWD994J2tGw53PByw7Kgm1iZwps9/X+D6aPQgCT7
         zlFAdxeCZxBFOVq0adkOX/d6gJVK89T7it8uj8KuB8P2PlkJmKBd+SJFHv/S96P2t5BX
         zqoEZsiCJ1NdiDJaHT8yp2K8tV7woqP7lPJPluuklh3zv27iKl7xyb3PFg73Lt4cqC8y
         +kfVgRZwBu27LoF8FEcDQOvld90qVLGU7UpbkxNbL/6e/95nff88JD3YPF2+jxUBWE+0
         UxDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=80LZM7vxA2rau/UmsJfrKvz5NtsF8B/PIiFDePQDDVI=;
        fh=Kx57cY6zuY5W7DK3SimMa08X5fvvD5xIF2DpV7yzsqY=;
        b=nzvlDkxnasmzIpXM+jyMBzl+FbCepRKtLlYMK2v/pJysnfi6inRXNUt9kaSUk+Czeo
         /h1W4yM6bCHR+oTRAJp/fq2iUJHzqwv/S8WsrwIbGt6rMFVr4B7iE2FbUcpgVtmOeqWz
         LQn7dpX3PPOZ+l6/OfBQLAD4V7FFfJvOJJn4RDAuxl9CCb/Ml8VvFQdkZT4l2lo8+YEI
         z4Hf1i71KZ7oWoqxcEOBvB1KgSVedcUTTITW23VLi2Uc2iMMlUoI8RPJfwB9eOH9zGxP
         PXnDsV1BKmALeSfPAWgcsU/6Q2M5w/MfSyqKHFRvMR9Ze9hG7UopD+cu9srz2I05D1GT
         M7PA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1794334694; x=1794939494; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=80LZM7vxA2rau/UmsJfrKvz5NtsF8B/PIiFDePQDDVI=;
        b=Y7M5Lxs2TuWQ+gyJvw4GYS02oviT+iOC7pbyCxdE9TEDOV4CW+fGbhifuD0yfgmkdw
         yjCqIxNrFVTWQb4govlTxDZrHRf9UUFXnOTx+SueCCABFNUsAbTsyRNaWEE7Zy5apRBE
         AjNgvhPwnEVBjPA82DT2rhUPM9hgcgyhHkEtc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794334694; x=1794939494;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=80LZM7vxA2rau/UmsJfrKvz5NtsF8B/PIiFDePQDDVI=;
        b=lFvtoSWgiblYKYv+70BA+k0MAF6Xy5h4+SJmH8FVI68M0BlK8j7ZessRnTjKpOJL0R
         RqfqusZUKThc7HCIgtQPz767K35Z/p8oUnHZpa8dyGZFvfsO4cC2AD9XTpJTzVFtkyAx
         dPfLAeMyWrySs4w6yO44rolQVYC4OSxLVWQI6u4BjBEg4fe5kdaDAP64jbS+ekKVfF6U
         a4Pp4Zui430ehUx+x/sV+gkhyvsm21ULvKod/RFDRxdf2XGbRZ/xGP+prqITk3svRWDn
         St0ghg5eZGFvcUYFF2jXmfio60Ius2Ag5JHB2FP1najAYdQHHsg3mUrtDVJimlMJ6pNm
         hH1g==
X-Forwarded-Encrypted: i=1; AL+hErHFH1gulI0/Tz5Hk2AleVEsCSOCSGdIcdLdatS4vev/JSVV/NptYXLZBy1xov1bY3yKKDo2GPd4CCdKdqE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GMl213a6TDg0Y32kGmfLIwDjy56ye0pmR1Y46X8Wh7O8wczJz
	erDHB0sLdTu2JHdsrm2DG9ugmfb7E7nV7brZT6ZlhFzcuuyLFpe8nSjl5tmTItpvnYXxZ33VlZh
	yNtD2xsdeNx6AaYcybx9vm49nMzt1gowNwz6FDnCChpO7z15hHjthL8w11Q==
X-Gm-Gg: AYBFou1OgbNewoCMmgpB0Pf/IUp120Oo6Qv/7ciEcS6RZegWo4gU3Dn1/rP7qZ4mqgd
	5Z76OUwa0QRZuuIntK0YYX9wP958PGcFplKurSoXIDyuGyA2pV7aVApuSp22+oXg3nDh2nDfRVW
	/M3mHL+p8NE2/hSpIfP7BbExGpUDNKSAvTd9UDfBIL2KZwC8e2w0nvY0Y8yWZ5LS02YfCVhjsll
	29CUnq0X0LMcexzrDFuYE3imhQjkLZHsmXz3R6kvLufJ2h3enI5ISA7Om8cGz4PZ0FJnYyJY5G5
	4ABdpHw21gWNsqgG38lC17L8uHo5Bo1HI5ZFDEiAFjMisTUppeJ/68En/S4o4+bZCZKMm6YuV/W
	+KCL5hATbdKRXPNL7OY5JRdUzTAZJolbhem86HQr9Bu3TqH8oWK4z0cI4WTag6Z9TItAUNUw08x
	fu8nBZdXVnePNxsltKjBlQhXnT/x07uGHtvoHUkROrabAFHxuPb3/mvE8l/tvcM74EY7CMnxwAx
	s8w
X-Received: by 2002:a05:6402:1818:b0:6b4:1916:965c with SMTP id
 4fb4d7f45d1cf-6b7773f2f89mr52010a12.18.1794334694406; Tue, 10 Nov 2026
 10:18:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CADq=QSxw-5LstC5McTqfsp9NaVrsUcemepw2g_TJXNrdpgFdRQ@mail.gmail.com>
 <CABBYNZJ2zD42-szQ5KWExOVkSLPmO8AH-FNyO2Eq3V4bfSrVxg@mail.gmail.com>
In-Reply-To: <CABBYNZJ2zD42-szQ5KWExOVkSLPmO8AH-FNyO2Eq3V4bfSrVxg@mail.gmail.com>
From: Piyus Kedia <piyus@iiitd.ac.in>
Date: Tue, 10 Nov 2026 23:48:03 +0530
X-Gm-Features: AclHuK9-UryAyf0oDUb3G0rqiUwWeIMBeAgKdlv4az6FLANmzXLCKZjrp5TQw14
Message-ID: <CADq=QSzm_pb0pKT-T3Tm_P1fhE3XfK6iT1PETChLBB4-857Afw@mail.gmail.com>
Subject: Re: [BUG] Bluetooth: stack out-of-bounds write in eir_create_adv_data()
 and eir_create_scan_rsp() when a controller stops reporting LE Extended
 Advertising (seen on 7.3.1)
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: marcel@holtmann.org, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Kapil Vaswani <kapil@presceralabs.ai>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Luiz,

Thanks for the review. v2 is on the list, doing what you suggested:
unregistering the oversized instances at power-on rather than bounding
the copy in eir.c, with MGMT_EV_ADVERTISING_REMOVED so userspace is
told. It is also sent as a proper patch this time, with a Fixes: tag,
and verified at runtime.




https://lore.kernel.org/linux-bluetooth/20261110175334.676816-1-piyus@iiitd=
.ac.in/T/#t

On the security@kernel.org point: you are right, and I withdraw the
claim. Posting it to the public list ended any embargo, so this is an
ordinary bug report and should be handled as one. I have not copied
security@kernel.org on v2 and will not pursue it there.

Thanks and regards,
Piyus Kedia
Kapil Vaswani


On Tue, Nov 10, 2026 at 8:41=E2=80=AFPM Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
>
> Hi Piyus,
>
> On Mon, Nov 9, 2026 at 11:57=E2=80=AFPM Piyus Kedia <piyus@iiitd.ac.in> w=
rote:
> > diff --git a/net/bluetooth/eir.c b/net/bluetooth/eir.c
> >
> > --- a/net/bluetooth/eir.c
> >
> > +++ b/net/bluetooth/eir.c
> >
> > @@ -300,6 +300,16 @@ u8 eir_create_adv_data(struct hci_dev *hdev, u8 in=
stance, u8 *ptr, u8 size)
> >
> >
> >
> >  skip_flags:
> >
> >      if (adv) {
> >
> > +        /* The instance's length was validated against max_adv_len()
> >
> > +         * when it was set, and max_adv_len() depends on a controller
> >
> > +         * capability that is re-read on every bring-up - so by now it
> >
> > +         * can be larger than the caller's buffer. Refuse rather than
> >
> > +         * overflow; a truncated AD structure would not be parseable
> >
> > +         * by a peer anyway.
> >
> > +         */
> >
> > +        if (ad_len + adv->adv_data_len > size)
> >
> > +            return 0;
> >
> > +
>
> We probably need to unregister the advertising instances if the
> controller changes its max size.
>
> >          memcpy(ptr, adv->adv_data, adv->adv_data_len);
> >
> >          ad_len +=3D adv->adv_data_len;
> >
> >          ptr +=3D adv->adv_data_len;
> >
> > @@ -342,7 +352,7 @@ static u8 create_default_scan_rsp(struct hci_dev *h=
dev, u8 *ptr)
> >
> >      return eir_append_local_name(hdev, ptr, scan_rsp_len);
> >
> >  }
> >
> >
> >
> > -u8 eir_create_scan_rsp(struct hci_dev *hdev, u8 instance, u8 *ptr)
> >
> > +u8 eir_create_scan_rsp(struct hci_dev *hdev, u8 instance, u8 *ptr, u8 =
size)
> >
> >  {
> >
> >      struct adv_info *adv;
> >
> >      u8 scan_rsp_len =3D 0;
> >
> > @@ -357,6 +367,10 @@ u8 eir_create_scan_rsp(struct hci_dev *hdev, u8 in=
stance, u8 *ptr)
> >
> >      if ((adv->flags & MGMT_ADV_FLAG_APPEARANCE) && hdev->appearance)
> >
> >          scan_rsp_len =3D eir_append_appearance(hdev, ptr, scan_rsp_len=
);
> >
> >
> >
> > +    /* See the matching check in eir_create_adv_data(). */
> >
> > +    if (scan_rsp_len + adv->scan_rsp_len > size)
> >
> > +        return 0;
> >
> > +
> >
> >      memcpy(&ptr[scan_rsp_len], adv->scan_rsp_data, adv->scan_rsp_len);
> >
> >
> >
> >      scan_rsp_len +=3D adv->scan_rsp_len;
> >
> > diff --git a/net/bluetooth/eir.h b/net/bluetooth/eir.h
> >
> > --- a/net/bluetooth/eir.h
> >
> > +++ b/net/bluetooth/eir.h
> >
> > @@ -10,7 +10,7 @@
> >
> >  void eir_create(struct hci_dev *hdev, u8 *data);
> >
> >
> >
> >  u8 eir_create_adv_data(struct hci_dev *hdev, u8 instance, u8 *ptr, u8 =
size);
> >
> > -u8 eir_create_scan_rsp(struct hci_dev *hdev, u8 instance, u8 *ptr);
> >
> > +u8 eir_create_scan_rsp(struct hci_dev *hdev, u8 instance, u8 *ptr, u8 =
size);
> >
> >  u8 eir_create_per_adv_data(struct hci_dev *hdev, u8 instance, u8 *ptr)=
;
> >
> >
> >
> >  u8 eir_append_local_name(struct hci_dev *hdev, u8 *eir, u8 ad_len);
> >
> > diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
> >
> > --- a/net/bluetooth/hci_sync.c
> >
> > +++ b/net/bluetooth/hci_sync.c
> >
> > @@ -1563,7 +1563,8 @@ static int hci_set_ext_scan_rsp_data_sync(struct =
hci_dev *hdev, u8 instance)
> >
> >          }
> >
> >      }
> >
> >
> >
> > -    len =3D eir_create_scan_rsp(hdev, instance, pdu->data);
> >
> > +    len =3D eir_create_scan_rsp(hdev, instance, pdu->data,
> >
> > +                  HCI_MAX_EXT_AD_LENGTH);
>
> Ditto
>
> >
> >
> >      pdu->handle =3D adv ? adv->handle : instance;
> >
> >      pdu->length =3D len;
> >
> > @@ -1609,7 +1610,7 @@ static int __hci_set_scan_rsp_data_sync(struct hc=
i_dev *hdev, u8 instance)
> >
> >      if (instance)
> >
> >          hci_dev_lock(hdev);
> >
> >
> >
> > -    len =3D eir_create_scan_rsp(hdev, instance, cp.data);
> >
> > +    len =3D eir_create_scan_rsp(hdev, instance, cp.data, sizeof(cp.dat=
a));
>
> Ditto.
>
> >
> >
> >      if (instance)
> >
> >          hci_dev_unlock(hdev);
>
> Next time, send it as a proper patch, so CI can pick it up and Sashiko
> can analyze the changes. Also, and also address the claims about it
> being material to security@kernel.org don't hold anymore since you
> just published it to linux-bluetooth.
