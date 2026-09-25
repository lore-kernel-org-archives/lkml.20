Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE914E1C7C
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790351782; cv=pass; b=V0u42kQi4ORzocY/uxAaF+Ddz7Wdg1lTdKvPCBI3jyhcwetnZ7Y8AO8gLd2yn2TOeOFIdlTplUrLtE8pFRJgqCHRBmyTg2DPaj9165Wf1KrNx8+BOIsNS6dB7R72FMk0sNP87lpjj7Eqrv4Ces1AFQPA5NbtD5PwS6iS92DPV34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790351782; c=relaxed/simple;
	bh=/Yq6ssAxz6CKB1eGF9+G1y7JmSA8F7XGVo2zPJmQTSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GoPpHkKQ+6V//CiK3nnRX4wwCM8Q3/Zl9FtldcDx4z9GAhHLWEBL+LsTBRRDtGah+3qjQqIWHfRRmZe4tU2Dwki0cBM1HQSNAE88bxK+vgNnt0xrMNnKGIFrKaNfPLAP1BRKncorN4cx4Xzmpj2XQ79XcOeFScRdfomxuPYl3eM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iaRw+Bmk; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iaRw+Bmk"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8eb15037aso250727e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:56:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790351778; cv=none;
        d=google.com; s=arc-20260327;
        b=c0P0i/Mk6qOe4IozVtjvYPojqDBuQmm3WSypOAri14AtPy/JUtu97V5gaqE/zpOoRh
         poAFX/p1lL8UEqzb0zgrTHgHIM7KhXGvsCFnft1Pa5gXdsBIIeN8jr/BZzoXbmoFBRhx
         YFro70WQahq59405AVaWqlgEJWNr1oKh4fXIBEYg/22vyrZ7KBq7RYK4luml75h+sxhp
         WlDU3Z5ObPr9Z9npjU7yyz5U72WW8KohjAacl++HPA1gVqjTZpC2htf4bSiLjBAcTgGP
         Iu20IVis8FMz17FNAnWzXG5pUgAGUCrs/dbuoJZ4z69GiVrZeq73hyu0x06Xy33e+sC3
         jjPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ddY66CtkaA0M8CqEHigGklMrMThtuWK6zHOkSid4+qs=;
        fh=Mk8NS/8Qz+QW/KuHEA3WqDYtgM/lhEZulHVOqQFLHZY=;
        b=O4bxibBUbKpNLVf1Or5IjrccYyfc1dDSFpNhXHBo3zxMME7dJDpBOLq9DpBo669/69
         zOxD/8LhGqLI1YZDTjdZH7X3RX+Q5GNaDMPWcyHa8OgwJGtiA0gmZl9u6iHimi/zNRBn
         OWHZ9quoNee8Rs+AyXwfXO/43iyQW1xvu1XPXuSBN9BH6654Q995qbjR8b9d9DFgRuxD
         nC45fHKWMfihAwhF+ERmedD0I1fFPjp0G+MxJu4b9QT85UDli3QZaoqptqvPmBtHASrS
         j/n2xxf4FgghKvObsJrDwNQJnp6L0FqwbcBhWXpwt1k9Mq/RXxHbnMFpQ0xY2/ZRMCVg
         CVIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790351778; x=1790956578; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ddY66CtkaA0M8CqEHigGklMrMThtuWK6zHOkSid4+qs=;
        b=iaRw+Bmk71MVrDd+X3vilG2kyZZZTM+2y1RXIWboNkF0GtfE1mVnC7AxKGvUU1r4a8
         ZC3VS+Kpzb7+GtEq5wHjU0+BzbDLDAo8MGnTt7V+ZHFhXmHc+I2spwm3yG017LSKkIEu
         mY8tdJxXU5qVB0730uFHz6yERVSxcQAdMqfDnk43r/OvOraPl6JgyjjfV5ieXeANjHei
         0I0WrXErCAc8QLyjEIsJTOQ1wBor1kG5qRGFjUj4Dl9MXX/zjstbsDq2AaLnP1oUOW0p
         pQvshuwVqVtax9aY+9a1KjCR42U5tV3bI7/FBvr1Q8u59s6ejc0Fkm3dDAJLPXQ8QobW
         bBDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351778; x=1790956578;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ddY66CtkaA0M8CqEHigGklMrMThtuWK6zHOkSid4+qs=;
        b=ttN2VxUsO6B3j3keIcoj1rbioLC/IRwSF8bCGlhFHwsaimGJMHu8behh5ushZ9F/J/
         Q+lu6DJ71ADCD47lVlXoVwHT9WRy/aLwYBvFhvWPkP5ohMU7iLRT706mZPEWy9+GwLx4
         OIED82ARkMFVgUJaunjCyOlOXJNN/0hADmgIyL7vo5jxKPOzuC2cOB2vj2fVrW+5JNZr
         SochhJk/xc4TXzGA7tR8+oIMlzoHs8OtsrG73/40ATj2hxb/0QDZl8Q36EgJmJ1Qjywd
         Z87xck6YpgygRkRqiok4bJYKYGL/u7yAhVOoP11730WcArsiOjEOpQqxdNjw/lKo75qe
         ckaw==
