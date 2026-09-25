Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AE732D0EE
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790340784; cv=none; b=hOX1PJb9Jh6yFbo9xkGxz20dPP4zgw8pcNDoklzZwucQohfDZJcetOaxgFHyorDPE5J9H+9UmsmXUJJNe4/H089lZxO5rNYbQ1gWiIDUx+J/DN65NokWuYsCF6P5qwZZynq49Z5NEV654BaLAP+fx+urMICz+XJmjs27dMfgir8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790340784; c=relaxed/simple;
	bh=WgJGCX4ymeeHFrmApE9HNQVvJ7rArjAJrzU+WC8WOEw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OVp+MDImvmFlR4OkEQhij2sifabHDf1Wh/hdgTxoXK8IgqBEFglOX7rYh4GIr6jE/4SnstQbcefE5hO6oJQ99NPdKrvjb8kxxgNHTLE7dNGV88bVfAj0NfyXlNIFy2CzTE0IKAS21OK9f1nACNA1NT4rPMjRN9wW9krX7laJLEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GDfH/Ud1; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GDfH/Ud1"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 86A68C13994;
	Fri, 25 Sep 2026 12:53:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AE27D6073B;
	Fri, 25 Sep 2026 12:52:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2A13710328856;
	Fri, 25 Sep 2026 14:52:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790340779; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=PEEaU2vp1FHpkuf8xli/ZnKeWiTmwFfC1TUVaJBY9HY=;
	b=GDfH/Ud1Jdemye+Nz3G0qqOyXt1K4GSPD+M2rsPamQjF7EUxyT7kGLZ6SClOc1BhjvylF5
	hqI8vhcYK5G6K+EkOksEWw5QGTDccB/qYuVmV+q0R1dgBh59H5vQPL7f+2b/whpSK5FyTI
	3eMwyDM+Cgb3GweaXEGYXGmRWmr0QKadOKpQdRevKMbaXpwf2r3nYpGIBN80OMI1WLFZmY
	pV+5maGeK21VYaJPr/a/v/GL3Gtr9cmx5uhuHJWRPHqeCnls4jF5/oWzgLA83boWejZmOi
	Y7HAdAZarYGnG5JSiWxqcuV22hMtWGvGMxihmhe6bkA9oHDBydbj2IxO7orMTQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Michal Simek <michal.simek@amd.com>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  linux-mtd@lists.infradead.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: arasan: Add ZynqMP props
In-Reply-To: <20260925122003.GD677989-robh@kernel.org> (Rob Herring's message
	of "Fri, 25 Sep 2026 07:20:03 -0500")
References: <20260922183138.290114-1-robh@kernel.org>
	<877bk9n122.fsf@bootlin.com> <20260925122003.GD677989-robh@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 25 Sep 2026 14:52:56 +0200
Message-ID: <87wls9jxw7.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3

On 25/09/2026 at 07:20:03 -05, Rob Herring <robh@kernel.org> wrote:

> On Fri, Sep 25, 2026 at 11:16:21AM +0200, Miquel Raynal wrote:
>> Hi Rob,
>> 
>> > +  num-cs:
>> > +    $ref: /schemas/types.yaml#/definitions/uint32
>> > +    minimum: 1
>> > +    maximum: 2
>> 
>> I am not sure I get what is the purpose of this property. It looks like
>> a downstream property resurfacing. We expect one DT subnode per chip, so
>> I don't see the need for num-cs, we just need to count the children
>> nodes. For me, the correct fix is to drop num-cs from the upstream DT.
>> The only real use for it would be if the hardware could be synthesized
>> differently, with a single CS instead of 2, but I don't think it's the
>> case here.
>
> Indeed.
>
>> > +
>> > +  power-domains:
>> > +    maxItems: 1
>> 
>> This one, even though we don't actively use it in Linux, it may serve a
>> real purpose.
>
> The driver core takes care of 'power-domains', so how is it not used?

Yes, it is probably useful. I am pretty sure I did not use that property
when I tested the driver, but the controller was either already set up
by the Bootloader or in a domain enabled by another device. In both
cases, it is worth adding.
