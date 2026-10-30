Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793345635;
	b=SR6AqQgxOrO3LhIiB8ROSu4nPaDa7c9d2MHlDn0StyYh2k2EqhoG2JjE04U9pjW54mS7
	 ohCpaAYWYCbZeW/p6kIeGT3jWTfwTQvDUTBDBEbfnDl8qRmbJC07rUVAv5SWhfDbQp2Zn
	 uIUgIhb1lq0o1pp3GHZc53k/dLLeYKfj+x//5F4ryA34O7nrMMRDyWuYj5p/+EUHfHoP3
	 XY06YBdh/glAsCDWvyl4crJIGjo0C5YTfzBaPQkvD8YdbzY2RCaaC7JwF2uKSRISUVKjd
	 OyWySy+kACrlTOJ7UpmcarNKP8C8UxFFZfo6gciyy94eV8X2/weeY61Xty+kNkbIWLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793345635;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BzMDdqDEf2PfGSyV10n+owoiqld++wyRkAWFeDnOkAA=;
	b=5tpkCmSNr9/KWkY0olW1ua7oP39f00QM4kJH9WpiXzQO6O4/5vIrNd6Lol7G7uYH2Des
	 BUj9op4EV057191yHKqh0IZOkxWam6BKmG7NFr5/4HxqHrkhZENjuQtnfIDkFayArIFJb
	 qxtRzQCXxWo9o5My8+bJqfl0S4Cu5DKkK4YYBY77p70WCwSsT5w7PVmiBcokemmemDK2t
	 yt+0xP7ruENK12B/O4X1GyBnChXRgWTXmuY7PGyhi81YbymRml6rmEY7YMg8MNclla+OW
	 9tzyVSdY0Rih03QckpqdcozxkCQuBj1yXyFNiBm5FeKgfiFbkzcmZDqh68gSH5hFE1w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=IZraQTfG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97816606A334
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:33:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97816606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=IZraQTfG
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c418e215671so40861266b.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 00:33:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793345633; cv=none;
        d=google.com; s=arc-20260327;
        b=jySu8KWOOY156X6mcWr/kOySQopZ2QNychu3cIBZk4by1+zYaXylLEIjLu8rAXKyh1
         kyJAzTTZ+GGiLmjo+VHTpvlZlEBBdNnBFgsBBFInFOPk87RJteuEugBOaw72mLW7W0Dp
         Vch4AC2oMOfBVO4CCF3rXXmJrHf5m2jgTqquH+eI5b57YKCvHYbTelF+njyWyDsLuHQu
         43CQljiZ1njgU3CT7IqdYXk9HhFz8548iI3Eonmk3Z3+Qqy9CVOMWaZY+Z8prZXPHd58
         MqNBdy/PLnSaBGoyToOHmbTJvfVCSDhAZic2DDnuNfC9lxj0C4mYEnkiESBxHqAN1m4g
         o1ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BzMDdqDEf2PfGSyV10n+owoiqld++wyRkAWFeDnOkAA=;
        fh=k0zFdNlcQTwEpb/8iNuzLlxrBeTWZIxLgFwVzqHizNw=;
        b=S7AJXJMxG9+FbQrh3nbBkVZe9FkpncAiqLSSH+v4R397vak3GkgVBHjbudUvO/IPUh
         qv+40wdClZsyzeKuXNzMLnNk1vj+EoIoHphEsUUTElQkPRfBFAr7xOpbv7USeCg21dQ2
         AovDb8TnXTZxQkEML/ZrnV+lj7K7UQ/8GSekKGhy7bD8DpaQXkvcwuc6PYnEJrqrouuv
         3jnMBHqG0v4/WgTFqMBtN5NSs/bkFR3DA936atFKdoq9OQ5ZWai1Q2B27h4CfNtgTH9A
         kLd2kvHOT2B7vn7Dh9aOQLwSHkOaNP1g+ThZK3FfSqls4kSYJSrLO5/DWEzfmQ1eDVs7
         iVUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1793345633; x=1793950433; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BzMDdqDEf2PfGSyV10n+owoiqld++wyRkAWFeDnOkAA=;
        b=IZraQTfG+tDFd0+TYJNCsWuzg1Me+7gmHeIIcFBwZqtfpjJHI/NKwd/jkwpA6K7HfO
         7QFFf3AMazDYe88UeylCuRjtgIHgUe+Hv0gEoQd+qaqxwiWslcihgWMi8SX9bQiJgtfK
         oN0+0bJg+nSSS8xlNghZeod8htskZjRwDTHpH8IlI/AQC1pC1BNKDSqZ4Jwd0Vd/9GGk
         N4scwS9mMwNnr1evT+b8D2OLFw13iVj3ZUJXAh23zhr3JE5FM7ZHLHplgNVID8M8YmXe
         35HVKCWh5NMZQBa8jD0dsRwikYtERhhoywlq2SeEMhRZt7widTWqY3+fjrmYzeRdq4tY
         rw2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793345633; x=1793950433;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BzMDdqDEf2PfGSyV10n+owoiqld++wyRkAWFeDnOkAA=;
        b=TO4/EW0nKu6mEiYw9+ArWqJbo8rxnGfA1bn3BjdT1s9zCC+kXLt5+p0TsmuC2rpk2B
         a7CNqH81NvQ1E8ARlUXaK+dBU+0S8ZIhtdk8FMb0UG0N8DF9uMP48KqbZDEF4nznxg8l
         6AFTTuTGKbJJXUxbwcR5m6rLPgeN9BBO8c8CYcbABuqOQeOgDC0GTC9evGwSaw/hyYMt
         k5NpZFcXRzuzpxk3HB/lp1w7Xm1T96QfBDnJx7ygGUmT85IuyY8nbm/xJ8b7LJdsIOFz
         N0jVTPcXoCMTINGKm6/QyNEYABc4CZfJAHGte+2Kxwlb8eDsAP1GW/2iT9MtlMUpfBUu
         qTjg==
