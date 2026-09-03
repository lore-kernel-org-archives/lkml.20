Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDD14E3EEE
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449921; cv=none; b=S+JUu1aKPUJoxveWvx9UVMnwoL2MsMnXXd2gUXrBlJOjR2pL68ShSakno/ry2b6NdBChjOiRqU31gm2PiJEMhGr26nPtQRVXKx3P3eBFCm7X2zIyHw5/HBlRnNbQCM0TaMg/Rl12HY4lfu6IlMwRs7yie7qq45rJlo2Vhorx1iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449921; c=relaxed/simple;
	bh=TcG35YC6fsjeLeKcacJlNiLTDntU0QOFR/nDu1v8uO0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ict6uJggz/wWV+TTu1oRy9390yImZ0RLX3ceGMm+9eUbOdhmIX9o/BkAhdcDS1yfVM7r1fV6eBebyDecUVBKLVOrewNalw0nz+B2rCFCxqSa67z2M+yRvupwKcAAGfj5UsJEPpISTcNHORZgge1PkAYONp1i/QdKu+2/PTPDnHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b8IbUT1v; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b8IbUT1v"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7f18c0e03e3so1347415a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788449918; x=1789054718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TFqVnAblzbxrI+EAUaJsxOTnDTvuhAtdFCDTH/5pOYk=;
        b=b8IbUT1vqx6ZdVrkaPJb75h6zXxEmlGNBEuIhvPb2BRcY8HmWUQmU/DxMvPgnFHyJT
         eGowXFiLZUZhEUcz8hmIq87HAEprY2TdQeUYDwQbUAfZom/5SAsoq8cnQhd78lMTdFaT
         TG6UAzo9JLHJ1zdqeAI8lsjU80iNBRRamWM7vQbe8w1xLk1RMYYDCXtU3QDAq6wlnSLQ
         DnnKOz9uOppLh8fWDPrN8Ohikhi5AruMLdTa2Ok6u8ECLvkN1odX8dZyZSkw5bQWzL0N
         kj5yUnSJv74GfTE6Xwjlmw3ijFMXQnsYs7u05ArKcVP2Rclk+WEQ6cXk7wadBnYJ6mEH
         +WWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449918; x=1789054718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TFqVnAblzbxrI+EAUaJsxOTnDTvuhAtdFCDTH/5pOYk=;
        b=g2Pq4+FUyIN6zg0RliNX3ttRX6M89oMZVT99pS8kYJlNevfiJj5/H9FBqNOzYe93Ro
         szURtfqA63ef0/f2eOXIGBA7RoMuQv0XSifB61IBJFpjNP0SLbpCYPoHK7tDWHc3VKOp
         TM58rM2FdxGVaCcxArUd0eI09QgAGNwATSo86Y+gPV4J4EJyOlBurdNDPM5Q/EFhujlg
         hYOJlJmbWPUSH/TsVVo2kba7HjOC6PR7IYtbeKFaiYoEZXFf4iG1/7ZPl49MSR1pbSU+
         /5OJ09iZUjBsabF2irISCAGORgV8tTThZNJvSX1UdwkAk1GnirwoDtD/vFFX6fjav7jD
         r7mQ==
X-Forwarded-Encrypted: i=1; AKwUvBxdscn2uk8eaN+mCtqJ0fdn3UIp8R1LWe1kEOGuaDryFyJaysjVZf9KPim88I3UM3fx/tETBUUDEFJ5mGw=@vger.kernel.org
X-Gm-Message-State: AFuF++kkE9hyghxg+S8t4z2qfwJYFpd5a/Q8yd2XwI59EBk/NMBLbEvO
	NgJXEsETTeNU3JJDlaC1q8TAaRKGS+x5P8EdWKvekVoJc1gaacdq5/uU
