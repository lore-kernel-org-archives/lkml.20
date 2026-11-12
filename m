Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794497384;
	b=AQUffCSGIEsuaZuY8GvqjzxS+bOV98jKViHRQk46RkuPek0Rk8YCGKltkfr+2LD+xqjZ
	 kpVMXSx5X56vVqBA+C/4pWanvuiGjpO3gCbVgJGli/opms3WEIMXg/lv9UsEu2iXlQXVJ
	 lv8wJi3RBA0luifB4rQaDfNUBoYOby2AReCv1hc44PYL37fVm8JOxdL+oRpIkaDccsQ1z
	 rRd0BoQA4FDNbMZqiZizDoVolIqioM6ehprN4p2XGYRJAf8j6XBS2FK0TI0qC6PZkvJFQ
	 qay91cXT6XWrzolkoSNhh6Q9XhTndGhzPG8gyJrEJ89PAQYUCIVp/4ilXe8lve/zQig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794497384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=oSZaE9Jkg31B2OjfxIU50Lt37gIuMNU6vFeXv49uKjs=;
	b=E1Bp/Wcp7JCOFjuMYdhPFF2HEkkHd+caS96pFrzLVHNgjnqkYX/QOez2NjUPrW2A5FX5
	 pNJwGEq1vW5NxvAoq/WYGBxSzoflWktHn0RVIwF6ekVNhY0ozg20JNQTXwpXpBIlSmVfJ
	 fKtxr44ShNn6z68z+1qedjS2wMXcA2VTMHMIYpKYf4oa7Luo1Yrss0AyqNJGwA7x5+2SH
	 kH38PtIO8IcijIyqCJeLZpbOpCobGFLrEPGUACMMjJ0D52tIcU409S6KelPMyXqW9ybpH
	 8veOTOj8eOvY4gI8zgHy+/Q66RLb0jL8RCeR3ilM9RDSza4qM9pvva/+3+pJAoQn3kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jtMlgnpc;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF083606A33D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:29:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF083606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jtMlgnpc
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so8732047eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794497383; x=1795102183; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oSZaE9Jkg31B2OjfxIU50Lt37gIuMNU6vFeXv49uKjs=;
        b=jtMlgnpco4UwKxbq+hTJuGkYqUS6+/veHha0WAaU9XXa2kFStd7XS2On4fXy3hmxSj
         x6FAOjEmuFrh/l6t0p/PJGW5oROum2TzcUzL2MKm0jnE4MkNXiOAgMb3zVO4WkvuhSlA
         atNfJMDBizEMX+jTWl1hCvDKytA6s7lxSLPofs1M0yoNLM+ar0uHXAPsHKWxg8GEmJbR
         iUMzG2j498hETIReLsACRKC9ujRiBk0s8XJec6huxMFlw2ugh9uKRrWmOF6ep3AXh5D1
         qt/GdN4NOvDvvBg+GmbwbGCFOOaReO0/BvxFcC/u0f5YIBZ4v+uaJ8yFc56KRYW58r6t
         hWMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794497383; x=1795102183;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oSZaE9Jkg31B2OjfxIU50Lt37gIuMNU6vFeXv49uKjs=;
        b=jVOXbTt8u3CZTifwOdsycr3ApVO0iK7Goao7LcGzraPHjq/PZOCG+u4q5EbBr0+ylf
         +eP5F0B2OsANQRHf4+DIdHkFqye/BuAFBxJcOTS1I3i5uvZDvY0m/AyMuA+5yubB5Q5B
         YLLqxddicx4Pc32m7K9AUtVdd4hFvvhsmGksrINl+o6Kc5JNGt5vUVUxbP717NQU7aoL
         Nyc9Fp2qM9OM13GxAdffeUYgihqTx+xrxDI4t9JJc1vqpf/odGFHbKjDGnVmwfNIkugj
         xpy7UlrUNZOJGe7+3LT21f9zCBuvtWKj4wrbPn6Inpq6b8P9ZIgKdIOtd9nS2+7WtMAA
         t3ig==
X-Forwarded-Encrypted: i=1; AL+hErFQT59A+EIkfcxnJHew045+j6qCYR5eiCR08FF70DPnriBcIRQSsyO2xD5q65OuvxDRqEFUTqcKO0fvZFM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mfUUkabpCwQDacTprlUv+USUuqayxJNafRsrPZWhq6/UAg+l4
	w6HB4bRX6p+JmLEQ8ftcZVkAO9G8OFiWyT/Ag4p+lHn13vEodfUhjG4m
X-Gm-Gg: AYBFou0rTkpIl7/lxye8RglVMRz8JtbJCr8qTzIvMim8qAVV7D/26PVlpwVtj8rQwYM
	xS+N9aSQVl5UCq37+EQnatYv1/L2Duoc9yUdFIBlG+XeRlEcyJ1udX+Sf1OC0OVpPFWuggE44DD
	tvWiK/fQPdUcUki19R7kb/somcawLZguKO49hCWzqGgXbXrdoFJxVByRqe2h+ZdIGeBkTra1TUB
	k88X/LtU5Cuj14M4wrIIp7/enGfeuW+Ffm54SUY6tAZEWLDiDiIel0sbNI/oMOBbYCYm+gJM2yz
	faBEwLbikkbfBKz6ja+JIRKqWslQFMUKYklzT9Yq23ZPiZlXPzympgA5FWp1HWedxqS45zZFeUy
	oMx69qYpx8iPOtQBmFgTNi7gYw4+oMYV32XMceUY8+9kVLt3qNzhkDWO5MZvQ/aX9DzOGHccmOD
	vSZqMNdVNbSmAny7JqMSdLtucG4whuoVvNoakBZs8Bh2lPdmsC0sdrsmiSsCI5Nrrxa4/UEDKVJ
	CUtKi0h8m8nrwm/Wp/j3A+EXdBWghJpAhs/KAni8Tifzs8JURZL4UkuWBiGvOptkUYpftlDaxPn
	yE0ToM6qQH56VGTV4lifIMZiDQ==
X-Received: by 2002:a05:7022:c91:b0:191:444:425 with SMTP id a92af1059eb24-1b3c023cb0bmr4915582c88.2.1794497382427;
        Thu, 12 Nov 2026 07:29:42 -0800 (PST)
Received: from [127.0.1.1] ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5029ecb1bsm564469c88.1.2026.11.12.07.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:29:41 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, James Clark <james.clark@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, TAKANO Mitsuhiro <takano32@gmail.com>
Subject: Re: linux-next: manual merge of the perf tree with the perf-current tree
Date: Thu, 12 Nov 2026 15:29:39 +0000
Message-ID: <179449737932.73597.12778815944082557280@gmail.com>
In-Reply-To: <avW648YFgbci03ra@sirena.org.uk>
References: <avW648YFgbci03ra@sirena.org.uk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: kpatch-send.py

Hi Mark,

Thanks for the notice. One thing worth knowing: the full stop is
intentional, so keeping it in the resolution is the right outcome.

It came out of review. James asked for it on v2:

  https://lore.kernel.org/all/a188c604-46c0-48fb-9cbd-9eacad88b5c9@linaro.org/

and v3 added it:

  https://lore.kernel.org/all/20261107022145.1713159-1-takano32@gmail.com/

The copy in the perf tree is that v3. The copy in perf-current is the v2
that predates the review, so perf-current is the stale one - nothing more
than the period is missing from it.

Thanks,
TAKANO

