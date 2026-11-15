Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794750566;
	b=210dqag+Gzb/rMr+ZAKljARPg9tCe8SGa0OrDq0+C2N0k+eWgtJv3nivnbhKZL7Iclxh
	 JOVBrEwhXq42EU1mI8Jktg57dmeq+3nRnqfTNMjCD347gSku6pxmHj6vwsupKPtHI6C1s
	 /vuFZNuiAnjwG+k2162poJlAecX37xNznBCrncbRffCFQ8waF7yX1hzfXOEOZkXxn2f4t
	 CNtnLDUyDKr8xVlHQAMuBH5kbEhpzjvuJTQYMk1VVl2FcX3X2Yx9zjcRfUAzp5O8PVq/Q
	 t5R3WG9pAeeufyhAxp5CndF2QbxrV6AS0SnvICq0KG01FcWnEsz5ZWqgCn00TOcefxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794750566;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sjZ8k8T7PvKA8j8UcuMcMJQ9cW1ScO0YNNkYRf0WN3E=;
	b=h3gq9v7sR7Hh4IxaBuJvEba+eTD5Lwtoy79GpOQYQnh/0Olk8BBUZMrFwUYmHFarrwy1
	 dw141jddAJSa+GTiRH0DSjXVEKhKXq1LRiFEnixWCSsP148Z70QhfXwl04nd4ePMjv6WB
	 NmKkm4oqZWMqcBucoCEOA4BONSxy2ctpghtEpQcIzUPHbKzwZFYP4Bn0cQkjMoD5vF3Fs
	 0sR9cNkHb25AyyuxMTyvxMO+JjmKBb6idYl4MIaEW2i/k6CeSKt6gO5GEN7swSk+5h3so
	 IwQhFieajXQBVwT8aRnGKV6JQQkK2QRy3S3gLLD1543hKa9e78srEyttLL/5fEGaXPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VinQC1TW;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C02F606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:49:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C02F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VinQC1TW
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c247f6687dcso486889666b.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 05:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794750564; x=1795355364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sjZ8k8T7PvKA8j8UcuMcMJQ9cW1ScO0YNNkYRf0WN3E=;
        b=VinQC1TWx0LeaMKDlhsfSpWq3Deuy5SBZaKufwhNgIQ0oWLtJeMyeHHILvP1ivt8UD
         bln7itfhJ5aoO7OLEJeXYYMrUksih944swOijz3EPPm0K3lka/j+xRPC/kC23zhVDmro
         qfPZQg7YhqQI8MZqnjDOS2o+aE3XeJqVQVFIe9YIopzgV5cG5SrnxD6G4kCSY4Y2reL1
         LtoG6Yp+SVDdE69z7mwByH5ltzVhcMyJR5tGzJaCh68cLCCJhexjDpmez9xFf5vp8E43
         6Ij6eYpigZc3No3Imr2OAW8Nd+jTzi6LhkvdBAvTB1aeIvjmGs3wuLeKfuCGGqZuUV8w
         /sWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794750564; x=1795355364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sjZ8k8T7PvKA8j8UcuMcMJQ9cW1ScO0YNNkYRf0WN3E=;
        b=vyRjCYbm2NYL1TcAJpYdCzah7qTaFKk/DmJ4ZFucdw+vL2ajo4xXJApZg7QXUcU3U8
         iZxGDKUMOk9DdihYTXYMSmLuFAHheyIcFpgH1Jfy28bN0YP8g9GG5Yi3jR6g6PUKgIoV
         oTMbYh+fAPPBoK+D9PCdwrFv+LuRNCiDCtPWEzYi4xMJOYI25QUCQ5G1r+/mDckP4Q0L
         8PtSqODDpGtR9bbmAfH64/kvGRol5LsS8eTzJ57TSFiseDnz2tyO29ljOjcbm0YIdvhw
         QnVdJE+R/OPyCalXU1tfqZFn+5JGQmK+oFx4xMWZa4/3WoC+NQKa5bItszotnnbngq8l
         GNXQ==
