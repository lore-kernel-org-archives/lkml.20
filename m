Received: from mail-ej2-f39.google.com (mail-ej2-f39.google.com [74.125.228.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FDA448CF6
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790149783; cv=none; b=EbyQqu9Lx5I35Df5qF3pNX4Mzc13KhHe4IOSZJTpzTyugsByJpntRzV5KTQ6RxPfMRxaTPU5RhuJt6vgz11epxNDrv2TSSNUqVihWXpwkbYjjMdho6PS5L3urQNxQjyr9T7JyJKLvWiw3rFJsAekwPMhPteFOZQh8Mz18LOYFog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790149783; c=relaxed/simple;
	bh=58zmak3D4O3ScLko3YFxQk7A53rZ4PB381sHrZn1Xn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NE3VxcHeCMV+yigo5XDulTV1+SITxlpdh1tIlA+nCAe4p5j6Jfs0n6Yvs44YZFzB4COjl4lRyFbV51nXM/Pk1m8n1z34jbiXwrU1ZDzPYZZkf5Cj0aqSHVV2hbAYwZCxSF4ZF21zdy+c5JNSFGQh/gIX5jUf8ELHSlP5ZnTVZtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mxkgHuRk; arc=none smtp.client-ip=74.125.228.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mxkgHuRk"
Received: by mail-ej2-f39.google.com with SMTP id a640c23a62f3a-c2940ef15c1so70777266b.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790149774; x=1790754574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bEde7YfaloBRyUhSbmNY1j2NkDWIsjwrgzwyBWTrgFY=;
        b=mxkgHuRk7jvAftQdmDglaLGhTWlGFECYLREkdvk4gSj6Nh92XCzFTtRaoPgaLM8E3+
         dFxhHuJ0CzRT+3yN775E3y6gj2xSjAf/1RQuTZlnXRGbX3fz3PsiN7rab+hJ2XT3fNA9
         +1GSIcpxAR5JJSF8glxtKq2hd+9nEN+kFY8Dy1VG4LjvkOvaLvrJHVg6HsCTWBwzKOBr
         UWdf8jy85wPKBjJNlkuhUiR01g91JblMz1j1AUz+oabO6O1mqcNuwFA5u/lj1AOh2aw0
         hN7fJD7GYAclIhcu9l4JnFniYjR/qV/ws/3J/pH3J+BuRIveMz73KPScGZrYn8OR+8q6
         ff7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790149774; x=1790754574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bEde7YfaloBRyUhSbmNY1j2NkDWIsjwrgzwyBWTrgFY=;
        b=UjwFAGlDbRI0wMHtb/9x2UhqvAyQl+No/VP1XwTzyf5qLsgKHMyi3+IyZF1ZulcFzB
         CR8HMzYRv6r/eydxMTUbwNhVXDLmerRcvIjAhuonbiYwvtueyHja6rxZZm5loGZAAWmt
         2x9GoY5F5dIUtNmQh8iQVYAUDHaRhjPr0s84rqs2g75Q/Sy0rjgfrFNHxki6kkXxnTiQ
         TnH2FmLU+7unwYfxZC0u3HzTpARMsZLyYWfIt2aUHVbldHzLX+DeaF3RizWHqFwT7Tq+
         wXgEyeSziKddw7YlF205kGgWZ/FPw8IOZO/ZEx5poiHDa5pC1VfPLxhI7k0uAO+IeslL
         KRsg==
X-Forwarded-Encrypted: i=1; AKwUvBxeIKwvsFNSo+fA+eTyefW+ceVfW9IhqUqEtPasueoYLFfL30v8Yb43xEUC4/DwtEFXj6V4A+k8Hs65ITE=@vger.kernel.org
X-Gm-Message-State: AFuF++lVKmWbYxxICG5xq0w3YeJUvEX/DIpKL6A2HUniQMbpcG+xzhFk
	h/+137lmUUw9StLUmDNnRBWufQj1LghntCGptZvTK+8/Vg0WG9/eyKsEMyxqaGV8
X-Gm-Gg: AYBFou1mKDlHeK3jaRG/NfTH/BVskdzdw7RInS2rLE1numCvpQ5Oa+A4BzQTgMlpwSY
	8a8P6fpArzg/cO7xWIxplvVzz2QLmAqT3033tMCU/UJlYFwCfx5QdRms8Pk/liols+ZJiP1Tdlk
	zHTD6TU2Dy7o+oNSRkuPHC3dDvsXDsag9ZNspEtp2Q8xMfrb59IyALcnxo3rrmctKkkpzYaNqip
	RlRg7xIqeZGufjkw6APv0bN1bsbooVoB9dCJazIECh/nOpI1F5JyESI5jZUzb0BbA8B7TAdVn93
	0zDHFLUVaDT6EAOCTNKfBN1xq1lcwyZTzS2LqGDW9ZbLclqDmh3x8hd1ytv4jTsMhsK1derX6od
	KmJH1rMnrbHf1pcBf/L7HPhhudA6qCxNVz4WiRHY1Kp8Azb/arjKC6e/lP0P8oLPYF9yl5p4LkS
	lueCiS3lHH6BxQTckw0tXHloY0hwevJIH28ISKI23FuYRZueCj0y+IslqLJm495JgIYVPzsK3ZN
	ejmfjyHtiA6HOdEiTZ55qQuSVzgYeMmdwAJFzj0
X-Received: by 2002:a17:907:6089:b0:c29:44b0:1428 with SMTP id a640c23a62f3a-c2aae3738e3mr134989366b.42.1790149773766;
        Wed, 23 Sep 2026 00:49:33 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c6f5asm64951366b.15.2026.09.23.00.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 00:49:33 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v3 5/7] alpha: fix the local TLB invalidate in the UP flush_tlb_page()
Date: Wed, 23 Sep 2026 09:47:48 +0200
Message-ID: <20260923074903.862898-6-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923074903.862898-1-linmag7@gmail.com>
References: <20260923074903.862898-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The uniprocessor flush_tlb_page() in asm/tlbflush.h has the same wrong
test as the SMP one: a targeted tbi() is only guaranteed to invalidate
the intended translations when the target mm's context is loaded, but
the gate is current->active_mm, which a lazily borrowed mm also
satisfies.

Test current->mm instead. The else branch it falls to already exists
here, so unlike the SMP side this is the whole fix.
arch/alpha/kernel/smp.c is not built with CONFIG_SMP=n, so this is how
the same defect reaches a uniprocessor, where the flusher kworker
necessarily shares the only CPU with the writer.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/include/asm/tlbflush.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/tlbflush.h b/arch/alpha/include/asm/tlbflush.h
index 0c8529997f54..9ae1902faf8e 100644
--- a/arch/alpha/include/asm/tlbflush.h
+++ b/arch/alpha/include/asm/tlbflush.h
@@ -87,7 +87,8 @@ flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
 {
 	struct mm_struct *mm = vma->vm_mm;
 
-	if (mm == current->active_mm)
+	/* A targeted tbi() needs a thread of MM to be current.  */
+	if (mm == current->mm)
 		flush_tlb_current_page(mm, vma, addr);
 	else
 		flush_tlb_other(mm);
-- 
2.43.0

