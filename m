Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793614737;
	b=jYoxa4DGmE8oBGMyMpdKMT9eKO2uMUzD6+IQQUb6tI4/CC5gf+E9rTFWEGb/XWmWon3B
	 CCDHO/FmLcylAkKFkswMhQ1Mpf28b3g7RtFY6a4ZLX1K4bRqG3NEiXHqJXdnO3mSHpnno
	 ykvnto8Y+uRJf++DkkGI/upMniooCg3zPTOqdjt9J0td2dX3m/OCDSBnMZfaK/G5qnXRo
	 47ZqunHRe4pxbnRuuxSmAykgC724cII1Jlqv+cOZX6ha/7YXbWpAHU+8J9Ugj+mkJoucm
	 tynuOJlGDbq/kS/v4as8sy1ymnPZfd5Q3Wn76yylMhg3HlqleG+JW5+X/uPrRtVnFZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=8OBOniiOD3/1mcF69iMSsD8cgqxrlh2JCSuj6D5fJsM=;
	b=pWeFYwaYDZSnLv7qs26LzV91uprjyuopffOZOPFk7pCTLkl0GB/dvQo+AdYJwsmJ0qOI
	 s6yJdrhwuUnKx4sqEeD1gfIBeOd95NE9nIDI8W2ZQ9gyXw8m3PMzLuJ/fCOib2kKQZ1W9
	 g37nNMc5dpAM8Cen3lssQnWKtDT8FclVBgqn8aKbI7KZVPiHinq3/FnJY9WQTERwDVZEN
	 AjUD6lmq9m4eZ6SIEdAz0pQR9shFaaUrt718R4BPnYWY8dXeb5w4/D4E2kVWLo6XAAPOA
	 zPx64tX/GxGdOu9Q4Due38wNO1eytOOThgggqpJZ2P/Xm38LAq4K3NB5uR4bX58Nu/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XxRdv5SA;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B6260A2611
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:18:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53B6260A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XxRdv5SA
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so17854465e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793614736; x=1794219536; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8OBOniiOD3/1mcF69iMSsD8cgqxrlh2JCSuj6D5fJsM=;
        b=XxRdv5SAPtprMCixlSykpa9IdCsjIms0i58gM4n9WkmvL8mJ5T7nTQXKs1RGSXZyiN
         yxa/3V7py96cIQ42Lm0vOJBL2LtKqssWb1eSYc9jZmdHxsBDxBc37uYMA/D7P0ZRYn6Z
         lXQI3lnIz2AFJSE4tYTHitTh2GQYrXXhlQRCPTaBsYfV/Tx8DEcDVgyYB5ep45hw24KU
         XpY+P/OTW1FJxkURBHhTBEBWxC9bpjeW6V/X053l5mcsQ5hi/5wMZQDl9kVnGw4FEtSl
         /ZM9mLhndLMyxOkTYUYXS5yQRpj4sKAT8i3hSej5+PF5oW31Kyo6c0SuJg5/g4i/Q3m3
         ODzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793614736; x=1794219536;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8OBOniiOD3/1mcF69iMSsD8cgqxrlh2JCSuj6D5fJsM=;
        b=tlcg5NgJfVW8wi/EDGk20lLTCge3CmTK1csB4ZrCrDUtP639uCVzc+WfI4WVEWTJUu
         oTA9cRVyMpQ18Vg2McilkkZbH1fPlAarzxNmirQZ1snCBX89g+41ZGcN+8rYndJ6pFHw
         iScyuUEOjD/bKklEPxk820umFb/AuJzo2yQg3gJMOU53p2VKet9aXmhPVEslov3iBfZU
         w+CFzMM4mGCgon1YbUNb40bcXdQ+VYzH7eKA8yYRmT/EvjknpLvlhlXGHlJr9CrT3wsp
         2HsCyd2zc5XUp96/l5/JWp2w35HcbKWt9812dJEHYtO6UvK9xKqIwdNDjbKslZQad9nz
         Ebmw==
X-Forwarded-Encrypted: i=1; AKwUvBxouy2V3h5kgKjXxYo9JRolbsu7aJckWucwxO3qjZu4y8Kc8fnjNdR47YgQW9jruYgA1XihIe/0MZ71MJE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWdxBF8XW7MoUJEb8MM2HKShnd9UNLq3z+1EB2lHKCyvCX+s+Z
	16DWDdnVAIuKPTIxaokVaxPWsNe634VvcFINOvSHjOpxBb86DEmPcPL6UU/VFZHH
