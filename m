Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A645B3DE426
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789027121; cv=none; b=X8hwGWg+nYafXeMbRZj5S1dLlO0VM/j3pkeFbKsSf3wbIGCZW1UgwEQUY55UB7rpw9RJkX94gQD/wRJtS6XX7hhDbZh4yfXCjgyCggKq9e0dfh2u3hr5uIO09aWCcsv7OijY3bmhsvuEze30X3Jm9q5HJqCOndqjSGGaiDOl8Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789027121; c=relaxed/simple;
	bh=d0KjsG7PoiJW82Yyf+OBWtqBaQmdJo4u7YvdxdXO6eQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=koGKCjkx9JEhsTGuyTxLwHDvDUlIeLjMFnKTb0O/WprFfKsvEQctC0qsD3w54Bd2iFSJQE2iLZ/4Qk3OSUxYk1OJ75ptFYy6dn8wAB8JydwbwqB1cLhlDm3cU9HWhhGwkheNgT/8lJTcWOyprhT40YZ5cRtL+Tt1/+yi/rvf6CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=SCmm4Pzp; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="SCmm4Pzp"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CB2584E415B7;
	Thu, 10 Sep 2026 07:58:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 981F3602B8;
	Thu, 10 Sep 2026 07:58:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F3BA111C78276;
	Thu, 10 Sep 2026 09:58:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789027110; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Kno+TMnYpO9Bgr0R12gJK4ROq1TV+XfvO4LtrnKGYOM=;
	b=SCmm4PzpfNmNnzvKfuAWCpQuo1TCdyJ6GBwTA04Jsdof2FS3v0tCx1M8f8Q5l2B5RN2n1s
	TqhTI+/Hd/MTxF6NCIBf114ZswXThqNCferqelme5/f+yq+RnV6NpIKz1kQVGDvIJ46ABA
	S1ILjDutXKVQ/sWXUJbQ5I/gycZZX3eCf/fPACJUOuZgHEjLwFdtnf/cuuRTWZVTOdK6BH
	mZLetKMbod9efOm+ButxrYT0WYr8A6rMiQYaiAwDsRB92SWeoW9pEr0f80WG9x+mXuVU+r
	hLpk0tQ4Ba2+IoWBKp4gOdEmYKo5jO2GQrVJcgzPZ7ymAjWJNY/YlzQHH/tzXw==
Date: Thu, 10 Sep 2026 09:58:23 +0200
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Frank Li
 <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 06/15] Introduce structured tag value definition
Message-ID: <20260910095823.1f5abc2b@bootlin.com>
In-Reply-To: <aqJBOdFPJbDKHt_9@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
	<20260826083146.304291-7-herve.codina@bootlin.com>
	<aqJBOdFPJbDKHt_9@gractus.seuss>
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

Hi david,

On Thu, 10 Sep 2026 15:33:58 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Wed, Aug 26, 2026 at 10:31:37AM +0200, Herve Codina wrote:
> [snip]
> > +#define FDT_TAG_CAN_SKIP(tag_data, tag_id) \
> > +		(FDT_TAG_STRUCTURED | FDT_TAG_SKIP_SAFE | tag_data | tag_id)
> > +
> > +/* Tests reserved tags */
> > +#define FDT_TEST_NONE_CAN_SKIP		FDT_TAG_CAN_SKIP(FDT_TAG_DATA_NONE, 0)
> > +#define FDT_TEST_1CELL_CAN_SKIP		FDT_TAG_CAN_SKIP(FDT_TAG_DATA_1CELL, 0)
> > +#define FDT_TEST_2CELLS_CAN_SKIP	FDT_TAG_CAN_SKIP(FDT_TAG_DATA_2CELLS, 0)
> > +#define FDT_TEST_VARLEN_CAN_SKIP	FDT_TAG_CAN_SKIP(FDT_TAG_DATA_VARLEN, 0)
> > +#define FDT_TEST_NONE_NO_SKIP		FDT_TAG_NO_SKIP(FDT_TAG_DATA_NONE, 0)  
> 
> Sorry, missed until I saw the later treegen changes that this is
> defining some specific tag values.
> 
> Given that, "Tests reserved tags" needs to be expanded to better
> explain what these tags are for - what should readers do upon
> encountering them, when should writers use it ("never, unless you're a
> test case" is acceptable).

I would say, in both cases, consider them as "unknown" tags.
And so:
/*
 * Tests reserved tags
 * 
 * When those tags are encountered they should be considered as "unknown"
 * tags and rules related to "unknown" tags must be followed.
 *
 * Readers should skip them or fail depending on the SKIP_SAFE flag. Writers
 * should never use those tags. Their usage is only acceptable in test cases.
 */

> 
> It might be worth reserving a whole range of tag values for tests /
> documentation / experimentation, rather than just a handful of
> specific values.
> 

Ok. The range reservation will added be in the comment.

/*
 * Tests reserved tags
 *
 * A TAG_ID range in "structured tags" is reserved to tests tags.
 * This tests reserved range is from tag_id 0 to tag_id 0x100.
 *
 * When those tags are encountered they should be considered as "unknown"
 * tags and rules related to "unknown" tags must be followed.
 *
 * Readers should skip them or fail depending on the SKIP_SAFE flag. Writers
 * should never use those tags. Their usage is only acceptable in test cases.
 */

Is it ok?

Best regards,
Hervé


-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
