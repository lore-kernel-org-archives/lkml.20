Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35C837F33F
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 09:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791018283; cv=none; b=bZcDNeiO4dLiX7eUZAlAnu6OwNgSFHmhWKA5P4rAuxQcpwFlqW6o1zgJqRj1jVwdeki8WIZAI1YyIrkJWKrov0mJpmG5gWyVyZhZycVKozrba+d3JvsQze3fRjGV1zMEy1aASC/vUdb3+vB2MpKkcfjYDMvazlnNr0f/Vfcqwfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791018283; c=relaxed/simple;
	bh=nUkZKxWUYfmV5ZeAr40oLOi9bYO3yonuCaXUphIVAL8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YKj/mzftK+hKGrdepUIuc7hCiKwOixauz86n2HO4PH2QZ/RrSLQ5qHV33oPhjl8InnrAqt98QZTBM5Oxac+f3NFToLAE8hjEF0NLHcds1KqXUgxgkOZ7B9PcemRokshYm1k4yCxe2TswjMygAuROuUuO8smaX0MeqyzZUwqdlag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d2BBrY3U; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d2BBrY3U"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a7906f463dso198868a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 02:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791018281; x=1791623081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U+6MwqVGL1V8pHdPcEetoEEenWCKTdgWGRrQaFRrlsQ=;
        b=d2BBrY3UiDP01EmKhSWHEc1I7BMkdiULIL3HpSIX2Yc3HZBvbbr8F0y8/cn061gj7D
         ZCR9iol3wA8gmBTbiO8VeRXo2Z2UMG4V69BZA9D3sv4bxFYmGVuq+qlq/pzZUyqKqUIZ
         je6tCUsTR5RbCuZ4NLOAAA6eOiCUZOPSFjCkFMO40yKHlvIsF8TvhaLSPdD3o0rgrf+s
         LIFdERKPdtod0DD6HjRtfEM9jCODaJ2LrY6HT0/cnxbwRuWB84XJChPySVJjNSwz+Dby
         6slJ0bpkso3HStHtQOuCJr6u31dIeRY80KlRS882ldJH7CFqqeo0wVzDNWRIbDoh1Mgt
         RD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791018281; x=1791623081;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U+6MwqVGL1V8pHdPcEetoEEenWCKTdgWGRrQaFRrlsQ=;
        b=JgxAAO1/E57DEzA1FpXEn6Io3kkfINT3kzKJOkbj2tCfegMv2exvhhywsiP1a2j1K5
         +v6p5Z54jQ9DbeYfbyNNPBNrYii21/vUqMx8WDNJdN2wqAVDLrAFSABmEjbfrq13UXVE
         Dauv/ZbWvEYWjct5evwgIp5ZewEx+ucbHkFyu8oNygaTfzdxkLszK16pURSkQwUTqwGn
         l8dkIpbepG5B+87CGLonC8Ioi0BJP9X+LhvjbBmJUNDmRP0oxvi0f9vvwzEsenon/ax2
         ffyOc4DqmnnUaZe97dIm/4NJmXPsYtWiBJ1OkA34CoXJldhMF6oWWQCtZ0Ts6wz/b2sY
         y0qw==
X-Forwarded-Encrypted: i=1; AKwUvBwFU5NKOn6rYXDBoPAchgXeg1CpCSEiKRY3qxbSwGkIiBllUzTtUeLvexMFrQ2pqy2fp4K/b5AkoLP/m8o=@vger.kernel.org
X-Gm-Message-State: AFq9FYITXB7TM0YwneA2BYJ6FSGhROakM1+/Uanm9EcE4cuxh1n1AYL9
	K5GN4gKAowqt4HlCVP45GDHWZWAOnP8DIM1BJZfhCAFw59cFPANnDbuv
X-Gm-Gg: AYBFou1OWEfbCO+RwN7tPNKUF/iOnNWbAjhQIOHOmmQPlWNDxE1ZXgQAkW3Zqq8aJhO
	Ztz25KDM/ie9pppcfshg1Nu89FyCsxVIgraQW8RFnMRnlTH69Dbj/65oJGHN/SUGyVS07LlvIjA
	FT//ObT+OO4+P+U9XwHAB0b0pHFOp0POzCxiMzQoTfipAREVUJWnGucGm6FS6/auHuXMzpjlF+0
	l5zedY7ik9wCaiu8MqcB3C27gvoPd+3ZhprkMBtyaQA7zOQaJ+otB+4uIkLhYPVxaqKAUNPhx46
	I4TfGNyS8xQNOrnGqFB+B/5BgthP2IBMM3mWT3RtUuSMNCpbvY9wmW5nNx7Ru5/tOFKT8HkyYly
	/t+pOJKatB48GjhxwDuF06ZI6312zqMt3WbeW/c13+/rCu+DIuWoU+gFhlaaVzK92Q54cGZ1ndK
	hW2HBtj3xIOlGKNgftfnuEZUL74D6W0e+oz/WiIWN7A2bxGTQsttGcZD5Bqwfr8vZWA4zEChY=
X-Received: by 2002:a17:90b:528d:b0:3a5:364:dfd with SMTP id 98e67ed59e1d1-3a6cec5f39amr4757518a91.31.1791018281081;
        Sat, 03 Oct 2026 02:04:41 -0700 (PDT)
Received: from 027.. ([2409:8a20:4a0:1600:37f7:7188:d57f:30d2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6dd1142cdsm3510527a91.2.2026.10.03.02.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 02:04:40 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
To: akpm@linux-foundation.org
Cc: urezki@gmail.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Wen Jiang <jiangwenxiaomi@gmail.com>,
	Wen Jiang <jiangwen6@xiaomi.com>
Subject: [PATCH] mm/vmalloc: bail out early on invalid page_shift in __vmap_pages_range_noflush()
Date: Sat,  3 Oct 2026 17:04:30 +0800
Message-Id: <20261003090430.91664-1-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__vmap_pages_range_noflush() currently only warns when page_shift is
smaller than PAGE_SHIFT, then continues with the invalid shift. Return
-EINVAL instead so the bogus argument is caught immediately.

Suggested-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
---
 mm/vmalloc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index bea9f76ed7e7..838c8e0ccfe9 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -684,7 +684,8 @@ int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
 {
 	unsigned int i, nr = (end - addr) >> PAGE_SHIFT;
 
-	WARN_ON(page_shift < PAGE_SHIFT);
+	if (WARN_ON_ONCE(page_shift < PAGE_SHIFT))
+		return -EINVAL;
 
 	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
 			page_shift == PAGE_SHIFT)
-- 
2.34.1

