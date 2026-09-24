Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE5531DD97
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790227906; cv=pass; b=s9n0qQoJ3QYDXwriAwnTjmeJWbD/ifdtsv2CtAafEeAFGIzwE2uJ1RbBXZWhSWa1mDVlZDAUXydJEpIIshJATlmnlWaIwqsDNi3PZy7jxf1X1ftEziTRCdEhk2NJ+/FFQ0sV9RAIjHeWg9CHpFjwzISnF8UVErjpdxydOH/d5D0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790227906; c=relaxed/simple;
	bh=OnT1j0gF55TZq8gmDZO0CcJ6lH9dlv7EE1MvVq0Lt6U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VW9G8OXEohk9Cnh1c1bhCv60dGzLtMw7hckNOmmcl6tIsGmQeBsN0sBee4kY4RbkWAa9LsumAB3O3gpaE+p/mlTBFrmZd0osbhBFThdEBl0NilClf0Prw4Zh87cCWKCguCgIRfSZPy/IoP7sbz91T45ZTDNTCTBdm4zs+k+S4qA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ec4Y0yNV; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ec4Y0yNV"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29d50b7cf9so227400066b.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 22:31:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790227903; cv=none;
        d=google.com; s=arc-20260327;
        b=h/DGHD1bEerH3/Uh2lKLgdNLgezn0BDrfHYkcc+csWHIBIGU2trM/ElgtRr7sIIHkr
         5wgjBrN7G54cdJiMyV5SOBvjfnNOWj+kmMUYZJjScKJz8faBwxMWp8yEyDpjFUacdJ1a
         pb2CHom3k9L8Sa533Dw0ZJNhQN1wa2n9bJt/CAPV9Cq2SuLcQqejNp090Tm4IIpBwAL3
         x2Jf3Gp/AtoGmERk6dyXwxCBS/Y7gedDJ8GKUK7FdESMxfcx+7mt56AgiUTZMTizUNaq
         pYuUXZOefvCcpG8Tjn+sVbDQwSat5eTpQ/Eyb7cj5Mo5Mv3pBQpCeaUOQEqz8CoEEs1S
         VvsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OnT1j0gF55TZq8gmDZO0CcJ6lH9dlv7EE1MvVq0Lt6U=;
        fh=zLNDWPRopnHk28imdGRlbP5EEbasMjrkxlS6KqrGGIw=;
        b=npRGf/uZ5yYp+jtOVgHxIEt4OlFVaUOvXwSTbwarufAASxd6252aS8uyqnl9lssZll
         q7Yrb/axVDW+GgIiYWUjopggo/ZzQ1otBNqmRwMgeMwAZoy40qLLjR9g7sxAKTYt9xkV
         iDQ/GJt7oMzXs82i5xVsECaEtTPFLF1FDyEKT4ueTtTKRYcBZY0ZgxnWT5J+qBRYSXnq
         nEfKGzOsjZ9EbjbQuYyHTrHB4g/wRmH2SUFGodALiW4zKySeOzKmsUWR6ZGSOX4etuJU
         Jv+Bag0xWV0CC67g+Rz3JfZR5OfQ9vZ3rWtvQxQuAm1rIrGaQnbIv6dO4V/QMsv8Qygf
         3fYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790227903; x=1790832703; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OnT1j0gF55TZq8gmDZO0CcJ6lH9dlv7EE1MvVq0Lt6U=;
        b=Ec4Y0yNVIuqjN4CltJ710c5Y58NRLWNH3ym2uvNg7Mv1/1Uj06/Xq4E6PeeMJvwyNk
         /Qg3aTEqllqNutlzA+9CyegcOEPM7XmfkblOWMnc75hxmaQeoMzzrFqCiD5bNdLVuqCf
         7cxBz3hHgt31I5IwUyy6M62Tq1ZDmsYUl8eBWhw8rkukXk6Zz07U89sr2xZ3XRkNsWQj
         j6+FPdGHGG6lMBdmTHP4MUlJNoP1LdamX84HrPWkVYliDtAG8NUSLq961MBjrjojyDJg
         VBcAs5oufQ3kGZy4rjR9y9QvfnBKipVquZPdOZ4hyOieC9t6oagtwGWDDZrobueucOZb
         QlZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790227903; x=1790832703;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OnT1j0gF55TZq8gmDZO0CcJ6lH9dlv7EE1MvVq0Lt6U=;
        b=xgk9UDUD4/LaGhXHjleomDyMM4bCmct9bOVBy53rOWrmw5CGMhNpth06uNi5IjW/mE
         Cx8iNpxWhGg21ayyBRyM7auycwjKZvNz6OLRfua6ysaDo5djTqzMRh8f+dMl7vbZOM9m
         J8I8L9jFQrLwYu5e+md9zRDmxM0gBbWJvr9yXbeY33lGUIfK1hSpp0LXoedUcH3k31X6
         Cmkqw4j+rVs+TVWcoJKOG9zJCs0JX7+EgAVKbKpiuwY2SAxLMaHSSTd+UYeKwKkyInp6
         R9hi+VSJtPNmS/Ny5e4vqf7RaRE3OfKgfHvhOXODrgZ70sdXA+F3tYlzWUhRjWsEbIG2
         TVpQ==
