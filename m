Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E380B41F7FD
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788253386; cv=none; b=BcfioWF1WlW3ML0/N0L32E+Sxlp/7J8p9O1wTq7atM3zsMGnb7x30Xi7nmG2r6hGqjTbZXobrSUYB/qJjN2vbUZdS/BfsE8jjoLda/b8aIp3+YNghgW+y8wE4V8U0bMrOrHhUjLPObbKVxCBG3v99KVHsIJzNRu3cHBcPB5SfTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788253386; c=relaxed/simple;
	bh=Iqm4Mq68GbhxlJ5R5mKY3uE18dsHXVjBmsgiQ+BOwfc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IShs/atb6pLBjzMCT76wTKRqOc0iIrZLL/NE9pdPJR29hGb6wMW4gDfCFTfTCmjsv1HGY/QDYh8gU2henYXRjJ1v03efy4MzoKy00DQ7g8FhQP41o2I8mIcxIiPpJyiacGCUaHBSql30HSgXt/wUTMyO4iJZM+YDWEKUPZ0ItmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=MJWBBoD5; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="MJWBBoD5"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2A5FA1A1932;
	Tue,  1 Sep 2026 09:03:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E9DBB6053C;
	Tue,  1 Sep 2026 09:03:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D87A811C78AAE;
	Tue,  1 Sep 2026 11:02:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788253381; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dVSTupzsKDeKcaOCfLgTue1jYvMasSEVlpq2JV9+6jU=;
	b=MJWBBoD56GD1gKMxyfsPWLPEUcE9vRgAYgIRAzg6cwJmDCdtzke3j7KuygdQYD6AU8JGr2
	GKaqslm1ZTFs7QX6di7xfUjopH+ur8ijdXPU+7mUuK2qP20jf7QVXnuGj49QQfQ66R9gca
	erGt/XmynmF26FIUFylqf9oX93o85jP7XixnI2CREKpsQMDfxrPz0P3o6UCQU4sJhxTbKp
	kTogl93s2G648lT1wsMR3IqLntJDyzoGI6/F6E94dNQcA4iXw5rzr7e7v7KOm8wRDNcb6D
	JNUCnN9+S3v2NQdc9/dqN1pOuR6iAm9gowwws49ZVMJLRqPs3htZL0sZIQTOqg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  "Richard Weinberger" <richard@nod.at>,
  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Nicolas Ferre"
 <nicolas.ferre@microchip.com>,  "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>,  "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>,  "Jonathan Corbet" <corbet@lwn.net>,  "Shuah
 Khan" <skhan@linuxfoundation.org>,  "Steam Lin" <STLin2@winbond.com>,
  "Hsin-Yi Wang" <hsinyi@chromium.org>,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  <linux-mtd@lists.infradead.org>,
  <linux-arm-kernel@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v3 08/23] mtd: spi-nor: winbond: Prepare introduction of
 W25QxxRV-Q/N parts
In-Reply-To: <DKOKKCF45CY6.2RXHF51EW6VV0@kernel.org> (Michael Walle's message
	of "Fri, 14 Aug 2026 11:46:14 +0200")
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
	<20260813-winbond-v7-1-spi-nor-rv-addition-v3-8-b637cf120d5c@bootlin.com>
	<DKOKKCF45CY6.2RXHF51EW6VV0@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 01 Sep 2026 11:02:56 +0200
Message-ID: <87qzjd8htr.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello,

>> +static const struct spi_nor_fixups winbond_nor_partname_fixups =3D {
>> +	.post_sfdp =3D winbond_nor_partname_post_sfdp_fixups,
>> +};
>> +
>> +static bool is_w25qxxrv(const struct spi_nor *nor)
>> +{
>> +	struct sfdp_header *sfdp_h =3D (struct sfdp_header *)nor->sfdp->dwords;
>
> nitpick, spi_nor_sfdp_get_header()?

Yup.

>> +	 * W25QxxRV chips re-use the same ID as the W25QxxJV family.
>> +	 *
>> +	 * Chips are very similar, W25QxxRV brings mostly performance and power
>> +	 * consumption improvements. The RV family does not require the multi
>> +	 * die fixup.
>> +	 *
>> +	 * They can be distinguished based on their SFDP minor revision:
>> +	 * W25QxxJV:        JESD216A, minor revision =3D=3D 05h
>> +	 * W25Q512/01/02JV: JESD216B, minor revision =3D=3D 06h
>> +	 * W25QxxRV:        JESD216F, minor revision >=3D 0Ah
>> +	 */
>> +	return sfdp_h->minor >=3D SFDP_JESD216F_MINOR;
>> +}
>> +
>> +static bool winbond_jv_match(const struct spi_nor *nor)
>> +{
>> +	return !nor->sfdp || !is_w25qxxrv(nor);
>
> So how do we know if nor->sfdp is already there for a given fixup.
> Without having looked at the code, there could potentially be fixups
> before SFDP is parsed (and the nor->sfdp is populated), right? Might
> be worth to be mentioned somewhere.

You are right, it is worth mentioning. In practice only default_init()
is too early.

Thanks,
Miqu=C3=A8l
