Received: from mail-yx2-f6.google.com (mail-yx2-f6.google.com [74.125.224.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5125592E9
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 17:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789060628; cv=none; b=HufkgTfCd0WaSY2QBwl9jpN6+BgfVohqkpiIER9dtjBVNoTb9KU/zlOLWZrkWVMOT5Kff6PsMxhgKnQXMp1FH+aF/3a8WOoh0/YdcuRbhrwdbob1Mnrj309QH0BYM0xHON9m6KgO/Ooz4NTL1L8fx6/FJ0tVHZrpM+D5FiGyE+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789060628; c=relaxed/simple;
	bh=1oqaa9bELSRKW3Ogntg3bC/zWki6imZPjxfFvD10X4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XIi0r9s+V2TkGV54kRW63IJcOyzdwNJNVbpu749krFcpIw0Dv2yxpazL7lTEbw0CDek1Fr4a4iOkK2Pv7TsmogjRAKmfgyonfjUIPMjRFN5G2Dbi4+rdu6tMk31KciKIkrosQF/Goc9Iz7etwKUXIGSK+IAW2kzppUPxSm5oDI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cQhFtbZh; arc=none smtp.client-ip=74.125.224.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cQhFtbZh"
Received: by mail-yx2-f6.google.com with SMTP id 956f58d0204a3-66e623a0149so2331386d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 10:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789060594; x=1789665394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G/4KB/W5umJ2NwhZ9AnF6tdCnGIfxiKJfL3QRGzZeTE=;
        b=cQhFtbZhBkH+P6H7sDufFJv7GnhZcvhjQ9PiLspOLecNGTdrLeldLUa7fxqP/HQHTI
         mJExILobqzBSvfV4gMWS0qqz3K7CxmUtt19zjweZRz50Krd5ntwUkKwY0Gb8cr/8LSQ4
         gnVE5AfYIv/z8fZi+Fn3vOGAGmQCYDDxa8IaNNK3b9Az6fDPlloIMNvc3Cf59tPebCLR
         9huvyLQ/mVtjXLLwDAWhdy6dFMSfjb0SDtN/vhkSJZ9cu2fGVuFiDBnBalbIXLXZlZAW
         Jcog1riM5hJaBc+WD1HwbX01g9DUKtmcjNmeELBbj6RrdI8FM1VEtIicJSFW3tkp0162
         sHbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789060594; x=1789665394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G/4KB/W5umJ2NwhZ9AnF6tdCnGIfxiKJfL3QRGzZeTE=;
        b=Ok38ZOVfheQvJfzos/LVwJKrWaFonLwDU9IzTsPoCpJ6ERPVS86F9zYcp80FPU1UH7
         mytUOqWjesjkbhaXKBOLJcYDP2fuG44VPRUV6PuhAkoBMWvvLaIChjhmkWNj7nieeSNK
         5gOvBmfZI3d4qeDZf2V6F6AU8NUQ8iJT6inOYk2ztdWpogi4G6FwRML0+O083Pqnxmqj
         P8lTAfJEtrL2K6/642+qGp3gM3GTg2xfzMWibBlwkl93LJichp7mZeWJeFByR+PHI+B7
         VjR4lfGqOb+9EZZHA7SkygtXBKohIwMH4KRBeS9IdJWBfq0hjt2XIUqlWH+ruF9vqCVT
         45CA==
X-Forwarded-Encrypted: i=1; AKwUvBxl69Cc4OPCEAhIRlkZbX2xhf7mV0tudnydRuzF+W6kQvxI4odbiEhaW6+zjAaOB0daPulsCrDYJRdDLKI=@vger.kernel.org
X-Gm-Message-State: AFuF++k7GFaRf8FR4yxb4TJBRZbhrJJJf5YVL30d+rD4pWkQGpNniB4M
	Sn9eoZa2iJTB2d2Tf6yMaM/bSOb0AYXiR6knl9ktaPCMXAhNEIs9R0Q=
X-Gm-Gg: AYBFou0cOWzfvM7wkzlrTPj32R5493mdRng0Xt+/ExbSJjUxlD64b2nKzFDZVWCDryL
	8gRaXfupOJLcUfJQ29G6RpX0k0wuy/Hp9mj6RA8eF6bAHidPbMcHgbJtgc2gO5byNNHHT1gjsAZ
	45xlY8gM2++Wv66KLdVqad7S4uooYEMPf0Q92vT24Vgqq+BdBw80ZFoWVQcd1V4Q3twnxFrGHQ0
	ZcP7yYdaSljTZmyU0TCcdjXoW/gwPlgLk6OAX0lNLWu6DhCS0IsiI3aHM79EYwKHakHCICvStN9
	kVnvFHE87qhfXtYVF0F6Zu80/hGNRRhUVwhWOvbevIJH96CfnXBJ6ochwYhJpTobddu/oqIeU4k
	bIXJZnxRzLkECvpF8z3kfa4N+WGTzdxSmgwmiHWD9Amd6dmP1A2dfcrRjjJCdJeT2edylDZIMWV
	DA96Npi1NbavYHyY4v4k9wOvdVl/SpROpbGCbB6jc6sBnStys4Sb/v8+N1P/20qpo5Hejks9lZo
	3UAYYsg7FliczuBUPgG3HWIX7rrN7CTe0HldqbokJqOe4Jn5Jn0kbI+8FPC
X-Received: by 2002:a05:690e:4503:10b0:66f:c1be:84c6 with SMTP id 956f58d0204a3-6712473ff01mr113462d50.52.1789060593948;
        Thu, 10 Sep 2026 10:16:33 -0700 (PDT)
Received: from localhost (23-116-43-216.lightspeed.sntcca.sbcglobal.net. [23.116.43.216])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb48f1646sm14291862d50.9.2026.09.10.10.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 10:16:33 -0700 (PDT)
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
To: sj@kernel.org,
	akinobu.mita@gmail.com,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: akpm@linux-foundation.org,
	corbet@lwn.net,
	bijan311@gmail.com,
	ajayjoshi@micron.com,
	honggyu.kim@sk.com,
	yunjeong.mun@sk.com,
	ravis.opensrc@gmail.com,
	rientjes@google.com,
	weixugc@google.com,
	jic23@kernel.org,
	gourry@gourry.net
Subject: [RFC PATCH v2 3/9] mm/damon/paddr: lock the folio for the page fault primitive rmap walk
Date: Thu, 10 Sep 2026 10:16:17 -0700
Message-ID: <20260910171623.6638-4-ravis.opensrc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910171623.6638-1-ravis.opensrc@gmail.com>
References: <20260910171623.6638-1-ravis.opensrc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rmap_walk() requires the folio to be locked for every mapping type it
walks, and the page fault access check primitive takes the lock only for
file-backed and KSM folios, so a plain anonymous folio reaches the walk
unlocked and the walk does not install the marker.

Take the lock unconditionally, as the other reverse mapping walks in DAMON
do, and release the folio reference the lookup took on every exit path.

Signed-off-by: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
---
 mm/damon/paddr.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/mm/damon/paddr.c b/mm/damon/paddr.c
index f4fa7c231e551..5fcef3005c536 100644
--- a/mm/damon/paddr.c
+++ b/mm/damon/paddr.c
@@ -91,21 +91,25 @@ static void damon_pa_change_protection(unsigned long paddr)
 		.rmap_one = damon_pa_change_protection_one,
 		.anon_lock = folio_lock_anon_vma_read,
 	};
-	bool need_lock;
 
 	if (!folio)
 		return;
 	if (!folio_mapped(folio) || !folio_raw_mapping(folio))
-		return;
+		goto put;
 
-	need_lock = !folio_test_anon(folio) || folio_test_ksm(folio);
-	if (need_lock && !folio_trylock(folio))
-		return;
+	/*
+	 * rmap_walk() requires a locked folio for every mapping type, so the
+	 * lock is taken unconditionally, as the other reverse mapping walks in
+	 * DAMON do.
+	 */
+	if (!folio_trylock(folio))
+		goto put;
 
 	rmap_walk(folio, &rwc);
 
-	if (need_lock)
-		folio_unlock(folio);
+	folio_unlock(folio);
+put:
+	folio_put(folio);
 }
 
 static void damon_pa_prepare_access_checks_faults(struct damon_ctx *ctx)
-- 
2.43.0

