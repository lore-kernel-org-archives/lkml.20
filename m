Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794207816;
	b=KhF2poCbjiA98YriFRbbYC2Bp1i8lJxJ/9UlNUsdK9hOv4wJ6/OgFVYyrso1gPzc1qHc
	 zIIOSgwZ7gW/1ZNy78BJrh/KVtF1b/to67DNs31syVJLj4K15B1S7hnxc12ItYeBf+//q
	 UhJX5s1prXRLhZ2pKkdBElxdIAPceYWoJZsOjQoFl7z27vEJU/MNV8mZZgu9xlmkk4d3m
	 i33ZJT6tldks5QkstRIn3BxfcZ40XnYTdy6MffcWGHtO+No2KD2tpqWPhgTWymO92FXHV
	 87iSNUEddIdK+WaTXnP6EQ8MUJwF5RaXsRpptW0IOtQLtPvKgXjh/n8etOLrCYK0GqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794207816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eHkCRfwYbfVaOSn1Fu1U3NToRAfPEzPZvJ+JjBhFGsE=;
	b=HpOMq8Z4LZ86zIWbLToxVaQGrSr7wKYVcHt8kwiGoudUDZ5JWBDNXMaDaqtcp7YNBgum
	 vubIwAwSjxEVMHYUjd0ME+0IVqhUugHUQyKWUzPzwMDuf9z1P9foZ0M9zgOSLBtYfEr/4
	 MZ7W+eiRFFenO7PUx0YxO9MvjqK5aBOjytB1F5VduDgJ0LZETdjnpGsFzwZcNm7D+1EyV
	 s+eFuTqyAkTx+TEWNdUVM1FXdMMUtDxePImfI2W1+so3ZGvmtdN5tOz7B+NCKmUC0my4R
	 ljvTPR6lMuVEUhA09IABfMoYpS5W0F5QqOg425jaVXF73gq7Bee3staTHu23ev3GQmw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tu5dqDuO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D411F606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 07:03:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D411F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tu5dqDuO
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b3653df740so377607b3.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 23:03:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794207815; cv=none;
        d=google.com; s=arc-20260327;
        b=Ho2yJCjAJgpHPO5eim4aGFAnHz8FQNEULCCYV3NRrc+V0M2eWG7yQhZxNhPoHmsmHK
         paICnZ30snPYaRGp9JuJy8Kcz8joNRhhh96heXozLZ4n/2WOTXsMdg4XjNUZLhjioBLS
         fNHcoEzyaRiOQS13SFYxA0pKo/YtPGZRTwEMeSyHwDeajxKmXOT3yEzJgoXC1eUPcqIK
         OurmfsnJSkPFQXdk/r3pJ9QLcUJ+HVJLTE7yo43b0NBnDxYFM+G3I4tcDxWyEfBuEZ1F
         rQDfMlXde6jj4YvWiWq1dM4YfYvug0MrUV/a18dRe6c00T2ixBTdafdA12WHt6Ym2rTW
         pNoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eHkCRfwYbfVaOSn1Fu1U3NToRAfPEzPZvJ+JjBhFGsE=;
        fh=puSbLOwFgrr/wKZycTaNB1TQ444RO2fi0DqWsWeArDo=;
        b=NTLrIEQ1JfxnHH7Cf1HZ9qPbYhYcbdqJHMeeBBrWxi/D2OMtrjBFSaIh8EhEFMiqKY
         dGIb/h75IN63Pog240JxAAFOj1RmN8Q8X7yQ9dMmqcMySe0Eqh4ARNKq6HU330w6075Q
         ZzTGAptaarN7JyhwpluohjTIVtdOxPZlaQEVuvJKctBUrn1ruk/F92js15Vm9W2/3JxR
         uDc0NMiNlkvleNLVmUM1oBpHn3BNs53ZL2Ahy2kcslBuuVWaBkS8aTBq5i3YA0+VZBFy
         q+NdJ0Pf7Qt3YcGw4WuvREzy9oSaeydb4Xr1DNQXts1mxbQ+39Aih+pVh19orpIoNj3K
         Plwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794207815; x=1794812615; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eHkCRfwYbfVaOSn1Fu1U3NToRAfPEzPZvJ+JjBhFGsE=;
        b=tu5dqDuOEbrBz14lFIEeiwU6TsjPrUS44yqFCMW3UfvV+yAOy6HbEEaLkZldFTuD52
         IpKZfC8ZFSn4yzvqA5M9caLL6SmVxQym6tOS9/v84WKHTlkIOoQjHU6upPAsojv7amvB
         k9TLUZqKl7thhrsZzhWGIn+19SS7yTXLweZrSXfZ829xA7dLIlbpT2F57GmNUpBogAh+
         LTFLfelaBL+Ihc8DwQK7Elf+GpUFssuxsRtYEOpOZTAxNCNUyKmHWBzSAM53UDeeUQ+J
         IkmSyhmr4abYaKrZCAEX/0IIihZIU0/us/1NGAYQk7cdViCf7M7cAU8GNv/LTCbVS6Km
         U9pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794207815; x=1794812615;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eHkCRfwYbfVaOSn1Fu1U3NToRAfPEzPZvJ+JjBhFGsE=;
        b=VEuuFjVPzqUfnUCRcFljMkwPq+bp0DElfjPbf6CQHA010I9n7wWXHAPxaViCHvjfE7
         Orbi/i+aM9WVuOPSNpY0x7+H0vV+WoduaGtFzU7f7QTk/MqotnjIvXhKs5xyQj/m2cph
         9QfPKK2EazyePKDog9xfHXhtuIMblVYFteYGqpxCcrv8poEH0ciwcin3OylqFcUE32/K
         5aGC2t+CZA7LOexMyk/1pQ1FldRlZ0dFXB3Fh/WuBuIZmWd0w5mMYxgWIzM4qypWxI+d
         YP9fAdqIMb3mIcdq9pS1eNgXvGD7Wqul+Tkf7SiJ6cIFBCbW9+9PXq7eJyg5JXBdpy77
         n29g==
