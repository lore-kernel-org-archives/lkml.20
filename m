Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794332553;
	b=KWFEPBFw2hbmZ4OnWaWLQIVtDDYENuPR0kh27ZOKW+KzUgQA/91Qfz03bajLGLWc9YqU
	 q7Wqs7m9bniNa5l0bk8IfssOmOiAu5Vfa72YHgacGmM6PHPHQ4qa5Sxn0E2TEGORfLP8A
	 jnsKLS8Ou3xBUN9U673Esk0D/7CMCVP54pyPWQ76hfM/HcyYXVhT7AChsuP8bIkAxUzWb
	 qM2JU8C5xw4aMAtjXLqZ2MnE8Pja2LbE2n3AFduUvJCoaBXx+3xNS4ooCIekciXnE5h2m
	 K6pkxAyUFocNC8rv/uDtWJXWwz6Hg9zEJU6J4WLxnp6HI59aeGHYqh6wGEeWR+ErXxA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332553;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Km/1n1LHhDr02ASZV9qn8VhaPAsioBtH6JYVLmDFnWQ=;
	b=Zg4nxGQK1HG5dps3twUW+rImjiSj2pWJFJgqQOiauyXiLYK58zYM0SAnzLHupx7V7deV
	 53iRjOz/8iLyo8PyWUQcjWrb47jS6GdAwHTpE0YN4kTfyTBRffsjbA/nvDMtT+RGhNT3j
	 4T5Q3Pw6TTCo7mLsQtF673jfKNTxO5lX/9tHL0D/9S1UUSW0yW7Uc8OEIv3lPaztUHT/J
	 dgDSsISG0KtXm57XkifGfpDs7QFldyhwnea9w19wbD8oTUL97ZiQPYy2a3QGpgT8/C8pS
	 UCKI+BCBCaGbVN91LOcNNIX7hfoRY6ZsL2a2UWh9ww+4IVyG22LIfNMzXewmyl/4Mjw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0q2clSQd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59134606A332
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:42:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59134606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0q2clSQd
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3adef977ad9so17180921fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:42:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794332551; cv=none;
        d=google.com; s=arc-20260327;
        b=nVNrBObThwcwUe8NO9yrdo9mIZykc8NQ+LDYAt/ZmwoKR5iRs2VW+v2K6v+gJXUn9y
         RZUsHpjCERuhdFXTWvCMrJUEs+OQrvca+XJDnicXnDV/KLZTFy3QEAYuvcu9geFseBgH
         1l/8D4YnIah4IMnV6B7zP+yoPmTygm4Q3gPTY/RhUsPXm4o4ajTDcilLcTE3/NBPnL7i
         U6C2HhFPt57qwFQbfDxupzqUF1gf1G9AjNMqwQPP07NjnjvNOPtihRJgLATZn5oJWldu
         htBxG0+ErqF9hoRlfYUIq66Ujddh9HnXD4teS8WwONNcfOalr8phikkZmQaglAYIPMPz
         A74Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Km/1n1LHhDr02ASZV9qn8VhaPAsioBtH6JYVLmDFnWQ=;
        fh=KkVSKqeT3qUpERDVm8brl/6OduME81qJovVrXYEMVHg=;
        b=QmFjsJz1pGY+5kS+UYekTnNKQihWlHvrTgpkFFhiP+1UM/AlKjPK9EcW8x1s/2OeJc
         6WK3hpVf2Jf4LR3T2BXKUCJtGsGg+FKNvVKcbHe8cFC9PP19+j1E1wwQaw1yRkTrwgTx
         UJbzstdwmKbgmYv61BJR47BfSu7/pkcBYRG9SNCeNDuWsVehWkOHt75mD4F6SRyebDFx
         9BrprhJVT2EfGI4qXP9ef1UrQD8XO/BcTEWrKSIDUWIDrWsd22KnkqmLocrb/DrEiFwZ
         FMNPI0ZFyZAGWEYxqQiP3wry8y53i2GhUmzkV7IW7FeKyFLHT8jTj7aQ671Qk5AG+xEF
         MoMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794332551; x=1794937351; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Km/1n1LHhDr02ASZV9qn8VhaPAsioBtH6JYVLmDFnWQ=;
        b=0q2clSQdX8ZXdvOcyhWvyl/+Un60UOtu/PtASKo56ajfRYY8xmcCJvg6WNROL4CaLs
         dDO/+lMfgpxXYDzA8GBzWbYK79Oyj8Vb7QKai84sHrGnSHLQieMceEt0W6ca7Mkp1tWn
         zv0/wfqNjy9P5E4VKZKw2tkTXjH8NqnF0WTxIggVR3aq6+O6Y+GGpsgoDxf+cd8Pa636
         aV5mFJ0Vxrwy8wAq4mk3bnmnAsRmOeVUl4HHkpmBHstOLd3jTqEp/3OiyYdKT+IdCIV2
         US0/j9nih6jcmku34qzV0BQFVcLnjqr4AE7g1FX5A94s+i8tkEaexwmQDiK20U8VFdyq
         Kjag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794332551; x=1794937351;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Km/1n1LHhDr02ASZV9qn8VhaPAsioBtH6JYVLmDFnWQ=;
        b=BRps8B7z4pGzOTt0yZHWNS7QqZEoHdOXt9jhfDTl8pXQOMqVHM2s1I9Mt0AX5G00Yg
         LQpsGWta4+4dIS9NrztzXVpAc4F6X6Fx1AnS8a9ElTBOUKHQhMPO2a7phmlJoqvLLMzC
         JE7a1muIlJehg/G3RpSUP0GSK/QnYdF+OFUcfwAaBnz8ZDOxb+QQkQqWc6KbavmfKe8/
         tTMJv4pgI7EtQ72frVcgjiDgFY4iVDO0F45RUwGIJU3KpTxKk0xVKafkgOR0STG/QO7v
         WeJYjjU3/YueZt8+AiMbUTEQN3sdQsFe+idvXOhw8WuIqGnt7XWQWLt3h8ZwsK9rNeAA
         7iwQ==
