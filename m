Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793640802;
	b=zZvAEJQQ2L6jwoZegBw14O9u+LeZtyD4GG/d3fIMZO8O9/9vMsAgtjhmblAQoCcHQtCu
	 PfmmI28UhFaOLWWccP31sLLhES5wf3AVtpVlTnoEwBS0KPvZM4XZWDXQW/dgT88GFUTBB
	 vQ4V/fUnBbCyc/2tNLf2kPkPI9HD2dE3OqojbQ2TItruy1Du2yptt76N7DAJOJh7Ogxzh
	 8gAhJS+/MXMQYQpgzAUh+CW2KGx02tevpEAv3w2vlfZntY7mXVd3ReBfYmfs0L5jVpNQL
	 EJbtBaaLZzspH13MKQ8h48p/sZSCXl/HsQk+1NIMsD8coRJbjLj2G+zK5cw+w7kztTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793640802;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+/cx/+IJYxJY/T4mwYf93gqtJrVbC9oaeH8AQlKwQuc=;
	b=Gc6taSZpvNmOeOGx04wN0kDr0TjRPJV1H3IXz+IQDaKwHOhaypjjqZxmaWtCDRDPVipe
	 2BRqjNcYSeyrEtCxLzKc9WcmqoJclgK0VmdTf3lW8FvqjxcLlUQVTkWOCytztVg8TOSQj
	 29dQjPZMVb8FY/k6T90be8CNdMrjBXTlIQ45lAWSS5zGgkR0GoWnZ4Y4HnoxcjGQazF9W
	 WpZqBqEP7cloJ6T3LfLKBF9wS1+JGBcbrAjBZ0aUYmpumXXGX32N3NFsvXAnFUeULDSwy
	 qmnAPbSS1Bu9wOkeWZUFdZbVPriLjXRBFTGKCVBjuiiQ92NEyp/qfz3hU+gyrp30xHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NNoew+O7;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19BF606A599
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:33:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A19BF606A599
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NNoew+O7
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35159e0092aso355888eec.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793640801; x=1794245601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+/cx/+IJYxJY/T4mwYf93gqtJrVbC9oaeH8AQlKwQuc=;
        b=NNoew+O7xdcnjg4IubciJBN0bCaNtlIQaL8/Y9kydp5Z3odOahBmkjGOeNe3aIl6lC
         QS9ImmS7uDN7JUnRxj1h2l8UTfr11pUY5xKXeZSvw5mJhGgdQxRgd1lgxBHbhq5sVRI6
         zJEJiF8OzlCH5UHi+gxVs1LYU2VrleFHiYI4mccoqLy4jyyijWKJqtxq8b2F0SM2LSpO
         BcLlUNlr2MUJoccrJIX351T7trGmpFKMHpHClHk9m2bE/6VqQbJ4YeOmYDcP0Gl8bIIx
         bsi56rLgxqTmdN4Sec7ly4oK55wdqqin1v9AL3M4k++PV9xA6ebpjtzFquh0974pUEiM
         bJww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793640801; x=1794245601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+/cx/+IJYxJY/T4mwYf93gqtJrVbC9oaeH8AQlKwQuc=;
        b=MRAp6LoGYRTPSYR+JTwVgR8CLHJenlY1n+oPRFf11CHOlCTTYzo8hVFXqfthrBuPxf
         8Q1mx6L5FJM4baAoInIbYg+qmRatyEg/kqsnxowmufLHxXKE/xJQ3LX7uTwb/NTgHQ6J
         SE24qDd5oKksH/i9mzEtoCpHpj+Qrps0Mi9IKJS8To0JBAoCsEzWSmOw1Qzc5hZpEBFP
         oz5ZTQCjEMLKnrIDcLQQyPuz1sK+FILvW1ENPN5W7vD8kz7Pen0l+lnFT2CMtJeznwgO
         1EKqilM22WUg7G8MNILdwP/a3eq/hRMLtx+Edo2bfluxKZHhfSD6P4G4Zcpf+zjRRPBw
         y4qA==
X-Forwarded-Encrypted: i=1; AKwUvByzJ2qwReUJlB2Cc8qGj0z5LtuYJKBYGJ7Qle+wB40NPAZgra4Ynmc3XoLc4rMA3859AAfOAeHJOnD7lb8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8o8UldvekWbk+fbSJ3JI8TV+wtb4VRodWLPhNUqfCTDEBnl3k3
	6SnPeMTv/OmttST2bfPUMvNlDlmu1yif7vCgEDrdqfunsdOB2bRRwV7b
