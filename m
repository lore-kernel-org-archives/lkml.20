Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E85420897
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790234483; cv=none; b=s2HwTUA+jkl4KUdReo+8q+FCHJH3l94O/A/uDLRRhH4ZJEURmO32mYJApfCXdz0lYL3WQ3nqZIxcOzK9i/XUPO5nP5VNXza5QAkTUxZgbuyyvBZfJp7xdSznZnhciRA9wlf7DSOGWWjJm8wld0duWQxSXMRVDpMkKZwiVFYBkSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790234483; c=relaxed/simple;
	bh=x7ICjHDMjN+K60no7F5bFA6Mx9WC1kGK316av6wACa8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Wpa1C0WFoCVHEnWYR1xc1Wqoy+cQyKmF52pr2h7usOqY9E6ur5uIBTBpadSESshl6dZYH8huSajf6drEuqmExbseyLxIQ3pC2g3Kpsc+iKhhQsTW1xQlt5lAh8CuoR5K8+pi7/INBx4ykhhMsiXR+GiPWngD/qBVJ1yOsZZ+FLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IVMMaMPu; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=LE7CjjLQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IVMMaMPu";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="LE7CjjLQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790234478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Lx/SD0ZEJ5dzEY+xl1QncqAhTw6A7MTbtLbXSvv8KOE=;
	b=IVMMaMPuPspYRpzG15UXOISttI8Zd1f3I6ndtyjYdMXvrhW6qEceh7eCJf/zjDaUUIEzwh
	iwekrX+YaN73BOUcktxWrVeF5QAM0BuqQKWO9A74dgfHJJrhmJAhDb09DDimK2jaB2diPh
	8IaJ1/mOFSt/yD+l8cPZo6HpJVUaEo8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-527-SUpLoJjnO6qrt2CDAAfq8Q-1; Thu, 24 Sep 2026 03:21:17 -0400
X-MC-Unique: SUpLoJjnO6qrt2CDAAfq8Q-1
X-Mimecast-MFC-AGG-ID: SUpLoJjnO6qrt2CDAAfq8Q_1790234476
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-487038a4a88so748671f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790234476; x=1790839276; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lx/SD0ZEJ5dzEY+xl1QncqAhTw6A7MTbtLbXSvv8KOE=;
        b=LE7CjjLQsoFj03r/uBN9SN3BfWrQtUlhacU65TfdC0OGP4Nyqd1v5E4tqaiGXqePgg
         C6EzWP8sDLoIgXy6SVzaa+A2zmJEnAzKEaH/fbiSsXwnHJzhYE5q9/mOvMZNnIEcxNs1
         8Au7H71t5V09QHGPv7JnxTgu6RrEpMiK21m/IqEvsDAC7tTc2UfKgkOD3UyiBf6LhjTR
         hmbRGE/V0kJg91mbhF84dFNhEMPcKW0gStberfrMzJZyDrl5RUYVdETsVOiqGiK1YUwc
         MSPjcIwPAMhCwqDZV717bv7LWNGUVIOmSp8K3gNsYQW2SK/X+cj5EZ9rD5CYX6ukJvQL
         nRvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790234476; x=1790839276;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Lx/SD0ZEJ5dzEY+xl1QncqAhTw6A7MTbtLbXSvv8KOE=;
        b=iUMLz+yjo9/SQB4ri0tHM4ofIXa00P2htBemGbIa1dP/nVQ+8gha+oSFTF6aDbRxU1
         0D9jaw88yQ05A6RkTDCaTRvweojL35fX6v/Q/bDNTAWRRCTtZTUu7Wspkyf93WSnVIfU
         FQm068CkxuJHASESlsDWNUAhIEag9DGKoRi+tCYik9ftkuyuhd0HBEAlU8aWtpMshEjW
         OKLf7mXxUSd8Zyv7+PVJxdf+LFzmwLTGUjrTm4koKFlvc7jQ1vqJu9gyHTJsWXn4nWQs
         I+8IczFSzwwpDQ1v3dO7LS9FGM/kVOn0o6z3DT9a0WVnnRnn84t10BkFiirczDjTHTpB
         rt4A==
X-Forwarded-Encrypted: i=1; AKwUvBxPmLBw3kUtJvRMkZGWjAH2EkOA1100eXpusYilsJrp6MnPkF6oH9u3+8nUn94+eER7zdM+G7JjwdTGPo8=@vger.kernel.org
X-Gm-Message-State: AFuF++nzt6YkOtZv/9ZJlbP3mZAXJn9ousRa1RcYHWyoPyEqUu9sFwvD
	DyJ2+EMAaFfaoA9ZRLynJ29JiQ1jVrOWRh/NGcu7eaj/1pTMf4/p3uA6HhC39/v421MNCCrDH4q
	t5hazI6LtAJKiatYjkHH0yhJ5vy43EFH6GlSEIf39GbKuC7YAtg4F/rX4TnLxVK/xnA==
X-Gm-Gg: AYBFou1LPVJ2KBoltCfejQV9w9XjzJxiGOYqaFjnaLRMCwg9CBjbnCkBbJX49EjPL1v
	3qqmsS4p5ZUexujj2PUXdfxB3L157HUAI3c0kqmVPMOvI/o00d76nacilZ1f2IhGC33mBE532J/
	55b2lLe42EbBr4qwdVXfo/yG5dhgsVHrbXz1CTc6x4y3C8YIpaxhqybrO2jhDxM8j9cVJJoWolb
	lB//YOyXzruI8LaT4hAyW+dVe2qpoCxsKE6kSzM6ecCyJx+PnlQlruulXCscVZMwEYDj9ngh12C
	gahs2zYY8Hg4PN4nk67D7dMJFYJgzXSbKn8xwgYO2fn7yNCYrkJCrZIrGi9fzq+iTDiERpHwX9+
	Q1ZfJhakq2Jm8iOlQsVL9NGEsyP0G
