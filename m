Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4ED33CE4B9
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 06:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791615287; cv=none; b=OX/ERqbE2y3viB/PZkdSPbg0oy36lPsiU4M6WhqMr7MQvNdXpe7/3802iMyM6IYAnYlcfArXsavGKj3RNa0uss6lm2X/IyBpZRQnMi0MsC5duHZJ6N63GH5JKpS+gbWzSwPQqh2BKPLqiMka5XvcohBcFtq5ipUr4P6h2scxUrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791615287; c=relaxed/simple;
	bh=sfjXwrCLUFpqa0F5rhC8QwgJp7yKmgMaW7v/NSN0evc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q0nniTy+/DB3u7IocgqeHLIy3aphL58tuMhAQX5V0a+1N3M+xJ2QLOueS2+WNSJCBRnITglOZbKc3VmJ4CBEGTa8LME28ZFLtjozdj1BhibFz9xvEAyVhXy75GmqITJQrmF5qhkcOzkctxBcIPYGeUkmjb7DgvAnGsXdDF/WS3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kxx2zuCX; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kxx2zuCX"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so156442a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 23:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791615285; x=1792220085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dSyfVGop6O0UsffgvjiWEIMMvzYiB5cagcZXil/wW1o=;
        b=kxx2zuCXTcq+X8Fvz0pp3N7mtEuRv0zHM+tKlnc4U+FXbPxOcOeX+ka5y3gzKVDANl
         Uo2ZSciVpaLYlfVJSE99g8BJ1zUxWav5N0Uqouopy6E9vuzjVMeAMPTveJWmPjPaal8J
         zcObmdwajA4ND/MuqdkKH2cUpTd8lexKRr6+eYI4riGMDJAcR1jdEiU1N/zW+hpuENDt
         D965jBixK27vIV8SYm7zb5+T+LRKZ7OJ1GShehUVen1bcM2nziXn5nc3MRdRAzfibC3o
         o+RRDLvkF4qwecIz/7MCZeZK7m+AWnQ8Ag8pdJO1ejgEiny3YCyawfeeXgN+4N/D5azK
         1eeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791615285; x=1792220085;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dSyfVGop6O0UsffgvjiWEIMMvzYiB5cagcZXil/wW1o=;
        b=JqJ1T6nt7nOCDw5jouU41ImexWFb2YJV3KDrywpU8u7/7ku3AlSyt6EDzuGY9nqnyW
         84W+twzixmQx41tfk8ZV7cPnqtwQKb9SIteSnkALaRpJLhy4DOfqylaVNUv3cbxO+0Cr
         lpgaEGd66YqND7F1xJQQ0OAs3GNcJmIIHyhA6XpbHCrK9UnKKAAMKJ5NeA6/VVp3w/lS
         HC1W2jVy+D20jC4/eRgWufK34XCkS1lNPcGV5nFjkHxssB09X7gGKiQJzrhzB1yyeaA2
         8OGziFa3C8eEwzTDCIRJqjjotpwsxtftORoz6nZjsi5Zs249SK5DFyW/12RJ9M0tbIMr
         y8bQ==
X-Forwarded-Encrypted: i=1; AKwUvBzfRxv4HWKinn4he2Gt27CV4MfcNcgj8uU4sfE/N5YU4JV4X0Pz4svgJivZ8bieS7t0fn2DUEHNFXmKdNQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXP+1rLas2iVkfs7nvZOf0LT+GDP48R7BrEno4zmgj2LwUqA4R
	xTd2ounY6nRXsEP+CHjHr8Jbj3xT1LqiIWEdAasXJ1VxEuDpIciKtYzN9VSvEJSO
