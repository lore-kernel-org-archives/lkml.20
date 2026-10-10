Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F4149A3AB
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 14:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791642358; cv=none; b=W6DAomanvHvBwRmoZnlzcKeYPlaBm15tziITHrHfBd0IOcGbDPEQaeZcXLpjD8ptdvex53jgOH53Y4oMQeHGoWXVZuBvTz74wMb/ofq2tngV+00iBQSAlo5HB/AVUnnrveTJTenS0Rd1pDUMoNGIbE35mUSVG51vOe68YzDKqeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791642358; c=relaxed/simple;
	bh=pE164w/gdv8iodYSvxBPesPyzC6AXZP8aQq7i2DjZoc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bqIuAcaNcfV+j3TNSFsmFFus203/thLj7xhtr8Y/o0OdL2pN0cKbNIdsYaPOHaMSPkWnyUYZDZRGa5OFRghmhDYTOy1jAwE5neApVFwVpbrChbGPcyX1tBZAeoNpXV4Wm9fU9pxCnX6dSl5q3HsHKH8Uaj6d4PbKtlsiaZoACh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aW8OSGhK; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aW8OSGhK"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a601ba6870so961422a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 07:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791642354; x=1792247154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bQvHYHFcEQon4GczfaeGOgr1btQ5iYy/c5jwHC6xQwE=;
        b=aW8OSGhKnP2Y2wa4y2MTRy3kaXZIv9jBOWTw8cQ1b3ABhCcUVgrt+0YCDy5/nApIbK
         g4RbRZ9IS4YQ/QT5dWS9fzkxYFHgZ/NeN0CbdgW+y3kRAaRYoB+YI1KehQDlmiFmgh+X
         vmxoCOO2+1VG8L4pURSQ+/7MZ4Ifw9sMBdvcfqYX+we+R2kKE2OA2Zi69YyF8utEaFin
         mErEPPSziLkwjRDEDiBMUwobcD1zqvHr68Zwuu87mdYVPHD8CaMYdsuzyUz5fKnSMgFI
         8EzLAenjVy9wTCuoBAplwdMnTAaDuBSHmFi2sNQaNyDqdb/oAaeEt3Ztp+nP4Ceex5AZ
         fJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791642354; x=1792247154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bQvHYHFcEQon4GczfaeGOgr1btQ5iYy/c5jwHC6xQwE=;
        b=RQm/oPBQTidA4E5Mol9ZrkRzJG4hrbgFTQ5q2q3os0QjUa7+ZE6+50/y6PvmXjh09g
         L/lxyn9F/8HR/WOHRUFQhym/XgWZLf9jSiz6gEJ5uxrqm6DkeOX2hCSYF+ueTmawFhcQ
         op1uFnQFG8Yk55K3twr91uUurP2Z14rXyV9+zuUkwBN5Yp7pQweZkI1j6iLE2LDZ9oxJ
         eXmF0emaalViYSHNX1ZQbUgZtGdlsHCqI1xjVfN6Nka8V5upW5SzCvujZN8vcHinONbz
         DEhOovkH6x8efNHgi6JsGVlvf9fSkRgGVCxIpiou8tAMYEmxgdCzwh8hLQedwz6MNZ/e
         Zi0A==
X-Forwarded-Encrypted: i=1; AKwUvByX8lfDNloiGzKKWE8OsyToREFpM4neBOVQDVKpvQHsOtUXAb7X1FvOTLyIH1TP4CC0Vwxf80we4OWaXMk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxWm7nghHXhscLb5Tu4Bn7KHY7Nm/S+frJrCPqIkhiwo4BsX7u
	HriB/sTGLUNkSfyiQzCUg6EUslUelRe2gFlmgRe9rhFo3qSuwPjnkt89
X-Gm-Gg: AYBFou0EeMhlhSgGsIPDPHz7kq08Zo7o83ZKc/Me2Qjho73n0yZcVsl9+DY9hKtI1j4
	JohI5G9No10oDswHVigGhgxMcNsyHI0JBQb/XNwSJ8YpP2+7+EOnBgdfoIuuEZKIfR2BR2ydpPI
	IEuc/ns/0hWaCdWGw0gPqPPG6SZzXe2hQ5ZmJS6zcIWhMVV6cMv/066qEjyZIRsSQRNjQY41+Cv
	ExUNqxYpd3ftd0K0Mohbxm2MGMGLc9SANzJQOPJy9MAIjq596nVEsw0Pi+4Xrns8q4L1SMMN7Ef
	gBDFrpODjyM6rnYCzkxOQht6RkniSMxlgGzC04ey+pO2Ar0CDdvli3FgzIPu9t+wJobkytrEmfB
	HqL7zZEZeeTIX5gZdgCMyEEn6eu6RtINd1yr8GHb4FCWHglw8TgGoZdFVYi0T55FSKKBZ37pWKt
	6dOxldbzkbSX98ud9xt/IZWO/VBsECfzMjhYTntx0CAIW0b4f64vUNEuD6f5G6LSJSHwXUJBkrL
	/v3BLhOOoutNRZPOPYsu7v2VbBRSveq2tIHLLz9XyXAuGW8zDA=
X-Received: by 2002:a05:6402:2498:b0:6ab:1e8:8b7e with SMTP id 4fb4d7f45d1cf-6b17c27bf79mr4614556a12.32.1791642354223;
        Sat, 10 Oct 2026 07:25:54 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dfff40sm2635586a12.34.2026.10.10.07.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 07:25:52 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v5 5/8] alpha: fix the local TLB invalidate in flush_tlb_page()
Date: Sat, 10 Oct 2026 16:24:31 +0200
Message-ID: <20261010142533.974797-6-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261010142533.974797-1-linmag7@gmail.com>
References: <20261010142533.974797-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

flush_tlb_page() invalidates the calling CPU itself before asking the
others, and gates that on current->active_mm. For a non-executable vma
that means a targeted tbi(2, addr), which acts on the context currently
loaded and is only guaranteed to invalidate the intended translations
when the target mm's context is the loaded one. A lazy active_mm does
not establish that, so as in ipi_flush_tlb_page() the target mm's stale
translations can survive, and nothing forces the old ASN to be retired
afterwards.

Test current->mm instead. A lazy caller then takes the flush_tlb_other()
branch added by the previous patch, retiring its local context. Adding
that branch first preserves the local invalidate at every step, including
on EV7 where a targeted tbi() against a foreign ASN appeared to work.

Which callers reach here with a foreign mm depends on the configuration.
folio_mkclean(), from the writeback flusher kworker that has no mm of its
own, accounted for about half the calls during writeback of a shared
mapping and none at all on anonymous memory. Those counts were measured
with CONFIG_COMPACTION=n: with COMPACTION=y, asm/pgtable.h overrides
ptep_clear_flush() to call migrate_flush_tlb_page(), which rendezvouses
with every CPU and handles the context itself, so folio_mkclean() does
not reach this function.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Reviewed-by: Matt Turner <mattst88@gmail.com>
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/kernel/smp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
index e4ba0aab8a66..a5a42ae4a7d8 100644
--- a/arch/alpha/kernel/smp.c
+++ b/arch/alpha/kernel/smp.c
@@ -684,7 +684,8 @@ flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
 
 	preempt_disable();
 
-	if (mm == current->active_mm) {
+	/* As in ipi_flush_tlb_page(): a targeted tbi() needs MM current.  */
+	if (mm == current->mm) {
 		flush_tlb_current_page(mm, vma, addr);
 		if (atomic_read(&mm->mm_users) <= 1) {
 			int cpu, this_cpu = smp_processor_id();
-- 
2.43.0

