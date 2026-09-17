Received: from mail-wr2-f43.google.com (mail-wr2-f43.google.com [74.125.225.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498B57081A
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 18:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789669736; cv=none; b=ZKpYWEdd0Fzr4KzeeyMItNb1Ve/vs6GMln7bB/LC1Uzh5auIplavwmY1TQ/0DMzX/RRgtXGimb+y/oY0Zw5yYYCUsCQLUIyB1seLwYG4i3Rvz8Bwb60xIKda7yZqZIjLz8E/yo7U2nDNVjcK6jGWp1PWXpcStke2IZsb2lm0o6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789669736; c=relaxed/simple;
	bh=2SpGKqTp/JfwTgeFMmRyNuW7aoTJomcaZ2jk3HniGKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z0VnYr9+WYyRMv6DThx8KZ6hVDqxPRTfjOI24Zt2ZLHjkLPdU+b0cRf3Wn5rzPhV6q/aLPRu7y9os0EcI00REfbxSgrzC6Z9v8mfm5KA1feWxY0K5mqGZ9tX6R9EQlmWR4+bAu2Ywl264Pe3FJQTSMcysMLDDV4/Xc7aqEVyU/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eRncQcJY; arc=none smtp.client-ip=74.125.225.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eRncQcJY"
Received: by mail-wr2-f43.google.com with SMTP id ffacd0b85a97d-482f62ccdb1so413293f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789669733; x=1790274533; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z8WFLPr3Z4Vj59hqf3BiQcKfbTnQOlSm6y7UQuAGxu8=;
        b=eRncQcJY4sMUbwzceyh4B0YQ5s+BD1pI7g/eQQnIuKvJIog0PgF1BHuODVFIgavUNY
         EWJWSYdQ1g8noErj9sc8OLN1Zoxan7iHLFRNTL7m3ItL7EShAU/lyIgkRFHzh3Q1/FHc
         0rz3StzGzHAOkoqNMCjCctgBpgVPZgkhKMA5En5bEgFFvsCSR2+/m6TcjheErvWk/2GI
         vCsl+AHbAnKrmovi1OuG8NOsBIFrKP6a4lGQ2hls0c2WNRiliV4/6aHpQT11dSxyjrfm
         JAEbg7GqmnyftjUD1w8nZlOYmfk35dUhFdkiwcgiuWSrvtCFblhxaZzOiI30llauaPpI
         A/TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789669733; x=1790274533;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z8WFLPr3Z4Vj59hqf3BiQcKfbTnQOlSm6y7UQuAGxu8=;
        b=Gu8xwGWrhWz5ikF6COR88B7pk5Vs31EaK4ejI7fCK/GUhqssTAXIkfali9I2wVvfqw
         lmpmA6px8caADqYo/dCYVyEGsA9oR5sL0ZVF02CsrrMQkGpa/s21iVMJAd3kCryCpSTI
         OXKHpDmtgbDMsG1eor7/PHgyy33P9HdhIXUL4PYT/oPPmUDfYGvTwf31XnsN2WKxddwc
         psWSHjVwo5K/ZSQruOKbWKXKeT+not4YP0WxzyGelxqNzozTuMniPi/W5gV+uGzdx1AM
         aVeQeP85eMmsZhQEdq2MiSvfATaeGK70hI9vOx7R8lK3BcInDzfcfEs575av8HBjfNmj
         p38Q==
X-Forwarded-Encrypted: i=1; AKwUvBzG5Oe/upX0qVNjXcjWllUpNtoF+30K7ADhMQu8wNUN7t+JZX40v7oKCI51Kl/xfhXZvMELgI2OSl0Qz54=@vger.kernel.org
X-Gm-Message-State: AFuF++lw1JKBI3STSYg+wZYckZAD6hebp6go0cBqeOKbvJjmRakHy6pz
	BqfgT2nXhM3ORaNdrU3SLeYoWhsQHxC79DuA9e7H5Il9XOO9nYFfWNSE
X-Gm-Gg: AYBFou0Yt81EnPzSwZGKxUpWQ3vI4YK2sM/JVmnQM+OcXakBC9/wQ4OGXr00PpZfgV6
	wFKigRZVqTCZs8ir/cj1PPmjz4m8iz5+tvJi7eWp5/yKnL2zL3LimVyCqyMTEow/Yu6ZpyCFBkT
	e4yUuaSjzgjl5MNjWtCLe01239ICzADbZCO7DZ7nwnhoSk1YIJH2JOFW++fLpUkFBdRRzITZtFm
	eQbdFVgBzbKSBK2orlzrqvNZSOJcpX5s0KSN80tg7mn5bSHi7GmwLpuIzC7dBL6s26iy9Cc56dF
	azFPC+1Js72SMxgMbXbnA5vhxXV8YtPGs5v4AfQIOuqZj/4mOWYeJg2KK4WRsYqo/PuVL6yYNh3
	cCZkZdeaOolSdkFWtfpytLcxjKMaLUzVVNFC79zfwlZtPpFFps+BiVtXTPPVtxDjLDgfJ6/Eo8f
	2a6Jt6UQIllqubdx2SzLjPth3pWWOofLTZKVvGjdhCyQ6HwyIVkF+k1cENv0lLOjmAYzrMKjK8k
	UeNUw==
X-Received: by 2002:a05:6000:708:b0:487:11:d053 with SMTP id ffacd0b85a97d-4871d915c41mr24943f8f.0.1789669733272;
        Thu, 17 Sep 2026 11:28:53 -0700 (PDT)
Received: from strix.localnet ([197.250.51.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf26c8dsm17422129f8f.14.2026.09.17.11.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 11:28:52 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Brian Masney <bmasney@redhat.com>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Russell King <linux@armlinux.org.uk>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 mfd@lists.linux.dev
Subject:
 Re: [PATCH v11 05/12] mfd: zx297520v3: Add a clock and reset MFD driver
Date: Thu, 17 Sep 2026 21:28:36 +0300
Message-ID: <lIjduhk6Sb-yyUCQAY-CKQ@gmail.com>
In-Reply-To: <x9tzyTnKRAOyrdtSGnka0g@gmail.com>
References:
 <20260826-zx29clk-v11-0-f8ad59c6426c@gmail.com>
 <20260910161711.GK1051768@google.com> <x9tzyTnKRAOyrdtSGnka0g@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartElaGoEJaRnaci40IYCPnGA";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartElaGoEJaRnaci40IYCPnGA
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Lee Jones <lee@kernel.org>
Date: Thu, 17 Sep 2026 21:28:36 +0300
Message-ID: <lIjduhk6Sb-yyUCQAY-CKQ@gmail.com>
In-Reply-To: <x9tzyTnKRAOyrdtSGnka0g@gmail.com>
MIME-Version: 1.0

Hi Lee,

Am Donnerstag, 10. September 2026, 22:14:54 Ostafrikanische Zeit schrieben 
Sie:
> Hi Lee,
> 
> Thanks again for your review!

This is a ping regarding my reply[0] to your review from last week. Do you 
have any comments on my responses?

Thanks,
Stefan

0: https://lore.kernel.org/linux-arm-kernel/x9tzyTnKRAOyrdtSGnka0g@gmail.com/

--nextPartElaGoEJaRnaci40IYCPnGA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmqsMVQbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiw48P/3we1ILZFxaaGd9dUpM9
EPNR5ZVYal8qGKGBQRRFG5L5iI9qCAETVZTl5UuYFjjcs3U9+f2t8HbH5pd6hZSt
C2F3WDGrsGddEGAPArMF7962KRKHHPUDoEOokUhrdp0/J7XFAZRDjCPJJdZxTHZD
cpnqNPNwoTUAWYs4kLINKy7fY7PW+sJqUmAqvnB47RLoFURA9/DYcNxa/1esTScd
Vyzm0NEsRFuZVSYTSjbBffTn266IrxNRSBnCJOxRAEv4edO2dkkqy9OZBDQLkcYn
LJDrdJY/bAPJFapkXGuowmd5kVtYjG60V8+0suU1m+2HLlSipyfl4XeYHAS8gT5x
UbXlsxgwtxCnMHWed3RbtXUGsYuBCsuO2HRz0Rv6Cduc2qY4XeEtgFxShiQbtq4w
bxxE8DTlxoYjflISxEYYp/fD79irBB3hsp7oeSzP8PUyHsuFfCKpb2kfwnUtwRIQ
Ov2oPm29JViaAFvrF1h5FQEU2zLsdNBquOIlsqamK07yjEPcELwlAByNv9e65/Zn
3HUXepbTgovCaAofjQsggxDdSLLb4O5FjNn26DgHxz9d6ONWOjyqOIalTG2SbujQ
ZDmnp3aIX6ETZBue8mBr5Df9zQTmCwYmmAh4PtqvOfy8R72pr+i3SSUdTXIj8h4X
3h6c3+ubcO2oiEqVFEPbus5o
=NhYp
-----END PGP SIGNATURE-----

--nextPartElaGoEJaRnaci40IYCPnGA--



