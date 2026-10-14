Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929D8549380
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791991350; cv=none; b=ehjGkimCpTwi155jjHUElK6QuOV46JfJdyQbp5RjR33cFWppdyDmH1j3xqR7UqHUXb3nHkt5/9HW2z+TMmdzsFEkVHKp+z51hU1V6Ja+LnXI0t5kbFYJSe6ZV1xu6p56nC+SHc7oowyEd6LuommyD97Y9f/gC+NeytrttabR0uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791991350; c=relaxed/simple;
	bh=OJYOG4YSV0pLaaOPEwxxy35lIjjZKUEA7jwt74Dr43o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p63UC9igGbGQmw0Pm6y3hRs6CZs2As3Scpoy4uWnKpSoUSUc6H+69/JAXoIVSw76EBQrH+HdVHRhRpoKQAg4qMBlKx1UFNcF2b0+u9NH2qJf6EmAJ8lwTO48SiLk1x8AHkHGNtOEJheTa19QGojFbl9eFX7aUnkI9VNSn6d9Tpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=C96xXxk/; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="C96xXxk/"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so38942255e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1791991346; x=1792596146; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Js2yXAKJLVFgb+YsCYrtsAgVcbxI+5CvJwak5knEqR8=;
        b=C96xXxk/84vzF3EfzCUuCljDOFx5esb7HRrDI+a7QeuB6T5LI/2JZ6fqtHZBskFRJQ
         ZQPfolcT+V84DFB7gc7MMb7fBjyJZZibOalRi2USNZjto3Xs/x/kMW9QyJ5BZNfqka1N
         JREiwkJ4UXKEIHlpClrLZ2lyic+giBI/tRi4nuld/TH+PKyzFQhcLnmWHpFCBTAb+0B1
         MHK6TlEcEJjxZrVFwO3nl6ufsit1daG1LxAJYuZ5I481bFuAdtkg5RnT1W6IdoVwKaVu
         zDpm4iKEJXIQGvJx9tn2CdoMEiP6QrMK+c7983spn7S9QcE2zyNOJwVhLczZsQBk3pks
         NNgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791991346; x=1792596146;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Js2yXAKJLVFgb+YsCYrtsAgVcbxI+5CvJwak5knEqR8=;
        b=RhQWtNLeqjjiSKI+iC1hkyxYM4R43nnVwcO6xr8YX+w1Ely/qnr9N9XkK/ADi/4w3l
         JOooB4SqKjuChY7FbJX0JfFZ5PaeG7vhHmG6aKQQgjxue8B6DUeeholgZoQxiA12Jyz+
         3pfVvPE2pcpyiAaajQEHqp8si0RqTfvlSxCQfv7CYmSXifcixACsXI0ptXq8dH4oXBAu
         wCdaJ2r/GNaZbUaJ2nxir8B7EC6gZLt4iBUOV0PrAxIzz2rxw98znqrlzADZEMyL2j8N
         wIAfFLnFvI+fZUHP6dRtPACU9q9Gsi5ZVtmaBPHhU6pKhNfNMYON4B/66cYFa3K1DcFx
         fR7w==
X-Forwarded-Encrypted: i=1; AKwUvBzb9mzC/vtx3dq/t+I3UfMHLfrgZ2+pSOm4af59M0OCosJ1mQpHdIVVgEaHDxQu0Seu3kfxYuvMy5cpRyY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJsiR3aHUs7SF9wo9mIwTrq8QnGUYJp8bmz23mcbCbkU+5MLVjl
	VJrq3MvyG+c5Dght4nLDNI0l2+vdDJc7GTyjlKcvXSGBWVM4v8L6n0WB29qptDSF2e4=
X-Gm-Gg: AYBFou2RiVEmiQ4b46WJx2G86YVy9BP/igBZF61M74s7/HGnOyrOiouWWLh8M21O/lk
	/i6ztR603gmOpCgxJJbtoZccte5hhoZ77EykNzEu6C4+MQESW/oFQZQE4dcC9d8QIwpxS3YBLG/
	SRXNLutXvAhqz1LEMIJY0N0S9WEWimgyszwy/zDRuNUIzM07Zts4wIOJRNwTabGbO1a8Uqb0193
	8B18Js12GneZn2g8FRX9tvY6JuE/0t+deUNQJp8k2zSd20BC+rqGUc+1oEJswUVs2JeTJDBATVc
	HWfQtLBfReSenujlf9B1W2z/4pFS6B12duykcAwOYdxGXHj58zb8Hv0TM+/yP9+5lh2ICASRKMF
	PiVANHDT0kpWlmolyM/ub/47e5nMoCrsm4OdWsNLQe4KAOIw1m6dQc4TrHvDeJh33skNb+8wFZZ
	qwA+7YSlpT06zUf5bu3IR38AjuPM9Wn9LgUoN2sw2soCSsXPPwX+kzXRWnDMXidAfmvnJjqWShP
	AGgQ0A=
X-Received: by 2002:a05:600c:3507:b0:4a1:afcd:3919 with SMTP id 5b1f17b1804b1-4a1afcd393emr93408495e9.7.1791991346614;
        Wed, 14 Oct 2026 08:22:26 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd67502asm974715e9.3.2026.10.14.08.22.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 08:22:25 -0700 (PDT)
Message-ID: <3a6759c7-84bc-46ff-93f1-965c7e8dd4d0@tuxon.dev>
Date: Wed, 14 Oct 2026 18:22:21 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/24] ASoC: renesas: msiof: Fix msiof_close() being
 skipped on rollback
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Bui Duc Phuc <phucduc.bui@gmail.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
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
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Heiko Stuebner <heiko@sntech.de>, Kees Cook <kees@kernel.org>,
 Syed Saba Kareem <syed.sabakareem@amd.com>,
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
 Sang-Heon Jeon <ekffu200098@gmail.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Bo Shen <voice.shen@atmel.com>, Vinod Koul <vkoul@kernel.org>,
 linux-sound@vger.kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com,
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev,
 linux-rockchip@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261008103831.542533-1-phucduc.bui@gmail.com>
 <20261008103831.542533-22-phucduc.bui@gmail.com>
 <87o6cyxyau.wl-kuninori.morimoto.gx@renesas.com>
 <CAABR9nHvCfabGfBu85bm1r=hP3b0ZiCsgZfShhOv3gNUfjjhGg@mail.gmail.com>
 <87se2aw3ot.wl-kuninori.morimoto.gx@renesas.com>
 <CAABR9nG-YJZEdj6pVD-gbGU6J2EfRMQYsKd7u0UTgfrWOyAPXA@mail.gmail.com>
 <87qzhtyxw6.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <87qzhtyxw6.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Morimoto-san, Bui,

On 10/14/26 02:38, Kuninori Morimoto wrote:
> 
> Hi Bui, Claudiu
> 
>> For rz-ssi: in DMA mode, the driver registers the generic dmaengine
>> PCM component, whose .open callback already applies the integer
>> PERIODS constraint via snd_dmaengine_pcm_open().
>>
>> Could we drop rz_ssi_pcm_open_dma() instead, and keep the return
>> value fix only for rz_ssi_pcm_open_pio()?
> 
> It seems fine, but I don't know detail of rz-ssi.
> Claudiu, what do you think ?

That should work. I'll test v2 once it's out.

Thank you,
Claudiu