X-Forwarded-Encrypted: i=1; AL+hErE/xeBSUAhn4d5kH5FZEYk9bc0UTH+IFQ4FtTV6DqDGjxYjeaWEiU/L5mT0o15jxjCIy1ONMyYj1e7Vk9U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8faMUn7NGyhbN7ohf+jhxQc8UJf+ceRDFaekJ1bYTclQrOUl+z
	r6og2zgusHUEh8sveJx1s0oavjL1Sw3erzclF+uSXFDTFh7gAJMOU4BwgOt+3OV7a6gnNjjDglN
	xLFZ6/KBiOlkSd8O/vvoOp9ho5LdODSI=
X-Gm-Gg: AYBFou0Akn+uOtvDPhbmllCj7kyIvDZQzDxMr3zrhA5o/t80DC+m4+MG80twFqJtckh
	JpJQrlbM2E1vivmnpbi5niA9S8ucsbVBAT2QE9acSKAXy2oyl7ajPqMXBCPKW8x2LTIXNZI27jI
	x+vukqDZITgksfp71JgrpInj9CjqnIpIxrPJa0yz+HPeE3sPhrrrVYgUNRnrp3qmZOiINMY9j8a
	8WpDzXLPZX/N3Cy3CIdqG5nlSBSvT5Py90IwydSrnW/T/+yR9WRs3RLUZPSyX16ITJ55w9SJvK4
	0RIGMrs4ADmIdYK31L14/DqRVWaqXLDDnXzqdRdJZfiIYtePfe6Zprde27+Spm0ThWjH7TrbdZ3
	gPOLkzZnkogRBMclgpqlBbo9FPtieS5TDot3vO+7sbwqkn9kL2yWWkphvOR9y+T3ImoC8Z84tO7
	k2IbjqYkPyQ+AX7gr1D+TNWRmHYZEb6Pbtdwgiiqk2Ag+V44pRihe6
X-Received: by 2002:a2e:a5c8:0:b0:3ac:e4b6:b93d with SMTP id
 38308e7fff4ca-3ae0960e26amr7913321fa.8.1794332551177; Tue, 10 Nov 2026
 09:42:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110054836.1515030-1-senozhatsky@chromium.org> <20261110054836.1515030-8-senozhatsky@chromium.org>
In-Reply-To: <20261110054836.1515030-8-senozhatsky@chromium.org>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 10 Nov 2026 10:42:18 -0700
X-Gm-Features: AclHuK_zSUkyB2sjWErWCiaaONj2fSjizGjk85ueR6Sb_actx7ETkPPr0xK7p08
Message-ID: <CAKEwX=OtCcMak2gshXXDpiXiVK7v0H+gXQpQ-4D4BNvWSbvWHQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/11] zswap: do not free the entry if its pool is NULL
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, Brian Geffon <bgeffon@google.com>, 
	Minchan Kim <minchan@kernel.org>, Richard Chang <richardycc@google.com>, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-mm@kvack.org, 
	Yosry Ahmed <yosry@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 10:49=E2=80=AFPM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> zswap_entry_free() warns if the entry has no pool (which should never
> happen), skips zs_free() and then frees the entry.  A subsequent patch
> embeds zsmalloc handle into zswap_entry, so zsmalloc object will point
> to the entry, and we cannot free the entry while the object is still
> there.
>
> Bail out early and leak the entry, its cgroup charge and stats instead.
>
> Suggested-by: Yosry Ahmed <yosry@kernel.org>
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>

Acked-by: Nhat Pham <nphamcs@gmail.com>
