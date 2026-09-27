Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CE634B1A3
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 09:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790500693; cv=none; b=TkVNr00L7zUtDkg0swU0rotz6ZCpOnK+BAkxU5TSnz+ZArAA2qkg4iYKb47zw5Sc0HEHt3ytiFXwu4SL/3vqmTjNkrY6wVRFRp7+FqK1TzJr0aSPd1G5T8ZBOvla9Og1hs/4D0IuS7YM4pbRx1brfqLRZax0PR+59rSUunX5DeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790500693; c=relaxed/simple;
	bh=EwiNSuHBtR0wcAQ4rYcUO7IdsmwJ3dgEPTWGqTcRRWc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V2YQ/gAl1Eq0Q9i3eixkK3/2T1f2tzlMegWvBxDIp/WFTqvFjJIVy30jNfYEqUmlQ77PNqC3ZuhDnbHjg2B8q2DYMGcLTvafh9MnMMGZspCmbRetr+2rnY3ENUmkrPLFOQKW8Hg6n3dSuZye5GIm68ZkjNqLuNuCmXo0zt35e9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=di53zM9T; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="di53zM9T"
Received: by mail-pz2-f39.google.com with SMTP id d2e1a72fcca58-88103e47f72so1037710b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 02:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790500691; x=1791105491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iAu4Q7cGSu6TBHEKAw1s5xJelNFAbgqxw0LNyJ1sMec=;
        b=di53zM9TPub45P5RdpJDIlAY+gUVnLled1lZVI0IiW8yLLcNHjzaagUgkiSBbc8rMd
         895Bx3YP2BKlybCup/MmpZPc9d885rkRRUdEe+SaNID8Hgp9LCbmDHbZuivI8QMlD2ku
         Z6VBXLd6zJb7Y18NVDuDSM7G3Mwy2dKDwWVSYOzMHqRIYvyfmKZ7hctdyPfRYCY/0Bly
         NarpUuKcTo5qOqXhBOE7FRD4QU79QbcIfpe+XezTDBkxmHN+i8x6QVQTplCE5OWpTYP5
         pKClBPVtOyH0mXJXWN2d2ZgRl1tqPGqI2b7rIZfbXNXFujcJ6BVv45AC7/jTV4I4KoXC
         bkKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790500691; x=1791105491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iAu4Q7cGSu6TBHEKAw1s5xJelNFAbgqxw0LNyJ1sMec=;
        b=fT8buRNSH5aEo24awdDX4skeugkB/xtTfxjFbO9NEYgtx6AirQvKSSoyttIIlLEEP9
         uT4ChxEoBkvyPX82lB/OKiovUlk7xA7XwbiVVfNS8QRCQZpETomMq27UBdshdQeteTl9
         1va9HYC083UAaa30mxg6z16TLdL4ExMaobRM9hnnQur1GDo+pzpg9XeQWbe0wemkyeVb
         LQ1BkZdXzrR/ndm7CE1hkiaJgBOKZAJqKLjYxG3HPE/f26YQGZZw99LoC8tYmJpj1Dfy
         a8ZrVJGPfA0Kp62BVghAiSVtqUOSQOZ24sZHTxv1p9hYPEtiQVYpyPDcagM5OpqUjuzW
         J+GQ==
X-Forwarded-Encrypted: i=1; AKwUvBwV9yeidJ/6+SVUK3mazstYb6SdUmcUmvmsN9ggf4+FJ2a72Ppb+WNOsyXNOhNcKPt3ZXyNTycSxCyja9k=@vger.kernel.org
X-Gm-Message-State: AFuF++kCY1zTdf7A/IvDs4mhlbPy/6kWTlkE8sXcnK0z5gbbo+ILz6ET
	DSWK+Ay0aeUZsXsAJ7iDq1tNaDmg3tMimYcLifG7gopbuFMAG555gDTJ
X-Gm-Gg: AYBFou2NNW3SsR86iHtTi/0wJFs2lu2MJzDhqpF+u5vMAq4pFNvrAwz+Ye809aoBy4m
	SudAALzgIr1u8kQa0iMoYrzLkoN6mu0AiAm81+0mqiMVha8HaCUaevTRhGsT9lk1k2OcMEUy39J
	wtL6kWPp2GlrZdtO0SA5vkaRx67rwmBC9k2VDtc6AfdgnY4zVt4PPdblzSd3BmOmjfw9/C+Itax
	zX5vqWkZ9eyK92rZSoqMkOJRRtIaXHynPGZjBCK5QXCCbmrcmQZ2pOTDLwR3nPt/BgscrjMQ9Cb
	zHtE+MuH7qsWziyBqWBaaTWQ4b/QBjM2maPMASP8pLnb2FQgxmR4/58byuYUsh/72cOdveMPSiC
	vKBiNZe8w8uXNnTsunHgJAgRc55BzXfQXDEQ3c3BPva2EweoCxWkT7Kd75Ar8aocYeZO3RSa9Dv
	pBMyF7wNbprJ0bAHEIHX3TbQmRA2YI3IoujIg/bd+1Nyx2cnoYlJm48aQYCgGsHWfT
X-Received: by 2002:a05:6a00:35c9:b0:870:c2db:da2c with SMTP id d2e1a72fcca58-87e99e3fa8cmr7715267b3a.25.1790500691175;
        Sun, 27 Sep 2026 02:18:11 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87feac93380sm2823606b3a.33.2026.09.27.02.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 02:18:10 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH v2] printk: increase the ring buffer for more than 16 CPUs by default
Date: Sun, 27 Sep 2026 18:17:54 +0900
Message-ID: <20260927091756.50831-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The default LOG_BUF_SHIFT is 17, which means 128 KB, and
LOG_CPU_MAX_BUF_SHIFT is 12, which means 4 KB per CPU.

By default the ring buffer is increased when
(num_possible_cpus() - 1) * 4 KB > 64 KB, which requires more than 17
CPUs.

Remove the explicit subtraction of one, so the ring buffer is increased
for more than 16 CPUs, which is a power of two. Also fix the outdated
comment.

Suggested-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
Changes from v1 [1]
- Adjust default threshold to power of two, as suggested by Petr

[1] https://lore.kernel.org/all/20260921163828.111061-1-ekffu200098@gmail.com/
---
 kernel/printk/printk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 00f8e1291564..1ba440c1193e 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -1085,9 +1085,9 @@ static void __init log_buf_add_cpu(void)
 	if (num_possible_cpus() == 1)
 		return;
 
-	cpu_extra = (num_possible_cpus() - 1) * __LOG_CPU_MAX_BUF_LEN;
+	cpu_extra = num_possible_cpus() * __LOG_CPU_MAX_BUF_LEN;
 
-	/* by default this will only continue through for large > 64 CPUs */
+	/* by default this will only continue through for more than 16 CPUs */
 	if (cpu_extra <= __LOG_BUF_LEN / 2)
 		return;
 

base-commit: b03d22ec8186f3f6b40b95a5a678100cf80116cb
-- 
2.43.0

