Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794923281;
	b=2dg1uwEWEa9uhBeYGHPJjssZIsiY/xnlStYGW/4qlUlQQil4+88JeXcIlbkAXkiKt4OT
	 7lcWmi9drLusBsaaech6pUoXWa2J8UCprnshvWnB8osk+bN62QLeOCw6u1M3MuGuuz8OL
	 NNZh9gt/BN7Zws1jIhPPms7H/bxzf5j0ee4tCpJkjTYr7ledGpQTp+HT9pBqKQjT7SL0j
	 MiXtr9c515uprqFI+ApYKyRa9q2nTErdl5tmFHlGJE8vdHRSufZpAK9V4tYjxUBvjeFPa
	 4sA9u5Py31cXtES1AR4lD/ls+TPWSH+FRTW+Sudmcc4XAMXuEjJ6yQtVVKHm3A+mE+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794923281;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=JHzd7FDNt8WtSOuWmynC0XMqvr4CymS+F+6NtTORZ9k=;
	b=ljxH/QPRLI41pV6mHxLJxUgzsaPbrD1sdttxkjswOkDozDVQQvBwhT3hK7qTmuwzv4HR
	 v4p678Vg/xA8CHbeCrZyCJaM47NiKpq0F1WgtJafXoneeumJ4Emj71NsW9m7QzCjWVxTx
	 /atW4JMN6Xa+GG1UjKidSuUoxDqk2WOSuudW1A7u/CpXepUnFEH9P5ujjSgwFP1nCK48o
	 689qOeITQYvGZoqLf1fnbNP/Ts1B+reyvBhuk+bK+OS20SAmwdZtEcnCCa3O5GR0yiuez
	 j3rQXzewP27swh6hTRDl9X96yeYPZb4CxzT3P6RG6vLq5Ka3rS38TlviwBMbkAaKmqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=txd1mXl2;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAD3606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:48:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFAD3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=txd1mXl2
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 951FA4E41570;
	Tue, 17 Nov 2026 13:47:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 684395FC81;
	Tue, 17 Nov 2026 13:47:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 889F411BC0024;
	Tue, 17 Nov 2026 14:47:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794923274; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JHzd7FDNt8WtSOuWmynC0XMqvr4CymS+F+6NtTORZ9k=;
	b=txd1mXl29q0DSQHCsv4VcHJw1IjRcnR0UBNeKAXxNazCP6nb2AD3fEgXtc1fzYcmKwJbT2
	x3xK+PnFVk6lOpVPTRqfcm7+htAGM0dlafVLdEaHxDv9ugIeFEA53Hh2a3VLDWlCQSHh7/
	xayJRWWs0hkcY/oByvlfDuZkllhqV6FQppf0sI+CDKBz0GgE021I0gObIMuSsUDmQNNzW3
	PB5UIG55FRJ6bsO3Jn4g6UQ+CcI4oh5vraYiqte3ezjgLW5S4X20vnRBvI85HkTwTCGVs+
	sMD4RjAPL6el+iYjnHphFf91NvH03FsocfImXZZLqbzXnsZJHGM6XRk2IfmD6g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Frieder Schrempf <frieder@fris.de>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20261014-spinand-cont-read-supported-v3-1-e9b8b34d303d@kontron.de>
References: <20261014-spinand-cont-read-supported-v3-1-e9b8b34d303d@kontron.de>
Subject: Re: [PATCH v3] mtd: spinand: Do not re-enable continuous reads
 vetoed during variant selection
Message-Id: <179492327226.2243972.5665532039519324438.b4-ty@bootlin.com>
Date: Tue, 17 Nov 2026 14:47:52 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

On Wed, 14 Oct 2026 08:45:26 +0200, Frieder Schrempf wrote:
> spinand_match_and_init() tries to disable continuous reads by clearing
> cont_read_possible when the fastest continuous read variant is slower
> than the fastest read from cache variant, or when no SSDR/ODTR continuous
> read variant is supported by the controller. However, at that point
> cont_read_possible has not been set yet, and spinand_cont_read_init(),
> which runs later during spinand_init(), unconditionally sets it to true
> for any chip implementing ->set_cont_read().
> 
> [...]

Applied to mtd/fixes, thanks!

[1/1] mtd: spinand: Do not re-enable continuous reads vetoed during variant selection
      commit: 82b3f83f618d3002f4bc847fc7080519650a3250

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

