Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793367187;
	b=mQXyx0URdUMN6DiuoovsBblyg3U7kJxMvt/3dsktVjS5fTuXfplv7p1M0JJmgwlPkgCi
	 d60yATyzDyzs+gjjv2VOKh0WFqXCfIb1U8qh/aB5vysbCdi9eIpCPhY+NhIw9PDTCDwOB
	 S3idBem+QaZMozQlTfyfvmlrK3LFUqy0XFPeHHJdKlyRHWmFBOatEtZnFMhAvspRFaVSW
	 B3GIGZNnKMi6KAHxL+i0cOuJs1B64xZZb9lpx8C2a/LQMBPxX7kgNl4t4B0jCEmiU/LNL
	 RglcAlb78dy9RMl49PsExki9yMQ7MHl6m2PEjD5T/Ot2Uf8y3a8+yyJL45V18yaFxFQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793367187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Ap8AI3OLMnsIvB+7PuWaSwO39DciT3p1bcrU5DUdTaA=;
	b=0VGfwqf5nOg43/7hsGvlEllVsS513bKV5hA8u6yuVVeRSCsTpIAYYHiqUtxOPKroR7Q5
	 DI+oUsww2tjjnBYs33p4ZrvXyP6HOq94qmAE+/7eWOPm/e4pu8NqzywQ3sylsErtPiSt8
	 dzmQzZ+8pSp4+ti5H5xWbHKex9bE4go64DxyKbd4ssnkFmtFwcFDOvNkOZ2ujpJPcrgZ7
	 GZTHfyQRnucvzl5MzvLKQMGJ7lxykj2ZQV57dJzBT+n9UwJKKPp4hQeKNZjNJPAQM7hGt
	 0UTAbt7oQCmmnrakMny9TEVpDzS6RS8BmSBznDEzUhUz8ettm5ayS2PHDO4nQKxye7w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uber.com;
	spf=fail smtp.mailfrom=uber.com;
	dkim=pass header.d=uber.com header.i=@uber.com header.a=rsa-sha256 header.s=google header.b=h6tDS7Vd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.53
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66BB606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:33:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C66BB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=uber.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=uber.com header.i=@uber.com header.a=rsa-sha256 header.s=google header.b=h6tDS7Vd
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-6798d4ab549so625698d50.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:33:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793367186; cv=none;
        d=google.com; s=arc-20260327;
        b=Bsfakdp3CMSDtc2tu5t9vXgjQaloesJg4mnvjDeVNSYl68HIQqZ2YcRf1GiDxcdPQL
         lJdLBsxZ7hoWboiV7q4NUptjOnwp4WvGd88DHMd7c3Eeu0ybKlil7IkVr/nsfXI+st1O
         IREENQ12NyZ5rzRq7WrjwOaYu6bIZEcECkt7JomvvAfL5MDG1FeZh2gct4AKozmuGdsp
         gejupvfi4iB61L+RlJfwpu9azQTgxduSjvh3z9R3jV4spdf//Fj83sifWaS/qEkTYlxW
         KI+t2MGkWyzsNp39XIMUQQt06tEkju4gajomA5+ctWqO/r+JAEuruIonSvHQraCq5Em2
         yVKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ap8AI3OLMnsIvB+7PuWaSwO39DciT3p1bcrU5DUdTaA=;
        fh=J7VzaDJCYspPjoLrRwuUdP2C5qiHqeJyzwtCIpb6B/c=;
        b=dSvPXag40uEluvUdOFvZFpdEIZVSpXaDAd29aeWeXrV+OifK5HcK2gz7D16Yp3v5nz
         DoOBRmGxFoJqehB07K1vFg1C7znby81mvv/4CbOrbwRPYoLv7KJbRJkanUsMUuPM85Jq
         XWcWFwAJCOMbRmfavH/R1mGwyPtiH3bQ7af8W6d7q/NT8X4dKLZqe1MXgBpn12vWAzRx
         V8gWtx4+aucOWyHRPLxlf2ccsiLKEPLKUBHGsOZuOzCoK2gNtCOjJc7l4oRfd9/eybku
         raJpLjRnKTlIraOFOh6+mKaQCq7VSVmzPtkIt6tb7xbZYJvMemZ264D4lTF2Nz4JTl1u
         ryZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uber.com; s=google; t=1793367186; x=1793971986; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ap8AI3OLMnsIvB+7PuWaSwO39DciT3p1bcrU5DUdTaA=;
        b=h6tDS7VdCT76/QSDtQrX2psEF3ssu/eN98XkJvjqRHqMa8UHzK5jPQBgbQk10A34Ez
         XzCjINdCtMn1PaKRCo/c6G3XuNzWyBzh9QETypw15kSNp8ULjNR5luxrfdT8ef3YHmgM
         8I6DbaZm07fAbhphqDU1yE7ml+BcOWvnTwHsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793367186; x=1793971986;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ap8AI3OLMnsIvB+7PuWaSwO39DciT3p1bcrU5DUdTaA=;
        b=UfexxjvYXlYI2mWTBEH1vE3uwYzH7u4ZBu4UVgfP2EbYLDXALxLKijsvW4zfHpDZ6R
         QbW72R6obBCIzu0DzMwzb5JUVdbxup/kDizFmIUVQFOd0Neu/ODmoSf3TaMZCd1aq7+L
         7hyy17VS3+z/NGNIVWyBPOPUSy/pDfJbXAwGPMyHOb3YcK4/zhI71VYN6/LolOzBhgdT
         MZvhLTYg/QWnVo0eLFsatkm0wt3eGMFLhQeDflQpiuVhh9EE4K7Hs/WJ7KuV/9Y5p3lc
         8y0XMoeL7+5G3dNvfQ+Ohq8LCm7hGqXs88LD4nVlFom8d/bwdXCUMvcr5bm2uIN0EZvR
         pc8w==
