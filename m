Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793781181;
	b=Yl2w8pi/XP6OREPDYNuavOYsPZcS5upD4aS/yhokLAjert2vAsYZBhd92GC1KCuCJKTr
	 KhDnLfXdoaKQQh4hGZ8E9zuv6jW0CEgJMVDzNmSYHynkRpSIywJUNow07G2Xi1SrBhyoC
	 5EsghmRydzywkUF1CKuLjGgPAkQWzGDa4exCHOJICqEc3r3CaGuwrvD9Dyz9knGnjfAKX
	 dSNDOyBGQolu02Z6ocbMo8JWJmUO1oHZn+LqxCcL0MSaIVqkjqkEyorSYe+Yy3NZskHag
	 KiYrRdfy9jDQy/z/wcC/+euiEr4vPOI/GCw+Jpsqaq2rnv6+bGh2GlUN3m0BocfF+1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793781181;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=v+la3jMKr6nPIrYEiR5T+L2vDOYUs+pDzg8N/ii9g/I=;
	b=wyXozFb9OaTvm4D6w0WnOkPHaY+3T/3FOCvhbQEITl5nOd+tUpRv8M7HzH7Z8Z5fNvPb
	 pWKjl8ERJrlF4Bu3vbBdoV7SqMdYWwazXUwWQ5Ir5RhdO6vqh3FgJEqHOZwrYLuzBzk4t
	 HcyL3bmcf6kuac/axpwVUrEEXyCsi2kPwAs8NftNtaEHDVVJyGeSkjrTAzOUU4PIsnI6z
	 ezpEL1RhTuM0XHSI8djhMbMrw8dV0CkZ2JFcnNm/ndZuBZFNEWd0Qohs5veygL4GhxhU9
	 uAUpVa4znncQpy2Bh9ha0BvigPMGrXdzkG3tRC/pdxxfvFszNp/dyy0ZQ/C3lPTfUaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CE8606A330
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:33:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83CE8606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e5fb79ce82so2214845ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 00:33:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793781181; x=1794385981;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v+la3jMKr6nPIrYEiR5T+L2vDOYUs+pDzg8N/ii9g/I=;
        b=TRCzgwpoH7TGiBZ1ZAPPMJoeHrCbbCRxwydpFIwzOsOzXbDHsS7jf785nYHsjw/+RX
         LRVrHyROcd+jgpRuzknXPrRP4GdAoRq5RcjkZn6c4jJQtQeWJO3L1rgneJKVvZTaFHiE
         cj8MW5uFMNQjpXb9M2tV5xcpQT9ps78wf1R3z/hImw/bH6dmscqYUTt3l7A7eb7n8XR5
         AF1nsbI7ygDyam8Obp8WbqqnQi1rjY4k+0ryuvlG42z+oJO7ymKRSPD7kYYaPlKYHx5R
         KWAflkv4RNtKdQ4ZSomDnaNB6IqQ+6DXSsKgSd43wavb5j2w+GmYcED01z1xdnqEZ0Rh
         lHRA==
X-Forwarded-Encrypted: i=1; AKwUvBw9LeckgYpxoqoev0sMQY/j1ZvIHEoTjP+el5+1870yoIhBCYxeBroIRsMMOXcgFpnpcjG3JiHWWiZf7lM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UPjtr7JBiYMfJpN900hHudclMquJmqJJBJX8YkW828FBSDhD7
	Zx68fcq4zfAck8t6QHc1WptSrVu6ady1hAmoc5Gt54xzZiffWiQw50XX8AToAJ/3
