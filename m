Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354E4477E4D
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790327790; cv=none; b=PX5H2+S9tavleuz6QEc7/XBP8BU/TFF+xHfioLI5V9KimlIy6xxMJ4ectMW5cJ3XzjFTAl+gHP9yq63rr+Gr1Pgj7cJXQZgzCCkDZP8VftSvZb+Aw1gnjj4GuB9YWS8G3nfjoulYFQdIdIuvs4N+LaBsOJPhuBV7IKNvio125dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790327790; c=relaxed/simple;
	bh=nH7QoEgvt+S5sKEf+T3s2fDK3Jsa023rzIFXS7kV50A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qulP+iOTwQkcr7fKaogjk4eUjqRqko6unvdIeyTGRXn0XfA1CHt9sMPbQHf0tqQReA16nSdC8G7TLxD1lO9d156zn4KYQ/ZqSAP7+bbl93BFBslfE4IJlTN4UN0BmF3sgBzSLpepaBDvBmK2+2wnz6kJbKY/ONnsg9uFZA19DOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=B+zOett2; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="B+zOett2"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6A04B4E41070;
	Fri, 25 Sep 2026 09:16:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3C2776073B;
	Fri, 25 Sep 2026 09:16:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0303210329543;
	Fri, 25 Sep 2026 11:16:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790327784; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VAM2zKaXbRHAZBolCeZEexW2NVFPQHgd0dEpNrhq6ZY=;
	b=B+zOett2EXQ8qVFecZDYSDrM3Nlgl4MSIH9mAT1mNb2Tvs3GEMTis4hEG2fe/CRxdqQxV2
	DfAGmXk0PXnNQfEQa4ofN0JFghfk0X6H4FXKrOIBwJr5CcgAu416BIMMka5pdvYRa1L0FD
	aGN0fSz6kGxropNIfT9MNdKby41lAq/3gEFAYneb9VesJn3Ii0qF6ka4X7DMMrTJXoRbk3
	FRrbUpImJwxRnT47W7wJ3hdxVtXnNkZG9NQkU9EI0RA4iDpGAy1ZDXt05vsMJF3EUK32qB
	WqsoeRl50KRdmK3FjN1tUU923tEwh2586A9e6T8DtlDjWXbhHHnBUYMjyLgfDw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Michal Simek <michal.simek@amd.com>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  linux-mtd@lists.infradead.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: arasan: Add ZynqMP props
In-Reply-To: <20260922183138.290114-1-robh@kernel.org> (Rob Herring's message
	of "Tue, 22 Sep 2026 13:31:38 -0500")
References: <20260922183138.290114-1-robh@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 25 Sep 2026 11:16:21 +0200
Message-ID: <877bk9n122.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Rob,

> +  num-cs:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1
> +    maximum: 2

I am not sure I get what is the purpose of this property. It looks like
a downstream property resurfacing. We expect one DT subnode per chip, so
I don't see the need for num-cs, we just need to count the children
nodes. For me, the correct fix is to drop num-cs from the upstream DT.
The only real use for it would be if the hardware could be synthesized
differently, with a single CS instead of 2, but I don't think it's the
case here.

> +
> +  power-domains:
> +    maxItems: 1

This one, even though we don't actively use it in Linux, it may serve a
real purpose.

Thanks,
Miqu=C3=A8l