X-Forwarded-Encrypted: i=1; AKwUvByXAL2C+LNsA/cf/NDJS2XPtHCeXT521ERvWAaWjjq1SuzBDdYjTaW6cmH3YPMTYk+KtKMcErOs+0FuL5k=@vger.kernel.org
X-Gm-Message-State: AFuF++lR61ELC8tP6apmqNERr4FWK/fUFOpvjxPVgfFcYZGcOvh5lm/k
	xt/Lg/8fTfJ4fuvOgttDsZPCl9Vq5drR/+E+DqYiR5/w065zwhVmPJ3JJe78ZZnHksdqM+1nzxn
	nrcFue7KPMTNAYK3J+FKcC/axH2PbAso=
X-Gm-Gg: AYBFou0H3ztZBBdi18jMGAHt6K7dFxsGKNxzvV/nr3vLBrXh4t4Aw1yd29VEldXlrT1
	wrx5eb5lvcsYT2N45qGPZqHeXzqh6kCZ/QzWgYS/8xbyQrb28v7chcuAg1bApxq3vClaj6zWUqk
	end8pr8tX3Hl2w3OFLjfyZuB+AHTOrrUY7s9xXsCpj76u1LBUR22RSbqe5xebou4scO81RSHjQt
	rXomPLiLAcshWWzAG+qtSfoCLTR1M8M90bJWIHuAIqf+thjPLKT7hGttLzpP7UOMyNBLeMJf4be
	pTp3/vYlvRSvEEgeCB7q/dj0W+ENoDKzAf3+CAUOHoRFmMZqSq1G0M7CoK01sj9lJZp4lzB48AF
	64ALrOSA1lkWsNFjxOZ8Oq/ezUQUyW4y5rZADeApCgtY=
X-Received: by 2002:a05:6512:378e:10b0:5b8:de9f:85bc with SMTP id
 2adb3069b0e04-5b8df0a5e33mr1500287e87.9.1790351777608; Fri, 25 Sep 2026
 08:56:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-aw88166-cleanup-v1-0-11f74cb5fe28@gmail.com>
 <20260925-aw88166-cleanup-v1-1-11f74cb5fe28@gmail.com> <93d91d10-3d3c-4dae-bd5a-62a2f71458a0@sirena.org.uk>
In-Reply-To: <93d91d10-3d3c-4dae-bd5a-62a2f71458a0@sirena.org.uk>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Fri, 25 Sep 2026 10:56:05 -0500
X-Gm-Features: AclHuK-xI-6RJNKg4PG1csgl4tm5pZqrGjZAi2VlASaIfgtQu10tpFDPMugV-lg
Message-ID: <CALHNRZ-qO4p6Fa_4te5085Lv35_FftvSB4XDBQVhtoRNmXJhtw@mail.gmail.com>
Subject: Re: [PATCH 1/6] ASoC: codecs: aw88166: support changing sample rate
 and bit width
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Weidong Wang <wangweidong.a@awinic.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Val Packett <val@packett.cool>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 9:00=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Fri, Sep 25, 2026 at 02:47:29AM -0500, Aaron Kling via B4 Relay wrote:
>
> > The aw88166 driver only worked with 32-bit 48kHz streams so far due to
> > the lack of a proper PLL initialization sequence. Fix by selecting all
> > the necessary PLL settings based on what was passed to us by the
> > hw_params/set_fmt ops. This replaces the strange downstream routine
> > that tries two divider modes in sequence.
>
> > -     ret =3D regmap_read(aw_dev->regmap, AW88166_PLLCTRL2_REG, &reg_va=
l);
> > +     /* PLL divider must be used for 8/16/32 kHz modes */
> > +     ret =3D regmap_update_bits(aw_dev->regmap, AW88166_PLLCTRL1_REG,
> > +                     ~AW88166_CCO_MUX_MASK, aw88166->cco_mux_value);
>
> We seem to just completely drop all reference to PLLCTRL2 and switch
> over to PLLCTRL1, I'm going to guess that this means that something that
> used to work now no longer works...

To be honest, I only understand the audio handling at a high level.
This was copied from the aw88261 change almost entirely as-is, as
mentioned in the cover letter. I did some spot checks of the data
sheet to make sure changed addresses were the same and what I checked
did match the 88261 changes. But for the hardware specific stuff, I
unfortunately don't know. What I can say is that after this change,
the AYN Odin3 aw88166 firmware blob from the stock android image works
as-is, where-as before it required some binary patches to start a
stream. Implying that the firmware defaults to settings that didn't
match what the os was using.

> > +static int aw88166_hw_params(struct snd_pcm_substream *substream,
> > +     struct snd_pcm_hw_params *params,
> > +     struct snd_soc_dai *dai)
> > +{
> > +     struct snd_soc_component *component =3D dai->component;
> > +     struct aw88166 *aw88166 =3D snd_soc_component_get_drvdata(compone=
nt);
> > +
> > +     case 32:
> > +             aw88166->bck_value =3D AW88166_I2SBCK_64FS_VALUE;
> > +             break;
> > +     default:
> > +             dev_err(aw88166->aw_pa->dev, "unsupported physical bit wi=
dth %d\n",
> > +                     params_physical_width(params));
> > +             return -EINVAL;
> > +     }
> > +
> > +     return 0;
> > +}
>
> This doesn't touch the hardware, it just writes state so if hw_params()
> is called while things are powered up nothing is going to take effect
> until the next stream.

Mmm. As mentioned above, this copies another change, so if it's wrong,
there's more places that need fixed. If there's a better way to handle
this, I can certainly update this patch.

Aaron