X-Forwarded-Encrypted: i=1; AKwUvBwiLWRrCijADoIY6ZE00Cm6kwkZzldtK5zSjQbrQUtrxTS1NHeK7PIp/P3C12QzFhyCHuR8o1mHll4zXfk=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5NU1oCfWl+fxmNQwDMs96evC4+rghexovxbYtWCljqz40rArc
	odwyQLPnaHsRDIusJlZc0GuNQq6Pl95n8tETciP7EXe6m3QtikYEDutQJXHc3H35hcuvrhKiUUO
	rf+0jG8FNeVrVK6lvPtgGyExz7RI2hu6JVCQXK05vhw==
X-Gm-Gg: AYBFou073yfvCGMPRqiYQQX4NABO0xR+quL38oqvDytHdBcnSp7I0rEa7YT+b8dLOp1
	8fbWr35rsUIw3/Z0dGnH3lT0nHhTXlT+sEUjxTi2o+NPzf2Gud5M5a5TfBKEYW0YeI+yNk9rjUo
	xk0fXAiMm/o3fZ6tlgEMB6nOFZmhouQT9qN+BCVDGN0ttqBfOGvq1+j5yg+QJ7k3Kt0zYeSNRTW
	flEvsVuh/cCKe1kkdA4LavHvB6WqupdZe71BeqY6GgwR/pWvx17cN9JOB2yPye0HHPU5mTbvX6y
	4A8rk5k0W1gfGIJQvztykafi/7hia4W5GJkLej9c1r2gBvMKe1FXRiZ5JGXka/2mDbNftKfKtXs
	db4Dz5N3lGf/U717gL7tmzCqBdesokPeHU54HxSZ4NbhgQU5fmEYNONxwdtaraAq46KvrUPs=
X-Received: by 2002:a53:b449:0:b0:679:b87d:6f7b with SMTP id
 956f58d0204a3-67ba4ff3ceemr1245948d50.42.1793367185430; Fri, 30 Oct 2026
 06:33:05 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260928075237.3055101-1-irogers@google.com> <20261027231513.816148-1-irogers@google.com>
 <20261027231513.816148-12-irogers@google.com>
In-Reply-To: <20261027231513.816148-12-irogers@google.com>
From: Alireza Haghdoost <haghdoost@uber.com>
Date: Fri, 30 Oct 2026 06:32:49 -0700
X-Gm-Features: AclHuK_wMQft7avMWp54-lWi0ChX2zhzv9PYbZe6NUCsPJGn_IUKnWG9vDQbSXY
Message-ID: <CA+w=M=TRN8SeNPQFpK5uJNMFidebSPtRRe7C0TrECUZKsRSTZw@mail.gmail.com>
Subject: Re: [PATCH v2 11/18] perf symbol-elf: Cache ELF program/section
 headers and defer symbol name lookup
To: Ian Rogers <irogers@google.com>
Cc: acme@kernel.org, namhyung@kernel.org, adrian.hunter@intel.com, 
	james.clark@linaro.org, jolsa@kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 27, 2026 at 4:15 PM Ian Rogers <irogers@google.com> wrote:
> + /*
> + * For misannotated, zeroed, ASM function sizes.
> + */
> + if (nr > 0) {
> + struct kmap *kmap = dso__kernel(dso) ? map__kmap(map) : NULL;
> + struct maps *kmaps = kmap ? map__kmaps(map) : NULL;
> +
> + symbols__fixup_end(dso__symbols(dso), false);
> + symbols__fixup_duplicate(dso__symbols(dso));

Could the change to run these fixups once per load be split into its
own patch, with an explanation and a test? It changes symbol
resolution, not only the amount of work.

Before this change, a zero-size .symtab symbol ended at the next
.symtab symbol, so it could cover a function that only exists in
.dynsym. Running the fixups after both tables have loaded instead ends
it at the next symbol from either table.

I reproduced this with a small library where zfun has no .size. The
next function in address order is efun, which I removed from .symtab
with objcopy --strip-symbol=efun but left exported in .dynsym. The
same sample is then attributed differently:

before: 99.97% libz.so [.] zfun
after: 99.97% libz.so [.] efun

The new answer looks right to me. Minidebuginfo, where exports may
exist only in .dynsym, should hit the same pattern and would be useful
test coverage for the separate patch.

Thanks,
Alireza
