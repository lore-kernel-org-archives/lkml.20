Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1073BB661
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 11:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791287032; cv=pass; b=NtfdsVytSd7MQP6CL+PB8Nzjnm7xRQSdy/bBpdknJUUc0mr3rpr/rTOp0Jn5AaHNzLrLL0f3MVxDuROZA8NE4iWnKnQaxYPyPqbPcK2M38cENYK3rl5Lkp0Sia6sIvwjjSIguyLSFt3PbkOAeoBZYUX1bO1FKKVpc12zLr8uvj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791287032; c=relaxed/simple;
	bh=x3rZMdKi3vGTqXwDbjr6PJPvmHZfAQUVoS4iSMA9MB0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TH+V2O2wFFr3B6uOSO14fFQAL+Zux86eG5ojCMZ3nwQRN/WJGVMlEDo2q+316ka25w3if+II9hetgNxkcLjishpzO5odZh+dgTaCm0aoykYY0e7duFtUo+uKPNyg39VnWNMG6drQJsUQrfxI0ThwNpSR+FmduV2xkjxqYDYkrkc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lVS6Ld/A; arc=pass smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lVS6Ld/A"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so25914515e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 04:43:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791287029; cv=none;
        d=google.com; s=arc-20260327;
        b=MYxjxtrkktjRaUU2b5Dl1RprC1heTrSaTVjL7TbW6zXKpiv0UgRpHIP7rE58dDJHuB
         PG6/mNWl4Y4wSweWSBvbT8kBklmyWOvObxN5eiRbowe/uNm/CTbIo/DqqTBcM0gfBBF1
         PM7CR/X0xy+LRWbYbvENs39z/Ndv9Pw8YLHJAUM3dNyCGle0GSEAWze/cPHVHZ7aKv4Q
         /DpdYQ3KiKfpqJLFTqq88riwi4KfmyjtdepLex7GzCihimBiH19RwUciktqDAsJ+dBWK
         TH0tvdXhmhX2KGqtlv8MGZmYwhOEuCTvkqpLD36IHCluSlu+JjjfkUSFvHm8Mc27hDHa
         BwOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0IOK8vNrGs/AYi3igHXIRIEgzlu5V8i6x1q3/Az/h04=;
        fh=7VBUMjFiLnUuzayOI0acot9E+KsVkXbLEIaiGBBFxKg=;
        b=OYwom4GOURaKTyNWzNP5NBB5NtrsStNCUOpoMQ9fS/7HiWvao0QkzIwsb8yxCuN3O5
         Te7uRFzHD2fWUb9RG0awKgs3BbEix1/9lLdWnPBnxQiHzfIEYdj5WRSHZcxCxXJffSvW
         IoFzEI4/Sy/JAInxzVp0QAdP8NHAc9u8ze6jRNV6AsLKnhaKN8wozmr1JLLQK75dqNsi
         vuKOLZwBpuFWSkm4GHtVBkI2MfiFYC5GVw4VbknZqhOj4FFCObc2zQmgYr1Pbhxsj5Sr
         LL/Ercg3cWQ4Ccf5rKWfbbd2VPFRPx5DO1FjoSfZ7P/crYHkCKLxqSkmSgxEFkzoYanw
         KJyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791287029; x=1791891829; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0IOK8vNrGs/AYi3igHXIRIEgzlu5V8i6x1q3/Az/h04=;
        b=lVS6Ld/A+7Etdh5Ig9jEnV5cvxOl3AIKY03S5aXRvcWae1Ttb1+S5WFKNBikMH0eXd
         Gfratt2vdBCf7QylGUZg0oJ5HmwWFAI+uyxUQxIMcGqZt9qQG8e/R01G1Q1DfrGsGUA+
         a0svZqbDkEDYk4dbXFiDpmlbNtGyNFWvtl/fj4yHpgAG4WDgvzsw5zM9/rTozYEMCGdL
         UNqLkHeByNpAOTgF3pnLVrsoLkcGvwjU4UWAubh4NzQXt3zrMUEwnmmX/awfa3VUBfzW
         TfHXKHdEp434R9d+gvWhXDTdhYjmUQOP3hx7T9b5mO7qY0VG3pYjzs3dgSG2/UGmXF2X
         BCpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791287029; x=1791891829;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0IOK8vNrGs/AYi3igHXIRIEgzlu5V8i6x1q3/Az/h04=;
        b=hNkFLJ6LrHqmAwj3RgZGTP+P37/oWSC9ju/MidUa0iYxg5/pbQxNI9g034feVQtEjD
         Ojk7qgpj/VJL1CGbpX/pX194WFoyliav/I6tgmfEGNCCqM5dwHxeEWF04YyReNydK4Jm
         ZUbEMksScvxFLu5bmJuPMXipY60SyIF91ZnQT9nrrHmYEL2VmxLH+YzSP0Qj/aJ7pw6K
         tEZmDfA1DFMSD5MG7+Pk4oZwKJA/TDl/r+gT01ZoLQizgM3NXOZAOtrtbWeDCybp78TI
         8bBuux/VEF51sjtCOUEmorp1XYLFmF1VH5TsKoP/1SusR4NIFqKlh8plPIDRUDArJAtE
         /XMg==
