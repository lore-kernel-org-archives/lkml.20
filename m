Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794230885;
	b=w0XlwO+jZx4n7Ze9sKxfhMLYr/38Q19qSNVBz4EsyXth39Ln/9RUJcmBrBtv0l+dMI9C
	 AP13x/FLOMGolXL6yyjPjZf2hQLMqi+sbNRJJqcyuELO8iG4KawIpqmNcbxpBj4g63SDm
	 bQ2dUli2Jq6MgzT7R18+sWAFEss9RM2Ntfk9LLfPbZ7X6RbT41cGwdB4GLSIOrmLsZrNa
	 PdmANjf72YzlVWG+mVlG+gcB67Ivc6xpxxdVP0LIrFD3KuxO4wDtCIp5zeBgbnDr95Ycg
	 DhigyRINdzyDOg2rUJuUP6f0YFytmMiL4OTKGTOFTcEa1vEUbyRNrbLm5AxKU/8e3gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794230885;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=d1CDxwvd6FwMPzqWiptzkkTL3Tfq+jCUCb3bvgTMGjI=;
	b=qYc3yTJWa6LDOKe6bILgIWH7HPDEVXdOZOgCP6LmCZaZHJpZDhziI/N5nDlLuoxHz3HK
	 8NgSfXDazix6l8ze9YiMlKrq3wAU5idlDbkkaRUonNkfTfW5Saj3Tz6rqBWeWO+qUInHi
	 IUk+juy6yFxAyXq9/d5zeZNZ97k9o6XYowFVTApS9YLZSXbhesF9oOIUJaMgC6V1dtXgj
	 FIHxhYCk9VBiKK5OJgUaomqShjggjQPkcdK/RznabCDTQJa5A1JzyZpuW34R+HX4u9C9X
	 k2K87hNKO8pHD3xQ/FqQpRR/1kCIe+zTrieAy80hdDjphsQgMLAj7c/p1FGmPG5roAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=nVzjVU8O;
	arc=none smtp.remote-ip=109.224.244.122
Received: from mail-244122.protonmail.ch (mail-244122.protonmail.ch [109.224.244.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A601606A31C;
	Mon,  9 Nov 2026 13:28:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A601606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=nVzjVU8O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794230879; x=1794490079;
	bh=d1CDxwvd6FwMPzqWiptzkkTL3Tfq+jCUCb3bvgTMGjI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=nVzjVU8OkAQj5/qD5urYjmL2pK8F8+9HDrOTDT1+nSYUY+UJU5hBj2SS6P5RwKfT9
	 h2aFdqPTQ5RC6RYY+n3U2oUWia5S18b2w0q2fs148IfdcyFnQT1N02e6BjJD//KEsb
	 lAvcTCYW2E9YimJGTuFfVw0TE7nfKc1B3CU2hQVOvup5W8IdH2CCz+oumLuigxDCMk
	 L1IYwFCfXvm5QuOQg+nTqKVpoK8d0OZyP34yGMYO8ODihmXusbtvX2ddG8StX5qoiA
	 X/VFM3irnn7RBRgv3Pwj7v9jX+ZxIgWLNVkkiJHem5sv+pGf4KOYiSA9et3WFn1T8P
	 PjD7zOD7wSHZQ==
Date: Mon, 09 Nov 2026 13:27:53 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Marshall <pm@petermarshall.ca>, George Neacsu <geocausa@gmail.com>, Hao Yao <hao.yao@intel.com>, Fernando Rimoli <fernandorimoli11@gmail.com>, "D. Manresa" <dmanresa@gmail.com>, Jizhou Tong <fqwqf@fqwqf.xyz>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] media: i2c: Add ST VD55G0 global shutter sensor driver
Message-ID: <20261109132746.22125-1-lsa.uz@pm.me>
In-Reply-To: <avHDwGAe99WYaty9@kekkonen.localdomain>
References: <20261109093353.3757-1-lsa.uz@pm.me> <20261109093353.3757-3-lsa.uz@pm.me> <avGwRaKSqXdtXkII@kekkonen.localdomain> <20261109124610.85065-1-lsa.uz@pm.me> <avHDwGAe99WYaty9@kekkonen.localdomain>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: a3bee21ddf5233bc865bcf357b8e7637d7aa5563
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

On Mon, Nov 09, 2026 at 02:59:44PM +0200, Sakari Ailus wrote:
>> >> +static const s64 vd55g0_ev_bias_menu[] =3D {
>> >> +=09-3000, -2500, -2000, -1500, -1000, -500,
>> >> +=09    0,
>> >> +=09  500,  1000,  1500,  2000,  2500, 3000,
>> >
>> > Is this
>>
>> The sentence seems to have been cut off here. What did you mean? The
>> table is vd55g1's, in the control's 0.001 EV units.
>
> Uh, yes. I meant to ask if this is a firmware limitation. I guess so?

No, it is the driver's. The firmware has both a target and a
compensation register (UM2829, 14.7.3, Table 39 [1]):

  AE_COMPENSATION       VALUE  15:0  SFP 8.8  Compensation in EV
  AE_TARGET_PERCENTAGE  VALUE  15:0  UI       Percentage relative to satura=
tion

where "100 means saturated image". The driver writes the target from
this table, 27 * 2^EV, as vd55g1 does:

=09static const unsigned int index2exposure_target[] =3D {
=09=093, 5, 7, 10, 14, 19, 27, 38, 54, 76, 108, 153, 216,
=09};

So +2.5 and +3 EV ask for 153 and 216, above saturation; I have not
tested what the AE does there.

v4 keeps vd55g1's table, unless you or Benjamin prefer the compensation
register.

[1] https://www.st.com/resource/en/user_manual/um2829-how-to-integrate-and-=
configure-the-vd55g0-device-from-a-hardware-and-software-perspective-stmicr=
oelectronics.pdf

Sergey

