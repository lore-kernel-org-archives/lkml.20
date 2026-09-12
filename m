Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852D070830
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 01:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789175428; cv=pass; b=DysSey1vVyknxiu3Q89yL9wfKYmARLxSgfFND3MorUGqQ1v/feA/7abcj0eRWrkDJ5iLpnMtShIS7ZmEaEEEwpMieXH4+4nhsKYFEmxWUV2tBFfrbYdJPxSV+a+pS5/xr2dDY9iVsXtH1rOb2np1a0A+7w9I9kfCKNYgAHTWpmI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789175428; c=relaxed/simple;
	bh=JvgmADxtqm79vi3+L1vND5IB6+lcqu7Lgy8WrH4V1rM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tp2329YvdBcje134z/VDycggns7UgSTag9graIzBviRA/s2n9zgueexb+yyrjlSavFoF8oOhXKF66UbF2wiYBA2ip0KwuO3PTD/Ce3XLxvE2iYe7DcxeuVTslR6ddmpsH4PDIhgQMTy4DlTtPeX4ZhuAyMOxuqKPFVw8+5pDkPI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pUr3XX6x; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pUr3XX6x"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4aaf2ecfso135968d50.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:10:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789175426; cv=none;
        d=google.com; s=arc-20260327;
        b=YeWot5e9b1HsKe+ySk1MI74x4Rn4OFr6THI8hA7V3AU5WR7lj4XHRkA53IEn9UWPNt
         BjbsXXyZlQmY1Qres4m1TviG9oPnHcqw+wgbKm1LGsr8OukEozvhyVFf/tSjAMp3W2eM
         WKDeHfWiBXvKVC9HI2fZIwISccEMIUlvfmv6Y0lKUHOCtxmhOlMVe2IjFXcv4xcI6DBW
         QHAl1kEvQPZNHiyovS4uX8K+VR7wPv2IM8G7EX1at5M1L5XBq/ErGDyZWI8IjHmi5T6e
         hcDrbsX1jXNnATSUwjdtn780FKOR7ecdwH/Xq0BVRqt897zrCP8WAXgWl0dXUrzrcpsz
         EXIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZXx0sRtnKVpp4RBcl+M+AX/xvH16BRmJcRsmv15A+r8=;
        fh=6TyGVlZNmZVAiPIN6fP+a3jXHazW9fa/V5w7HuEmTFc=;
        b=gN+sc/3pGnP04Lb817obK51X+oRGiPe79shqO1ipbP2znC2oq0prB5bco7CYYKwf1R
         lRzbxvk0iIhBd7n2VJ3ert4FUljmJsZ6yk42aU7mnvCZzuHo+RsVk19gCBPeS8Q2xIl2
         /kHl2oMCFqybYQIoW718sebdczQr1muC87GzA4Iac6F3jmveg+NVvTaMGesg1qY4PD7J
         LPRTwgjPWmFyGgR5xhPzqxWDOleaGuXAPICbAgA97K09CZ0+cj/YFMsJOezCnU72Ssg4
         rplFpWAeZjLCj1Orwdzh5MlSfJY65vLs9z1IEbcvqU1W7qCTXRLAaJmMyfrtFD4AapT4
         ifBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789175426; x=1789780226; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZXx0sRtnKVpp4RBcl+M+AX/xvH16BRmJcRsmv15A+r8=;
        b=pUr3XX6xTjMVe1E2iCIC5HZQMBz648qPFxUt7OpLVcA7kifdtyCXxrVU1aTobUGyUY
         X9hAJb58VlK+BgZ9prKHOLawZpm/z0OmRaDPZ+V4NSiHjqyVgvf2WOabks3bZHTtAi6o
         rZcCTK0C2wXtiHJghmw5pifr/zu0Zcz68n2xz84J28fOv1JOffRLYb/UCCmkMyV8Ujpx
         Ln9JFnuP9wHykWhijoas9BZB+NILiuBvDTNS8FV4eNti5D16/ZfXtBA5najRdmtr3QCj
         xrL4zH1cq7CT9RgIfwri9mItC/NF9zxAlcDVaTyQUOQ/Ms38O20UBq0K9ycrN/NBVnfc
         zfew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789175426; x=1789780226;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZXx0sRtnKVpp4RBcl+M+AX/xvH16BRmJcRsmv15A+r8=;
        b=VgTe19BG50pIh2wMhkJTxbCEst95ifIRs0qPIbpEIqXzv12oa0h/6kgUIoy8K9jN2N
         6TsQ7Tbv5HYexfLsJApLRy7MQ4v5iJWnaIDw6rtEpFpSyLHsYYK4wwnm+DIdEmXLgjK3
         tYsIPO3lDlLZxIBrXGRKFr0sp4gkTh/e0S9bcVPSwUqooDWMJUIQShagPrdgk5QKCcEf
         TLMJmw14nk63lD6099Z7jj45IrbiclvSfszIfnWV0KmzPosBS5HUlnJjSdxKM4xuhufQ
         RD1AK2dGQAKGVZRjBbLO4VpKSUf9REZwJtEH2vn78eMlzI8RNNgvh9hZeRIToU/5YcP6
         kQcA==
