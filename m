Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793832325;
	b=TSchzniFYpotV7Pc4EbGnXuZxPqV30XQoETmwUKM9nU//GvwoVBpHKLvRjGxoavq6e96
	 rawlw7Vo2I+H7xdF6FGt7h0crzn67AiGdeY4iGDlpCR1qRRdCjhUhT4JmjPQJ1QQiDZZQ
	 vGgPbySCKI0VMTookdaxMCrjaUDDYglOcL3PfD4mAuKPPXfn+IXALyUtrYXLjT6sBCAKJ
	 tdZhipawoPznGLXTANN3aPLhUdxOkI0n9J6TjsuStp+nEnJGfOXRDFqznZDezGoiG27J3
	 8Xb2RKsT94PKoXkmW1FefQv03kRm5zjB9hBfq0npGKATFgmQ4xk9Joi2RHncZoDB5lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793832325;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jC7wzUlJenFIhu426Ht6bZZy8FBuUFtiZJAgit2LxZA=;
	b=K3Zz5QQrlR/4zzXhnLYiUo/8YMP+26caGXWUWnfilMufNgPgh26kE96MP99aTCRCFquy
	 YuA/aeK08oGrqjBVLpnX4eBnq6NC3DL70vfPEK62CqGrJndsDJSNcC8DecdTRHZZY22k6
	 S0iNGZmMlD5kZUWC3iU+prcCGkcjgdx0DjIhIaFmk/PbZ7QNTgmvYPZKFRM7nMr6Zr4wf
	 VkJayyBHAXehhpm569ZMLXT94f8UTyCvm7ahNjObvQJPHUDEhr2AG3fC49lzKSGn3kgnM
	 u0AjaM3ZJOq5dJJNoLL1u5LOSP8NLGSCCiPfWAtVGCSMD3qrKM0LUPkxG3JMqHjJI8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l7kwhkh+;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD279606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 22:45:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD279606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l7kwhkh+
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so336305e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 14:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793832323; x=1794437123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jC7wzUlJenFIhu426Ht6bZZy8FBuUFtiZJAgit2LxZA=;
        b=l7kwhkh+Nt2G/jrfyS1YlKGEnk4++f3fHPPQdRzEtHxZonaOHzEUrY1TrOXe9QtGz3
         YaUb1vGwFSrpU8BMe4QfZLTVBjvjqnqchoEwqpRPCtXZl2hSf3seYmuo3Rw+jC8jY7rZ
         wEoKT/ASSfsPvPvAEgtoRycJCqm8zEmErW/ZEjgZG5eZfhAyp9+YSY/asO+2u/UpwKhz
         mmEMKxogHskLSNyTQcc1MTKfm295P+XWVtqueWjKbmjA2hL1Ufvnfw6qeEvzSXl/jH4/
         j1j+MjLDj0uapJV6QbvPUEVciupzAtkE4SEK4V6snhJ3QJLKTYvlzOr30IETf8eTXrpk
         9gTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793832323; x=1794437123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jC7wzUlJenFIhu426Ht6bZZy8FBuUFtiZJAgit2LxZA=;
        b=l62s0HoBBgux8it0ZwNyu17X+fkOxZ5+lPioSzd4eJWIG2cl6BPJatBoW9M/x1oKvf
         WyTydfRAk8j4kV4G0BMq9Y8aQURGAm6QPeMUkFtvSIhcjINYNNslFoHsLraSlSPdpRBD
         mfxFh9ATDxztVn/Vb/vh7uh0jmDK2zmNjf29G+0LXvY1PcX9kvG8tV5du5gXB9AYrJwL
         57jocUG43il4v9adCn+e+i9zdKcko6VpoC2s4vPz4SJ8T2FHRIUWjgW4fA1FwSR68hpQ
         Xx0xk22VUhYrXDpopzb+TAgGbFPMT4pi5GZ7uojRePiaZ/1vKhtqU4uPgZAmdc+n6e8s
         nqtQ==
X-Forwarded-Encrypted: i=1; AKwUvBxouKyiv2H0iaHgz118PrZU2XU6wR4UYiahdx8oL0WGC5Ret0ORUK25LtUwcjAQ/9L6f2X1tWX73lYKnn8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/t8uBTGl3XizMGXzFIWLg+9jFNKV4KYejSBFSP7tYMAPT0S4Wh
	ACULt5TdlO9T30zAmh981MkE0vTz5XV2czNXSp0y/ymUZsUkicVFlUzn