X-Gm-Gg: AYBFou3KOTdfTvqErwXQBl1ioIJuln3MPp1G6sSqZoWV6+zgmWMf0TSBB3Ys3HUI3Lg
	NiWahyk1ZQ6UcLnaiKiNmD2OR+pIKW4cn2fOeZqxoDL9O/sjWsL4vLr8xSz7smhU9RwR45I8mvd
	1wzjY230OFYW3ZV/Up+0Z+0qlDakRxA/fZePN6BDsGmbtGEcnZFJaf17g0Bd0BNdH3VCmrPQ0fi
	zBi9pvvUXc8m2a4K3GBEpXFg3xxrc+SYUFf6pfmEl78FgWerJYK6CKZyH9VK3DFkcqrSbZY0K6Y
	HEbOUhJwVQIF5uKMXPQne1tQYLuy1QpfMes8YRPpUivzJx52JWaS51vGT5j4UmaH62oCmwkHExC
	sJHNBdew5SLdic2A8HkjkYsU9DnI5QkP2bobkeFoKv3E77xibXuKcZCf94kFZR5ENYlVvtJhyKr
	ICNq9UQMO93iLHGhhPmVd01b7zxPw7OLSTqQGYtS7vTCkef8dcoCjoxAcRDEr5bIiaQfKMYh3BT
	u7fCt44Tgbs46oN/TwvLQnG14tTFR9D+kmNZiAvM2zVTZ/s0Ftay/K4i7ktUrMoFkL9Y3/9H0Zy
	bzjsWz0KGuR9kwurr382ALR96KlY874IWtEzl/oNAmVQikl/
X-Received: by 2002:a17:90b:3c8c:b0:3a4:967c:6947 with SMTP id 98e67ed59e1d1-3ab3a99b4d0mr3172803a91.21.1791615285209;
        Fri, 09 Oct 2026 23:54:45 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38b981b9sm6801595a91.5.2026.10.09.23.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 23:54:43 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] MIPS: lib: prefetch ahead in csum_partial()
Date: Fri,  9 Oct 2026 23:54:42 -0700
Message-ID: <20261010065442.23780-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

csum_partial() reads every byte of the buffer once. Cores like the 74K
have no hardware prefetcher, so every cache line is a demand miss, and
after a non-coherent DMA the received data is never in the cache. With
GRO enabled, validating the checksum of forwarded TCP traffic made
csum_partial() the top entry in the profile on a BCM4716 (74Kc at
480 MHz, no L2, ~80 cycles per DRAM miss): 13-16% of all cycles.

Prefetch the 128 byte block two iterations ahead in the main loop.
Unlike memcpy(), which disables prefetching on DMA_NONCOHERENT
entirely, only prefetch blocks that lie inside the buffer: the 74K does
not need a post-DMA invalidate, so a line prefetched past the end could
belong to a buffer the device is still writing, and the CPU would later
read the stale copy.

On an Asus RT-N16 (BCM4716, bgmac, single TCP stream unless noted,
iperf3 median of 3, A/B in the same boot by toggling the prefetch,
two rounds each):

                       without      with      (Mbit/s)
  local rx / tx        220 / 194    243 / 212
  routed up / down     169 / 140    187 / 154
  routed, 4 streams    65 / 79      69 / 84
  flow offload bidir   253          292

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/mips/lib/csum_partial.S | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/mips/lib/csum_partial.S b/arch/mips/lib/csum_partial.S
index 3d2ff4118d79..f0ec47259ef4 100644
--- a/arch/mips/lib/csum_partial.S
+++ b/arch/mips/lib/csum_partial.S
@@ -190,6 +190,21 @@ EXPORT_SYMBOL(csum_partial)
 	 andi	t2, a1, 0x40
 
 .Lmove_128bytes:
+#ifdef CONFIG_CPU_HAS_PREFETCH
+	/*
+	 * Fetch the block two iterations ahead, but only while it lies
+	 * inside the buffer: on non-coherent systems a line prefetched
+	 * past the end could belong to a buffer the device still owns.
+	 */
+	sltiu	t5, t8, 3
+	bnez	t5, 2f
+	 nop
+	pref	0, 0x100(src)
+	pref	0, 0x120(src)
+	pref	0, 0x140(src)
+	pref	0, 0x160(src)
+2:
+#endif
 	CSUM_BIGCHUNK(src, 0x00, sum, t0, t1, t3, t4)
 	CSUM_BIGCHUNK(src, 0x20, sum, t0, t1, t3, t4)
 	CSUM_BIGCHUNK(src, 0x40, sum, t0, t1, t3, t4)
-- 
2.56.0

