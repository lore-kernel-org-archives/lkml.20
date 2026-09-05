Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC42383310
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 14:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788616914; cv=none; b=EHbLRXb28TZskrdMyEUNck+NnUz628SfNIGH2oY3Tic3Iu2XdEk71otKPbvjMqFjK6B7XzsW8VHi67hKAqesW41wxibV+TJPhKNT/rF3nlyg3oKxc1Qfe8FeRi4cva1kvnL/t1M/bVx5ieDEGiM03S0U/9vXhtoTVdJUdNywqGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788616914; c=relaxed/simple;
	bh=onVBlW7MOcXY/4u/1wLc1luNV8JQgXpPbl+Dwq4jXa0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZHJ3TtvARLwYGUdJgHPZlR5XHRkngfZoonAHrm9ax+uK81QjMtb+iNAzH8NXAczpS5RxBe7/AOe2Vpi6cKWjIGwcDjroLwD70l5aQRzF7/WhkF4ULCEAIHlS6TKz1K+gDLRQOG96+w0zaSweVUXli0EkXhqj1IxghJWMqx3B58o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dWYzct+k; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dWYzct+k"
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-97ea365dd5cso1371469241.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 07:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788616896; x=1789221696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=005z03CIhBd04YrgIq3DK9hNQnxi1U/rfpjn1baG6tI=;
        b=dWYzct+kr3knNGg6/KnBWU/0/Pngwk0AJhgw9yVvAAqjhIYoWga64JMbEizqAVH3Oz
         fbPtkEiSfEmzpwGpMucu22cuAe4SJs3VpM7U7FZ9lw5NM8EqRRrr9S5I2JZKpJ4FemMa
         BgjsYZLAv6j2ukQ0ZRkF9WkQsF9FAs/lcYSJBQRqQJgmJ23yTqzG/YzU5W6whLGsS+Mw
         VBBfxdr7x8EAS1mz4F9o9p+OLUUAjQdgTGkd2JLHI7y82sc9nnrChcEzkxkgSLozG/kJ
         Cr4RzxeSdaLrtVEGTtp0Vp/jwdW7q69meF1Y/zJppkJotLc3CDXhV5QqPpZ6w+VX2qWH
         UQEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788616896; x=1789221696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=005z03CIhBd04YrgIq3DK9hNQnxi1U/rfpjn1baG6tI=;
        b=OhLJf/JAxxDWRsW+qcWdaf0We5szfE6ZhAXwWh7Ku++ho5kEsqL7kLkfiuNY9roLue
         NJN74X9Ug3cPHqZGnC1tEIclmjUuAFNI3OY29MQNjbgQ0PSoyfQhdX7zvuuGgS1m+7P8
         KkfqwgG4PXqVtxhXH5j1ETEBzxiyIDRut4ymcJlH4ykJLT2IUBoQoBrfvgu1hvjFIYqs
         EbgsHMES82Vde+G1h8qgWFn9fhJ3yRTxRCu1M4XhNeC420/0obSZR4UwFvrJyR1qTaTO
         4+CAGJMMUevIObezMIbVTg739HcxgHUwxQPuV5Vq4nsXx42uwXY80t2aWQioqzE3n+3t
         EfzA==
X-Forwarded-Encrypted: i=1; AKwUvBxlbI3hR9XZK2Ft645jpcRScQ2uduXZ01A0HXu1eet2LiWTnPiziQUkKaYfw+PNo6mhBiElV86tssVWP6s=@vger.kernel.org
X-Gm-Message-State: AFuF++nU1nn7cPNj048364kuX8AuUsdSBz0PCYhddlainlEyQT1eFSe9
	z7cQkztRjjdDj/CnEx/PpCiBpaRb9rGT9Js8cqOAwaAF7b8hHtzB5zXg
X-Gm-Gg: AYBFou2NOhgV98L9XqnNkuPoyKu2MR5uxm6QbEiw190RuQOqvYli+iAngz2l5MufdQ2
	xVJA8crLZqV0VmgN+2ybbCL5nmoVFMpi6wi1ThJwGLRi0iCNG4+AKIFd8XlYJo4V8/zGO+QjC6W
	XQVXABWz6aEra2n2qiiGfd0EvXaFAMOcNCT1wGeyWY3fyB1+zsf8IR9e38rT/V1CVn9uEG2Hlhr
	lN4MXDYabm/N90YceU+bjz3tdalyVp6WlzPcaPHVafz6uBhO+j3zfrx8ImH+TthdKmi11on0ohi
	+4V/CUZ3AIvTT1lSZ9FQjqBjBMMlafO2MT3fNFgYFi2l04jsfxOtwpu9L7Eif2gbY5LTp82MVKO
	N8PtL2EgthWeyTjz20O6B7hCMhQ9A4bxXqqgibh7OoZRxBajnvVvCkiSswpieIfXXsNxDeG2DzZ
	9pzl88i4cv7NqifWLcAlafgZvYTCwiNBkqRZ6wHZffBC62r4Y4eV0a48poqfkjcwlI6fo8mHWA2
	ZJLJqX69jXWLqWLlKFMl58R7in4b8N7
