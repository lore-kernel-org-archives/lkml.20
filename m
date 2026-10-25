Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792922758;
	b=GNpj81i0Tm7nyYkoJSBb/1XtDUwDnsY9ACrEU2ddozu6KjCF2GFqOWxbX95QDQwxKUPG
	 2X1oy76mKL42PbV8EDH15od/TtXT0Snns6vCCWVr3y3V4JDQc3M4qHT0Y0kwcUL5B/r0t
	 GzyWxjGwXbHA5s8ihzUigguDqN+cmW1qBAa+y3LH6euZJTfhPMiCLv9Jpl7k0WwG1cgsl
	 Xz521fugjeleQHIGSlZFv+lPjXZgAUUoLkGCbEsOm/LdDn3Lq3/R49whKPWkXKQfbhnGJ
	 3jMbS1knNw1serZD/ME+9DQYceFItveXrQvEZufaPSzojwVgw6t5FAe4PZL5j16C6LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792922758;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=W7gJTuVi9tDXgHlyaf5e6Te/gAcfSr0TPEgIwLiJCcU=;
	b=Sa5hkomtFFlVc7ItZJkw36LfxAXR7cCXkLFSYDCCGv1blLsx2nQ75eap8Q08JfQ+A4zd
	 lQ9z6NDoUZ5WVtM89jniYSSfAHvwuiS726w8k8WuSWoiUhRHkc5U+R6H3GmaQV5pR2zI4
	 PtIphBZvXWEuG5XaEcQnvVkLjIkgAaE+C8vcrT/+gSu+xs/YEZ7H3qFe26sS2eDP8DFWw
	 PNccbg5rnX+xME3XxveRURVjLTUHoZ2KBRVlB6xRnnil4tpTKdBma1+neaKRORXjiDk/S
	 8R5yB+yn4x0I/BUnje5nSibA1XaK6oTyJEgbJpeFIuREfNapBDyO5XKxwnP09ntfVww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g9JNF4nw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EF9606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 10:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g9JNF4nw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90D7D1F01829
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 10:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792922757;
	bh=W7gJTuVi9tDXgHlyaf5e6Te/gAcfSr0TPEgIwLiJCcU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=g9JNF4nwhyjZEs/ZmRDaoMhjB0L73RSQupVBm5JRTYeoBrJv0gN7l+AJKK5JzrreO
	 DFWfEJdJP3h2ysBnfN9qCKn37wITJF0Dt92aWPzo/uug3aUd/nX+jKQ3rVOsmEj1zE
	 KI6GS3VtLtlnLUkmoNrs22U0WLxUR7YvWdPj6pJdEqsWTHIiE1Rr4Z7BfFaKpCoYoa
	 UKkqCjf35AUpWlkaseQGXSrENUrbXG+Thu2FLQPVKSKya4Q4UnWP48NWfIElqMOq4e
	 G1qu0s+OaWBK274L/Ehzd/nwg/WWf36lzoOd5siZVSCEkW1ge6jFYiWZ3X7gmo96iq
	 3CJdBb3LHHp7Q==
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93f3c616c84so177255285a.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:05:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByhMjR7wobFiyGry6LCyYqzzdizkXnmutLLFGirGUcSA238QPUAzLm1EBNVyO/eHuwtkWRB3POcGY1A9dE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIN+gIbex8tkLVQIwzPKQ1tytjiMn14LG+ESJijspyrx7FDVzI
	mF6LLwBjStxXynHYNKstPD0fpFKiyxrNfKj7KBKvYLj38ok49PzKWkVJLRwxJ/JScTYEAauxUIa
	tUrQZ96xuq8iFYfdzb9B3uA1hTXssIBw=
X-Received: by 2002:a05:620a:261e:b0:93f:24e6:403e with SMTP id
 af79cd13be357-940ef98287dmr493200085a.54.1792922756979; Sun, 25 Oct 2026
 03:05:56 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025021839.1542805-1-senozhatsky@chromium.org> <20261025021839.1542805-2-senozhatsky@chromium.org>
In-Reply-To: <20261025021839.1542805-2-senozhatsky@chromium.org>
From: Barry Song <baohua@kernel.org>
Date: Sun, 25 Oct 2026 18:05:46 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4wBz8SHAy_nmv8w1UX7yX_yqhp_ShnNNJ+Ek82S3ZvYzw@mail.gmail.com>
X-Gm-Features: AclHuK9dW6R5A382Z6S5kYHE3k5MMyEbL-uFyfOty30ebho3VuUUWRklFvN0H7Y
Message-ID: <CAGsJ_4wBz8SHAy_nmv8w1UX7yX_yqhp_ShnNNJ+Ek82S3ZvYzw@mail.gmail.com>
Subject: Re: [PATCH v7 01/15] zram: prefix backends printk-s
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Brian Geffon <bgeffon@google.com>, 
	Bo Zhang <zhangbo0325@gmail.com>, Minchan Kim <minchan@kernel.org>, 
	Richard Chang <richardycc@google.com>, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 25, 2026 at 10:18=E2=80=AFAM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> Currently, zram backends prefix printk-s with their names, which may
> look a little confusing, e.g. "zstd: alloc size 408128".  Prefix
> backend names with "zram:" so it's clear that the message is coming
> from a zram backend.
>
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---

Reviewed-by: Barry Song <baohua@kernel.org>
