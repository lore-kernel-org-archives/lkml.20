Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4D3493D4A
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977977; cv=pass; b=Jb3+UCl4Elbl9WorYhx8t6PgvTKdYZvx3BFfZuz0tYqTvdLluSF79Uoitt363+KScgutD+Z3aDsYn0/c5uZrcEJYDyE0IBLGTo5vqi9fJyx4gl9IY/upxXvt/Juy9wVdmWiRPY5xmy7AnFboEtduO3UI/XgQHcb8ME/+Tly/5FI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977977; c=relaxed/simple;
	bh=86HyIPwleJgWRq7xObrqY9hZQITORuKm8Ont8f8xwzw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JtiCcr0vSqS+hb7hyJMAN2QjyMcEE2S9KiwlJ270/kfvuhmIAQX7PyjEEG3L+77c8oaaa573UrvgY2k1t2Z7GeNWr4XnTkxnVQy5z2mJEeumpMkOd2Z/KmQbd46fX2vApnFAE/xttKAdcZbthhP4nUWbDl0bAGiXIyfciJh/kqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A+sQR5c8; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A+sQR5c8"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e812e2b31bso22103415ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:39:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791977975; cv=none;
        d=google.com; s=arc-20260327;
        b=kCZgTyKm16dqkqF9t221eqdRUKv38sZEqX8l1tqnanjrFUB7bHE652rxzByNnLOGbV
         AJZoaCe1ARG+oniO1MR2KhsCV0g5J85CMFqfbRxsVtQbGWplNqGoD4dIixgugQoXZ6Ae
         PCapXZg7mtTLVVXAbx4bMDdLXdNMrMY/iNJi7qurBv53rx7oXfeosT9E/I033fQX4Z5M
         6CPIpNAl3KCi7UAVpo/kc+Gb5zKsDsKBDRJMQYOcxdJoe/dfTwn2NcYkIqcpxRkmco2F
         UciQE9MewWcawuacKQTXTtphS55PmPSVDlyFGVa/QHIvX89NntlhMlFT5iotBPTqPV7G
         hLNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=86HyIPwleJgWRq7xObrqY9hZQITORuKm8Ont8f8xwzw=;
        fh=PsSyVJ8hZCKmj9gbPyUoEAdKLNfscrQwfy9EhY68z7k=;
        b=XnDTrAE9X8epw8K6NWR1JpY5OHkIWw9qxG2SNn0cbezv0EQZ7sfdfm8w8SJqwzH8rg
         FF+IDVS4lmkiR/itkFT8sFeEqtB81iwiMmqddb9gqjivBPltLjkya3U4uOkLp0An5Yyp
         fyozNKgADd8ZO2ZI563FX490R5eTyKS1tH+C7XbZmCSbge9E8smNQPPwTjwvAlKzEVd+
         RRklIIFt0cnoSU3knqkWaozBQ5F6ZJaf3kWwQo9gNs97Au7xnmdnORdfIIjDZFRucw+0
         Vo89VW/dSCFWM8P4+iBNBA7SdRQdNCUKVjho5qiD4o+uvPGQbFelH45XpVl1jy982Dqv
         vctA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977975; x=1792582775; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=86HyIPwleJgWRq7xObrqY9hZQITORuKm8Ont8f8xwzw=;
        b=A+sQR5c8D4G5VxHcInTcqcfMRvjDjawE0dD5GndIvxUePkoZ9zfSmrNnRh0ZI7vgxD
         aYegV040fT7ti495IHM4LWCoJ2gPyoY9Srgzo05GnVqf0Z89TuoxoXTaLJgtHT7OkKwi
         FOLF7m29ruhHQZFjNUAQ8SI1O7svvgEOUWp3IMMhhfB/jwKzqP1QxcgXiMCuQPJgifaB
         3q60br17NTrdyynUVqu/BfAXc3/0dRgI/B3XlpgjLew5XpDnm23u59ohtCEOzd2yDUTP
         Xmb78cbtMN4NOngzKlZfZKj8UNxgajndmLDj9mOAXvRWBHDk5cpCe0mXRdDblQVDL1iu
         H4qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977975; x=1792582775;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=86HyIPwleJgWRq7xObrqY9hZQITORuKm8Ont8f8xwzw=;
        b=UT7sxi5q8QeqSvrzmDsYckJU3gn6Cv8UJmRwRWAKXoiLvUztwGLadfRhBsz06R0840
         t+TSPlOkRJWb4Onjjdrxwa9zozSqMHLk0tsKDNPctc+g+pJqIuxQjBICKlLMrT6gqmXY
         hMCbY2Lav5eiOTBReuNtMcgXMrX4BYU20AOly4tduv8SfjkUGDUO+lM/Eys4ovuRfJ8l
         IxWFM5dLniNpOc5YOPzuOj/K2usKzjAZenR+5wsDa6BEWzRNETXcIYGHCR6BD7CYf3w2
         7YxUQ16M7003OndIPt8ywugJIQpyy72oa3SD2EMt6gavYo9qyAXayFBpXD7R7C1YL3//
         zghQ==
