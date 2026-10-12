Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDD8446055
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791792425; cv=none; b=Vpim9QOJhdIuBBv1JTYNwjjZPiPJbn3Yl1vvPnHDBfRCsW5ibCKSGRb847ZmrijR7UuVaphH944KnczA4PJsGlLy7+3spag2dIn+KQi4TKJxiP6PF9HCkYlarMAvpsMTGg+LYDh1eawJCptqjU5TRYszaLbfFoRdHVWONVhfQNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791792425; c=relaxed/simple;
	bh=iquteC2WLun4rL54eIEjgx3C2ts8WjjltRIkjPLgyLc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kOmfWkGIdby3N1N0Dj6FItbnJ6uKmKI9jh9F+BgNzcAsrkfw7lNGmmIBZSkO3sWM/k1pq6WIFYtIlQrSuCk1cv4AjCLazhRH2CR3TfcZ1xP9+YUYh4KwAKckwf9A3Ucr0rzyPdzXiwFIgZmocrcgdfxRyAtZOVvDGKDZRvXDQFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HxAJMdCQ; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HxAJMdCQ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DDF644E411F2;
	Mon, 12 Oct 2026 08:06:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AE3C4601A6;
	Mon, 12 Oct 2026 08:06:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 50C8611D70DE3;
	Mon, 12 Oct 2026 10:06:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791792417; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iquteC2WLun4rL54eIEjgx3C2ts8WjjltRIkjPLgyLc=;
	b=HxAJMdCQ7TvqdwVB+WwkdeOLAK7zA8dG3xUnrrujt5ECeJr3AhWj/JIlbFaobdbjP9oIom
	+ozF38V0nmmWmml6IJmutV3GR15zKWtsa9YOsXK5GghlWT9NJW2w7biTZc1QUMIdvJybHR
	0176O28kqTF1QxV/mlawvUd4wJ88s7xeyQZBclivy5B++8kNZKA18ihzJK5zJdH/sho023
	9f0jz12HKeVwjfGkzU9u0fTM3vix7dAvR+SmWQn8Tp4rgzSJW6PDsAPlzB8jpO/Swe3RKl
	TVxOYiII+OBLOKR3vYR0VWQ5Y8+UdDCLoJ1q0A2bWs1wCHxAKs+jl7CS0LkzGg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Chen-Yu Tsai
 <wens@kernel.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Samuel
 Holland <samuel@sholland.org>,  Maxime Ripard <mripard@kernel.org>,
  Richard Genoud <richard.genoud@bootlin.com>,  Masahiro Yamada
 <yamada.masahiro@socionext.com>,  Boris Brezillon <bbrezillon@kernel.org>,
  Brian Norris <computersforpeace@gmail.com>,
  linux-mtd@lists.infradead.org,  devicetree@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-sunxi@lists.linux.dev,
  linux-kernel@vger.kernel.org,  stable@vger.kernel.org
Subject: Re: [PATCH v6 00/18] mtd: rawnand: sunxi: support the Allwinner
 randomized OOB format
In-Reply-To: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
	(James Hilliard's message of "Mon, 14 Sep 2026 15:09:46 -0600")
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 12 Oct 2026 10:06:50 +0200
Message-ID: <871p9v4a1x.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi James,

On 14/09/2026 at 15:09:46 -06, James Hilliard <james.hilliard1@gmail.com> w=
rote:

> Allwinner NAND firmware leaves the bad-block marker in the randomizer
> data stream. On H6/H616 it also places all protected user data before the
> first ECC step. These choices differ from the mainline format, which
> keeps the physical marker plain and maximizes the H6/H616 user-data area.

[...]

> Assisted-by: Codex:gpt-6-astra
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---

I am sorry but I do not want to proceed further with this series.

Even though I am not capable of finger pointing what is wrong in the
diffs nor in the commit logs, I do not understand most of it. I cannot
clearly explain why, but I have had a hard time trying to understand
what the commits were doing. The risk is that nobody would then be able
to further maintain this driver and I am not willing to take that
option. The kernel policy so far has been to ensure readability and
maintainability, and my gut feeling is that this series is going
sideways wrt this major constraint.

Also, from a Linux kernel point of view, we generally just do not
support vendor specific layouts. I already told so Richard Genoud back
when he was working on H616.

With this added to the pile, I prefer not to merge the entire series. I
can still take some of the fixes if you feel like they would be relevant
anyway. In which case I invite you to send a v7 with just the few fixes
you think are actually relevant outside of the randomized layout
support.

Thank you for your understanding,
Miqu=C3=A8l
