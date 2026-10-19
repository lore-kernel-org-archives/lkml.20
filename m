Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652D44F799F
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792417030; cv=none; b=D61+ybLd+6SXOV+wTwJyYFnUmjsCrXNywYawiJelX4ZEV+urQlCBsjLdXHPqMIWpAxXC4ZpXNF91PM435LrCJ6sDI80pImui3aDbOWP0698St/ygTZ2VAoDhJ3oSIol7wN7TPEHUSPlJnEGKmX0xR5jRg0Yn4y9nQGjH5lgaZao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792417030; c=relaxed/simple;
	bh=fwAYS3zcXGkdd+Ibq1n5HFY65n1XJA1GPMTC7CY2epw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jJfyyi86Wnhp37j/tKdT1sAqKBPVZH3yGOXKOQmmUZfSmD81aM4se9fpz/MKWruXRzCx5/SkKvKRXeFgN1hrVexOq4o89tya8WhFeNrGPumRLTv/iQ10kTKp+ym1ejDqvWEJdiV78eiSkZRFSA08+gFM9KvKTZnbX0V54VyOcjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=GRMVerAw; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="GRMVerAw"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b1ab2ad719so3088070a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1792417024; x=1793021824; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kc0HBa20pNgTgn9A/dNG9MRjR4EzrI7cz68avvggZvk=;
        b=GRMVerAwcSlBgQLJXCczlnCC2hPazNifPPo54m81DGcuQY7ikPldj5xjQXhXfjH3v+
         gSlmDnn2zVjexWn4H4KBbX2biJ0jf/GMVqK+YDwDvBHum+y4JdRyz8NQg1IJJK2npq5A
         uo+VHQYI/8/Y3Xe5TzKEMo/w/Iare/9WPQViP61JiVsVZTbco5GqofgHnH+ItR4OfnQp
         o6LRnLB0mI0Lfwq5FhL0fx7S/PS1SHb/p4abXOSlUM80UQqLjh9UBkKIBx4d6njqOHeg
         gZn/VJNZMu0J6SWhymnd6dtLLn0VBtCD6CDDVOND1YD1cr9PFG4tJJpGXNYclrUfvCd7
         L22w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417024; x=1793021824;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kc0HBa20pNgTgn9A/dNG9MRjR4EzrI7cz68avvggZvk=;
        b=xoVVkt8hmc2iF54VEOWr/ZlmGvpwY+IAaQgQNXIYT/hCuvRQr1BVhnXxd7f6CHL6wR
         a4BspFimdbQE84q/cCZPabiHZ/ElcvlV8muSC+INX8OSEIg7SCLnzzdeFpP9n7Fm5AAQ
         q5pKpySMxSLlBqFYhgH9P3XZfeIc5Ov9T6CYx0DWj5BduaWTQDWZt4w1yWXTIwNxLhhs
         Kxp6tgJlyeg35UrrMi1AsX//oh7dviUxq+TsWl13tYN87tj7bMpHdYEstr/sYR7u7NVM
         83YEdBqyam8/0sOtx7x9ax3jQmMvUOmC4ardupTp+oaLuSzl9CKrOnirheiOe5DL/Txi
         PuBg==
X-Forwarded-Encrypted: i=1; AKwUvBwWCfGCry8USeyZvt6gVpPYr3oSHHAdN0WFYBV47psXRALb4s+tdpi26aiMFunpvZODg/ZeUxuKcdXnXWw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdTyTsznTyFMThV38nj+rJB1vIXl4pYBvOwC45nCtfYf0yQuTv
	VK2twdlmJWiuW3OANTo9xkevdEFsvybAm6tKSjjYhyYXUbHaOnEQlLTQ/Dvq0TyUiYE=
X-Gm-Gg: AYBFou0COwHkgf24t8CedOSUNSJ0FJ/yjdjnsuTQJYFSvOuWA3S8iPAT2phl5BhNQCg
	7c9NmW8XzNpw3VIx3jx1DJO2p8ZYXXp5zbKaQxQNHaZPJurwJBH32+xdcefurJdQNbS5EnOGZC5
	wtIPKXZJNpvXetAm9zOhoQOrAfmK1XRhGvt6a7D9Vom2K+Ris8mMcg6zxhfdD8kz14vELyg9J4J
	llxyvyeVcqdf3blHOTr+oYycCsq/Gsq4gkd7vcl/QRGScffXKgw+BwVQf2Fpj4ftWnq2afY5K9/
	JV+E3n64zE3Fe7ilCP8WI6iZA60em/N9YCUW06UyYYSPE1MacTb5QTmjZ3qVE1SPZnKLD0KVZ3R
	kfGmdkNmXI6FS6BKuGmN1iN+gneS8blfcJT2hLDW9DuNis/HyjUY+5hl/V4wJVKiq7Ryfoma7kU
	4uOqkBFEVAdY+WjAwI8OHHVA4VYOKXj4TzTCybCo2PwTQM2wGm29Um4Mx/DYvesdAGPm5QwYHeS
	2Qb8vw=
X-Received: by 2002:a05:6402:5489:b0:6af:8a4b:7aad with SMTP id 4fb4d7f45d1cf-6b3a81a6d00mr4333695a12.28.1792417023411;
        Mon, 19 Oct 2026 06:37:03 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f5177sm22897379f8f.30.2026.10.19.06.36.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 06:37:01 -0700 (PDT)
Message-ID: <14f60932-9a85-45ee-ad87-593c20cc116b@tuxon.dev>
Date: Mon, 19 Oct 2026 16:36:57 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/11] ASoC: renesas: rz-ssi: Remove redundant component
 open callback
To: phucduc.bui@gmail.com, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 povik+lin@cutebit.org, Andrei Simion <andrei.simion@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Heiko Stuebner <heiko@sntech.de>
Cc: Kees Cook <kees@kernel.org>, Syed Saba Kareem <syed.sabakareem@amd.com>,
 wangdicheng <wangdicheng@kylinos.cn>,
 Chris Bainbridge <chris.bainbridge@gmail.com>,
 Linus Walleij <linusw@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Neo Chang <YLCHANG2@nuvoton.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 u.kleine-koenig@baylibre.com, Pengpeng Hou <pengpeng@iscas.ac.cn>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Hemanth Selam <hemanth.selam@gmail.com>,
 Md Shofiqul Islam <shofiqtest@gmail.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Zain Aboobacker <zainaboobacker33@gmail.com>,
 Sang-Heon Jeon <ekffu200098@gmail.com>, Bo Shen <voice.shen@atmel.com>,
 Vinod Koul <vkoul@kernel.org>, linux-sound@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 patches@opensource.cirrus.com, linuxppc-dev@lists.ozlabs.org,
 imx@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261016040946.521195-1-phucduc.bui@gmail.com>
 <20261016040946.521195-11-phucduc.bui@gmail.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20261016040946.521195-11-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/16/26 07:09, phucduc.bui@gmail.com wrote:
> From: bui duc phuc<phucduc.bui@gmail.com>
> 
> In DMA mode, the generic dmaengine PCM component already applies
> the integer PERIODS constraint in snd_dmaengine_pcm_open().
> 
> Since rz_ssi_pcm_open_dma() only applies this constraint, remove
> the redundant component .open callback.
> 
> Signed-off-by: bui duc phuc<phucduc.bui@gmail.com>

FTR:

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

