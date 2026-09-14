Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22653D34A8
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789383373; cv=none; b=uRT8pYG/i5Bcm/aIond0rwDy0s28eUZ2lcN47O3odaVhpInK3jTkdR4m2C9RzuQTGIFFI4tEfPba8Kti5xXhFs67mN/vTLndRUw47579FW5VPs0FCOMDP9CpLf+XgjV9ZHsLSN4ZH4XXgx/c8qRz0CNvn7vntb6nVK2CHy1lbS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789383373; c=relaxed/simple;
	bh=DsZy+tGQysgq64AMpcXCuzmJMM5qCM5ZyVfOWrfp2wo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sWR8QSkQwrTyllI+TmYeDgOjRtBpX+IsumIN8IWrub2voUm7sMhec/4q6qv8ci98eIWenL9wHBAQwtTrYKQTwNaiuNQORucjl7X+IKqOP826nFhBmOpmWvEUlaN9j1YXijO/sb8Ehww4bDju6lUrWAmE9InFqsozpzp8RvumXd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WFS97FXU; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WFS97FXU"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-869d181419bso2877067b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789383372; x=1789988172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gj8h2lt98zX4NzJl96Knw548gSSkkGwsjExtVdozT0A=;
        b=WFS97FXUWJAkk+BG7LTws43mrj91VBaDsR2zSx+vuc91WTQ7CPvhieQQRdNfAMG2Yu
         YJZlc1C/R6BIDKr721QtDgSOJGQ5iCg39NRGUlxQYNZgrL9DzKfjPv+zKnBhe5StVrzZ
         4mBkmDN5W/a16bXcFOXFVic6b928iUKsCwqVa0aLCBms22i4fA72gRIu5FrWJp2Z7/Ap
         dpUIzdu6XfR7noYR6tGsJ5aweEh6I15ePHdh8s56O4d+8WiOh2UE3/cqzmZLKB98JLyI
         POqNtDpu+jH5F/WuBHG8AMJa0W6VUmRgXqcdTdwPxofLfVY0RQX5SD/HZdp+ODbdAIii
         DC4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789383372; x=1789988172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gj8h2lt98zX4NzJl96Knw548gSSkkGwsjExtVdozT0A=;
        b=roS0VqaSxnzhoylyKyKmAwyKRT027T6TwGebujdpnPKLOfi6ug+D4mkgrJn3eaeaFG
         UKUsUttDDjWZGbhUCB9pOmo5KiZxiawOZcsd+1CaS1OFQhY0HocCWwfs+GtO3eLDs+nq
         GSlok0njIRlyYFH9ahO/jVQUfGsSP5+uAEQiVAUutr76YbvQogqzUMnXLdBlHQbSM09c
         +Y75iI01JwuSGHiPycvIWjTgtaJFVKGOYuUPalnZHwvjigpQMXu3AKOtd9+PTlDGgSgF
         OwYKqPNC1Pya3AVJR0SO3D/yk2zP/OKizqlX8EQyQrpNM6VUY2/YLEuFP/8XvVAvGnSZ
         QJ9A==
X-Forwarded-Encrypted: i=1; AKwUvByQ+WLidHWX3ukoySTOU29oKJB9yACX+fQstsyaUWDG3jwihD9ggVpuk5EuppyupwMwcizRAynuNkctvBw=@vger.kernel.org
X-Gm-Message-State: AFuF++mzRgHU5Dfx/5rWeWlfFSHu67ap5kPekhxUqLpBgyrcNWW6G8PJ
	BZQa627Hu+MSq/GRdKRHBab/axs/9KJS451BeFMCo9iWV+fpDEV7WOXr
X-Gm-Gg: AYBFou38Tterr7TSEK5absPyXUG96jZGk+HjJl4Caj5ERvw5tyRZ7Uf5ZUfvFazJTJj
	l2T/Rr0B/y5fqK/dZBXw0O2RjqCHbYhL3pPXN/JyspmFDPhVYxOkm89gr+FINke21n6FQCnq82a
	ljtbBSgHEszJY/4VnYkCMU4nL7o6TLliJ++Z/HFy6nGfDFje/Bk+N28spVG9OSiHsjoClLEHpJO
	O2joz6t2OKsterSFVwJSlAKXdIa5JoCdYqujMApyVdJ9xS3MK6V7zojw0I7o1tbtSX6nqNOfRLt
	w95JddQVVh4w+uqRPbgphAOqJUZUyDz+FrxbYws30uf1fp01YwKzMOKXX2NVwlHMg/55rPjVMEx
	61RANRT5/y74MZ/FVjcEMUxz/ap18+4S8M9zGquLI2ZEXNPSJIG6msgClSauGUoi010cwDavMk/
	N0qxDRUb0gT4sTv11y5oRnC4fkDTBpgVrWgqKEiw6npvQAQ30ZOrkIBrJrx4fOw08R+PLKWSzhB
	KLj1rrPl+JVo3XktChoWz29kMRObSuFqyvRrsr7f8SdFF1uGxsE4e3rD8Zov2Nt3Cv4/RmyhGsk
	8hxw7eyddHAxX8hDSb1U1plOa/NWjNHbIfpj7+vbaReBpWYErUmBW+1as/SxKO8=
X-Received: by 2002:a05:6a00:438d:b0:86a:9be:6bf9 with SMTP id d2e1a72fcca58-86f85108442mr4695374b3a.12.1789383371846;
        Mon, 14 Sep 2026 03:56:11 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.252.203.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b287c481asm4589354b3a.11.2026.09.14.03.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 03:56:11 -0700 (PDT)
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
Subject: [PATCH] drm/i915: unlock shmem folios after skipped writeback
Date: Mon, 14 Sep 2026 18:56:06 +0800
Message-ID: <20260914105606.3997649-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

writeback_iter() returns a locked folio.  The mapped-folio path redirties
the folio without unlocking it, so shrinking can leave the folio locked
indefinitely.

shmem_write_folio() can also return AOP_WRITEPAGE_ACTIVATE with the folio
locked.  Passing that positive control value back to writeback_iter()
triggers its warning, stops asynchronous writeback, and leaves the folio
locked.  This can occur when zswap rejects a folio while memcg zswap
writeback is disabled.

Unlock folios on both paths and consume AOP_WRITEPAGE_ACTIVATE so the
best-effort writeback scan can continue.

Fixes: 776a853a43c9 ("i915: Use writeback_iter()")
Cc: stable@vger.kernel.org
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index ef9440166295..e7b18f7f9644 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -322,10 +322,16 @@ void __shmem_writeback(size_t size, struct address_space *mapping)
 	 * as normal.
 	 */
 	while ((folio = writeback_iter(mapping, &wbc, folio, &error))) {
-		if (folio_mapped(folio))
+		if (folio_mapped(folio)) {
 			folio_redirty_for_writepage(&wbc, folio);
-		else
+			folio_unlock(folio);
+		} else {
 			error = shmem_write_folio(folio);
+			if (error == AOP_WRITEPAGE_ACTIVATE) {
+				folio_unlock(folio);
+				error = 0;
+			}
+		}
 	}
 }
 

base-commit: cbd3dafc2003db679ccd2f6c6a2551db79657049
-- 
2.55.0

