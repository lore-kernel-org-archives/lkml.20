Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793606619;
	b=BPiXe3WjHGkYCufBosElVmP4kQNq2kVgHmJNkYAj7GcowGlacXqnB015DAyLuK8vmTD6
	 Pn6OljpYNrBYeBRlz2rVyMIQzjt7OrThFy0VzFdXf13N55pDW0McneBNMvI1+PMfM3Frm
	 FHWJdkJ03SHLe8HgtgHtGGhfy27sbIsxwynR99OW1/fEN+ZcWXDY++sUgtKKgBXEbs6Ym
	 /pWXN/WNLjv7EK8giCrDwyjS2N3yWoTJLdF8+vWEvqNWdlYln4DVcsXn//5VKmaHaOzOs
	 UmhjmPSbvXhtzjObkGDOXhrnLXXXBXJd8cIL8mUVYUynsA1jjknBa3sW2SdDnCKAY/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793606619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Z8EJgkp2KeWeadwF4AcKa6qCzv/o/cHNGkKe7Zmmr4k=;
	b=lJg5AkhBTHTGnZJ3lNNmEHuo9QsLt3fq4g+2kjieMVSHK1SNf+e4if3VRd8bSLoLUYmW
	 U7IOPT5TrycZCRBZIOZMbzob+4MXWexxlZWsIf/Mlc0pEdq2wYnR7SivtLFxLquWjKpIA
	 AcptxTuqiD3Gry9f+PhZhgaa0Xh1QrHT6QAUJ1/xMxDLgjrXDcZBi2WoHUfmtqVWjLwZA
	 lS3xWxbTLcDjY/ECBfhCCJw2AL76FLNzgLDBjNx4xVScffxrtAJSk2iZOTHjDDCQVz5qs
	 grcAD6g8fA8TnFpJ1+rp1/ls3pxuqGcqVUW99DJoZsd6xwJ71p2ABLD+pPl5wpMgGkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cGI8P3mN;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E873F606A334
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 08:03:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E873F606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cGI8P3mN
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e8f2c3ad6bso16218245ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 00:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793606618; x=1794211418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z8EJgkp2KeWeadwF4AcKa6qCzv/o/cHNGkKe7Zmmr4k=;
        b=cGI8P3mNj6yeNclc0dcW+C94nWagQ+oKQFE4xWtvKlXr0jIZK0CzT3+xXgeHJvVDUJ
         43LbY+lfuJ2f57ovgT8yBh2Fx6rdndrtl0vLyCgjGJ2mN7FlYman7SXF/kzYm9ULRINy
         aPgv+EfO4AA+GGVaaXHoVEjUviTkxmS1vQpruQw3g+O2jmn23T+8y3KbhU4AFV/y/l2G
         AIi5RK9wa35UUsRPDotZjFc4FgLZLz4IYteehhmSl2FvYGDWpOdEvpwBP/UJ60ZVGxWU
         0wZ+eo2YOWiiL8V3TKN/3jLeI6cizk25N9sxb1BZnMiKZaT/F4GC7ITPPPFF1EbGUZwj
         Uvgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793606618; x=1794211418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z8EJgkp2KeWeadwF4AcKa6qCzv/o/cHNGkKe7Zmmr4k=;
        b=0qqKDMdpTlw/vmLCbBy0QGGzhfwWhRl5GNhzjk23oyzFWjuRxFOFDnLl0G7eXRIP4x
         HWyexaNCt8M7EdGUWvDyToykK+LmGd7KVjYlFGZdYUwVA1bscm+IhbzxuLIfhGI4GBxr
         JxYK15VyjE/N1WyXMca4rUvXHh4tEOVyM8b3IbRf9iVp5XbpUqmxfPrEoZ00FzSScYTL
         T9XRU9aZOPKG8T5oWrdpAG6T7C/BEnrFx4M7roZqp/eRpEGI6Mjquwlbq0llq4U9HZb6
         HkylFga7abfeT1+ohnOAPR/eCcpx/s93lRQQaTI6Utr2IX1I1HWhSUDJwiubNBbqavEm
         M3dQ==