X-Forwarded-Encrypted: i=1; AKwUvByw7FDHzE4jUFYvj+zYv197yn5tcdNPejTMBSmwdHhvmVqsQidlXgo0vlhMzh80h7JeiZpye9Eclqqwo58=@vger.kernel.org
X-Gm-Message-State: AFq9FYJuCAQYqYUl/MfAGdIe6tDX0b/XdurSi1w/CTBHL5XBEG1lfuqR
	7GZot3nwVpIrI/NzhfA9ZZbpQiTmdtTcFvevPyOQeC3Q+V21bsZ3XMgDfOFnmfZ3Qv1xpB0qLNB
	7j7MzOa/XXmylj98TaRcNa86oP4T1n5M=
X-Gm-Gg: AYBFou364cLqevbIFxz+Qkrln94YFvDUimrLI90wa8FO/0RDQFxQgPQluBtb+oQBeuG
	Hu/6y/pVTnyVJ4axcTK+u3Jw2ANoxjLnHfy9OmmweKqnzkyvutPn82cZ4ewxobGEscAYZIdYdF0
	3YGO7/8UqD/0mxJY+eX1M6BhC0LDOlHLRqIyHs+P22nUFzTQw9KFPUuClwjwvqPZnawuI7i7UMg
	fZ1jqWd6CAKyy+zdDRKNAqM82kMDxbwfsANK7vpt5u9/mCpxeU29gT6dynz/cf3sEUmwn1Psg0u
	mMEbi5dq0TyJb3ufY1X3gU1DLmgp6LEVXxU+3XkGT3VXwb+4pGnmb7VMk5SjyIAZjEQublJQCaS
	diebI+YGX2A2zL/Vg0blOukerBDrvalQMWfnpWITfr6rK7ZHBGNu8Yfh9OUARU1IlBtc=
X-Received: by 2002:a17:902:c946:b0:2e7:e73e:7091 with SMTP id
 d9443c01a7336-2e842bc6d99mr145871485ad.31.1791977975265; Wed, 14 Oct 2026
 04:39:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008103831.542533-1-phucduc.bui@gmail.com> <fc30ea4e-3c2f-4ba4-9ae2-054db9b49fd5@amd.com>
In-Reply-To: <fc30ea4e-3c2f-4ba4-9ae2-054db9b49fd5@amd.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 14 Oct 2026 18:39:23 +0700
X-Gm-Features: AclHuK9jgQVtz3xDN60LQFsNWM2GDbLorSH_eG4NihFn39vhGI4sDgE_b4KgxkY
Message-ID: <CAABR9nGbO1tBOL=fN90ZrYPkv767qh_sJG_UHP-FW5C7sBPpmw@mail.gmail.com>
Subject: Re: [PATCH 00/24] ASoC: Fix constraint return value handling
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	povik+lin@cutebit.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Andrei Simion <andrei.simion@microchip.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
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
	Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>, 
	Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>, Bo Shen <voice.shen@atmel.com>, 
	Vinod Koul <vkoul@kernel.org>, linux-sound@vger.kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
	linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-rockchip@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mukunda,

Thanks for the review.

> > Found by manual code inspection.
> For AMD patches:
>
> Reviewed-By: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

 I'll send v2 shortly with your Reviewed-by tag.

Best regards,
Phuc
