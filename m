Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9374F5E00
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415859; cv=none; b=lTybFGzxDHEb+wr90JY50j0rCXTOb4NAoolyRjxN+GMxd9nsy2qo6lvpDelYMw6vcUHcA+gvmIs68Ha6AEvj9pf6VZELYGCsxn6YjEfDRTcVSA5P5EafADrKb/ZgbxaOKoeDIMtrouYJ+kkdvuZkWLaPqVJFahsPe3lprJi7o4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415859; c=relaxed/simple;
	bh=/+8n+v5xoTclbDnraERTPnRuwXA/qqANKHBgaxCon6E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gaJLVkoTChlmI2jgxHp4Ag0VuU2DfCrP+9fwYP5GS2KZ90hrniMTdG++xE6zSRM9DH5xvkKGw0MGifWfHr+gYvqRs5WnQ+2xmgDHtIhpkJM4Y6AsHSfxAFMHOYrmHWdMrSBGGnIP6+N/RWRr3bNZgWKH2+IXAiS03zfH2bHvz+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cfAwjeda; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cfAwjeda"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0E67EC653EB;
	Mon, 19 Oct 2026 13:18:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E4CC160582;
	Mon, 19 Oct 2026 13:17:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F110010328D49;
	Mon, 19 Oct 2026 15:17:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792415849; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=e+DXg0sIrnblAY1SfD/xEzSp8fZezKF2P/+K4BmBBfk=;
	b=cfAwjedabWZco4YDgEuil24kWd+hfM4tLky3bPUb4Dk3DqTh+0AgSuRCrNF5vJoXLtG/Dy
	11AU56/tts/tpJxPvjZzGz/cbWS6FX2bLSZjGyOCXJockpVL22gtec6Ga/Vbwgg2aF+J39
	uXo2YhhJTxQg8yClfQepFev7dVd1ZZ5zboU/+B52v6CUz6jJD7FDT3rt7B6cbUzjso7WuZ
	hRLbwOrVzIi1PYumYXDyUf4+trSUX8tpc+maNhCxkp5tjlYBSZOp5ewqnxdOPrICqm4U9g
	1bbUSLtLYXLSpJdn8FujksdC3XXtzggz6IeYtuW9tq4yFg9Wvu1OMGF52Fbe8g==
Date: Mon, 19 Oct 2026 15:17:23 +0200
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
Subject: Re: [RFC PATCH v2 03/74] fdtdump: Introduce
 get_structured_tag_data()
Message-ID: <20261019151723.65eec413@bootlin.com>
In-Reply-To: <atHgwFocPW-iL19-@gractus.seuss>
References: <20260826094950.1088288-1-herve.codina@bootlin.com>
	<20260826094950.1088288-4-herve.codina@bootlin.com>
	<atHgwFocPW-iL19-@gractus.seuss>
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

Hi David,

On Fri, 16 Oct 2026 19:30:57 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Wed, Aug 26, 2026 at 11:48:32AM +0200, Herve Codina wrote:
> > With structured tag, data len can be encoded in the tag itself (no data,
> > 1 cell data, 2 cells) or with a dedicated cell (varlen) added between
> > the tag and the data.
> > 
> > In multiple places, getting the data related to the tag will be needed.
> > 
> > In order to avoid code duplication, introduce get_structured_tag_data()
> > which purpose is to get the tag data part and its length based on the
> > tag value.
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>  
> 
> This might as well be folded into the initial implementation of
> structured tags in the earlier series.

Ok, will be moved.

Best regards,
Hervé
