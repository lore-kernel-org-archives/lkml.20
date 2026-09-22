Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FB147FB0C
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790094368; cv=none; b=dlZ1bcWZby3sLMJXcIhWqLIWYBekycgrIx4cnQ1BC47vbvkm8ZIo7qELub0Of9ZXPgG7HadL84X011X4xsWkwib9Xf5WZ4fr28+x5fp5ca7JNWOPle97jz8IcW8dHKe+ykiA5l2cBA4ryu2+nBRXnmKAtgCYx9prcFS35jaj8vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790094368; c=relaxed/simple;
	bh=75xifshhMhGE0zG1GfFtGKkEULils3W6gikSq9G6cAw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NA9/09RvMQKnxLJiqrUcIfa9U40OTCuyR69mKYVWVgckZ2v23NshYHelZiE9q2ZaTqRLD+ZqaaF5pOjJLZnnHeFXFeBpLdqQHRRfcmJ6iE20U6ns3dXNoPlNpyIhkty9UYcjayJalSQh5gVyh0nNbQJoMWW4WQJVhKQm5T4zAa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KbMEflfr; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KbMEflfr"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 14B6F1A0FCE;
	Tue, 22 Sep 2026 16:26:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DB58A60580;
	Tue, 22 Sep 2026 16:26:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9521F103292CA;
	Tue, 22 Sep 2026 18:25:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790094358; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YRCEsU9owQDChhSiuiHFbeIZzKL/egDpwwGl4F/22+0=;
	b=KbMEflfrlAIwU+HoKLLxyJOChtx3xhmWGMGxALmi86ITa+Tkb/nm0lLPwJ+CMqe7YYJJ1t
	nHp96lPGFbiQCbMnAMvYcdiSv95qZwCDOwwjuHlk9pabj6cF0lXK/RfzfWSv7ijaEOexGN
	ifrLgsrTCUHTipmrG1GFGVjUZg8f10mgjuPfQ1agpGSTZrJNHZ0qZH1mvGUsNgkF+APEob
	PAqwuaW1rWcEnGToXzVLV1ynobWJ9DrtrcXphFlt5/29ZQeNa+/Y5z6zvyhqoYvN7g6SFH
	FtTiPXXCiWzIuQeqX5gf1Rv22t9mTW379cAA4PgAglIqqLoNK87dehhVX2V0yg==
Date: Tue, 22 Sep 2026 18:25:47 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, David Lechner <dlechner@baylibre.com>,
 Ayush Singh <ayush@beagleboard.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, devicetree-compiler@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree-spec@vger.kernel.org, Hui Pu <hui.pu@gehealthcare.com>, Ian Ray
 <ian.ray@gehealthcare.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 12/15] libfdt: Introduce fdt_getprop_offset_namelen()
Message-ID: <20260922182547.6cc7475c@bootlin.com>
In-Reply-To: <arDJmHPwgvwwmITG@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
	<20260826083146.304291-13-herve.codina@bootlin.com>
	<arDJmHPwgvwwmITG@gractus.seuss>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On Mon, 21 Sep 2026 16:07:21 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Wed, Aug 26, 2026 at 10:31:43AM +0200, Herve Codina wrote:
> > Future operations, such as handling unknown tags on dtb modifications,
> > need to get an offset to a property based on the node offset and the
> > property name.
> > 
> > Several function exists to get a property based on the node offset
> > and the property name but none of them allows to get the property
> > offset.
> > 
> > Fill the lack and introduce fdt_getprop_offset_namelen() and its
> > simple variant fdt_getprop_offset().
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>  
> 
> This seems redundant with fdt_ptr_offset_(), which can trivially get
> this information when combined with fdt_get_property().

Indeed, It should be ok using both functions you pointed out.

I will remove fdt_getprop_offset_namelen() introduced here and use directly 
functions mentionned in the next iteration without wrapping those calls in
a new function. 

Best regards,
Hervé
