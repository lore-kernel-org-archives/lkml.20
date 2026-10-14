Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537E128B7D3
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791937163; cv=none; b=WVMvch5KEcvGfT6bp5nbhJLPhojPeCpG0MVm2n+ywELy1OKXdZTREx7FassaTJ6N97twMXA2yxaPCLwPBY0P18AQYCBpdplpR/kfNG1ctGMHUQkEC+wqt8n3yL8K0w7I0BAwjj5O80yoVE2No9SzwkOL85ulaqcT3lPT4CV7m5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791937163; c=relaxed/simple;
	bh=+CjQJw4TmLJjx0ap5zKMR4YlXTxBErMluxLinens74g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GTQwFApmjLhWEiAmBPyBnSp0lRU/PPHLgi4iYQuRA2rzHCBKIYb+H0Up67xmP6lVjlmvGu/kVi2c/qEUmSo6VUtLSVA9D8bSN+xdoe0DUkQO6Il3dTU6EE5p3FCrZRXE0/BlCLI/6Ix/Q3/kpYharYe8+CBHk/AH4yv8uJCTtpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lXtCuddq; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lXtCuddq"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-30b6dad2382so8222626eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791937159; x=1792541959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w9IwgLzkDZ0iRcnUoTHhJ3o94HSpCzvoAYWamlL8/eQ=;
        b=lXtCuddqztDsRF+WE6xyLzgUG/4njusTKaga7Rg7Ed/WPIdVb264OfPlsiDiLrBtHx
         KSQkeZl81qtUB13EHi1Reu50/Vt9ohDJlt/n+bowbcVv7MRHjDftnu7OIdS6DPPxmjBT
         ULQsKBc5bmAUocK9lKrlOQs9QAjFgKysefFpzTAAma12qmEWN3xzImJI7rvawH19eJ5r
         RgCnq4yjJyLLq8D3Wxp2UTMBvAJ/zWG4qssnBd6ORMuLyXZDfz+AKWeQ+QxKYNET3tGN
         l0rAXdFChPnW6sfp5OyiYG4lJ6DYAk42nWojpKZiyKqR+O6uh+baRwjFtArH0O1lpbXM
         1hCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791937159; x=1792541959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w9IwgLzkDZ0iRcnUoTHhJ3o94HSpCzvoAYWamlL8/eQ=;
        b=TQXnqNJ4D2J2tQqOt4aJVnHYhBLnfokPlqYeH/ywvV6ri6IEPG/xzmtcH8LyXF0fZa
         5FY+qdstrdyh0AlNFZd+aWsoU8G9tmiZhVTBxm9rR57kjrNa50SrG750d3aT2aWDcBUu
         0XKQt7GRK6lTa3OPsM1JSU2ZzzqLsnlHtYrUHDocUs4FhGNQqh1Z6+W03VDUFetBrBdx
         WbTx0vuWzglkYp/n9nX9jSquuzUrHYKTeO7wdqfld4lAhq2pMIrlMceIlcD5jhReyRey
         4OUILMeEq4kMIHykYfLte52V2dgDSo7yPmr2dWawibfllQKBPStPaxLQHG9JE6e1A1pD
         SL1A==
X-Forwarded-Encrypted: i=1; AKwUvBx//5OeeUoQljdRxa7IM6Dd3IHQ+zXRN3GfjHYVqBvXVWM/VaA8rx/4O+S2i7x1yK4j7uu95Fdit6xfb3s=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9IlvaZEsGioaaRn2S796mrKFo1HQ3xmIaOEhHYEDZmSpLAcLG
	s7XNac3ZFRQph7qZzZ7DUJWV2AWj3ndSuJWc4gebtrJceHIdfVrPJ4Z1
X-Gm-Gg: AYBFou3tUAqm2cb2qutbe34ClrGLC0o+Y31bQdntogtlb9ExsceLmRkd6npT3hQQoXm
	Z9WwVqV8ZebICwVppdjt77P/8ZSHw/p7ZenfmXerQigOsYLJwmdwgcjGCNLZrVdqPGLjfIhdibf
	ObiG9BR7M1MqxXRxZN3v2Ije4QxifUewuZbrpSpc/hrPrHhElcysEnnHJQKhRUXBmDWXcSAsR8L
	Fr8kvuT39IMCO5IH1+CQQDtqo/NtrxTCbESEuSdIVwOdlsFLGi8CcDz4uhJdtyH5x09an8lD+S5
	EMRbsIa+uLJrMIJ1kOoHJixJpu4a8V++u4T3TDL2uMCjj/GaHnrNsuvLBO0As8sfNRDjqd6ziZz
	bIgPOzNu3gzVsLZgU+dSYOZxJTJPgQrTR5p5SyKurIVPP8Y5RybPwOnW+u1l7U8nzROnZnrRUfx
	d9hIoIcoPeTP7+vqwKz/yCr9KFNCeT+rmCeC0lAmJZmnIJojibup7obLSj/W7MRScqekWcc6/zV
	sTWl7HFqbrOoSZP3c5two40rUBc+pxPjTjqDVehG1vzaJ0BVeGVZi7Bv1P8koGglEeB98AWHCKl
	GsMB3m1kALBUy44JxPnxB4PzWEexGU/0kGHObGsfiWmEHPfmHGsHpVppB9k=
X-Received: by 2002:a05:7300:e5c4:b0:353:5d9a:9971 with SMTP id 5a478bee46e88-3537e088be4mr19654921eec.18.1791937158928;
        Tue, 13 Oct 2026 17:19:18 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cab27d5sm52213504eec.17.2026.10.13.17.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 17:19:18 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net] net: bgmac: don't process RX with a zero NAPI budget
Date: Tue, 13 Oct 2026 17:19:12 -0700
Message-ID: <20261014001912.141532-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

netpoll calls the NAPI poll with a budget of 0 and expects only TX
completions to be handled. bgmac_poll() passes the budget straight to
bgmac_dma_rx_read(), which checks it only after handling a descriptor,
so one received frame is always processed and bgmac_poll() returns 1.
That trips the "exceeded budget in poll" WARN_ONCE() in poll_one_napi()
when netconsole is used, and passes a frame up the stack from netpoll
context.

Return right after cleaning TX when the budget is 0. NAPI stays
scheduled, so the pending RX frames are picked up by the next regular
poll.

Fixes: dd4544f05469 ("bgmac: driver for GBit MAC core on BCMA bus")
Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/ethernet/broadcom/bgmac.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/broadcom/bgmac.c b/drivers/net/ethernet/broadcom/bgmac.c
index 427a096e5ad4..b1cb973caee5 100644
--- a/drivers/net/ethernet/broadcom/bgmac.c
+++ b/drivers/net/ethernet/broadcom/bgmac.c
@@ -1154,6 +1154,11 @@ static int bgmac_poll(struct napi_struct *napi, int weight)
 	bgmac_write(bgmac, BGMAC_INT_STATUS, ~0);
 
 	bgmac_dma_tx_free(bgmac, &bgmac->tx_ring[0]);
+
+	/* A zero budget (netpoll) means only TX may be cleaned */
+	if (unlikely(!weight))
+		return 0;
+
 	handled += bgmac_dma_rx_read(bgmac, &bgmac->rx_ring[0], weight);
 
 	/* Poll again if more events arrived in the meantime */
-- 
2.56.0

