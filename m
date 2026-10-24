Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792862822;
	b=enThtDE1qOXPVbayncaJfpXf3b+TLITlcpRyq3e/oAy68uQUf0Tw6450XdUx8LzcjZG8
	 +XkbQclyemKQ7tMHDERO4s/xBJlEcgdIykQbpaNSzMCljY6cousYrVipI8DTfRqb2X/O4
	 i71sK4WvDhcII7CzAECO0RIz4q2w3BOFd+7/TdEIKjZAAh1gLyqOL1HFEx5X3PQJw61Wz
	 vgmn2Z/tT81J3iX/PO0RnrZljQNEV5lhrCgLk4qy1h5ZoLAf41Q2EvdaF1/8v9bTD6TG4
	 EP+mYMyzRrTqCbRsWhzEEmHZGNOYnvQ5CUmDgCtIfM2oIqmYNVbMevn9h1m0VMLD7/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792862822;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=kEYtLwxZwrV359NviA74b+mH4aeRVHvNjyPhEsl/qZ8=;
	b=Dnv23neN1Rx1CETVWLyuiKZvNb3m9vJ1yaVCPUXKYCJTuPh6cKjp70x6OOyfILPM6abj
	 dMJse+uYf1JPj+ymkv5IbOazKsDqRAKl4/If7ZrzWfOLvebsp7utexxWwvZzuy7cfPpZm
	 jgNihDl5ZNQ779rGEentHmbBvO+kgR9xtnDjBJVmT+8w97gttU7f1rVq8iPDyJQgR3Mp2
	 3gML5VGPMNU7ajwFlFu4jr3ua4Bh2bYFvDl83jh6Jt1s6QnyUuD/bXykk5xugAw9Ccnlu
	 jzeHRM0EOGbIcMSorul/6YDsRPjthF2vNUQn8ceSA8x2jLqumdRisb6faWG0WQShKYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SLGzCCFX;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD2D606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 17:27:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DD2D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SLGzCCFX
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a214af2076so11476255e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 10:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792862820; x=1793467620; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kEYtLwxZwrV359NviA74b+mH4aeRVHvNjyPhEsl/qZ8=;
        b=SLGzCCFXwEzIPp0HYrwFsmH1nScgGkoGYiTu2ZDnCmgW1A76aweYx34KZTSjMDJ677
         luC7x5od955083hP9Iiu49BX3y5ihxgWXuQO042HOd79UUdV0zmTm6YFyw6lqeJZvGhe
         BAjA0qfFBKYZqZiK96CR+v0g942HSiEKj5tpP1WNgRXIPcCuh20/VClnVLR7tZK1ANpR
         XQzFGeqmJoRUF8rvDYC+gBqzSqb11ErCI91seBMYrlEysiZh8MF5YxNKrt5V/5vH+Ud4
         FI7FrJhahEx1wQI/KW2P4x3JlDqTyhWv8a2vJROBw8ouoGWnNpg57LSWvTK6wDVMUiZj
         i1xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792862820; x=1793467620;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kEYtLwxZwrV359NviA74b+mH4aeRVHvNjyPhEsl/qZ8=;
        b=nGRiXYITauf8VNZWP/oNqkM58BddDK3GEz6mkSdiZeTIMHcfXLz/uoWrJ0NpK77gQs
         FfQ2kPdJxLGJQ7tGS4SxnEwGknFGNRFFElvHZvUDxTRpJcsJye8fqvIv4YEpafHCm3bl
         V8v4G5f7DMLDACZNyKCN0G32zVcD73SXPsAOySDQDgj6smrqZJkqCc8izBXcE3PExMhN
         VmmH6FpEt34NEgd+v70w/Kv9NjIt4Nh9KxuGQxooBaRgkChq7HWeslhmxMiuqLW1eoMh
         nkNhPMYe5ulgzHbu2U7fz0ktjobRU3AqPlpO0EBgHf4mE0rBbphZgbDLCXBXQBx+V+sI
         Yc4g==
X-Forwarded-Encrypted: i=1; AKwUvBznHcyU6DhuMp+Fh57NwO3rWQPEtl7P0LNvlRIt0Exq+m12Ag6+vOTwzQkjeL6byxx86tOGLsRtpgb/kZU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+TPOvuAQQnMBe7Ng3y3HtGo5a/cRT8oMuEfrJLxVmL5jhLcgy
	tvW3ZRFedJxFHU4LM6siJaSwONh5bPIv8i2590OKSNg4ZrZPf/V/O4e9
