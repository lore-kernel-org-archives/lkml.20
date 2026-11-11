Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794370493;
	b=K+fxPA4Iv7Z0oiflGkiobmbX8rN6+e5mz2iSAe/xVXmnaUrr2TKTMuM1urXorv4mmLHg
	 p+M0acLyc4iDYzOzcZU8JnGlG3nyDk6V5s9CkyK1JOZkC4zXp+x66CwAEQEWwZdfYtHv7
	 523GMGZuhO33saSfrPsSve6K/NAnRL115Dx+yzENBYCRRQoQCbjDcyWDA8vsSbPO9UVY0
	 NYm4/ArzIB5ZBxoWUKYa5mlXpSdnKmHLYaAesSeq32bU6KoClHg4oavMSJY+xmMiw3rVe
	 j71kAlM7/9s/ST+/tDSMfcMYsqelxasxli1fcvECh3r3T0TlXbvpeAonVofnhZuleiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794370493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6Jx0m1gR/D5Ve2Igam7P3jRhX1J0ZyZQYElBbHXWnmE=;
	b=42eihO4QcalA/bGtIyjnivI8HWSgBp9smhmeXg8dV9Pw/eRYd3Ne+WLTQa348wpv/unv
	 QYCfi4LNH5rCZB6GcJwQJbwXxE7pvPKgjR2CRwA9zDvfltmnXNief8MwTa2EkyqbHaUEl
	 2AMEdBeo1SlS/AoEIjvvs/tTLEomudT1rQfeW7b6NtDfXrYr0MvzzApY16THggyqbKgYr
	 6KiNAsc8UB4bOUmEeAq/7e4Hw6Ydurl3LPFUEiTwh5tuB0MXXOTE4kB+fRtXcu4kdlq03
	 0jXMvzVR6DzFwdVLOP/5ZyKgw9L1iSNZ5w5uanqsaUbRRiJepmKLQoPTmEioggNgKgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=03ydl0RT;
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731A5606A320
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:14:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 731A5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=03ydl0RT
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-53644b28706so40426181cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794370492; x=1794975292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Jx0m1gR/D5Ve2Igam7P3jRhX1J0ZyZQYElBbHXWnmE=;
        b=03ydl0RTCX3B6ITWY/G1RpQm6rply5nXPHjXFdECUKSjWR7H6xA5K8HMejxzjsYVRw
         FIE4Gb+IgGEvkoQp0ahkxjfSLfqEBA5piYMgXsc9gfn6REAcGNC7u6vBaT8cv0jjlfyV
         X4YMcecqJC7cv1WuBlcs5THWD7KjR+PLmYuA3+EzfnY6yRgLhf9SKUTc1rFPDiZhqzIk
         64JxUKAQxMDeGGm1nFLDqDBc7uL0EwcVJoouQjVUfFBs/c3MhAKNrPrBkGR8UYx2ZXxW
         IbKvxwjINumcStWCT0/Uobm2va2WpWKoC3QcuYlYrT7Vz1YYKQZquOROdXwfmnbxcAPN
         dJ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794370492; x=1794975292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Jx0m1gR/D5Ve2Igam7P3jRhX1J0ZyZQYElBbHXWnmE=;
        b=qGk8nMro6DRlLB4DLLp5tdnVlVrM3+HjVNse+/3D1mMcccsmsGcMbsnYj0bDUvMnRI
         yd37va/HvoBCbp2uM7/X01MydfGxaM+dOCTVuRLXA7/syPDKQGA0JVPvcZ+zCfnR33T/
         xeFCsbcvz1YrZur8JAgJA06D6Uz/GYnmLCtwuL6D4Arx7Zyky7xaD/NOHmU4rmE/YhGR
         Hv4m84aXPo6u7AKQPpmQl1LJ6eGHj+n0OPKl8aUuJ97Hvw3NsJ0FoceCxuKx849NCXub
         4q+bFqLFnwO9pRNDGokztOP9+hreu4je0WQI6hLwSzF9TSSK0gb6ILeySlSB3WIWTFZY
         qHgw==
