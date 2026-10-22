Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792659495;
	b=BVoZivfmAyJnMxF68PeJZc/czTXAvDEEFisSHDq/HYMiHjtwhoigVBoTAUykvBXCZQ3p
	 9mDLbfULVKvaAmMfKGHi9ySrlBRm/E/Ln3HvznmR3ma2ZFMzFgl/Ofj3GAqgyMyR/wRyp
	 AUGtd0hErlPEz0gsYdvBu/9W2hBO4HrS9vO8CJXJpLbc109kJQiTxbrbpIDq8Wv+HSP2t
	 GueGSJVOoWGT+zeIfi0fjc64ln5mUltCHL4VAYK8xVdaznUx/Cvv9XfHao6sRqLFP3Hc1
	 DlG3toHEMD7/9CIwtwj3oyuQkUrZM7Jup282+X452JaQ8WBmF0HdktYVuXWeh3J6QaA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=v+wlcYkDB8ezJtuz7qzvOJRV8C+V7tC9eEmc8KSVgsM=;
	b=1x1iPjL+lpkCCgQ1oTJ2pVt8AdnhIsQYRD68Q7TQUOs92huSo96HF15GcebEUKl93l3g
	 3yOXYxcOtxWksE8jKcgiD7IjkhrKTaFaeiN1XHo0sxaH8f6NkiQdSpm23rpDqMh57wwsw
	 tvaw5Rbu2+ns4Mi8GdIIA7XfmXu1nyRZeQ0ow5KLY53EoR1esE8tpW4wpj0GxEtln4fmx
	 WARYoOLyMljWcEG/UHm+6zMcWoJ6bIfCh9Bf1ZrPAlMMheKAHnmV/0MVmjacRpJH9Kqld
	 +f0ahoXWVvXrMBm3CaTgaMAeN+0JFomMO8d8SGI3uwPQ2RyOA9FzK2pWPahI3naQPtQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=j46CL9Fw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D03606A326
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:58:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48D03606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=j46CL9Fw
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8565d77c277so13981187b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:58:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792659494; cv=none;
        d=google.com; s=arc-20260327;
        b=U+6M+pOAwZKZEMjxtlI6AWvZrvopCRBQoCeuxCt8j/2NQ9U4+oMDoseuMW7TWOGWEB
         v6bTezPAA03TQfcPEtmbnHYC5zKgGs3hWTdalafc7n0ixtzVV+Nfc7b1FNBdp6oVrYk0
         k+EoF1Xa/xZWXgnabKqxH38FiJ4C02pjpHuBV3yBjHMghRuYNvDL3+H3X38rfsy0zAFN
         3f4xju/uOWFah43+oY6bE8WaD9Ca8yz2zAH66cDBPpbs4l+0psPfyyD96EVNkUNzmQT4
         u0ojH0se4pPKchlnPmZSOEHMhQaNoP5PgpJasOzzN1npvjdgvjZ4BHdC2QZD5eP42cZ5
         1TxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v+wlcYkDB8ezJtuz7qzvOJRV8C+V7tC9eEmc8KSVgsM=;
        fh=e7jM9C1g1Ei/dLqxfMryXSbLfmKfwePzVx0DKl2d2Tc=;
        b=n/jXBsvEXKg7nz/g7wESGjP6SoFj+u/bPxUO+KiqmLncasXsWrv/491aeclBT3YTZl
         aSO2xBWpz36M8fnYjZ+LQgogxhF4IRJFo0TNUp9pXXlKBFIQhOfc9lMk+r8j1eqT24X9
         RSkNRWHPjzXQL1peWe0HEpebbWVSIRaU8J1lRzpM0gr35/QlKqSf/rc7yk3eClm/D/ju
         0JnDqvFNL+iIaWoNnPWVJL8EFavVimW8GgArXElPZ/gBlADUalb/WaO4N2sQc5bHmAz0
         T5zggGRdXmqGPnXTlf546Aik/1JQoYfxGYxZ+BvkVS5nWSR6KoIURvlx90auwoh14C/w
         aOxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792659494; x=1793264294; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v+wlcYkDB8ezJtuz7qzvOJRV8C+V7tC9eEmc8KSVgsM=;
        b=j46CL9Fw8zbdsKHuhcujRyc4AB3iUusYFtX+i793vmnpNOP/UxMsuy4b/FSS7LO4Be
         0H74pNKwkiLOpQ0CJxgSV9evNii90K3n8JlGFbKuvdDaNew4vPLYrSORMHenmmrt0RbY
         F9LOHLrmVSn1YrHYDGEW+9lSm5yHBXUkkoCaNRTOiLYMIIaHHHJFGoncvdW9D0uWt38s
         RLhgVWDo90uD0dN0WxZmFjZnMT2AlhdRUR1kfacCcZfSmDgy05voFH5dGa12lyAzmpXj
         XeOMnpVswsUuJDPXfKTFAIH2kQHJCEBAq8YIHEctUVfOHXAw6cmabZjMvWx/qGskqHWw
         ksrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659494; x=1793264294;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v+wlcYkDB8ezJtuz7qzvOJRV8C+V7tC9eEmc8KSVgsM=;
        b=bod7dMj0biyj+Zyy9T6P+0q+U9t/LR8mVg8pL4sZWvVoHXLNIMDntqq7G3kYiyKDsu
         sRw3yqRSI+LoZyduEB3f0yTcPbERKDD4IMmy++buhyq3Dl0Zgd8Tgdubm61LMalJdPz9
         5vDJs43h6NaXWEFVE0a6bpbN05qznI/UkAa5i2Y5L9fZDBT5yFdm0rq88D+lWYikvT3+
         MsaG+gfCoPtQcdWnlfSfZdxH99qNND7ksGAkDyNbrpHQi+GJ3nH+WXSgkAr6/kHckzEL
         HOjThltQIyZKe64EsGwfJfnKNRP2R02aEBVhVPrRG57N8Ghaljj3Ry9hEUd3kxcIbt9a
         Dj/A==
