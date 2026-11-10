Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794289735;
	b=h0gUi5V+SOeRvytLdnuDJxVAPGxMosbII5bbfdlYGgpKTUuugw6f3EKXF5gwasysFlz4
	 PPqI0fmDx7h0G856Yu8gYUEdgOa5jDRf3XP4IxsSF+7KD5c7Tmfy00Jccj7VEkWFnmLXk
	 Dt5dnjn8jbLpL0M2Anbvcqy2IP/ZY19fvK2iyRmbrXFyULI6X4lCzist4fzI7kC7E5D8e
	 Brbb2Hl5RYBf3zxD5298bxeNWHzJVzY2m93Uls04TmVtYf8xZ93GTK6WjUMWeOzDk+FC1
	 UPkWnXf2omhhN6mVXoQsxfBEZ+FAaNcOLxx37z1uGbi7nqBW/pU9VxUQA+dWbE/E5xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794289735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ztVA0sUV+JwbT6qi0K19Xf4qSH79z5sTbBuAxuXF9DM=;
	b=MaebiCCKFIqBU/tse5LEECS9Z5ocl0EA2QgPJKSXM7at0Yxcn551RRxHQGHXnm6AsYAD
	 lxOKTNg2pUer2I66FzB0MQnXEZsNCQwXGjLcSzh4Mpg6SWkPXAbozttuHJEG/sv62IG7B
	 I9TqLAaUFcuW0myG8M3ntRs21m6iAR9GF3lLjnlxWOkuv4JL+IcgIwY8b2aOOoBQZRXpz
	 OmgfBlqPOpXv4XmEbsiI1bjFb3jBwaTbcVeXBtw/S9/8zqNyt3+iHg78K4SjtVIGubUQT
	 5rOcBDt6r73eIXuccS2hrK1sKGrwtlzc0xrz8RVgnjVA9fSHbivDt7zIVCgouAfeRKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="RW+Y0l/K";
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FDB60A2622
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:48:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25FDB60A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=RW+Y0l/K
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ad787e0593so926973a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 21:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794289734; x=1794894534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ztVA0sUV+JwbT6qi0K19Xf4qSH79z5sTbBuAxuXF9DM=;
        b=RW+Y0l/KXEf8qcCbDWoRBZPVwg9A6bbecci8qAWMx3o7xPj94T1FfaSNcQdPrqf+TO
         fUAa7CWn+B0dar7Oq+K0oazS/HHNIN8QRsSs/oVcPojsQUK0OJARHcnvO3tsole0+djj
         DR5ztTp5VUMn8ZyNafuNy8DTpzJ9ojUbPa904=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794289734; x=1794894534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ztVA0sUV+JwbT6qi0K19Xf4qSH79z5sTbBuAxuXF9DM=;
        b=Xwy90jjCebUz9sYWG5jVspeY6MG2fmUsIjq6YU7hw2JcE/XxdZVy2lHnPTGuLKVAnb
         CpK9Uvaoczd8QnTXoIu3PMxy9+Jz6/VIqMCBw4CZcqrGMXlwXT+Z4XmE/87l0Kkd8LrM
         yRNMzUwcKnlCMtfoqtTqxZ8GKrPCwC3lVuP7lwIWbEB1Kt3Chg9/L9xxo8MLFHzidVMc
         3jB5vu+4ZvpXD8USoeqPmgp55zYtdTFb/ZPHbNm6VGnAYzIf9ZJ3YJ4AB7Uyq8F3kBN2
         iPz2i2zmnrpDCJLdkqj7utVunwMBxV5b9UCURxQNUGp3O1xB4gU3NJwzrIC/qX4yWZ1G
         kFTQ==
X-Forwarded-Encrypted: i=1; AL+hErF9+SmqSxEMlUYMWa91PQfWQ3OsYvC//fWkDU5x/WrfXtPNAy2USj4s5y1Dygqz/RgCuma0NstnNX2Cztw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tDOf2ZaWJtjXMcVEDdbfFT4pVPrxOyVtf7OD4KNYKx+0iYpps
	ccFDSZ4LfBekLduqgtJWPTz9HRl8xH2Sd690Kb20vXrmQW46kHs8RjSGo61BFgg5kw==
