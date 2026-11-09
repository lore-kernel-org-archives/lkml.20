Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794215217;
	b=NNbuzbgLZdQOFX6ojV0tHJMu2KqAeMbU3SFVAVlkAOrFbnN4MUta7l0++RgogTUn8/qf
	 QqFo7oWFKgHwLCognVdWIt3Ok6gHlstUfH+HLrvUHDjrs1l4kA0II7Q0W0qioG4flGaJz
	 7Hr3RIvL4RGaOGcbLJCrHSCvzQ4KTXNS9xMC/5c1I3OtjgHQPoiABY86Q0BW7vJl1Mvro
	 OZaDZnhf62i6Hv6wbDhA3QDOdlkeiwUx8QyIVzPzwRcy42ps1Tubz2ozORkQvDNf8xvuM
	 Itg1+Ak0wBHuIbvDshS/wTNSDIGmxIf+yOU/xgcF6ccmqb8r2bpW1e+Uc7bzgGSlJAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794215217;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:
	 References:User-Agent:Date:Message-ID:MIME-Version:Content-Type;
	bh=+DtZ7KHlWFW9dVfF6zjD7yk0+18lEu8fKpeuCrRtv7k=;
	b=gLdC5J4KDwj/Ef+jOY4jjfvo2hBywV9HBAId3aJ56PN1P0wyGOXzeAbV1qj9m8XHEWsp
	 Q6tX08ZQ177gvZmS8V1W8/brzn1APelv8ZSsQkucfXrnvFnCMctD9bLPbrlhCnf4g2Zip
	 Il5U3Ij4rXiC+t/4hW+iPpXYB1NGg+KR47vKHQkyZ61Zs3vU+fkuhgneh5pMHqtAOZLon
	 SjIdsPhBgvAnyL498X1vE0hX9R5hnNadhqjI1wPxmQp3lfPYHnoR3/Xm2A57h+RY2DJhA
	 k1iJaJopFeOw1Z/leAAOFAh2g+b0kLt9lHlo4a/RraqhVIFucJc/ATCf94yG5FY/3lg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=WVq5Rx8Z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D7D606A323;
	Mon,  9 Nov 2026 09:06:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3D7D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=WVq5Rx8Z
Received: from ratatoskr.pengutronix.de (unknown [IPv6:2a00:1f:f805:2b01:a03:2f4:308a:7b52])
	(Authenticated sender: str@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id C6EA9200ABF;
	Mon, 09 Nov 2026 10:06:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794215208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+DtZ7KHlWFW9dVfF6zjD7yk0+18lEu8fKpeuCrRtv7k=;
	b=WVq5Rx8ZoUxvHAaoB8Dq6aA1lBk0P/H4t3rZFjJp1onPwObugyhEjg5xwXO+i9EoKtKZhq
	AcQ39IAorFSg/0tyKCHoSGwTB+6Bw0poiugp6RRBSCOUFKVHP50IlBxToDiyxIPS76xLcy
	WEIsJx5OyilXHb4fnPiAZwZMWqJkyR1x6H+MCOwgfe8IdQ5sIym7d/Njv4Rx5znLP3xudb
	4wcP+OHhPgsTOGjMQcNzWHuAqQlVnxxfvaDjyYXtwb7J6UzDgqtce2ZcX/cHLE75i1y4mX
	029OTRmZltTic56PZp8ovOcQny+Qwm9Aw6hZMIA3pdf6z9mKNH8aHLV8AoLj8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794215208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+DtZ7KHlWFW9dVfF6zjD7yk0+18lEu8fKpeuCrRtv7k=;
	b=JrJjBMVDHh63w//pEpoICNa4C7XRUvep8URP44f0FrnQFNNn91NKL6D/uunzrS+N/7TaDZ
	TN2KXH96cRrRNPtqS3GoKuXEH3DCEPF8tsaR4JHOtmKQ1PSJ8nLPCAATOCO077x98hjw3A
	P8PpMakyd0SUwyLKz/LdGKeAMx4zhsbh7qjdIPjRiTPGqdb7S/Zi/zu2lthONhrV1JF87b
	4IB2IzHJMZ0DKH6gtCMh+nHquKURAX005F4ur5zN0FFC8+MOk72NnqJOVca7Va1EK+B4II
	ehmQKR7ADSLDO2thJk8uyCTDrJ74CxDRl67hROuB9+P7RrjSbgfOAgUCXd9IKA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794215208; a=rsa-sha256;
	cv=none;
	b=RkGpFIaeRX9mJqRNpOq1YveFioi0f+74ngkBxzy0t2mVwU5NQ0tMArUJAgaD7cL9gtJqAi
	9LLrrIVI36oKMtN4J1qulRWqlsI7YJb7FpYGqCU6M4sSj76RHedfYQ+mVnlA2kIVzm3gAf
	RMjzlkazLGMzn8a/zV0sryhw2Z2DE/jlJHbtMM6HUqY9bA/l8ldbXHUiwNkvtM0FSmh02g
	JW+YD2eBdZtwsbv7diRzvXLcbhoE+G5y/aJROC+H8uDQQHJ5OvK7TYLZ0y7zub2Fzvu/cY
	Hs5o3zfSiEdwrnsXpoddQldraaQmAPcTzv2TGGG9mOk1vamURmI1aB77V1zARg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=str@pengutronix.de smtp.mailfrom=s.trumtrar@pengutronix.de
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Frank Li
 <Frank.Li@nxp.com>,  Sascha Hauer <s.hauer@pengutronix.de>,  Pengutronix
 Kernel Team <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,
  Shawn Guo <shawnguo@kernel.org>,  =?utf-8?Q?S=C3=B8ren?= Andersen
 <san@skov.dk>,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v10 3/4] arm64: dts: imx8mp-skov-revc: convert to overlays
