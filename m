Received: from mail-wr2-f14.google.com (mail-wr2-f14.google.com [74.125.225.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AEF35C693
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 19:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789845768; cv=none; b=l8loDIo2KQFMq10m8Zffe7khxhLce1GQZnrxKOGtRoua2fegwKTfOAtw+pKx7gkJqW0sK7MjjHDZlPoNDowEBm4eEGgKnzNiwr8TJ6Vjom0H9lbIp8a33ezL65deQTuaK9IX4o0mDPvRQMyQINk0Vzp1myuz6x5qsuXJrWhEA7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789845768; c=relaxed/simple;
	bh=KdA7cGRwAxWoJkmRE6AukygfZZOpTRPrEMpn/8/qM9o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cOcNSJorM44TCfMLdQkXkJC0uoTBpSeL0jkSq/kVTKHrXlTTYM/1lAUkFqmKECkA+VDO8riOv0ouzmD8/LtFnxeF89XMQDHNJ2fLzbyZWOiSXbmoO0emuZ8bj4rc6GjGA/uUY29oStm3e+ykwFYfgQ4XWNdKAc9BSgGLrSG+ewQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cnyVGNTy; arc=none smtp.client-ip=74.125.225.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cnyVGNTy"
Received: by mail-wr2-f14.google.com with SMTP id ffacd0b85a97d-482f6350f88so1059257f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 12:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789845762; x=1790450562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y8bMzTcIlQ0jv0JIoHF33vifWOPJhpDzKzOKxwrvPdU=;
        b=cnyVGNTyiduz6XnswPmc9M88d2tAhhnhjZAojqny6aarMyE5r3gTbIXPtJ3WqVm4/e
         FkqFxWbr63y3vANQqbL+6sFXsmJJw8b6M7j+uFuxDf/QbfdtdoPhK64CU3IychXN8SUs
         xGeCIv6TayotW2wNeUxpBwPlSwdhKvk3NeLcFfXBraWqcnstGz7hxZEGPAmeqEyhKac1
         rAGeV3mdtixCHUcF3pBv446/qqBD/kRDUSThgNJXFKQ2Oq/kLGeHPDjIygKMSXAGyR/O
         sweYVAKwOCQOeMI5T7SOcNNkZLBZyjAaBJzvIr4yBDDpQ2Vp74oRNkyEGkC6YuM/ZNiF
         GWNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789845762; x=1790450562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y8bMzTcIlQ0jv0JIoHF33vifWOPJhpDzKzOKxwrvPdU=;
        b=Ewc8i5fjGmicYPD9KBVH7nTp8IpnSXljYD5P6vekkiWX0uYM9BfNvcCapmdGna3LFl
         MShL/PiiYVKgxLGUnz6/w8HslCTW3rIt+UjjgoJVp56ZzCESE2uskuVMreThkQtmek1R
         5c87/ijFNKQVXBN82gm3DL13tVuG92VYgF4c7a9JRZevS02Zum+d0DhBZv95eGyAPPpx
         wIewToJ7vkLP4T3nMGj1qk2feGn4InW3x03jzll5gE++36nJiV9qglRp8BmxTX32mE1R
         F0VxUEOph0Sm2oyZiA7511OuVAYx7/dKyz7CqzAogAMoXj/EGl6FnH/pOWRr7Udq2aPN
         4jmQ==
X-Forwarded-Encrypted: i=1; AKwUvBzsYLaPj4Az1UhUgU6KfcQVheMVyy5ruFylWUK1Stwlj0WvVqU2sgrJf0wPFHx34nwqNfijz1fzzLmrC7k=@vger.kernel.org
X-Gm-Message-State: AFuF++khppRT3SFl/GZ2lo6M/FZIKAK+ZLEMdPX8QMZTrMUc5LoQCCLH
	4MnIR+zfRLfiubZ1hVW4jIAWNjwSLyfvq1HZhkD/UB5UJwCy+IUWN41h+OEveE9l15Us+DpuZ/o
	=
X-Gm-Gg: AYBFou2gZWxXQYX2TL3rr7NT43Y/6sJ1xFCgOFtePC+n61vtkZ1sHBvEwRwhd4VzKNM
	uIQNgnebyR8nUDzrWnKBmLeJ7mgZR+h3xuRi5eloHpTnXJ3iracSvkq807J6s/GLBbLhT81dYTE
	ghIMpGt87pM1OXa26i4kH9+HMWN6Dx6vHNum14+RgCmfofGY4V1SnindcS2cOYmOj/2YI87tERC
	+seRLWMpq9bl8dC0j7CpNIwqPHUfRdArhrbcnzDZzwYASttFt1CEosdnY6wjWAycZ7gm6IK0wcK
	wwtX7wn8CLbtrZhMVDV95VphmOtipfcpvJcV3Mswy4rZ/y26zIdoUjuQm5gxiyTMraYBwOZZ5Hh
	YiVL7u+0IqSuFOkCH3MEAktdwAlTldYrl4Hn40FFRjH281VXm5HaowtBCy+RKkXCcmIHzDCNcg4
	88NZLoSdKkE2ZkONJqIVrPUrzlQS3W3g3H4rEkPf7fxlewCwgS5Dual2WN9dZ0BTLr0dhhZk8i9
	hUerAimM87l+ye2I51wihrqHXhQTlvLqBTv2DAW+N84iVWkmGk=
X-Received: by 2002:a05:6000:27db:10b0:487:218b:bbb0 with SMTP id ffacd0b85a97d-487218bbf19mr4960876f8f.42.1789845761595;
        Sat, 19 Sep 2026 12:22:41 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724460753sm9471875f8f.10.2026.09.19.12.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 12:22:41 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: lachlan.hodges@morsemicro.com
Cc: dan.callaghan@morsemicro.com,
	arien.judge@morsemicro.com,
	johannes@sipsolutions.net,
	ayman.grais@morsemicro.com,
	andrew.pope@morsemicro.com,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH] wifi: mm81x: check bytes_remaining before reading delimiter
Date: Sun, 20 Sep 2026 00:22:31 +0500
Message-ID: <20260919192231.272078-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mm81x_yaps_hw_read_pkts() reads a full 4-byte delimiter and then
subtracts sizeof(delim) from bytes_remaining on every loop iteration,
guarded only by "bytes_remaining > 0". If 1-3 bytes are left in the
window, this reads past the end of the valid data and then subtracts
4 from a value smaller than 4, driving bytes_remaining negative.

A negative bytes_remaining then reaches the total_len > bytes_remaining
branch, where "bytes_remaining" is passed to memcpy() as the copy
length. Implicitly converted to size_t, a negative int becomes a
huge value, turning that memcpy() into a massive out-of-bounds copy.

Bail out of the split loop once fewer than sizeof(delim) bytes remain,
the same way the existing "end of stream" check bails on a zero
delimiter.

Fixes: b1906cea00b0 ("wifi: mm81x: add mm81x Wi-Fi HaLow driver")
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/net/wireless/morsemicro/mm81x/yaps_hw.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/morsemicro/mm81x/yaps_hw.c b/drivers/net/wireless/morsemicro/mm81x/yaps_hw.c
index 3d641d23c35b..e1102b8fb802 100644
--- a/drivers/net/wireless/morsemicro/mm81x/yaps_hw.c
+++ b/drivers/net/wireless/morsemicro/mm81x/yaps_hw.c
@@ -486,6 +486,9 @@ static int mm81x_yaps_hw_read_pkts(struct mm81x_yaps *yaps,
 		int total_len;
 		int pkt_size;
 
+		if (bytes_remaining < (int)sizeof(delim))
+			break;
+
 		delim = le32_to_cpu(*((__le32 *)read_ptr));
 		read_ptr += sizeof(delim);
 		bytes_remaining -= sizeof(delim);
-- 
2.55.0