X-Forwarded-Encrypted: i=1; AL+hErEOD6Jq182I+cC8uBKGZnUbzUFU7i/P/zzPV4uwzn2CIqC5uMp0f9b4S1bDpXcw0zHs0ijCFxy1Qf7It18=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lxBKy4//kwlYkFLULP8Mx2IdGY9pIyvzbyygPeD3ANi+QEH+2
	4wGV7L+SgQa8NZMokLtmhVTRnpYorao4+EzNGLkucqjMb1T4FBOyZb4K
X-Gm-Gg: AYBFou0hgxyoBeeEHxtSz0luwSTsHcus7tNapv3OWJXnoSDFQrbDF9VZvhQjw4mY8Tp
	DxQySsc/Z/sx+M8QJ3LaPhqgZFiPRoDWJ1ilUpOPnmwNoJohPR9K6VbvCjoGUHQoONPFRyN3PM7
	OJZEzqBLE7KyRnoRmDm0P65gNxw08v7tn6STO0aH1hqWkVt4sDURxJDSqUmfO9KUq8KIq+ca1tl
	TSNt2ti3LOP9YqX2XE4+irlPdULUIZ6o5EXMdN7DePr0ZTHP0scHEQYTnzL/p3hX/lt2hQWU6VJ
	qm8TJt2lOxI55bUq3ORcumBS7nGlhPJDTyHJbCbdixNEuwUI96gILHhEgb+OosQFvt6kb4T5BTT
	3Sva+g580WVhZ7BVdtPItmE44ajLNm5bK7D6LqdkjpknwNLc82sTcszarp0yVhnDwkIxWDGoLz1
	Vg6tRC/7ygk+seRI27AR+MBYDTlgbY4KMq2ia85NMfP38JJhlbLgGhN/CulID24vDC3/PgmPkfq
	zBR+AMM1R1ggajasbDRYSIhxPHgbtgcedI0zmrFQCpYm8PzZOFg+bPnc4icbmfk8M9WlG6lf1P7
	OZVlwHs9BZooK4qpLB6FrLjHV5ovAK43mKetu55b
X-Received: by 2002:a17:906:d542:b0:c29:d31f:7d6a with SMTP id a640c23a62f3a-c509642ad87mr549257466b.35.1794750563634;
        Sun, 15 Nov 2026 05:49:23 -0800 (PST)
Received: from kordpc.lan ([2a13:e746:396c:c600::8fa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b7eb14sm314858866b.75.2026.11.15.05.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 05:49:23 -0800 (PST)
From: Kordian Chmielewski <kudzo51@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	bcm-kernel-feedback-list@broadcom.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v3 1/7] net: bcm4908_enet: fix the TX ring wrap
Date: Sun, 15 Nov 2026 14:49:20 +0100
Message-ID: <20261115134920.55329-1-kudzo51@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113235847.517308-2-kudzo51@gmail.com>
References: <20261113235847.517308-2-kudzo51@gmail.com>
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

Sashiko's review of this patch [1] attributes one Medium point to it:
start_xmit() still stops the queue with netif_stop_queue() when the
descriptor at write_idx has OWN set, and poll_tx() no longer wakes the
queue unconditionally, so a stale OWN descriptor after ifdown/ifup could
stop the queue for good.

In the case the review describes, the ring is empty: start_xmit()
returns before anything has kicked the DMA, so no TX interrupt comes
and poll_tx() never runs. That stop could not be undone before this
patch either; patch 3's changelog describes it. With stale OWN
descriptors further in the ring and frames in flight, the old
unconditional wake could undo such a stop and the new wake does not,
until patch 3 removes the check and clears the TX descriptors when the
ring is initialised. I left that change in patch 3 so that this one
stays the ring wrap fix.

The other points in that review are older than this series. Patches 3,
6 and 7 fix three of them, and the missing TX interrupt is the question
I asked under v2.

[1] https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261113235847.517308-1-kudzo51%40gmail.com
