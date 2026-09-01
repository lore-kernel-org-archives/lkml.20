Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2A142AFAA
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788275936; cv=none; b=V22/5OthMHZ8CfL6sDRJdlguOPK6sJtab0E/Y2yPhZ2O+5ZU8mRDQjwY88BRD7u6ArWYa3/6sqKRbOx4ysACTT2VnKQb/TlQe2kyxUh3QSjjyPiUrGtPvSQ0mO0HcFkFKbOHIqxGEXOZYIoIgR24z5a0AH6xB3j71LIEEiOEOCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788275936; c=relaxed/simple;
	bh=oG2REDKA3C1eCPzXTldXuJDSA0ErSirz4TBnnkb4vNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TrjVhJcRT9nr/gHFTIjH+4JoYLTVYMNhCeTMFIfEAOrnvcFhc4/yJqhHzhPKxmp8QzXNZrIIsdIU7khn3XjoO7DsfFuyxaqWd+yesRYzWK4E9OLCzfwq3NL0iQ/F5mGb1URa/+S+qJiGY5uhUXRajo7deMpcLbnqkM3t/SySpuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sNQ3qqBd; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sNQ3qqBd"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84a6f026675so537677b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788275934; x=1788880734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dzuzRQWzKhh9d8u5tb9B8Xmk/6ykx/rwaytUEdjFAyo=;
        b=sNQ3qqBd8qCWLCcm3cjVu5ETwyaX1gKEWw1xCYtzLqLVXJ7/sbhrPJTZvuaV19gwO4
         rCY48Bj0mSdpgrEjkvesCoWYURxx/P83UsOSbdCRMij/9gppK7Zb5XiFwCZMTGL3CoaH
         0/lnHtsN26r3S4wmpZu0/UrDkQoIejA/t1qEyqpFhk5nIK5l1rswcBibvb9K/1i+0X/M
         r78GnuLo4TAkGeU27D/FdbmXqlqBakOIOMRlL2fJryC+67hlFnVQi5+ChuA2eLpJtiVG
         ioTWWFS/EXVCweQYVO8mtHZ5rNSkWMx4DnWNC+INT3dbzWg5/kLidWZJsx1NO0tGsmIN
         KAEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788275934; x=1788880734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dzuzRQWzKhh9d8u5tb9B8Xmk/6ykx/rwaytUEdjFAyo=;
        b=meKyMRY6M7hs79+d9e1utlqhOi4aPL/ahrZTa8XBZ8XC+nBNVXlH9ytV7uECTJwP/F
         49fI/j72rloyL4CRULgIxOaaaN2cffL9DYxtPKSYoP3NMu8rCYjAMU/hbabu8T3dluTp
         9bdMMHW8ZBbvELzNSPY9u4VFl0LJ/UUW+D3qhoHJAMltr7IUDCVZNdpq5LF0lD9yeQrN
         x758rcc1BtREf+vRTH8RbNNw1KhDa2FX41Zyt6GbUFd5k8QSTcHc37tz5wft65HvE6P0
         AXgariEQc3MHpfdajakEzwOHNSM6ITOJMLL+/JVmLPr5W9k2zFwRxyJEO8OCyWI9ubTH
         mgNQ==
X-Forwarded-Encrypted: i=1; AHgh+RoxW73PqC4QebybFeoF3uBPV55Pu1SKQ/sqgex2j3hA8weghKtIxzxM6LUp3Kwph4BkYpxkEOLLD09lq5M=@vger.kernel.org
X-Gm-Message-State: AFuF++lykT3H+I0AAelkuYQQZJ8tvfxVB69eA6AhIMuNfuc72SdmmMvA
	w0/8lGBV1sKMNYiAOs8qzeujFx1wtWfU0sWZgSM/RIlqlU+KMGzQEktv
