Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6E74C9E1E
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790009755; cv=pass; b=SVa5+92SIPg46zkg5kzhMHvElVOMSqACiJ66FPhj6al4w24EO0By5+HvQUnz31qFIbAHo4qYUSu3ft4WDJA32/mqzfmTmIwoq/Yv/bIF3A8XO4OYavoj0SvHiH0iP669Z8dTVMzxNQ/J5u6oE4GL3gAmbnOyG8r4GTsW8CmDIFI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790009755; c=relaxed/simple;
	bh=8CLaJmRDL+P7LtFb+x1VQBA5WVLV9B31rAcEE8OheA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YJ56fh0zmlDMip4Dg/l+tpyrU9M1JT2YfjanMA9I3tKfjtIopLSTtAVFz3hf0dtUGxSNmkU2loSf5oYtbYnrfKQualLFKxuIKKS9yRO46H1Wm27hLgbd7Y5y9Mfk5UBTtEw3gIlg8jMO39Nwc4hQG9YucVjND6Rgw2oiqxSMC7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iYiAH3+U; arc=pass smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iYiAH3+U"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a64c7cdb46so4858973a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:55:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790009751; cv=none;
        d=google.com; s=arc-20260327;
        b=iLntgh3zw0+1ueZeutykr5XQMgI7kfEkYYJ7dFW3xEL2YuLPEK7HJXAJBIa9wXmo8b
         JpdxlNzwIJLhccg6Zy27qB7Xelvnqt7iwdJmx+RgdFWhKVWU4yb3RfePc02TM3NNbFF4
         5NavqoIkSWwHRg0yt7bBMZuRVlrfmAd1kdhB7OmirwKwqnqnrClMCHxLHpuj8VxtFPPE
         NTbx5i03FXsU2GpRgPVFoRDKzvcTPMbniiU6K19+w4QvwCO8lHcSkdTo8pn/QUVXOvii
         8bH9YTYZ2MPAdK/VwK4oMPH2ckL1P7PwVNyel0HKy5GpFvhvDVvjYJ7s7DN9Ea3ImaW+
         SLBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pjCwpxCoWvLfQkK75JAuQLMO5x7s5tBUZgfd0L9YWqI=;
        fh=vMGsRmZKnhpIXI3ZwPMkUSIt4zggSRa4JM1x+kYlYbw=;
        b=RO2u/kN0KNJhZvf+5SPNccFXUZef4VxmiuqgfbOnSif5z4/Q//yqV5/QOH9bU67TX2
         tPJ2U9tm4iAzX/D5BdkGodbrvI5ceMqBRvaOb7hVNwa8K3bUAc2BAZNL65S5HRB8u/D9
         q1nX39q/lecDvGkzCYiLUyk8KLE9fW+mG3XgNoLmDqcdRpmcj4LWOrctmTH8bOvdsZbz
         PWiS2qt8m6hKbH2VhQOegiFU5MvSTduB54WRAn7UZSFF09u3+UlLPveM+H0v90kLT8HH
         7akoq/OfjzQ1fld//a73zY3rs7pnJJTfbRTZjORFousS/P62LXgn5f7xTjoCvJkhDmYi
         9Usw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790009751; x=1790614551; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pjCwpxCoWvLfQkK75JAuQLMO5x7s5tBUZgfd0L9YWqI=;
        b=iYiAH3+UNoqfKDV41kPfJ2OFMJyFBVZObdmfKAHysDvgy96lWA6F3HNhTFIK7Tngyq
         TapIaK8r8BJzqx0Gz1f6KaX/eB+a0KH7lOd0CUprdTfXCygDYuRHeVf6sIj5iE7pzX1q
         BC4HwuMuqwby0etOkv8i4/Owf2NFQ7osL7as5HUCKNMi1+PTWUp4WW78DEbySc1ke7KM
         rmV60wHJcaH9rCGpYAzBhaf9fKUQJ7qaG+qQiGh/xhQKqeNezDa9t8bCpFZDXe/09WS1
         f+jEin0HVle53WymCPwozlsEe8Tb9UUC1xbp9B0wn4GPYs/P76CNzr6b8dy+r3cEfVx1
         c9ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790009751; x=1790614551;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pjCwpxCoWvLfQkK75JAuQLMO5x7s5tBUZgfd0L9YWqI=;
        b=Cil/0TJKuDSMqXAEqVqA5ZpRPBBclmmjlyxqGiRKJTYWXBDWaeMQdolvJKOwFK7ffa
         3EJP2HTq+5W/Qq/NG0JhA4iYfsDVRRA+mqr1c0Q6XYo4LpjL9z3Ek6YLHbA+nU2KqJwg
         Gz0Lz7ZpaPQ8JqYWQeQPtYKoqOX1tSmDcuGM98pm8vbY4TtWn+QgO9+E0uFAtEVoxS56
         fvKJU2gatQ4j3QMp9BjzhBq71jcMBahoN+LsP2jUz1SZtbMefIkDW2opNuu+IN4y+ZYf
         34xxJYk6JshGo4zU0Gv5JLOKTRu78y/+/lTtkXrIPshzjYY4ub8UOVlQ7Orcf5CLpcCK
         eVLQ==