X-Gm-Gg: AYBFou3oGPID3ugKJw4BgzEdZO0EoW8AhCqW/tjQYP0G71ax2uWYPqe0cWFLR7cqeIn
	DWOBFrN9AhzAc9JrlC/oyWrJ77UHAXxUS0PiX7VIBeVdMXoH0Q+V/dR1fHKu0TkBOxmUOF2Ldwb
	U7udzB9hqfBRiKtNewQWerzM3YRDbwnOgZHAez495UU6v4Eid893cd3uM3fAmiA9CiXatGOtJro
	KfpMc75Lde8L+mIXBtWGozfA4gScT9pzgkVF3EQ11kkaDVsckxVQCg5J9HyB0SnWDGDL/Bs1ouc
	A6ZzTVLlOktAC2no+u6J3FHdzWYcrfUoARKHMyTKAGyYrkFlHCPXV4YFrnqiKL0PRsjk7XF/noR
	D5i2UUbtdX56w6DGK5/CsvYEyOp4fODavrTNPcUcO+1vSbKp20Jsf7fIzk0Xw37BtZGLS0Vxnso
	XHzmJhoYCjVxdAGbX/FSuc+1tTTyA1mw8Q2zSE+ge9NH/uiEj+Zdhg0xOrYd3tlxBTN9GLTWt2I
	/YoL0GvkVEWvWVSPRGogmyWNFMr4ftzRH5YXHpgGaRUR4Ufgile/q0IMKSe9cvju1JyOnY2jh9R
	SEDKlNQ3KOpGyZwZNhaxzLJqpuwedMT4X5OKi6Mdv1mWMY6OPJmbAAmlomDzBcdqdKiEshhNW3T
	N+yYeiKj95h/AeaWrJg==
X-Received: by 2002:a17:90b:4a47:b0:3ac:17c:6e89 with SMTP id 98e67ed59e1d1-3b166cd4924mr1684341a91.19.1794289734505;
        Mon, 09 Nov 2026 21:48:54 -0800 (PST)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:e137:9384:7cd8:6e40])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdd8d67e53asm444634a12.5.2026.11.09.21.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 21:48:54 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Nhat Pham <nphamcs@gmail.com>,
	Yosry Ahmed <yosry.ahmed@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Brian Geffon <bgeffon@google.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Yosry Ahmed <yosry@kernel.org>
Subject: [PATCH v2 03/11] zsmalloc: return handle from obj_allocated()
Date: Tue, 10 Nov 2026 14:48:08 +0900
Message-ID: <20261110054836.1515030-4-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
In-Reply-To: <20261110054836.1515030-1-senozhatsky@chromium.org>
References: <20261110054836.1515030-1-senozhatsky@chromium.org>
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

Allocated handles are valid kernel addresses and never 0, so let
obj_allocated() return the handle directly (or 0 if unallocated)
instead of returning a bool.

No functional change.

Suggested-by: Yosry Ahmed <yosry@kernel.org>
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 mm/zsmalloc.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index 7ef80e0da626..dab71f582103 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -822,8 +822,7 @@ static unsigned long handle_to_obj(unsigned long handle)
 	return READ_ONCE(*(unsigned long *)handle);
 }
 
-static inline bool obj_allocated(struct zpdesc *zpdesc, void *obj,
-				 unsigned long *phandle)
+static inline unsigned long obj_allocated(struct zpdesc *zpdesc, void *obj)
 {
 	unsigned long handle;
 	struct zspage *zspage = get_zspage(zpdesc);
@@ -836,11 +835,10 @@ static inline bool obj_allocated(struct zpdesc *zpdesc, void *obj,
 		handle = *(unsigned long *)obj;
 
 	if (!(handle & OBJ_ALLOCATED_TAG))
-		return false;
+		return 0;
 
 	/* Clear all tags before returning the handle */
-	*phandle = handle & ~OBJ_TAG_MASK;
-	return true;
+	return handle & ~OBJ_TAG_MASK;
 }
 
 static void reset_zpdesc(struct zpdesc *zpdesc)
@@ -1571,7 +1569,8 @@ static unsigned long find_alloced_obj(struct size_class *class,
 	offset += class->size * index;
 
 	while (offset < PAGE_SIZE) {
-		if (obj_allocated(zpdesc, addr + offset, &handle))
+		handle = obj_allocated(zpdesc, addr + offset);
+		if (handle)
 			break;
 
 		offset += class->size;
@@ -1824,8 +1823,8 @@ static int zs_page_migrate(struct page *newpage, struct page *page,
 
 	for (addr = s_addr + offset; addr < s_addr + PAGE_SIZE;
 					addr += class->size) {
-		if (obj_allocated(zpdesc, addr, &handle)) {
-
+		handle = obj_allocated(zpdesc, addr);
+		if (handle) {
 			old_obj = handle_to_obj(handle);
 			obj_to_location(old_obj, &dummy, &obj_idx);
 			new_obj = location_to_obj(newzpdesc, obj_idx,
-- 
2.56.0.506.g506a7eabc5-goog

