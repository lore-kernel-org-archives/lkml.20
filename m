Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793823006;
	b=KjU1FDReMSgwLBcSoJ4wBGPSFQKFmVH1I2R/3+c/ebrl8XRr7dImLnPDlL6X0op1VM5b
	 eybzui/mo7+KV1D7sTD5iyo8bk2Jcku+y1xWW687SQoki5tOpSoJYsHielOkBRcKgcPi5
	 c5UQJaF8OjG8QGw8H8kBsJ3G5oEYl6BWZbErYNj08T0LyqaVf/bwHXTJKrDY8Jv8AWswV
	 69+LI4wHDQ6OnernF2fMkjI0KL3uBwh3NicKAWAuACgGhpsgVflzdD1ZCWGHB1q67y4KX
	 KzDBy75pO52bNqfuzgk12daUJrXqdW6/ArapqT9xTKSr9SWCnO7vf3m5R8ZFZ3fPnNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793823006;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pbB/h7OcDLTENZAMlqrgPHDqleGuLS+XSh/+4bmYjVo=;
	b=qPPnY5l5Y2Lmm17I2XCDxRX+KL+wtIokKS6EtcJ2RrnvOUtEjcZSRpiKnOzKyzMj1n4Y
	 p18XpVljZTIlDLk20Lf4VHGCNK2LmcEru1cGACj5XnTW++EE2QJJTPA7ZI4Rw1X1mVRAe
	 VQO9PkfoRJ4LDGCZckCI5FRNuySGiH6Q50F3syDjtbkSg3Nw70w6sJ556HHbgRd+ORfbJ
	 eHdrcpFrK3kY3gMIc6E9ccM1PGGlLP4hBeDuXzSORCJAwt4bSLLpAHRjJ0lizLnqQO24d
	 4dtad6KWK8m/dKijbME6ibBvrZSY02/LzGRjvH4sytsJKNPpkfnSbjfy4BegXV6TkGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pAmB6tB5;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5268E6070F39
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 20:10:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5268E6070F39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pAmB6tB5
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so12224965e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 12:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793823005; x=1794427805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pbB/h7OcDLTENZAMlqrgPHDqleGuLS+XSh/+4bmYjVo=;
        b=pAmB6tB5L5Q0sXbpgw5MAvTI4uEVXOApuJPbfWOIyoio0S+Pk3ev+Xx+LtSaVDmZTb
         UtFs6xBq+HXY5ygUQ+qI7ayP+uN7rCJtM8Qo9UVtZesPJVPeKvFlcvws5jR2/iHFxv8Y
         veQ4oIX5N8YmBuVrhiXgkHYskpbffM0MwfPIRXC7NJyGDG5PAu/N2qWJVRrIBA6aDEf6
         liZndmGbC429jfE5e+Md/TpWVIyFUGja7Frb7Z1IKMKT4ruePVenI36Bw6OzDbXmKqlY
         AfTex7dzu322hFIm/ozi7mn3h55E6OP8ewbasszG/05oRQBr6/fSrgczdbozEEt+dWBj
         iLGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793823005; x=1794427805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pbB/h7OcDLTENZAMlqrgPHDqleGuLS+XSh/+4bmYjVo=;
        b=Xaj5JR51JmOimIABORIT5YsKn/BAB+dxImdFRo6zMvcdxDNW2TudckpdaX/U62VUG6
         +bnWt9jHIMe17B+kxefAR0a+RZLL1kyDhf3ZQrnlDz10mUvCT/3DKzObKZ3+Bcq2GrnS
         m24RxZiOGdN5K39O1g2fsnxB7XGv3PA/ThWTII6eXi0BCAMGu1w6kb73l8Y/NQ98aS4m
         u3mvOtpEZct9N4dAFpR+8qscfE4cV5QzCT/K5os7hcX1jw0HYmTp+rCzxaKxjgiyCw5p
         O7FTd3DaR1xGtE/U94hTARLMfHBMPbGe7Zv9fahY7aqIi0bWbG8DAilvcT9T7c1W7pUz
         25mQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmOcwBgqSD58IeTHInb/FVyVpAqxFSo5vAvbE4NikXlKXQNURrhzvpz/n8XIfKXZNYw2RqRmL0bQLqpz4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aLh4CGv/pydP3uzeBL7543U60DFgVcr0ZJQ4LUisoWn3+jetG
	vyOflHgy2b4+KjOgKuMm/HQMuZo1dNScAIvyHDtMkFnYqXxtukrTSsOy