X-Forwarded-Encrypted: i=1; AKwUvByE7ck5wyIwVRhgeESjbHktGp4/Omt91YGKsBetg1O52cPpKPhyaOfBAOROTGiZuLYK9WY0+X4ek+Rma24=@vger.kernel.org
X-Gm-Message-State: AFuF++l2t/p/KA45weNbXId87EoCkZ++Uuwo75s9Pu3PZyl0HiQiU4gP
	nd9DlJ52VlcC6N0Ax47v67zqHI0Fyd5jInoSaefYciBHXDincn3ZzN0tqV5rir2mCcNzCR2BUot
	wMvbTA0qVIb1k2Gaz78+JHy3ERZDJhg==
X-Gm-Gg: AYBFou1MOHbHhWcAGdSwJO9jme1n5cn1KFjpUu9VPiepm0jjXH6IZq9i4ZcLgTBHrN7
	UxH/lm6uzjLCNabjQM/d2//dQqwuT86kmMS0kORt2Am/QC4kmmwS2lN/nAxcvoMGAwjq+KjxTyW
	yejLFRlJqbXnp4XQk8CRht8SToPPntzX0GlGdRsngqgMo9bopUE92d6hPR6y7ss7dR88t12rkO2
	q50oCecjNcI8epXHU3ammRRAn8oO6EOxyBIkqHTGmKV200R871P83LZA5W9NOb6FY3BsOTyMXlh
	Flq2e3spdraalIrepOSjTLU5kUFIofrWL/eUxX2rWOFmktTXMGM3GE5Z3DfFkSXViw==
X-Received: by 2002:a05:6402:a0d4:b0:6aa:1112:62fa with SMTP id
 4fb4d7f45d1cf-6aa564b7906mr7942434a12.4.1790009750844; Mon, 21 Sep 2026
 09:55:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921131728.8999-1-krishgulati7@gmail.com>
In-Reply-To: <20260921131728.8999-1-krishgulati7@gmail.com>
From: Raphael Briones <erph.briones27@gmail.com>
Date: Mon, 21 Sep 2026 11:55:39 -0500
X-Gm-Features: AcwNN1VFWuMt55Zi9QnVi4SWB3-BFp6BXM0z4d_fKbTqdiyOV3SCCQiQQtEVkmQ
Message-ID: <CABYdxMdHOJJjnoX_awwfVOyBvB-zREDM4q2SWgAVF+YT6FiMqQ@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda/realtek: Add mute LED quirk for HP Victus 15-fb2xxx
To: Krish Gulati <krishgulati7@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Zhang Heng <zhangheng@kylinos.cn>, 
	Eric Naim <dnaim@cachyos.org>, Damien Dagorn <damien.dagorn29@gmail.com>, 
	Kailang Yang <kailang@realtek.com>, =?UTF-8?Q?Habil_Eren_T=C3=BCrker?= <habilerenturker@hotmail.com>, 
	Bob Song <songxiebing@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krish,
Thanks for putting the patch together, and sorry for the late reply.

I applied it on my HP Victus Gaming Laptop 15-fb2xxx (ALC245,
subsystem ID 103c:8c2f) running kernel 7.2.6-1-cachyos, and the mute
LED now works correctly, both with the hardware mute key and when
toggling mute from the software mixer.

Tested-by: Raphael Briones <erph.briones27@gmail.com>


El lun, 21 sept 2026 a la(s) 8:18=E2=80=AFa.m., Krish Gulati
(krishgulati7@gmail.com) escribi=C3=B3:
>
> The HP Victus 15-fb2xxx (PCI SSID 103c:8c2f) with the ALC245 codec
> does not turn on the mute LED when audio is muted.
> Add a quirk entry to enable it.
>
> Reported-by: erph.briones27@gmail.com
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D221946
> Signed-off-by: Krish Gulati <krishgulati7@gmail.com>
> ---
>  sound/hda/codecs/realtek/alc269.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek=
/alc269.c
> index 5127a111c59c..617e2500505b 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -7603,6 +7603,7 @@ static const struct hda_quirk alc269_fixup_tbl[] =
=3D {
>         SND_PCI_QUIRK(0x103c, 0x8c17, "HP Spectre x360 2-in-1 Laptop 16-a=
a0xxx", ALC245_FIXUP_HP_SPECTRE_X360_16_AA0XXX),
>         SND_PCI_QUIRK(0x103c, 0x8c21, "HP Pavilion Plus Laptop 14-ey0XXX"=
, ALC245_FIXUP_HP_X360_MUTE_LEDS),
>         SND_PCI_QUIRK(0x103c, 0x8c2d, "HP Victus 15-fa1xxx (MB 8C2D)", AL=
C245_FIXUP_HP_MUTE_LED_COEFBIT),
> +       SND_PCI_QUIRK(0x103c, 0x8c2f, "HP Victus 15-fb2xxx", ALC245_FIXUP=
_HP_MUTE_LED_COEFBIT),
>         SND_PCI_QUIRK(0x103c, 0x8c30, "HP Victus 15-fb1xxx", ALC245_FIXUP=
_HP_MUTE_LED_COEFBIT),
>         SND_PCI_QUIRK(0x103c, 0x8c3f, "HP Victus 15-fa1xxx (MB 8C3F)", AL=
C245_FIXUP_HP_MUTE_LED_COEFBIT),
>         SND_PCI_QUIRK(0x103c, 0x8c46, "HP EliteBook 830 G11", ALC245_FIXU=
P_CS35L41_SPI_2_HP_GPIO_LED),
> --
> 2.55.0
>
