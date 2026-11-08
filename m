Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794177360;
	b=IqS7svb7Cwk6P6R0vSPBhPd6XSTtOPOWZOrorHcJMRkQOuaZCS+W9gPZG5OYxAwuf490
	 d0VlV0vN2kcKykhuwW9f5GF4Hu5MPEYUpQ3bc/fO4QX7QMqzi7vjFSaF5tbnoNhhdXYW/
	 txNFE/2/OUV6ebkVvyg7L6KZAHpWltcAT2/Ppj6BAjceb5lPny/mR81UFbA7ybx4UFTKG
	 sm5aYWRAtp6KVwFGHiLsG7ZHnBzZzBEHjq/lDN61/Ez6ewE0HbaWai0DV7FukeTTQH/9o
	 yquowL619OJbNYmfdBzh/0sD6kFyEPrAJyLj0yw5PGo6ibbJ1Llu7whNB+4TZCOtiQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794177360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Lg34nvpGk5bB3x2FmOllL1iUBWZczrJNM8FaVog84/s=;
	b=yAjw+sn00fJXShyC1bAuSYvOx632cJuDqTYxXWT2MUpDFbiKnxFOLB3VaLJ+B3Mx0Eik
	 yOaq3z6Yan4sWM2zuGCFpDgahu52IrbWMUo8cPuM+jWV2HyGfcINi1Gtj1tAjGx4aXx2J
	 Eha/WdziEnN/lCpv5PBDUzkFFKMTlu8qixhkb6B7/XOdKggInIzXAtdQj1YmYKzALWS75
	 2HbR4qZPoNLYp8Y2YIRxfhjr7FjYlpONyvE0x5CLpptZ220gLGTVrVx1xq7g+no+dl1gY
	 TFESkj+wMtEedn94RgQzXCLnRQ7r1Imi1DWzYd/rLR2xvONwrRtwfFPiF2BXCJI4sLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W1K7rhsu;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9914E606A33A
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 22:36:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9914E606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W1K7rhsu
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b7221c0f2cso490016a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 14:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794177359; x=1794782159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lg34nvpGk5bB3x2FmOllL1iUBWZczrJNM8FaVog84/s=;
        b=W1K7rhsuQi9t32f+bQcHhZGOQsL0RGDjqQOM+hwJgGqoozREYqfc0E6omTcmSvZAGO
         hpg+3t+YpKMGd3S03fzWkLqC6NgEsCbCY2aFasjJFINDTvfzckxUQ3ZJRCK4tyDkoT1T
         EZzcAmTN9jTnKQWoPpKzXPV2hxG70Yb4bRcGu9xgj6aQpKzWlxEBjH3+gSONSAND1jKQ
         q4R+tVSf7d0Q4EtKepDOVrAoOVfVvl/Uus+MxXKZr0bdXQ6+vAhzdC81d04XnoXXIwWR
         388tIorh0ozBQ9TFuIf/wddtWkenYopRM62PzNxC+92E37gDQxavAR0sGGxm4s4L7l6r
         +TfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794177359; x=1794782159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lg34nvpGk5bB3x2FmOllL1iUBWZczrJNM8FaVog84/s=;
        b=rm0NUnPGonXNy378BAlF9aCQFbZ+OjWy+NN15O99ijimoEAOwDkhpPjO+KDIs7s+v9
         rTEWowIqufz8oA4lekiv3CDLp4k2HIZIRN/1Z6+/OKlKi7Z8XjABg7lCDmWJbf8oxTv/
         THVg1UExQ+p7AtP6c+aDIbwk6xY8gJMfN4sIpsHiDYEUF+r7hKFdvXhixmOmt0km5wDd
         1efCBgemRX/yEZEiFkv4WcB+F8QcXcMRjTfymPizTMVgD9JRnw2CtF/THq357bhOoAVs
         fU65uQLRZrUW0O6PBf2+vV6DDeyJyvDYj5WLiIElJlz2XQk7H2pdAMgSZPb44awB6ML1
         PcQg==
X-Forwarded-Encrypted: i=1; AL+hErHKemOdbD8R9Xx8aULMR7tOEiwiWqZxSenaQfTGpKCuIh4F6hIP1q1BfTS/h8J91ia51WeSt6943C+kMe0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZvGYv7AWZV9vY7w2ZKFGiWRKMKTY6ruxXpgkUTNXT4nPLPI19
	6wJ6cOYSwIZvKopxoJ5WjiSjAdI97ScVwn1g7acj/1/HWwrFqDXA96CegxRoGiv9
