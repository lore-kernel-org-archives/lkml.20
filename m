Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C888378D74;
	Mon, 28 Sep 2026 07:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790580747; cv=none; b=F7fUO1Pt4psa6qrJax9UW4+GxyXEHkr2MOsA4A5Jf1I/IxiGkUnQzFuPzz4NI6Z8m9P7/rYhB5f6+9PaOyOH3YSGEHAzESvimBDiHpR4FCyJAmFMv9JADS3JACGuZ2v8UlzIMUjluWSGSzs8L88k3jgabTda3xIoXpx1aNUsea8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790580747; c=relaxed/simple;
	bh=dgepjDVWjlpjORY9mopx1lT//VGOTdCXOKLVTmgrXrU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=hqD7yOiOQNidPo2dMAW47G6KGK+EDRXr7OubSHllkLrNouozPuOHPFzJ4ICSATJ158rcLYogstex7wNY6ZPhss57IVBpaxhTlNLLu9o99nXGwqDK9+t39JdynG28cqcnS66v4y6ZpjGQ7zJPEF48sxyRIb8rSpLmtHB4eCwyUF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=vkH/KMvR; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="vkH/KMvR"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3B8551A0FD3;
	Mon, 28 Sep 2026 07:32:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F2D36601BD;
	Mon, 28 Sep 2026 07:32:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B96CF102F1E42;
	Mon, 28 Sep 2026 09:32:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790580738; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1yVG7biGd8LMh933pwAmn0KONt09cooOBGmuGeDuRG4=;
	b=vkH/KMvRVbAsfr989+yy6/jIOx0UvnkM3xmUrwI+hntjDoZhKSZlothGHJWV0SLXfmPioi
	pBZUROwK79npc1KIJKFRseNPaZnVAO+E2Z88iFJjy6KC1Grzt3bjXI9IfaN+i4FOxs/gNQ
	Nnd08n+01OQYRJf2xjlpAlFBIA18cnd8XINovHmM4HOYrI8avIZ6jZf54Dr3Aai2X//9S9
	8VOJojwMsDZWENJ5jiYaQzZ5LFazff2+Cek28yw04jdKczOgYxKanRU6wBaXYQ3V8JhHzz
	cNdID9Py9+StbQfzqUV4oln25LsWwpONTUdoIoh8yBrujC63mB2j91B03n0XGw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Sep 2026 09:32:14 +0200
Message-Id: <DLQRW9F3KVF9.349XXY22RRFKH@bootlin.com>
Cc: "Borislav Petkov" <bp@alien8.de>, "Tony Luck" <tony.luck@intel.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Geert
 Uytterhoeven" <geert+renesas@glider.be>, "Magnus Damm"
 <magnus.damm@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-renesas-soc@vger.kernel.org>, <linux-edac@vger.kernel.org>,
 <devicetree@vger.kernel.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Herve Codina" <herve.codina@bootlin.com>
Subject: Re: [PATCH v3 2/3] EDAC/cadence: Add Cadence DDR EDAC driver
From: "Paul Louvel" <paul.louvel@bootlin.com>
To: "Wolfram Sang" <wsa+renesas@sang-engineering.com>, "Paul Louvel"
 <paul.louvel@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260924-paul-v7-3-rc1-edac-v3-0-bd8054a5b180@bootlin.com>
 <20260924-paul-v7-3-rc1-edac-v3-2-bd8054a5b180@bootlin.com>
 <arZiv20Z4P7DQaD6@shikoro>
In-Reply-To: <arZiv20Z4P7DQaD6@shikoro>
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On Fri Sep 25, 2026 at 2:02 PM CEST, Wolfram Sang wrote:
> Hi Paul,
>
> thanks for your patches!
>
> On Thu, Sep 24, 2026 at 04:12:48PM +0200, Paul Louvel wrote:
>> Add the Cadence EDAC driver found on Renesas RZ/N1x SoC.
>> The memory controller supports ECC, software scrubbing, and SECDED.
>>=20
>> Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com=
>
>
> Disclaimer: I don't know the technology nor the subsystem. So, only some
> high level comments.
>
>> +
>> +static void cdns_rmw(struct cdns_mc_priv *priv, u32 reg, u32 mask, u32 =
val)
>> +{
>> +	u32 regval;
>> +
>> +	mutex_lock(&priv->lock);
>> +	regval =3D readl(priv->io_base + reg);
>> +	FIELD_MODIFY(mask, &regval, val);
>> +	writel(regval, priv->io_base + reg);
>> +	mutex_unlock(&priv->lock);
>
> Hmm, a spinlock is probably more suitable for such short operations? You
> could even save a lock here and use a generic mutex in
> inject_ctrl_store() for the whole operation. That would work for now. In
> terms of defensive programming, a spinlock could be argued, too, to make
> future additions more robust.

Yes, I wanted to use the lock inside the function so that in the future, if=
 it
is used, the caller won't have to bother locking anything.
Noted for the spinlock, that seems more appropriate indeed.

>
>> +static void cdns_mc_err_inject(struct mem_ctl_info *mci, u16 synd)
>> +{
>> +	struct cdns_mc_priv *priv =3D mci->pvt_info;
>> +
>> +	cdns_rmw(priv, CDNS_DDR_ECC_XOR, CDNS_DDR_ECC_XOR_CHECK_BITS, synd);
>> +	cdns_rmw(priv, CDNS_DDR_ECC_STAT, CDNS_DDR_ECC_STAT_FWC, 1);
>> +}
>
> Bike shedding: I think this is too short for a seperate function and it
> should be folded into its caller.

ACK.

>
>> +
>> +static ssize_t inject_ctrl_store(struct device *dev, struct device_attr=
ibute *attr, const char *buf,
>> +				 size_t count)
>> +{
>> +	struct mem_ctl_info *mci =3D to_mci(dev);
>> +	u16 synd;
>> +
>> +	if (kstrtou16(buf, 16, &synd))
>> +		return -EINVAL;
>> +
>> +	cdns_mc_err_inject(mci, synd);
>> +
>> +	return count;
>> +}
>> +
>> +static DEVICE_ATTR_WO(inject_ctrl);
>> +
>> +static struct attribute *cdns_edac_attrs[] =3D { &dev_attr_inject_ctrl.=
attr, NULL };
>> +
>> +ATTRIBUTE_GROUPS(cdns_edac);
>
> What about using debugfs instead via edac_debugfs_create_*?

Seems to be more appropriate since inducing a CE or UE would only be for
debugging purposes.

>
> Happy hacking,
>
>    Wolfram


Thanks,



--=20
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