X-Forwarded-Encrypted: i=1; AL+hErGC/ZOKhw8t8VY8zSG0Swl+6HZojJBY52EHCYj/9f3l+nRTSIJ510otgqdgS3sIpswm4WubcMjDoeKJ2Nc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WpNuy/GoEyNGfxIcqoexoCoXMdaz+hyEnKxpU4PPhXCdjKMjR
	I4HcGVpay6qAO+gBMFRmrAHeCj48S3R9LEuIpC6QU7ETG0ZmyaEEQmXaKiEevDaYnFr0O0FFN0Q
	dJIae24G9LhsAR+AJqiIxGIT+76QO8Hk=
X-Gm-Gg: AYBFou0E2vDQo7DuwCstJEYzVH+ORqcRJ5PV6La331mApyYMI0fMJepLPlUiQyfBTR5
	/xhHKPmDbMJD/BrLF+rQ2XuO3/8MC3xIVVnwhGeOll/YZ8k55TWvJZPzTXEX9Za0zulYS9Mu6iU
	IigOzzor+d90AMY7gt6lsuHznRH+qOw6AQx9fpOQevIlIeu+Zm++Sz2fkFhXQxFeJLWbDH4q75u
	xOjlYP4nWlgr42R3pC5w+LUt0Yk1ek3PPJJegQnV73ErBHcNwZ2PG96z5TdXgSJuMraZQdckvYS
	Ovt2BYLbhU0oDwRMch9uRD+3/LlObuQCYvoX7AJds7Wt8Q9zZ8+R16xDBzHHddN0VJNGBrVcuiL
	P1YtmQ4Tb3545RmFHu9da896emqpQP7aCRK95gIo97J0d/edNHTw+V4NmTSg0IuUPoXxhepwNOH
	2tvR7LNnClhxtnkjy7YidColi/BKFZ8kmuX0br6ytP348yZww88MsbyzyD78d4K/y8fn9MbK9Sx
	VauSHOSHGSQEobUcRZEUZLYxvzjSyrO85UcN9QdAfgQ4KAz+oY1PmjBcU0CsQ==
X-Received: by 2002:a05:690c:660c:b0:8ae:87e7:9ab8 with SMTP id
 00721157ae682-8b36cc76c39mr19329247b3.67.1794207814910; Sun, 08 Nov 2026
 23:03:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108122840.85622-1-lamemorupisi12@gmail.com>
In-Reply-To: <20261108122840.85622-1-lamemorupisi12@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 9 Nov 2026 09:02:58 +0200
X-Gm-Features: AclHuK8X-gGg83Rocy9patxQxAua7aQBhheDPf_NlOZbCapPhnChNHY7jAPPHQE
Message-ID: <CAHp75Vf4FFLvGCZ8PxwLXDuv9GNAC3Pw0ud=KCdgdsQnbs6AKw@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Fix block comment formatting
To: Lame Morupisi <lamemorupisi12@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	andy@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 2:29=E2=80=AFPM Lame Morupisi <lamemorupisi12@gmail.=
com> wrote:
>
> Align the multiline comment describing the MIPI frame memory
> layout with the kernel coding style.
>
> Move the opening comment delimiter to its own line and align
> the subsequent lines consistently. This is a formatting-only
> change and does not affect driver functionality.

It's most likely one of the very first patches to LKML by you. See my
comments below.

...

> +       /*
> +        * a frame represented in memory: () - optional; data - payload w=
ords.

While at it, make it consistent with the requirement for multi-line
comments, id est start the sentence with a capital letter.

> +        * addr         0       1       2       3       4       5       6=
       7:
> +        * first        SOF     (SOL)   PACK_H  data    data    data    d=
ata    data
> +        *              data    data    data    data    data    data    d=
ata    data
> +        *              ...
> +        *              data    data    0       0       0       0       0=
       0
> +        * second       (EOL)   (SOL)   PACK_H  data    data    data    d=
ata    data
> +        *              data    data    data    data    data    data    d=
ata    data
> +        *              ...
> +        *              data    data    0       0       0       0       0=
       0
> +        * ...
> +        * last         (EOL)   EOF     0       0       0       0       0=
       0
> +        *
> +        * Embedded lines are regular lines stored before the first and a=
fter
> +        * payload lines.
>         */


--=20
With Best Regards,
Andy Shevchenko
