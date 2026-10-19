Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425031DDC33
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792375313; cv=none; b=GkyWOJa1dIRsCWmVGgLaj3W9DBukIx3P/bAF4QRHl3752tjckRfq/PZawVNgMfA96cx2A3i6j7ki0qRUp0RRC9y9N+1pa93Ou7yQfwQDwrF1GHqmH6ZUuq1YhUvDohDHN8iOtoXXwf7C7DyO0bd4U/4EXpnjJAazRFVnDvTUROg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792375313; c=relaxed/simple;
	bh=Edpgj08Ldip+n177eITHmraa2Y1TOk9X7F6IHHHcGgo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sqFujdtJqUAfY7q22BSzIlFlSbZFIvrXb9EibQmpHDiVMUW/PwesfKR6ZYHYxI5VKXDKZfiKlngdMxt3KRJSFiolWrWbCsFzpmvaXOh++HwB6naatIXf5ZWFrxb77gyKOb2LLjbY2LXS7pC20X0NXE0ubTsdwdm7zuAtg/R05D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KR7xsXp4; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KR7xsXp4"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35a31bb9fb6so3894836eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 19:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792375310; x=1792980110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lI/WkdtlMsNUr1YYA3okLxJjK81+p7pTaP8W8gi1+18=;
        b=KR7xsXp49sZqmriMvN58iYWi3XGysoh58xjt4ACKonW2k+H4C/RfSqRZZy2f70wMNk
         D0+fsWfuBiAWrc/u9wsZvekUYxfrTOPKO95WBdpfEyABrluBJ5qQFTJvHKemtW8/W/vf
         0Ughm9ePfsVSV3xbn6t1ioxqmdLJzBoIm8aHNZHiURO7epLG3S163w6WE82U0YioTq8i
         RtMam402XNGYAPM/yH367jzdibuQTx5U0LZWJcDkw9iKlUqKpR2TQRm80qgKp+qKCh1V
         l34ghjW+yYRZNVPnkgqSXxS90SMsrvTSsaEJvI3vBeQcC6klawwEURTQ2xJpBUWhA3Tq
         AdTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792375310; x=1792980110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lI/WkdtlMsNUr1YYA3okLxJjK81+p7pTaP8W8gi1+18=;
        b=ExBTpE7MEB9BWaz72up5W+r3MJZsYvLfvnHZjXI9WAsJrVCOlidXPXt7w4iTPweLmj
         GobBDXvJ+Q9Gej7nDSkuK/8L7lZAphkrY4ldJdCmvVmTRfiTthh05gZVS5cWEG6V/x1q
         naLJuaes8VEMJQCik/Tq8JuNBbiOcE8xMCMT6H+SecRiZuOAZ1PRLaJBk5Q47kRwvijO
         aZBTvEYeHqkdqNwLIcoxKc3qGDRyg+rNmVREVkkJf52fOnp34kXlbQxx95bcCp0bBSIJ
         eiqACa+o0yXQ4Yf1ZjKMxPCvBDOyT0z1Qv2Ojnk8D5bRpBJPSwA8jOEGnNcj+tbMcQ1d
         AyOQ==
X-Forwarded-Encrypted: i=1; AKwUvBwOlHnwntHKBjTi+YLNFu907VZJQJyBxzewYeYpVect16vMuv2Y0xqMVNFBqNZ5EENcNkyykF+DHFwngEE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJw+1m9sKGuKa0pyFq4gNCjQNVN/xIx72gKNuJHJRcQDwHHG5nV
	7ej5Jz3tg+u58kZ0H900C+qdiGPsRcJFD7pTmCYl2RXimOj8n3aKuoOn
X-Gm-Gg: AYBFou1dhtXmq73rVwExmywb96zo5NNqh7qnMlC7/VGZ6aq9ElXX39bH6DVJXDNrX0X
	/8EuhSV4Xe84bt1g78UxBcdQ2uw+pNM8Yr+FTZe46NrcV7XoMXrIMkexruEGUE2etwlRvk2shQk
	0Fb0d+/XWq5n41xbyTyVBVVsxJcBjaF19p78XascSOm4/9IouhsXQIcyd/LBz1X7y1HE4T0BOj2
	/Ih6QMefpq/ZLWDiF/nnBaUij6BEi07R1h61p3vjPYJXHpsogQpwVXeL9c69tHPS8/VQFLESMQF
	RQLok4ssruLavKv201YXL3Nv1W5dYsG+6d1paOTj66GWWH5sFXsyRveLuUzPc9pEjoMCf7Jvxdx
	ihvoXkjXuI7FvhMTByJZhrCDiqhFlj6hYRvLRSI6JgmE+TTuzaNr32il6LyDZ0W0x4P9x/kA414
	TIu8xY3LxHaBn6maT6pxEG3Vyav+Bs1x2iAgwvZqMRQss55VvUerziafNsMOBrJZItHTQ2UoDQG
	cXuZhBV8gSQ4AGZIz6ueRH/hgQrmEh1SO8oL0Y5dyRw8qpGDJhwJAAnMs0RzMMFl43pn1+FfeRq
	adUBJsivlfZGNZcDvZz+wCd4M+vHpv78w76DJ2HW3QVj1gd2lg==
X-Received: by 2002:a05:7301:53c9:b0:34d:de2e:1fca with SMTP id 5a478bee46e88-361a1b53139mr9460560eec.21.1792375310141;
        Sun, 18 Oct 2026 19:01:50 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360826875b3sm29108094eec.21.2026.10.18.19.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 19:01:49 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Chris Snook <chris.snook@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v2] net: ag71xx: re-enable TX interrupts on RX OOM
Date: Sun, 18 Oct 2026 19:01:47 -0700
Message-ID: <20261019020147.213746-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the RX ring runs out of buffers the OOM path calls
napi_complete() but does not re-enable interrupts.  Because
INT_POLL masks both RX and TX events, TX completions are
blocked until the OOM timer fires (~100 ms), which can cause
TX ring exhaustion and dropped packets.

Restore TX interrupt delivery so the engine can drain completed
descriptors while NAPI waits for RX buffer memory.

Fixes: d51b6ce441d3 ("net: ethernet: add ag71xx driver")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: add Fixes: . 
 drivers/net/ethernet/atheros/ag71xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/atheros/ag71xx.c b/drivers/net/ethernet/atheros/ag71xx.c
index d93fd91ff884..5a33759be3cf 100644
--- a/drivers/net/ethernet/atheros/ag71xx.c
+++ b/drivers/net/ethernet/atheros/ag71xx.c
@@ -1746,6 +1746,7 @@ static int ag71xx_poll(struct napi_struct *napi, int limit)
 
 	mod_timer(&ag->oom_timer, jiffies + AG71XX_OOM_REFILL);
 	napi_complete(napi);
+	ag71xx_int_enable(ag, AG71XX_INT_TX);
 	return 0;
 }
 
-- 
2.56.0

