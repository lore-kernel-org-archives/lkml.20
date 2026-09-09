Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9725559CB4;
	Wed,  9 Sep 2026 12:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788958794; cv=none; b=LRU3EyCNx+iWgMLqHa6oXJPIujAZkrUGXdYhQvYZy2HlvnC2sECUGcIn7u718oL7nvAROJ38a1Z0+OmimpQTJFgcp3U3d3GSVETYDFDoa9U5Befr2o8Obsd3+ew5E4AWTGrsKrtoIwD40AD1+/ujEBXkfPbGMefnYTOFYIztHUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788958794; c=relaxed/simple;
	bh=Re0UMbz5B6dYFekMWDGv0Lf0R8sUJ2XLn2aDHe5PKYA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=nMDSx26BqD+uFyShCVjuwWrfIxWLFEX8UQb5eLInBAK3QNUxCY6HtitkrJ7ClNujpaOFEJfer7TfX8hD8ejqSY0jRrPic2ezMUWX85FzQiXfEiEfbmF2ykHy0rWu5B5GKIfEpQnLwHtSzFyOKyulWI5hLxngSy19+BFZ54LhVYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Ak9iCaz3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=BC68zb9J; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Ak9iCaz3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="BC68zb9J"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 1704A7A014F;
	Wed,  9 Sep 2026 08:59:50 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 09 Sep 2026 08:59:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1788958790;
	 x=1789045190; bh=8zhf+TDQlcHC0meo8ZuIOg6sMT5mzZL/5LvCcOMce9A=; b=
	Ak9iCaz3Vvy5xQna7YMOa3pK4fcThlfPL3IGGuWL1Dw181Ce+3R0NRPLDWzCTQS5
	2aQCRLOHB7pnNVvx9d1jf8imyFeXwVxRMUz6Xieucig2pA+DherQJk702oOo5tgN
	VJY7zBFfoNSch5Ark5kYvp3Jv91RP+2AFiFrIUcIyz+k0J29qBEnqbQ9k+lGP/Cm
	bc6vr0tlmDUKLI9UVEobUFOiwgwqpWDasN6lwE61KSxZW+3n232BC5uFD0nUMCII
	U7wzoTMXDkDyOHvtDtia3ZacFVpWtBG9ma8DnAZH2o69VdZ3dwpCq/fa74pmiOlb
	QTZ+/M3vvVu8xHjOoLSt6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788958790; x=
	1789045190; bh=8zhf+TDQlcHC0meo8ZuIOg6sMT5mzZL/5LvCcOMce9A=; b=B
	C68zb9JZQVIQysYE4aN0gj68s5tFIMlC+yR2HwUT9Ifc7lRVDOvh6pSC9kEHtfgb
	aDVs8+FRyHFmGxrDLo/BlGLIWYexVCvtuSI0keZhvI5XILMAxma0SUYpbTMxUp9g
	F1eAupzQGoqS2tJh+S8IJzDx6rx2YZPJ7TXp478MUqoZKIEEqGaq++s3c3tGOOkF
	Ak7Su/uOa9yC9Tew9eKcCT8fwM96tyitgja2mu97umYXeSQZPMxQqB0Pau/RGxMw
	+1hTg8vGFXoe/qD/q7Xxmb97CwqtD0hvo4MjDIXTwo0zwT0bYi+GjuRaq3v3w+s+
	agZInSK8mplMXisvvJdLQ==
X-ME-Sender: <xms:QlihaqnMVRlouthNQiUEIbY4JQUEVM3syUbp_q_4LxwINFKduafJtA>
    <xme:QlihasrNwvSPjqdnye2OVZLyBbVwBxy5BT8_TkbUxp4jwh1l43QuGFHOIpmPk7-aj
    wk5pa8nwptuhFrjOIY4I1n-RCi2QDfHTzC79xD-zrbxALWrp0pRjBwH>