X-Forwarded-Encrypted: i=1; AKwUvByiqcagSgFbzp39Vw1623wFzqKRwAwa+6/DG5wjooHnlcy1Nl00Baot5RK5rsI89pRXwwZ1pzyMgBp3zG8=@vger.kernel.org
X-Gm-Message-State: AFuF++nf1hqZzvYLg9XyDEnIVW9UvY68ygiVxQr5te26JTRl+x7QqC1g
	soO8uJshHal/1eXLJ39wireTA99KldxhaV0SJdv/6pbrFsCFVaJ1wc00NjZdaMzQ6Wh0VmZM0f5
	qVPNjBcFz0V6IJ0cYZXRfo0aAK0g5kyI=
X-Gm-Gg: AYBFou15hrJH4FCGSlpT1HGLocBbl1yURm+tBhw7b5sPCaETPQeB4MDcdHZhHm+wHJZ
	hbfOfDPNNEa5EvRzJ78jSGTO2F4yhL7IWn5blvEWtYjy10SvcaZ8YTF7AOCm8P45b6f00DFiEe1
	+0Ah/GGz+kKeXbDrXY1Tugw51+vQ++v/t+X+HYaiVG1vJZ1NYW/GT8/ivbuV05K1jkpT+JA3n42
	ZwGeP0k5z3SXlbQKV7QJq4NXSPXOFKnlGKTWTgzPlrDuXQV1sIGFp4Q2e8BVjxkVV2casHEc4qH
	uJhqBMIq61FHMPvOmgm6g1bUXxyosPwooZLYdE0njR+J+5z+SMP37qt/h9bWXsi6p05fE7vAYjE
	WT1z3U827FL31l91aY42vQTwKpEZoMoDdxNXY6esP726A
X-Received: by 2002:a05:690e:e89:b0:671:2eed:f70f with SMTP id
 956f58d0204a3-67135a5d1bdmr122851d50.80.1789175426402; Fri, 11 Sep 2026
 18:10:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821121220.13006-1-kartikey406@gmail.com>
In-Reply-To: <20260821121220.13006-1-kartikey406@gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Sat, 12 Sep 2026 06:40:14 +0530
X-Gm-Features: AcwNN1U9RkyNLzz4vVHls-7nZlLrzjOJk34j0pUokLY7L6h0NfcCetYb4ATKesg
Message-ID: <CADhLXY7xwBGOd04P3+W92HDivj3aztipzdeFaDg7zCOemAqyBQ@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: net2280: fix NULL pointer deref in usb_reinit_338x()
To: gregkh@linuxfoundation.org
Cc: kees@kernel.org, stern@rowland.harvard.edu, lgs201920130244@gmail.com, 
	balbi@ti.com, ribalda@kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+2ec7fc1793a63864d9d6@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2026 at 5:42=E2=80=AFPM Deepanshu Kartikey
<kartikey406@gmail.com> wrote:
>
> net2280_probe() only maps dev->llregs when the PLX_PCIE quirk bit is
> set. usb_reinit() dispatches to usb_reinit_338x() for any device that
> doesn't have PLX_LEGACY set, assuming such a device must have
> PLX_PCIE set (and thus llregs mapped). That assumption holds for
> every entry in the driver's pci_device_id table, but a forced driver
> bind (e.g. via sysfs bind/driver_override) can invoke probe() with
> quirks that have neither bit set, leaving llregs NULL and crashing
> in usb_reinit_338x() on the first readl().
>
> Reject probe() early when quirks has neither PLX_LEGACY nor
> PLX_PCIE set, instead of proceeding into a reinit path that assumes
> one of them is always present.
>
> Fixes: adc82f77bee3 ("usb: gadget: net2280: Add support for PLX USB338X")
> Reported-by: syzbot+2ec7fc1793a63864d9d6@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D2ec7fc1793a63864d9d6
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---
>  drivers/usb/gadget/udc/net2280.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/usb/gadget/udc/net2280.c b/drivers/usb/gadget/udc/ne=
t2280.c
> index 7c5f30cfd24d..02d12c2ad58b 100644
> --- a/drivers/usb/gadget/udc/net2280.c
> +++ b/drivers/usb/gadget/udc/net2280.c
> @@ -3708,6 +3708,17 @@ static int net2280_probe(struct pci_dev *pdev, con=
st struct pci_device_id *id)
>                 writel(0, &dev->usb->usbctl);
>         }
>
> +       /* usb_reinit() dispatches on PLX_LEGACY vs PLX_PCIE and assumes
> +        * every non-legacy chip has llregs mapped (PLX_PCIE branch above=
).
> +        * A forced/mismatched driver bind can hand us quirks that satisf=
y
> +        * neither, so refuse to proceed rather than dereference NULL.
> +        */
> +       if (!(dev->quirks & (PLX_LEGACY | PLX_PCIE))) {
> +               ep_err(dev, "unsupported device (quirks=3D%#lx)\n", dev->=
quirks);
> +               retval =3D -ENODEV;
> +               goto done;
> +       }
> +
>         usb_reset(dev);
>         usb_reinit(dev);
>
> --
> 2.43.0
>

Please let me know the status of this patch . is this rejected ?

Thanks

Deepanshu
