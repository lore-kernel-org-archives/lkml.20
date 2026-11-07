Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794081117;
	b=10PID/iCUDOnmVlMfLiYe3E3ky3zbBV1pMhr3anmgcMcI3gxkGombFTeM7LmW+gHtwoY
	 Jo4HTgdOvAbhUbsdvGJ5GQ85OCxgfJ/lDfB2NjSYyrSGcxHpTgfsSRyQGI2zEhGLjl6Ba
	 SEHdAllQxqpWjzu4Wz6k33S26TWqzyIU0+DwzwDZVPxtdrXZ2Q4Texm9+GSJftSbirKoc
	 ntT8Tq6+98c/3PFFfF0jNDXVTvKSjN0EFo3vONz6pBDTa6QzQxDBSHUg0L5gzOvwAmN3X
	 pRRh49WN0pgjWY1iMCkEw5AlZAu8RqgJd8jKRjf8ZRZXSVsPWVpPp9S7KLki0JE/U5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794081117;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FtLI03n5niPlmdsJ+E4XDcCPmRgq2Jm/sr5s8DtS9AM=;
	b=ZNwh4cLGj+mTw4RO5J02+55LCNrBa6r9EGVgVCfJXp9Z10sJ3opgcljCZzETNhuMwiGd
	 aGzEWlhRc345M5whBa85EWL4gtt5zZ1qAHBanxGMBG4r+iMDtHCgXNuBQ3O9pnoB9x5sl
	 fooZgkDAETxmHTJ2aZcDXTztIsUyzqy0XZsBcd2Tcd7H3FinrMpOJyMIGLOBzQKjq4pFS
	 IE4p9t+wosbzYWlmhEYxX/r5ReZrPze4DLRaEz+2W6fRpzzOhzlNyV+AMrhN/LZuvjA+R
	 0KAlxs0QFMt32NVvIa6lTMBQ5MYev88NMfSx//y2QWs85umfxalwJg5wXDo0wb2ZTjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kDbbq3bH;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E68606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 19:51:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38E68606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kDbbq3bH
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so249905e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 11:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794081116; x=1794685916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FtLI03n5niPlmdsJ+E4XDcCPmRgq2Jm/sr5s8DtS9AM=;
        b=kDbbq3bHTK2PIoZKpI+H9DdZkZGoZD/bpFLNuchanpHpnrfh56yqDuri2slv/Nl2HC
         kGQglgIYAivjhexIYTy6+FNtrHbILM8vX7JB1ZjS+4tqvOSEWF/5mdwRqav9L3jp/0S6
         n8RSgv5KD2HHMSxGKCP81clxmLVFKMYjQlFVnHyJ8gAh3Pvc3AKj/ND/rUqJYaQKqDbc
         Pm27tXU8kjnlZhdZnwJuXuaFfJlBG2YpS7ppkqIIo0PiqU8D75Bqs1qFtaCz6FRonLDM
         554RsdpzfWEzefLPjIVPyg88Idmww/+G7pyJ1t0Won2xabfXu3IE3a/HP/Nzkf6sGDxh
         hKDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794081116; x=1794685916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FtLI03n5niPlmdsJ+E4XDcCPmRgq2Jm/sr5s8DtS9AM=;
        b=CskFH45rDNDvk4OPBQAbUyz3GbmK3RoSGV3ZGVw64ERclRGA4bYcZkd+Y+lqTw9EDZ
         O5HGG5JgXtIDalYulWxdvq/jvgiT5nIBcMkHuo4xsW/BA6/sAYMCC/ZTi36kIBHi+LbQ
         ERIVwjBNxpazHX/T09UqxJZSaA+pB6EQFEme0QzQCNfiR3aCN1LwEHW7mzpxdLQJeWIs
         IJzgHZQ/ZhHOdiAdxecGJQuCrFpaGSZjbH4XI+sOlX+3aD6G7wqirIuEV+AySIL85k8L
         BQxTw/cl1d6wYTZPOn4sV81q993EC9sSCM0V7RIBmhz/DZXm85LB142e/0sWQnY3B8uP
         6Yfg==
X-Forwarded-Encrypted: i=1; AKwUvBwvjstBCqEV5M6kTEBJxzNDW+aVxeAP+NTJG4PRkiqyZe9qduHh9/qRmZCY9GDBPE+dQXvIaeaCBesvZL8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yH/UCy4aehyve4Hh7eNBSWYfLS3rrUijok2ln/F5H6u1SoWbW
	xbvfGPQZ82RyB4Eg2HaviDG9w3m5rDpKAHW/PKwI0bRMbHN5Lvp9GcdG
