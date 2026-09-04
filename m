Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B930E3C1D47
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788510250; cv=none; b=ZWuTudsFMt0nD8L22wjzjfMlNalXS1PDfMDUcbpnkmKrQ2UX17NCTHdOc9YKoULQ8c0egwiNjaEdIoUaUq008rbVxl8f7gvV/LkHUovmd25kLbVThicjlcKyEXd5OSNlnA2MQQfCVda150kvdq3BDINFev38JqxU93MUJmoIMk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788510250; c=relaxed/simple;
	bh=bOFX6B1cMLWK/8rdWZyVjQRxmhZreHCtlJQd0747/0g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=td6X3IZCrD/VydsgizD4/F+1ify2bV+EqumDBUdQ0DWC/KQZbw74nh3Agg+sMmRBK6+sevAtYJf+360RbmEr8oY/UIxApNQeipzfsJXNYOr4BESEIc0I/o1aXIgkMTr6HgINyFcWdFE/NrpKwQEqWXO2VN8nKs6ohBq3ng6D54o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=RZT2XFGa; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="RZT2XFGa"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso5932815e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 01:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788510246; x=1789115046; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bOFX6B1cMLWK/8rdWZyVjQRxmhZreHCtlJQd0747/0g=;
        b=RZT2XFGabeGVMYnYuvbApCELKeWCwlHJ7lJ6KrQziN9fgyhdIvkR2XBo8FB+9O/j9K
         txor+j0jFmjyAs51yleBFwGr3x1C53w2WPWPpZUK5tphVzsn6ty8xAz54bkohQgLzxgr
         gzQzpiVnhNF6Ckntq5i2mdVGVxuUPUHg7iO+CCstjqAO6U+xeoJwsrov1RlpSVDc4JId
         cYDPl+BppRR12QBd6HVdiAPWBVguDj+/7xRZZ+UawR9CudjeTm1NCxPj0jAVjDNvPcM1
         1pcg0JE+xooZ1PI1wjH/8cbUB/XMO/yyqsnllSQvJhvwEjMOHlLldTLUw4D0vofurr6N
         aQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788510246; x=1789115046;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bOFX6B1cMLWK/8rdWZyVjQRxmhZreHCtlJQd0747/0g=;
        b=Lifdts+IttDwCQQ0MotuxMhxOLasGz3F9S+WZ5NyjoPmQR84yJfxq46lC09BSHdLgk
         RJj7KUlDUqr/dGl61tcNQiirX+oJ0lFTHt1T3MiVph3gSlFBzKklH1JNRjR3eGpSeISY
         1VBpS6WcYcZROB7NY3ZaM2F2hvxdFGOWOd5YnmS0pB0pkFJbYtorA34EGKRHl9LGwEZK
         /pPZiayOQ+YBfGyWJL4Q0z76EdzgpAAxXdVntVgrpW21UUSGZM+EIup/i8HLJ9e+xzwC
         RIiMtm4z6k+1Hsqoq/f19Yjdai3C0pCuUYR3v5JNwHuQU//8l+dGIDxifGL/x8FSuQYY
         Qkfw==
X-Forwarded-Encrypted: i=1; AKwUvBxpuhtdo3mSrNuqYf+GtnbI1R933t74WrEeFmI5TWvSBaJjN2WleCtqPfTcVJH2qlx5CGFp3gn19D74j9U=@vger.kernel.org
X-Gm-Message-State: AFuF++nmLg+9UCyZjSL+80g2XFWSi+l5tfawpDDdEIOuFz37Gvp4h8GB
	cyFHuRJZn05/ZXaLSRmGxOJ2mujyLHYRBcK5Z0eRKq4bgzFSzcdkngyy9pvjeqb1GBU=
X-Gm-Gg: AYBFou1Bv2pYZ5ogRq5h/rk7r6e02U+PIBVWhADVaLepOVCTQRAjhce0tl3un1mq1Bd
	Y5+f/7Ka4bLFGsoG0dCsiW+d5sdIyzAe/Jv6ULZZ6kTubqKlg9Fop5We4mQQhE3pEct9KDuaSYk
	glmnDgt85O+zktb+AHcNRhp3GIogsdgvsjfYu89lw8r/PJG2uQ/7aldKUppxjeJQWLfD7WGzjeT
	s5QfJKOvQVIDmcchTvHXtoDv0m63bcv6dGaD8s7ogcdtUvafNA0ctKin2a2N1O81NcP7gbbqLwo
	EoedP7XEwRAUXlVdfFCPPTpo+sUs1g/wFoRsEqPXLjhBdwbnoqd6SeuBKZ8v3l3VCRExmmYZhMH
	efS/ebi+I05f0vguMI0lim2/VGOmlAAWLbWJsvuQgv0KO3/adjdCR3lFOVGmQxvpJ1RA9FrDAcf
	Zi59QZvDHHK+hhj2L//MHl/qQLvvEpRYZJhPwe0LC08KT9IPJJQpmJszolgE+Y3fkAi9aC7DfyS
	vPYkbfL7tqYflClaA==
X-Received: by 2002:a05:600c:a44:b0:49c:dcec:bd27 with SMTP id 5b1f17b1804b1-49cf821e7a5mr40764145e9.8.1788510246002;
        Fri, 04 Sep 2026 01:24:06 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfe14sm4632933f8f.35.2026.09.04.01.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:24:05 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Matti Vaittinen <matti.vaittinen@linux.dev>, Matti Vaittinen
 <mazziesaccount@gmail.com>, Matti Vaittinen
 <matti.vaittinen@fi.rohmeurope.com>, Matti Vaittinen
 <matti.vaittinen@linux.dev>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Matti
 Vaittinen <mazziesaccount@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
 <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Michael Walle <mwalle@kernel.org>,
 mfd@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v3 08/10] clk: bd718x7: Support ROHM BD73800
In-Reply-To: <2a74fea679420d147ab1029943ff071628dc8c5a.1788346553.git.mazziesaccount@gmail.com>
References: <cover.1788346553.git.mazziesaccount@gmail.com>
 <2a74fea679420d147ab1029943ff071628dc8c5a.1788346553.git.mazziesaccount@gmail.com>
Date: Fri, 04 Sep 2026 10:24:03 +0200
Message-ID: <1jik4ll90c.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On mer. 02 sept. 2026 at 14:05, Matti Vaittinen <matti.vaittinen@linux.dev> wrote:

> From: Matti Vaittinen <mazziesaccount@gmail.com>
>
> The ROHM BD73800 PMIC has a 32.768 kHz clock gate. Add support for
> controlling this clock.
>
> NOTE: The CLKOUT pin can be muxed by an OTP option. On some OTP
> configurations the CLKOUT is not outputting the clk signal.
>
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
