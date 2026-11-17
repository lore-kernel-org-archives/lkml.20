Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925404;
	b=KJCAPEt1XEEv6dDLPsXSJKX2/ABhB/kaLYmJzOEAHWiWYAwFCFMcrezIn2ktzopvX5j/
	 +ykJLpoyQOe3XwKqzUtZkzPuSQ++bp48a+KZiubDz9Td7e5gbWC27Z/bHEuqYvsdxNdmB
	 zU3dEswvBsfSSpfp3Fsk4MXpErztuSraDtAnwh/0ZT91n9bPtOjYgqD0ibIHQ83k4RoAp
	 Ut9Ba/DZOqVfXrC7x9Ft1eonz+9OxaroaVdk7gWszRtEUnUwV9wx4p1k/a7m5491S+8NI
	 cSkVoO+Rl80Ya9f+dCoddSb4aUi/PgqD5lbOYsjVfomPNtLQG9zg+MaPavS06ae91zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925404;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gu6e45ESjZegd8J7v8Vs4ndLsJawc0EC2FemgxWZCFU=;
	b=Jnxhp74HB8Twp0PZYS0pFap9BkRnCrx5t0jESsohScgTxE0TULhZ2YM7jRNRa7g25cp1
	 3+9WmhxbkmdKEUZUyZwM+iGxYWL1Tavfi4+b0NJb2N2y+JIYz0T8zweyth4MCPAvmfmwb
	 vXU5fq6O21kyZSk+cZcGeNrZfmybeT+J2TibCH0aOqxuFsEgiPVmWd2x4jct09Fkjj/+Q
	 aH5I+pKgj+HrXyyu0tRrckTCgEfJdrLfx+bBFQhrC2FEzJOhIjuqo+pWy1tZ0zc1uFHVK
	 Yl7NdwRrZp0HM3RPagDUoLQG3WPcFAwRj+aoQ8Y1O7FLX7wUBq6F11bQW93RvyRf9EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TSuqACOF;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0169260A260E
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:23:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0169260A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TSuqACOF
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-490d59c3edaso717559f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794925402; x=1795530202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gu6e45ESjZegd8J7v8Vs4ndLsJawc0EC2FemgxWZCFU=;
        b=TSuqACOFPO8XK8/V3EgDgdNSzsB/Us4i4hKLwRqG8N31EzF+LhvStXQpKUyeo/TgVK
         V5AC6SkHiQPBIFLrqQcdnqZKLlLMluInoxaIQN32GUz5OfbYXFJdqc9yUji14JP1IMRC
         qkc8lHS+jMRIXR1xPPY18UvDAb3G6+Rm+hHFQx4rK1MwGF9T7XXxr0GPgD9RYfyKzvXE
         V5AmxF3TpIYhO6kk5p/yvh7/1lx9110NqoqVIo8xLMNjvefnnb8BgtKliYTJYhoSL2Z0
         xvSntuB/Le/ZnsT3CKgRkF853jDPv01tstAYHtfAv4gkiSb0AEjB6xw/Zj6ZB7397epE
         WRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794925402; x=1795530202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gu6e45ESjZegd8J7v8Vs4ndLsJawc0EC2FemgxWZCFU=;
        b=R6cIUxJIIR8yjqenw/+TzUNEIwth0IdFVvJa466dTTxg7b58dcLyhuv7DIvbI7Mkdm
         UfzYSt64LgA3IE/ZZ8vVJohjM1AXjn7ZedMgb+3uek5knltq06VyKXSYnKih9UBms0PF
         CMkOe9PBn6FfELmwesej6RJ/YvG2XpLhboFAQdQWaDxVN3TOh9UTPmWKNjOw9z2SLqUE
         0qSqL3EcU5Nw1oleygomyHt419mWhFOxDP+6RLU3pEgSDWpgEbc+NB+c5IZUQ/ti5/xQ
         SKJqn/507mLK1/p4m3aNZRxNHWI+SaaXIWQ1g6N0wLAP2SqTaJQyqu6XoTSQMBGn0S47
         4ypg==
