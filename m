Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742207;
	b=IazKHzjuXCLm7FeShucLUecpckMviLYMlrQwwJJH1RVzDx9oMDc+ETuiVGhxMahgq58G
	 BsxYbdlUtqhIX0QJScotbSo63LVSUG1xUjDGcyEeFRkPL5k+qMDXYu+Xkyd3RtB2lkEaT
	 75NFlAe4heNj0utRU0FX1CDquxUOveuw76WFpxEuGINO0Y7ReG4hc0JtszpR7DwhG02lR
	 SkLWxjUevVnCCl/1LHzKB2xqLYVadUtucm70waQKZgxBsBjo6yAbyWSDl7JOWk4f8KfIs
	 5nocoECwknaWKyeP/Dmq04v7JfxwwZHbN3wpmMuAqjeDPdUCAGQV/sj+Qd1kgzSZ3Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742207;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vUI4WubnJa1B4/84lLFCEDflaxOrnHrdNhUumLhC5ng=;
	b=fh+qLmNow6Si+UnfWM5bqEMyJEsykKe4ISWpvVNcIzaR2wqyUB4ytRveoP0+1KitW4O4
	 yf6GIf9z4Gp8ecKTTf+G1UVxiElWbMmf2ZQQ0/3lYW9oVcL6PqcBP1VWHF7inBYe+3hP6
	 sLCUkiteDDMPUEZLiD3EU8Za6N3znTB/dArFK0HRsyimWNyQRthogQ3vVclYGRjrJDHCV
	 rN8tEjAX+kVNkm27v3ff69SR9oV0Fu31MglMxie6dRaaEgvMWfdM/cS8FAOL9JwxobeRk
	 P1KNZHjhupRiqHNyvjUB+YGNqRqrlFC6Vboww++eTYQ2LCKxfjlbS4i1ULwgpiiWe2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YH4TeVD9;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A11606EE8D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:43:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39A11606EE8D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YH4TeVD9
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b3dc272dcfso6262109a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742205; x=1794347005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vUI4WubnJa1B4/84lLFCEDflaxOrnHrdNhUumLhC5ng=;
        b=YH4TeVD9yklISDTSf/HTYUcoOVemwE33ZyBdtAsgHES+ReJVpl6S+Y1QWO4ACCA83E
         yhmcBNYOrCtYpQMXp6cPt36Is6eGQSA97okm8OnZ9rzPpzNqPI6Ri/eSEXTBQtgbF56K
         L00lBGXRkDu1kXtrC8V52aB7nl4NGSMe/ECFcGJBLUqj3P0zOHgoX15nSeLjIj6MH26s
         i7sQP2zZbRhhvRRaEyooqgM0/v+UTFhEdBVM3+OyI5cNd2RLexEj/bT/4qvfQp6jdaV4
         /yCwFLvGOlqaVmaoK0k8qt2QUHUOB8JW55TzL/4RjdmO4E/wTVqNYjAd25XZ3VTuU0ps
         R27g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742205; x=1794347005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vUI4WubnJa1B4/84lLFCEDflaxOrnHrdNhUumLhC5ng=;
        b=udAh9b3fij399TrPOlQfUOblUcOeZaXCeIhwIWTuBnSuQNiPIj+lt8ZjMC+F8eSZ0R
         HzYqNHaGQoSGQYZrchj3lqkSJ2QY5ht43KeQWOHW9bGOQj6MBySvg/RRS0bltsbpMm3n
         gLsEMXEAxW5SZsD4supM5jWP0yG9x3qeFX6+6SBEDVLyig7chHg96WQgplYmC+c0vxrj
         m08LYcZj3yOdN0GUKCzvlUnw0buEk+b4hTNxsVOIFw44hz9r1PYkyh0EGjqO5NZ1cJZ6
         n+rsLz1MNTJ18+4xu7JKVeenSJHKLsnv6dBD4ORaPHq2fLUBuu46G0XO1ImSlBjxsnXR
         aGwQ==
X-Forwarded-Encrypted: i=1; AKwUvByQhUAZCZcYcINgf1v6C05uwhb9y2YPUg5ypRL1AmYuxgb5/xiPA/DJ4Lw4l+nohgV2G323lnN4Lu4XNSM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JOmjNmkvddaXaITF4JhXOZ95CxH+TV3tkcD3Xg8FF7pI4fzky
	4Oa2O21rWnyuzP7Quj3s9lpozgR8tSEMnxh9544u4QlYHxu59hjXwuNh
