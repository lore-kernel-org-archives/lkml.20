Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F349471D09
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790340625; cv=none; b=nWqtqPQ6R9HNpHxNJAN1dFCjpM4KjzPKHAyzmFQI+grrWPWAslQY8bIHPS5uD338D1hocIah85eQ1Y2gtM40e1s2Ms0sho1Glw998FYcRX1gYk0voH69eqVNdbZnF9bM3buZftDmBwtLgf1SPokH68u+inzMS94OWHSzJbLayZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790340625; c=relaxed/simple;
	bh=h2BwQz/H4wDyJnZZiwXPk+XlhoH4jxeNDuPofwUx+rY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WOihghCg5lRK4qJcLokwhmnUARyzlaeCoJu7FDIZOb7xficsLDwQ6FYKIPx8pnyyDUma0a29iw349Q/2TK6yurnKvQoeCehYGOKq1K/vn2gUfwOx0SOLcpUHPAJ9vs8kgb1cm1qJ2BY/aZHTHmBoLvTAmHV+EbPsAAlz/Ff5CII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nAQLCHzz; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nAQLCHzz"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8034BC13994;
	Fri, 25 Sep 2026 12:51:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9E9586073B;
	Fri, 25 Sep 2026 12:50:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0B0B6103283E4;
	Fri, 25 Sep 2026 14:50:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790340621; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/0XQb7dUF6Xw+wOJyOLnA3OnExUzqknuA+1w9fxzllI=;
	b=nAQLCHzzLPVUd0xMh23JX3gIyRH8E+tYSiwp+XWhexJ18SUuS+kUKoEks6fGO1se/S8Chi
	AXZiO1ZWrLR/Ee2MOhB3EU2BqK+RykLClQgVJ4RSyYFjSzRoiELXDiCWhlU68YZCFQxEap
	4wJBrltkT2C4c/1JRaVSaIYEoi77qzi96OG8PX/YxWipQXzVvLGsYJpLMe5HSAgn1OHGLI
	A1/wSaYHa529cpEyG32SLHAOaQhS2fTzjkplOmlzMVBq8jMzV4xqNIlwOsa5On8nf/VRkT
	efE9XorQx9IbZDTyHKhzBDFKvEAvPt4EjTkMMaT60pNeFQb0vstcHX4nt7FZLw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Paul Louvel <paul.louvel@bootlin.com>,  Borislav Petkov <bp@alien8.de>,
  Tony Luck <tony.luck@intel.com>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  Geert Uytterhoeven <geert+renesas@glider.be>,
  Magnus Damm <magnus.damm@gmail.com>,  linux-kernel@vger.kernel.org,
  linux-renesas-soc@vger.kernel.org,  linux-edac@vger.kernel.org,
  devicetree@vger.kernel.org,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: edac: cdns,ddr-edac: add Cadence
 DDR EDAC binding
In-Reply-To: <arZpZolRwdU8zh6O@shikoro> (Wolfram Sang's message of "Fri, 25
	Sep 2026 14:30:30 +0200")
References: <20260924-paul-v7-3-rc1-edac-v3-0-bd8054a5b180@bootlin.com>
	<20260924-paul-v7-3-rc1-edac-v3-1-bd8054a5b180@bootlin.com>
	<arZpZolRwdU8zh6O@shikoro>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 25 Sep 2026 14:50:18 +0200
Message-ID: <8733uxlcl1.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Wolfram,

> But one thing came to my attention just now which needs fixing:
>
>> +    items:
>> +      - const: renesas,r9a06g032-ddr-edac # RZ/N1D
>> +      - const: renesas,rzn1-ddr-edac      # RZ/N1
>
> We don't need a family compatible. Only N1D has a DDR controller.

This is true, but from my experience with this platform, Geert used to
request both. I'm fine exposing only one of them, but I explicitly asked
Paul to put them both to mimic the existing bindings and keep some kind
of uniformity. I'm fine either ways, but before we go through that
iteration, Geert, would you mind confirming your preferences?

Thanks!
Miqu=C3=A8l
