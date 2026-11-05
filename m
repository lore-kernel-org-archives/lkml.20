Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.159
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793899524;
	b=m8biYUzjW/aksh5Y2FnA8gR+LLvtDqjUu2hANfKaEKVT91je1hh0OfyNcdnJ+KuaP6v0
	 8luxNsbTYSqNYXuZCss1zeW4gbmyYUUtrrMIpNKzrbkwxUcNfs+FdMwHKf3LOq1zJccfM
	 iBB0htt07kPKr7BIiUsEXaAiZ4nX6sVYsaS+fEu99W+a/BTjZU3rD9ZZKNLb/kLFtpRsU
	 3Y6cTXNb4I5lQSadDNojqaiqi1bq2mLGt3tRHE5Az5Bdgxt7FhTSe3OT5LfuTxWNajkvL
	 oQdnwVSwxI2vgHTYRFJQipeKYSI3U4nsNymUMj3w15faCxh7aZR5uKq9vHX1dI0aWNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793899524;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=f9nNFMOzW2cZ2+4niYK+/UnL/n3aASeuAKJSmbepMR8=;
	b=VeMF+U2v5ZzAf62hIidFNj6bYiM6nGl1G+HnDSIRCJ8Bl9UJ787zqSPtZfrqHZZTExQP
	 LZ006LmArR1DVvxpwxXDunr2/IAOD0c9kdg2LOfjjZfM1DC48dCSYy1OF2S7MYyL2siLv
	 gjkDRfeRh9mdOtGzJB9pLcVEMmpHmaFo5hwJiOhQSBO6lPKN604SWVXYnMUL2457Qwwcx
	 8gC6QvQhtAjN+2xxFGoHvizblmUB0K2JTSvBdTR1VHv2RZ9EBaX3xcTIykyvwIuFO1GNu
	 mDybPDg5lHcIhk80WXoxXgdksbSfEi3fx3erEGzl6ZYZPNOShQbp7X1ull90ebqKavg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=DRAr9SGa;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=lkBWjydl;
	arc=none smtp.remote-ip=202.12.124.159
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0156606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:25:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0156606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=DRAr9SGa;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=lkBWjydl
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E5AE07A01DA
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:25:22 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 05 Nov 2026 12:25:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793899514;
	 x=1793985914; bh=f9nNFMOzW2cZ2+4niYK+/UnL/n3aASeuAKJSmbepMR8=; b=
	DRAr9SGaR9mi4e+DUMbG/bFWPkRfz+aamV91TbeVE/idxDvnN1iDBUaplFrMYNCk
	IlOP/N9FgL/xvlvdzhdsUJ2GK9DjzG4sUC8EuH5SwHvl2NnIBsKXGoFGB/PghJhh
	ofg2Yv2+5liSiSY4eKWO0JRR8HROaf07WtsA9UdKBD7BskdHZc5oVNvU0bTD2e2K
	raLchSGCdBhMUeP9/0uqudmVzDrBOiScI7cEkuLfhKHYLhTLazwq/hbbCtK0FSkg
	0MSlb0CmLe5pVTanSIEVPQS8TVtClyZIIRkQzqNGCOGpENOas2iA4/VtDBlS63es
	nI/BtsO6ZLHUUjjeLd00fQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1793899514; x=
	1793985914; bh=f9nNFMOzW2cZ2+4niYK+/UnL/n3aASeuAKJSmbepMR8=; b=l
	kBWjydlECLXK47xrFOlx3DvDLw20bcqu7VPOM5TvJZvALkShOyIevlyTiplpBiT7
	BOjYif4qCJ2bRA0oEYtdF/FvYX60G5rAXVtojlLgGQZHXS65jKIAKa58OY6sQIyi
	eiH9mgyqHXsWDID+CbketRycGJTJ8PH9p81htKybjdj+9F+DUCOYgMUpqdPGczdc
	wkU6wzqna+5AXMnQCIV4NYNjbigOaCwZJ10xdSWWK9JJsQKjArXF1wRSOhYiKhGo
	gnapPO6XGqwsw+g7qZzLtJIPVBggtm0FfxfdUzKuamTjFAFnV/ly4BESt2soYuPt
	CdcGpmpOGRxrpv+Dci3KA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793899514; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:LUxxf2Q7yLhxkK/l+A5HP7N32vzPKDR4EQ+VjEO1gj2zWbt
	naGpcF2nReAoB3thKMKfs5Vpqci2TgW13hX+UkdSruGSrUUO7lNh/DzLj1T4aD4J
	TT6X9Lm3jVraGWUCiVJ/7M2K160vqByXM8k1vDffEp/342N83bvhusOYE9/UNdCK
	siR/hLtLiuTKNTj1UTVsJfbHoeqUvzDUcQEQYRgR3MEGr0iMxVZXa9lbqXHwBRdi
	Hxbeqa5RkODLa6HSuzWquOH5TEQFXpADKMbvQiFEJ5NR9EPc07u8m2Ke5jT/6+xd
	1eK1nYjidhiwUwc+0TQ2NezqZvYHnond/t3qYZg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:aZVfFFxNmZzY/z4P03p4LUnIWVoXUeYBCryrkJ/5Sik=:zp6nrIcl86nIfpRQGtTtcOAPe405701jGc7Yv6n+Bgc=;
X-ME-Sender: <xms:9LvsanVVBHlb6ATcQxJ5X34ud62tpbWowNdoj-SpRCnPrgdnunCFLg>
    <xme:9LvsaqZUCoWzIWatmCzY8csrLtyQVOqVPIUVX0XBFLvzrmIesmyqEkluWD_l2wyKO
    fe-Fx2WiWq3UzbSod5JodOI8ChMd4dqoojK2yTHEuYPXCoZmsg90HVd>