X-Gm-Gg: AYBFou2/BQOcYxRSqCrTAakIOrmqg6n2mYS2CqgkBeID60Qe/+CHEx3u6tTh3ckiItU
	srZdOoVskmEtIgD6uqrxWpMxDnP/YRy8IxlRmkYbB3+BBa/P0qVSyfdrW9Qu48eycjNL40UhUtU
	9GAJ6PHDUnB9G9PMIsLoRWoMWSK3Uaczu3Cb8gqKvc0dM/9AqTFbr8q7pNkRXeas//IEJCuLHai
	zf/g+Zu3v/m28PJ2bjZ+aT0tiwu76z6eV0JwBICGVzc+O77lEdHoEgbW2FpKA1jfngPuW/gQVXb
	zNebmb+YE71s1xap+24/XpEQAFiORpM7sdZG4gMpFgNjndsfvv6v0fEnigzu/hCddSoaBIGgKAe
	Zda5bZZRrgYtyieLW4u5IOTadIoDT+foxqrexb1PzFMups4+7XhYhQkw0bLh0kki819TECf8vBO
	6T6CWRCswOnvGyi4Ut7v+nGQbOSt53J85DXxJmvntUTRs9b5x+E41jTcIzIIWX4nLjCOG5jB/Tn
	vrpyNlZzytbwuH2sjMjJmjr9gJpVthFzxJw2TVe+fAw5V8XDAvtPXZmbizx1JA12Zbcvokl8Waz
	RpLJMph9Xq0zo10Nsc4fUV+KrWrYl9yosdDrO+QUKGgxpDv305eESN3hvVlcLR0WJO4bYSI=
X-Received: by 2002:aa7:d901:0:b0:6b3:8456:e891 with SMTP id 4fb4d7f45d1cf-6b4d339252cmr8103106a12.6.1793742205577;
        Tue, 03 Nov 2026 13:43:25 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac5a2a6sm40550a12.16.2026.11.03.13.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:43:25 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH 12/14] alpha: use memparse for memory size options
Date: Tue,  3 Nov 2026 22:35:18 +0100
Message-ID: <20261103214120.1099893-13-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103214120.1099893-1-linmag7@gmail.com>
References: <20261103214120.1099893-1-linmag7@gmail.com>
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

Replace the private parser for mem= and gartsize= with memparse(),
preserving page rounding. This also accepts T/P/E suffixes and uses
memparse()'s saturating overflow handling.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/kernel/setup.c | 24 ++----------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
index 4cbcfb1852d51e7aaf37b01a176f4a4280af6dae..28387786cb9f9ad4b587a22a3b0267b825b424c7 100644
--- a/arch/alpha/kernel/setup.c
+++ b/arch/alpha/kernel/setup.c
@@ -241,26 +241,6 @@ reserve_std_resources(void)
 	for ((_cluster) = (memdesc)->cluster, (i) = 0;		\
 	     (i) < (memdesc)->numclusters; (i)++, (_cluster)++)
 
-static unsigned long __init
-get_mem_size_limit(char *s)
-{
-        unsigned long end = 0;
-        char *from = s;
-
-        end = simple_strtoul(from, &from, 0);
-        if ( *from == 'K' || *from == 'k' ) {
-                end = end << 10;
-                from++;
-        } else if ( *from == 'M' || *from == 'm' ) {
-                end = end << 20;
-                from++;
-        } else if ( *from == 'G' || *from == 'g' ) {
-                end = end << 30;
-                from++;
-        }
-        return end >> PAGE_SHIFT; /* Return the PFN of the limit. */
-}
-
 #ifdef CONFIG_BLK_DEV_INITRD
 void * __init
 move_initrd(unsigned long mem_limit)
@@ -486,7 +466,7 @@ setup_arch(char **cmdline_p)
 			continue;
 		}
 		if (strncmp(p, "mem=", 4) == 0) {
-			mem_size_limit = get_mem_size_limit(p+4);
+			mem_size_limit = memparse(p + 4, NULL) >> PAGE_SHIFT;
 			continue;
 		}
 		if (strncmp(p, "srmcons", 7) == 0) {
@@ -499,7 +479,7 @@ setup_arch(char **cmdline_p)
 		}
 		if (strncmp(p, "gartsize=", 9) == 0) {
 			alpha_agpgart_size =
-				get_mem_size_limit(p+9) << PAGE_SHIFT;
+				memparse(p + 9, NULL) & PAGE_MASK;
 			continue;
 		}
 #ifdef CONFIG_VERBOSE_MCHECK
-- 
2.43.0

