Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAA1397944
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886373; cv=pass; b=LEsZB/AAwKQrmsu/JCCK0KMGyQALr75ZQDxgJ9rQ2/E/RrBefvBvvAg/sDpoi21+hAUSYsUelMVP0LMfxv66elZBNFHtB0Q+TXgzAHARSApXlKa1RF1jV8zPpqmvDrcGId0TehxbpI5s/EkbPgSL7C5IuQkws4+YLDb9Io+runE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886373; c=relaxed/simple;
	bh=oYpuymV3tgk09qaaDkKOhd9dg2Zp4VCoofN6vnpJl7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tenxQSjPzYr0VagwkF+fdUVgbdClEe6LHSy7QVqvFhVXzfxs1FjsYPMLZ3oVBbX42hHNHepEt5iwHIzWG8ASFQsDRVIlbvLAq6QDYd53WrCxzGDo7RCdGDfhO2grw9QoNVk6aXuhldT2OTwRPsNXBa5nLCBgEp6VA1Cai5tdKlU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mud9Rva/; arc=pass smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mud9Rva/"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc4b1f7e8f4so1531165a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:12:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791886372; cv=none;
        d=google.com; s=arc-20260327;
        b=hak8FFuIiAeVzARRktNAjaFOpDC9HUJfFAlw9QYcQN8H96/JTeezW4yrIsjT4B8XIv
         I5DskbiIoYXlWSzYNp9LHuMPonPipmzxg+bVSxyTh+CgtYqjrnQlDDMyWKBydFhP2k98
         COeDDpPMuhhuMxePvoxp17LxnuU0Jwkai7dsYFnfNBaNc4ne+70wZknxVjXSuMUXCwQD
         HeG2/xhR2/hm8ZKXNEhZ9Z0eM59WI1v6yoJjbPwoTQOD03ICCSUWvJkKQ7Togi4FOkfH
         VNuHLQryDdF58rsY2z06auajBjW7xhlU4oxmHB3F2OSHKP7XQws8aYBP8VUzK6AkSqO+
         xJBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oYpuymV3tgk09qaaDkKOhd9dg2Zp4VCoofN6vnpJl7A=;
        fh=OUjyVJH7zMKfqaviXCVVyq3IuYBQ8c60imozcpZ3iLA=;
        b=C7ucPa6ygglPV0SzkWUByVMH8ymOMQzPn3u4XPkmFu4KdKcJ9ZuRt7GtJ7ne79mdOy
         EsR0n6KqWE9W+VMw0nmyL38EbDgtuYd4ZW6AKBL4M/r8WGxbGQsPU0M25tC4//7EDz6b
         WZw4bAbe1+Cav+dubXnTCONA++Yl2ewpRqJSsCqoESrjlceXCCVKYQfLbJvLIB+VSKTd
         Mwr8ZS8rBfOToyixg26V47tsmPWdhIcY9LXQySZjxi2JbRJi90ndn66P9aZ14fUU25+4
         0DiaNQPYTfRhP7RcZway0C0sH7yv/Rg95LF4gl/E2rXAUr5UK+Uk5T/hZbXdvcy9V62Z
         pOhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791886372; x=1792491172; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oYpuymV3tgk09qaaDkKOhd9dg2Zp4VCoofN6vnpJl7A=;
        b=Mud9Rva/LeFOnCDUIiPjQjYUmvHzEcsos0QGhI9WPySVqDhj55WYp3CBIAwIMT3wu8
         BxAgAi2Npnb6ADK75WkHPfYilGiZdZxXO+G73cim6wmjKUFEdskTCbMYSD34GXpm5SAN
         mQG0vwhMmUXSXcEPSgdLeO2iPPbdL70aUwzWj/fwSw6DbzB1v4ADzDkfkCdTDZYJQydR
         BrRHp48uDD3uCH45AcsVXKfCVbr2QBrxzpBfiKy6z+mVzcD/irRXIYh+IR+4jv5qnlYp
         laOfSmBrQPU2WDs2vLkw10SE9eH4rWbv8dd3VZu0OSzditr6UqsMCBepCaX0ZNYeiRDU
         CAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791886372; x=1792491172;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oYpuymV3tgk09qaaDkKOhd9dg2Zp4VCoofN6vnpJl7A=;
        b=GJs5xbWVD/ni1DgQhGmczYo5UiDUumf1WUSfVjoL4NQYQEHP/fRh0ZItGK3EZ2PaRJ
         RBW6f2s7nmFXpJOyoVO6JtaGEdbeg7rjf031y1SwTu/n73pv45LSYrhaNAEHmLitONaJ
         BGls8ShD6UdmeUyXxDn191rrrnRNBtl7v4fqllOhwBNWqk9UCsWJzxNaiglnojEhJnRT
         +LmmzoZFdGHWIOSnuyJnJbB2eIvfkU/IWpQB5Ibc28yFSf2Kn6BsRa6pitTI4NsblAlK
         xVnjiXhv1MPvaD4gM06YFkBf2rzQVl9CCSq6pqF8pg82y2TckIHkNyM7UIm1UI+h/QI7
         VU3g==
