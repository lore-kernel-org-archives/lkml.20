Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDF254704F
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 00:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791590537; cv=pass; b=bcpXHpDjdOZ2AV6bAUVQyk8ZV9RYIIZIP5Pg3tD1n56hc54D1rjc5rkk9lm1GRN8fU0JELB9EEKh6tXmk3iTxm7MQpqH6lRAdAZa2jEIaNQh3C6tGb2Olyg56K8csfksQjDIgybKHO6xYFBDIgmoCPUa0+oUgkoS6t41ud3CB00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791590537; c=relaxed/simple;
	bh=hXTeWRoHLQjJuetkdFQnlbxkl4pZIcomCQcGCLyZ9N8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZypEw6anwZGlf+3bz43M53S+lJHn1vvO7myJvLwX/x6tCs08BPV5ub4eRU4rzm09hsYO+OIybEgo4bEy4bKWkxyyrM4Oo8RRKBHbY8E9b3WUIvnpHhlK9WiuoBtew2oaZEbaK+zWiFXuALK47BSN7KpFyGLE/bjcRDl0BBjf0Z0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XQ2IcHlC; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XQ2IcHlC"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-6711f05fb14so174462d50.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 17:02:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791590535; cv=none;
        d=google.com; s=arc-20260327;
        b=gkfj6qjbOuzQx4arBuN4jqUKj939jQ5C/ZpYW7L3TofxiFf2l1ZvfmzBfakpXrSpk2
         I+wjPFQ9VbWtLsVLc0p8OlsQAU4XN+GpnCcItNqP1yO6mHxhYa1yLeHhwUhx8rDG5WBK
         f4y1NBnB2nwkxaFBrGGNZ/fC7qgONM3kswgkfGzlDzgLca9zyHFd9l4n3ch/6Xg8w1zG
         Qmq0Fr/PLW/9BFiODJMc96UssgGVcZRwFNw01xrcT0KYwUBk/d5PG5wBbvrmj7DU73Un
         nhmi1E7+C/uo+10OTw/ZcvjmeS408pDNJO3nnfrmNJZquyDUmxsXAc/9NfMtg/MWDjl9
         Nqjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I99AZGsC3feH3Hx+ZXc5ABTbclG1gdclkr+/K7Qjuzk=;
        fh=GLAi+POHxD6UVIhS7nX07cZ4CsD+uqb/IxQwhhXCRls=;
        b=k2QaftL2ZEzU7nGf7jNeTchtMoiXX79OWt1au1Njc1+XlTDBFsf0wgLGQmosVaL36f
         lz5URJjwvc80SzhPrKeEmAZ7rFemaOcyXvHc9mSaWdFHKrAvc2rXgaIfT2u/7catmVyP
         TtvzykWQ5d3hmU2OR+1crsY/2bLEc6MYKAM6Ayy+EzDV5/+CpXHf8ZGjpNvplsynEpi/
         iCwbh0ayPKdmiUAO5HGK7U6xriWw1XqRFTWdlrSgCeA7FrM7j7ciZNebeMxADn/Adz50
         dOzFeZ7C/ZGVCqyGf9ZWjflDhzGVvOqrkiVIiAp0Fo+qptbADuqIQZLCpA0eVEEEpXs4
         1NVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791590535; x=1792195335; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I99AZGsC3feH3Hx+ZXc5ABTbclG1gdclkr+/K7Qjuzk=;
        b=XQ2IcHlCzUGoI+aHVwATlYqWC22g/E16vEgE9jVggPlosc1/WaKPU3aBwcaInbIyLe
         oEH+JXWYHoV75gE0ebBQIqTLKM1dd9H0Lm3eHuJS9OREGh2WOFarYHFqhvJemf9+12/a
         EOxXe++WPW6R8R1kttzjJoIYLYUOoFCLYgwEqxW0y7CBuPaL74tO87GtNkEjNOvFTrpr
         KmqpO2pwarlXyh14MC+6ptPvBfbEI4GI85ccVRkemDszgqyUhVoz6tlicEUVOx44xH/L
         N2e9UhUSep6ru55kk8F8LQs7LZLL6qbuUmr/2bSRWzlIek53QzgihMji/Oi/no+8o1TF
         zPbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791590535; x=1792195335;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I99AZGsC3feH3Hx+ZXc5ABTbclG1gdclkr+/K7Qjuzk=;
        b=m0ZMlpfecZHYoOn6tC/dm8Jy6uCV+27kifjheObcKid0JRN4JqHYtQMg6XhphC9piw
         OEwCIh2uGfUe7CVw5Drhx/YsGqxWRQjmVLOQ7/uhw5DsnxgoehobLZ+77SCA9YwKOA9Z
         jEW3e/3nO/GK7TI6IbaYLkasm+RdrlzB1hL2RHoE3O4/GuUyjIfkNVcoWsYlnJdUr0qY
         iAZUuHeNyaClQPfcyQX4VyrdoFzrh241N62N1ua5a+iWmDTg7QYBDq8Yb+0bYOsiAP1m
         z1o13pVwKwhwc5OPzk6TCUM/q1/6Igbgs6RDutMeHL0XOrtu7VlrySK52OfIhp86cfQ7
         PVVA==
