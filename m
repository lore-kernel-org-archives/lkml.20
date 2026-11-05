Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793914319;
	b=E9CWXlwWMqwGu7/pDLiEm1C2tGsXvUacmyuIEWgHQFp5ShMRrrbey75zuB9IDv6ah2z1
	 TwuHo8vNYF52GUkz5iKjrh4BDhKB0x1/vVXG91NXEDQATvTYv1vax1WSYNCFWv79S/qY/
	 domahrVlZCFl9JLDWQ8MwuudcYajQNHWX/aqQqfCZwkbfZp+2OfKbnLzlgsaAH8d1bTJA
	 jap9tepMCky5VvjUSpc/5+K+JQPGJjLgMnvptxlLYKhBjIHJHZIWDWfqNORTTBDtRjiVC
	 WK5IvDWN/+keaGFr1q9VuUvE42ckrKBDzsNnSJvdUzwKuJ5XNTncJ27WPf5Ha2KZjJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793914319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=v4J18lKuKOIC+R1cR1tFexi0oiMBhzyNL127DHXVUEY=;
	b=MzezJssXUeafkPMsvw5foTfJw/GtYbhbgVFrPykN69S2yF+HyKOJ8OH5yzWZ3lubNJ7N
	 MLIAvZKI+JZZRzsAyb6SEtfTw0sgTtp4vh+WD3DrWh0CHZJDnnnRux+vxRE23zoZYzKzG
	 TCO7XfLp/uXNC1I0U/v1J0/8/IjOUyTFOPjupYl6Ic4N3Yh99ij4ZZ24hu5gQOqBA+W8B
	 t+oiormPR6SK9eO2o3JZZ6XMtJcrhV1w2+JBOI5o0lZkpyNuewEpzY4L6GylgX7hyxe99
	 5P91HYPdaRgJKoaPdyvyObRukqtyJRaDQwFPMHE/H2Yrq7qRGIakukb9oNlSr+Qh0SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MUJuNouW;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803F9606A337
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:31:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 803F9606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MUJuNouW
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so113315e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793914318; x=1794519118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v4J18lKuKOIC+R1cR1tFexi0oiMBhzyNL127DHXVUEY=;
        b=MUJuNouWE9G8Q0nx6dnRQpZj07NnYXH/eH7IFxLqdrio8LgLjRZuSCV4dczscPD/mz
         a49fZurEG1NzUZIhUILD1eDV8Dkq0Zaukt9i4VhnuAy9cDIoQCT/G0K+AsqWInumW31u
         381zgxPYXu802tL7YEIlp++XMSqKX1b6ylHGZx7qTR3mntccLfaU8vLkEHwoh6H+HfeP
         qCE+0cItKQFJ4LBO+ub9UEZMtCocFYyHP6IWY0yplJsCJ+yghg5KwPd0msrXFnJE0WSI
         p91e3QGrwNDcjNuC8Uvl3V/l3RGUJ4NOlzA2h25PO+g4wDrVG39Tnd0QDSMEimU1JV5B
         Xixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793914318; x=1794519118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v4J18lKuKOIC+R1cR1tFexi0oiMBhzyNL127DHXVUEY=;
        b=HmeYfR19rIaqw91C73Lgio5MrQDetsyNKpKeDnDYB57q2v45tKlqQcfUUnQKLSyLBL
         52A2Hc0YCNSCcqoFol459RlDVtoAXqOIDXcFt9MbPcRgZbAyP3URJLQX+97Mn1l8unOz
         UTygx9asots0SU5GLe8rzaSbUzSXY/XF3XGJu8WJmEj50+JVTVnmJwoVO4YwdFBJyimL
         JcWWNrxBXwmHsA0GO+Cx1xFkK+pOpM8wqZKpzuQB1yK2k6BvpIQ5mqwITkteUez/pxXb
         i4GkoLGNnvlcpq/9VCQDZcqu+T4zVlA3O31XSxnqaB2R0G69a6h53zu9B+5J+/Ns7iNB
         ipcg==
X-Forwarded-Encrypted: i=1; AKwUvByABvM3zWse1VJLuVd21SK0C4N6NDUi5a/AfKYpCVScX3wIk2S4e3wd+oXnQKPfYdjsf4rNh/hqV2OL/Kc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hDa+ZdBtDtlGZKzPJtAm/4MMQWUnQITttpOjWJRwCa8FE98YG
	2ev4RKxRXH84kuu40D5npOmqNoPi2O6Y6C4M6qAy9KLl6FX0//29h1XA
