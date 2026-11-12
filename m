Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794493120;
	b=euC2o9x79Slqg4Cm0qZv5efU+bi8nhF65pGDxi05+KQfVHrfjuX4wL+L1toYOgtbv7+3
	 u8J2WN6jW/+OXAgce8lKGWKCdsWAwaPQgAG8laAJAsot9iO+c+IureTMIAAPJByZbldzt
	 GiaPYvwjGWPHs0dIYGpXOzt6NeMUQGH368LqaMNV01Xl7dBxh0uE4XtBMfz7X9GvqJ1lW
	 SbxaVozTklBgKelQCmDQ/VRTMG9dztlFKhyTewDYZFATwAKVacFQbzlAO2Q5oazrNdoHC
	 JIwCQ6Go/90DZ7WcyL1YakdXUonzxs8aCheCOMVNjKvyOEzaIxOxANOirv/E7d3J8FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794493120;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:Cc:To:
	 From:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=3Y26hQ4GBfC0y7Md5mdtfAPI7BfM2am8ejTyNSm7PVs=;
	b=ykRfm/uo8/n6fY3UfuLHBP7xYykXqNB9yDcAyHVOUxpn96bBRd4gVo9ws66u8LhTGFkx
	 FPaxIy1Pdh0aVy/1rBoKJbIDnx6sBAqFjRBREFtCWkb4aeBODXje6XjpYvrM2IVj8KD+n
	 hVlpqTPqnZfMfgus4KDn766nLv79nRnqq0ks0w0hgN/BzzOeqSrJfO9UKmruHLUDfSxCs
	 Ydk91HhyiXdPKbewZdLgigUIkIcVMwFj8I9T1GSlHc3wvKofCI9xhxiYT+42CkyxyTE61
	 coqba5JPO54oiNbCXo2B2Dxtz+0NZjzVdmn+6znU/AulipGkb+LMxq3hniAIp6PitbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=CfQymQcn;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3A560A3834
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:18:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A3A560A3834
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=CfQymQcn
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 697381A162A;
	Thu, 12 Nov 2026 14:18:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 356AA5FF85;
	Thu, 12 Nov 2026 14:18:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 591BC11BC04F1;
	Thu, 12 Nov 2026 15:18:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794493115; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3Y26hQ4GBfC0y7Md5mdtfAPI7BfM2am8ejTyNSm7PVs=;
	b=CfQymQcnMNPEoq8O7tqc0VmobtUb8luPkxpUWVF6dle9DZRS9AX4BlEBKEkReL26+NKa+S
	Qs5UdA2bDHst3dk79WYj8I8jzJX7bS0Iyj/xsFi1yKrKQX67p5E7IFzX3RnQVeYAH8Sffe
	kh8e+yBm2ZGEEq5r9xw9Xb8VbcJXDLWLzJBD7sAxznzpUs0mhze3KjAwC82gLfIpfLCHEv
	bpX9oi/Vjx6kCwKzEJUrbRVW+8wfZn5lZedH1JIpVHJ92BnkAkKXzJrG16pmKBNNvT+NiC
	ZGlHrUrtpbbJwaAc8C4/j/WVpmHQly61B/AYW8bzH/BwlB4FBXdGSpVfUEkvrg==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Nov 2026 15:18:29 +0100
Message-Id: <DMTAPTXHND0A.2MQ607DNUS9ZD@bootlin.com>
Subject: Re: [PATCH] drm/mipi-dbi: hide unused mipi_dbi_dcs_read_commands
 array
Cc: "Arnd Bergmann" <arnd@arndb.de>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, "David Lechner"
 <david@lechnology.com>, "Luca Ceresoli" <luca.ceresoli@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
To: "Arnd Bergmann" <arnd@kernel.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.22.0
References: <20261111092404.2117072-1-arnd@kernel.org>
In-Reply-To: <20261111092404.2117072-1-arnd@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Nov 11, 2026 at 10:23 AM CET, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> When -Wunused-const-variable is enabled and SPI is turned off, gcc
> warns about this array being unused but defined locally:
>
> drivers/gpu/drm/drm_mipi_dbi.c:79:17: error: 'mipi_dbi_dcs_read_commands'=
 defined but not used [-Werror=3Dunused-const-variable=3D]
>    79 | static const u8 mipi_dbi_dcs_read_commands[] =3D {
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Move it into the block that actually uses it.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Could even be moved inside the only function using it.

Anyway:
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