X-Received: by 2002:a05:6000:4711:b0:487:35c:b61 with SMTP id ffacd0b85a97d-4887167c4e0mr2257085f8f.24.1790234475992;
        Thu, 24 Sep 2026 00:21:15 -0700 (PDT)
X-Received: by 2002:a05:6000:4711:b0:487:35c:b61 with SMTP id ffacd0b85a97d-4887167c4e0mr2257059f8f.24.1790234475601;
        Thu, 24 Sep 2026 00:21:15 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.135.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488684863fbsm11337269f8f.11.2026.09.24.00.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:21:15 -0700 (PDT)
Message-ID: <b771379679b8f94573382d3c2534fdae77b9fe48.camel@redhat.com>
Subject: Re: [PATCH v2 1/3] rv: add per-edge dwell-time statistics primitive
From: Gabriele Monaco <gmonaco@redhat.com>
To: Tobias Schaffner <tobias.schaffner@siemens.com>, Steven Rostedt
	 <rostedt@goodmis.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>,  Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 rpm@xenomai.org, 	jan.kiszka@siemens.com
Date: Thu, 24 Sep 2026 09:21:13 +0200
In-Reply-To: <20260911123439.463052-2-tobias.schaffner@siemens.com>
References: <20260911123439.463052-1-tobias.schaffner@siemens.com>
	 <20260911123439.463052-2-tobias.schaffner@siemens.com>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0BrZXJuZWwub3JnPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmjKX2MCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfIQuAD+JulczTN6l7oJjyroySU55Fbjdvo52xiYYlMjPG7dCTsBAMFI7dSL5zg98I+8
 cXY1J7kyNsY6/dcipqBM4RMaxXsOtCRHYWJyaWVsZSBNb25hY28gPGdtb25hY29AcmVkaGF0LmNvb
 T6InAQTFgoARAIbAwUJBaOagAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBMrKEfgLgd0WcK
 eo9u9KbElYeE3yBQJoymCyAhkBAAoJEO9KbElYeE3yjX4BAJ/ETNnlHn8OjZPT77xGmal9kbT1bC1
 7DfrYVISWV2Y1AP9HdAMhWNAvtCtN2S1beYjNybuK6IzWYcFfeOV+OBWRDQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-09-11 at 14:34 +0200, Tobias Schaffner wrote:
> Add a small primitive that records, per automaton edge, how long the
> monitor dwelled before taking it with a count, a sum and a maximum.
>=20
> The counters are per-CPU and lock-free, so a monitor's hot path can
> update them without disabling interrupts and without perturbing the laten=
cy
> being measured. Keep the state and its entry timestamp in one word so
> nested transitions cannot charge a dwell to the wrong edge.
>=20
> Signed-off-by: Tobias Schaffner <tobias.schaffner@siemens.com>
> ---
> =C2=A0include/rv/edge_stat.h | 69 +++++++++++++++++++++++++++++++++++++++=
+++
> =C2=A01 file changed, 69 insertions(+)
> =C2=A0create mode 100644 include/rv/edge_stat.h
>=20
> diff --git a/include/rv/edge_stat.h b/include/rv/edge_stat.h

...
> +#define RV_STATE_BITS		8
> +#define RV_STATE_MASK		GENMASK(RV_STATE_BITS - 1, 0)
> +#define RV_TS_MASK		GENMASK(BITS_PER_LONG - RV_STATE_BITS - 1, 0)
> +
> +#define da_state_of(w)		((unsigned int)((w) & RV_STATE_MASK))
> +#define da_ts_of(w)		((u64)(w) >> RV_STATE_BITS)
> +#define da_state_pack(s, ts)	(((((da_state_t)(ts)) & RV_TS_MASK) <<
> RV_STATE_BITS) | \
> +				 ((da_state_t)(s) & RV_STATE_MASK))

These are barely readable and error prone, can you use FIELD_GET()/FIELD_PR=
EP()?

Thanks,
Gabriele

> +
> +static __always_inline
> +void rv_edge_stat_account(struct rv_edge_stat *s, u64 dwell_ns)
> +{
> +	s64 max;
> +	int i;
> +
> +	local64_inc(&s->count);
> +	local64_add(dwell_ns, &s->sum_ns);
> +
> +	/* Keep the largest dwell; bound retries if a nested update races us.
> */
> +	max =3D local64_read(&s->max_ns);
> +	for (i =3D 0; dwell_ns > (u64)max; i++) {
> +		if (i =3D=3D MAX_DA_RETRY_RACING_EVENTS) {
> +			WARN_ONCE(1, "rv: edge-stat max update exceeded %d
> retries\n",
> +				=C2=A0 MAX_DA_RETRY_RACING_EVENTS);
> +			break;
> +		}
> +		if (local64_try_cmpxchg(&s->max_ns, &max, dwell_ns))
> +			break;
> +	}
> +}
> +
> +#endif /* CONFIG_RV_EDGE_STAT */
> +
> +#endif /* _RV_EDGE_STAT_H */