X-Gm-Gg: AYBFou2vCGYb+6hJ+KrUwa5+KtyUHjdOGSUpWScQlX3JV8SmzhEIRHIBzcOiymOeUN+
	4duCRHAypE9rcfzw7z345sV8homvOJhUCDp7w13JhbbFuG9lQ4ols5B9WFYq9HN6nc7xNIMKqnz
	MQwQFEh1yYskM+Bfq28OCIXkxg9VsFkAQR/mBLSOisjAgwnNjzpvUViUxZuF9EZd42St8wkhGVn
	WdkKF+HmRv0pYMtHMlxh+STEySd42llNPTjWp9dEgdCIMkf6PejMWyGvRrOpFOVENknQQUwdA0j
	AWgQ8Hd5qPNO8KfJd/UR4zmKSngMrNQtjlvTORlPWxJGJTmR4z0SUFkXU1JUE9LY5L9PV1TKS9n
	sbezZhOQjzxL1U6tu5Cglk+jElAFnSxSJtdeaWQuJOCtAmmJnlzVmFCwD7qCt0fH23l6Qk1x9mU
	Phd0IGQbyQjY6fmWE30DPZD42mLEcn7Ep3uhu7wSuL/krUZ+6wqV8Vf/Zd+gvg92LiF/ZAZXeZE
	h5OzxPWF0BGi969SOLZ4VU+aOAvbkKSi/N3tS203O0rqbwvY0gmDJ8CRnR0sC41OfW6HUF8uQsR
	j6+Q9dznb36H7I49zldXLfpDY4QqD/fdSvnm7OOzFnFLh0RRtZmK17xR5ox25WWdP+3dcJoAZYH
	nxJ9VfmsRyIDLUtRdb7SUPZu8BRnBN5LrzwYNXK9wg9j191s=
X-Received: by 2002:a05:600c:6216:b0:4a3:5aea:21e5 with SMTP id 5b1f17b1804b1-4ac1737c533mr377961885e9.9.1793823004484;
        Wed, 04 Nov 2026 12:10:04 -0800 (PST)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56eb4da1esm15954045e9.6.2026.11.04.12.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 12:10:03 -0800 (PST)
From: Orgad Shaneh <orgads@gmail.com>
To: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Cc: Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wei Hu <weh@microsoft.com>,
	Konstantin Taranov <kotaranov@microsoft.com>,
	Simon Horman <horms@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Dipayaan Roy <dipayanroy@linux.microsoft.com>,
	Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>,
	Aditya Garg <gargaditya@linux.microsoft.com>,
	Erni Sri Satya Vennela <ernis@linux.microsoft.com>,
	Muhammad Falak R Wani <falakreyaz@gmail.com>,
	Jesse Brandeburg <jbrandeb@kernel.org>
Subject: Re: [PATCH net] net: mana: fix XDP_REDIRECT of pre-allocated RX buffers
Date: Wed,  4 Nov 2026 20:10:02 +0000
Message-ID: <20261104201002.2215474-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <autbwKmZPPWEj0Dq@boxer>
References: <20261102064324.806414-1-orgads@gmail.com> <autbwKmZPPWEj0Dq@boxer>
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

On Wed, Nov 04, 2026 at 05:22:24PM +0100, Maciej Fijalkowski wrote:
> On Mon, Nov 02, 2026 at 06:43:24AM +0000, Orgad Shaneh wrote:
[...]
> > -	act = mana_run_xdp(ndev, rxq, &xdp, buf_va, pkt_len);
> > +	act = mana_run_xdp(ndev, rxq, &xdp, buf_va, from_pool, pkt_len);
>
> I wonder if it wouldn't be better to work with rxoob objects which seem to
> carry the from_pool setting?

Thanks for the review.

The rxoob no longer describes this buffer when XDP runs.
mana_process_one_rx_pkt() calls mana_refill_rx_oob() before
mana_rx_skb(), and the refill puts the new buffer into the same rxoob:

	*old_buf = rxoob->buf_va;
	*old_fp = rxoob->from_pool;

	rxoob->buf_va = va;
	...
	rxoob->from_pool = from_pool;

So by the time mana_run_xdp() runs, rxoob->from_pool is the flag of the
replacement buffer. The flag of the received buffer survives only as
old_fp, which is what mana_rx_skb() already gets as its from_pool
argument and uses to free the buffer on PASS/TX/DROP. The patch passes
that same value one call further down, to mana_run_xdp().

The two can differ. Refills come from the page pool (or from
xdp_save_va, which only holds non-pool buffers), so on the first pass
over a ring of pre-allocated buffers XDP gets a buffer with
from_pool == false while its rxoob already says true. That first pass
is exactly where the bug shows.

Using the rxoob would mean moving the refill after XDP, which changes
what happens when a refill fails: today the packet is dropped and its
buffer stays in the ring. I preferred not to touch that in a fix.

If you would rather mana_run_xdp() take something other than a bool,
I can pass the xdp_rxq_info to use instead, chosen in mana_rx_skb().

Orgad
