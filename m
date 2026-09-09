Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30ACE353A82
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 07:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788939523; cv=none; b=hazEny9QgERhoggCTfv2Fn6C7+3t7WCEEdf/qleYc0uTiDXAA2maiA7XwfThjxPku9Ti1DDntCQFC/uBhSBxzo7PCnkRWpc5lNanMf83CfIbnrbBoQiuw0tKyU8w2p4X6EhTD2nwvcfjPsQMq1p3LU8PNHVsYosACNdsPh+1BdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788939523; c=relaxed/simple;
	bh=oLrKovMvI6vEuEPm9DSdmFXguG3Eq58Sk5UpeIaY1ZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lSZegcOld/j/1SGrqm2/DwfBHtYyH6jyL7VQ6pMOtivRoh6dsOMoco50KszUElSlhxv7/MFoA7hLiz7zmEJ8uYgnkN1XvRMd8TD+sG4enDgTd1ZhLA0nnAq8A8Wuocdgis7JtJtoGZBLImVwJTwi/F5ZdiDaXVLl4R5ERQ++bWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c25b661d37dso793252666b.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 00:38:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788939519; x=1789544319;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jPhA4Ya5/PqW/e+rBC5ClbUaQ0FR7NY7rHjANc3fz2w=;
        b=GE414nRDV3oL73dymjeubPtaAdm2WTAP2uydVQlMWOOnsbXS2A5gpF3Vh2hiRyIfHQ
         7Hxiu1DFiLXvOcRP0A8eRBfyvEq6C/oAjtEcaR5yIqQ2EHjtwZw0fWEdOUq+An296MoK
         xm09dUKJLz3tKvCGMD7txS7Zh7iXxaF1TJqjCixtT3IJXPMkmJt1cdcURE4Mk8ZjjIz5
         nzvTJbi4rPWueNx8WURK6MCLRRwnOH/QWZn5BEdQ8/xugOK0ZQF7tNspp0HGyGiC/s2W
         uNHtkNqXcrkZBt58B6Q1Jwn0Qkyf0x5O3kBhOcE3GLWf5bz7EgQDBZkSHN3AqeDrPg5S
         lz0w==
X-Forwarded-Encrypted: i=1; AKwUvByRT9E69SDlQzQEBqe84uX2p5Rg7374reskssR49rMp6Low4wZYdMBZ6359rxWlcIds5u3ZiQRpy3eE2HU=@vger.kernel.org
X-Gm-Message-State: AFuF++lZTOlUCEA87RVioXwbmf7IFf0/if6RplwkuJNQ/YL1uhwGHjSN
	dYyiObb+wDNoLKwLU57Hl7wj33UN3LV/lkEpn1tXvfx8ptj4HSq+TMYR5Vr7ZxUVNOg=
X-Gm-Gg: AYBFou1qlLYYbiW/U9s8SY/LumU2Izftb8L2ePa/eP6Wzsyf/qzIXQGcTzapFkpiS0P
	if7PUdlbstMeAb9UlIDLVMaB4lCmf+L6ZraQ8bdJipWPfX2y8FfgrDekYVc09TNKuzDloifxdw9
	rOhaSLC0MtsXtMq7mfcnFMrssRKwjIOVW7I2zNg/933A5AsCQmksz7biZeEQIkOUge69XkdtMhw
	vhH46zFRtQciaQZ8zA4KtyGVO42DFvkJq56wKmWisXV/j13vwTcCZLYILftJXCfEtMY46iFQQbU
	IicpoIqJVSrxKAEbnZAsVGbH6S8up+tiFjyIwfOOY5xWW7lka6W8KcOdliT/8Ky6SbhEsCdPCiG
	kQD4HHewCNFNcagTFK0EdQVhNoS5hxYTIsxvzOdb6153NonF21knerTs3WWMUzwKnoRBBvpW/jD
	i8R3Aou+6YHc/RkrxwLIsl/JbaezwD7QvWhGARDdpZM8qCMgQVrq72xp9kSpnDdVJnFXrBOjazy
	mQ/FaPaDAi0/EA3A9TDDjQZ8oOrE0m9ZV45
X-Received: by 2002:a17:907:1c18:b0:c16:4e5:944a with SMTP id a640c23a62f3a-c260ca241admr1350424366b.21.1788939519164;
        Wed, 09 Sep 2026 00:38:39 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2939592a2bsm17456866b.62.2026.09.09.00.38.38
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 00:38:38 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a68279dd86so6915552a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 00:38:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxlFenBj9E/05r8DKfLI9aFdxzzWhPLdQGn1aqtRG5gpay0kCSwaCZUAwbC3oV6ZcW58M8EtQqkyU/G0h0=@vger.kernel.org
X-Received: by 2002:a05:6402:a0d9:b0:6a7:ee56:615c with SMTP id
 4fb4d7f45d1cf-6a7ee5662efmr10229032a12.30.1788939517892; Wed, 09 Sep 2026
 00:38:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260816153809.7067-1-jakovnovak30@gmail.com> <aoLCr8JEYaYxcJcQ@hovoldconsulting.com>
 <CAMuHMdU_Rx4ZGi9SsNxKUDyYmV-GbD8rD9NMVzYginBMXdZDMg@mail.gmail.com>
 <ap7CaVj82BJZgjf6@hovoldconsulting.com> <CAMuHMdX6JfqpLMGDQJSQ8E8XNobRwr16LOzuphPt3Afs-OZdJA@mail.gmail.com>
 <aqEDb0THnCM-Q_Vy@hovoldconsulting.com>
In-Reply-To: <aqEDb0THnCM-Q_Vy@hovoldconsulting.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 09:38:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWK8j200+Of062ghV1E7b0BYWsufEAop_4+3Bhmi0sxVQ@mail.gmail.com>
X-Gm-Features: AcwNN1XBeNCcZxFqMVOeNqjjdkhhsb3Z-uWNgAulmw7oFiph_1tBNYwccdZmiJY
Message-ID: <CAMuHMdWK8j200+Of062ghV1E7b0BYWsufEAop_4+3Bhmi0sxVQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: vub300: fix sleeping function call from invalid
 context in vub300_inactivity_timer_expired
To: Johan Hovold <johan@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>, Jakov Novak <jakovnovak30@gmail.com>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
	Guangshuo Li <lgs201920130244@gmail.com>, Runyu Xiao <runyu.xiao@seu.edu.cn>, 
	Shuah Khan <skhan@linuxfoundation.org>, 
	syzbot+1ee4f3b9228e35f14677@syzkaller.appspotmail.com, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

Hi Johan,

On Wed, 9 Sept 2026 at 08:57, Johan Hovold <johan@kernel.org> wrote:
> On Mon, Sep 07, 2026 at 04:48:00PM +0200, Geert Uytterhoeven wrote:
> > On Mon, 7 Sept 2026 at 15:55, Johan Hovold <johan@kernel.org> wrote:
> > > Sure, but should you be scheduling rescan work before all resources have
> > > been set up and the host has been registered?
> >
> > I would like to defer that question to the TMIO experts.
>
> Are they on CC?

Ulf was from the beginning; I had added Wolfram in my previous email.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
