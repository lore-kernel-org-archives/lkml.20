Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF86A3D75A0
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 17:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791566617; cv=pass; b=RIAW6iRa/nrGUGMMr4dft5b/5ku38Fc+iQehPkyu19QhlkaQh1JEj6TcVRM1QfIdX9DPTIg3OoqNS8tW/cA+qe4x3xmJhHnNnPWJbAYDEZe6JZbZMJud4bsqaQdrptyxq8LgppiTfXVA9y54slqN1Vy9VOE9lmQA1kvbbG/bBLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791566617; c=relaxed/simple;
	bh=G2jxbatKwQbZzM49tr63rk6J2FHSq0Eo1YA3a+2vpVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dV7dRgulkAUEQOgAN4Ws8ytycJe+TkkGPPAe5dKDGgbTQRtJU/YUgCt9fETAFZmLRZJn3QoSdP7ub6+kPJhVF4WrxF6gQA4lL5aFJRS7vFgk8cvD4e91V2+ODY/UP0ypU+y30urKi260rxHYX9+gUzGyTFE5tpkqA5IKI4Wl5/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DcJNa8ya; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DcJNa8ya"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-677bc4704cbso4564553d50.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 10:23:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791566615; cv=none;
        d=google.com; s=arc-20260327;
        b=PQDXAVy9R6+FVxX0jVun/Wid+0t9SILXjnIO/pjSCgyrGCanIvuQGVF71kZF0sbOkV
         RyBWz2skMWcMaSjYsa3BS1wGyhMajUqPJIiLz2iApZgWFrAxP+cJSxGv9JG7l30Dvof8
         6jCgKV79Gqb/mABISQeA4yfkqSWkf9cLppFqfTtLx9uFRwgvP+yN/ymnCEV4294NQjI0
         2tKuaQMEdCZfjCX3WDoiCRV0aeCVUuyiGPo4/FA7bT6pumeHZjMiQQ4eoBzO6xZjPuSi
         xtsHIrwsygdbeRnNcnNBKVWWNy6xp6wT7rTxDprIkzC9TmVRjyG0r77EU0nYDKap0Vd4
         zcAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=G2jxbatKwQbZzM49tr63rk6J2FHSq0Eo1YA3a+2vpVg=;
        fh=egyYD4QrpiuWmkg/PB/Av3EzVxPmHvyEtca8ZENbqbY=;
        b=Zsz8yhUflF9wVJoUauJfE60O1/xUG5agxobnHX+zH84wgqIOqqDTTNpeecBUus3ZsW
         S3cliWYOltUdA8clAQ9ON57zkFz7k3oxDGBC4/DIvK/PqLun904ZGFQdowIvFAM4rBXb
         TJk4VCi3S3AZJ6uJXsX/6pd6Rtip8eLwviy5VtV3DG0Na/7Up2YbrEdjJ4APwAENdXBx
         uxHPPBYLWZflFYaZ3McGrnv16EH5VGiWocsIAQl4kpKbtOCxiRbg+ydNHOsfY9qNXI4v
         EmOz0JibacNR6sf6EU8rFAwSEghr6bDEfxP/lfVmVOiIsVr1dPTT7u81CgjsU/wHY+Ii
         jfDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791566615; x=1792171415; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G2jxbatKwQbZzM49tr63rk6J2FHSq0Eo1YA3a+2vpVg=;
        b=DcJNa8yaRGkTNfc5n+yZJlUfiZiqIn7hfBJVpaV2A/uzuelRa1Q0IIhOLtQP4WUGpR
         gZOBUKeKNHPWCDb6ID0CANwB/aIfR446pSEH3KXl7YK1CUsBBael7zcf3btBXCXNidvQ
         0zZaNQuHOcPqjrj1CEzjgEyV/chixJe0kUpnZRIy3oj1x2H4IecbAA9wVqymQ+mXrWrz
         BD4UbqzePLfVuJAzQlWAhAYCdf1V7NNKAI/2gGLLfT2Sr3kWR+dkqhG3A7poHGNH4j70
         ELln9UTkS6yeMZO6jSXuOQ9iZzEKBOeqBsm/6voSaU+D9LGTVKDqILhQ6IORg/tOkBJ9
         g0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791566615; x=1792171415;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=G2jxbatKwQbZzM49tr63rk6J2FHSq0Eo1YA3a+2vpVg=;
        b=zB8BP84/ZcgFG40pNn9h6pW6udG12cYcdu1w1BU+wi8kGQkfWQNwFFmsrIO99XtHe3
         3FWNPVSKwLf9N8yKiPFHf0OVuvbiof1rLpqOutyrrDA2/3XrT/JSvRGpVnqp1jC7OZQg
         QLOAFjc/mxjhXLO/mEQuc+uhhHg9wWX/2v89YS0O4yow1Yr6h4nCCSNTFfcpd0mCvXl3
         BzYAs96v0wWfYweGrJHbcGEjpAxhDxiE2izg9D3tSdymab0CotG0bdujwNaQCiG2X7Ez
         CweKbAtlgxYKt/2KhsRrx5cAu+hKmd+3YsulVUNvCdrqHch4OCl86+axZTi4xWvZlv1D
         ijjA==
