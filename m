Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B72B2AF00
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 00:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792195551; cv=pass; b=ZXGC+qRSgLjLL1DmhSyEKGIy6EWMfEPOP0TqG+nLiqm4Jo4TFJmaFYLGbJWYHXv4WeH5CC+auPq9zx4izj40U6bzMyeNjMuOg6jEQcLe+hMFBcQv0QaAuxRx2ePVn/P7P5E+yZ+Hp3VMYPVZ+0ar8O9xT5kO/Byr8hTlLRHdsWc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792195551; c=relaxed/simple;
	bh=7sGdRH+GOCeIbPggafCtteXnjrkYq313LLWRk0dNvSs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WytKvnth8fCmqCFHAiBX9bKF1InH3E52E+wnshC9uRXnLtJ7gfQLYPYeEUiA3vBCz7UFw9fV0zdzD2yPV51sFIb3biRPRRtzk6KUPY7Yv1ZDPKresNvYqfN3b7sGw6kcuOD1aymcp5kI9++ocyettN1+3ggDu/SgPPv3LySkpOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g94BXGzc; arc=pass smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g94BXGzc"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-91b813ac020so7357716d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:05:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792195549; cv=none;
        d=google.com; s=arc-20260327;
        b=P8HQigclh+lG7rMt+Hv2hopsDLhlNyT1LfpEIy2ACmfDvCSKP80nWCLuVwUa1OedkW
         I7DI2pP9vBw9wbyjFmg2+tn07mQsJ+xs1w996pC6XKC6zgWhRki7fN6FFoMoPRi6kWh7
         qO2lETf4pO+7a72bHit6uBLET+UpkUTRX/1H2zks3YMNLlJhvL6Bz9k6kwB+xWPVZepW
         e+08ngvlXa3xGKwhGLZlCnx89Aq6/7TBMW+9ajvS1mmD5qDqUf79cQGCAsL6gIdSqb4C
         4Q64wrYuzimir0gUrAXBCj4+OToulf3ZDOk2QbHMDyArvZ22vqsoQWeRfHx30t3C+IXf
         ZdCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cSA7UZw2c3bTiGnVzwM29+KWNJ0lb+yekyy+zeNvwcQ=;
        fh=92Knn6u+6LA80WnPVKv/whHODjDjkGf+NHgWtsb4La4=;
        b=ehaMiLayUWpCMJJ6+QwADvyRf7zdgERyyWNNoT4NugUsng8MJZj979+pe8gCB5pucu
         VQ7qwfjd11rnUNOf65GzzYgyZtHTIke8zNKOw67r7+t4Wbfcv62JxMCD4KrPvqI+3veZ
         UkUjrxyoRBKhtg94m9oCm40HWIXEYU8dldwtDiKr4JAFPxz9QeoodWGE4TV9b6XxI315
         nxNiR5ax2tRnXJTGxo0KF6I2wL98DBhgXxYCQLJyQFEHAEKdEj5qALG1xeyqpm0q1iAm
         2eaWDFwiYTvdsy4mfhAY/ELvbgicCqbNH2RYoD447WFyCvPTWpNzQpdmEk3yC/RzPC6P
         ltsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792195549; x=1792800349; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cSA7UZw2c3bTiGnVzwM29+KWNJ0lb+yekyy+zeNvwcQ=;
        b=g94BXGzcUfM5/h0F5vseQpt2i9AG2qoz3PGxqBRBXzYVaNnvbThmks0kglshNXu0iC
         qFBIrP47o0JcQv2WBGCxyhsgIVMKETdpA9435HpOr9H0bLvQSslijfOaSLnSNk3AZduL
         K5z3UEXoztI8TJ8Db72ydvIjep1do7WrSC24e19pnPlSYoAVFjbY7ZxLLW0+KGIAZJ+H
         r2YM5TrLbAXa5tce7qyhdpnwWao0Kybsy/fOn/9GAWgaePO3zcpFf2BLwCr/vk/L9cg5
         aNuyG/uqEdEuUCz9fEJ2P705DXOilz3JAtfNgHhA3zEy/H78xSsULVhnFLhNy1GjekEQ
         72wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792195549; x=1792800349;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cSA7UZw2c3bTiGnVzwM29+KWNJ0lb+yekyy+zeNvwcQ=;
        b=eoazLMG3aLp2Qm/kt34QeAKoOSU3ke9v+97vRftJ6VGVphORfPscZtVytTkq8+5sUD
         z1vn2S+IsXTP5lESmiMFzVjbjCgMIZ+LKZSGpZe22n/14IGdig56xsRPY8P3e+VL4pGK
         pTJqXb/l+dHK5kdXtz2kEnAOSLEzTdtTym4ona5jGKbDcsAoDXoaROtAtEYWLK56O9yq
         YB2rn9DZtr8V0ImrksMJy/MqvXwECas99ICUuUOVEwpojoohoBzUenMYwer87RYF9WRC
         5FpIcBkGZ/IgmcUtjNIQIMnMjiWGZsAI6SOgEowdS1/WYO/WvELLuSX6GDZXeK7+HMO2
         5smA==
X-Forwarded-Encrypted: i=1; AKwUvByL5p91DgvVmIU6/ot7JEHCPGKL+/RyYTi9zI/YeXnpJxReou7LxKTHUH3clp9MnantSrbCWMs3aAg9gDI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGeF9vWhLab4M3lb72/TJpVd08cSNrQSuvI5lhOA6oVDHFRHCU
	ZSYUxSCYyadxpVrxOmo8b17UkavV39b9pYFeqlbE9hFfFroEGKrFf9BUcSDic0mOWp5Q4oMBhfB
	4dyUXCb1oLyzjIMopyAjprxuuGe8ui8o=
