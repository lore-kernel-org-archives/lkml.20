Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793526975;
	b=WSvNzll2wt2HtjVcqscEGeYAviu1DyRDk4O9bSwsNgj1FSHXE9g8DFVjJ+a/f/daXZ1t
	 nNnrIAGmwD8OIVkuEdGlz+uoXJHjPSncxBQ5pUTNULA0AIv3SR8UJBQuOjAY/x/LeEMPj
	 FDtjUOp1/Zv1tMV0D6OyZNl7Mnm3JNW7sj/5wLEeVqpWLmoip7XN54MySQXH217q5gT9M
	 eGpwrZIGpYRFYTyWM7liZnZTh+ZCjd3aLZx9OETOUkHsX+lFOKy6b772Iew9sRY03fzGY
	 qQ28xR40gVDlO68kZEzuxN36EEZUWp+y3jPs5FOOoSZxOgjhZEx15LLp1aIRMiysTHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793526975;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NH5p8XFReWk5OnsBbt0kkc9aNsHf1J+jU8MERKjpPV8=;
	b=IisLQJ3actJsxCjOlfdFMWbMEmNV8g5DXGl10OqIzWD5ZOrg/3t1XV61kP21ps0j/r5y
	 eMR6ap9N9szWSQ/G3NQYYydynNphbGMcEgzNn4m49rQ3A6KN85fkm32rkUwRZBr8nXLM0
	 EAyP53BhvzsxMRm57OOYRT25m5+Q26JAeya2X25eKdd9cz7QRB85M0W3U6/2ugthHG/zl
	 kz4GHha+RyqXHGUPC2R374qtoKK7taqGnLW2DJtqneI8aACZzbzlM1zXkPNAEI5rcPeO4
	 nM6PgSfgtLs/P9CJ/VMonSQe040REOh4Z3LJjssL3gaCmo/9buhD8MmBXXKsIm0HcrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OiuZ2k8N;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB12606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 09:56:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EB12606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OiuZ2k8N
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so16180905e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 01:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793526974; x=1794131774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NH5p8XFReWk5OnsBbt0kkc9aNsHf1J+jU8MERKjpPV8=;
        b=OiuZ2k8Nty9QXiv+hK5g5xqHwKvyHYAWajfx/ogxddLunB9wAG86yk4xr25486eIz1
         AanCsVh9mi6Rvj4x2ObUibUjDrveJjXVpQoeqJIqbFTgpnKh5Pym+1qmukG4yIQflwOd
         Jm3zTLFzuQBujsOW4uTUrx5oHyDQ2BKeRPkspC+9JKjTPz/hYT7G1jdRg5xmmeHMSJih
         8FTgn6VhpiBCaTGYpBFl2nt1+6BJ2IAKTstGB3NEltPh4MxRZDBw+xRVyFpGRZgHvyiK
         K47PYnV8xvLK/7EGDF2GLF7lQydGvngFE82N0vTfmVcl0hfrBQqdP3hNP3mRyTA0jNo/
         vypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793526974; x=1794131774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NH5p8XFReWk5OnsBbt0kkc9aNsHf1J+jU8MERKjpPV8=;
        b=JV4T11MG9ImCyRi8joNcorQ2aZEIwzkFkWUO4flqfwY8YLSfLdZY83PpKRqyGVc3p8
         8WkBPD+y+VOpALdmxsC8GXZKEmXJRRwAfaAsww+kBDML6Ni0wJ3WPLvgVzJQCQ4/gchq
         WcqgmVxf1LIP6d2CRvDFCDlZmrCnezFSobq1sCh6NsNzDKocfL6Wh2rclV0Pp7zjo3bj
         zE4ySjLDaRCof1gXYTOi2lHUWMqj1iyrbHhcPaTelECbamD+k93pIR/yzNJJ4HYf+74z
         8Xpfgu3AC6lP4v1Zzh+mziTVOLnI2m9F+pYmjJ+kG2+QwFfdP0xfz45zaKV56nVS2bPi
         LdJg==
