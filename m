Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794332460;
	b=T44gJq8b9s61M9kNo/NGuVWJxhhAIWPNeKlE146xro8CjWfzN4Nb9aokmJzCMbl9CWYk
	 Xv9QRMXR6NcEl+g0N2AjVGrFE5tGTO3lrKCbWFo2RWjmwe84EkvxGfwO+oYPh8wlzihLN
	 LA1fM94XWdvdFk0WmENBNUVVifkS1C7typ80rXAD9vOpupdMCi6EKGmHi98h92fVNW3Rt
	 ZGsqTNLrKtJDMrGD+BVJCeQF9ibRA3pzdvrXH+HsL9wlc+T2Ijty0QOdmHDusCbwELZ/5
	 gntSTiccLFh4WcCfEtXfDi7tESEIkrMOeouZwX8QhZNkXcM0jfOKhgK0z0OBweE9SMQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QgcKWslE/fvIIVroU82DW+IQYjBmplAQL93Fdoq2p50=;
	b=KfIo+9xk3AS+KYyYxJOCoD3Ebv8NsL4oCLxsh/KZ4UiH/agSRSy+zudkvorQ+df+ckwR
	 qBhpRxqszupakvzgRnaVO5H4MyQly/u6y4JupU2BSRN49wf0nB0rxIIz9sE90kMXZV5nc
	 /61pZ0j2PfhskqwiiL9zKr9dvKhGernMdT3i56iuWeP1XQPnqV/Ite568cw949StScd3v
	 WUJwTqo9+TJ4Ll4w14t+sf2LdErQhZ5YFZ9RMyPA8m+JKM0XS2YrKsmocGoCs9AWk3unT
	 dMcpeHq4mBeIQWwFhm1C1l1x3MoN54rzSvw/fz7V0Mvk0GqZE5tE+sZ3YCuib8HVDPQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OwV8IN18;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8102606A32D
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:40:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8102606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OwV8IN18
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5c14f3dab0cso1756344e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:40:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794332458; cv=none;
        d=google.com; s=arc-20260327;
        b=T5akactMHku5JeT4GUpYNYo7eLnm1KWgoZjfFzq44sLE/TMIC9omrpagI8/SXp700N
         GjPf6cXpwOo3DQDKb6C7eRYVMgJEIDtHtCTF2Twe8snjBpbp7PPIbSrb4Ff6EI9gZI84
         GBIDucupbojkkGswda1XLKZ2Oabdc01j1VfQjdcxks53nU4GCZJAXA+xGapRpC5JqMQl
         8+broFw32dVvbhbHBbmiAGY4k4Ew2ibIcnl1N/+/4oQTcrUXSeGP7s9L8hC12M5qFmMB
         l0STcXDuMOOBdY95wg5804R550BGW/8zx4UBALizPyMMHyOtQDOqRv/MOfYbTtA+LEHZ
         hn7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QgcKWslE/fvIIVroU82DW+IQYjBmplAQL93Fdoq2p50=;
        fh=ZJ6NUahn58eGSCwdt0kmPIiR9FmyXr1pb4FQqUKl0Rc=;
        b=Pp41EjOqZRHODG0HGCTm0UVj/L6xidjkD22KMweN+cRiobI5YDSn9ML0dkPEp1UoDV
         HKL6azyJJWqW2+kFzuQiKPqyoQ9MHbABn1G2OYWznV2votQgPOwoKwYD/5VN1IpveRrD
         hWqSjz2JepbujALelC/476oL28QgVoq0d9x0zng6NvJJV7h/LlkZAxpluxL55k1zQbNb
         2t+NfQ8+RnX+sChHW4rcvh+Bjfs76J3hZGNVdz+qne6iCMhEnnlL0NM/Dh4JLXCLJTES
         6r7UPhjHfd22Jmddb/LpkTGNE4mLQhRHXJnS2TYLxwyYzt+qS/es1oz1oHyYHvnO/j7q
         Pzfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794332458; x=1794937258; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QgcKWslE/fvIIVroU82DW+IQYjBmplAQL93Fdoq2p50=;
        b=OwV8IN18ChH9GSyAvCZytPW9z+0QGo+xoXMH/dcrIGwjwXuydP4VNR1ynqT3YWa8sQ
         tTXOrS0CkkFj/bTEWiZqqKnN920fD1pjkYuTaNVmc83vUWHAdTC0fUC3Ki6Ir69HhzRA
         61dvfN21vPzpv0DwVrmkai/NOcSpwr2lJR7y+YHvlpahCSjpxh7VRHrWr4LF8hb4eCCv
         WyyH0v91Eiioy5v6Ox7ph3wcO3OX+ZQjsvUyH+tA/gkVOh97WvKfjUTN1cozhH0fYD5/
         F7KSuv+XQBNYtskZwwH/zbeNvymdKva031bKsXwIRrNatOqW/jYCORQ613WRx7xWxhRg
         ZSQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794332458; x=1794937258;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QgcKWslE/fvIIVroU82DW+IQYjBmplAQL93Fdoq2p50=;
        b=RZWk5YyS6WvQP/obUTHY8rDozkYLRgswVUC5wc0YWGJQr49q7AzwsMHVXrGIbCfwuG
         I2OBgTPdxmmKI52os4FhVlM2ti47rvH1tN2cZu9mjK10WE7kcyDelhq4g3/rnwnI2Scc
         ASbW7zn7F7IsIb5xXh0pMTzcA3zRBMF2t3457M+JUzIdi2IoZDU08O70hcTqlXa8Wy5t
         98GZFXn7qmnQm/Lgz3HRUhZEB5dQlZ8CUN788YPOFOyRqFlajynfv+Y5B2SBRpVImv4b
         l8sBbjJ26DNIF9S9Dya+2Rv+BZ0JzWGqkVHLiuq/57RIMDbX5FO6sOWHNJZxvE/43S0v
         6b2g==
