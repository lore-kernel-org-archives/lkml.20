Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794821009;
	b=04u9rq/2cUO8m/x8WACBnGALdIP5GZ0Qh4s6eF6/wZYmjeVu2FmIp6Ilaee9LgOOSSQz
	 pPlR+04ha3o4AaWsI5AitTQU1xL2IXZf6USUhl29w9tnPj5j+uKq2TmCWlFNJoizj2ahB
	 9feAC8Ww0VYAUBQAZLe9E6j7IDu2SJrwEB4IKGk8jGamyCmo5wjCDBhiDsJJnU9Tc5yDL
	 e4fwLdQVEaKuX+bgclomqTKEYY1u8fbmMsiymSHiGDHZjdxUGvXFR39sEh+HRkped+4wn
	 6wL4OQHkevCyh/CPzeC8UgtO4cYQgH2DOLiuWaI+kL5cApbm8wvM6zDCFuB+CQoaJzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8Di33WShdwbsd6k1hBxIRZVPI/wZsEbgX0u8y5qE320=;
	b=XQ5B8gp6ZeHbaXcXTPM1L8uRM55a4Rd2ziSaXVUmkTkZcNM6kfC9cA0hcED+y1uLte0X
	 D+pcSSYg6dj8JvW/dUwGMr0w7/UNjVAo7s+80IAf5amVguE71+ctQwIr5RVl8a+LgqDXz
	 E1UG0vQ/FOIHON77aiZB1z/1ya2O5bzD6UnOPwPx7CPWQFgDI7EOx9AAi51L9qItNBVoQ
	 QJJgNtRH8gihTW/+zqPBehCObdC6cSRC0ukER2D+aqCwpFydBoO+tVjm5XFTZy1N5+ddD
	 xg4U5p7jb0nit/0Zbz6CCFhuFos0vRXTW+tpoJ5RxTbrsnSixMvXlYM2QK/Ms1X1MEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EyJdSiG1;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03433606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:23:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03433606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EyJdSiG1
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ed2b4348fcso10260005ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794821008; x=1795425808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Di33WShdwbsd6k1hBxIRZVPI/wZsEbgX0u8y5qE320=;
        b=EyJdSiG1l2h+Qw6QXQI4AHp9x+efFXbaWsf23ACOXySlZe0TOjoqVsBCWPBsyBcoR9
         sf+4UbiR5nLb1kqDIoosl/P0PdpUpz1BE1aQRTu5bT7VlCCg4iXwo5j3Pltpl3HkuRo0
         GE8N+v9TgrxUzUfj44iac/geYD0aQ7juG2ugZ0HteyxOdyDfOzSDUa0vgy7a2E8t7Kt8
         P36kmyYTtmKnT7Tw1u6Hx5uAy4TmY/9GuYZ2u3aekdILN1fvCLzrC+AGDRB4GB4aeXmg
         aAd65yQ0dv/mxYlE8E+2Llj+n/z2yp+YtM5rf3OUKnWH+NhmDZOkqGcYAY01Z+kC96ku
         9mhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794821008; x=1795425808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Di33WShdwbsd6k1hBxIRZVPI/wZsEbgX0u8y5qE320=;
        b=vBWv7Xm09YmW3oBJL4LVHFovYbCnPmil1R6FoIoIMjsZ8+cTmij0MnmQCooYHo0zKT
         x9hEvfRxIdV1weHfl52KsQ+7kjGKB9i1m+oJbdJ5Ftb7HIhLvRj59DTcFaSSld4KU7j7
         ETzlR5dDnxwlqNza+KUKH3Li1ul+aO3tnhShCFO2Lj+tnKxkL6FbrPbo4MZPqj1zM0eh
         nG15gfZs3nM3nzrOP8y8z1uMpuIOMqmEnVNPX1/YyY/9uup4a0l+oLge5Fxrim92Qjde
         Z3GgzujimhMoD/andi7p9ZRZkOSgqF+oWMZdLVdrTYt9izYA/n8kkjp9WOv+f9L0h623
         VlcQ==
X-Forwarded-Encrypted: i=1; AL+hErFRrGYVecYfs6lvHvpytLA73BsTBjvupij1znub50Dowb1NGsuH6KaiKEODlco8gzCgmywxSQPkPc8I0No=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bKNxM4zPOP/khUJOgWM9OzbqIEj355GU4Qr9Zb/vBePuMR3u+
	3+jAKVeCoKkW+kwEhcVlPmXh6OklJCDglLxFaQOYnlP5s1VDRetMDFn9
