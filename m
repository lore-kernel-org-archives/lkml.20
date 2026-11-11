Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794379644;
	b=ysbYEEjgvYNApJpFqGnVMYfVb/smsyAArOdsSGyDfcC0llnRHF6XdOe13rRDEae56v+e
	 dRecU+PLew1ycxs7jEM1fpS3aLONelLrKqH4smjcrHdzqjrEorSsG3FVARns4RBBcDQMW
	 pcB2tR8hkohEfwP6ucJ7U/WnoJZKCsYwW62XK09QpJ/mZcOnm0fqFWmojJsRkZ3YxKJ6s
	 HgxRLVCGgjKEGIZ1+Oy3BIn62YaUlUFiZVG+K9OJHbO4LQlJdpdjZswMAYBuEhg2uMnJk
	 aIu1QgK7JMwqobVPPVTxl3Y8efytNFAGazPHD5m6x3N8C3UMbvL1iOijWWUS6fKp4cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794379644;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1hLwQVyMwUi9E19JxtZsIeEAf9lJS52psxbgdcCZj9M=;
	b=0AVujkNe5rBKPVYj3D4nFqZo3y5wRajcz5Vswc4bz4SpoGkV+GXkEAwe4kdW/5G/BdFm
	 FULQK7688qEQ9t0fjOZvtU9q1yicRNnwD4tHCfaeuiv3VrBbGnnWEEcJDPLWtoyPyWKnG
	 UwKaLy8c13/7fdPiEv9mueuY1plvWzbTel2ja1Zou8R+EG+vdcCm8653TyZlyd2emS6qy
	 eRKlUY7Dw9iEiRuB5OpoAR2y8AQlV3RGaOWzCMd9ZpCBsVkc+1vDTIw3M0EtyjmWT4gdF
	 vyS7cUZQu9nfUAU2lS25l2iCyjmgSFBMvZSvarrujAdy13Vo/sgO7NVfHYnJ89+c+LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="B1D/7hL5";
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0247660A262E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:47:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0247660A262E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=B1D/7hL5
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cdd89d84521so791586a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794379643; x=1794984443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1hLwQVyMwUi9E19JxtZsIeEAf9lJS52psxbgdcCZj9M=;
        b=B1D/7hL5EzBInPwIj4oO4iM6NLxFHFrjtpFdJDlTdHxW2F2DHNVRrN9vXwAII1JWZ2
         m5TZFw05fV4SRWRV7HR1YCsOmduoIQDbZ3UPpfn3CLo698Kn7DW7/EAvXSAftuOLQPBN
         iwMMTmZBXgxALrnHSU2U48n9qxKgIRH33UWm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794379643; x=1794984443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1hLwQVyMwUi9E19JxtZsIeEAf9lJS52psxbgdcCZj9M=;
        b=hjjbu1Qn58QubLB7uuTx8ZBk1RqsfU5KcuyUW3lHkcHpBsnI1oZLRuizrvCpYJEzHU
         MCNXoN3pYOIRD/PGuvB9wGNhlFRNmVZ2tnbfVeJdYEgeoYWHfVmcRcITfzEZqL7bOHVY
         DE8jpnqjjiwEJyCJej7F+qFsDl1A+Rfyz0uS1PEgoqAJHJatAavOpEwn+qDfwapvBKTz
         OAE8Y9rUzzeVArFjhGPMcdYvEeMI0EtlNS0pjdOLvpcYiuBLdb0yNYhzNmheD7rY4bY6
         XWCWS6H+LDlozX3ArCIPLOFaFX584/v1Re3TaiHf4w3z+LU3oF1T4Y+jSEbhlScAmhE3
         p+Ag==
X-Forwarded-Encrypted: i=1; AL+hErEuxf2FES7XU6KESq6hTJV6v5Is3k68ARU10iKF/FhsWosbIg5LGFpdTD6nCIFPJrvrLqam5y62F1h4ANE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KVz2WO79kxyGTYvag5jd9Tl2ChevSMj1yf1PWejPTXo08pPtO
	WXfF75xsi/JuDtolSFC6BvWGjU79NZiYS1wu/kFrKAmfRWqaUd5zLU1s1ZI8FoEDR8dOtzwBUfa
	Z7JI=
X-Gm-Gg: AYBFou1FcXTvyBJjc13l9L0r4/jUC1TMyU0/Jb44WgNEWDvD9In6G8Hpp6FHzPAeuya
	YHoByjvYWl4wUmysbH8w7sErl+BGVshonpK6ncYyO3ZS/L3pRu+x6rZQDDfBcsKt7Hyx9o4aWY7
	lwKNVQwFpTz5z99JSguDKk3ZSQotiBVmJZqrOwzXKP8QtdV9p9pQj3JwDINuKpJ/5rtblk8aDiw
	ywXBmOOZ/W0iy7VwORBa4OTkx9SqxTtI4Z1SyYLmy6hnercGmyHYtlLAfZe05bh/A9FM8lRXS/v
	ch0zGGq9+DqANDiWuDFxdjPM5mjupb9NQ4fLH3ndr36Y0qtN/YdWAJ9aEMzxnn5lg9Qo+/oUEIS
	SJSypUuS92tfVnIFL4tzgA5ipF2Pc5+b91FzXDAxVCkjavggto9kB0/2cOVMeZLyMd681slcdmb
	sYGpm91bsMFX9oiHUJz9kSh+u5EnJjC/eQrDzIAqkhzeHU6276d7GWBthv7GqHJHKTw3Sw3l8cN
	AJ7qSilL1XXCbkLMkIZqhVibjEBxR62oKePj0QJNg/BbXPsOwvsWCldJ7JQAwcKaxb+/xKemLU8
	bDr1u6KyK/nKsoL7Fy5hQyyaprxQgUjlQd/H4egCbs9AVf8DW238x1lwHq/m90K0pJhoYZdjyeq
	xl5TlkxO5Dn0q+sKasg==
X-Received: by 2002:a17:90b:518e:b0:3ac:9a5e:9cdc with SMTP id 98e67ed59e1d1-3b167ab877cmr4231873a91.19.1794379643365;
        Tue, 10 Nov 2026 22:47:23 -0800 (PST)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:ad6a:b446:df00:78dc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db85a9bsm3268666a91.14.2026.11.10.22.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:47:22 -0800 (PST)
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
Subject: [PATCH v3 03/11] zsmalloc: return handle from obj_allocated()
Date: Wed, 11 Nov 2026 15:46:26 +0900
Message-ID: <20261111064707.2568433-4-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
In-Reply-To: <20261111064707.2568433-1-senozhatsky@chromium.org>
References: <20261111064707.2568433-1-senozhatsky@chromium.org>
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
Reviewed-by: Yosry Ahmed <yosry@kernel.org>
Reviewed-by: Nhat Pham <nphamcs@gmail.com>
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
2.56.0.542.g3ef89b7020-goog

