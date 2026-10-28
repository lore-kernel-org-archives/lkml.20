Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793215398;
	b=iTwv0Ilj9L3SmE+ZjWUb5kydE5cw5uNQm2/+08PIIVINQkni1FyWzhiSPFY0Z5hOSKaQ
	 zLrE8Ljx97XMftpbFpEVbDTlGS50keChCv77zZNPrcFTIckIhtih5K5bjmPQswBoa8cPu
	 r+zMUI2pW1xHlpsyWGjlyUM2ot8lVTdlET985o8z8HhaAchBbZWlSDGxN/Su2RIzMWxD1
	 16Bmm1KnQraRSCvRZi6Ap2rrtAV+7E1EFZ/084bNQyDIovHn01Qvh7cb/cQlL0FoFik8b
	 XcF909n0FI+0+0yX5aQglSxnqAvEQ3jcgoXljnVq+d2jz/1PY+SM36cQZWq2pUNPl9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793215398;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-Last-TLS-Session-Version;
	bh=+CT7xNi4V7NLtmTPotvfL9tR5+vobSh/WC6FmZZIHvM=;
	b=orEggqLadjs7f3/cgkay9kyPuzAUjN52ObWebQvQTWdkADEMjdxqtEA1Uk7on8xRqQua
	 qM5d9po26Uh8iQxiQnDu64yS5nfwKEU4Fmo8dxlCV3Iorq9Gfiaaamdz54h2zHD34U23+
	 RYZfzaNYSvvYHtF4KgAmHVA8vjCD/c/AsVBGsoFYluHnkgmAWHIim34o1qA+kbdw0b4W6
	 J+9r/A/HidWF1Vw7Sb98PZR7RlT7GdicIBaKt9wOKSf+7klCLLWKVpODdrePHOZLS4xpC
	 mN2i6Da4I5Lg8kKS7HIaGLTOs2G1ueZmjLx8N0LgoMg4keDLae9tZN2wv/ncDdiWZkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=HFU5aeAG;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F964606A31C;
	Wed, 28 Oct 2026 19:23:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F964606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=HFU5aeAG
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BB3D4A161B;
	Wed, 28 Oct 2026 20:23:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1793215387; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+CT7xNi4V7NLtmTPotvfL9tR5+vobSh/WC6FmZZIHvM=;
	b=HFU5aeAGXzRBm09k2dM7cQWoCtg//2oUMTXHstAoG6EqNQ3uNEi/MXR8AMBcnD0TbDb7UP
	GiNG+mrbd8yJ1dmaI8noLT3VbC0Zgi2/O6DZ+A4YuegMc3HfwrxVHEnHywu72kDsLaDgj8
	Ms+nLFAoY9gwcKsVJ4eG8+AYxW3z3Hy2MFzy1hWyNqGbLY8MlBt/s5Iw5T1ww30DlzMXTy
	QfbeajXrNS12a7wTZARTmnMUWSoRYLsdYRl0xvaQtBvfE3HUnjCy+1lvKzNnNzJ7bZucNi
	4DIa/Pm2zfV+Bh4Kr9FwrIKGe/jUCPOW8lQE5zwf4JDV7P7DmEtpsEqSElzOMA==
Message-ID: <28a80e7bc00ef3a30b841142ecd08cf4908fc6a8.camel@tipi-net.de>
Subject: Re: [PATCH] usb: xhci: Relax high-speed bulk max packet size rules
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Michal Pecio <michal.pecio@gmail.com>, Mathias Nyman
	 <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Wed, 28 Oct 2026 20:23:05 +0100
In-Reply-To: <20261028104329.3d1c8029.michal.pecio@gmail.com>
References: <20261028104329.3d1c8029.michal.pecio@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3

Hi Michal

On Wed, 2026-10-28 at 10:43 +0100, Michal Pecio wrote:
> Nicolai reported multiple dodgy high-speed devices still being made
> which declare out-of-spec bulk wMaxPacketSize and actually require
> the host to use it for correct operation. Apparently, Windows copies
> this field to the EP Context verbatim and other Linux HCDs like EHCI
> and DWC2 do similar things for compatibility's sake.

Thanks for picking this up!

>=20
> We are also aware of devices like astronomical cameras which use 1KB
> to reduce protocol overhead, and audio devices with MIDI endpoints
> that specify unusual MPS like 8 or 4 (the latter was full-speed) and
> work with larger sizes just fine because they never do multi-packet
> transfers where MPS really matters.
>=20
> I found that sensible (power of two, 8 - 512) MPS are usable on many
> xHCI controllers from vendors like AMD, ASMedia, Fresco, NEC/Renesas,
> and VIA. Nicolai also tested two Raspberry Pi SBCs and a modern Intel
> machine running Windows 11 and 64B endpoints worked.
>=20
> OTOH, Etron rejects Configure Endpoint if MPS !=3D 512. For such cases,
> commit e4f47e3675e6 ("USB: xHCI: override bogus bulk wMaxPacketSize
> values") sets HS bulk MPS to 512, which obviously breaks those dodgy
> devices that perform multi-packet transfers with other size.
>=20
> Problematic devices known so far use power of two MPS of at least 64,
> so try to recognize them with this heuristic. Non power of two or
> small MPS seems to indicate a clueless device which treats bulk like
> interrupt and specifies intended transfer size; we will use standard
> MPS here to avoid trouble with potential other HCs like Etron.
>=20
> Reported-by: Nicolai Buchwitz <nb@tipi-net.de>
> Closes:
> https://lore.kernel.org/linux-usb/20261020-fix-usbtmc-short-packets-v1-0-=
903f4d029193@tipi-net.de/
> Link:
> https://lore.kernel.org/linux-usb/93d5aeb4-f1c7-9342-7bc5-4b277b4ec55e@ve=
ikia.lt/
> Link:
> https://lore.kernel.org/alsa-devel/CAE-xCyPhrS6pgY0T9SG0TCubSi0CE2Yd5H=3D=
ttOzBmvgrR8fTPA@mail.gmail.com/
> Link:
> https://lore.kernel.org/linux-usb/348c50de-f922-8295-ef87-cf5cdea5c7f4@gm=
ail.com/
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
> ---
> [...]


I ran the patch on a Raspberry Pi CM4S with a Rigol=C2=A0DP832A.
Multi-packet replies up to ~1 KB and writes up to 760 bytes
work fine. dmesg doesn't show anything suspicious.


Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
Tested-by: Nicolai Buchwitz <nb@tipi-net.de> # BCM2711 in XHCI mode

Regards,
Nicolai

--=20
Nicolai Buchwitz <nb@tipi-net.de>
