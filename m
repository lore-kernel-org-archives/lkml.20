Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEFB568555
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 13:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788960666; cv=none; b=Xle8XXs7pEVdll9IYeYJFmNzc5clu94jPH5s7bK7VtTSLBtjkPbCJZe1aI8QZMBUGyYdg/yTpTUUi4lqcSIR9SjBgPCmQdEmCbCFeuTDalBo1XoU8B15f9LJhmy1y3450pFwyBnI3pjpi0u0RiaxzXWX0YjHXknta4j390VZN0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788960666; c=relaxed/simple;
	bh=tSZmWI3WMl8tWaOBP0ahtlOP4eedWZMbc2Q2O+/fDOo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=JQ09Lz5R3zCh2iOxKLO14yxfuSTldB6/F7skKB8MHCzcxiDL3qI0Ygz04o2Rr0S2KRwrvuZDRxI+w3qxXg30FzTkDVpxFLyVjPD0T9MadBxKRQry7W8Ysg6lwumkFboZ9BgIshK7FUUP1NQIIGxylwAmuaeKUxN1XZq0XEvRX70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pm34ME+b; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pm34ME+b"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D4DBE4E415AB;
	Wed,  9 Sep 2026 13:31:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9601F60448;
	Wed,  9 Sep 2026 13:31:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5D0B111C782BF;
	Wed,  9 Sep 2026 15:30:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788960660; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=65S/g26rsIYc293bqqdAgYthP326wPVw2dYL3pCDAuM=;
	b=pm34ME+b1ziq7xG3Trwk7zAzGqKc0ySsqNjOSerYyD6toHJoUrUzWJ462O6W3rYLwvK76l
	LHEAjXG8xrqmj1YUXkva11I86dfbT33f+/rd5a1CjXrOCm/BjuWsjL8R0RrVD08cnMu08T
	VT3/1jLGEsuO9chCd3pFbxVf20FWXgeqFXLAq4cZ09qdS9Dekt5Yrq/bzN/Sr21OFVgpAy
	VSX4Wwo+fPd6cK6hWhir4VbHM2qrLXv9PPeJWKjRcXmV2bqvr9o/PR35Qam7bcnn3yqeav
	n18LhFx+R3WdiVLZTKERuie6d9E0d+zF1hOH7wW8vZrMaMNA0YAfcgc/O9fB4A==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Sep 2026 15:30:53 +0200
Message-Id: <DLATMIFKDMHV.24XNMCRI2ZKBI@bootlin.com>
Cc: <tessolveupstream@gmail.com>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <marex@denx.de>, <valentin@compulab.co.il>,
 <philippe.schenker@toradex.com>, <alexander.stein@ew.tq-group.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
To: "Ernest Van Hoecke" <ernestvanhoecke@gmail.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 1/1] drm: bridge: ti-sn65dsi83: Fix DSI mode flags
 for stable LVDS output
X-Mailer: aerc 0.22.0
References: <20260412053811.662461-2-tessolveupstream@gmail.com>
 <DHTJJRKD65L4.1P7X5O20V1W2Q@bootlin.com>
 <c4c33f14-0da0-447a-ab82-2e2f65c09c07@gmail.com>
 <7056b23b-ed81-4d79-b782-5cfcb0102ef7@gmail.com>
 <60a24977-b181-40e4-bcf6-38b65af293e2@gmail.com>
 <DI18PL73UQKR.2YZVZ21V69H7O@bootlin.com>
 <e88af0b7-388d-4b0a-8eb2-a367e24e84fb@gmail.com>
 <DIMMKNT9RHYM.1BRF1S1V5SIKI@bootlin.com>
 <1716be56-ac43-440b-a5df-58cbf571ba95@gmail.com>
 <DINH3J2SM26P.3KE6GE9VPB1OC@bootlin.com>
 <3hfae2i2i2toxbo7hg2if6pztaswgnfj65xfm2c4ofljc6jhua@slaqoewn4mxq>
In-Reply-To: <3hfae2i2i2toxbo7hg2if6pztaswgnfj65xfm2c4ofljc6jhua@slaqoewn4mxq>
X-Last-TLS-Session-Version: TLSv1.3

Hello Ernest,

On Fri Sep 4, 2026 at 2:02 PM CEST, Ernest Van Hoecke wrote:

[...]

>> > Also, from our testing, when using:
>> >
>> > dsi->mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
>> >           MIPI_DSI_MODE_VIDEO_NO_HSA | MIPI_DSI_MODE_NO_EOT_PACKET;
>> >
>> > we are not able to get display output.
>>
>> This is the case for the panel I worked on as well. In the practice we b=
oth
>> observe that non-burst mode is what fixes the panel, but there is no cle=
ar
>> explanation of the reason in the docs (that's what I hope to discover fr=
om
>> TI).
>>
> I am testing a DSI panel on our Verdin iMX8MP module, and noticed that
> this caused a regression.

Ouch :(

> In v4 of this series only the change removing NO_HFP and NO_HBP was
> applied. [1]
>
> For us, the display worked before that change. So with
> MIPI_DSI_MODE_VIDEO_BURST | MIPI_DSI_MODE_VIDEO_NO_HBP |
> MIPI_DSI_MODE_VIDEO_NO_HFP: things are fine.
>
> But with only MIPI_DSI_MODE_VIDEO_NO_HBP | MIPI_DSI_MODE_VIDEO_NO_HFP
> removed, it no longer works.

That's strange, IIRC that removal was just changing an incorrect behaviour
into the correct one. At least, according to the datasheet.

Do you have some more insight on what's going on ith your board? If you
could check your clock tree and panel timings in particular that would be
good: if you have incorrect timings or clocks, pretty much any change
anywhere (correct or not) has some probability of hiding the problem.

> I can verify that if I also remove
> MIPI_DSI_MODE_VIDEO_BURST, things work fine again.
>
> How can we proceed, will we be applying the removal of
> MIPI_DSI_MODE_VIDEO_BURST soon?

No, I'm afraid that's not going to happen. See the discussion starting at
https://lore.kernel.org/r/ahsxWhXMhzbAj_3G@Seans-MacBook-Pro.local

> I think we'll need to either revert this and later apply both together
> when ready, or apply the second patch now as well. Right now, it broke
> the DSI panel behind a TI sn65dsi83 bridge on v7.3-rc1.

Reverting is surely the last resort. If you can answer the above questions
it would be good, maybe we find out reverting is not necessary, and worst
case we'll revert with better understanding on what went wrong, and maybe
come up with a new fix that doesn't regress.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
