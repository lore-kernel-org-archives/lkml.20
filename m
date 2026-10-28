Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793187898;
	b=T/yJVeVFF3K0E+9K9d73cb+qgCiwV7NGB66JJzKcY3zQuCy1WyeIznytGiYpjYv8m9Iu
	 hQqn/AFXLIn+AwzsMNpBF2Xs7Q0YSaOoFgvnrtNZ66Q26jXVJH4UsAd7om13qP1yiAKQ3
	 ZALdDlYtnaOnJFL4AM3n//d+dsiuupTu2Pg3+2bwJjjVrML3ZwOkfrdUI+EV30zlNhTRj
	 F5iE8+wubhVZP7Dn/bNqwIsxa2fcIQhpoYPJNu8GM6ICRci6+fI1ECCGtso3HnX8I3oqZ
	 /E2sgcGpD3FixW/Fw6PQG38qDeCvg+ZWuxKxO06FbO+sFbibNcX3n5lZYN++A6Y8AVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793187898;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=guTerj6OblcyJMPzDZY4qQ3gSTVMiXqm+ois6E1+oSo=;
	b=td+bbKtW576D7WgJAaShZDIxYcHt5Gv8GQdxuhNc1MccS/uuVy8Ipu2Hrrb60asZ2dz1
	 +LsS8aKloarJzNmLNMyebJAF7ZwEUZ+OM/dLk206eseSf9sX8xA6Mt1NJLXwIoVP8+hRG
	 7oQfgi4b2CKA7dNo+uSIBAwuOZm7DpDGCC9OYBnH0iCPN1d0AYZ64wS+jI1TOFxoxkGl1
	 FCMZck0SjX1fkJ25HP/KtBSG5Ef3kM/CS4H5zqbRKPZTRDFrvMgu8GrhbOqtdpjEqtd7g
	 t80sFD5lvSBgrqUJF0Ze6ZWZSeOs4r2ihfbSO0pCOc9xUqye1KWM9zCNtl9droFczMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VaAF0lA8;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9459C606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:44:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9459C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VaAF0lA8
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c418e215671so105147666b.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793187897; x=1793792697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=guTerj6OblcyJMPzDZY4qQ3gSTVMiXqm+ois6E1+oSo=;
        b=VaAF0lA8vg3UVEx7CzAR7lXapZiYbDhEMvH5YaLKlpkw4/CzUtNlQ/rQgWjE81yYSJ
         qlTsxO+pbGZheBNG7qb+QQ/fnoxeL9f+dtPWdssr/07pZbEa3XzF/0oibK9xMm4Siurn
         DYFHq/8NXPT4ax0qAZii0Ar8/TpfP5ykww4/dCwDaMbBjJPm2Qg0TQy5vuKn3JPOqC7Z
         PS2gESYZdHA2s1Qi2oGsLWtsQYzEOAINQJme85SFYcGflqNfQs29vvRLqkIAIpkVEz0G
         re02cQYMuyvHc4JMLrtW0WWxWPBCBM7rum0ECTD4kZM2ww/TD+DrFNXSyI2cPDJf0bUD
         6CNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793187897; x=1793792697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=guTerj6OblcyJMPzDZY4qQ3gSTVMiXqm+ois6E1+oSo=;
        b=JQCfQI2ODRDgaDihgEyq9deq5BWezO+bwEBItr0n9TMaUZ/sRjaY2WIIGEWylVVJBC
         +ACf7X2vpU7OW5nk+fn/jf8NjLdentE1x8kRIxjZsOkFUXUnwwZVwVB2uvt842GdMrE3
         HEW5KKaI7jR0KL0Kij/qCO8+YiQ/VPdknkjOqB7bpXVpAN0BV8fRWCzJ0/E0jHqWNbnP
         g9zwHKPiTwKVwKQG6374eRcvxS1gGoVyO7pAhRJAMtjAiwZKCWSW3xf1SPgP/jON0Tal
         s15DmSNfp5nDEFNzhxbIhdz6rgO40ZEnXnsov7y+LEHmft3KIFG9DAA3IgIRWvjyY5iQ
         +LYw==
X-Forwarded-Encrypted: i=1; AKwUvByI4qLdnRM7Xw5iEK/e+9CdAGfERdrCus0/Q8IAdt8ptbS+fnsSDZsgE1oQXTXhZlFH9fsqZhZF9JksLh8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTZYRtw8smeVriFF0dZCW01IVMSXPuOysfSoSzHd37o1uMlL9W
	rFOQikA4G1lpM9Is8E2epFOvi5q1O4Jwfb/lvLM3YImg2FHk5UCXpuoj