X-Gm-Gg: AYBFou1Hcap6npsPgoMkJIHIqsCLe3n1nmQyOPLoCm4eKGr42O4MxRfic/4LSeP3FtJ
	/l8E+TkvaY3vwOYtTIscdoFTaIEFjQPfotNCfNb0MpevWTrzjJbgvH/sFB0qDVI95NkJpPSfMo+
	IBoQPjWTgGag10oDFxnEJ8YY3iBLJeqhR3L/VhjkhlXmzj8KFAPJ+yFqS2O/IyCQ/G1+bQmpHZ8
	21FC4u/mUUm9oYjoiNSj9zdoBpgGyvR/h2YnkBLUi1pf/sshmSXm0EdUsb9/yeVRcEsIVAl1shV
	Ik1CC1p1BfemdkeJsxNHenhaFeu8vatOuJdMms5JNhr0vUBIGBwwtBiEDwFQr8nmmi3ix1biey1
	tLln7+Gqdr+oVL+ArA9HABkdaZiQz3+a1tduYkDAazLvSWoSJNsGYIrF2K92qLMHqJjWSyuBu/3
	5GHhqRyP45ZSiuYJ2+RUzxcHtJS2tYo/Lx6YhouQAVXRc7jPlerz+LD55+IHTS4vjlQHFDTvm4l
	9JXtfc56R4ueTICwz1CdZG+SNPdlgn7SF2mMEyzQ/eaSgCzSJJp1Se0CSAwLasqMCkxNvoRqxIG
	q6EGS85eliek1GdKZkAZphkXvRZqOSnAe9qLZdERqgY/mRJiWi/ZOPqhDtluL5ayvN2YYT2P9sS
	7XrkM0eej7Zubb2Swk+ZlfIQudofs+jvxXBLyA6dy4pVLWnGjKrApj+G3UHo1X0WY5QB+hE5C
X-Received: by 2002:a05:600c:350b:b0:4a3:2f35:38aa with SMTP id 5b1f17b1804b1-4ac1932bac0mr190329705e9.29.1793614735583;
        Mon, 02 Nov 2026 02:18:55 -0800 (PST)