X-Forwarded-Encrypted: i=1; AKwUvBwg10hdjGX0LrvU1Us2qkHJYIf+SpjONDG4TumVGpFPK8GP8fRj0JDjEyF1UZ4AK2tlKRytFG1n2XFIBS4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIh1nzsMjZa+pDbSf7hNid+TtmGX+AU79rJLgmcOEOCCjl5kT+W
	hMD092VV+P53Qev6O9q34KZ9rnB7GLtDEhhkps8xefOYruWR41p3AjccwrStkXsCYa9ztNvJp2V
	2QsPWvD5+N9YOiPNAz6pfDPyaTFXM2z0=
X-Gm-Gg: AYBFou1i/BeNISx+eVj3CmUClSUbP68yTHMzpREskTWfNFiOfR00V0a2vRiHz0+GkVj
	64a+9V6+eoVhztT0rayiuRwaMzpOegnqaCvmYwIvMmMf7xE/p11R20pccHYYOr8rLGCwuW4YGYw
	EO+s9cQrpD6RYjo6KeFsPAPMS0/ucqPmf8b/lU/ZBtHTGZ2sBuaNwQMSInJ9VCOalCoMlWq2pmA
	Ya7KN5aWkCQ2wtxKmEWUsijgU02/jyoquEvsrkCimHxrQFi5DsaNweSv/dRN0d7czyyKRqNbEqm
	Zc+QpmQ7HK5VObsKX9eUNnQOm34/Ri3HA4idDbly3yNhwrvLsFn3trTwBl+LnB//fBp9SkLN1Wh
	AXjkwrlmOX4iGJqFrGOFYRJSniWoJIKk+KuKx8mlPFb5KyXiL3b7gH/gQNOXRjPhz56U=
X-Received: by 2002:a05:6300:6bc8:10b0:3e1:9071:acb1 with SMTP id
 adf61e73a8af0-3e19071d79emr3692539637.89.1791886371799; Tue, 13 Oct 2026
 03:12:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008103831.542533-1-phucduc.bui@gmail.com>
 <20261008103831.542533-22-phucduc.bui@gmail.com> <87o6cyxyau.wl-kuninori.morimoto.gx@renesas.com>
 <CAABR9nHvCfabGfBu85bm1r=hP3b0ZiCsgZfShhOv3gNUfjjhGg@mail.gmail.com> <87se2aw3ot.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87se2aw3ot.wl-kuninori.morimoto.gx@renesas.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 13 Oct 2026 17:12:40 +0700
X-Gm-Features: AclHuK9ysK1Jav05byu2z6c82z-Prt9juV9RV67s1OGQmeMH_qLrceJ2TQNxX6U
Message-ID: <CAABR9nG-YJZEdj6pVD-gbGU6J2EfRMQYsKd7u0UTgfrWOyAPXA@mail.gmail.com>
Subject: Re: [PATCH 21/24] ASoC: renesas: msiof: Fix msiof_close() being
 skipped on rollback
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

Hi Morimoto-san,

Thank you for your confirmation.

> > For MSIOF, I noticed that snd_dmaengine_pcm_open() already calls
> > snd_pcm_hw_constraint_integer() for SNDRV_PCM_HW_PARAM_PERIODS,
> > so the call in msiof_open() seems redundant.
> >
> > Since the first call succeeds, the second call should return 0.
> > Would removing the redundant call be acceptable?
>
> Nice cache, yes please.
>

For rz-ssi: in DMA mode, the driver registers the generic dmaengine
PCM component, whose .open callback already applies the integer
PERIODS constraint via snd_dmaengine_pcm_open().

Could we drop rz_ssi_pcm_open_dma() instead, and keep the return
value fix only for rz_ssi_pcm_open_pio()?

Best regards,
Phuc
