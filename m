Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922667;
	b=k1ilOzqeU5L5qBnp1OfGvnPTOEQaPy86hzt5MC16Dlyk9byc5f4z2X1ebyd62j8kl15V
	 syL50ptwgn8xJAaxSUyNLP7Xo69XFMrX61CQIbO5vCnUl5y4U3ynckYhMauzU7GG+e/3I
	 UmEu4Jvd/JP5KxJT7D5fdE0v8FtztvGdVie2W+jLptT0cNgjQgjdJIyrq817eEWznGYO6
	 PDwk7iaoaGP0vyCeLNihKkfgAcLxmAl1BQSirBXIVwKO4L1z+kwtixAQqs3FrOOfgR5DH
	 mVryCva+Nynu2IZNnuyWKf6I6walA0TOXGhqSOD1IGs0rt2w9bdQRJduNose7jITv3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922667;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=95IDR58HGwZG11mkyszy3LrlBW4ox835eXVGsWRIs2A=;
	b=x+PlwFQcTK20cYlqYge50ISRAJekTOYGG1WsbKhGn8EKSeW0NfndgOm553GI0pyZMbv7
	 iWtSE0K2oFEGqJ+lk2jp54aRRekP0AHqDgtGzjXZZM56m/KLTFDSRJacrojDmgcztDq5H
	 ayN477b3zAno76gQFDYfLa7p6xPoyWFsWoi98QLTvECMauqEAosVgIB+zWYpOw2oAEzn/
	 fGtM8ad0Sf6rI5VEl+kNACoG2xPheRblH+fWo+Oj3cz35/s6nHtqkKOWGg8Kjb5JclesG
	 bLslJGJKxqIBLNLDrVtOeDKiHe3PjNE4TSsktLcKpf2a7qHVao8X9Yf+4MA7a6vpUfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=MJtNRRFc;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F97C606A33E
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:37:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F97C606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=MJtNRRFc
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 198521A167E;
	Tue, 17 Nov 2026 13:37:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DC3B95FC81;
	Tue, 17 Nov 2026 13:37:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8813C11BC0008;
	Tue, 17 Nov 2026 14:37:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794922665; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=95IDR58HGwZG11mkyszy3LrlBW4ox835eXVGsWRIs2A=;
	b=MJtNRRFcuFTij/dHGe2SFqarmegUKRHo8XTzH4/Mfvwvu9eBL7QNbBYpTKkLJ+tCexjhOe
	Cz/twhKTJXtovEYcBZlewk+qr6u335s3XClL6Y2Widfi0iHnodn056ihqX2tSTLK9n85AE
	f3/pDeRFXrv00JdTkuAnWzaeTt4x2NDaQVkF6QUGuIxDLfdJlCjdF62lZKyZkhFP/OmDkL
	rOQj0gD4GEqvrKBz6SUW9fN+viNdWYAsLjKx11c1/0h2BwNCb7OglGZTyyrG88W91UWAV6
	blxUl9veO8xg8Bj8ukjcUpW0/w6D+dsn5vnTUwCMsj7bXNTsrVXjvaCnsXcf8A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Paul Cercueil <paul.cercueil@bootlin.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Stefan Agner <stefan@agner.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Maxim Levitsky <maximlevitsky@gmail.com>
In-Reply-To: <20261117093751.14988-1-paul.cercueil@bootlin.com>
References: <20261117093751.14988-1-paul.cercueil@bootlin.com>
Subject: Re: [PATCH v2 00/12] mtd: Remove #ifdef guards for PM functions
Message-Id: <179492266246.2237190.12954805423683969784.b4-ty@bootlin.com>
Date: Tue, 17 Nov 2026 14:37:42 +0100
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

On Tue, 17 Nov 2026 10:37:38 +0100, Paul Cercueil wrote:
> This is the v2 of my patchset that updates the MTD core / NAND core as
> well as several drivers to get rid of the #ifdef CONFIG_PM guards.
> 
> Instead, the code that depends on PM or runtime PM will be
> garbage-collected by the compiler automatically if this config option is
> not set.
> 
> [...]

Applied to mtd/next, thanks!

[01/12] mtd: Remove #ifdef guards for PM related functions
        commit: 7fb3ea311f1da6a6ef13ed4b4dab7fe74b82f161
[02/12] mtd: rawnand: vf610: Remove #ifdef guards for PM related functions
        commit: ab12847196fdcac7e72e46c5366036c024b0fd8f
[03/12] mtd: spear_smi: Remove #ifdef guards for PM related functions
        commit: 2a37924f5c8152c25bb485ca8419317e086a19aa
[04/12] mtd: physmap: Remove #ifdef guards around shutdown callback
        commit: a54ceff6976e239666f8f19ffbbeea50ae5ca3e0
[05/12] mtd: maps: pxa2xx: Remove #ifdef guards around shutdown callback
        commit: 397d22308379b6445890811a107dc950d4fbec05
[06/12] mtd: nand: mtk: Remove #ifdef guards for PM related functions
        commit: 5d1883f69df537e6ed34bba098cf49f5595dfeb6
[07/12] mtd: rawnand: fsmc: Remove #ifdef guards for PM related functions
        commit: 81f7cbdb040e768bed8db543221a214a5df2042e
[08/12] mtd: rawnand: hisi504: Remove #ifdef guards for PM related functions
        commit: 76ad0034e3013d8a03a79e6820e97e9537b769d8
[09/12] mtd: rawnand: mtk: Remove #ifdef guards for PM related functions
        commit: 41e59826fa387b4a151cc97c2907e0d71aa6bd64
[10/12] mtd: rawnand: omap_elm: Remove #ifdef guards for PM related functions
        commit: ce7455c8b2fd693cadb65078d625c7eac984ea1b
[11/12] mtd: rawnand: r852: Remove #ifdef guards for PM related functions
        commit: 6dbc7c326713261812531134085c7a3d23abf3be
[12/12] mtd: rawnand: txx9ndfmc: Remove #ifdef guards for PM related functions
        commit: dc88e180ed485a7c8c97e06c6f7e0ef896992290

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