X-Gm-Gg: AYBFou1oyGiVIDj6ppGtHiH/a4W2hScKY2gipfhjLZ65jw+DKKhXzTPNYyePoiceKkk
	sbxVIhCKaQdqoelWtECfvtHZtt6MXF4Nefo/ZLKsKGMWbBaOT7y/G8yOiVGHERFJYvXFdXJpFac
	HqDkAtfJeNQvmAmPPQQjUoMtVgEO5b7D5nco6Od6E9B+/yAbS6rtN7KpRwZTpvKzSucwTIU19Yg
	UWjilVQUojjhil72oFa9jhLmEqeVclQ1pDfe3ZJTelHguhGkeqkOsvsaVCY0EdwrBzs5PATa7Fz
	Tn4JTlO+mEc+ye/C5ousRp4W5DtuKbC8dM1pkzsk/RG52iGsOHZKR7FJ2wvNpEj3AgoXFP71g/b
	eGCiPCA9s/bNUwCEf+Bv3525/JXE12c0Wan312QIJKfCA0aSFrEtRMaMWy2H3/LVbi6df0sc5tQ
	MWGmQFSzBLU/Gy5xe/Gra6M8O4dLynwS62P3kATSZFTnh7b3e7irm+zjv1ztC7ZWrRx4BcFMFN9
	soVn7f9JLlg5w2Ze72logtBnmSXHrCcLbHIyyfhnRgacIvSpxXWKR3444rbrWmuuWOhoqb7N2Xx
	r1ZT5bncstXFIqDtmW4U3/g+CslfIEVrFWPvz2/D+Naf/mPe28K38bhoCKcdCcAMh9Ez/4k=
X-Received: by 2002:a05:6402:4501:b0:6b1:a86c:7b with SMTP id 4fb4d7f45d1cf-6b72247ff69mr1628940a12.36.1794177358857;
        Sun, 08 Nov 2026 14:35:58 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721ebc7b0sm859272a12.14.2026.11.08.14.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 14:35:58 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: davem@davemloft.net,
	andreas@gaisler.com
Cc: sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linmag7@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH 2/9] sparc32: flush the source user alias in copy_user_highpage()
Date: Sun,  8 Nov 2026 23:34:12 +0100
Message-ID: <20261108223516.1125534-3-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108223516.1125534-1-linmag7@gmail.com>
References: <20261108223516.1125534-1-linmag7@gmail.com>
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

copy_user_highpage() also handles lowmem pages. A source user alias can be
dirtied after the fork cache flush but before write protection and its TLB
shootdown complete on another CPU. This explains why flushing at fork
alone is insufficient; the historical tests below did not isolate that
particular interleaving.

The hyperSPARC external cache is virtually indexed, so index bits lie
above the page offset and one physical page can occupy 64, 128 or 256
distinct cache locations depending on cache size. Two mappings of a page
do not see each other's dirty lines.

copy_user_highpage() reads the source through a kmap_local alias, so lines
dirtied through the user mapping sit in a different set and the copy reads
stale memory. copy_user_page() then flushes page_address(page), NULL for a
highmem page, with no NULL check.

Flush the source page's user alias with flush_cache_page() before reading
it, and flush the destination through the address actually written.

Only observable on HyperSPARC: SuperSPARC's caches are physically indexed
and MBus snooped, so viking_flush_cache_all() is a window flush and a
return.

Fork/COW torture on a two-cpu SPARCstation 20: 7 of 20 runs lost writes
before, 0 of 20 after.

The source-alias omission predates Git history; the later folio conversion
also removed sparc_flush_page_to_ram()'s NULL guard. This change uses the
mapped destination address and covers both cases.

Cc: stable@vger.kernel.org
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/sparc/include/asm/page_32.h |  6 ++++++
 arch/sparc/mm/init_32.c          | 23 +++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/arch/sparc/include/asm/page_32.h b/arch/sparc/include/asm/page_32.h
index 7429291fb118..c968ec33ee98 100644
--- a/arch/sparc/include/asm/page_32.h
+++ b/arch/sparc/include/asm/page_32.h
@@ -28,6 +28,12 @@
 		(void)(vaddr);			\
 	} while (0)
 
+#define __HAVE_ARCH_COPY_USER_HIGHPAGE
+struct page;
+struct vm_area_struct;
+void copy_user_highpage(struct page *to, struct page *from,
+			unsigned long vaddr, struct vm_area_struct *vma);
+
 /* passing structs on the Sparc slow us down tremendously... */
 
 /* #define STRICT_MM_TYPECHECKS */
diff --git a/arch/sparc/mm/init_32.c b/arch/sparc/mm/init_32.c
index 2f693b70dbd8..7b53ee9f061f 100644
--- a/arch/sparc/mm/init_32.c
+++ b/arch/sparc/mm/init_32.c
@@ -103,6 +103,29 @@ void sparc_flush_page_to_ram(struct page *page)
 }
 EXPORT_SYMBOL(sparc_flush_page_to_ram);
 
+/*
+ * The kernel reads the source page through a kmap alias, which on a
+ * virtually indexed cache lands in a different set than the user mapping
+ * userspace has been dirtying.  Flush that alias first, and flush the
+ * destination through the address actually written rather than
+ * page_address(), which is NULL for a highmem page.
+ */
+void copy_user_highpage(struct page *to, struct page *from,
+			unsigned long vaddr, struct vm_area_struct *vma)
+{
+	char *vfrom, *vto;
+
+	if (vma)
+		flush_cache_page(vma, vaddr, page_to_pfn(from));
+
+	vfrom = kmap_local_page(from);
+	vto = kmap_local_page(to);
+	copy_page(vto, vfrom);
+	__flush_page_to_ram((unsigned long)vto);
+	kunmap_local(vto);
+	kunmap_local(vfrom);
+}
+
 void sparc_flush_folio_to_ram(struct folio *folio)
 {
 	unsigned long vaddr = (unsigned long)folio_address(folio);
-- 
2.43.0

