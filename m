Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792881815;
	b=2ksfV1bZlZwvWaGCl7ZLx4wUX3LP7+yLZNnWJ23pLYP9taH4ehBzBr71pVWdDXO3nEtV
	 SiFSA1YcXBJC7ZpYinqHXWdaOqbGnfM2+nPDyAawQq4Di6LAGAau8axSnDy9Vh1aZv1dN
	 Q5tG6TBdH8bLsI77gbI2phOQ2vnTrJ6QTqayHaOdzitOjhm+EFwxHPnTOMeK7aO80MNzn
	 z+lNM5SdbotQbsbWUFE77XK93KY0MyK7jmIoVqlwNbIfQDla7isyNS6vE2fonysF9JzOF
	 k35wb99GglWR3cAp5RQZnAa0ImR9qtSVetzSFZEm4RgwNWXAiqEOOao7aIWy/kgW4ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792881815;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=5KfFYI85BavTvUDPaheV69ALCcpMe7MtH87hWt6t3yw=;
	b=vAPLlyVMsYq+4aqT/Vkmb76IXyU62k1FEpT51f5wlhTc9zTw/5muCp4t6rUaTreo2GHS
	 Syb2sVTFl48vRoij60gMKcBzKUoLLo2iqVvhe1wrFmuTZZ9u0IMjnWoQMmi1PGPmaUZ0k
	 gEfufAivlZrPkSGc4pnhYlw33wSN9pdMNeGQ0ARY8ou4imF28N+bI1SNtN3phr7jRL93+
	 sU3b51P9KGPpt88Hx5itRcb6oi74DQsQfp/mu31B7G+FWnsYJA4tGIHRdGfXQY0P8gu8y
	 LcHXsXdSMep4iMuR6a0f458Xjd+0YiCWp1DAKORZNgljsaRgFANuqLlY24bJzJ1VQTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=T9JvkXLL;
	arc=none smtp.remote-ip=209.85.221.170
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50075606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 22:43:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50075606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=T9JvkXLL
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5eafaeb8684so678951e0c.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 15:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792881814; x=1793486614; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5KfFYI85BavTvUDPaheV69ALCcpMe7MtH87hWt6t3yw=;
        b=T9JvkXLLfwUgIoUNaci7cw2KYglkZcT5YBvnT0Zbyuz2OMtCuD0xivLopvrHrvU8Xa
         mioNu99NvBHuN67pUdte/vqe+UKZVkJ8uQQltpBoJ9s37C8rjy0LYGnr2GHRJTkaUQqf
         4MOGbcS7E0odqFnO0W8jsQxQygVA3ib6qVZY+BBPh7kE/KqmmPKcGY0fLW6buXcCjpeA
         zDgPK9+AZ9sVUeg58XBilDKpKOBK08hSpM4VjDiR0SFaIRiF/SJ1NIMaNQf7L4FbsJ4y
         XTQjsURzpaHTOcly7nbeTg/Qw4SesAmkhAMd1Hs/NnWTJrtEuPjEgixl+vJlF5n9q6aP
         t9Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792881814; x=1793486614;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5KfFYI85BavTvUDPaheV69ALCcpMe7MtH87hWt6t3yw=;
        b=PawP3SjKPe311s41LmLrgNG1xFCtVWHO868eSuzW3vZVz3NFz0taTwVO8rvmJNUDdp
         Kid643YWKZ984YuoHN3PDr1O/hFJGNeyE1ANyghxWy8i178QbiYTupdb0VTwbLExFhI1
         p25X0M57/652kIFd2wOvPTDa0CrWfAU8JMwHYwutQ0WSSYFtFuDTD4vMCFi2CNLdYNh8
         PXmpaIfxEZRucF4pvKtK7gZPbBQfyJqh/g/Wul+189k9if7PUSMO5rW+e4HDMTy9+EiK
         YwKeQHoan4kW6CddZH0DY2e1jBcxto27AJjodQpRgqgYlfd1NfKSP5raDgQHWnrSJ14j
         RqIg==
X-Forwarded-Encrypted: i=1; AKwUvBxeybCJEFQPjpwut1qUGbnTLA0Caz7veWPev50gNszNdAcENIFHCIi8zHgB+VXX/L3s4Cmb3J+HVqPexvw=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4WRcf49pqQguD6pFCYEK0pF36QcPo8n0orgAn4LZNdwEwx/mS
	PysSXZeHjButZcev18VdwAqkHNh9SrCQUKwbUe7Icg/wKYKuTgz29NNq
