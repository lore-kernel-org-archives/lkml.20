Received: from mail-oa2-f35.google.com (mail-oa2-f35.google.com [74.125.231.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B547445A2B0
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 15:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790436264; cv=none; b=NUJQN97uXHjFiCXIrR/txIT3303Jp1ibNfF1wG1xZOhkdD5Jw/wmFxOWpoyFt9sxmjg2wAd6W1wyoQKL3JiOC2TmLIr/ECusmW/musv7YYylSbpZjWW4IG0UsHi+Tx8tiyLusGclYlihEq7O9czUXvEXtLdZvdHL2KPKkci/jXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790436264; c=relaxed/simple;
	bh=XQutekWnaQmqlLgFPoRM5pMe9iMGs/qmVvTdEYXD+i0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=on2Mk5EStUq3cNY4mtP2IrcFa0E5NlJNyoK2HEfJJdSUZcxn7BzRXlTQQJm1/GIQXbnpkoaoE0zXHW45rQpj0VvN2Lk+i/OUWhlOb/fxR/2x9DbTV7McyfLXCxie73Ft1akYwzxNQcEVjhw76qle6fB5DVIthFYFqaQ15wy09uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V/GJmCPy; arc=none smtp.client-ip=74.125.231.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V/GJmCPy"
Received: by mail-oa2-f35.google.com with SMTP id 586e51a60fabf-48f0056ef38so2095477fac.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 08:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790436261; x=1791041061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3teFFwR9sWlJkV5co3BwWK7u5srE/2UYNflhxIXeO9M=;
        b=V/GJmCPyjdgW2SPuBcMUFRjNWwdG9BLNPFzFVkP5HPkOloWyvIH3x0hOcUZCyG8nl/
         Fct83ezEB6BqiDhIXeCW+hkxl921y8zO6g+Mbg+E0cO6YpOEPDDEUJqA9qTSU7jRxGHD
         fsMJ0bldQSYGr0q8tUQWv3Wk4JNMDsAgtCwVso3jEC4P56FlIL49auYdpnJrVfq08kIU
         S5LXqeI4/0j88FvKR1E2oubV1dqtlq9LPf0uXZ8SrA9MpnzQFusu8qk7KkABVTohDtDu
         CLlPgIB+Hgo3gTou3fuUixqUF9C2vrhfcHx3rgNw4qMPfPW+gJ5kiNG5mE1SdGBEj0Ao
         5Jkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790436261; x=1791041061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3teFFwR9sWlJkV5co3BwWK7u5srE/2UYNflhxIXeO9M=;
        b=KF7V6yCWnjFkxAQ3FK7+MTnGdFT6sTc224L0pwtuiOAajsl/Hy5/0WbrAAQg7AkTw2
         MD0iOmtRO+mZ5EDlbh7G/yQt33c+xkijqDlGi+aL1f3lM13GLsWqaR9s/ompBEpSqzDj
         G9afxJmVft84J9aoHSUY5CBvDkZpgIFe0LUTT57gKia8iuilQZYO0dWlswJv8QZD1lnq
         8K5fYNGN71MuMwu8POtp0BtzynBVehJZTCgRCZS+mlY+4LFM5nOh22lpHbJT+OT2W0tx
         B21ZAGCajW/LuQJJ0bYxPl3K3KATUfURI8RrtNkqx5wx7weChj/Eknep/cSWJFmqXT1b
         EAEg==
X-Forwarded-Encrypted: i=1; AKwUvBzU115h/89OsZwlaM9VgDBIHq3nGSI4eNBBpJhvUREjqvmWMSpWouX9q7SapwwM2R8bGoAlpVxo1P1bReg=@vger.kernel.org
X-Gm-Message-State: AFuF++lRghnCwJpz79lv9fRRJnFdXtwtJyTtFyx+kZvd+fuDaxKzpOzC
	fuOrJ8/h82cEGgXEyP84msvxtUUVI11LtnOJ+8GtSF60UKiRMenVnFCe
X-Gm-Gg: AYBFou2FoZK0BgwUCY7Gn0Dn/SADMOEF/5vetBAp4jGOHeR0V373CasL4d70xyzWu5o
	vh+8exoLJN9gXxgVqtLBgKgzaGXMlnm8NRMmXDv/KzEF6QUILGbCn/Lz7F4EVJuus1jg0rceLhk
	uBD+BU+HGmnK3c5Fy55n3n1HrWCr00KedPodOQbZ3lAfEMP3EQT4VSR2UlDHBuZlH504OJtQ4VE
	2w+ijW9A02oDwoWpsEqQWtH1KiPCX3T+cOavMjgmZ+CRUN5nA+YiKV5QN7Y3ylbKA5Lrrvsw4O6
	8n1uW+15pBTFLD5bRTQ7f87bpo5dFNjSR6liYc9LQ9G3jt1Eo3t9v3pi3Z9/D1kbMRiDFWk/r2l
	7LHBACHaW27yiEDi8UF8Okk1zXaCYK4js8R4E/t50AXEcWYBah7gF0BcNNenYvPdUA0CjwmR96I
	QCfSIxnokpd7iJAejb44UmFXsxb3qj9nZPU+OZOTw7QUiq/XG/s6dTRg/hRHRT1b0co4Xs9dL4W
	kh0x7Vnyb1y1umGT1CBM3lEQCmv758PESejmVEi
X-Received: by 2002:a05:6808:3c48:b0:4d6:93e2:5bc1 with SMTP id 5614622812f47-4d72f2476f0mr8388508b6e.66.1790436261676;
        Sat, 26 Sep 2026 08:24:21 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4dbf6206942sm4653798b6e.9.2026.09.26.08.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 08:24:20 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Willy Tarreau <w@1wt.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH v2 2/2] tools/nolibc: check for overflow in malloc()
Date: Sat, 26 Sep 2026 10:24:14 -0500
Message-ID: <20260926152414.251214-3-danishkhateeb03@gmail.com>
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

malloc() adds the size of its header to the requested size without
checking for overflow. For a size within the header size of SIZE_MAX,
the sum wraps around to a few bytes, and malloc() returns a single page
instead of NULL.

calloc() checks its multiplication for overflow, but then passes the
product to malloc(), so calloc(SIZE_MAX, 1) returns a single page too.
So does realloc(ptr, SIZE_MAX).

Such a size is usually a bug in the caller, for instance a length of -1
used as a size_t, and returning a page instead of NULL can turn it into
a heap overflow.

Fail with ENOMEM when adding the header overflows, as glibc does for
sizes this large.

Fixes: 0e0ff638400b ("tools/nolibc/stdlib: Implement `malloc()`, `calloc()`, `realloc()` and `free()`")
Assisted-by: LLM
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---
 tools/include/nolibc/stdlib.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/include/nolibc/stdlib.h b/tools/include/nolibc/stdlib.h
index dc554faff22a..cea8290ac0b9 100644
--- a/tools/include/nolibc/stdlib.h
+++ b/tools/include/nolibc/stdlib.h
@@ -130,7 +130,11 @@ void *malloc(size_t len)
 {
 	struct nolibc_heap *heap;
 
-	len  = sizeof(*heap) + len;
+	if (__builtin_expect(__builtin_add_overflow(len, sizeof(*heap), &len), 0)) {
+		SET_ERRNO(ENOMEM);
+		return NULL;
+	}
+
 	heap = mmap(NULL, len, PROT_READ|PROT_WRITE, MAP_ANONYMOUS|MAP_PRIVATE,
 		    -1, 0);
 	if (__builtin_expect(heap == MAP_FAILED, 0))
-- 
2.55.0