Received: from localhost.localdomain (80-108-121-211.cable.dynamic.surfer.at. [80.108.121.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f322c46sm321930265e9.2.2026.11.02.02.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:18:54 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 02 Nov 2026 11:18:53 +0100
Subject: [PATCH] drm/etnaviv: Flush the tile status cache through both the
 PE and BLT
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-etna-pe-ts-flush-v1-1-e4454ed86f85@igalia.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MSwqAMAwA0auUrA30A6JeRVxUTTUgVZoqgnh3i
 8u3mHlAKDEJdOqBRBcL77HAVAqm1ceFkOdisNrWxmiLlKPHgzALhu2UFUPw2rjajW0zQcmORIH
 vf9kP7/sBFDvhz2IAAAA=
X-Change-ID: 20261102-etna-pe-ts-flush-ffa01363b98c
To: Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Christian Gmeiner <cgmeiner@igalia.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3

From: Christian Gmeiner <cgmeiner@igalia.com>

Since commit f232d9ec029c ("drm/etnaviv: fix TS cache flushing on GPUs
with BLT engine"), jobs on GPUs with a BLT engine use a BLT command to
flush the tile status cache instead of TS_FLUSH_CACHE, which is broken
on most of these GPUs.

GC7000 r6008/r6009 and GC8200 r6401 are the other way around:
TS_FLUSH_CACHE works, but the BLT command does not flush the cache.
The vendor driver handles these GPUs using TS_FLUSH_CACHE, but the
etnaviv kernel driver has no way to identify them.

As a result, dirty tile status cache lines survive the end of a job.
They are written back by the next cache flush, using the page table of
the job issuing it. If that job belongs to another process, the write
goes to the wrong address space.

On GC7000 r6009 this causes MMU faults and GPU recoveries blamed on an
innocent process. I see around 1100 per run of a multisample
depth/stencil test running alongside two other GPU clients.

Emit both flushes at the end of every job on GPUs with a BLT engine.
Whichever does not work on a given GPU is a no-op. Since dirty lines
are only written back once, this costs one additional state load per
job.

Fixes: f232d9ec029c ("drm/etnaviv: fix TS cache flushing on GPUs with BLT engine")
Cc: stable@vger.kernel.org
Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_buffer.c | 40 ++++++++++++++------------------
 1 file changed, 18 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
index 03b2576af67f..99c91a9eecf1 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
@@ -168,6 +168,17 @@ u16 etnaviv_buffer_config_pta(struct etnaviv_gpu *gpu, unsigned short id)
 	return buffer->user_size / 8;
 }
 
+static void etnaviv_cmd_flush_ts(struct etnaviv_cmdbuf *buffer, bool has_blt)
+{
+	CMD_LOAD_STATE(buffer, VIVS_TS_FLUSH_CACHE, VIVS_TS_FLUSH_CACHE_FLUSH);
+
+	if (has_blt) {
+		CMD_LOAD_STATE(buffer, VIVS_BLT_ENABLE, 0x1);
+		CMD_LOAD_STATE(buffer, VIVS_BLT_SET_COMMAND, 0x1);
+		CMD_LOAD_STATE(buffer, VIVS_BLT_ENABLE, 0x0);
+	}
+}
+
 void etnaviv_buffer_end(struct etnaviv_gpu *gpu)
 {
 	struct etnaviv_cmdbuf *buffer = &gpu->buffer;
@@ -191,7 +202,7 @@ void etnaviv_buffer_end(struct etnaviv_gpu *gpu)
 		unsigned int dwords = 7;
 
 		if (has_blt)
-			dwords += 10;
+			dwords += 11;
 
 		link_target = etnaviv_buffer_reserve(gpu, buffer, dwords);
 
@@ -204,16 +215,8 @@ void etnaviv_buffer_end(struct etnaviv_gpu *gpu)
 			CMD_LOAD_STATE(buffer, VIVS_BLT_ENABLE, 0x0);
 		}
 		CMD_LOAD_STATE(buffer, VIVS_GL_FLUSH_CACHE, flush);
-		if (gpu->exec_state == ETNA_PIPE_3D) {
-			if (has_blt) {
-				CMD_LOAD_STATE(buffer, VIVS_BLT_ENABLE, 0x1);
-				CMD_LOAD_STATE(buffer, VIVS_BLT_SET_COMMAND, 0x1);
-				CMD_LOAD_STATE(buffer, VIVS_BLT_ENABLE, 0x0);
-			} else {
-				CMD_LOAD_STATE(buffer, VIVS_TS_FLUSH_CACHE,
-					       VIVS_TS_FLUSH_CACHE_FLUSH);
-			}
-		}
+		if (gpu->exec_state == ETNA_PIPE_3D)
+			etnaviv_cmd_flush_ts(buffer, has_blt);
 		CMD_SEM(buffer, SYNC_RECIPIENT_FE, SYNC_RECIPIENT_PE);
 		CMD_STALL(buffer, SYNC_RECIPIENT_FE, SYNC_RECIPIENT_PE);
 		if (has_blt) {
@@ -400,12 +403,12 @@ void etnaviv_buffer_queue(struct etnaviv_gpu *gpu, u32 exec_state,
 	return_dwords = 7;
 
 	/*
-	 * When the BLT engine is present we need 6 more dwords in the return
+	 * When the BLT engine is present we need 7 more dwords in the return
 	 * target: 3 enable/flush/disable + 4 enable/semaphore stall/disable,
-	 * but we don't need the normal TS flush state.
+	 * on top of the normal TS flush state.
 	 */
 	if (has_blt)
-		return_dwords += 6;
+		return_dwords += 7;
 
 	return_target = etnaviv_buffer_reserve(gpu, buffer, return_dwords);
 	CMD_LINK(cmdbuf, return_dwords, return_target);
@@ -422,14 +425,7 @@ void etnaviv_buffer_queue(struct etnaviv_gpu *gpu, u32 exec_state,
 				       VIVS_GL_FLUSH_CACHE_DEPTH |
 				       VIVS_GL_FLUSH_CACHE_COLOR |
 				       VIVS_GL_FLUSH_CACHE_SHADER_L1);
-		if (has_blt) {
-			CMD_LOAD_STATE(buffer, VIVS_BLT_ENABLE, 0x1);
-			CMD_LOAD_STATE(buffer, VIVS_BLT_SET_COMMAND, 0x1);
-			CMD_LOAD_STATE(buffer, VIVS_BLT_ENABLE, 0x0);
-		} else {
-			CMD_LOAD_STATE(buffer, VIVS_TS_FLUSH_CACHE,
-					       VIVS_TS_FLUSH_CACHE_FLUSH);
-		}
+		etnaviv_cmd_flush_ts(buffer, has_blt);
 	}
 	CMD_SEM(buffer, SYNC_RECIPIENT_FE, SYNC_RECIPIENT_PE);
 	CMD_STALL(buffer, SYNC_RECIPIENT_FE, SYNC_RECIPIENT_PE);

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261102-etna-pe-ts-flush-ffa01363b98c

Best regards,
-- 
Christian Gmeiner <cgmeiner@igalia.com>

