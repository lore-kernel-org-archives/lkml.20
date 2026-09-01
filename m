Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1E8480331
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277918; cv=none; b=OkQqjA602JBfhLKSoYjptP3QhVWj787IMG9JR48S6OUB7SlxiYKbx4ZoxCi/bGM1L2w+48L90uPXMsIgh+BtnjEU6BY21T/TSNdF1epTsSbSGEZ5/aodfJk2q/c7EVycCqO8tiGghVlBYixSaA/Qqm8V2wRAi+GmAOlXrZTJMZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277918; c=relaxed/simple;
	bh=zu8KuPSubmuoE6ltdAxTasohyn2lxwD8t4JaCPhTGX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ReRwD6z2Uk5Id1ohoyJb253mh3/Pm1mPEjkNg/lMgZunDp61DyZSevxgbYW5On5HBedOkMMrDk/fKa0+M05VuUSiJMvscymDbwRLGI79oa45eKxvF3bugBgD24ogsX4jl/OZeqJfwCtdmO9FePOX3q3gGx20F9fp6boeN0K4ScM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fu0fD3f9; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fu0fD3f9"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-66e5d39cfe1so3870d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788277916; x=1788882716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3MdHgZtBfTREn4V8If7CDYoqsV/YDIXtFEG1CpRc92k=;
        b=fu0fD3f95LgoqKCVOCayZBI21PE6fSDU7sFjJj6HUdEFffafr8hUnGmMR4dTkgdcYe
         FKD21LHwtnzThm34nkIRhpBZ8XlO+Rgt1Hg1RoQOiX0HlDg/JxgJSTHwL/OwEMP72FMS
         BQY5c3YFz0MAYfjyPGvoh6wPlZ/926anoQTv1FzpdwEA78UPVLNc51fysHA08cC68ynA
         GzEb7Iyd1/8rwmuZ1BJtf4LkFpBoygmrLGowZTfx4PBgrmUCta7vLNW0B5tjjWgHs48V
         JuoxDAEnVl8qjTbwk4SQeZyFYpyTdfy3ApgygWrwBrR3lqKIMazbrCFPhUewffaFwrbI
         ZeYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277916; x=1788882716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3MdHgZtBfTREn4V8If7CDYoqsV/YDIXtFEG1CpRc92k=;
        b=PdBtrTGGComMaMJGMdmuCQODdRcNFAVuom3q0tF/qhrFVsu3sqDwKeh7g79YZj/hQg
         m+ZpdQ/W1kC5KB6ky/5eqDGNpdekcvJLyTB2mQxObPpy+jFokfqNKSYeFWMCh/+SdXPI
         fRXlo+H5eMmZMYOdN16+YdpVCt7FdrEzuFnAKj/nUyjTBn82VRq5LZnkKhhV3P3NQk53
         OIyhkhQMwwk3ht9XGm82IWJNPLtGycGv+KMqVFcyuz4ZTQA+PQ67Y+WE8Miiz1gT9FHY
         eOTR9lB4QmMBOFPidhaL7npAuwLewyNBFM8dZD7PkETW9WMKKNE2dShzHjd0NEz+Nf4p
         20Nw==
X-Forwarded-Encrypted: i=1; AHgh+RqOfmPEUhbmHOFaUd/2G4NCpP40GnyeAjDkebXqEQV9xxFJIQW3BlZO/7FxcQt1jgcZtOoWUBuko79o++4=@vger.kernel.org
X-Gm-Message-State: AFuF++mu923bbSHzxjG8KwtSXCiob2mAheRdMyxsofiZ/o2xqLVjP3nV
	D/gFabo1nMKbi67+VO3ZkWV0kb8lwPQxK2XtQCOUOLkib9ozlG1f2ktj
X-Gm-Gg: AYBFou3C8ZnBQVd+L1CbR7ZnCC52dtzMSlV6P6yinUgtCL6ZoOI9UAcK+eDO0UDaio1
	ZVLwbUitnurtp03S9cwajtQ8N8/Cc2tH2x9ScdWVXQO/9rG5P+vF0cXPlnbJJKy+s1HpdEitwix
	sH2XQyfAikVJbq4rpp0/KMHBEKuY6AIjrvYwaevQpX23q7CxuZdGZUhaS8vxcm/v8xe9lFzBdDc
	htX9O4/tiktPNgGqni8/sZXwvXejIrXE89QnBmKQFIuu/NotGDmrp4slftvxs8H1FYEQ1VxMLyA
	U5YuVBpSsLlUx7+jRg44HANbP5N5g7wRXOJjTI9GdJHdw6lq6REwwli4Uxp4mfi59cu7IbHlvwL
	Z5yjUb07MTCiWYv6gRQhvRvRD4BkCE8y8OYIGv1B+DbNNTy8UVpLBzmZf4CVeFbisJGIne/7a6X
	BMbWGbxH0ou4lne4yEdE83oLbXe+IOfaiPiJPEMU9s8eZmjM0LqhCsmV6VtITexUMTYpnAzIPpA
	a6WM4ey1tGwRtWlh6EWfy6fIfASd42kZ/SQsm49
X-Received: by 2002:a05:690e:454d:10b0:66e:542c:cb48 with SMTP id 956f58d0204a3-66e542ccd37mr7096765d50.48.1788277915671;
        Tue, 01 Sep 2026 08:51:55 -0700 (PDT)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66f7efc9dbfsm4424690d50.9.2026.09.01.08.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:51:52 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org,
	richard.henderson@linaro.org
Cc: linmag7@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 21/24] alpha: select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
Date: Tue,  1 Sep 2026 11:50:34 -0400
Message-ID: <46250102699dd2f07b6ee19ca58edf3a9cdfa0de.1788277742.git.mattst88@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1788277742.git.mattst88@gmail.com>
References: <cover.1788277742.git.mattst88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

activate_mm() on Alpha calls __load_new_mm_context() which assigns a
new ASID and invokes PALcode swpctx. On SMP, an interrupt arriving
between the ASID update and the page table switch could see
inconsistent state. Ensure activate_mm() is called with interrupts
disabled during exec.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
index 827b224f2f8a..bda8443a7323 100644
--- ./arch/alpha/Kconfig
+++ ./arch/alpha/Kconfig
@@ -37,6 +37,7 @@ config ALPHA
 	select GENERIC_PCI_IOMAP
 	select AUTO_IRQ_AFFINITY if SMP
 	select GENERIC_IRQ_SHOW
+	select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select ARCH_WANT_LD_ORPHAN_WARN
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
-- 
2.54.0

