Received: from mail-oi2-f42.google.com (mail-oi2-f42.google.com [74.125.231.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4123347CA87
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 15:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790436262; cv=none; b=qMpLnn1TzIaZO6ESAtP3a+a/PMFiURFBRTXkmvtyWrtCC7DFPc1m9wf/FhP0Sr4e0KA7wiZ0q2bkDX/ddbdXEe1f/2HfQkM4XIR2nzZF3fStRybPo3uUsV6bhCtLJ283dLb6L7/6S29T/8IQBe2yvEdt62Q4XU9PYdeuYg0MZgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790436262; c=relaxed/simple;
	bh=IQiRPBQT8PoLrQ0+RVIpR2y3WG9M+s7mAoP6ATneTVY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a/5ggNgaaS2BgGsWM0gIQ20mYv1ZqtJCG9WDqgFyD0/ct0yfsNKJUEHlo65ryyMWLvnEcIOQdSAUNgiPzDmiE9fw6v+lmL++f7yAvi14VdufNnOQOw4iPFq+Z7Y7LwO+WGZ8uMbdKMlEd5QaglDdppcXQGAk19a7FQpCPB6HiKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aFMuPzKK; arc=none smtp.client-ip=74.125.231.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aFMuPzKK"
Received: by mail-oi2-f42.google.com with SMTP id 5614622812f47-4e6afe2c84fso105120b6e.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 08:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790436259; x=1791041059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AiMOLaAgW2NxFUQCTa7UWtVYKX99lRyQl/mvvigA5Qs=;
        b=aFMuPzKK9KZq027fVRl4YVspS7K6T9nnolXR/BwujPUnvKEKUO0ctVPFwvQnn8Ns/y
         Qo1zgF6bT/TRNl1r55p5CDnTY9+GJ81wqYKeV2UzBdGEoUyuGVYxJXofzeF1MHmeVwbi
         HR0R9NMtsgldtt9bLn8Kt6uMuYl/WZfTG+TrUXORHwK7Sb2FrW5vP5ojcYqbMGUwDh9R
         kSGtQ7ZRa0oi2Jniz6GG1gFHL2+j61sjN3MCzo81digy//Qfc6MWdH3GByLqJvPdsP7V
         e3lzaUvpO2E5xbRZxdmpcXi472P6efuSEkMF9WN3j6Xm1zAlbcbhleh9xy44F72ABkY+
         IcOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790436259; x=1791041059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AiMOLaAgW2NxFUQCTa7UWtVYKX99lRyQl/mvvigA5Qs=;
        b=eihnL4g4yy4NjhMrHCFwNdETnyq5tZs1jz7d4sHikYkYCwvp2Q944T/X/7rfqXAvZs
         9UPpT9HkxihJhhtxNza3hVhYitRJkgX4CYVailCMeeVsAEBeqYtaEUF/p6bKXQ7f93mZ
         5jiPSPIHLpWpjNO9X3Z+eDKYxlVw34kF2jNH5hGWT36p3mUsWQBs9UbmrQzACqhQcbIQ
         ln4ia3I+ftHhle/CtS1Bx6S0EKqSOrj66Y4WcCJ3+MsOCSaLwvB43RTLkEyJVoUs2Y7x
         t30JU9PwyCpSbJ2fUdtlUyTiP+DcHJYr7SA6RQji7dLOUGakXps44+maMex9j/Ttivc3
         f3QA==
X-Forwarded-Encrypted: i=1; AKwUvBymDdsXyPRzOCG008xl+jYRpEbcT6JBk1sAzr5syyNPZm+9wawbi/h3kZpz0dTE/KfBUVsPg7PryYakSns=@vger.kernel.org
X-Gm-Message-State: AFuF++m+fu7hxedKQtGlpsbDqZq22E4h4zzddbOmzscGxJbOrFB9aJ0d
	Ydw+zoDEwqzMjgCqlOL+XaMCTKXX9BRGgO9sUUBazruBW9LVA+wxrdIO
X-Gm-Gg: AYBFou3MK3lc46N11J21WZXUTJZGbOMyWhyTKEPfx8uZJtFziyUbQIkdDr+TmHWVFsP
	tzQ+MXu9x+TA261bZnyQJgzgO4zXaczOuLCfWxdOPAvmqFe1oMuaI90LAmpdhOeugIq5E1MWKmR
	zcDWEGu8TttVGlq5HpyHWOJbmL0Hgg81GOYHEnsV154ZbDQFUlE9G3dkKx6OwW4ljFVTivbPKdA
	O3PJFGk+5WZV/GP/jYF8K1lvLgQRIbmzBKfa737tHLkIZxl8h+SVL1kGMtdRremaWPlfMJpIreu
	2KWqAn/w89vbs5N7EXtJmyo5JUXfoKCj+MM80/a0vPRhyfODAF70KPXAlMX9F2hBW+Ru3ekH2Ke
	D1pfcOaLlajT7kaS2je3ZHuB2V8eFtnvbiWtr85OZR7o1bVxFL8OehXH0qzIyX0hBGwuz2KMsDo
	eityjA+FnM7H3qBsJMMhwL4nGFyKZ3xa2dbsR5iEUrR7uogOXmcd7KYTXdpkJfHYqM0S8NSmiux
	10Cbt9KRYysWmx4eLIpg1tMwudkwFerXAKuOgw7
X-Received: by 2002:a05:6809:17:20b0:4e4:86b1:f7a0 with SMTP id 5614622812f47-4e486b1fec3mr1143351b6e.53.1790436259140;
        Sat, 26 Sep 2026 08:24:19 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4dbf6206942sm4653798b6e.9.2026.09.26.08.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 08:24:17 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Willy Tarreau <w@1wt.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH v2 1/2] tools/nolibc: stop rounding malloc() sizes up to 4096 bytes
Date: Sat, 26 Sep 2026 10:24:13 -0500
Message-ID: <20260926152414.251214-2-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260926152414.251214-1-danishkhateeb03@gmail.com>
References: <20260926152414.251214-1-danishkhateeb03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

malloc() rounds the size of each mapping up to a multiple of 4096,
presumably to align it to a page boundary. But the page size is not 4096
on all architectures, and mmap() and munmap() round the length up to the
page size themselves.

Drop the rounding. As heap->len is no longer rounded up, growing a block
with realloc() now always creates a new mapping.

Assisted-by: LLM
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---
 tools/include/nolibc/stdlib.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/include/nolibc/stdlib.h b/tools/include/nolibc/stdlib.h
index 6c3c620a04cf..dc554faff22a 100644
--- a/tools/include/nolibc/stdlib.h
+++ b/tools/include/nolibc/stdlib.h
@@ -130,9 +130,7 @@ void *malloc(size_t len)
 {
 	struct nolibc_heap *heap;
 
-	/* Always allocate memory with size multiple of 4096. */
 	len  = sizeof(*heap) + len;
-	len  = (len + 4095UL) & -4096UL;
 	heap = mmap(NULL, len, PROT_READ|PROT_WRITE, MAP_ANONYMOUS|MAP_PRIVATE,
 		    -1, 0);
 	if (__builtin_expect(heap == MAP_FAILED, 0))
-- 
2.55.0

