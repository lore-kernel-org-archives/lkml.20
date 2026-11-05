Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793865676;
	b=Quvqxl1Y4n1BYxu07rOpo1lHZ7P4kaNxzPWkjRRwapd5/h6rcgRJSTg3mCfb2zr0g2tp
	 XwNBu0oL+UoY0rOgQTvK4Mdc7EAwDw/kcAVIH82/cc/Z/q36DYUFmaZ2BBQeJXSUBbQcm
	 haESW86E57dxZ/pLEzO1IOCZad0+JLN+XN9OJZUyHgF/McXBPBEXhWpEK9RxaMSIb+8tI
	 YCwqwIt+nyzcIjc08gknckwBn6q5pa4egH+WAa9LHpJYlipw7HmBWgAzi7XK7ZOiS2REz
	 Y9LPn1p8CX6p1h46n1mKl3ZP+NzWTAdjEMfJD47Vo/YwvtsvC4yN0E5k80tJNIL0/9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793865676;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:Cc:To:
	 From:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=xPeXs/cCgecXVh9tV+AI0gUUFEPocWOjRn6uXkww8Us=;
	b=ZxkrouKfRUy5+BS1g2VueCRMpHII8FVqCpcoJsAFos8SmRksVovhjNnMWyfSR1GMDRxy
	 84hiqUIvy4cjIRoPiV9t6KPyyWh1PUmdeckKE6P1ZRVBZPKQf00pPLF4RcDsViemfGSOm
	 JhuFEHAxSrbJCLhVB2uHkscBj7Sj7fHbn/2ZYdYYE2EIaBTCfkaPzjYBNym+8wvZqAMCM
	 IgYV4AfXErnpsotOGCrlWcJqdMUjyqR6rukB26It0BNmP5j6STKK9c+VshDolm2ITX9j6
	 sO5pavhVdfZUWljOyTrWlsPg1cUgXUHii2DVBrOR8r5tJH1iSeld382gGm0oJ6vQ7zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=27nxKHnl;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A43606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:01:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2A43606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=27nxKHnl
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id DF856C69153;
	Thu,  5 Nov 2026 08:01:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B30CA5FF85;
	Thu,  5 Nov 2026 08:01:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AAE9210329245;
	Thu,  5 Nov 2026 09:01:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793865671; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xPeXs/cCgecXVh9tV+AI0gUUFEPocWOjRn6uXkww8Us=;
	b=27nxKHnlXDS3AgWkXuSqNIp4q7lxFVvtyzlfZ/j8Jit2M2nM8L4IFtf1g/YXI33wgZIT4h
	DAYpQpFoenE1rYvAKiPQ7jg/42XnHix0aliANc0kKo6jwJM/Qf83GQPeKnbE4fiYJyLm4x
	JnJzMTz6AofvsqNmrrj/ZyVxgRvNn2VJ2moprvkwvq4tZjmsPsi9FT+UEZSnbspD8Ny5ec
	tHQxn3mmNFnQ3K6mPfqv2/wJZnPgU59oRqXvv9NtxBiYnnmQiGCA1ETDXSMuRva9QQQxz1
	iC4lnW/tO5Pl/fTvSkvlTHwvGhyEZRftsU2Y9jVkK8yjJrb4wQSb2nU6cyURFQ==
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
Date: Thu, 05 Nov 2026 09:01:06 +0100
Message-Id: <DMN4B2PHU3MM.KQ59QQ6P4FCO@bootlin.com>
Subject: Re: [PATCH] drm/bridge: fsl-ldb: Remove panel naming and use scoped
 device_node cleanup
Cc: "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
To: "Laurentiu Palcu" <laurentiu.palcu@oss.nxp.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.22.0
References: <20261030163254.3175671-1-laurentiu.palcu@oss.nxp.com>
 <DMMMCJHUT8EL.1L6VS1X1K2BQE@bootlin.com> <auwrIKJi-v9svTdW@vm>
In-Reply-To: <auwrIKJi-v9svTdW@vm>
X-Last-TLS-Session-Version: TLSv1.3

Hi Laurentiu,

On Thu Nov 5, 2026 at 8:25 AM CET, Laurentiu Palcu wrote:
> Hi Luca,
>
> On Wed, Nov 04, 2026 at 06:56:41PM +0100, Luca Ceresoli wrote:
>> On Fri Oct 30, 2026 at 5:32 PM CET, Laurentiu Palcu wrote:
>> > The remote endpoint node is not necessarily a panel, so drop the "pane=
l"
>> > naming and refer to the next bridge instead. Update the error message
>> > printed when no output port is connected.
>> >
>> > While at it, convert the device_node handling in fsl_ldb_probe() to us=
e
>> > the __free(device_node) cleanup helper. Since remote1 and remote2 now
>> > stay valid until the function returns, pass the selected one directly =
to
>> > of_drm_find_and_get_bridge() and drop the extra panel_node reference.
>> > Do the same for the dual-link port1/port2 lookups.
>> >
>> > No functional change intended, other than the updated error message.
>> >
>> > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
>>
>> I wanted to test this patch but it does not apply on current
>> drm-misc-next.
>
> Sorry about that, I made these changes on top of Dario's patch [1],
> touching the same file. I thought that would probably be applied first.
> FWIW, my patch applies cleanly on drm-misc-next if [1] is applied first.

Ah, indeed, thanks for clarifying!

Next time you send a series depending on another one, please mention it in
the cover letter or (if there is no cover as in this case) below the '---'
cut line.

Dario's patch applied right now, so I could apply and test yours:

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
