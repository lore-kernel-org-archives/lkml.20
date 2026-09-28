Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E314C6521
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790597134; cv=none; b=ZKWxQEvurlXzwFPqbSMb0rnC38nU5PVpbkRLuHFoUGdGF7qZ9ZBeELXIxBrCe2y4c1h/CFeAtT+tXrfVXvD6EogN4vwARDSqOBAivekCjC8V12zSToOUCGBEZG3nVjByD006iMHCPxSteBt7PXlc8vnWN6hwK0SdBPnTFpeq8gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790597134; c=relaxed/simple;
	bh=MKBrTzS2l05J5l8I+d3SYuHXmGWOoVgXwUoJ9w/Tog0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IR6Vr4inmE8DuddjkJGa+MrYP/5QKZMoHmIAIDPi05TJswAS1Rsf/blU7qt3B8tGG5kpwTZRJXjzmoJfEvowkyq0gP1W85Xb0VOTVLcRLLOoo1ngGPSttrzKua3xKepA0gBxA3wjdY5BiV/+vq6Z5fPHXyTanvb84okqIq59ah0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=QyjeGAYr; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="QyjeGAYr"
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id CF6495E4A3
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:05:31 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id 1C7445E575
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:05:30 +0300 (EEST)
Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id E275E1FF9C3
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:05:28 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1790597129;
	bh=A4QsdSGLThMTI5MSElEpBJcEDDoMm01DSM1lmZ6XAuU=;
	h=Received:From:Subject:To;
	b=QyjeGAYrjo3ShYnUZdGYm7ZeaVUecLsB+hhb5d7AAPkBpGWMlXOx6pHyvPs2Cgmzz
	 bFw1cVKHbBqF4GuOKofGSuECHbM2jQOXFGsQHjwaL2DN1mAad9Gp6eciP73BQtp3hu
	 DeQbQcVA7GjaltZLfJulYWz/Wv5tUFMezCxxSnEKEiyXbrzmY2WM0cpiGQRnvdnnK4
	 HdIS2ix1Xm4w7GVR+vdSe69Aj9XX0hAEgD5bCHjmOtXILn0ns2j8Yd6sKkG6cSU/6R
	 N7EcitAO9cORPlUqZQdr2UURNxYZbGuDvSlGkW2Yo2YdKkXdSif93hPQTpjGdEouBn
	 VhTZfiDZ2RQbQ==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 74.125.227.168) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pj2-f40.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pj2-f40.google.com with SMTP id
 98e67ed59e1d1-3a0f64df6a6so659642a91.3
        for <linux-kernel@vger.kernel.org>;
 Mon, 28 Sep 2026 05:05:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBz5MaRtt68YecdVJE7rzepX604pvaG1wNvKx9J6kNWP1TqGzaGJ6UG53DtdoUf8xlp6GcI5/yT0W89XI98=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvz7OElNsfwpTdzqWVV9jsTIvwJfr9cl9D/aiUo6R4XR5ONSeY
	JAOOXJTugfedmpNVlj6Jc4qNhJLExOHUTPzMVPujIG+CSLvzhUFiiV+BEDQa9Hrlyoup0cchmUm
	dkzDqAo27c1/gUGv/rboQbYsRb2VEqzI=
X-Received: by 2002:a17:90b:5626:b0:39e:6c6a:657d with SMTP id
 98e67ed59e1d1-3a0bb658b37mr6667450a91.64.1790597127486; Mon, 28 Sep 2026
 05:05:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923121640.272509-1-zhangheng@kylinos.cn>
In-Reply-To: <20260923121640.272509-1-zhangheng@kylinos.cn>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Mon, 28 Sep 2026 14:05:15 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwH7r5vDBAB9k0FX9Pht9TdEaRfYmJg-Km73xX2-_Ws1ug@mail.gmail.com>
X-Gm-Features: AclHuK_1AHVnYP5CZHjdALXE4b3tsRMGbnzGG5b40QHRCU9DgVZ0Tgtdy4a8Ktw
Message-ID: 
 <CAGwozwH7r5vDBAB9k0FX9Pht9TdEaRfYmJg-Km73xX2-_Ws1ug@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda/realtek: Fix square wave output on ASUS Strix
 G615LR
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Baojun Xu <baojun.xu@ti.com>, Aleksei Arsenev <alesharik4@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <179059712915.2764341.7416536604109550422@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

On Wed, 23 Sept 2026 at 14:17, Zhang Heng <zhangheng@kylinos.cn> wrote:
>
> ASUS ROG Strix G16 G615LR (PCI SSID 1043:3f20) outputs a loud
> full-scale square wave from internal speakers since the TAS2781
> amplifier driver started loading. The quirk was using
> ALC287_FIXUP_TXNW2781_I2C which chains to the ThinkPad headset
> jack fixup, but this is an ASUS device that should use
> ALC287_FIXUP_TXNW2781_I2C_ASUS which chains to ALC294_FIXUP_ASUS_SPK
> for proper EAPD and pin configuration.
>
> Fixes: f7cede182c96 ("ALSA: hda/realtek: Add Asus quirk for TAS amplifiers")
> Cc: stable@vger.kernel.org
> Cc: Baojun Xu <baojun.xu@ti.com>
> Cc: Antheas Kapenekakis <lkml@antheas.dev>
> Reported-by: Aleksei Arsenev <alesharik4@gmail.com>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=222045
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
> ---
> Baojun, Antheas: several other ASUS Strix Gxx5 entries (0x3ee0, 0x3ef0,
> 0x3f00, 0x3f10, 0x3f30) are still using ALC287_FIXUP_TXNW2781_I2C (the
> non-ASUS variant that chains to the ThinkPad fixup). Could you check
> whether they also need to be changed to ALC287_FIXUP_TXNW2781_I2C_ASUS?
> Ideally with testing on the affected hardware if possible.

The current quirk is well received for the ally. Perhaps switching to
ASUS would be simpler but I do not think the device is currently
problematic. I will defer to Baojun

Antheas

> ---
>  sound/hda/codecs/realtek/alc269.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
> index 39dbd876bc1a..d70e03061c91 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -7964,7 +7964,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
>         SND_PCI_QUIRK(0x1043, 0x3ef0, "ASUS Strix G635LR_LW_LX", ALC287_FIXUP_TXNW2781_I2C),
>         SND_PCI_QUIRK(0x1043, 0x3f00, "ASUS Strix G815LH_LM_LP", ALC287_FIXUP_TXNW2781_I2C),
>         SND_PCI_QUIRK(0x1043, 0x3f10, "ASUS Strix G835LR_LW_LX", ALC287_FIXUP_TXNW2781_I2C),
> -       SND_PCI_QUIRK(0x1043, 0x3f20, "ASUS Strix G615LR_LW", ALC287_FIXUP_TXNW2781_I2C),
> +       SND_PCI_QUIRK(0x1043, 0x3f20, "ASUS Strix G615LR_LW", ALC287_FIXUP_TXNW2781_I2C_ASUS),
>         SND_PCI_QUIRK(0x1043, 0x3f30, "ASUS Strix G815LR_LW", ALC287_FIXUP_TXNW2781_I2C),
>         SND_PCI_QUIRK(0x1043, 0x3fd0, "ASUS B3605CVA", ALC245_FIXUP_CS35L41_SPI_2),
>         SND_PCI_QUIRK(0x1043, 0x3ff0, "ASUS B5405CVA", ALC245_FIXUP_CS35L41_SPI_2),
> --
> 2.25.1
>
>

