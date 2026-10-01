Received: from mail-08.mail-europe.com (mail-08.mail-europe.com [57.129.93.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1661738655D;
	Thu,  1 Oct 2026 18:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.129.93.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790879806; cv=none; b=aA3bhh7nun8CN+KzBl1Lneva5pkGHhWcDPBt+AI7CVtjrjLjpJM9NSUSPNYk3P7yIR75B1GXhGGQ3KObIJhV3u+FLJHrwC/Jc/DdztB3JS5Rl4w4iqGqMAV4r79N8/TdslIu3uzoRUv737hJm8IakUyjfJghQjuLEFsn0LmGTg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790879806; c=relaxed/simple;
	bh=IV4ER0qyUFmYSNMfu94+sUKn484WIoV6/SOHbavbjYs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aoazy2f3cUJUBaYQcEKCcDv+c0/PgiYagBiGb1A4hJsCvo8JRVwUMe5tIRf8fDdmBPdc7ggnkM7dsZVj2GUuLNT9ulXw6tEDozeXdpMAUe8bWjf8kKqPNjVgg8J22MEZRXHgkgZiFPH2J31289ShGVJKNVo6YhYBsDk1Tu6698A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=UXqkGC3z; arc=none smtp.client-ip=57.129.93.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="UXqkGC3z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1790879791; x=1791138991;
	bh=IV4ER0qyUFmYSNMfu94+sUKn484WIoV6/SOHbavbjYs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=UXqkGC3zZo7mSTVfUKKBjW421ugTBdKfM8A0Z+cciCkwMFLuqR86P82l8D3bcnWEO
	 dYBC/uyn/Pxwd8p1WMiMPgCA4DKI1RRqhtKHVhAAFvYWjhfeP1+nsZ78W/V0awVaC8
	 MU95o0bChYZKoQpXE1xE9fL8Z81ydt3XOd582EDtdv6rcWrNrfuwcvv4d38h4cPwtq
	 Mjx2UzIwsoV8GC3e7a/EKKjTKvg/bfnp7Fvj0dhbGVR4n9ExMRKqmM3bMPIx5kDCpP
	 33D3bZUEoiTpZzxhy+TBihTjkMOYUit+mxR8fg4+hjF+N86tMn3CqbNHwPcVK2ozPO
	 DWMV3yUslFEVA==
Date: Thu, 01 Oct 2026 18:36:25 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>
From: "armandas.kvietkus" <armandas.kvietkus@proton.me>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] media: i2c: Add Samsung S5K3T2 image sensor driver
Message-ID: <NIJlrzovNpxB31oPCsIJrrbmpireUDeerm7rqwzwteU-NSyIpkdaU0lbg13n2mmd8hG-vNAXP8V-FWmzGb_4NCjkCJQ5wR0hTqCnVfRzMEY=@proton.me>
In-Reply-To: <ar4JeR2DGKFS-Qhx@kekkonen.localdomain>
References: <20260924-upstream-s5k3t2-v3-0-a5c58dfcec29@proton.me> <20260924-upstream-s5k3t2-v3-2-a5c58dfcec29@proton.me> <ar4JeR2DGKFS-Qhx@kekkonen.localdomain>
Feedback-ID: 164226125:user:proton
X-Pm-Message-ID: 3a03ab77527fde6eb49aa010b944367ea7303e5c
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

Thanks for the review. It is really good to get feedback from a person
after the bot reviews, so I appreciate you taking the time.

On Thu, Oct 01, 2026 at 10:19:21AM +0300, Sakari Ailus wrote:
> Is Documentation/process/coding-assistants.rst relevant for this
> contribution?

No, it is not relevant. No coding assistants were used for this driver.

> But HBLANK should be handled below, shouldn't it? The fewer of the
> configuration that could be dynamic is set through register lists, the
> better.

Yes. The line length register 0x0342 holds the same value as hts in the
mode table. I'll write width + HBLANK there from s_ctrl and take it
out of the mode tables.

> Hmm. The link frequency is supposed to be set by the user, not by the
> driver. How do you change mode in that case?

The mode decides it. Each mode's register list sets the PLL, so the
link frequency comes with the mode. set_fmt picks the mode and then
sets the control to match, like imx258 does.

The modes are also tied to their frequency by bandwidth. 2592x1940 at
60 fps needs about 3.0 gbit/s, and four lanes at 300 MHz carry 2.4
gbit/s. So of the three modes, only 1280x720 fits at 300 MHz.

If you prefer a writable control, I can do that and only offer the
modes that fit the selected frequency. Which one do you want?

> Can you set these using the control handler's set callback? They should b=
e
> clustered, too.

Yes. I'll write the flips from s_ctrl and cluster them.

> How about calling this s5k3t2_format_from_mode()?

Sure.

I'll fix the rest in v4.

Armandas

