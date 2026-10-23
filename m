Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792734322;
	b=ae6enRDvxjvuVadHY25NkX207r/ILK9E7JtDWDh321CXZ+LzfxNCpwVAmgXmZXpn/Enz
	 RIMDeydwPl4LrQUwLlemAmgNt34KPzbQpUXjDTsidSUpVwcDbB9OuUpYRagjj73tLzmLY
	 8lSoS5RqarjbOBy8yfd+vhI+7RpAvHm06FWHQvipFZmVZpkG6K11LkrpeicZnTuNxAdci
	 UF6wzC0CpaK3YLvZ2gNZFFjvy5LyNTR5muCyVbuJVZTt3+hr+0xiqQ3wahai643zz8NRP
	 FEuAd6aBe2C4dwOGbPgPNCTYLSXJ3X0RYPFbcLeOl5u3OU/mSPwRtiluqkPG73M+7kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792734322;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=zx81mJCQGymu1OZlc3jNrPjZqmEatAtALfsBDY/sthM=;
	b=CJwaPFygvY3OXpVWy2q8MLlEFUPUZPrJQWBLYaSLEyJk3RpVs/le6/9VB42UtD9uUKFn
	 bq84/wdDsZpGzoR65p1EgRG/9fTB3qDxksr+Ys+dtdkodwjB99F/3On+Rl2HUBXpcgwuA
	 l25jr42WQFPfwyOBEnTqspv1iAqvgJCibwrFY7VejZANHBF8dgiU5iW+CQuQLDRJzD4+z
	 GvlwolI+Lkaea6kKJVryW152ZL/sbFgPv2lgAUtWC1C17OMKfaH+KUzeQT5sLdCgmoBo9
	 CwVDob9FhNSZJq3jizmMjKHTrkzII+jgxyuWUcpjxwQFNc3PqpOaVN0QY3qvA890iBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--gthelen.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=FIO3Qb5W;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00475606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 05:45:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00475606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--gthelen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=FIO3Qb5W
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso752717eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792734321; x=1793339121; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zx81mJCQGymu1OZlc3jNrPjZqmEatAtALfsBDY/sthM=;
        b=FIO3Qb5WnvBM98/TM8wXx1RxfrCHxCqIkYMFvFvIeUzVTPIh4lSNmDuSL+2ORP5mtO
         Tzs2jWz3O8BuxWCTKTINprOMfhfbcM9ar/2fpWVVw5Axqid3v8GJ+qh10kW+fBLy2h5W
         STUABmNiV/p6DW8StYvOoFj4oQhj/5JR8d5yuE5ewy333gR0Q9+UH0imPY7U4G9jogW/
         gd6aInNHorTJd2Ivh20RIlGOn2f31hEpE6wN/P90mMzm9SDDByTq57vG49ZE1KfWKVbG
         OlsxNngDR+3OT/VWXavLddeqeAOCFgbYUAIDCYmAq6qrD9aAALM6iSgMEiyGVnzUMSrc
         9kPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792734321; x=1793339121;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zx81mJCQGymu1OZlc3jNrPjZqmEatAtALfsBDY/sthM=;
        b=OkmoabbNfuO2GG4y7zNmXVZXP3PfmmtuAXq7Gz7gcXVXFfCB5fzzDA3oVVm2ukmGxs
         g+r4sYYijLBwHrJqwRIAiDR/MXnSR6YUEbNiP6NqxN6w2uckbqJohZ8S0NdnIf10FEHa
         J02sN7mZTy+aJfoDUvMKgBXJYlwGwMWDzkx0jEuo4JpBAAbgklAsA6EyNxF8a8wtH0Yh
         VDjbpRiHYIKkLbj+KCP/Zd9Hk2lVK2OMPD+efH0Q3Ka6Ne+yB5kMDK9F5//mFe+ZltDu
         n2WgSzw5WCZJGPW84XQq1JLqz2Y7NhknMrE7xiMX1DCtVJHw9vwVT9EFOYQA+R2+Amp0
         rp+Q==
X-Forwarded-Encrypted: i=1; AKwUvByjvw4iU+jms4/nGSqEJY/Bmfrz2C03xe3+69bTNjzYCjUd5wPLSyl7GlkRLuOB2fa3pdXwKupufbiZ8pw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmyiK0WHkq88AFHazqxH3BHBzw1kGLcLUzLwcaqi21sEjk5aXP
	xtKr5nctP4kJ4IAugAlGsQOjEmUsCMgkVp1q+CjhtCOzYl7aj1fA8eUY30x27WsuMTVwDmGR2y1
	co/n6zNERTA==
X-Received: from dly16-n1.prod.google.com ([2002:a05:701b:2050:10b0:14a:84ec:bd53])
 (user=gthelen job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:28a:b0:18e:355b:f6b3
 with SMTP id a92af1059eb24-195c6e0b80amr1891111c88.23.1792734320663; Thu, 22
 Oct 2026 22:45:20 -0700 (PDT)
Date: Thu, 22 Oct 2026 22:45:18 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261023054518.3258350-1-gthelen@google.com>
Subject: [PATCH] kho: check fdt_phys in is_kho_boot()
From: Greg Thelen <gthelen@google.com>
To: Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Alexander Graf <graf@amazon.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Evangelos Petrongonas <epetron@amazon.de>, 
	kexec@lists.infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Greg Thelen <gthelen@google.com>
Content-Type: text/plain; charset="UTF-8"

During arm64 setup_arch(), efi_init() -> reserve_regions() calls
is_kho_boot() before arm64_memblock_init() initializes memstart_addr.
At this point memstart_addr still holds its initial sentinel value (-1).

When booting via kexec with KHO enabled, kho_populate() sets
kho_in.fdt_phys from the /chosen FDT node. Calling is_kho_boot() ->
kho_get_fdt() invokes phys_to_virt(kho_in.fdt_phys), which evaluates
PHYS_OFFSET and triggers VM_BUG_ON(memstart_addr & 1) on arm64 kernels
built with CONFIG_DEBUG_VM=y:

  kernel BUG at ./arch/arm64/include/asm/memory.h:377!
  Internal error: Oops - BUG: 00000000f2000800 [#1] SMP
  Call trace:
   is_kho_boot+0x2c/0x38 (P)
   efi_init+0x94/0xf8
   setup_arch+0xf0/0x240
   start_kernel+0x84/0x490
   __primary_switched+0x88/0x98

Check kho_in.fdt_phys directly in is_kho_boot() instead of calling
kho_get_fdt() so that early boot callers do not invoke phys_to_virt()
before the linear map offset is initialized.

Fixes: d6d511639185 ("kexec: introduce is_kho_boot()")
Assisted-by: Gemini:gemini-3.8-flash
Signed-off-by: Greg Thelen <gthelen@google.com>
---
 kernel/liveupdate/kexec_handover.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
index 7c4d86daf86d..d81baa38497f 100644
--- a/kernel/liveupdate/kexec_handover.c
+++ b/kernel/liveupdate/kexec_handover.c
@@ -1630,7 +1630,7 @@ EXPORT_SYMBOL_GPL(kho_restore_free);
  */
 bool is_kho_boot(void)
 {
-	return !!kho_get_fdt();
+	return !!kho_in.fdt_phys;
 }
 EXPORT_SYMBOL_GPL(is_kho_boot);
 
-- 
2.56.0.257.gf7497c7d27-goog