X-ME-Proxy-Cause: dmFkZTGcLElrDLHMCTXanqvG5BARs6Rbztojvo7fGA7PusxL1nQ4KJ1nU0k03WSbaf7pNz
    EYYMA4mY5+oKfINwmtoclDgACOYCZcrtwyFYemyDjIPnMxCiPHguTl2DpNG6upv/3dWutw
    8jALM33LOtOZ3LIjupYZ8fvhj14eljel+42riAYvLxF95ygWSd19goy4BCtPOpu8jMGAo7
    gr6kRW9UP7pZycHaxKgDGjvvoXa3VPNaK66ow5cmbNCSy4CpPB8sU8Tq8zqykT4g6nbEQS
    7OAgwxRnOrnQjafuXwBanOY1lzdCBjGA8UQGasUBVn5k61cUaLKPyQuS/HcsNhACBmxpJm
    iTE77hCoGtPhirdph9WEbY7T9hJkNnnebXQnNtX/hRIzw4QGiNvtvl6I2HIJnHpDt1qkHD
    8zJaR+gD0ay9BWZXb7IQntaA5qoB3uUPLAnpgaP1tcu8ZWSV14/M6qMsYo2tjqlNpC3Oi+
    p0/uHvGddacecQvzeQ2ptYuhAGloK7gNCjY+Lki+MlOvk+R+WRNWnklkk6LKEmPDRLv5Rd
    ZA3tnyuwpnP8WHZNT0PxZr8O5PJG4ADkxylD7BXyRc417hLLzcEc8eWoRa6mSmSXOpHSw+
    PAT2f7O/ONzu4AdsITY5bBnxHa9En5mXi0Q8zd0NrTSBva/b0y6XXK0oDybQ
X-ME-Proxy: <xmx:97vsapbYa28kwXLag7bdvrYpGfjpFzQ0otF50vdkho-5xKtam1CrwQ>
    <xmx:97vsapxHMOXF9Zj2HCtZ5wswPnjmTZThOjANg2PoUm5i614ExRq2gQ>
    <xmx:97vsakfjsxEpZYc3QElNCrnoSmDSosXnjThqA_oua2I7rTwcyFFFqg>
    <xmx:97vsanINdnt1stjYkAeyzV0IFj1u-TBQXfzku6b33yjabUC2ZZJRUQ>
    <xmx:-rvsalItevP5cJfM3jxsoc0Guq141usE2oBMNoCtmKQh3CZBdAG8giYB>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 76FF532A0097; Thu,  5 Nov 2026 12:25:08 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: A58_iQTPKAxw
Date: Thu, 05 Nov 2026 18:24:48 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: "Lee Jones" <lee@kernel.org>, "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Peter Griffin" <peter.griffin@linaro.org>,
 "Alim Akhtar" <alim.akhtar@samsung.com>,
 "Russell King" <linux@armlinux.org.uk>, "Mark Brown" <broonie@kernel.org>,
 "Charles Keepax" <ckeepax@opensource.cirrus.com>,
 "Linus Walleij" <linusw@kernel.org>, "Bartosz Golaszewski" <brgl@bgdev.pl>,
 mfd@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org
Message-Id: <9fa9add9-6bba-4cd9-9f15-d6ca222a1a23@app.fastmail.com>
In-Reply-To: <auy4Qbxg-pW_X37E@google.com>
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
 <20261024-samsung-kp-v4-1-e21253295e68@gmail.com>
 <20261104181429.GE1650678@google.com>
 <ad02069b0cdede7ae191e4a3df57f33a@gmail.com>
 <20261105085321.GG1650678@google.com>
 <85817548-28f8-45ed-987d-a4996c2bc4ce@app.fastmail.com>
 <auy4Qbxg-pW_X37E@google.com>
Subject: Re: [PATCH v4 1/4] mfd: wm831x: Support software nodes for DCDC regulators
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Nov 5, 2026, at 18:12, Dmitry Torokhov wrote:
> On Thu, Nov 05, 2026 at 02:43:17PM +0100, Arnd Bergmann wrote:
>> 
>> As far as I understand the situation, wm831x was used on the
>> reference board (Samsung smdk6410, removed in 2019) in addition
>> to crag6410 but never anywhere else upstream. The question
>> then is whether we'll ever see a DT conversion of crag6410.
>> This would require finding someone willing to actually do
>> the work, and coming up with a way to handle the autodetection
>> in mach-crag6410-module.c so the correct spi/i2c codec
>> child devices are probed.
>
> So I guess the question then: do we need to keep this board at all? Or
> it is time for it to go the way of the dodo? And then we could drop some
> more drivers as well.
>
> My goal for the series was to move along legacy gpio API conversions, as
> well as move away from the GPIO lookup tables (ideally I want them gone
> now that we have software nodes supporting describing GPIOs).

Mark Brown is using the board for testing eight Cirrus/Wolfson
audio codecs:

 - arizona and wm8994 have actual users with DT, but this is
   the board he has for testing with platform_data

 - wm0010, wm1250-ev1, wm5100, wm8996 and wm9081 have no other
   upstream users besides this board and no DT support, so arguably
   these are probably obsolete and could also be removed.

I assume Charles can comment on how important the testing still
is for the codec above, or if there is other hardware that could
be used for testing the arizona and wm8994 drivers in case the
other ones are in fact as obsolete as they appear.

       Arnd
