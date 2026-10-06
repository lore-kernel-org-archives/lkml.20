Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741E93DD871
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 11:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791285832; cv=pass; b=bCgCon/aku0Ad6JHkbMECP0fUmKYMdz1mXhzDBa7kg5HDdciOs2jYX0TijmM6cvQqodFOqQFxebEWoZ/n/7SpJhGQWOW82S5cNkvTBBXK2zUxeGjDM2fGCMyIbbq5tTWu2kYj14Vrx4aVBwVs4XlyLT1CyX/pNPJMoTEq8kat+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791285832; c=relaxed/simple;
	bh=z6yQYjaMST7T9xNUSIrjeUD0tICeIpWttHt7BzVViNE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O2WNY39RcCryXTGyA+UkFA30WuH8mss/8YU8GghxZV0Txbgl2vEq/Jz0x6IrZDITfTGzEtFFUI6v7ivLqJ2P6BHIkeIRnOWIFTOF7O2Bu7toNY8t4bgw1rHJj6YKmHQ0/H9Sjh/Wb8rO1KeYVNTlsOvTBY0RegLPCR9QmGIkWvY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BsndF0K+; arc=pass smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BsndF0K+"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-930c0f9c1b1so38237085a.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 04:23:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791285830; cv=none;
        d=google.com; s=arc-20260327;
        b=GH8f0n2WFC7fk97v7T4d8khbWNMSxduRxiPgsrlBCjb50urJST30RI6tghpg5cJQi8
         VqSCfvurWRMor5nea7j3c9hHWqSj5WTNiXpIH+K9mm/z6cT7EAG62d/LT+0cjyITHyzQ
         nwiCxnm5ANETgUiuGsK+zd31ATsVLeSzXSJ7Y2kb00Ku+BYowY4f3HErklNFoD6SFHIf
         Ou5f2YdjXBwjNnqaHapFwWp71qXVA5nT4FsGB4KKAG/VjkNd0PPmK+Fmi44NCxLRS9ET
         9oK4VO/3MtAKjCEaQlZJbexZM9p4TMMnMep9cHO/13iZuLZGdv/dRGZOtkz9d0MujS0z
         2goA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=m0nrJ3awfIMvMCI5Pc5TdpanFYz+3b7qYjatFELYqnk=;
        fh=4QCmzmcM6lO0xdQurzQAZK5QxTurA3rRn5WpfLC0RVg=;
        b=dBQD8pEIJl9dJmlrxyRUCltUF4PtQqCE1Y7lfqqYlWPf0Uuig64U+vsB7tEGwIUlPx
         iqzlE+iFi4meZKKKC+oP8pTjWoupmhPQrNPDWwRk9aUIaBk7WT9TKEQfTmlgkC5Q3cqS
         WiOPcAeK3S/i4/CvebQGf6VoYxDj5nGqQnBCXTCl62voQDxTjUDKyPESQPOUImu/JR1e
         oBo21HwMqNtbm/Fz4oVuWMsiMxjCePXZz9BHmQ9wGpbGyyAvD+LApO0yeB3mjgVbXYdz
         FxNhdSEcpJTOZRLE/WGxv7g8lcmBNkD+Afhh47fN+IkRVaaz9Ggsa4CPF3jBsUqRISh7
         ZT5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791285830; x=1791890630; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m0nrJ3awfIMvMCI5Pc5TdpanFYz+3b7qYjatFELYqnk=;
        b=BsndF0K+g9/ZkmvRNDqmJvpJdG6HRqy2cVfLyK7lN9EvtPDIqkq8RXXchf/6jwyKMx
         IRd8itxYfwzjhcvWVctS5TdglM0lfriQfABg1NHQFI935h7k65LNTPGZO5h6+EcjC2UT
         qDqIksZySIgOvPN6ZYj5RSFmt6QiksbvjF/FXabLebRG516Vzv4FEvfRzQdYhgeUVURw
         ax6v7zRiKbS4daG92ikFw9gyfVy3M5csfSqVrrbJuY2rO27vmVKBGS6y81vIwPO2kTXH
         QhT7XSg42h8miObe45OrxVa8PwKbh3+fWr++/ACl4TGauDxAyXFddWr2n0WdY5QV4YoL
         cc8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791285830; x=1791890630;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m0nrJ3awfIMvMCI5Pc5TdpanFYz+3b7qYjatFELYqnk=;
        b=g2m0hjQj7JFFVX70X57fmxgGogapEQ6FCdBDE2f8L4ndUPCDyWvxPeKaN8HtTA21zs
         DMqT23cV0gwwF3BJW/ibw2yogJpS7Wbhz4KNN8Rl5IpFZkW60VuasBbRjk8nwAR66Lrr
         b5t0zUg9XWU2BFiCZ+0rwN0FX3CvwraWBR7f4z8Qwg+6TSi3rQajov6jYFLVa5OdMM7v
         HNfQF4QEbg7gNDJL0k3CVoXyVJ+g9y159cFtrcEQ2NJPJ7VkUNvWDshnbNTgBFS88ENS
         qNsaIpO6v0VacyYIUp5kidfrGkfrYcm0fR/hWxWEhmOCJJiCkaJepPnzE7ipweb1v4Ba
         wOuA==