X-Gm-Gg: AYBFou2GOuo7Llo2AD+tt0Ov6nuMNL94zFK1zkKURyAOxcNt7EMFGr2Oh/e/TwZQfhs
	B7he2xwFJup04oFPW1brHpMVXFoYSH2vao2b58gR/3OWgFeZaQ4Byg2RKpXRFijvEXbjfgbHw6n
	S5slCY6ZmbJQGq9Bm5+dpzj30uidPLCkB5jGtobmr5jZubONIojg5ZEu+364mlHsesWKo8nzFvI
	crbTX0uzfuFMNNHXWcQOBiuuVYywYw+vlwp0KpjjpZpt66lnTVhzqp+Mzo+dbF0S3iK6g6vQxPk
	JweGDgjzJhzvQras0AneOtLn9DarYuhv+DVYf1/0PtbKiwXPPAlQ3mS8YpxUmJEVJ0FYC+Deygl
	EqA27fXi25o+LYE0QLF2xNJkGph2buDYu9qbpSIzczhcLpBfFftVsfnFzq+Z47DCuSYDegesBc/
	kLRNni7YRTR5HXujTg22RA/GfMExoBtRHefIbiBT76UPnkld251iCAytZrQcnP3V9Z5ghJJOguy
	jld9Pc5SOYZ93b4hi6Yxn0D5Lt786VhKKYSWCQ4zqAWiLLWkX10W3TPBVlmpfQpJyWEibOgYxdO
	f8OUNm1xVHVKH+gHZXJvzMR4GBJ8P0fdunitttGumG4Gh4Ra/jc4ZvfdjC7Zwrn4uQ==
X-Received: by 2002:a05:7300:ae18:b0:36a:13fd:b5c with SMTP id 5a478bee46e88-36a4235ceddmr21835977eec.2.1793640800547;
        Mon, 02 Nov 2026 09:33:20 -0800 (PST)
Received: from lima-buntos-dev.. ([218.239.109.48])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1easm33875716eec.5.2026.11.02.09.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:33:20 -0800 (PST)
From: =?UTF-8?q?GIBEOM=20LEE=20=28=EC=9D=B4=EA=B8=B0=EB=B2=94=29?= <rtx4060@gmail.com>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 0/2] regulator: mt6363: Fix the regmap value width and the VSRAM LDO registers
Date: Tue,  3 Nov 2026 02:33:03 +0900
Message-ID: <20261102173303.3464879-1-rtx4060@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102164345.523122-1-amergnat@baylibre.com>
References: <20261102164345.523122-1-amergnat@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Alexandre,

On Mon, Nov 02, 2026 at 04:43:45PM +0000, Alexandre Mergnat wrote:
> It fixes the range lookup of the getter and selects the trap 0 or trap 1
> registers at probe. Could you check it against the VEMC failures of your
> model? If it covers them, it may save you some work on your own fix. I
> have nothing for the overcurrent handling, so that part is all yours.

It covers them, thanks. Six of the nine failures in my cover letter
were about VEMC. As the model stood, three VEMC checks still failed on
your series, only because they change TOP_TRAP after probe. I changed
the model to probe once per trap value and to take the trap 1 trim from
0x1b1c, and then:

 - With VOSEL 6 and VOCAL 5, the unpatched driver reads 1.25 V, as you
   saw on hardware, and your series reads 2.55 V.
 - With trap 0 and with trap 1, all 176 VEMC selectors read back as
   they were set. Only the fields of that trap and the TMA key change,
   and the key is closed afterwards.
 - Trap 2 fails the probe, as your changelog says.
 - ASan reports nothing. With GCC 14 on arm64, each patch builds with
   W=1 on v7.2.12, where this file is the same as in for-next.

This is a model, so it is not a Tested-by. It takes 0x1b1c from your
patch, so it says nothing about that address. The MediaTek header and
driver I have don't define it. My own VEMC fix guessed bits [7:4] of
0x1b1b for that field, so I will drop it.

I will post the overcurrent fixes once I have tested them on my board.

Thanks also for testing 2/2 on hardware. That shows more than my model
could.

Mark, please take Alexandre's regmap patch instead of my 1/2. It is the
same change, it gets the BUCK_TOP key order right, and Alexandre can
run this driver and has the datasheet. My board is still locked and I
have no datasheet.

My 2/2 is not covered by Alexandre's series and is still needed, and
it now has Alexandre's Tested-by. It does not depend on either regmap
patch. It applies to regulator for-next on its own or on top of that
series, and both orders give the same file. I can resend it alone if
that is easier.

Claude, the AI assistant from my cover letter, ran these checks and
drafted this mail. I read both before sending.