X-Gm-Gg: AYBFou1RiGdCpR9jf6H+Uj/iGOVIkZjKJQYyQnh0xkhLFU415+pBELKlRiYG0J4TUxn
	8kcm1DjltMymThrHPlKMVhS3u4JwaK9baDoGptp/Js5So69y2hrR/NHBK3GRTZgxcvqM3eIUtIs
	FgdyGcmPZtP/tT5dMBTLwB791qYHqj/AZVJ48bLEJfriQWbHNCQOYJtDm9FcpnxzQSrUACvMyS5
	93eHPx98pEZ0m7WJUEPu6ODrz1YsLIexwSlb9LY8mkxCYUVGsK4PifkX69j/cTpIZAmJhCmFD9m
	0Z7Ei2JsrL5xvAmK3eFmZqj9Sbw9faaOSfOZA44nviHEYKjhyURUfbHKXjRarwhMHeLAmBRYJgh
	IDd+mvLI6yKyL0WOgu0dIboUC5afbeJ9E+9fq0WOyblS0BZ8pO3mVrsr322gYpUK4oDP/J8wIRA
	eseqWfYNPUDh78lhAWuDaAidRbzumJJaDE+VtT76Pd60Q/M5O8o4kcTHoEBHBUvBIHy0NMUWU36
	s9lF21JvYhegadmsM8AFfZHbU+iSgVZyraYutPs679qZ6AH3KB2QNkK0C6f7NBGFB+RIq0fuZV7
	hXGwIS0k/ZtJ6Gpisz+RdR0cYVNVx7ZzcD3UT45KdjB57uczuTuqJpShVZAV49Loa4cK8SaVDDE
	acibKiqHl02g8EMWQHPyU4XO9A7jmgo3IS0Z0M2m5bNw=
X-Received: by 2002:a17:903:13d0:b0:2e9:9b5b:e179 with SMTP id d9443c01a7336-2eb36504ec5mr156336915ad.50.1793781180818;
        Wed, 04 Nov 2026 00:33:00 -0800 (PST)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com. [74.125.82.172])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed08fe4fc8sm4600455ad.16.2026.11.04.00.32.59
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:32:59 -0800 (PST)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-369f33df08eso730622eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 00:32:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByVouIElQ8HROnPyTY8VaP4+ZlEu5MlpeBga0iJAPAjIIzSmKomF2RQSgoaO7IKATsM8kM3Pai5eY4El+A=@vger.kernel.org
X-Received: by 2002:a05:7301:f09:b0:35c:ba31:6fef with SMTP id
 5a478bee46e88-36a424438d2mr23103058eec.36.1793781178690; Wed, 04 Nov 2026
 00:32:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-gpio-v1-0-45e463c48728@telaak.dev>
 <20261104-sf19a2890-gpio-v1-1-45e463c48728@telaak.dev> <fc273wsjhyvtoqjnuiipramnvjvti4n26yxgvr23neuawnz2zp@krm4cfn6pfkb>
In-Reply-To: <fc273wsjhyvtoqjnuiipramnvjvti4n26yxgvr23neuawnz2zp@krm4cfn6pfkb>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 03:32:47 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ4-voYM1Uw8+0pYArJoHknyyg5CMB-mbG=qn89agxxYug@mail.gmail.com>
X-Gm-Features: AclHuK9LKKTlOPvX59pIytGyTkFgOT4Kv7Bs2y1OMNJDw7pUXgmS8KoRNSgAgSU
Message-ID: <CAPY4CJ4-voYM1Uw8+0pYArJoHknyyg5CMB-mbG=qn89agxxYug@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: Add Siflower SF19A2890 GPIO controller
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, 
	Qingfang Deng <dqfext@gmail.com>, linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> If you're a co-developer, please add your Co-developed-by: prefixed with
> a list that looks more like:
> [...]
> The above is completely unreadable.

Thanks, v2 will use Co-developed-by with the changes listed that way.

On Wed, Nov 4, 2026 at 3:12=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.org=
> wrote:
>
> On Wed, Nov 04, 2026 at 02:21:37AM -0500, Joseph Telaak via B4 Relay wrot=
e:
> > From: Chuanhong Guo <gch981213@gmail.com>
> >
> > Document the GPIO controller found on the Siflower SF19A2890 and other
> > Siflower MIPS and RISC-V SoCs.
> >
> > Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> > [jt: from Chuanhong's siflower-7.1 branch; Joseph Telaak as the binding=
's
> >  maintainer, GPL-2.0-only for the deprecated GPL-2.0 SPDX identifier,
> >  example indented by four spaces, commit message, subject]
> > Signed-off-by: Joseph Telaak <joseph@telaak.dev>
> > ---
>
> If you're a co-developer, please add your Co-developed-by: prefixed with
> a list that looks more like:
>
> [Joseph Telaak:
>   - did foo
>   - did bar]
>
> The above is completely unreadable.
>
> Thanks,
> Bartosz
>