X-Gm-Gg: AYBFou396okRO7+AxqtqLnfUEhChhEHCVtVSH7AQYwfDAvAVpq5FRIJ9gJsgyBv4UPZ
	HrgwHPVcE7QY6wxzlzvH+iJJNYFwNCBUryAj7nLjgLKJi8yVBFhiM92ttOYhUcbSfrv7fhS1MF7
	Mwv3vF2BMIPwmNTf0HbBucSJ04VoOvX2gI0HIpZn7p4KZte932mwAAAAl8WZVEJihMe7qABBIRQ
	N4ui/2rKUeU6dXNb+FFe6vbRoRHMH+6oHqV0zRuJslG5lT2HU9aiCOAgwcRavOqmE94zebhDvTU
	zA/MEYBdayey3Ee5JVC2xLC5tKs7CmLDu6ENoxtVZWIcaWHVBDzCVtN4O4asDDoJgRoPgJpY9Va
	Bf6GILfjI44KM6aZvgqqvt+5V12X17i97qTjVCao3chOHIVbr8cLA/xYOAJ89NDxeIAFaEZ2GIJ
	XLATvjfO2JVirEuRn2qqZx+2H1W720SrgFEfhCMsZjNyj9z7gNB+jV1uvIHA1mnBA9F9tQv9+BA
	EPp7GlckP+SzBO+4/iGfqSxgW2TlspEnMmM2k26nezMpo+ZvIfV/owjrwzRZLOskyKM5DfbhoNx
	bHej79Ws5xSC7JJLnuCCTmy2lVE+wf69
X-Received: by 2002:a05:600c:c173:b0:4a2:191f:7cbd with SMTP id 5b1f17b1804b1-4a35ac8bbd5mr40436765e9.11.1792862819430;
        Sat, 24 Oct 2026 10:26:59 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359fc1207sm52573855e9.1.2026.10.24.10.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 10:26:59 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: jorge.lopez2@hp.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: andriy.shevchenko@linux.intel.com,
	linux@weissschuh.net,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	meatuni001@gmail.com
Subject: [PATCH v7] platform/x86: hp-bioscfg: fix heap OOB in hp_enforce_single_line_input()
Date: Sat, 24 Oct 2026 22:26:41 +0500
Message-ID: <20261024172641.19424-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The input is copied with kstrdup(), which stops at the first NUL, but
the full write size is passed to hp_enforce_single_line_input(). With
an embedded NUL the helper reads, and can write one byte, past the
copy. Use strnchrnul() so the scan stops at the first NUL, and return
-EINVAL for a NUL or newline before the last byte.

Tested on HP EliteBook 840 G2 (Fedora 44, Linux 7.2.8): writing "A\0"
followed by 4093 bytes of "B" to current_password 100 times returns
-EINVAL every time, without reading into the heap.

Fixes: a34fc329b189 ("platform/x86: hp-bioscfg: bioscfg")
Cc: stable@vger.kernel.org
Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
Changes in v7:
 - Use strnchrnul() instead of a separate NUL check (Andy)
 - Drop the trailing comments

Changes in v6:
 - Return -EINVAL on embedded NUL instead of limiting the scan (Ilpo)

Changes in v5:
 - Limit the scan to the string instead of copying the input past its
   first NUL (Ilpo)

v6: https://lore.kernel.org/all/20261016025352.230535-1-meatuni001@gmail.com/
v5: https://lore.kernel.org/all/20261007134711.473857-1-meatuni001@gmail.com/

 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
index 876fc35d035b..8873d91bc235 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
@@ -162,12 +162,12 @@ int hp_enforce_single_line_input(char *buf, size_t count)
 {
 	char *p;
 
-	p = memchr(buf, '\n', count);
+	p = strnchrnul(buf, count, '\n');
 
 	if (p == buf + count - 1)
-		*p = '\0'; /* strip trailing newline */
-	else if (p)
-		return -EINVAL;  /* enforce single line input */
+		*p = '\0';
+	else if (p < buf + count - 1)
+		return -EINVAL;
 
 	return 0;
 }

base-commit: 8667bd30fd033295b3038ce374c551d1059538ba
-- 
2.56.0