X-Forwarded-Encrypted: i=1; AKwUvBzxaCSdnM2j6fcvwyHnWW58w0HRGaDrd7qZNveEHoNQphFzFTAqfw+TFKybhLmCke/jIWu2EEyQ0yJ110U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9celUtBYZDuXLJ9YxWTKiv8DeiPi8IBWKwsG9N2jBp+DP37I0b
	KP60eeYZ4o+Jo+ZoNtvivegiajCsNsQJfSIEhT+LMg1rtrsT4AxhmV0z
X-Gm-Gg: AYBFou2QfWRLic+s1rcmJl5NGi43qTY4X/bTS9gt3BVly6kVTRODJGet1YqKNWc4WO+
	Jem+lpYI1watwa+/EFcK/ZkyAwvgK+9nK9Uk5Wm4MiH5r9Sh9cVDkqL6VtcK7PFCDQYb5u309T3
	XQ/1FBwy6aiogHJlt5KXqYJNHHpCTI+2APSSMCw086hN1D0/98gdzQZENuR074NhMOHyMuwW5bO
	ihRweC5CBiUqOjy4vg27lSkqc9Y3Y3jPKjHjQ66DhIUtZunj6Nazne2tPWfF9C58oBvagV4YNcP
	hXppM27tnNqz0+iXINUow/mC0ceUUFZc/caeYSchq+UCvfJxAfC4jIV474Xw07vtesiHR2QzL0Z
	4cWT70MtUoxEAZhvRhWSpN0GHXDNlY3d51U09YXTUgi0P1OoiD+LeFeoy7pF4e3pUU+R3UqwLfB
	CgPY0Ho/JPDFZAQbBLG8k/K15kWw+gm2RholiA/dj7lvNohdaM4hZiN+jsEcYqwoLFcYh0jFSH0
	bKhxt7CURI8uTjfThANf5xTmQ7Z7vj7Rz5iAXB5LqP4dZepmGfWbwmFUC4cpl6HrNf54NkTRQ7f
	aDyC7dqwpsHIh+5wABYdsy7ze44KqTJF7aHVezYc9hXoS8/LmJ960MLbyIN/M5DV1nJMQYCLKNx
	mtxCKDrCzco5dI0qdKuHl4w8+C3xt1peKFoMkSnh972h1fbksBcaM71ELhuSZBz4n0waK5IOTSW
	pJfDYrzUi3VFXevbQ=
X-Received: by 2002:a17:903:18b:b0:2e2:b624:54b7 with SMTP id d9443c01a7336-2eb3649b19emr87836225ad.17.1793606618284;
        Mon, 02 Nov 2026 00:03:38 -0800 (PST)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392afa5asm23573655ad.72.2026.11.02.00.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 00:03:37 -0800 (PST)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] fbdev: pxafb: unregister cpufreq notifier on removal
Date: Mon,  2 Nov 2026 16:03:30 +0800
Message-ID: <20261102080332.1466689-2-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102080332.1466689-1-matthias.goergens@gmail.com>
References: <20261102080332.1466689-1-matthias.goergens@gmail.com>
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

pxafb_probe() registers a cpufreq transition notifier, but
pxafb_remove() never unregisters it.  The notifier block is part of
struct pxafb_info, which is devm-allocated and freed after removal, so
once the driver is unbound or the module unloaded, the next CPU
frequency change calls pxafb_freq_transition() through freed memory.

Unregister the notifier in pxafb_remove().

Sashiko, the AI review bot, pointed this out while reviewing a pxafb
cleanup.  I have no PXA hardware; this is build-tested only.

Link: https://lore.kernel.org/all/20260722081427.413EF1F000E9@smtp.kernel.org/
Fixes: 9f17f2874834 ("[ARM] 5118/1: pxafb: add exit and remove handlers")
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
 drivers/video/fbdev/pxafb.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/video/fbdev/pxafb.c b/drivers/video/fbdev/pxafb.c
index 1682345fb9b0..4f5c408eae56 100644
--- a/drivers/video/fbdev/pxafb.c
+++ b/drivers/video/fbdev/pxafb.c
@@ -2384,6 +2384,10 @@ static void pxafb_remove(struct platform_device *dev)
 
 	info = &fbi->fb;
 
+#ifdef CONFIG_CPU_FREQ
+	cpufreq_unregister_notifier(&fbi->freq_transition,
+				    CPUFREQ_TRANSITION_NOTIFIER);
+#endif
 	pxafb_overlay_exit(fbi);
 	cancel_work_sync(&fbi->task);
 	unregister_framebuffer(info);
-- 
2.56.0

