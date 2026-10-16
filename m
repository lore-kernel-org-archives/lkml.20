Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6317A1E9B37
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792115583; cv=pass; b=V/TvRg/PIkT8s4Kp5WsdCKAjE8xsoXHnC2jM7nVkf9//t8nc+lxz2Hm7ucDto5bqJ8EOUdqJbjU16RWpK1hF4F5zLFBVXraffkgfWXm268jG+6/uA7spVd9So+KWhcN7RoGLEZsEuq2BiAGGvXMbBgw8nK0JyoPcKWEyGHJogcE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792115583; c=relaxed/simple;
	bh=Ia+9qnQFXuT7Qa703XqyFy/Lx1I20mduDC3TrKVaE04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tkQ2kvSQNd30IGgcnW1r95gxOqZ75xRLcePxqOSdKatwA24Cnnnqcah9UzTDLyanXV7aJjCLPTEpxbxYyDGiuDfP3Y0gFvsLMuIdEtcRmhArsT/etPpcs9XSf7ZPGXJJSBWIjMaJzbvuwIr0hdS9BKWNLllIE2zP5YleyYHy2OI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Op0eyiit; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Op0eyiit"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e987a2ba0cso1272175ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 18:53:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792115582; cv=none;
        d=google.com; s=arc-20260327;
        b=JnYlEUzfjyKOZpx+5lvq227oIQBU38DDoT0EmXtEdUfok23C5TSlzAGrG73l6Ea4Vl
         VU4YZXVCSsvxJvuFvcZhXthEyzAm24M1HUj7PTqRcyDEzLSus5rK5Yblj34mT1IP6u2x
         Noinheydc/X8lo5QrOG0EdCimDv74xPcKfU6J2cLCwXVnKOOwZsdvy+gxC0I2Ux1DP6n
         oRpDKMJv/dIWsHz6iPAIvZADAfikdpPHH3E9+d6SmNtT7wksfvbRmrRagLDG9+XNW1fY
         SOll46vlKwOoPkbDs0m+vF62vez5WpwZwofLtYISGbHv5QivTMZJifnqBuAOIxxwqk4Y
         tifA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QzWh/mXf6G5Fr5INTJvXRytqPL/zBujlCdMkS18GyKQ=;
        fh=Nqer1m5vhYXh/686MB2mgylTweVuSJgbVhbxNosj0z8=;
        b=Xf3zuIdO6+XzDvzRK05jncKae4/LD9wrYHt1IyrLzAlkmDN8g2KwI9n1CEsLyfJ2zI
         pF+nMUFw85mo1cK4lT68Xw2TwFhPtaDWx/hab2yE4Txn1xfent6IW9JHcXXFmilIdZ61
         hijAKqEonUEUqpMTh+14OY4A5xl19f2G4UdvQYVi50Qo9xAgR5ySnQhdHRG1FEg0oejN
         Ls0JusTRzFK0sNSLkvHrvHBc0Z96zFBWIld1DOth/g0ZBjivDc+kmUTY+WEnbKVR52Mz
         rWcd7i0vWumL6mPxt0jDxE4OvWD3ew9H1V+CwkYmalQi4uDdRMwii2gzdM9UOmndo3n7
         JNuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792115582; x=1792720382; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QzWh/mXf6G5Fr5INTJvXRytqPL/zBujlCdMkS18GyKQ=;
        b=Op0eyiitNEQ9ES47jArbONvej3eRBF5KjtydwZxPxVl1mc+bOWWPhdC05xKTeFLMmz
         q99SeUeotiGXJ8mNibarU/ufZeGdSwlcRc46/KvgrJUTPnns6FJhMcnUi/mI8AUDS1c4
         7HHqvb97Td8c1ys25ubxhuq8k0LNuGKCrYp6lyV2KkdlRu1k961YEQHQ3rGiowy9n3J3
         yxfMN8tAlTxVfrjuU7vIpsM8AxMPL0+iJfGuhxGrNgYBjZR2K9IqKYbCa8d4Oh+Duz0d
         IuU+lz6A5Gasr8oJ1NZInlII5/H8q4exLKfSXBg1A8r3Z23hqJtffW2lWJSVt1tU30XU
         vjyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792115582; x=1792720382;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QzWh/mXf6G5Fr5INTJvXRytqPL/zBujlCdMkS18GyKQ=;
        b=etbDpfALAsnvoGHrmk3MmkG/VV2/BHRhLpb96LDTZZGDMaxb8ovvMC0Vc554m940Ky
         O1NFOf8/fQpI0dDDxf6C5uUXnnpuxzvv34pyZdwdGzNB5ygk0Dt49yooyCjqKkKgwJlL
         H3YeTFQ/ypMRIDrmh9WNa3cHr4/B4eSW4ltI20Px4afaX8HFCTm0AgZbM1vLCr/7WRG/
         EMfiit90OmliTLul9337o+SjTq62+5qtAN3812Pgu22ORBf8VRIDsayb50o7wTufJAxc
         p+sexW4ElyZ7iXXojNripvqWXGaNUx0gbD0H8FmEA1ZfQg7BjfElkJrFxe5/Fw3x++7Y
         RNCA==