X-Gm-Gg: AYBFou2E6x7dR2Iw2HIiY7JxNG3Y1GRd3r3Bg5y/3Gju3qyNABKKZO0bsFj5dZYwqV9
	wMmC8bvhy5+daQWsduBMX/dyyrnTrP8LSujczyAcqvIHnYk11lfMTXVfv+MFLuNewZHKwzjviF1
	imTTRR1hRfiJcRh3pj0vVukYXfFuF/JQ+zeEamf9Sy1tRdbkUHTU9Lwxk4nxLaaPv4QHIlDN7fI
	+IVhg+60ryVIuVGqBNGFMVZiuIPWK4BWbgevrrgP1iIuR5BgkuVui4cYO47nc3Xns/kKYAPn6fD
	sHhbbVktGo7MlXnZamOOa1TdT//jWIRJi/2SS9D5zzcojGWcwspLGvFKtcyBmT2in8oErNBksTb
	BgQj+GYXuPXpa+chYE/t/Fg+OS2CKY1ftMBgV/5Xkfm6/nJt18c0/f0mlDgcFj6XMd1rS58V4rp
	Yd0GFRMdGBdCd2JYL7iHY8DU2xXxVwvOhCex340jWgOI+TMJhA+rZHL7vva5M18J81jhmWPSh+r
	ZutiADBzZdPc2a53eXp2+0HKQCF5xY=
X-Received: by 2002:a05:6820:2903:b0:6b1:6c11:686a with SMTP id 006d021491bc7-6b480128609mr9833673eaf.29.1788449918414;
        Thu, 03 Sep 2026 08:38:38 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6fasm148433eaf.3.2026.09.03.08.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:38:37 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH] drm/vmwgfx: Replace kmap_atomic() with kmap_local_page()
Date: Thu,  3 Sep 2026 10:37:57 -0500
Message-ID: <20260903153757.26291-1-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kmap_atomic() is deprecated in favour of kmap_local_page(), as described
in Documentation/mm/highmem.rst.

The conversion is safe in vmw_mob_build_pt(): the mapping is created and
torn down within a single iteration of the pt_page loop, preserving the
strict stack-based ordering that kmap_local_page() requires. Between the
map and the unmap the code only writes page table entries through the
mapped address and calls the vmw_piter accessors, which are non-sleeping
array and scatterlist lookups, so neither pagefault_disable() nor
preempt_disable() is needed.

Reword the function comment to match. Avoiding TLB thrashing, the reason
given there for using temporary mappings, still applies.

Build-tested only.

Assisted-by: LLM sparse
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_mob.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c b/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c
index de7a504de..edc1ba5df 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c
@@ -451,7 +451,7 @@ static void vmw_mob_assign_ppn(u32 **addr, dma_addr_t val)
  * @pt_pages:       Array of page pointers to the page table pages.
  *
  * Returns the number of page table pages actually used.
- * Uses atomic kmaps of highmem pages to avoid TLB thrashing.
+ * Uses local kmaps of highmem pages to avoid TLB thrashing.
  */
 static unsigned long vmw_mob_build_pt(struct vmw_piter *data_iter,
 				      unsigned long num_data_pages,
@@ -467,7 +467,7 @@ static unsigned long vmw_mob_build_pt(struct vmw_piter *data_iter,
 	for (pt_page = 0; pt_page < num_pt_pages; ++pt_page) {
 		page = vmw_piter_page(pt_iter);
 
-		save_addr = addr = kmap_atomic(page);
+		save_addr = addr = kmap_local_page(page);
 
 		for (i = 0; i < PAGE_SIZE / VMW_PPN_SIZE; ++i) {
 			vmw_mob_assign_ppn(&addr,
@@ -476,7 +476,7 @@ static unsigned long vmw_mob_build_pt(struct vmw_piter *data_iter,
 				break;
 			WARN_ON(!vmw_piter_next(data_iter));
 		}
-		kunmap_atomic(save_addr);
+		kunmap_local(save_addr);
 		vmw_piter_next(pt_iter);
 	}
 
-- 
2.55.0

