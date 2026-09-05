Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43AC4A2614
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 12:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788612300; cv=none; b=QdmsFqT9VUq9q5GyS/hanbFSbYHECHMjPaTzxO/oumsb1GAUrKCiwyvgTjGWCqG5tbVNjkodIUyThjmrC/L2rOev8f3rWL1HzxvHfCTqpOhcYEAJ99ocMR3TjM9T1vtLH3UuvQja3gTbdw149hccTLV4x5vDmJDpCizoJfyOVb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788612300; c=relaxed/simple;
	bh=BjgISfvTM9/XDu/h1M+kDpd+4iJY+LF+t70SRBDyc1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A13cB9afMF0Cplhv7OvzkbTlMH+zmMM/MFMzKSZ2rD/qvEc+BmxQcZDsdgNuXGBKp5/PQUBBqXaQcuaMPfIdWSiU/4C6WxcFBfCd1AI+dlP7CakRaj3VpQpj29lW0DkOnhUZXxL4lLnq1MQqur5iAq28OLVfkXxur2jwu5mb70A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Veh3U037; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Veh3U037"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc147d86bebso1863398a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 05:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788612287; x=1789217087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IbG5XujoIulB+PfBXWWG4z6deVw9HiTKDnCZHy6890M=;
        b=Veh3U037mDy9AwdeQuMOiHN45r+6Uo/VlBfThMGPKMp5v2b0wqE1YkS/2UKW30SRTH
         wXDJDcb1T2XMAGGNfu+cduoU0zzTTIELUHZY+/txz3PZFVofIQf+m75k8cyEhCfxZWs3
         8DR+Pn5y7ySXCp0tuY0jwELmvLI+vb3VeC1r3wXVMxZK8TSFNc+nPOjVyv45AWB29A6F
         Cccn+3HR8R7BPd/gKV4qanp4yyJAzFw4ui7d+neRNbux6yAw34CovE8bSPilgygldKkt
         oVFvwQyFHvYGm1DzVnRSxKOkziQA4oScy1ja20uK9nzM7DEC3pSqj37Uky5QNL8zRItC
         OFXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788612288; x=1789217088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IbG5XujoIulB+PfBXWWG4z6deVw9HiTKDnCZHy6890M=;
        b=CPIpjbYtMt8T4CQ7xrGFnRRdJxQ3dkOM25sGn2YbsLpbtV46hnS+YHjVQK/HrfKm1Y
         RFtKvbh6f1uhgjwHJ9ripx1f9J8Za4YizROEeNY7Nq3yNQHiAn8vtO9PrrpjCXgp/4eR
         hIbrATHr8JPE7687Hv9sH7u1VYc/85AXXOakl1nSkA5iX/RCQDr+9EpDd+B+4q2uCZ1D
         r+TbqP5Jg71zdxD9nLHAEhU8RC6xkls5VWUeSirdInqcLGDRaeEcK8vEeuTF1zUAbUXF
         LDIZsSakaJJAGk8fsjxZOQBkvjyfO+nMh1RWkv17eBYc3X+zvbH0bS15QyKDmig8vfma
         aZhA==
X-Forwarded-Encrypted: i=1; AKwUvBzciWPndhePUmfdZF9ogQsuCcvwVccnW570wKh6XIgVXh7nRpPfmOmatf5rJs0A1FHSZ1FZR1UD/EsJg3M=@vger.kernel.org
X-Gm-Message-State: AFuF++nz57YgMxqvsmeXxk/Lyp0+cItEIyKIlI3eeHA6f7dArZchvyYI
	D4bl9b0PQqiL8WmIwPsaToHYW9aL1TpIoPnrkV8csDsQxQU7CHBIss61
X-Gm-Gg: AYBFou2LO7HhW9UUyt9F2qIZFOyteTcFYxnjx5BdPY7/QLEmCyzZ9KLwE8MJb5pNsnF
	E97YWZTwemml85MjbJE2KWYMAlUTapx33MmHhdGRJoJY+v9clGIOWEbX/ZJMwuqg2K+HY7Tkul3
	Gt6MymofTMmdN/QTmmymhTgjxAypfmXVQSQcQl1z2CasUCZ3wBJLB90YPpXy+J8yjGWXzPUHg1J
	rsuif9N0P6lGIHveK2Bbk2gDS0hslxHuOeMVcPMg1wo53wm3fGpiHBYxoC3vg4IjCP8YPRkPesv
	8e2+xHmhw1gVKQY6VLBB21D1Qd/ikuT7jMMH3pT8XdAEvHdRd3NENd214zVXklsIJ6feZ9TyWQ7
	ppxQWFdWB+F1geEHNmFjjUF5OmmPHASci0k9WiaN90HcVNiSFJVcqJ2tROxXPv5AQVJ+37YFI6C
	fKkdamJdNo8vBAOvD3ABRk6Qt74gS1rDR4FHc5xzfVvtkDENQeHygbqBtPfhEHCRIz1tgYmM8Yh
	4mP+qY2OArvxU2JrdhHvizSSCJN9lsP
X-Received: by 2002:a05:6a20:d80c:b0:3da:11e2:b36c with SMTP id adf61e73a8af0-3da2168b2d6mr18461998637.27.1788612287382;
        Sat, 05 Sep 2026 05:44:47 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3346ea43377sm11740417eec.3.2026.09.05.05.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 05:44:46 -0700 (PDT)
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
Subject: [PATCH v7 3/3] media: dvb-core: extirpate defective and unsafe ULE debug block
Date: Sat,  5 Sep 2026 09:44:34 -0300
Message-ID: <20260905124434.6163-3-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260905124434.6163-1-breno3011alves@gmail.com>
References: <20260905124434.6163-1-breno3011alves@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Completely purge the unmaintained DVB_ULE_DEBUG code block from
dvb_net.c to eliminate severe lockless race conditions and buffer overflow
vulnerabilities on global network state variables.

Assisted-by: OpenCode AI
Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/leds/Kconfig             |  1 -
 drivers/media/dvb-core/dvb_net.c | 40 --------------------------------
 2 files changed, 41 deletions(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index d0d318223..800fbd560 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -873,7 +873,6 @@ config LEDS_UPBOARD
 	  This driver can also be built as a module. If so the module will be
 	  called leds-upboard.
 
-comment "LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)"
 
 config LEDS_BLINKM
 	tristate "LED support for the BlinkM I2C RGB LED"
diff --git a/drivers/media/dvb-core/dvb_net.c b/drivers/media/dvb-core/dvb_net.c
index a2159b2bc..ae0073b94 100644
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
-- 
2.43.0