X-Gm-Gg: AYBFou13bxdr+oHIV5UMDZnqWFgIn+iGSScxqX6j1jnT7X4VVqTB6uvR0bO35okLpJX
	4UzhSdaQRCLQCCvzgOKzRbKVmSPzZqze6AOW4AdfM9FgrR/CPHmWN3a8IosyyC52Wb3zx6UDfwN
	C7kAIPliSxu4ZwiUjv31Jcc9qXY7ST8i9VRDBzdzNQJpV9gtS73LWWZnXiwhywfSYdjKVFPdtdv
	vJS7GHm7SvKWUWC6fgMaiNSlzUGMMEUxN8HYpqASLMZ89HmUUB9crPn6vHFS189pv/Wfam6f+P/
	JdmT0A2Mtn6NHCrT2EovWxU3M9AGUAopkR635KYNzpBdctd6fpkiqMgM54+nbk09ybbX5CpOcBU
	+CnqKPGBIeByeDeeenz3Z6pWttmteGVf7UkdE3+8Px7xw/8Om82GAjwSDXf4+xnoq5o+vEhdqI3
	E1YvGXO4Ulnn4kKQdFWwoI+Ybs3r1Oe/FTlJGWrb+ytnAJYp9vgePp6ekY1+l4+SxVcERW+VSNW
	xENaFc8CLIQ4A4wx9SorDs3ALwIuoMqgWPs2g3BxhRbaNAMJjJ25qz2uqbgaQhaM+gs3G99DtJC
	fqp0OhMkNjj4XoveKvbIx5tNDqI60XHLQQJvRkX47FW26jGuvh8rOwK126Ombtv6ddStl8WX9VA
	IpIdSbNi0EZNkpKzS84YaIPOlpVYXftYraVJAbFcmvJbLu0K6tyALusAv2jHn/yUWcy9wM7CbGv
	A5FmoVip49rJATBvsG/ciaPf188d5jU2s=
X-Received: by 2002:a05:600c:64c8:b0:4a2:18c4:61a5 with SMTP id 5b1f17b1804b1-4b8190f42aemr51295615e9.6.1794081115573;
        Sat, 07 Nov 2026 11:51:55 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-b149-1401-90c6-65b4-035d-1e3d.310.pool.telefonica.de. [2a02:3100:b149:1401:90c6:65b4:35d:1e3d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76cb76697sm61139345e9.0.2026.11.07.11.51.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 11:51:55 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] sparc/iommu: Use raw_cpu_read() for iommu_hash_common in iommu_tbl_range_alloc()
Date: Sat,  7 Nov 2026 20:51:47 +0100
Message-Id: <20261107195147.70084-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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

iommu_tbl_range_alloc() reads the per-CPU starting pool cookie with
__this_cpu_read() before acquiring pool->lock. When called from
preemptible DMA allocation paths with PREEMPT and DEBUG_PREEMPT enabled,
check_preemption_disabled() reports a bug.

The per-CPU cookie only distributes allocations across pools, and each
pool is synchronized by pool->lock. Replace __this_cpu_read() with
raw_cpu_read().

Fixes: ff7d37a50202 ("Break up monolithic iommu table/lock into finer graularity pools and lock")
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Assisted by an LLM.

Tested on v7.4-rc1 (d48723711bae) under QEMU sparc64 (sun4u, -smp 2)
with PREEMPT and DEBUG_PREEMPT. Without this patch, two consecutive
boots emit three "BUG: using __this_cpu_read() in preemptible
[00000000] code: swapper/0/1" diagnostics in iommu_tbl_range_alloc().
With this patch, two consecutive boots complete without the
__this_cpu_read() preemption diagnostic.

 arch/sparc/kernel/iommu-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/sparc/kernel/iommu-common.c b/arch/sparc/kernel/iommu-common.c
index 23ca75f092770..014d4e9283d55 100644
--- a/arch/sparc/kernel/iommu-common.c
+++ b/arch/sparc/kernel/iommu-common.c
@@ -101,7 +101,7 @@ unsigned long iommu_tbl_range_alloc(struct device *dev,
 				unsigned long mask,
 				unsigned int align_order)
 {
-	unsigned int pool_hash = __this_cpu_read(iommu_hash_common);
+	unsigned int pool_hash = raw_cpu_read(iommu_hash_common);
 	unsigned long n, end, start, limit, boundary_size;
 	struct iommu_pool *pool;
 	int pass = 0;
base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee

-- 
2.39.5 (Apple Git-154)

