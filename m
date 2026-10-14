Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142554D2ED6
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791978160; cv=pass; b=ej9l93qdkWqt94U5tjp0AGECctUeuUPGqfm0aJghOOgFPoyXFpyD0MzteNf8aTyTxp6LCsjldUtyrQHgm42dg8RPHt4639UrBfvgSDn6SUiCxiukWr0CAeym+xvaJVSbq6+ftMF0DpRu0XAGpdYd71GwVaJDA9zj/CXHy0JowTM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791978160; c=relaxed/simple;
	bh=SExSlJOtRhRzpIj7eRr0FWRac1iKGklAYskw7N+LI/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SGX2VCcy7fvW9yUTOFRAcxwrNKUBvG+xBqK4xC9mmu2xNG04vOvIVcmZQ22Yaz9MB7VagagtG5/zyrIX2dVx5Xyl0OuFD2wVCL+N19DYSNsevxPxIVL6H6VT5bvZkW5Xn/xLurAMkWyNN/SY8eRROoNWaOIFYdq5yNbwR+v3lEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mf97EB9X; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mf97EB9X"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e8f2c3ad6bso14835875ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:42:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791978158; cv=none;
        d=google.com; s=arc-20260327;
        b=jApYhNxZZGFoRAfBe9zb2GR2xXCADLIcIFDpjoF3LaWTbllV1vCnOZx4t220f15Ys+
         h7a73rKeeaxhnqxoC/mrniKJkbDe6MwkOGX9d0mYkDHl6KmvEsnEDqs36ewHmDZq4jLB
         vrZ5+AtCjnKA9UOp96geTvc6pZlW+v4n+YC030iY98UZ5+qzw+1kgi7L0lWzMStnBOTi
         9E0uLZ/xKMHvoQbM84LS4NfB998CljihyANtTTapiCMSGkGk4+DoXKXPWa2wnAMjEbTZ
         +uVPTUNcW2dc535IT7QFSRKui+vrw21PznyMvyvvTsRZjN4d2GNJsreWP5930xKlD7Q5
         h2Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SExSlJOtRhRzpIj7eRr0FWRac1iKGklAYskw7N+LI/0=;
        fh=7QJ1DC/coF+AcmKm30sdqzaRHQz8YTjyCM5jiRWpfFA=;
        b=HtasAAZ2jt2TuvtKE99tXjkEZTEnnKd8/kZr3eJP1emPzMwO9gi1tG5JTcwNXeREes
         aUHg6Tubus1mM9YMqCbEHEEcb99KoWK/5jl5fFse+4bX+SlLg7A1+hTM7a7Mi8+71HPL
         jLkkE0MafYeCSBRnLytQ06DvlF7p0DMe8V7gjq3iNWvlxFQMsEskGsgczqVlGJ+gyTDs
         u0pz1D/+XpVNw6NthQadSFJKdE7HpyDmab10N2rh49hJBDx76EqYAcHFNp6yYiR2JnQR
         yXdIDulyFwTTDUY/Lns3pSAX+8fHLQwXLTyIHikvLDly5SBN6gVxgRFOMebLc42JPcu2
         cfQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791978158; x=1792582958; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SExSlJOtRhRzpIj7eRr0FWRac1iKGklAYskw7N+LI/0=;
        b=mf97EB9XXjAUVxl7uljK4wA8rth/C4fEFPhm1Vb2vVo/cS1SUrKaaMsc//aapgR+Br
         ySXZGuSfxZrgVC8/I0c9uUBzH412QPVKhHOWW+OfyMu8pGR15bXGjiKk8duJ1goLkzGj
         5imewuu03MeJFacvj4/qEZe/5wGZzVQ6WOOEy7LtvZQC9TgPuAacgbrqgGhAygDqCXNI
         EByFzOFd+5ZVHuWua21GJkP/ARMDwh2wAtkLyROFC3gsJYPm+TH2ay5k/TxbKdDHOQ8G
         o0qyKhSFE8DMC+NpQaB80NNhvt8wj+wzAh/M2b1tlKragu2GtuYKNMG/TKMXb1Yci+fG
         eOng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791978158; x=1792582958;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SExSlJOtRhRzpIj7eRr0FWRac1iKGklAYskw7N+LI/0=;
        b=bewEvBShc1sxALxOD/i1EaTPIC9kP3d2AqedXHYE8fGVavEqHRO/vFrvZUuHR5KrDH
         VVckTSpzxjVSTmipm/lQa/o92zOhJ7l2tlwLGCq23JYo9A2DmcH/ys9DH4sujNjqQgzW
         8f0HYtwKZ0x6CXU/MJcIdA6gNJkRkcIq6khRyJBrCLl1MHiIkeBMVGAiPYM0llms1qTC
         x5l5uEI53odgRFn9jXbc9Vbn5NOH8zSdUS9vTaAoG2Uax/9iGNXjb0HECD4Psi4xhd2i
         6Gd5uvZkEIqHIR4A8M/z5PAZpjGxrDYRv1HFe0QACdEgImGqVkul44MkqX7f36p69xEW
         K20A==