X-Gm-Gg: AZFdTZeORK700Vz4zPke31RsxwYkOsWe88vrWPs79SMM3Xm3pLAn3iU4l+nhic13zh1
	hUlK5bkCk3JzvrykANWTGSj553BUww3JY2gxM5qIfELwFK8tikWZqTP/IKDJ/XW0NJTkV77qav6
	TmfZ4w+LjqKtHYJoqB8TqdQcMvpsxJnKb3zuRvDFUoMFFs5xzNCcjGbZep6OjbAmzsv6szXzL1u
	/W+4x+Juo8nCT+salWGIwPxQ6XqROwASpZv+Amee+Ch2xZI8z3QVnnQg77qwFvuBoWxaZEt7TRs
	lQZaQQDorfjZiZIILYAnoRxVCB4IjWgGts8gPeIV3BPTdF2NxNnOuCI+iy1yNsAyen0CPsmDpoq
	h5MGw62koT/7pJUYtr0n6OVPdSqH7lhXJF/jW+Kpba/hEBUgBBaHutWbNsQuDg9pJ135D4twuhb
	bK6NQdI7ifXa0Wmlgsua+clakUGkv9chPEMETs5WwwR4giWglshmWyHlaXT8yQTW5M+6kinSFOX
	zDFu+v5Y9cXYhmK7rAMl54MEXrmxXNbZ0GaX6XyQApNNagVffFYVBcivxSQy/NJBdc8iq+a/xB5
	4/fONUAYZKlQ/avkh8M0D5Y44ws3HTQmVKyjtCo6nFWqX/3MnHi18w==
X-Received: by 2002:a17:902:e951:b0:2e5:54b9:6b5c with SMTP id d9443c01a7336-2ee0da98ceemr88257225ad.20.1794821007979;
        Mon, 16 Nov 2026 01:23:27 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:90a:5f11:9056:5eea])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f7d99fasm35015195ad.35.2026.11.16.01.23.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 01:23:27 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Po-Hao Huang <phhuang@realtek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH rtw-next v2] wifi: rtw89: update PN state only from correctly decrypted frames
Date: Mon, 16 Nov 2026 17:23:00 +0800
Message-ID: <20261116092300.20414-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
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

rtw89_core_skb_pn_valid() records the sequence and packet numbers of
hardware-decrypted QoS data frames so that it can drop frames whose
sequence number goes backwards while the PN advances. It runs before
mac80211 discards frames with an ICV/MIC or FCS error and requires only
hw_dec, so a frame that failed decryption still updates last_sn and
last_pn. Such a frame need not come from the peer. One with an advanced
sequence number and a PN between the recorded PN and the peer's next
one makes the check drop the peer's following valid frames until their
sequence numbers catch up.

Skip frames that rtw89_core_update_rx_status() does not report to
mac80211 as decrypted, or reports with an FCS error.

Found by code review and not reproduced; compile-tested only.

AI assistance was used.

Fixes: bda294ed0ed0 ("wifi: rtw89: Drop malformed AMPDU frames with abnormal PN")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Changes in v2:
- Keep the two existing conditions in place and append the three new
  ones (Ping-Ke).

v1: https://lore.kernel.org/r/20261115172754.35124-1-enderaoelyther@gmail.com

 drivers/net/wireless/realtek/rtw89/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw89/core.c b/drivers/net/wireless/realtek/rtw89/core.c
index 58ee5efc3b5e..ef6bb1a43cd3 100644
--- a/drivers/net/wireless/realtek/rtw89/core.c
+++ b/drivers/net/wireless/realtek/rtw89/core.c
@@ -3950,7 +3950,8 @@ static bool rtw89_core_skb_pn_valid(struct rtw89_dev *rtwdev,
 	if (!ieee80211_is_data_qos(hdr->frame_control))
 		return true;
 
-	if (!desc_info->hw_dec || !desc_info->addr1_match)
+	if (!desc_info->hw_dec || !desc_info->addr1_match ||
+	    desc_info->sw_dec || desc_info->icv_err || desc_info->crc32_err)
 		return true;
 
 	guard(rcu)();

base-commit: 5dbf2415ca9821a611d09308e3b29d2c37e7cd77
-- 
2.56.1