X-Forwarded-Encrypted: i=1; AKwUvBz6nc8SL7eFKa/0OJW3MotsWqgmFDu0H7wC1oGUks/eSqGwBnTUUyGa4C/UU/qx4M1XMZLKF0PA9sROgVc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJajlXKKnFowCVNEivg2ArYtUxYtL68TSESw2Vdwujnyc9Ipbzk
	T6J39uDvavX1YfafZNt2cqxpC0wYnhIButr1FHp73TV0waOoxAp4A7xXrFTLRKukXKIKHP+A0xM
	Qoq5r+heo7z4AoBeX6thzssEXAIrMFIM=
X-Gm-Gg: AYBFou0uYXAUvd3+wUhVaFzgtTQXaSCwsBxgbdlvHX7UoKEtsm1RkcJwsDJV8s7KT1a
	+IRgP8uVYhBdrpaF59AQXqzlq87vnjIKxnpN50VE2rBX9WYJNQcZIJDCz/WbarOgVW7far9Qmgn
	i2YBcuVcsks4ZDEneEVHotMjNdDnKeQz9wV4gyZs5Neeky7UPQbAI4cTH3SPhM2x8gCiv8EpQ0T
	Uv6x3e9iRbQELAzEBE50fcIgzoQvkuFbKRrjkRKEHZAqn5dh331Qjwxc+NaLz2ygbVBh4Q/AlMr
	kEr7FuESpOQ1cTfuVl4W2Pj+zmCDiRVwze0pUbIt2wLS5qTi9C9N6bvi//JeM5+zHbeRyRfyiPH
	gi7PFn+s7hUMo/53fGCcg4Qm/cM8GPM5FtYfdHVyOF2Kjh8RXkk2R0wU7IAIS
X-Received: by 2002:a05:690c:fd5:b0:8b0:e13c:2870 with SMTP id
 00721157ae682-8b134178db5mr31027977b3.28.1792659494288; Thu, 22 Oct 2026
 01:58:14 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <pm-pmb-2439c851f82c443c3600-v4-9e7df0ea42c36afe6171@gmail.com> <87h5igix41.wl-tiwai@suse.de>
In-Reply-To: <87h5igix41.wl-tiwai@suse.de>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Thu, 22 Oct 2026 16:58:02 +0800
X-Gm-Features: AclHuK_53NLHLn_DC_3yQginArUaAMAdjmyV9fOzzaS6UQQkezfZDl5jh-MLCps
Message-ID: <CAFRLqsVe0JjW9VTbjBG9w00LFuQBxyK3CCjTnqaCXzcUPDCE4w@mail.gmail.com>
Subject: Re: [PATCH] ALSA: pcm: Drain proc writers before freeing preallocated buffers
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Takashi Iwai <tiwai@suse.de> =E4=BA=8E2026=E5=B9=B410=E6=9C=8820=E6=97=A5=
=E5=91=A8=E4=BA=8C 16:40=E5=86=99=E9=81=93=EF=BC=9A
>
> I believe a better fix is to handle the disconnection of procfs more
> properly.  The hda codec driver calls snd_device_disconnect() for each
> pcm, but in the PCM side, the procfs removal relies on the card level
> disconnection (snd_info_card_disconnect()).
>
> That is, something like below works instead?
>
>
> thanks,
>
> Takashi
>
> --- a/sound/core/pcm.c
> +++ b/sound/core/pcm.c
> @@ -1119,6 +1119,7 @@ static int snd_pcm_dev_disconnect(struct snd_device=
 *device)
>         for (cidx =3D 0; cidx < 2; cidx++) {
>                 if (pcm->streams[cidx].dev)
>                         snd_unregister_device(pcm->streams[cidx].dev);
> +               snd_pcm_stream_proc_done(&pcm->streams[cidx]);
>                 free_chmap(&pcm->streams[cidx]);
>         }
>         return 0;
>

Sorry for the delayed reply =E2=80=94 something came up to me over the past
few days.

Thanks for the review. Handling the proc entries at PCM disconnect
looks like a better approach.But I noticed two possible issues with
adding the call here: proc removal can invoke a prealloc release
callback that takes open_mutex, which is already held; freeing the
subtree also leaves pstr->oss.proc_entry pointing to freed storage
until final unregister.

I'll follow your approach, but perform proc rundown outside open_mutex
and retain the entry objects until final cleanup. I'll also prevent subsequ=
ent
card registration from republishing the disconnected entries.

Best regards,
Cen Zhang
