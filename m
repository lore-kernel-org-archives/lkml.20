Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85234AD7D0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 22:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788387646; cv=none; b=G6dk4kLB2K5NpbtoWehxOC+h8M0z9zXk3f6h3ehbhWTqYlfNrvmBsDQWRL96Rr1HFrOe67OglKuBhBFxuhbC+quF42QDLED8y+jCO5WUxt4FkaaftkARBKeWQc48xu7LRRsTZWx8Yg4zpH5sH0JBaS0oX3HZYWnSHrDEnPnzuH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788387646; c=relaxed/simple;
	bh=iLpH8+9iA7ODTvTwUU36ZP/HgSshJOQEJAhWQZt/+g0=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=AY914iyOw9x+M5sITp22+A7UNb3p2eld9HZUVRup9Nc35FvyNEIPrZqBrI3Vhd5XTiEEGsdrh2vnpuSVjafyhjp8/C2mQw2qlD6soiL60/YSYO2VjthxuQZDW4ALqIVVx5mfh4dOn/adTc7w6G0vQKU369otnQrQsFwFje6xQk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fYB2lVtz; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fYB2lVtz"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso1319871a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 15:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788387638; x=1788992438; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iLpH8+9iA7ODTvTwUU36ZP/HgSshJOQEJAhWQZt/+g0=;
        b=fYB2lVtzBNybJRBuKKb3j9WGXB3m0Z3179BXXtcA0CLc2xeMwwZwiVqPMiaxXKQXXC
         J3RxjtE/JY+iRi6HILSlADNk5IG5s8Oonz8SJ4foVc1f4YAbtDUHg58p1fZVubTtGOpg
         BDhcRfAQGWkiADQcRoBouNRvvlxDw+MXf1bVLoqB/RrlFhG/L9tEwEpe0cO7aGsctK3k
         FMSj/Eo/rEBd42OTektr8MHeiRMphf8xzvPDpmc+bQysnjkynYQqvW5w7geWWqW+m5yJ
         P+iJsUNQafR/CovKsjGHD7D/y0MNjjFbJ2yqfPK4EH/TJUb7XUj5Nl8HADoVztkQsdv6
         2saQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788387638; x=1788992438;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iLpH8+9iA7ODTvTwUU36ZP/HgSshJOQEJAhWQZt/+g0=;
        b=k07nUgMG0hfytKXnpEb6iwvUMbqQI5W9jjvptE0QoACzpQTyygccV392vfqO10LZqu
         b2C3SHMSdT6NGoIAK+HckCq4Txok7ObWm6GjOsjEfEvvTSEohDTFkC8wIlnqeoct8I06
         jBjugHje23R2C6ZV3JIeXXcMwmGqJ3UvnqITHOcb5l4PrhkKljmofxA3FcI9W10h4fit
         T8r+F+amWf7v967xKMLwJde9/wO4//Vc77DZUwSWG9qq/N3JQbeCT16VclPyKI3Q0auA
         ixKqMyushkV1sHkWy3Iv4V2MGYQgHLCkAcivgRDt2P6kjWWHorQyCBNm+QseW/p2V5CF
         jp3A==
X-Forwarded-Encrypted: i=1; AKwUvBxxajArFshSlx8nLbDp6O5dfTTbpsc6UMVY7aR3uVXMG4Gm5T2cFMT6GhDR94nggRbs+Tob/fbA34anT9A=@vger.kernel.org
X-Gm-Message-State: AFuF++k6/NtXXYW+evGQ3edWF3sm3cEHG0dYKB86USnXyRuOKJwYE9Tx
	88VaWkPXOC35u/1xC43MTiLlwy3wYau1YdxVsWptcGH3cudnr7eUTJdqLJ0Oag==
X-Gm-Gg: AYBFou37V+jnEiU1a6vmHo//ofEcBuloiFk0F1rQ20DwlzYWh2P5kFJ4GCE5yXLr0oB
	6mZIDuBoM5trIsePFUwz9r9tbeT/EnqPE+WXjdQ2XhQ5nC1k36ywkCwcN4wltNArsCcW0zy/Na6
	KlSvu80NXLRkKNukEcyZdrIrUIbhfFfst57I8/GwRXug1OUyOKSxBA2aihVeJzer8OWuMMINTmQ
	Rp2KesHHUHS+Bd9eclqm4vWg8d1cBvFDPLEGYcIdjAyCiuXMvqMVrMrmeoQlA+tYZD4H2LxKwMS
	j0upN01r5xXeJnmBGf1W+uzTn1JdBq+s2JFIEE614nmniGTLgXo6tI0fVEx6n4PrJaL3BK4nl2P
	6irRvTFar7oHQkgPlQlFJD1M0QA+Uzv+XffPLxEgb2q3v4Z3CH3RMGrU42y/QmCorKz0+yQyyJr
	+5tEuZsDP78UNN3YbKVNK9qa9zgRZa4dZ9gurJ03UaAqVPTmhZQHprotc9YtAR0nA2VBnRhGWQS
	evSQ1NESfBmTuv9sqIXjAuAEiPyyHzgnx5J74Y3zX+7Ut81W2awQ792bCV/Ba9lovuBCknG4Ql9
	mZnTF5DU7gEtlB6UiQywy2EgytuRVSt7BAa/tw==
X-Received: by 2002:a17:90b:4c41:b0:381:cef1:11ac with SMTP id 98e67ed59e1d1-39aedfb9a24mr9812596a91.10.1788387638104;
        Wed, 02 Sep 2026 15:20:38 -0700 (PDT)
Received: from localhost ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b07ac1174sm1485087a91.0.2026.09.02.15.20.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 15:20:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Sep 2026 15:20:36 -0700
Message-Id: <DL56IA99IWH9.22TJJI2Z54XM8@gmail.com>
To: "Brian Masney" <bmasney@redhat.com>, "Rosen Penev" <rosenp@gmail.com>
Cc: <linux-clk@vger.kernel.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "David
 Lechner" <david@lechnology.com>, "open list" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv3] clk: davinci: add COMPILE_TEST support
From: "Rosen Penev" <rosenp@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260812184001.75093-1-rosenp@gmail.com>
 <apidn5onRt_p4FOL@redhat.com>
In-Reply-To: <apidn5onRt_p4FOL@redhat.com>

On Wed Sep 2, 2026 at 3:05 PM PDT, Brian Masney wrote:
> Hi Rosen,
>
> On Wed, Aug 12, 2026 at 11:40:01AM -0700, Rosen Penev wrote:
>> Add a driver-scoped Kconfig symbol for the DaVinci clock drivers so
>> they can be built through COMPILE_TEST without selecting the ARM
>> DaVinci platform symbols.
>>
>> Keep the existing ARM platform behavior by defaulting the new symbol
>> from ARCH_DAVINCI, and use it for the davinci clock Makefile entries.
>> ARCH_DAVINCI_DA850 is the only remaining DaVinci platform symbol, so a
>> single COMMON_CLK_DAVINCI symbol suffices; the whole directory builds
>> together just fine.
>>
>> Assisted-by: Codex:GPT-5.5
>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
>> Reviewed-by: Brian Masney <bmasney@redhat.com>
>
> This doesn't apply against the latest clk tree. Can you post a new
> version that applies? I'll be able to pick it up.
Sent v4.
>
> Thanks,
>
> Brian