X-Forwarded-Encrypted: i=1; AKwUvBzUd32qxZtV8qMoIYMR0LMo+wsSq03/9rt16hjhdTgLNwums6kuEMiR539EQOqsWdaw1TM4tcPM1t1pIAw=@vger.kernel.org
X-Gm-Message-State: AFuF++mUG0dun25ajq/z+L6Xg+WsDYxzkTJhB4sihZcw2KisWl5PNkGs
	Of1PirNJNyvTMcsqVsYTbU9c68KJXGlb5z4GPmhzTNXnzBSO794qHXBWwrqrRQkzUTpzr7TC8vb
	7vaOCtc5P4MOoAcLWcj0xKfQa7lARVcE=
X-Gm-Gg: AYBFou1D1RuoOWv7by3M16WZ2milieb/yZZSMpv4W1mA/kabufllPZimB9zJaWKWHae
	0cbh1byeopEjqaneDDfwYQ5RUv6k1JMMNtWi10QBUuhfB770h4G4TtZh8KD1sb/lVk9NuJYeNoj
	K6ERtBGJ91F+D/oTJ8T3kX6PBruDA2wVxajXYgg34XjJGcckTJ1onC17hXWpppvwRpIXZwuiyG7
	Y/gS7uNEbLUYziNm28T+ddi7mHss0OuB/tgyCiN0+7Ps51x3DmZmZB4rTI7OgLeb9qXosl1Ge9n
	W7cBcVXtWDOdbm+KO4/Jl/MLZ4JDeKwz/gD1WD0+PFGdxLzpaU7ZqzP04lZ6SoHPTvMFqC6ku5F
	fDOm/vsjz
X-Received: by 2002:a05:620a:46a3:b0:93e:74e5:2b1a with SMTP id
 af79cd13be357-93e8f20be79mr176670285a.10.1791285830405; Tue, 06 Oct 2026
 04:23:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915125226.20579-1-ansuelsmth@gmail.com> <179000484817.707534.5059164498545591038.b4-ty@b4>
In-Reply-To: <179000484817.707534.5059164498545591038.b4-ty@b4>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Tue, 6 Oct 2026 13:23:36 +0200
X-Gm-Features: AclHuK-A-f3KKOzsuweY0rlORNqVHnne0GeUJDA8hVjnwVqlWsoVNYQ_BtfV4wM
Message-ID: <CA+_ehUzrL9qHe92tE0CeaOMAD1LXGuK79t5mZGv+bp2sCas_sA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] clk: en7523: Add support for selecting SCU serdes
To: Brian Masney <bmasney@redhat.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Il giorno lun 21 set 2026 alle ore 17:34 Brian Masney
<bmasney@redhat.com> ha scritto:
>
>
> On Tue, 15 Sep 2026 14:52:22 +0200, Christian Marangi wrote:
> > clk: en7523: Add support for selecting SCU serdes
> >
> > This small series is a split from the Airoha AN7581 USB PHY series [1].
> >
> > [1] https://lore.kernel.org/all/20260702093812.15918-1-ansuelsmth@gmail.com/
> >
> > Changes v2:
> > - Rebase on top of linux-next
> > - Add review tag for Documentation patch
> >
> > [...]
>
> Applied, thanks!
>
> [1/2] dt-bindings: clock: airoha: Add PHY binding for Serdes port
>       commit: 11952173d8a180ac05641775f80bd6946327478f
> [2/2] clk: en7523: Add support for selecting the Serdes port in SCU
>       commit: 4e39820b601221997cb2220edc830f92367cdfc2
>

Hi Brian,

is it possible to have a stable branch/signed tag for phy subsystem?
Commit 11952173d8a180ac05641775f80bd6946327478f is needed
to permit correct compilation of a airoha usb phy driver.