X-Forwarded-Encrypted: i=1; AKwUvBw+3094ZW/ZUndkDbOOIVZ8pkEqm8Q6E66YFPS6rB9SG4C4dqf44VKi8bRmRSL6WuhOHfHDmIaPdNXiKv4=@vger.kernel.org
X-Gm-Message-State: AFuF++mxbM/QbUTj9EDirgUkJuLcC0PP5h2kVeSjUhDcwDcZNHWA7wi7
	qsYR53Y4IY35S3O1iHXEgjY3owKDZ066ladOO+tnOeiu67+V50fIL4tAMZaBXEHpUf5z1FfnshS
	w6GRBH4dswGT7VfvvgOS6jQ/DjgI1HB8=
X-Gm-Gg: AYBFou314UVvcs7CnKRutMNqDF1rig1QPxSyiv97DEnW9Ps45c/To1P2QHOmLXx4ZCs
	Xo2RlPYJS95Iaj2C1ZGuZrqwvmLTP9U3BsokHLyjYNBXtDlTtz/vF7f8IUFaPJjX98G4DN1Nz1E
	C7FTE6RBazr7+k2LBiCECwOxzj73UYYmTivCz+n1z24vhGvQU6yoY4AIxLCVc/xzeBK56ie4Nk7
	AYxVl3UavhIC/tWLFFKRrI0k3TP8P+0AL1I2pXuotldw3yIw3uPJJBMmiXCeLwkadY6snmPNZF7
	c3Nz+2PXfNOX5hF0SmdlrvEWw/qNzMfqquzOaGtTCcpIlAW/fY4nabGyJa2jWc0erK/oZulBmUr
	IusehBqnkmS2NO/W+RACx0XvtZ/Fn4wiLyj5H1rGHAtM/fTSBzlwGbcZ98Nidici5PiLQZP1kAa
	csnH+TPZw=
X-Received: by 2002:a05:600c:45c3:b0:4a0:2540:b46 with SMTP id
 5b1f17b1804b1-4a1680e5babmr175664345e9.12.1791287029030; Tue, 06 Oct 2026
 04:43:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-mali-c55-irq-supend-resume-v1-0-e3af34afff12@kernel.org>
In-Reply-To: <20260929-mali-c55-irq-supend-resume-v1-0-e3af34afff12@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 6 Oct 2026 12:43:23 +0100
X-Gm-Features: AclHuK8EEYHZRufa5Q70T_3oX3Ok7xh0rXwO38lzCRt9fe8SDgh9FN1A00CzUvk
Message-ID: <CA+V-a8sSaGYcMUpXhX+mr2C44zLj2Hgnwj4pQS1t5YrZN1ejqQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] media: mali-c55: Fix IRQ lifetime and wake handling
To: Linus Walleij <linusw@kernel.org>
Cc: Li Youhong <dayou5941@163.com>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Nayden Kanchev <nayden.kanchev@arm.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Tue, Sep 29, 2026 at 1:08=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> This is essentially my reply with the "proper fix" for:
> https://lore.kernel.org/linux-media/20260903025526.2657105-1-dayou5941@16=
3.com/
>
> Keep the Mali-C55 interrupt requested for the driver's lifetime instead
> of changing interrupt ownership along with the runtime power state.
> Synchronize and disable the IRQ before power-off, and enable it after
> power-on. Hold a PM reference until probe installs the IRQ, and stop
> runtime PM and drain the IRQ before removing the media entities.
>
> Allow platforms to mark the ISP as a wakeup source. Hold a runtime PM
> reference while IRQ wake is armed, resuming an idle ISP if needed and
> preserving an active ISP's configuration. Balance the reference on resume
> and failure. Hibernation still uses the power-down path.
>
> Wake events require a configured stream and an input that remains active
> during system sleep. The internal TPG shares the ISP's power state;
> external sensors and receivers need their own wake support. An idle
> pipeline is not started by this series. Hardware wake remains untested.
>
> The first patch extends the binding with the standard wakeup-source
> property. The second patch updates the driver IRQ and PM handling. The
> third patch retains ISP power while IRQ wake is armed.
>
> Tested on the Renesas RZ/V2H board with the other in-flight patches
> (DTS changes and the TPG enablement) doing full suspend/resume cycles
> with wakeup from RTC and NMI and capturing images before and
> after the test.
>
Can you please share the dependency patches or branch, as these don't
apply cleanly. I tried the latest 'next' and 'media/next' branches
with no luck.

Cheers,
Prabhakar

> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
> Linus Walleij (3):
>       dt-bindings: media: mali-c55: Allow wakeup source
>       media: mali-c55: Keep IRQ requested during suspend
>       media: mali-c55: Keep ISP powered while IRQ wake is armed
>
>  .../devicetree/bindings/media/arm,mali-c55.yaml    |  2 +
>  .../media/platform/arm/mali-c55/mali-c55-core.c    | 96 ++++++++++++++++=
+-----
>  2 files changed, 78 insertions(+), 20 deletions(-)
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20260918-mali-c55-irq-supend-resume-30b507a20011
>
> Best regards,
> --
> Linus Walleij <linusw@kernel.org>
>
>