X-Forwarded-Encrypted: i=1; AKwUvByIifPPbY69rM/D46sPg0FmZBr3ua6PeY14b04gMC1BnS2dS5w4b2JpzcSUgSinCzQzCeN/pWRpJw8UvpU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPDM5p81DcbZuXZGsBKcdKz4NqNrBRVofORKEYUyqZ6s8pc3M7
	61+GOiM5qlj2kIC0XKQO26Tw9WYTL2r8OMD9XSRAh4dGsM+SHfsC5QBsCecV9fhiqdxWVrYVoGS
	UxFBLNwERZBW1twuyLJEjUhkJHaPU9Mw=
X-Gm-Gg: AYBFou1LaiwxyI22hamxUWKkKfkgV4hAR37K1xubXSH4uGSazyYaPJC5dPAarBg1q1w
	DHc+JvN0jxqoJ8+Dq8/Py8n0GRUo1JfR18MIRfFRZs5tz0hMULVndBaXPxv30HJTJrQYs5omEwn
	PFdNGySNIK/ZHCUib+0qjx2ci7zwFxu9JB0WTYVuznVco+cl3WVj2E95fBr3UvrLJOy74oabsJR
	elYrHpnVxqU3weRny/WNQ8DBVXHrTQYXstOCVF+QoY01i511GFCq6zWMBHiVPyENXxuXEWI+z3T
	MfjhQxuGCd1C55rvdw5pOh7WS6NkHIeyf95mPq4jLzocPmceoSN6bu6iMc0m8FDfZidlLhoVSVM
	Ka1lWyMgc5SE+qtSJib0KWDY=
X-Received: by 2002:a05:690e:13cf:b0:677:d251:ccd3 with SMTP id
 956f58d0204a3-67935f20994mr785504d50.13.1791566614782; Fri, 09 Oct 2026
 10:23:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009070725.13196-1-ansuelsmth@gmail.com> <20261009070725.13196-2-ansuelsmth@gmail.com>
 <20261009-b41aedc4c5583a8a94926925@squawk>
In-Reply-To: <20261009-b41aedc4c5583a8a94926925@squawk>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Fri, 9 Oct 2026 19:23:19 +0200
X-Gm-Features: AclHuK9ImRwdPwJQHAaZVf0ijPl9QjRVdptD4lXqbW_LJijH32tMCETZU-OfmLA
Message-ID: <CA+_ehUxMyx-aejgcve4+naou=LQ8-OOSTPMHvSNVhCEiEiw3Vw@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] dt-bindings: clock: airoha: Document support for
 AN7583 clock
To: Conor Dooley <conor@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Felix Fietkau <nbd@nbd.name>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Il giorno ven 9 ott 2026 alle ore 17:12 Conor Dooley
<conor@kernel.org> ha scritto:
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> pw-bot: not-applicable

Just for my own info, what is the meaning of not-applicable in this context?