X-Forwarded-Encrypted: i=1; AKwUvBxTkOcuHIBGBfD9vuuM4F1xJGlrvqeEvOhUd/S4NXH6IY7rt6mWzSksogBZKOmcDz8op0eZzOPa9Ff5u5o=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1ru/snA9vHjZeB1LaASWhDeDuTRbKB6g64tH6Oljbe0Sjsa+w
	R8F/rXxBVuuNoLo91XDDVdQSrNzUxxZJvULbcK10Trg7xR1QvXhOJbmRKjK6JMoDY1AeajZXzGo
	G6ouZK5RpcgwrL4rdEBr76c4yc3s7QT0=
X-Gm-Gg: AYBFou2QV9S3BVn1fkBEr60SCAF203E38Yo9I/DeZRhfFu0cOwrzUt92s0tTWtlEWG/
	uOUGNgbGqWrgPAJ/SUJmFb9WWQzxJ0Er5WqZorSY0cCQODPArhWlenGHOL4a5rv8bG+sY8Zyen0
	hZt+wi2pwf2LkKw0fTxYs0jvweBCzcM/k1UQXcjszB+ZRVEhZKpLnrtYQPRHz1SHfAiLa8W9xae
	0bEsgqTgyHTWkAQsCavX0nCM9sxZozyIkz+jNLNSPq4h9rpK+zqJMNgaOLvFEwB17EZzBoHjoOp
	Wmg5VbqRQ4lIRQPEHLQZCoHYFbph0fr8wihPdoOKtgJiZ+twrBitE5QqiDKuRySyA8OMKl0IoGL
	qFdHPw7Iq
X-Received: by 2002:a05:690e:bc9:b0:677:c43e:c81b with SMTP id
 956f58d0204a3-67936059eeamr1294555d50.59.1791590534633; Fri, 09 Oct 2026
 17:02:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007-b4-landlock-fix-domain-fortify-panic-v1-1-042e9108f5f8@oss.qualcomm.com>
 <CAKwvOd=nPgEm=AZbEu12Eb90GtRUThY6YAjSiHHuNVHP8TZHwg@mail.gmail.com>
 <66usntltyie7ii2rrqajy3izxrvwubwf2vqnery552v3akhwo2@xwb4t76d37wx>
 <CAKwvOd=E7wgGPf+kgOY8sGi0xO-cFMAJK4PMBFknoEupJi1CXw@mail.gmail.com>
 <20261009204554.GA778522@ax162> <EF8E7F67-39BF-4382-AB18-98E9D6111CA5@kernel.org>
In-Reply-To: <EF8E7F67-39BF-4382-AB18-98E9D6111CA5@kernel.org>
From: Michael Bommarito <michael.bommarito@gmail.com>
Date: Fri, 9 Oct 2026 20:02:02 -0400
X-Gm-Features: AclHuK8tNFqb0iNpuhNaBpJsUFdnB_vd8X2cSDcjR__CA8pNTmkEAbFNAUmPMiA
Message-ID: <CAJJ9bXzLgzZG+836_2+pUVOWzndSFNoOh8Xu8Pw++_i1RMJzOg@mail.gmail.com>
Subject: Re: [PATCH] landlock: Move the domain layer counter out of the
 anonymous union
To: Kees Cook <kees@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, Bill Wendling <morbo@google.com>, 
	Tingmao Wang <m@maowtm.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Justin Stitt <justinstitt@google.com>, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	llvm@lists.linux.dev, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 7:52=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
> I'm still catching up from travel, so apologies if this already got check=
ed, but has this been verified against GCC as well? Is it only a Clang prob=
lem?
>
> Regardless, if counted_by is not working for a given compiler version we'=
ll need to exclude its use by version. :(

It is only clang, not gcc.  See my comparison between gcc 15 and clang
21.1.8 output in [1].  I didn't test clang
 20 or 23 like Abel did, but it seems like we can't gate on any
available clang version.

[1] https://github.com/llvm/llvm-project/pull/228309#issuecomment-608047508=
6

Thanks,
Mike