X-ME-Proxy-Cause: dmFkZTGC31vnJ0JaqweK8/cFweDRiv/H0v3Nt7W19WG8LEDceLMjqRU37OJJuUmpCp7KwN
    5ozi9WQE4bdAY3NwgJtevaehhtPCT6Y/fG30NzzoWbe+kNmQ7ywN1gPrA3IokSTIlasO3s
    saJLGKgJXTjKehqYyt/sg/MHyq7nW5N2DJXTVEDunpVaUbYUGKLh+qxt5JootlEPtP0wr3
    jXngtqCZCQBofm9yG2IZG/9+FGq5L+ojROYGuC7bvEZroBQCFiUtxpZys4DzJJ2QhrWWSc
    7DjUx8WdXkUfYCxtNqcnyXOD517Ug5qVbv0zWzLyBMw3J0sq9QmG7ptzQQOSSE/rGeKYco
    0BOe29H0B/E7IOX4pgRm/HcQEfjQmgBrn/JZWW9y7nRFaaNXkucilj5kCbzeriDRxAiNFw
    4As6Lk95v2knoYjNysiDxrUNPfZA5YE6RL7TVwguqmu8Cu0wJDmtUhdhlgFyAH2VAeYn3T
    PakmzKXPtqRWpFIcSddem6FbmyV5qvKS/bZ6/M2bW97CTSJWBSlSaDSmTaYW9pdqPVOFfn
    xEV5CnqgG53HwriUrJIQFmgnf8edJl2TDmI7iK85zV2/WEyHmz8TW+isM1zkExY0pvhCI7
    g8lx3DpAJ4RCfhLQ2xv3e0qHiuAtcG2kAQ7tHxjD9ZD6CsTi/Mummv3ungpg
X-ME-Proxy: <xmx:RFihajVuORHTR3BxOzW8vwq98g_W30Wa5cTqRitwuOpUAM1aOqkUPg>
    <xmx:RFihauJqB7B0ofIe2eiB-BE0EY9ewsDC9qpNGA1pQwUd5y5E0TfM8Q>
    <xmx:RFihajBjpaiYKf_tj-dxj06cPo6w8L4PYoJKLoRq1K03wqrhvgEYaA>
    <xmx:RFihaucQVYOxwWpQScrj64-t94cSC90wLoT50c3CE9niUikQ5dQZYA>
    <xmx:RlihavqK2_u7agAVOD5lTR1dV7atSAhfDW8Y1JHuQUGPFOMKgo_cT5nI>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id D99BC32A007E; Wed,  9 Sep 2026 08:59:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: APMnH2YU8Ow3
Date: Wed, 09 Sep 2026 14:59:26 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Julian Braha" <julianbraha@gmail.com>, lgirdwood@gmail.com,
 "Mark Brown" <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>,
 tiwai@suse.com
Cc: "Charles Keepax" <ckeepax@opensource.cirrus.com>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <b703cbad-b3f9-49ce-aba6-f83c365bb99c@app.fastmail.com>
In-Reply-To: <20260909125636.3560050-1-julianbraha@gmail.com>
References: <20260909125636.3560050-1-julianbraha@gmail.com>
Subject: Re: [RESEND PATCH] ALSA: ASoC: fix unmet dependency for SND_SOC_DB1200
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Sep 9, 2026, at 14:56, julianbraha wrote:
> SND_SOC_DB1200 selects SND_SOC_WM8731_I2C without ensuring its
> dependency, I2C is enabled. This causes an unmet dependency when
> SND_SOC_DB1200 is enabled without I2C.
>
> Let's add a dependency on I2C, as similar options in this subsystem do.
>
> This unmet dependency was found by kconfirm, a static analysis tool for
> Kconfig.
>
> Fixes: 9dc15f81baf2 ("ASoC: wm8731: Factor out the I2C and SPI bus code 
> into separate modules")
>
> Signed-off-by: julianbraha <julianbraha@gmail.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>