In-Reply-To: <a8a10c4b-993d-4cd4-9e99-fe7b0eff5597@kernel.org>
References: <20261012-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v10-0-0906e57486a3@pengutronix.de>
	<20261012-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v10-3-0906e57486a3@pengutronix.de>
	<20261013-musical-brown-mamba-ff87a8@quoll>
	<87v774j0z8.fsf@pengutronix.de>
	<a8a10c4b-993d-4cd4-9e99-fe7b0eff5597@kernel.org>
User-Agent: mu4e 1.14.3; emacs 31.1
Date: Mon, 09 Nov 2026 10:06:47 +0100
Message-ID: <871p8uidaw.fsf@pengutronix.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; format=flowed

On 2026-10-14 at 07:53 +02, Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 14/10/2026 07:38, Steffen Trumtrar wrote:
> > 
> > Hi,
> > 
> > On 2026-10-13 at 09:31 +02, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > 
> >> On Mon, Oct 12, 2026 at 08:30:32AM +0200, Steffen Trumtrar wrote:
> >>> The i.MX8MP Skov RevC jutouch 10" and Tian 7" variants are pretty
> >>> similar, apart from the Display and touch controller.
> >>>
> >>> Move the common bindings to imx8mp-skov-revc-touch.dts and convert both
> >>> variants to use overlays applied on this base version.
> >>>
> >>> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> >>> ---
> >>>  arch/arm64/boot/dts/freescale/Makefile             |  5 ++
> >>>  .../imx8mp-skov-revc-jutouch-jt101tm023.dtso       | 38 ++++++++++
> >>>  .../dts/freescale/imx8mp-skov-revc-tian-g07017.dts | 81 ----------------------
> >>>  .../freescale/imx8mp-skov-revc-tian-g07017.dtso    | 40 +++++++++++
> >>>  ...h-jt101tm023.dts => imx8mp-skov-revc-touch.dts} | 26 +++----
> >>>  5 files changed, 91 insertions(+), 99 deletions(-)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> >>> index 475e1ad9116e1..7c1b61249778e 100644
> >>> --- a/arch/arm64/boot/dts/freescale/Makefile
> >>> +++ b/arch/arm64/boot/dts/freescale/Makefile
> >>> @@ -707,6 +707,11 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-lt6.dtb
> >>>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-mi1010ait-1cp1.dtb
> >>>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-bd500.dtb
> >>>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-hdmi.dtb
> >>> +
> >>> +imx8mp-skov-revc-jutouch-jt101tm023-dtbs += imx8mp-skov-revc-touch.dtb \
> >>> +	imx8mp-skov-revc-jutouch-jt101tm023.dtbo
> >>> +imx8mp-skov-revc-tian-g07017-dtbs += imx8mp-skov-revc-touch.dtb \
> >>> +	imx8mp-skov-revc-tian-g07017.dtbo
> >>>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-jutouch-jt101tm023.dtb
> >>>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
> >>>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev.dtb
> >>> diff --git
> >>> a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dtso
> >>> b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dtso
> >>> new file mode 100644
> >>> index 0000000000000..33ddd08a7adb5
> >>> --- /dev/null
> >>> +++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dtso
> >>
> >> I do not understand this. This is a board, so not an overlay.
> > 
> > yes, that's what I did up until v4. New board with new dts.
> > 
> > - Link to v4: https://patch.msgid.link/20260706-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v4-0-dfc0c8827c02@pengutronix.de
> > 
> > The boards are all very similar apart from the touch panel, but they are all
> > "real" boards and don't share a SOM, so dtsi is also not correct.
> > 
> 
> So why this is not a DTS?

One could argue, that the board, the RevC-Touch, is always the same hardware and there is only a different panel connected to it. Which is what is really happening. The panel is an attached device with these boards. So, imx8mp-skov-revc-touch is the board without any touchpanel connected. This still boots and is a standalone board where you can connect different touch panels to.

So, Peng [1] and Frank [2] are correct when they suggested overlays in v4, no?

[1] https://lore.kernel.org/all/akupDXc1QA4uKfR6@shlinux89/
[2] https://lore.kernel.org/all/ak5nKnRUmOxDxgZd@SMW015318/


Best regard,
Steffen

-- 
Pengutronix e.K.                | Dipl.-Inform. Steffen Trumtrar |
Steuerwalder Str. 21            | https://www.pengutronix.de/    |
31137 Hildesheim, Germany       | Phone: +49-5121-206917-0       |
Amtsgericht Hildesheim, HRA 2686| Fax:   +49-5121-206917-5555    |