X-Forwarded-Encrypted: i=1; AKwUvBwATYhJMx2582aTd7YyA3q7+7STu+xb4Oba/uqghbGU5uxg6lkJLyE59YX0mrjuUtsq1cK63MvrtwDPWpk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJC5rV9CtktnDLojM2cntueL7/gZPGrAmNnWtHAPlyNq9S9b3Um
	F/jzpcekbwlb+Gs4y4rFwPAsjBgk7tWNY8bDQ2tHL3qUHwo6D7SyFhze
X-Gm-Gg: AYBFou0nQuFGyzcMTWiddDfHbmjmq9m8lWCoNnOdWlN8K237aZzS4lE4QjuTOHGIW06
	B1Sb0cyFnyftT97tYlehcanaFzK688iQhzM1pbW+xw43pJMfEw0hpRTVIUgNmSEA9TxdSoBWCHe
	elorRIAoueKWb9zGQbqNgZsLsY+ZnovXz6q0vKtLJr39qj9z7c1enlEOZue8Ikxt5CKIBFlpZU/
	us+iRXs54vnrb//aIRqlLIdAzqBAJlwuyramVHBdrrVIUCSASqb/vj4SUt3Uv1dNx0Rrf0+enmd
	Zoo4vk3HZvWVG8VDWSRs7aQYmQxPe+95Ch6LU1M9yYAC7TzKox75sXUIpFcdRftzxFjAa5jDbYb
	O0XNVKeFC9oCVf0inPT3FsMx0kaXF8KblSmatjMWRv9+xZicC2D01EVN3RGIn1hMutoQEWg1n8o
	DcM5sBHQHZbS1iViMVAu8MnyK2uc5Zwafi1tEAmikKRO4sJieLAaSPxkm6kxKuxXGZU0rp//W8G
	62+Sz6oOO67ULegBYOD3aPFOvhFIhvzUXXZ5O6L8/1vg0jvS3pnRmRWobw9E7ijox4ja+BGOXLr
	3ZBDWLHUuVACyf7NQi58z2w2
X-Received: by 2002:a05:600c:8706:b0:4a1:e0d5:293e with SMTP id 5b1f17b1804b1-4ac1765d3ddmr174291005e9.21.1793526973501;
        Sun, 01 Nov 2026 01:56:13 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf67aa704sm179893505e9.8.2026.11.01.01.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 01:56:13 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	kernel test robot <lkp@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH] clocksource/drivers/timer-mediatek: Fix "no-cfi indirect call" warning
Date: Sun,  1 Nov 2026 10:55:31 +0100
Message-ID: <20261101095538.1046918-1-l.scorcia@gmail.com>
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

After converting the driver to OF probing, kernel-test-robot reported the
following new warning:

vmlinux.o: warning: objtool: mtk_timer_probe+0x23: no-cfi indirect call!

This occurs because of_device_get_match_data() returns NULL when
CONFIG_OF is disabled, which results in LLVM dropping the kCFI setup
since it knows that there is no valid target for this call. Adding a
check for a NULL timer_init avoids the warning and it makes the probe
more robust since of_device_get_match_data() could return NULL even
when CONFIG_OF=y.

Fixes: 7a097aba7255 ("clocksource/drivers/timer-mediatek: Convert to OF probing")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610290223.iOEGeDs2-lkp@intel.com/
Suggested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/clocksource/timer-mediatek.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
index 842d6ee4259e..e772f5fe8742 100644
--- a/drivers/clocksource/timer-mediatek.c
+++ b/drivers/clocksource/timer-mediatek.c
@@ -353,6 +353,9 @@ static int mtk_timer_probe(struct platform_device *pdev)
 	int (*timer_init)(struct platform_device *pdev);
 
 	timer_init = of_device_get_match_data(&pdev->dev);
+	if (!timer_init)
+		return -ENODEV;
+
 	return timer_init(pdev);
 }
 
-- 
2.43.0