X-Forwarded-Encrypted: i=1; AKwUvByqMDdflaPGEK07NOqz24Ws0edYvL3XVNkqJdENff7odBugldPxrsMd9vCf+Nl/m9fTEWinGZ8dC+OasXM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/G0jj/+Y7EDwafjTNxRbUJpH2f1pqn4Ti2KQ3BlMulxPiypsD
	b7Q4tSS1Ec9fxk5vOJh9KiZTeSpl/f9xQwDNPez5ceotME3YNTS7GDeirU8yoLSGvAe2HN6Jo5m
	PGkj1reCoMjTqFa3jwzfzFo6OH1P7FPGAXNUNTzFQrztYebvByTE0h80=
X-Gm-Gg: AYBFou0hQkJRh/+EOgPZOqvtw6zemGrtd0rzPKcjxYISgvCnTw9c5a2Ra+9TXdDh4RF
	negg16qQv6rlfytg4TPWY4QWL48WKKTRwhWqZUUToHfaqh5ICGfeStRcCNOPIVvSwgpUa+jPkkS
	KAtpk3TpaMjScf7CCnVvfkuRc1eudegk8Hz4mLGRRVez/zdA8KmWuBA0f40oL5HPS52NLnkA0l5
	TUhabb6tv3DFZaG6D2aDUQmPfnJMni1PwEZglpW08zohixeoPIEzrF6+ig6Sn/YadpR6nSspzxK
	d79RE2Eo/ABd6FJusvQc73I7wMutmM3TcEs4RwACQkiPA8IEMyLE0/kxoidNodMD6bRtIrkpVFc
	HFEthC/p+HgeR0S53ubNkoAAL0E322NugNXUZBlDbV44q9hxQgcSNAy33KZnvUt6dQw==
X-Received: by 2002:a17:907:9c06:b0:c42:24ea:3220 with SMTP id
 a640c23a62f3a-c4ca7ab31cdmr117578766b.31.1793345632990; Fri, 30 Oct 2026
 00:33:52 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261013130052.3012773-1-max.kellermann@ionos.com> <CAP-5=fVPtjkxcjEkR9r6QZGsoKe=_rZssjZp1FcJ7rCgntpPng@mail.gmail.com>
In-Reply-To: <CAP-5=fVPtjkxcjEkR9r6QZGsoKe=_rZssjZp1FcJ7rCgntpPng@mail.gmail.com>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Fri, 30 Oct 2026 08:33:40 +0100
X-Gm-Features: AclHuK995b-JOK6lyN0BDphySp3adp3n0FavtFVMGG8FAoFOKg5oQqb1-bZD7YI
Message-ID: <CAKPOu+_C4H4w00762045owSGq2ExSec0da-NU3ZVW_aXC2fvOg@mail.gmail.com>
Subject: Re: [PATCH] perf: skip unnecessary userspace map synthesis
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 3:29=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
> Thanks for the contribution! I can see if there's a user event then
> evlist__needs_user_mmaps will return true, otherwise we'll return
> false if there's a kernel event but true if the list is empty or just
> contains dummy events. Why do the empty list and dummy case need the
> user mmap events?

I checked it again (and got confused a bit more than I should). Is the
empty list really possible? If no event is specified, "cycles" is the
implicit default in both tools.

With "perf -e dummy", the kernel emits user mmap records even with
"exclude_user", so this would be a possibly user-visible change.  Do
you want me to remove the "dummy" check, or do you want me to add a
comment explaining this?  Or is it possible to check whether a dummy
event is guaranteed to never require user mmaps?

--
Max Kellermann
Principal Architect
Hosting Technology

cm4all | Im Mediapark 6a | 50670 K=C3=B6ln | Germany
General information about the company can be found here:
https://www.cm4all.com/impressum
A member of the IONOS Group