X-Forwarded-Encrypted: i=1; AL+hErFPoesQ3IMEea+tJmOHp2p597WWBjDK0Tg3vIGMIveqquDmNm3p8fyEUoOhaep8dwfXub8tgEwONHG1+NY=@vger.kernel.org
X-Gm-Message-State: APuU4Z82Xb29BO6zxFmc/O/EYAKIrdJov3loRKAdZlFnxUGFj/+YDNzp
	NteXID/u1jUMPkPWWeBYUPmOp7v0adwnkvKGaEomZExxcAU3DDpGms/S7vc3C+MNn8C3MpcPQWS
	MCxuG/w4kTqvsajl2Rd/tLj5Z/dQ0510=
X-Gm-Gg: AYBFou3qukFCL2hrJZGXU2DnIqMzBTGzt5tWdUZZDBhheyxfQNelOI4dZXya1JyzEk+
	KLxs+weQQXbmJeyoQUfi8p+sE8KqUCZNIribECKeqOmgBqxuvfWGpnoz9h04sCF/ImG9cPvo/Rd
	UUT4ZJJPunAGFdQMTxJrJVr5gNZ7b2moZSdjxpmiZLZfjXESY3/N1UC/XT+W1TQdtInTKh2ZABW
	l7SoPLS3vjkTEQN42Dm1L8yHcnALy3X0dfIk6LpybF9+RXilAxKDuxqqvlX4VhKYiQ22MFt4xwB
	ns0mvvtf49jBu57Caia/BmuX0s2pCacyOkmo9cfGBOOtsOru46JOz/92kpuioUgrTeT7rKBfq6m
	H1VJyxZaAuezft7j4odiOaSljFr6j4urrfSn+DiQYdRu9kD2klG94gqzKUA4F/jwSiVhja2h87a
	L6nFXo5Tkba9Vjd35KhF6nNxB8uIshuaucdgsaTIYQsPgvDskWZZZG
X-Received: by 2002:a05:6512:1256:b0:5c1:4bbc:45cf with SMTP id
 2adb3069b0e04-5c156ed1806mr917830e87.48.1794332457809; Tue, 10 Nov 2026
 09:40:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110054836.1515030-1-senozhatsky@chromium.org> <20261110054836.1515030-5-senozhatsky@chromium.org>
In-Reply-To: <20261110054836.1515030-5-senozhatsky@chromium.org>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 10 Nov 2026 10:40:45 -0700
X-Gm-Features: AclHuK9g-rt6zF29XhO_FN13akwxVP6MwcYrtYAv2oyltJQHd3ALM1tNti6L_YM
Message-ID: <CAKEwX=MWLim2q7RaSchFRZ215avMfW161hKAKhxs888NgRRMOw@mail.gmail.com>
Subject: Re: [PATCH v2 04/11] zsmalloc: switch handle type to struct zs_handle
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, Brian Geffon <bgeffon@google.com>, 
	Minchan Kim <minchan@kernel.org>, Richard Chang <richardycc@google.com>, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 10:48=E2=80=AFPM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> zsmalloc handle is an unsigned long that holds an address of a
> handle_cachep object, so zsmalloc and its users have to cast it
> back and forth.  Introduce struct zs_handle and switch zsmalloc,
> zram and zswap to struct zs_handle pointers.  Functions that only
> read the handle take a const pointer.
>
> This is a preparation for embedding struct zs_handle into zram and
> zswap entries.  No functional change.
>
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>

Reviewed-by: Nhat Pham <nphamcs@gmail.com>