X-Forwarded-Encrypted: i=1; AL+hErGwI3OfKX2YaesUPSS9oNJfCjAiBT42nk4Jf7EwvKWDeV4bWzZoRISHfV842jlgJVwtwerQeofn7ZZYL+A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/hWL6Erov1LCupFwcT2+VFwOTie/Shpp5A7zjdLDzIv4xri36
	Zj/rt0m4uEIV78zYlrcbQsesGPc+xOTlN3WolY/nr2E9vKHyJrAuljD4
X-Gm-Gg: AYBFou1t7HR+PkIqirQz05kjGH8hAFRItDe9Bxo7Rb0wyRCC/2x8dpATpw3MyFXGdAv
	PMJr0zq0cijVHVqa3YC94UhYEW+2RWS1+xN0vJ7yAMZVIYSDlaiUbHuN+rfDNMy8ENvkqBP8dc2
	TCYJLmgSAbjWXgx5pCrNbQMNNvmEp3uHweaO622pPK5a+uPgvyCkxX1Na4ePjgo99SCfLjfRi5g
	p0QZKsL6D6mIcQdFUpgyPFEVBgfCzqs1PnBmRNwL2DM+wsKHT+6NocHbvP3Jg6vMDoZu0iTPAE5
	7TwVmMZdn5Yi757wNkkVze18ODen76sC6x/AlThUqMmq7277BvErl4fCMkSPhct7MOOUPVSI5DL
	M/BdWTp+QV9e0qryDos2IGOMgMqoWZSgDbbtL45/l3hA5YU0b1HARXQqETRRECo6Lqc9O1uvWSR
	5qLdzCQo9a0LwVOnOSu1Q1r8sKUMmFd5OziF8F75ZWPFPy4HYy9CnjqV5b7Ms1o9mXBTXXcLhA/
	mOGxiVX68F3ilqlh+e8w7T5T/v5QpHdK82jXLWXkKKOV+JX4M196drf/Q5oPepHM0kWPI4HvypN
	ekGOrKPA9A2o1bCGxA==
X-Received: by 2002:ac8:5ac1:0:b0:535:14f9:3f03 with SMTP id d75a77b69052e-556c0205a1dmr17834711cf.25.1794370492247;
        Tue, 10 Nov 2026 20:14:52 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550b942e83sm40856271cf.18.2026.11.10.20.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:14:50 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH] usb: typec: Check the alternate mode ID allocation
Date: Tue, 10 Nov 2026 23:14:46 -0500
Message-ID: <20261111041446.3072716-1-lcy8047@gmail.com>
X-Mailer: git-send-email 2.43.0
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

typec_register_altmode() stores the return value of altmode_id_get()
in an unsigned int without checking it. When ida_alloc() fails, the
error code becomes the ID, and the alternate mode is registered under
a name such as "port0-partner.4294967284". A second failure on the same
partner then fails with a duplicate name:

  [    0.423055] sysfs: cannot create duplicate filename '/devices/platform/altfail/typec/port0/port0-partner/port0-partner.4294967284'

Return the error when the ID allocation fails.

Fixes: 8a37d87d72f0 ("usb: typec: Bus type for alternate modes")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Found with a static analysis tool we are developing.

Reproduced in QEMU (x86_64) with a test module that registers a port,
a partner and 63 partner alternate modes, and then two more with
failslab (task-filter) making ida_alloc() fail with -ENOMEM. Without
this patch, the first of the two is registered as
"port0-partner.4294967284" and the second fails with -EEXIST and the
error above. With it, both return -ENOMEM. Same result in three runs
each.

 drivers/usb/typec/class.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 54c7810b563b..29fb13ca9f28 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -641,11 +641,14 @@ typec_register_altmode(struct device *parent,
 		       const struct typec_altmode_desc *desc,
 		       const struct device_type *type)
 {
-	unsigned int id = altmode_id_get(parent);
+	int id = altmode_id_get(parent);
 	bool is_port = is_typec_port(parent);
 	struct altmode *alt;
 	int ret;
 
+	if (id < 0)
+		return ERR_PTR(id);
+
 	alt = kzalloc_obj(*alt);
 	if (!alt) {
 		altmode_id_remove(parent, id);

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.43.0