X-Gm-Gg: AYBFou0LgFuoUW1yDlt0SlkWU5pypisOxOJIy0qaqTr98q6HPkXz7cgYaRn+uJDlgFh
	P2woO/q/e8fon6Tt/zZ9Gy+vUDUObrWwcXGM7pRStCbQKZICasx2vVyv1/zeJFPgidE25nP81md
	eBajvV/C9ABQH0rzTcHOZ9x97+54v0HOuAc5vMwO1XSYQo9r8xXSJwaKz/1G1WtEBkPHzbgNKnr
	ZYpm8t8N5sUIWE4T2GlBIvgKYbYLIYHsQkzk1kNYEg528Bl80vF/J/mJrUt86SnrdW2HwY1IRu0
	c0Z7LpqolfPOh93WqG9UUSlmlrEXn5JNcoWwJBxrwfvRmxyCHjqK2KmAB0pjAvcPCbKkR1rsg/J
	cm35yGLAEwvzfoVADk640emh5e8Zp7AXUvkb7I0opdlMwAG7oQlINc1Rn/qeadZLmJ7Ai9WIpDE
	zIJL2V2h2M+fc/XSCBs79OCriYh7LjDEApRphOYgM7/apDChx5eVnuPTu0EJCqeeO4JFHpy32Nx
	I7FQswKZF1X/9ONBHMb4oNulvdOUlyuIj+k+SocIthf0UEPs2YUMOn8vg39dXe/NN4QGocVOGHD
	dhLvtCHj/LiB4Ot3mtLWCtdBSCpQiKrEBAcZn4xOw4W1Ks78wQ9CyIM8DQZyPVUGA694R0aOc1G
	YSeNJLhQsrTjLW/ebrj3bik6a7MVfzouZcgQGUADSWPLe7x2eznl3f4yYaRcdrLzT9+ZMQEEGOc
	1kj5H4Mq+DFo4sgH/tbcrNlMCg0ssUqkzlqwl+KDmkN/35UrgDnav9FQ==
X-Received: by 2002:a05:600c:6219:b0:4b2:4b5e:8141 with SMTP id 5b1f17b1804b1-4b55d4f759cmr11989045e9.9.1793832323021;
        Wed, 04 Nov 2026 14:45:23 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-947d-5f15-1dc3-a8b4.ipv6.o2.cz. [2a00:1028:8388:a84e:947d:5f15:1dc3:a8b4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4320efc7csm36604235e9.2.2026.11.04.14.45.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 14:45:22 -0800 (PST)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: netdev@vger.kernel.org
Cc: marcin.s.wojtas@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com,
	w@1wt.eu,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 0/5] net: mvneta: fix the TX queue arbitration and the mqprio offload
Date: Wed,  4 Nov 2026 23:45:13 +0100
Message-ID: <20261104224518.66487-1-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
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

The NETA TX arbiter is left at its reset default, which serves the TX
queues in fixed priority. Under load a busy queue starves the others.
OpenWrt has worked around this since 2017 by sending all TX traffic
of its 32-bit boards through queue 0 [1].

Patch 5 serves the queues in weighted round robin. mvpp2 also sets its
TX queues to round robin, in mvpp2_defaults_set(). An mqprio offload
keeps the fixed priority, as its traffic classes may rely on it. Without
the offload the queues are served in WRR, also when skbedit or a
software mqprio picks them.

While working on it, four older bugs in the mqprio offload showed up.
Turning the shaper off leaves the per-queue rate limits in place
(patch 1). Deleting the qdisc never reaches the driver (patch 2). A
failed setup is not undone (patch 3). Opening the interface or changing
its MTU sets every rate limit to 10.23 Mbit/s (patch 4).

The series was tested on a Turris Omnia (Armada 385). With an mqprio
offload and "queues 4@0 4@4" on a 100 Mbit/s link, one stream on queues
4 to 7 got 94 Mbit/s and three streams on queues 0 to 3 got 0.2 Mbit/s
together. The other NETA variants were not tested, but the driver
already programs registers of the same block (MVNETA_TX_MTU and the
token sizes) on all of them. Suspend and resume were not tested.

With patch 2, replacing an offloaded mqprio qdisc under a new handle
with another qdisc that sets traffic classes loses them. The new qdisc
is set up before the old one is torn down, and the driver now acts on
that teardown. The core does the same when the old qdisc is a software
mqprio. A taprio qdisc left without traffic classes sends nothing.

Changes in v3:
- Patch 5 (patch 3 in v2): keep the fixed priority while an mqprio
  offload is set up. Moved to the end of the series.
- Patch 4: braces around the loop bodies.
- Patch 2: the commit message also mentions a taprio replacement. The
  code is unchanged.
- Patches 1 to 3: Reviewed-by tags added.
- v2: https://lore.kernel.org/netdev/20261103125021.70845-1-pepe.schlehofer@gmail.com/
- v1: https://lore.kernel.org/netdev/20261102112816.12322-1-pepe.schlehofer@gmail.com/

[1] https://github.com/openwrt/openwrt/blob/a5e96c837ead549820867bb83c1ad471e39f5ace/target/linux/mvebu/patches-6.18/700-mvneta-tx-queue-workaround.patch

Josef Schlehofer (5):
  net: mvneta: lift the per-queue TX rate limits
  net: mvneta: fix the removal of the mqprio offload
  net: mvneta: unwind a failed mqprio setup
  net: mvneta: keep the TX rate limits across open and MTU change
  net: mvneta: serve the TX queues in weighted round robin

 drivers/net/ethernet/marvell/mvneta.c | 112 +++++++++++++++++++++++---
 1 file changed, 100 insertions(+), 12 deletions(-)


base-commit: f56daaadfecae1f760d0fb34385b256d3af68970
-- 
2.54.0 (Apple Git-157)

