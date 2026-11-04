Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793789207;
	b=ugF4A/CywHvmftOO1GkvIMsKm1qaTUkc//1iLB3Fwm6m4cLoB5mLFDPx+SziPcPiczqZ
	 aR9nJ68AYrBhEa8k7e6pPSoxGlu8R3noKsXSWHXFZ64/I/Ih1ywnRBcjOCBo4clrOgLP9
	 xpl63X/IfqYXN0gReuzu37cRdKRFrxxJRb8EMip8qyHrLrT/08vL6EhssUOlBQS138XIQ
	 ra63TwPpZT+yRwfTvAY6d4Cxiz7KyEiWEtRR65DeQGpACET2qsQ/bcr5FOIOJwjBRdPKH
	 1wVnqUdWXKzswyAqIVazDmE2lTVL7QmWl+8wl8u6m/rMQLdj6HPcW8FlEqtw+UXlqPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793789207;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HLh1868bM3xI6tmCVDDotZeFZNzZ5VuBhrB/LMUfaUQ=;
	b=0kGEUBMneKNMSs8kvYaA0ECqNgv855ZqtkbYH8pgpFpJwxvtjHVKNZcRPRTnu1/C1WXM
	 5WXf7hS0oQX8ieRe1uXp2F6U7eUMkZgf8wHUH8NeDCwmn1h4aSksQ2QaFWWBao2Js2UkQ
	 XrH/rChStLoxJVAQ0lUnt9QwsOEpd2CRLnlHmK/0Smx28TrsCX7BENZwOfYTKwAeWxePt
	 Kn1IT6Q36P2yX9noG53g7yp1/oy7+GQlj2q1w8i+FebU2vfdvED7sWbCL9/mP309yzx8x
	 RmYjimhBKXaqvmIQC5e8G2qZpGSwliL0a6N0ROpMm+UbtsEsM4RtXZqSV1jjoqocuAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XBmu7vWG;
	arc=none smtp.remote-ip=74.125.229.131
