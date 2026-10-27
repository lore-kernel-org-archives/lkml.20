Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793066474;
	b=krQcJefa8v/alga4AUXfhH6t2khxQoXvxxIdKGBttAWB1v4dudAbYszCtDhcdI0c2boK
	 G7QB75/ypTxEs71LHNsk2HCulST4deyxhvAGQEXmaC8cewRGv6jGZuiOWilaGdDDBJ/yY
	 28g59qwaqrdyOW5n88901BeiX4Cs7OSlui8oB3luWi4nVPp+jZ2PkpfnizHnDwp7J6S3L
	 lacooNqB/gb1BM085U+qGqIw/m09/B/LC23BqcK91hSDhjn/xTotfWsMpxmLa2lkp6Vw1
	 GfDNm+YjohOAodSJ22hRkwLc/kCxdgitOPyf/7CuwMUzVI/NkRCl0S/byjFWrY84m6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793066474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=ILpHxFRhbHQUqgfLQdu6bP24Wd5BWfFHmPEKysq9O0A=;
	b=1Qgbz4j3Sisqql6CVoMfJ+lW7VBUq67p438X1cfXBo3vkK8uBeFSDSas/ubi00g1ZE1d
	 27bZIe2IInapuukbcY6bf6z0BgeesrqEqVJ46dq9TYpCXeEQJ33O4zccx1h9YcTGqozou
	 xJELKBCUOMdtjHrOkQrOFVf3p9fpwbvYOPRw9UmuAPrAkLfcPwZbIkSunaA1nN/vSkoLr
	 5YEnw+sNfeb+lkrY4jNoot+yGAsQowrlESBoS9Ftq+rIcUZeAx77Wo5vlJWIzuVli9H2e
	 uyDk+D+aFj+stWowbnv47X78n1NcA+juUQu9TTEBLBgd1u/rUtPudZy5Wcf/j2xnNgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ozXcZo2m;
	arc=none smtp.remote-ip=209.85.210.199
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEE0606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:01:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAEE0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ozXcZo2m
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-88c768885b4so6393636b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793066473; x=1793671273; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ILpHxFRhbHQUqgfLQdu6bP24Wd5BWfFHmPEKysq9O0A=;
        b=ozXcZo2m+3uCrn1xmYp0nUqxjRbqTdfUnuXy6B6CgN6CfqwnQza8kt5Z1uVCskmsJE
         xV0hGYtJw4f3wU7xxonDfd0FlUcUbfDOGM69m2N5Z+bPuGz03YSeH5RVMfaJs/bFInSs
         yAaOc+Gw54GroWEkeFmxPcDwNvyttJhcnzoOeZoJIelg1MKwi6fq71ZleT3sZpdymS+c
         x5EkMPn3nl0bRCBu9VYY1OEaqDqmDVqvjbCZbTmdSqAgDzH0z1IkFMyF45mV9AZy0997
         Mz8qcrJgXQSebLwgC4gu/FBPDSkEDRSOlY5kr7r4KG0Nzt5F5n9sX5V1HA55RDYxO4SG
         Trag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793066473; x=1793671273;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ILpHxFRhbHQUqgfLQdu6bP24Wd5BWfFHmPEKysq9O0A=;
        b=u4r+kg/3S05YFUqc1fEd9W9p5AeJhaaO2uxJY/+QRoAhYtoYr4oqobXYdJk9SseROV
         10/fX+YSV8I29zryrjAR6jaerdP2Bv/s2d5Npt7SbsWP0qRSO/RhFsgRwToqiY1hFPsu
         AlxYQBNuNf81xqwY4mgI4IXHZjagNJcWOMnZxPQ0b42yInvqsKh+4LBmv4u7LMKHXixP
         1Zu1za2IK1MMiNDwrqWetMcwZxllnsc+mgU8xRZ8Mwx7gd6AwxT9vml4aGszL2jgA6Xr
         KbJvRzUq/XKKZNbTpvPhcQjjpdWIufXzKjKFifHtSKZRe5De3H6qzJcts0BTaJpnekTA
         1aAA==
X-Forwarded-Encrypted: i=1; AKwUvBxHfpJz16ZfCTvee+LmcUSMfM6uhrQ/jWfxMI4TSUf837971ECcBoAPAQTh5ET5jFOCvWAc47lRKAXFs9E=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHFADZ38vuXVRsWYVWzK5ayDUmSGISdEZhY8v3azKZmSf1iiGc
	mQHSbuF22hr+gvOiG9E29ELkqnIMHSoJfnpZEf0d5en70yOZ40shBqS0NTl1y7Zugg/nIKCkrHJ
	BsnOxIA==
X-Received: from pfnu20.prod.google.com ([2002:aa7:8494:0:b0:89d:4e13:90d1])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4196:b0:899:74d0:8a58
 with SMTP id d2e1a72fcca58-8a369c1f7bdmr6652440b3a.55.1793066472760; Mon, 26
 Oct 2026 19:01:12 -0700 (PDT)
Date: Tue, 27 Oct 2026 02:01:12 +0000
In-Reply-To: <20261026095208.58504-1-yzwlhm@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261026095208.58504-1-yzwlhm@gmail.com>
Message-ID: <auAFN8CJvmXdO0Zu@google.com>
Subject: Re: [PATCH net v2] tcp: Fix fastreuse cache initialization on first bind
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Zhewei Yuan <yzwlhm@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Mon, 26 Oct 2026 09:52:07 +0000, Zhewei Yuan wrote:
> inet_csk_update_fastreuse() initializes the reuse caches only when
> tb->bhash2 is empty, but both inet_csk_get_port() and
> __inet_inherit_port() link tb2 before calling it, so the first-bind
> branch is never taken.
> 
> As a result, SO_REUSEADDR binds never get fastreuse=1 and keep
> scanning existing owners, and SO_REUSEPORT starts in STRICT instead
> of ANY.
> 
> Initialize the caches when tb2 is the only entry in tb->bhash2 and has
> no owners. Timewait sockets are also linked on tb2->owners, so this is
> equivalent to the old hlist_empty(&tb->owners) test.
> 
> Found by manual code inspection and confirmed with GDB. Binding 16000
> SO_REUSEADDR sockets to one address/port in a KVM guest takes 4.18 s
> before and 19.4 ms after this patch. Existing bind/reuse selftests
> pass. Analysis and testing were assisted by an AI tool (Codex).
> 
> Fixes: 8002d44fe84d ("tcp: Check hlist_empty(&tb->bhash2) instead of hlist_empty(&tb->owners).")
> Reviewed-by: Eric Dumazet <edumazet@kernel.org>
> Signed-off-by: Zhewei Yuan <yzwlhm@gmail.com>

Good catch, thanks !

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