X-Forwarded-Encrypted: i=1; AL+hErFM8So/z9LHdYst3xA+ayXJCIiS5HSPhjGbqZORfIpX4bgm7GfuoueDDlUtW7mVpX7hCetKyA7Q0Cjb8ic=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FA64M92sizVVWG+hXE516iom4eg9Y3w+agy0G4mAvIQgC2B42
	Ns78ynOUzO9nAIOZhJ+uxZhTK/E7W0czxlNT8wUgqQblZiixAQr1+Hdj
X-Gm-Gg: AZFdTZfWLGvYCWKmA5m8EmJdAiSWQ5mYvu/o4EwDXyrRTVmJd8OqhBlJCMp4Dc4QuqP
	zO0fDO5VI9DraKH239NSijkcBTDzZUlwRXbHaq+s7/Z5BqWcy7kIZYm0nia278QBfyRgEiIN6Xq
	+OE1h+oMMRwKRS+X5n+PiXwLsUQFd2dsdyoLIAFSivn4jUGTaAr8PnUmBgzPqT3M8FTnIUkA+XN
	RCdFCPfN6H7laXoN4S/9YIyaFhDtQNYynKi8A0NKl0YjyQf9N4z6B2Qo5+c+DZqEeTcH6QpV6J8
	WAdGasB76UI/gR7CGB/E8lsqIGmS5PRcpwBAq+FKPGfrfJVuVn8t+3irK6ZvyVj/KA6dqbK1onm
	FGVbk/5UyrzDAGS641kkk/OEl25hUvY0ubemcu6CIn1zPp7n811cDp+N4Iv9QHc4l7BVm9d3Pke
	7lpPuIu2zkQxwjiquAUEen/prCFzxXxfY9pFWXzh0AIBY7U2Kn+JQxVbUXv7M58s5+uEoJ3GBxP
	LA/NC9u/+Z7bepm1VKEiLuP22bLrKB8pRWZ6+ICbgN/avdSS2c90otuPbCKotRQvpZoKLRdQ5i5
	5Qmu0rfCZ5aSL2/IYzY0ASoFVTfuiqgoWYio2JDNNZfqzw==
X-Received: by 2002:a05:6000:460d:b0:492:9c9:65de with SMTP id ffacd0b85a97d-4a36bd51e25mr6484255f8f.5.1794925401954;
        Tue, 17 Nov 2026 06:23:21 -0800 (PST)
Received: from localhost.localdomain ([2a06:c701:474b:1700:1234:6c4c:cfc6:45ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c888b90d4sm28417851f8f.9.2026.11.17.06.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:23:21 -0800 (PST)
From: Avi Weiss <thnkslprpt@gmail.com>
To: conor@kernel.org
Cc: jic23@kernel.org,
	pjw@kernel.org,
	samuel.holland@sifive.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH v2] cache: sifive_ccache: skip disabled device tree nodes
Date: Tue, 17 Nov 2026 16:23:17 +0200
Message-ID: <20261117142317.1679285-2-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028131939.1014720-2-thnkslprpt@gmail.com>
References: <20261028131939.1014720-2-thnkslprpt@gmail.com>
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

sifive_ccache_init() uses of_find_matching_node_and_match(), which may
return a device tree node marked disabled. The driver can then map and
access registers of a cache controller that the device tree marks
unavailable.

Check the selected node's availability before accessing its registers.
Return -ENODEV for a disabled node, releasing the reference through the
existing error path.

Fixes: a967a289f169 ("RISC-V: sifive_l2_cache: Add L2 cache controller driver for SiFive SoCs")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 v2:
- retain the single-node lookup instead of iterating over matches - as
  suggested by Conor Dooley
- use the existing error path to release a disabled node

Link to v1: https://lore.kernel.org/r/20261028131939.1014720-2-thnkslprpt@gmail.com

 drivers/cache/sifive_ccache.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/cache/sifive_ccache.c b/drivers/cache/sifive_ccache.c
--- a/drivers/cache/sifive_ccache.c
+++ b/drivers/cache/sifive_ccache.c
@@ -301,6 +301,11 @@ static int __init sifive_ccache_init(void)
 	if (!np)
 		return -ENODEV;
 
+	if (!of_device_is_available(np)) {
+		rc = -ENODEV;
+		goto err_node_put;
+	}
+
 	quirks = (uintptr_t)match->data;
 
 	if (of_address_to_resource(np, 0, &res)) {
-- 
2.47.3