X-Received: by 2002:a05:6102:3a0e:b0:786:c223:ad84 with SMTP id ada2fe7eead31-78a4a9c39cfmr5025994137.9.1788616895319;
        Sat, 05 Sep 2026 07:01:35 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808ee4d743sm3706877241.9.2026.09.05.07.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 07:01:33 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: gregkh@linuxfoundation.org
Cc: torvalds@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux-clk@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH v11 3/3] media: dvb-core: extirpate defective and unsafe ULE debug block
Date: Sat,  5 Sep 2026 11:01:13 -0300
Message-ID: <20260905140113.21638-3-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260905140113.21638-1-breno3011alves@gmail.com>
References: <20260905140113.21638-1-breno3011alves@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Completely purge the unmaintained DVB_ULE_DEBUG code block from
dvb_net.c and its Kconfig definition to eliminate severe lockless race
conditions and clean up the unused function signature parameter.

Assisted-by: OpenCode AI
Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/media/dvb-core/Kconfig   | 11 ---------
 drivers/media/dvb-core/dvb_net.c | 42 +-------------------------------
 2 files changed, 1 insertion(+), 52 deletions(-)

diff --git a/drivers/media/dvb-core/Kconfig b/drivers/media/dvb-core/Kconfig
index 8b3f2d53c..c6a97add8 100644
--- a/drivers/media/dvb-core/Kconfig
+++ b/drivers/media/dvb-core/Kconfig
@@ -67,14 +67,3 @@ config DVB_DEMUX_SECTION_LOSS_LOG
 
 	  If you are unsure about this, say N here.
 
-config DVB_ULE_DEBUG
-	bool "Enable DVB net ULE packet debug messages"
-	depends on DVB_CORE
-	help
-	  Enable extra log messages meant to detect problems while
-	  handling DVB network ULE packet loss inside the Kernel.
-
-	  Should not be enabled on normal cases, as logs can
-	  be very verbose.
-
-	  If you are unsure about this, say N here.
diff --git a/drivers/media/dvb-core/dvb_net.c b/drivers/media/dvb-core/dvb_net.c
index a2159b2bc..5060b8866 100644
--- a/drivers/media/dvb-core/dvb_net.c
+++ b/drivers/media/dvb-core/dvb_net.c
@@ -68,19 +68,6 @@ static inline __u32 iov_crc32( __u32 c, struct kvec *iov, unsigned int cnt )
 
 #define DVB_NET_MULTICAST_MAX 10
 
-#ifdef DVB_ULE_DEBUG
-/*
- * The code inside DVB_ULE_DEBUG keeps a history of the
- * last 100 TS cells processed.
- */
-static unsigned char ule_hist[100*TS_SZ] = { 0 };
-static unsigned char *ule_where = ule_hist, ule_dump;
-
-static void hexdump(const unsigned char *buf, unsigned short len)
-{
-	print_hex_dump_debug("", DUMP_PREFIX_OFFSET, 16, 1, buf, len, true);
-}
-#endif
 
 struct dvb_net_priv {
 	int in_use;
@@ -320,16 +307,6 @@ static int dvb_net_ule_new_ts_cell(struct dvb_net_ule_handle *h)
 {
 	/* We are about to process a new TS cell. */
 
-#ifdef DVB_ULE_DEBUG
-	if (ule_where >= &ule_hist[100*TS_SZ])
-		ule_where = ule_hist;
-	memcpy(ule_where, h->ts, TS_SZ);
-	if (ule_dump) {
-		hexdump(ule_where, TS_SZ);
-		ule_dump = 0;
-	}
-	ule_where += TS_SZ;
-#endif
 
 	/*
 	 * Check TS h->error conditions: sync_byte, transport_error_indicator,
@@ -659,23 +636,6 @@ static void dvb_net_ule_check_crc(struct dvb_net_ule_handle *h,
 			h->ts_remain > 2 ?
 				*(unsigned short *)h->from_where : 0);
 
-	#ifdef DVB_ULE_DEBUG
-		hexdump(iov[0].iov_base, iov[0].iov_len);
-		hexdump(iov[1].iov_base, iov[1].iov_len);
-		hexdump(iov[2].iov_base, iov[2].iov_len);
-
-		if (ule_where == ule_hist) {
-			hexdump(&ule_hist[98*TS_SZ], TS_SZ);
-			hexdump(&ule_hist[99*TS_SZ], TS_SZ);
-		} else if (ule_where == &ule_hist[TS_SZ]) {
-			hexdump(&ule_hist[99*TS_SZ], TS_SZ);
-			hexdump(ule_hist, TS_SZ);
-		} else {
-			hexdump(ule_where - TS_SZ - TS_SZ, TS_SZ);
-			hexdump(ule_where - TS_SZ, TS_SZ);
-		}
-		ule_dump = 1;
-	#endif
 
 		h->dev->stats.rx_errors++;
 		h->dev->stats.rx_crc_errors++;
@@ -843,7 +803,7 @@ static void dvb_net_ule(struct net_device *dev, const u8 *buf, size_t buf_len)
 				       *(tail - 2) << 8 |
 				       *(tail - 1);
 
-			dvb_net_ule_check_crc(&h, iov, ule_crc, expected_crc);
+			dvb_net_ule_check_crc(&h, ule_crc, expected_crc);
 
 			/* Prepare for next SNDU. */
 			reset_ule(h.priv);
-- 
2.43.0