X-Gm-Gg: AYBFou3g4NMAv3oJYfS0PdkeZm6D25GcWZJgKjuMnHaSWY+m32fNx54s+CeKdlmw284
	sZICvQJxy9c/T3PIv4sujz6SK+j4ppuRnXQIkA5ALiMpOqTy3QfTMfrpc9W7UvAaqTelmEbfo2Y
	/IDSBvnCs6bkViMeYMwRFnUAx1WQIudrYKBRE0FyZFmOTfR2O/6uo4WEty4OZ6n1C1jgDhrnplv
	xdZw49K7Y+PeF9PMzCwUDpvjxlAX+1e9PLFELj7/qAIhUj75LxoZdMcXMS//Gt7/vDp5u8JxGij
	qg1rVb1TS/4xwrf3WZYJ+qWP2mI+cFhmvMZwCTWtsABQIO/JZktUab/Fp4RIpiMXqZNrMb8wVN1
	tH12Gv4csNIPM2FZd4YfJ4bLIyzUquQ3G8cfF7Xw5M0oioOrbWzfFOkMSzhk46UmVDyyWsCwPYf
	gor2wQwEPO9rL1rew5UByRE9TKzNc6r1uK35XKgf+NIsPuxS7kXNM4AKWDVIu/QP+CTDo42B9uH
	Zp3JBFtnhOl3h0b+tHTureXeViYnA/8OZyOdQXRWAAZIAsGjXVALC5lH+NisNfiC7x3QadFcEAG
	pGjYMpe58Bpp3+F7G+O6Sw==
X-Received: by 2002:a17:906:dc89:b0:c2d:d019:d414 with SMTP id a640c23a62f3a-c49bdf1a26fmr190348566b.29.1793187896594;
        Wed, 28 Oct 2026 04:44:56 -0700 (PDT)
Received: from localhost ([2a03:2880:32ff:3::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4eabadsm602548766b.14.2026.10.28.04.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:44:56 -0700 (PDT)
From: Vlad Poenaru <vlad.wing@gmail.com>
To: Boqun Feng <boqun@kernel.org>
Cc: Bart Van Assche <bvanassche@acm.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Eric Dumazet <edumazet@kernel.org>,
	Davide Caratti <dcaratti@redhat.com>,
	Breno Leitao <leitao@debian.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] lockdep: Keep dynamic key hash nodes in lockdep-owned storage
Date: Wed, 28 Oct 2026 04:44:49 -0700
Message-ID: <20261028114449.161185-1-vlad.wing@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <at9eq_3YUIL1ACEK@tardis.local>
References: <at9eq_3YUIL1ACEK@tardis.local>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Oct 26, 2026 at 07:07:39AM -0700, Boqun Feng wrote: > Yeah, I
think if everyone call lockdep_init_map_type() right after >
lockdep_register_key(), MAX_LOCKDEP_KEYS will be reached to the limit >
before MAX_LOCKDEP_DYNAMIC_KEYS. So technically it's not a new >
limitation. Honestly you can just make MAX_LOCKDEP_DYNAMIC_KEYS = 2 * >
MAX_LOCKDEP_KEYS (i.e. without introducing a Kconfig), "2 *" is needed >
because a key can be in-between lockdep_register_key() and >
lockdep_init_map_type() and pending_free can be delayed, so "2 *" >
provides a buffer for when active key numbers > class numbers. > > It
might be worth checking whether a lockdep_register_key() is always >
followed by a some sort of lockdep_init_map_type() in the kernel code >
base.

I went through all the callers (36 call sites). Mostly yes, with a few
exceptions: ath11k/ath12k register a key for every SRNG ring id (170-210
per device) but only initialize the rings they set up, hugetlb_cgroup
initializes when the cgroup file is created, and omap_hwmod, ucsi and
jbd2 skip the init on error paths. (omap_hwmod also frees a registered
key without unregistering it on one allocation failure; I'll send a
separate fix.)

The init itself doesn't take a class: every caller uses subclass 0, so
the class only appears on the first acquire. That matters for qdiscs. mq
creates a child for every TX queue, up to 4096 per device, each with its
own key, and a child's q.lock isn't taken until the device is
deactivated (or, for qdisc kinds that take it on transmit, until there
is traffic). In a VM with this RFC, four dummy devices with numtxqueues
4096 and an mq root, left down, went from 214 to 16384 dynamic keys
while the classes stayed under 900, and the pool ran out.

The class table is already exposed the same way, though. Deactivating a
device takes the q.lock of every TX queue's qdisc in
some_qdisc_is_busy(), so on current tip two such devices taken up and
down went from 852 to 8192 classes and hit "BUG: MAX_LOCKDEP_KEYS too
low!". (I ran both as root; from the code, the same commands should only
need CAP_NET_ADMIN in a user namespace.) So the cap adds another way to
reach a limit the same user can already reach. Agreed on dropping (1),
and I'll go with your suggestion:
MAX_LOCKDEP_DYNAMIC_KEYS = 2 * MAX_LOCKDEP_KEYS, no Kconfig. That is
16K, the same as the RFC's current default. Should LOCKDEP_SMALL keep a
smaller value? 16K nodes are ~384KB of bss on sparc64.

If the qdisc case should be narrowed anyway, net/sched could skip the
key for pfifo_fast, the only qdisc with TCQ_F_NOLOCK in its
static_flags, as it already does for ingress, clsact and noqueue. It
takes q.lock only around its requeue lists (gso_skb, skb_bad_txq) and in
control paths, never across a nested transmit, so I don't think that
brings back the mirred false positive from af0cb3fa3f9e, but netdev
would have to agree. It wouldn't bound the count either, since the user
picks the qdisc kind.

Does that work for you?

Thanks,
Vlad


