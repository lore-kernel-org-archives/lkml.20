Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37A5392C5F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789453781; cv=none; b=MMw1biv23V77FQsmVdCHQl/Q/L8iPdwEwjUenKHmJZozryS3Q7RqUj0uySkkGvYj7R998PP8B8bRS4lkcp0pXuUFSbiKKYhja4f610VducH2zXqawOaaQU2cy9QIHpZXTUSaBlAkI6YLN1CqX7W1rvmxWhseATleSTUuwKydGRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789453781; c=relaxed/simple;
	bh=Z5iWUkC6NQtwn75QvzsOHpoxMPbGFFoc5pZ2R3iaOQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Sz/mUqon2NgVherd9MJ9jr7ZEsJXC6sY7m3HQPb8frfKhld7/CjcQ7HZwXKwdsTtEuoo916SBW90WrXjkWPHoJ2WWJHrp9C/Ox1ouwjyzYcxn+Mn98eiuqsjk7DVzi99EnUfnEGOrnzesuNeW/jgiqU38GQe/ka6ZYGjEEBghAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YkfoX7g9; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YkfoX7g9"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cebcb8d7so615026a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 23:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789453771; x=1790058571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jliu2qQ+Am9D5/J1PCi8w8fiwrrDcbTYHcV6N7E5S9c=;
        b=YkfoX7g9X7/lSJf+D962W0lEGVSn6tSwR3GfuMRne76G8Oz3mJGpAhIU2pYtdGtWqy
         Dn8HV4jQ4AylQ/xY4UYsHTLAdchgOuEK/Mm9KDzdg70uNVlpWRHIhjKjMNxTeyZIKBV5
         KhEsMCsOR21PkwK2sEoe1ILRVqO0RQROcJj9pGd9urx/9U4WcEDFhK1L9LBLfArOwQSA
         Vu8gE5T9aOZ5oJsFEO26TT0lfjPmYPRYzL0J3Cyx/f0L3BfX/ABF4+lQPuLIc7yLXl1O
         JWybA6dxCuI9mYeDdHzykF6c47UVIA3c49CrQzp93DQbyPNwGHLhII/rjIK+DYu/kk/8
         +19Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789453771; x=1790058571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jliu2qQ+Am9D5/J1PCi8w8fiwrrDcbTYHcV6N7E5S9c=;
        b=tOzhZAiPfyVQuUDynbU/BM4gGHPz0WPB9RXWl8i8NOB2bMB5BomMUkPvowMRJr+LWH
         CgoQM3eThzqwlueY+GTF8e/ex0kffxMjcV8Alih6HzwzgJczEjcm8PUYDsOjKJQHl5Ud
         /52VU/IVCmW9WzlQporYKMCsQ8A0rCebmCtkZPRd4hGG2zWs6hVximLeaP1zDStSBG6C
         uv2tozT2veyHAQQr+vANJ5jYZOpvNTtl9/lDHFpUirVGyBXibn/mNJh9wv2YKbftpZsP
         /czxbnOGFDxLyMoIyd/fRqXFwDKiRcZcrv/IEt05Hxx/fnErGmHK4ZFfbEJosMru8HK4
         qmBw==
X-Forwarded-Encrypted: i=1; AKwUvByE7QDY042q+KR3mFooN//hkdqhr19oyyeNbgK8KUivNaWxw0g5Qw5+Ez4GKSnIQVZELocuWhRS4xpUjA4=@vger.kernel.org
X-Gm-Message-State: AFuF++mKQ9m++zT83p9ixTsJhlcLgbKQCmNcQ/aok2PsSlgaq8vKh5ov
	QlVaUgQzBuFT31/RJjyjbsLse2hCO40AgX05rFl42hcHYiqOKkVN2Y0RdtZL5SDLv5Q=
X-Gm-Gg: AYBFou0p1nyUgyFK4XEWoXnKDyl9MkSrR2i00pj7OsrlhUayW/MY6jeaFUxG1Btg0yk
	+IkUrlvZiznj2UNoU6UihDAM2xHipGP/cMra3qrDcnsrbt/rAf888hby51LKUhU30FYC8Q4brqg
	I1V504h6JVFJBzQ9urzNcdYAmSA5C+3XZm1yKjjk5EdtUE/Mr3Gjsxgvc9AQzjLgNDTRboVs6mB
	fsu+ugmSgxkPHBtVSPHjZa9U7yn95douKxZMNcliorqEupWJ7xglgTmtMyPhKHG+PqTZPvfFBz3
	qetX0Xnez5y34+/05jObNm6XWJSPPQc/H3iO9PTx9KUtlatNKcWcpSED3GN5t9UI6ikHYnzV/e6
	B7ykgMNvXu8TZapvrVMTOrIEkXh0Keu9Ir9Bs8eKTvwK2rYxqy7PeRLUUH4KEW5Ys01RwMWW4B0
	fyUEppFgtbViIWIXlI3oU3okLMBl78ZRmbC2Jwnrps0biE2Zn4fzZ8HsZA3GLUWvobeI9+S/pit
	K5Z43vubDHUxRnVkMudz7v79OCtexaTuf2xAWk4IU9Dnhg8wFw9b99FYG1SBpodF6fdXCHUeQvH
	I4L94sPoIpEIMxiINBubM4kNOUHbSM7wwuHSAsckEGEi8EJBSZ4hn4/GS9xPvzja
X-Received: by 2002:a05:6a21:3382:b0:39c:4e62:b843 with SMTP id adf61e73a8af0-3db5005bb45mr4318757637.10.1789453771209;
        Mon, 14 Sep 2026 23:29:31 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.252.203.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c6549d95sm6031973a12.12.2026.09.14.23.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 23:29:30 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Matthias Goergens <matthias.goergens@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Christian Brauner <brauner@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] drm/i915: size shmem writeback budget to the object
Date: Tue, 15 Sep 2026 14:29:24 +0800
Message-ID: <20260915062924.2410550-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Before the writeback_iter() conversion, __shmem_writeback() walked the
object's page indices using its size argument. The conversion retained
nr_to_write = SWAP_CLUSTER_MAX, which the old loop did not enforce.

writeback_iter() consumes that budget for each folio and stops when it
is exhausted in WB_SYNC_NONE mode. Explicit writeback of larger objects
can therefore stop after only 32 base pages, leaving later dirty folios
unvisited. Mapped folios also consume the budget despite being skipped.

Use the supplied object size to set the page budget, restoring the
object-sized writeback attempt. Writeback remains best-effort; this does
not guarantee that every page is written or freed.

Fixes: 776a853a43c9 ("i915: Use writeback_iter()")
Link: https://lore.kernel.org/all/20260914111511.648711F000FF@smtp.kernel.org/
Cc: stable@vger.kernel.org
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
Thanks to Sashiko for pointing out the writeback-budget issue.

This is a separate follow-up to the folio-unlock fix and applies
independently. Compile-tested on x86-64 with CONFIG_DRM_I915=m.

 drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index e7b18f7f9644..5751bd25c2b2 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -308,7 +308,7 @@ void __shmem_writeback(size_t size, struct address_space *mapping)
 {
 	struct writeback_control wbc = {
 		.sync_mode = WB_SYNC_NONE,
-		.nr_to_write = SWAP_CLUSTER_MAX,
+		.nr_to_write = size >> PAGE_SHIFT,
 		.range_start = 0,
 		.range_end = LLONG_MAX,
 	};
-- 
2.55.0