X-Forwarded-Encrypted: i=1; AKwUvBysG14TccAp4T/EX+yF+aetEWLLa8Pf/3UxqQ3+j5d+pPiFUX0eRssGc9YfMx44DHehQYomRtZe/ScBtiY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmLefaGMe9uPkcBrQGMsgyMiwM1zBcPUbci+CW4M1N2N4MxWG1
	5Gi9sfv/cENkTWCIcnwndEvSQGsTFk21S5GCgfuibmswrvqpwzogN9yBQXoFzvVl9ZXSNDdxUv8
	E4/+pRVwWIoNHA+X/Ht1A1T0SN2XEOKg=
X-Gm-Gg: AYBFou3w0DY4e+BqxgDtSUC8pWxK9Yw4VN/pBEsxs4iyxEcu9vGetdmuRxLASkykPYL
	XYwGy/pJ8XBBr9rk+NqqyeuGttx6e5EGs/aLm+7qpHtJghZCKmvfJH6Aaw4ED1L+cxWsnq5puIZ
	rsVZ9CqF7GNTfS0+EqjqOv246T5cdlFoxz/d6ryIsr6dAWbKAMFKK+SpY/qQG119PEIW81cx/0x
	rt6ANL3/x7Uimp+6eFvy3K+s1r903Zt1PwJtzQVB4XbkPbokDtprW94e6GsuBM7w9iKHF+ZaAv/
	yiHbydN6JyDKfN6wWGov2iU72ksEqVOiBIsLQozjaDFZKid77MNsA6fcdqjd9RTbI/CaqZ41GkJ
	idWJHK1S2deKzk3ecMkHhjcSzKqAyK09nbMP637nN6PZWhUN0hYabknNJCrXUNpHsjgU=
X-Received: by 2002:a17:902:db0b:b0:2db:3b35:1ac6 with SMTP id
 d9443c01a7336-2e8427efd9dmr151731365ad.5.1791978158291; Wed, 14 Oct 2026
 04:42:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008103831.542533-1-phucduc.bui@gmail.com>
 <20261008103831.542533-19-phucduc.bui@gmail.com> <14bbf027-4a16-4bac-b530-d4654ed38d4a@gmail.com>
In-Reply-To: <14bbf027-4a16-4bac-b530-d4654ed38d4a@gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 14 Oct 2026 18:42:26 +0700
X-Gm-Features: AclHuK--pm1YXW-dAVCk4mePmFKUqLdOhzguEaV2jSOsxf_MJ7HFDWxjeVZGb_U
Message-ID: <CAABR9nHyso5GHpc5Gg-KLF3hJkCHQCYz_mK_i3_0fWDEimLEtw@mail.gmail.com>
Subject: Re: [PATCH 18/24] ASoC: imx-pcm-rpmsg: Fix imx_rpmsg_pcm_close()
 being skipped on rollback
To: Chancel Liu <chancel.liu@gmail.com>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, 
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
	Bo Shen <voice.shen@atmel.com>, Vinod Koul <vkoul@kernel.org>, linux-sound@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	patches@opensource.cirrus.com, linuxppc-dev@lists.ozlabs.org, 
	imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Liu,


>
> Reviewed-by: Chancel Liu <chancel.liu@gmail.com>
>

Thank you for your review.

Best regards,
Phuc