X-Gm-Gg: AYBFou0qPMdthwa9lWW9iklju2gUimgt0nrIOf/BF0wHlJfYosBjTfcc1RNtHWHAInV
	56nGHHFCIsw5Gq19AlzkYFJ/JlyQ7X0jsYJa6aoxKyZH9RTh0KoptlfFIIvIIlTP2RYGTIsJ8H1
	8MU/fE405AF0RDncFC6ZwVffrNsJ1gGm38FDEQVq6sv80JQvo5l4/v5idmXnndpu9KegMgzZABM
	4YJ28bsEIp7g256w934v5ln4/k0rlIkXpyf6fqajjZ+nZhteBG0tY+WP19rRkhMXdL14yhLFv1T
	NYXmwmaEux+wGLujsVFMolk4/lxAwG4nfWBYmIld1EgE6WQ8xdRSX7DdxDraWdi+9qBQ1NVw9tz
	P28oGpx5b8iDQJ/pdkglSKtjvXQEoYmu216/ptxHdfej/YVTGOOpeSO/IZ+mQziJuAvx4gA75wD
	wekTuKfRApliOSC6g/O7XQieK6r9CdfUenoA2M89n1SgSIfwGMtZEf+nzzIYSCUKBwplDa42iY+
	iWKIv2pl8L38Olmng3BKRJ13NzcmEZuPOmK9UMudz4JVvT99ooEaXcQ8pd7GdVutgTz16n2exCH
	z1tBJQbqDV2/EbOD7ZoDAFCHCIpt5UZUkS84LsKbM4L8cwOTKWI=
X-Received: by 2002:a05:6122:3b83:b0:5d6:7f46:b8dc with SMTP id 71dfb90a1353d-5ec23338ccemr918466e0c.21.1792881814119;
        Sat, 24 Oct 2026 15:43:34 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa ([2804:7f0:b101:277b:c08d:c9f9:7c08:79c4])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec233f4d28sm3503879e0c.3.2026.10.24.15.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 15:43:33 -0700 (PDT)
From: Joas Antonio dos Santos <joasantonio108@gmail.com>
To: Florian Westphal <fw@strlen.de>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Phil Sutter <phil@nwl.cc>,
 Weiming Shi <bestswngs@gmail.com>, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH nf] netfilter: nft_set_pipapo: skip transaction elements during GC
Date: Sat, 24 Oct 2026 19:43:28 -0300
Message-ID: <179288180870.24716.7833838593165388250@gmail.com>
In-Reply-To: <at0vzdlVTF8XAzHj@strlen.de>
References: <179287943591.17355.17353179557993329094@gmail.com>
 <at0vzdlVTF8XAzHj@strlen.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Florian Westphal <fw@strlen.de> wrote:
> Please ask your LLM to explain how a newly added element can be both
> new and expired at the same time, then fix that.

Hi Florian,

Fair question, it confused me too at first, so I went and traced it.

The catch is that the expiration isn't stamped at activation, it's
stamped when the element is allocated. nft_set_elem_init() does:

	nft_set_ext_timeout(ext)->expiration = get_jiffies_64() + expiration;

and that happens back in the parse phase (nft_add_set_elem), while we're
still going through the batch. The element only goes active later, in
nf_tables_commit(), which is also where the gc tstamp is taken
(nft_net->tstamp = get_jiffies_64()).

So the expiration is really parse_time + timeout, and the commit-time gc
scan checks it against commit_time. If you add a big batch of elements
with a short timeout, they get parsed one by one and the commit only
happens at the very end, so the ones parsed early in the batch have
already gone past their timeout by the time we reach the commit tstamp.
They're expired and still new (not activated yet). That's the "both at
once" part.

I confirmed it on an unpatched 7.3-rc6 + KASAN: add 20000 elements with
"timeout 10ms" to an interval+timeout pipapo set (the parse alone takes
~6s) and the set ends up basically empty. pipapo_gc_scan() collected the
new, not-yet-activated elements during the same commit that added them.
With no nft_set_elem_active() check they get deactivated, dropped and
queued for the sync gc free, and then nft_setelem_activate() ->
nft_pipapo_activate() -> nft_clear() still runs on them.

It's the same thing you already fixed for rbtree in 86b6471e690c, the
pipapo scan just never got the active() guard. One difference: on rbtree
a non-expired new interval-end can also get pulled in through the
interval pairing; pipapo has no pairing, so here it's specifically the
expired-at-commit new element.

Full disclosure: I didn't manage to trip the actual UAF splat. The free
goes through call_rcu (nft_trans_gc_queue_sync_done), so the activate
races the grace period just like the rbtree case, but the precondition
(gc picking up the not-yet-active elements) reproduces every time.

If it'd help, I can respin v2 with the parse-time vs commit-time
expiration written out in the commit message, just let me know.

Thanks for taking a look,
Joas