X-Forwarded-Encrypted: i=1; AKwUvBwZ0MdjdCaDT7uz7Y5tpHwJ49/TqeJXFm6bcViKl+SWu+N/G07y/pVNfO3csmXVHfCByR9r6LyKvZ+Ss3s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/HSfmYGAwS1q7izLLA9A271RVu9O5J6QRVbqMkLqJhhPTW6J2
	dobI0OmIgFohntWBwQyrsQmWDr8V2zfe7wDfGxdBfsvVLRhjcv4Z37eAoFrVJr5S6/RpJzHBHM3
	zmnPtF0EJn0iue23+0Gcca++10zJudog=
X-Gm-Gg: AYBFou0W5jZzLEagU8559ZdfHyjXFMdTIEpf8cULeuden7bfOXOLyBA30E1UAnPpYf6
	I+Cg1zCKmW3/CDSCycWt22AkTTch3XyosTfZwEIKs2394asRabUj68/tQcz0wE+UKMm3wCzijua
	xJTKvqtEXTcZTrnpDxSVlMNQiaJ3Q8+rgfPVpVhgCtAMDsQFiA/qC9aqwJsXVknUuxD5CfGUQYu
	GAX0J4GFHPUHBz4C6eAUyC8cUQgSJwZH+NWMCoVtD0HGGwnt0hpVLv17ITj20JShnBa3kdSor9J
	2lvv2RMQw6C6H78WSSQ6xKwk5yY1iqKBFU5hPBBZmXMavAhwHc1RT4hmRly0SaPeaj/skiKQpex
	Jqmvrqks197ejbqyNNsI7eN/7fcG1ZQp3WLNjM8ZY023Ai39g4k4jnlcnQHQkDCd9m/E=
X-Received: by 2002:a17:902:f641:b0:2e9:5714:608e with SMTP id
 d9443c01a7336-2e957148bb7mr48721225ad.49.1792115581670; Thu, 15 Oct 2026
 18:53:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015014324.5569-1-phucduc.bui@gmail.com> <ad722297-5ca5-42c5-a07e-59fa958387c1@sirena.org.uk>
In-Reply-To: <ad722297-5ca5-42c5-a07e-59fa958387c1@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 16 Oct 2026 08:52:48 +0700
X-Gm-Features: AclHuK85_RuY5Eq4148HpcAJND7CX_R3cPSTmudMqJuFIrc_MXHUz5ZN3dyw0W4
Message-ID: <CAABR9nGU0qW6iMadffrXw86a=ty=FVhw_Ypoa4rQtwOCbepVWg@mail.gmail.com>
Subject: Re: [PATCH v2 00/25] ASoC: Fix constraint return value handling
To: Mark Brown <broonie@kernel.org>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, povik+lin@cutebit.org, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrei Simion <andrei.simion@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, 
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Heiko Stuebner <heiko@sntech.de>, 
	Kees Cook <kees@kernel.org>, Syed Saba Kareem <syed.sabakareem@amd.com>, 
	wangdicheng <wangdicheng@kylinos.cn>, Chris Bainbridge <chris.bainbridge@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Neo Chang <YLCHANG2@nuvoton.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, u.kleine-koenig@baylibre.com, 
	Pengpeng Hou <pengpeng@iscas.ac.cn>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Hemanth Selam <hemanth.selam@gmail.com>, 
	Md Shofiqul Islam <shofiqtest@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Zain Aboobacker <zainaboobacker33@gmail.com>, Sang-Heon Jeon <ekffu200098@gmail.com>, 
	Bo Shen <voice.shen@atmel.com>, Vinod Koul <vkoul@kernel.org>, linux-sound@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	patches@opensource.cirrus.com, linuxppc-dev@lists.ozlabs.org, 
	imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

> > Changes in v2:
> >  - Add Reviewed-by tags from Vijendar Mukunda and Chancel Liu.
> >  - Remove redundant integer constraints already applied by
> >    snd_dmaengine_pcm_open().
>
> v1 was applied, please send incremental changes for the differences.

Thank you for applying v1.
I'll prepare and send the incremental changes soon.

Best regards,
Phuc