X-Gm-Gg: AR+sD13YUSdVDdvKJ0fO3OQz030Fs5uphaXWlP9UC8Cpl3CFwQZ9kxfJEuIVMxV9ehL
	RE7woBRwxinKSdDqRpWDZhJXdWY7P7IfhWdNV+p0dMr8GH9yFJFNdayILBToU/T3kS/o5QNs1vW
	vRHXw3icpcLz7ROrqFpNtEkj2E9GDrsjlfjKpjw/YjHBkQUDHuxnLo/eV9BRT1RtDA371A5Znqx
	Znn6YKWaObyM329dH4ZCEtxU3jQZL9Zp3fIUaM8a63gignR+uLdUcL15Q1asxaW66JY7YVfA6mH
	zhFfJcezNHGBWqTxoTtpKKcWucvsXKwnYP/YbHHbKjHC5FM9UPj0b/3olpfAK3R7DWqKDxNBCyV
	gunnRoGS26BmXuBxkGcO3CvHIjKgjuE6p6aDJxy58/pyZV3UuMKWYlV7NsKfyrhlnc5DpMXr2rK
	jusSWejTO2CqarV9UAkAJVCi826L/buspRzH/Xegr/rx0s9O9AjEo9da9lT1j1N4FyPT3z11D9y
	h8nl5NUNBHopl0zI9oTMWeRPQ==
X-Received: by 2002:a05:6a00:4a89:b0:845:cf73:5bd8 with SMTP id d2e1a72fcca58-856271fc239mr22836969b3a.1.1788275934457;
        Tue, 01 Sep 2026 08:18:54 -0700 (PDT)
Received: from o6.lan ([240e:391:ed0:47d0::1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db24f33a0sm89911b3a.9.2026.09.01.08.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:18:53 -0700 (PDT)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: akpm@linux-foundation.org
Cc: david@kernel.org,
	ljs@kernel.org,
	usama.arif@linux.dev,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	liam@infradead.org,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	kas@kernel.org,
	rppt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	luto@kernel.org,
	peterz@infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 3/3] x86/mm: add set_direct_map_ro()
Date: Tue,  1 Sep 2026 23:18:18 +0800
Message-ID: <20260901151818.3191443-4-xueyuan.chen21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260901151818.3191443-1-xueyuan.chen21@gmail.com>
References: <20260901151818.3191443-1-xueyuan.chen21@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement set_direct_map_ro() for x86 with a page-based interface. Clear
_PAGE_RW and _PAGE_DIRTY through the CPA path and let the common CPA
wrapper invalidate stale writable translations before returning.

Co-developed-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
 arch/x86/include/asm/set_memory.h |  2 ++
 arch/x86/mm/pat/set_memory.c      | 10 ++++++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/x86/include/asm/set_memory.h b/arch/x86/include/asm/set_memory.h
index 39271a5ea925..710164ea8258 100644
--- a/arch/x86/include/asm/set_memory.h
+++ b/arch/x86/include/asm/set_memory.h
@@ -88,6 +88,8 @@ int set_pages_rw(struct page *page, int numpages);
 
 int set_direct_map_invalid_noflush(struct page *page, unsigned int nr);
 int set_direct_map_default_noflush(struct page *page, unsigned int nr);
+int set_direct_map_ro(struct page *page, unsigned int nr);
+#define set_direct_map_ro set_direct_map_ro
 bool kernel_page_present(struct page *page);
 
 extern int kernel_set_to_readonly;
diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index a1a061d995b3..7c0cfa7acd17 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -2666,6 +2666,16 @@ int set_direct_map_default_noflush(struct page *page, unsigned int nr)
 	return __set_pages_p(page, nr, 0);
 }
 
+int set_direct_map_ro(struct page *page, unsigned int nr)
+{
+	unsigned long addr = (unsigned long)page_address(page);
+
+	/* Direct-map callers are expected to pass pages without aliases. */
+	return change_page_attr_set_clr(&addr, nr, __pgprot(0),
+					__pgprot(_PAGE_RW | _PAGE_DIRTY), 0,
+					CPA_NO_CHECK_ALIAS, NULL);
+}
+
 #ifdef CONFIG_DEBUG_PAGEALLOC
 void __kernel_map_pages(struct page *page, int numpages, int enable)
 {
-- 
2.47.3