X-Gm-Gg: AYBFou2e8qGNprUpVb6VOeMId3gsJjlRcBrvakt82tEIelAg5+geba7EeuAo1KNvCCa
	WkqcaBVqPnExFbtlVd/QQ9n5JxuhaMOHq64EKfR5Lj8JYuyWTgxQNh84cdehJxQPrk66ZhLaRdu
	fBWrORQk5otAwwyS4Pid+XDD9nQgr573TG7b2q4/xP6ZF7wKKa1RMBxZQ18AZHILnQr74VfOwrO
	F/MQPPaxdjsrrWmqtjT+apCeoTwYCJr78z+ODcEVHl2GyLpkfQyaNy5hjHIjgsDg0K4KQrPa5rl
	XP9hs+G62hUq9QVjmisTSvn3GB4K71HmOvQjlwuQKmJoNDC9Zc/TrlM=
X-Received: by 2002:a05:6214:509d:b0:917:9915:1f76 with SMTP id
 6a1803df08f44-91bdf0a8018mr27071886d6.30.1792195549268; Fri, 16 Oct 2026
 17:05:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <579o8so3-09o3-o312-4sq0-0qp6n672q46p@xreary.bet>
 <20260927041138.4112920-1-jinmo44.yang@gmail.com> <20260927041138.4112920-2-jinmo44.yang@gmail.com>
In-Reply-To: <20260927041138.4112920-2-jinmo44.yang@gmail.com>
From: Jason Gerecke <killertofu@gmail.com>
Date: Fri, 16 Oct 2026 17:05:36 -0700
X-Gm-Features: AclHuK95QwdgfqCpzXo3U6esCMQ8q2bJI473RTvTkZWxw9RndnhzLiH1N68nFXk
Message-ID: <CANRwn3TMAhhsL8J43ROhNbFzp-wdin84L_+J42AD8Qrz6wKLHw@mail.gmail.com>
Subject: Re: [PATCH 1/5] HID: wacom: check the input device in the shared
 report helpers
To: Jinmo Yang <jinmo44.yang@gmail.com>
Cc: ping.cheng@wacom.com, jason.gerecke@wacom.com, jikos@kernel.org, 
	bentiss@kernel.org, dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 26, 2026 at 9:12=E2=80=AFPM Jinmo Yang <jinmo44.yang@gmail.com>=
 wrote:
>
> wacom_report_numbered_buttons() and wacom_wac_finger_count_touches() are
> reached from several report handlers and use the input device they are
> given without checking it.
>
> Both can see a NULL input device on a fully successful probe. The report
> handler is selected by features.type from the id table, while the three
> input devices are allocated from what the report descriptor declares.
> When wacom_setup_{pen,touch,pad}_input_capabilities() returns -ENODEV,
> wacom_setup_inputs() frees that input device, sets the pointer to NULL
> and still returns 0 - the "no pen in use on this interface" case.
> wacom_wac_irq() then still routes reports to a handler that passes the
> NULL pointer down.
>
> Reproduced on linux-next 20260925 (x86_64, KASAN) from one /dev/uhid
> device plus a single UHID_INPUT2 write:
>
>   BUG: KASAN: null-ptr-deref in range [0x290-0x297]
>   RIP: 0010:wacom_report_numbered_buttons+0x37/0x210
>    wacom_intuos_irq+0x29e/0x3300
>    wacom_wac_irq+0x1b59/0xb3f0
>    wacom_raw_event+0x68f/0xb60
>    __hid_input_report+0x398/0x4d0
>    uhid_char_write+0xa99/0xfc0
>
> Check the pointer in both helpers, following the convention the driver
> already uses in wacom_tpc_irq() and wacom_wac_pad_event().
>
> Fixes: 10059cdc0ad0 ("Input: wacom - split out the pad device for Intuos/=
Cintiq")
> Fixes: 2a6cdbdd4cc0 ("HID: wacom: Introduce new 'touch_input' device")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jinmo Yang <jinmo44.yang@gmail.com>
> ---
>  drivers/hid/wacom_wac.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
> index c4cd87b781c4..177a1e09fd05 100644
> --- a/drivers/hid/wacom_wac.c
> +++ b/drivers/hid/wacom_wac.c
> @@ -1263,6 +1263,9 @@ static int wacom_wac_finger_count_touches(struct wa=
com_wac *wacom)
>         int count =3D 0;
>         int i;
>
> +       if (!input)
> +               return 0;
> +

Checks like this are for an unusual error condition so a dev_warn_once
or hid_warn_once before returning is suggested. I could even see an
argument for removing the device if these conditions are encountered,
but that's probably too extreme. In general, each of the places that
you perform this check should be updated with such a warning (in this
and other patches).

Jason (she/they)
---
Now instead of four in the eights place /
you=E2=80=99ve got three, =E2=80=98Cause you added one  /
(That is to say, eight) to the two,     /
But you can=E2=80=99t take seven from three,    /
So you look at the sixty-fours....


>         if (!touch_max)
>                 return 0;
>
> @@ -4226,9 +4229,14 @@ static void wacom_update_led(struct wacom *wacom, =
int button_count, int mask,
>  static void wacom_report_numbered_buttons(struct input_dev *input_dev,
>                                 int button_count, int mask)
>  {
> -       struct wacom *wacom =3D input_get_drvdata(input_dev);
> +       struct wacom *wacom;
>         int i;
>
> +       if (!input_dev)
> +               return;
> +
> +       wacom =3D input_get_drvdata(input_dev);
> +
>         for (i =3D 0; i < wacom->led.count; i++)
>                 wacom_update_led(wacom,  button_count, mask, i);
>
> --
> 2.53.0
>
>
