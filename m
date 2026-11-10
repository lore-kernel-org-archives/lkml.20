Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794348091;
	b=vcENtuklVKrM+hql1QBsUCZkheIcSvJ74zC5MnhjtiIB3sZ7MN5yC+0zJmyC+WaWXLiR
	 aHyjEcsfHKcNjBW0BKifGEralENwrZ5Yk27fb7IeKCr+ZYji7Lgz6nDgZLsOLgywpjv2K
	 yvnHIjT4f/8PF59XuVkrN+0Wxi/76JVioBZFVoOAZOSrtGKytZ+yqbCuB8xDK2uuAtZYG
	 fus6JxGEk9vbDIvhTGEPZRt3jsQNIcygiYQy4caPmbleuT9N+BABygcbVogKv5zpVQMPk
	 PtpA5JwAObx2e7ZoQeC3/Yap8rG/w2D5yG3aXc5NpBBkiDfqbcf5m4kPrVIX3aYoHeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794348091;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=bNQQ45hOmPJZU+OFlMWuY5PF1b1awPlhFrQtFxBJLDk=;
	b=c9m1L2EpZUYLLvQ0NJtIhmjsSK2Pj2aNX0QHkw0IXKkZ02j05cAFvKO93qx2KCrWDKqM
	 7zljQL8obKT2YiXhMtLUvfRYlfF8erqnUOW9ChPIiaB7LleyFM+UDN3P0/WLrb9NVY3lG
	 SguGPg6zkBnpY9O0MoY6BxoFDhVxT6O9mGT7jpQgNL/ZeAjQf97svnOPFAjxMrNLT2ooA
	 IqmYfN7aOcokPwlRnVr+8ICD8+16wLU/OHN43rAz02nGb+Jsvz0SSVJylI//3gGAwR61l
	 PsAsu9ehGm6PP6ce1eHoUc+MvXj6Cm2LoD38NpugZJPtooR38VJ+Lzy/xHEa/EHbmmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=EMU63R0W;
	arc=none smtp.remote-ip=79.135.106.99
Received: from mail-10699.protonmail.ch (mail-10699.protonmail.ch [79.135.106.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5019F606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:01:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5019F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=EMU63R0W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1794348087; x=1794607287;
	bh=bNQQ45hOmPJZU+OFlMWuY5PF1b1awPlhFrQtFxBJLDk=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=EMU63R0WF7yyCSkyXe0qA3k9L/LGbrpll3SfiJIvR2nSnM3I4ImqLzGzfxM36a4lJ
	 QNCXQOBLffi6h0ozB5iimlQxLC3YJh2nBJLnddi1h9P6z5GlvSd+SEe816ALxA3R72
	 KHPnWDx5mj9TPvGqtHnPdeWoi8AI9F/3+Ug7v2sX25LirbZG8SNlWyKxmAWkbz5XzV
	 8rKyiPsELLBarRGRIkcqNm03HHFtQJM0iCurQnja8a2sP8hEheqhbDb2D2h0JOeizR
	 EjrcXXfivFpgI0xnPIwWK5BfrKv5DGEM5XC0xmDyY3pZ9woKhYt2FNuHiRr2PnBUUs
	 hOrw577Z8fDJQ==
Date: Tue, 10 Nov 2026 22:01:19 +0000
To: "ghidoliemanuele@gmail.com" <ghidoliemanuele@gmail.com>
From: Rujbin <rujbin@proton.me>
Cc: "broonie@kernel.org" <broonie@kernel.org>, "emanuele.ghidoli@toradex.com" <emanuele.ghidoli@toradex.com>, "gustavoars@kernel.org" <gustavoars@kernel.org>, "kees@kernel.org" <kees@kernel.org>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>
Subject: Re: [PATCH] ASoC: soc-core: reset rtd->num_components after allocation
Message-ID: <t13cy0JX4ZGEYiW6JhU0y9gV5G1aJavVhofJLw7TS5l9fmiEqDD6IJSXG5jObsv2M21adiCt32gFQZhJpTKDW3FPOBD0mLWcHwG8dRttxOA=@proton.me>
Feedback-ID: 45446246:user:proton
X-Pm-Message-ID: ddbc061da96164f12a6495a0ba84e63f365e8f3e
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Emanuele,

Thanks for the fix!

I tested the same one-line change on my ThinkPad L16 Gen 1 (Meteor Lake-P, =
Conexant SN6140) running Linux v7.4-rc2.

With the patched snd-soc-core.ko, all 18 ASoC route errors disappeared, and=
 the sof-hda-dsp sound card was registered successfully.

Tested-by: Rujbin Nassereslam rujbin@proton.me

Thanks,
Rujbin