X-Gm-Gg: AYBFou2s1rFsDAr9E6X0aWvG0xtjUCQkrJOjcXwczfEP8cLdDUtr1LVrZgHxBsXs3VB
	EZ/6K9z5fkPmstTiQ/t/XVB8/YaTsU/UjohRugIM3EkdJam0I/NJuJ3dBBQiAn3NhYlvzP2qF42
	1Lj89IXzD5h64xrzVJMno4QJ9ZXAA6epAKtqKLPe2T06Yoj/bFIrkkr6bNPCwRPZ+kes7e7wsd2
	y52TFuA0sbAMs1MHkWWP6baaMGqLFGEBtwG4L3tca8Hscsmg1sQg34P7CVUJ7f1bg54RKk6kb3n
	C1UNa+N89BCpGft8lqpLyAyVatUwElxkXPnSmbFsWGc6r4pgzqMShgeJBLhZp9954Um0LyrJ9iK
	HAe2QBpWSXMGsjLzmbfk7vjLm8zBsgr7W016XesDu3BaqVvFGGc3TJK5ppowFCHu3XJmqXUX/Xr
	/zvlr7VeuiPj470AFjOYPQLxiEJivrqJP6zSHHyu9kMmjKAHGSkYHehpQhWuo33XchKdasX9qjn
	PfhXCYRWQD8O50kturNxlwY6AhbDSseOAb0L6FD9HYBALGtq1vkSFLs1HyYLVPeVG7lDBRPM4Eg
	bGqYoNBuTMeqBw==
X-Received: by 2002:a05:600c:46d1:b0:4a1:df52:3e36 with SMTP id 5b1f17b1804b1-4b6dfe8f4dfmr6379295e9.27.1793914317723;
        Thu, 05 Nov 2026 13:31:57 -0800 (PST)
Received: from nobara ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6e28cce1fsm7654035e9.15.2026.11.05.13.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 13:31:57 -0800 (PST)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kees Cook <kees@kernel.org>,
	Changyuan Lyu <changyuanl@google.com>,
	Alexander Graf <graf@amazon.com>
Cc: Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Pratyush Yadav <pratyush@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	kexec@lists.infradead.org,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Subject: [PATCH v3] memblock: don't allocate new reserve_mem regions on a KHO boot
Date: Thu,  5 Nov 2026 22:31:49 +0100
Message-ID: <20261105213153.9572-1-azpijr@gmail.com>
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
Content-Transfer-Encoding: 8bit

On a KHO boot, a reserve_mem region that can't be revived is allocated
from KHO_NOPRSRV memory, which includes the bootmem the next kernel
boots out of. With CONFIG_KEXEC_HANDOVER_DEBUG, preserving the region
then fails:

  WARNING: kernel/liveupdate/kexec_handover.c:1245 at kho_preserve_pages+0x168/0x180
  failed to prepare memblock FDT for KHO: -22

Without it, the next kernel puts its memmap on top of the region and
the ramoops records in it are lost.

There is no use case for adding regions across a live update, so fail
instead of allocating, and drop the TODO.

Add an is_kho_boot() stub so the memblock tests still build.

Fixes: f99230780211 ("memblock: add KHO support for reserve_mem")
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
Changes in v3:
- add an is_kho_boot() stub to the memblock tests (Mike).
- add Pasha's Reviewed-by.

Changes in v2:
- fail on a KHO boot instead of allocating outside bootmem, as agreed
  with Pratyush [1]. this drops v1's patch 1.
- not an RFC anymore.
- based on v7.4-rc1.

v2: https://lore.kernel.org/all/20261104204235.9066-1-azpijr@gmail.com/
v1: https://lore.kernel.org/all/20261021211058.83483-3-azpijr@gmail.com/

[1] https://lore.kernel.org/all/2vxzfqxglrg6.fsf@kernel.org/

 mm/memblock.c                     | 11 ++++++++++-
 tools/testing/memblock/internal.h |  5 +++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/mm/memblock.c b/mm/memblock.c
index a450092a80fb..e325e0542c9a 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -2827,7 +2827,16 @@ static int __init reserve_mem(char *p)
 	if (reserve_mem_kho_revive(name, size, align))
 		return 1;
 
-	/* TODO: Allocation must be outside of KHO_NOPRSRV region */
+	/*
+	 * On a KHO boot memblock only allocates from KHO_NOPRSRV memory here,
+	 * which includes the bootmem the next kernel boots out of. Only regions
+	 * handed over by the previous kernel are supported.
+	 */
+	if (is_kho_boot()) {
+		pr_err("reserve_mem: can't allocate \"%s\" on a KHO boot\n", name);
+		return -EOPNOTSUPP;
+	}
+
 	start = memblock_phys_alloc(size, align);
 	if (!start) {
 		pr_err("reserve_mem: memblock allocation failed\n");
diff --git a/tools/testing/memblock/internal.h b/tools/testing/memblock/internal.h
index ba4d1c02fde5..84f22a964510 100644
--- a/tools/testing/memblock/internal.h
+++ b/tools/testing/memblock/internal.h
@@ -51,4 +51,9 @@ static inline bool kho_bootmem_overlap(phys_addr_t phys, size_t size)
 	return false;
 }
 
+static inline bool is_kho_boot(void)
+{
+	return false;
+}
+
 #endif

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0