Received: from mail-dl2-f3.google.com (mail-dl2-f3.google.com [74.125.229.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165FE606A334
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:46:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 165FE606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XBmu7vWG
Received: by mail-dl2-f3.google.com with SMTP id a92af1059eb24-1b23f91cd75so292397c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 02:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793789206; x=1794394006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HLh1868bM3xI6tmCVDDotZeFZNzZ5VuBhrB/LMUfaUQ=;
        b=XBmu7vWGfccTPCZSJN6LJ1LcmTTbH2lkdS3TuZX0tBvcqvUZL/zfrqQDumoIisWL9a
         h1mSlQVMzAWwEw4Ul9Zpm6Go5YT6Eex48aDLDKrDo8npS3V/5W1MBA0MArp0Dry1R3GB
         jnZQyHyYf3XOVByhWUGYfEs8aolp7Xg2q1GCuw3ROcv1RkgeXlJCWtUjZsBaxBQ7uid6
         WIeEUsFtzohb+9SP1024P35VZEn5ckk3n3wSlVlTOMXfijU9YYIeQedKBUNJASHBxCe+
         cUISp6p7wjpjoCQHU+pXxSsEgIjjBOmdCNh8AhdUqpYMg9yM22juUXHjblDI5PX/EIYl
         B/CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793789206; x=1794394006;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HLh1868bM3xI6tmCVDDotZeFZNzZ5VuBhrB/LMUfaUQ=;
        b=SW3lmomu5EZ6fbGj2ss5ZCda8GE8eryoJU1kHnLM6CZ6cxDp1p91pzgak6TxzsxjUD
         QmewevkpY/Z9RyicLBPJn6l8XUq3+Vv0gMzTe8Hd+WvEG4scSUGTKcEBJdTguVhgxEu8
         yeXEbjaqJ2ig8JRTIKUxfCddN7t9jdPj+44FdO0X/Ynui1ccUPPQgYfZrKuEW6+mORPG
         uRX7hy+L0tTexvXLNSoFldW0VHC6FPKUoYsIAf7ug0uhj3gmLJLsVYDleDSUp65saC+f
         pH/plSUxoxNgkeToWUD+Pj62+X4go+EpDk5JP5b43Krbg/81nvkPf0GA6po23PTLLOKQ
         P+ww==
X-Forwarded-Encrypted: i=1; AKwUvBwYo685rqHFOv7n5UshnRtvisN4oz5pMN/FfYflZbhjOmLo89G7VF8P85sFphBZJA7f4OvTMvMX4Q3p5SI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zd8cmHu2suGBemPxcEduOVik7oooPR6LNW2XyqO9DDJK7T82r
	CB4h43nSqY/2vkZvHO2Vp9JKlvTfjJ1IePCpJMyWDyMhVLtRjqEOTesf
X-Gm-Gg: AYBFou1vzP+pR9kAPEP081JGcSMjXzHg9Fnpv0yD6zfSpjOxtTyS45xAoCDz32pRqyI
	rRETvhifR+yRlFjFc5p0f7OoXgAq25Q/YDckumUG9RmD1eusTGgCZC5sgUYO2jqtrDyeQvcSQj3
	09dyOH8MHnR7mRBBzCHfOCrtOvjRyBWfoJUC1U5lyUN6flkp+QHRHZ96z4/yE4NYKbBD9AA3IYS
	v7rU3iTyiYf2WuKNql6blT1tqEuNRohUDJMUftSJYdazZ5WZiuyTmptTflls4E+yOYJ4E7frs9V
	SeDUIDYp5rmguZa5ksx0ct2dx63gnfGdOT+JnsUGJzO8Cgca22IXMHPYVXeRkkR1igsmmLBu0vk
	frj462wR9tqlqkig8DffFsvybt38Rqx/1/FVcA/9dnj08AdJWbZGemV8lagEHgkpAmjjBeEuV11
	1WU7ItA4rHvd82wTtUSSBuxmQGcID8t0+z1ipTo9ul9Sr+OPD/rJEgyDeePWF3v0IJdjDNRjltL
	Ds44B3ZkxTff0SlY4XLMHg2y3KEGLGWwEdauhmz7nVIoYq5glew6bjzsuzQACdr6b+jqOpiIX+P
	LFYhw6sBiaijDEDQEAa9HbBP2R1ONTCHRahiK9WZd/Xt55E5hRSyCvBVg9AJp9c7nxkUVQRRNpk
	sdn/VsmHq9cVuGfVesMQFbjNkm7d4Uu3lyiPMyQ==
X-Received: by 2002:a05:701b:4248:20b0:191:3c:aae7 with SMTP id a92af1059eb24-1ac5c64cb0emr24775668c88.26.1793789205904;
        Wed, 04 Nov 2026 02:46:45 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c6f0dcsm8266549c88.21.2026.11.04.02.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:46:45 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: dsterba@suse.com
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] affs: honor copied length in OFS write_end
Date: Wed,  4 Nov 2026 10:37:02 +0000
Message-ID: <20261104103702.79093-1-dennylin0707@gmail.com>
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

affs_write_end_ofs() uses the requested length instead of the number of
bytes copied into the folio. It can therefore write data that was not
copied and report more bytes than the source iterator consumed.

generic_perform_write() then advances the file position without making
the corresponding progress through the source iterator. A one-byte
pwrite() from an unreadable buffer at EOF can repeatedly grow the file
instead of failing with EFAULT. Partial copies are overreported as well.

Limit the range written to the copied bytes. When nothing was copied,
unlock and put the folio without modifying block metadata or reporting
progress. Remove the obsolete comment: an uptodate destination folio does
not guarantee that the copy from the source succeeded.

Fixes: f2b6a16eb8f5 ("fs: affs convert to new aops")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/affs/file.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/fs/affs/file.c b/fs/affs/file.c
index 23e088a7ed4f..84f53ece87d6 100644
--- a/fs/affs/file.c
+++ b/fs/affs/file.c
@@ -700,15 +700,13 @@ static int affs_write_end_ofs(const struct kiocb *iocb,
 	u32 bidx, boff, bsize;
 	unsigned from, to;
 	u32 tmp;
-	int written;
+	int written = 0;
+
+	if (!copied)
+		goto err_first_bh;
 
 	from = pos & (PAGE_SIZE - 1);
-	to = from + len;
-	/*
-	 * XXX: not sure if this can handle short copies (len < copied), but
-	 * we don't have to, because the folio should always be uptodate here,
-	 * due to write_begin.
-	 */
+	to = from + copied;
 
 	pr_debug("%s(%llu, %llu, %llu)\n", __func__, inode->i_ino, pos,
 		 pos + len);
@@ -716,7 +714,6 @@ static int affs_write_end_ofs(const struct kiocb *iocb,
 	data = folio_address(folio);
 
 	bh = NULL;
-	written = 0;
 	tmp = (folio->index << PAGE_SHIFT) + from;
 	bidx = tmp / bsize;
 	boff = tmp % bsize;

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