X-Forwarded-Encrypted: i=1; AKwUvBxDNmmHUbtWvnssjK/C5iWsnsAKo2V7njwwKJpNSPlqQN8PhU/eJO1DICAA8OHxDcCAgQegy7x+lcdzexg=@vger.kernel.org
X-Gm-Message-State: AFuF++l0yPgQicp8cLw6FbSuWwchqNk5DVBsKHAJ/Gith4Doevk+V4eP
	4lcR4wO3lQy1A6uLAlTezKEtklhiP6/9vwLk2l5qu/pbsQ4/GGlBQVP6aXCgPyb9kv3LV6tUVQi
	ITPYaU94cccfX4w3q+AxD1kguQW+jwp0=
X-Gm-Gg: AYBFou1CoyqABnFTlaT2z3j5y3PfN2qXqGoEcptFiWhkZyHJCbNzWiSPBr+tXOXBA+U
	+1WYoZMi/EsCp197m3hO1YdPyhDQoXHCAEcelyqlFSD2Jid9ymm6LxPf5A1DYa2kDsE/saFKo5I
	ilDvYOZuwU2mWpyQ7WWMx8g8VmW6xblBqlq/3A89BJjiieIWTNNi+BIpWEXN/oM8UomQiT4KYpK
	JLI17m7EAwaqCGT9CyvOV/XGkLGkgyHqq9iS03IkZoVEtEVa7pziHH+4Q9kPkSvM7d520+KoI12
	seooIj38f6aM3gb3bJMKrd1HGjdMN2V0XVKg3HDYK65xR18XwBMHrp22h0IopVFU2jvpitKBoK8
	fbr6VPGxA+I0=
X-Received: by 2002:a17:907:9603:b0:c26:2a2:b91d with SMTP id
 a640c23a62f3a-c2ac23db836mr101945666b.6.1790227902600; Wed, 23 Sep 2026
 22:31:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924-gv302-tablet-v1-1-a45dd3a383f1@gmail.com>
In-Reply-To: <20260924-gv302-tablet-v1-1-a45dd3a383f1@gmail.com>
From: =?UTF-8?B?0J3QuNC60L7Qu9Cw0Lkg0J/Qu9Cw0YHRgtC40L3QuNC9?= <plaztininikolai@gmail.com>
Date: Thu, 24 Sep 2026 13:31:31 +0800
X-Gm-Features: AclHuK9ID68yXpk8yW-_xVM6S7qoHJoqGYfZL8hMoFlRtkmEuF3_JCoIEGlOQHM
Message-ID: <CAEbFrdhw7q6VC=dCnX7BoUW6ufwnbk+xrCyzfGbg_+zUneP=4Q@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: asus-nb-wmi: add tablet mode quirk for ROG
 Flow X13 GV302X
To: plaztininikolai@gmail.com
Cc: Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones" <luke@ljones.dev>, 
	Denis Benato <denis.benato@linux.dev>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 24 =D1=81=D0=B5=D0=BD=D1=82. 2026=E2=80=AF=D0=B3. =D0=B2 01:4=
8, Nikolay Plastinin via B4 Relay
<devnull+plaztininikolai.gmail.com@kernel.org>:
This patch was prepared with the help of an AI assistant (Assisted-by: LLM)=
;
I reviewed it and tested it on my GV302XV. Happy to resend with the tag
if preferred.
