Received: from mail-qv2-f9.google.com (mail-qv2-f9.google.com [74.125.230.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABF9374E40
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 03:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789185579; cv=pass; b=LaHo2ge2hDc5g/9iF2Fi47dy576KR0Un+lwPly/rgoxbwGWboRsV9aVYfWMu0k6vrnURYgJ4h9Mq525GXTWdaD1kG51TBDCxsG+CoZdijOPl3g+Zn4Ojiic5F7AIDLcOQX/FRCaxaNBOJh4T6TkEAu7PIAgaZAmTdSQHPn9BPoo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789185579; c=relaxed/simple;
	bh=BkL3lGBHwiEi97Q6sw1wqPYNFpmHLpnVSD+N4L8TFo0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XKQt89wZoKxL0BYySeybbAVh/CnFa7BytkA/xriUGcMEdv98QzFN+JXvhCp8o3TZ138qxEJh+6O3Eei1KSZXGXFgGSEHV3Yzu++1mwX37ZXppg9A9fet6qhnee7jnkMx8D0R/7OmUv/wlo3ZAsZRTXqpVXGLb6vg8wdt+CByaZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AUi99WX2; arc=pass smtp.client-ip=74.125.230.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AUi99WX2"
Received: by mail-qv2-f9.google.com with SMTP id 6a1803df08f44-91033ce28ceso6982996d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 20:59:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789185577; cv=none;
        d=google.com; s=arc-20260327;
        b=U7Q7lfwR+T64ptSHQK1MMbRWPwBTgOaGruoVcRbLEeIqa4SvsnXKF/i7eDIs2cDDEZ
         fy3pM+8vIZduLBASvh627VI6qpdbyeYCTjjNcrW5SAJL1Mbf2iEVeDLAvFqtV19ln8+W
         Dimv8jNjVWxjmYOBjY/ohzdavcD52WdZ8DFoyYywZMTEksVJt7qUKYMPROB+bdwJl2sO
         /dnBuzcNy6P8BDH5wl5DwYCZe5pFNYbK0OMrWXIurl3pmz1LOjM4SI2DGRxGkRAfqcVU
         dHZKX9XGtybpXviG6SxQvWgHmIRSosODFIMyu9qOBjgr6Ez2eMrBKVDfGdE/P3WbIDT9
         c/qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BkL3lGBHwiEi97Q6sw1wqPYNFpmHLpnVSD+N4L8TFo0=;
        fh=wGzPE0HoPMWz+G92yjz0pEQkrdG05MPWLCJ9OR6bm/E=;
        b=AcNGrhedE/QzVl3o2o5EhQKWda0cM+Ra6tudM/TBdB5J4o+ew493uUpkm4mQKVc/7s
         Bghy/KdHd6xBk4bNogQN2GbKaI4nuE0pQv/NPa4A/PQKwozokue8d1+HqrACu4+47F7k
         RfE/rhnO92wd+hFwlVMGDDagEV75IRkGp3F7aKDlfYANVf5iK7g9homAuNghiprLKBix
         NYnKIkcX2JUtYaKTvhSbb0k30j0hLKcPc9ESyYalNZbMU7vLGAznhIF2Kzc/GaA2Pydt
         tjLTEXlfYJ51uqlMBQna/gLVfOAPvvU4RCRDLt2dd1eNDtAANPunYNNAXZ3GFcAXBRDr
         ZLOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789185577; x=1789790377; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BkL3lGBHwiEi97Q6sw1wqPYNFpmHLpnVSD+N4L8TFo0=;
        b=AUi99WX2mjCEnh94Mgz8UyqQU/oNEA9cIEKZBdzKT+z8ihWUMzk831dQkI3koNvu9G
         FOXv9hL+LCMEPxf/E6B6X3tqNMNit0enH6a996hZjF9P1W9Ca9u/JogjBROhVSBVKuKe
         i1ZglNYBRcPU+heleoHDLB4sNQG/UeUlV3ciG1mn4mte93xJ1PyBBaGWQo9SW/MmOyUE
         E2GuwCGaztMXULuWO9e3gDAe+xNSNVCpMSpRBjuIJOXYQi9Lt395uXUGN7PpUrH06Wk6
         hST40P8ADAOoVPLsm4F0dumn5utDUM8S2/msBC6ownOQBTLYS6vL4zC5VkaFucosXqdX
         tFxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789185577; x=1789790377;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BkL3lGBHwiEi97Q6sw1wqPYNFpmHLpnVSD+N4L8TFo0=;
        b=HahM+i9JigeWTwRi+8n9HfdfkFh6IBEbfmYGipcB+kzgQVXMayL+ffa0zaK4SV+qef
         EaCS02qI4USoFEXc2pXzyft0B4snULv36qQSAKUeXNGhdm4KCb7K7nilWqqTSTpT6+4j
         bS7CZhL4bTwYUVJHKEAyZrMpyMCk4nhDQlSEU045igq6zAAfzRKkMU3t0rma8OawIdbd
         LzwwByAYT7MRR98DLz1CoTF/m4WcHwEEIWX0VMsm86DgoHKdM/fp0z1eADyVJ273TTih
         aTdqWArp0U1p+w+Wl6cmi0KZnpxhalnCV4muYPcM+jxkV5jU176ikujfNUFXfJFSnzzu
         h/gQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+Eg4iXt87rUtpoqugupau6Zwp0vKyY2ZiDERmIodDzAmINKnHEjHsVMIR7U5oNWpYqlhW3CynusGOBII=@vger.kernel.org
X-Gm-Message-State: AFuF++nzvokTtesLqTXuxH7IP8zg1MwoucaMH9B0lHZtJ2eXCExmiiyJ
	ptGPsa8sC1MCFfsgr+Eeh5UQhkfxKOU1Wb34Y8q3pyL8lcKIQ4+aDMTKo4scW6whVb2xFdMZ56Z
	RhOrFe1xG1thr0/563kdPxDIlb9WwmyM=
X-Gm-Gg: AYBFou28+fRiUTFKWTRIQ7h1h4Ce+Fpui1Biih38j9z2H8+Z5oyud2gSYB9amVqJklv
	+e1FlBlwm7YENtkKHDcXf4moEQTQRBuAdPGB4ujW10L/2QevbWbo6Re/1HB30q3vGCAv3POOB3m
	Efr+2lLvke4VQX4IpntPuFMgd6iJqkFnAiWueFmf/wxmUuU33EJXFLsoaJ0VVpO5zjKhTvk/lAM
	y2XE/8gcScKoIq2hjDCTMucLCwc1iIHAZr7jdO6/Yg6WwTjDZqhHdq7ZuAK4vnPdfuxMmNY4u/X
	E3Z4Zb1jp+CH74U4dS6bZCYSyTq2Ksa1NBbzS5YpXJY9w21cOoD4UUWq349UHc52KwBtBubUMd2
	xNp2rc3L9GbaDKR7GFUPbgTSwsuJ/1N4g9oFeen9h
X-Received: by 2002:a05:6214:8446:b0:912:15a8:bd9f with SMTP id
 6a1803df08f44-91215a8ec1dmr55956796d6.7.1789185576987; Fri, 11 Sep 2026
 20:59:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908152808.3928630-1-arnd@kernel.org> <20260908152808.3928630-4-arnd@kernel.org>
 <CADkSEUjYhRk-ezaXZkHzFTFQnySFSisKtZfEP-_NtLnQF+6-1Q@mail.gmail.com>
 <aqRI3N5FPX1dpIlk@gmail.com> <CADkSEUgkPyikkhqLBOVEeS-H8L7CvUN8VD88=dUuTeFB8pUM5w@mail.gmail.com>
In-Reply-To: <CADkSEUgkPyikkhqLBOVEeS-H8L7CvUN8VD88=dUuTeFB8pUM5w@mail.gmail.com>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Fri, 11 Sep 2026 20:59:26 -0700
X-Gm-Features: AcwNN1VfZ_rXL-z6In5wMRJEgOMU7kPx8LknulegWooIebA5av8sYgSMw6by5S0
Message-ID: <CADkSEUhpe5sX=C5NfUrFMoP9fOGNiFaJ5QmEAVJ=80p8H8S9HQ@mail.gmail.com>
Subject: Re: [PATCH 03/13] ARM: remove riscpc
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Drew Fustini <fustini@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Stefan Agner <stefan@agner.ch>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kristoffer Ericson <kristoffer.ericson@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Alexander Sverdlin <alexander.sverdlin@siemens.com>, Shawn Guo <shawnguo@kernel.org>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Nicolas Pitre <npitre@baylibre.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org, 
	Ian Molton <spyro@f2s.com>, Jens Axboe <axboe@kernel.dk>, Helge Deller <deller@gmx.de>, 
	Thomas Zimmermann <tzimmermann@suse.de>, "Paul E. McKenney" <paulmck@kernel.org>, linux-block@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Karl,

On Fri, Sep 11, 2026 at 7:08=E2=80=AFPM Ethan Nelson-Moore
<enelsonmoore@gmail.com> wrote:
> The Risc PC and NetWinder lost their audio drivers when OSS was
> removed in commit 727dede0ba8afbd8d19116d39f2ae8d19d00033d. RMK was
> working on an ALSA driver for the NetWinder but never finished it
> (IIRC it is in 2.6.0-rmk2 but probably doesn't work).

I just remembered someone wrote an ALSA driver that works on the ISA
card version of the WaveArtist, which would probably be easy to get to
work on the NetWinder:
https://lore.kernel.org/all/1440445816-28593-1-git-send-email-linux@rainbow=
-software.org/

Ethan
