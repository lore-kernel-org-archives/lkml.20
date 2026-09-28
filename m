Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82AB4F55B5
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 20:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790626128; cv=none; b=qg/mcW5T7lMmnZjbo1zEU3SyfalfSPMhCQe40QH0sj1WWPIifCX+yy85HSCZLeCZeQC8jns6zXtLun+X5NudsQ+WwpzjIqkTz2hmeoBWr4qdbz4jkwtzkAdYASNhlspa0twFRqafGaDrSaq1OHd1LAspc/gSmZau0BmcTNpKd4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790626128; c=relaxed/simple;
	bh=KbFTqf0Stipa6Z0Bf79nWzA2T/N8nR0vSGeB4CqZjYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uc4b8PSvsn0yksN0nhKEj0CTK1+GbUu7K067iRumCYyUN/I/2IiHHVJccTcZfTuHaenyOExT3fSIJAiFTSf8QEE3WcQmnxsxW4r6U+dXeFo0JeXyprDyATJ9q0hkHMa5a119psjDwLIkDex28V5BvpsVeFinItwNzy1tYQxaTvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dPlDZWmN; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dPlDZWmN"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a8b9acbc6so506684466b.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790626125; x=1791230925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CtakEnWLArPo5Q59HM8M0ssZyLg6kVbX40sG8XoXT0s=;
        b=dPlDZWmN54mISqwprU6ivV+m6IM8HfS0HaAHfJQ1JIWc9NeZ11rsjQ6/3rd9PuJMRN
         l8jXha1T7I2OhDifAF/w/BA5kXDCsLX8merYYtgroLpB7TzRTrDPAtyLqR8KGLVnxZZ0
         H3VBDxzUmLYghMxQxQ9thd10pTWiV2upPL7qNqG18qt7nUSkG4WcSG8BuoPWK6JUcFnh
         Kbgrq8HMtB1o7klkC1uHCojzQoRCBprJhThCyMOuPCKbaDCHz8IYv1x/sWWlxQ9eVf+E
         E0QDAAU6oo6gKyYWrNsixGWxJeYyj5m+RRz5rHudzaYl47EMckcdgcQKRtLq+3RoRNT1
         UDqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790626125; x=1791230925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CtakEnWLArPo5Q59HM8M0ssZyLg6kVbX40sG8XoXT0s=;
        b=zO4SQeJ8g3QU5yhGEFN/4LqhheK6dpkHTYSc2a5QEpv/svtlc2c1eC15KbxAhM1TcX
         lz5U3LJL3VFWHsz7YrjX7S6o+krHrHKPd3UrpFpew7TzMl2smSdcYhzH4zoEeJiwDNES
         0+lCpBZlyhqQ1BEFv/KeAq5h6UVgqZoKQ4ubafiYQaWJf75Ppy7xhHVwcZKaNI5FYDNv
         p8ln0BdF4AVH4l1tWkqVXGmXL7KxYM/ticSD7Gc0mMvtUnycVjRDQ0HkGO9Gq+1CvWAm
         BEJ7pDKzQMzVarAl15c11o9NROCsq+ZSX78Ih0rnNfz33BQN+A9+NeHW6j6mw3F/eesI
         94nQ==
X-Forwarded-Encrypted: i=1; AKwUvBwns35tQ0lJ+8MaZcVzsPAPme04gGqUzoT4Ob5xMlwxQyrLO1qHn0vC5KC1HAvkF+6C7Lud4q7KmpuZGYw=@vger.kernel.org
X-Gm-Message-State: AFuF++kpoA8CqLJTUCx736NcxRjkOti0LSvy4hezQB7v/X8LzxP0iMg0
	K2BmCytWij3oVGA0t5lGCHfDWt2YFjRb9fsgGjQl5H2wvnNwJWY8U+Xw
X-Gm-Gg: AYBFou3hHFPTD/qorRp49rD2DBrTMiHJ54Wb4/RxwfcyKL82SW/myQzdr1tbIqBzhHR
	3uR9APQwhGyIvdNqVko7i5BW4qDXlMHgcCyCuERAoUwJqfUk+s5+okSw4IZ9YYTyJFu8J8OkVwj
	af/vhq59bYDJvYXD3otkJDOjb4Kf0BI/Z1cdl2A5BD21lns8EpNbTCppZQxk59okZc/MFz/7kSg
	x8xCxrGc3cuRO1+/y5EWT26Wss+I4SHuhwjI1jUcqcO7dKUkDhsRR9h0nBhaJqzj22Z29lZM03+
	aw+Z+ZhZz4m5Nz1JhsKstMPu+430HL1gpYU7JXLH6awTedjXRlNMifQOgh9mQ/4L3tcPdUscKms
	1pmDJ8KAYNVhCU7Oz0G7414Uk2LDui4oQvDPxwnpcgAnt5bS2DMb+TMMJMpgaIr0yoeVqlbiFte
	EGYup/lkfjRFGQvCsmfqIN2HGc05y5Dh0QlTffKhQ5EcQSz2KSL7rkr1g6hxesCI3vQA6VlvLkM
	ZHuXdanymafG0vbd6iQGuoST5NHrN6t8Q8iyqqs
X-Received: by 2002:a17:907:7ba5:b0:c25:8c05:902f with SMTP id a640c23a62f3a-c2ac230affbmr1172846066b.13.1790626125092;
        Mon, 28 Sep 2026 13:08:45 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae76abc3asm509778166b.37.2026.09.28.13.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 13:08:44 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: davem@davemloft.net,
	andreas@gaisler.com
Cc: linmag7@gmail.com,
	sam@ravnborg.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] sparc32: honour phys_base in the viking cache flush routines
Date: Mon, 28 Sep 2026 22:06:22 +0200
Message-ID: <55357ed4f6270c81595a018af2fbe391d8b912ab.1790548064.git.linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1790548064.git.linmag7@gmail.com>
References: <cover.1790548064.git.linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

viking_flush_page() and viking_mxcc_flush_page() derive the physical
address of the page they are asked to flush by subtracting PAGE_OFFSET
from the kernel virtual address:

	sethi	%hi(PAGE_OFFSET), %g2
	sub	%o0, %g2, %g3

That is only the physical address when phys_base is zero. The C side spells
the same conversion __pa(), which adds phys_base, and every caller passes a
kernel virtual address expecting exactly that.

With a kernel loaded away from the start of RAM the two disagree by
phys_base. viking_flush_page() then compares cache tags against the wrong
page and flushes nothing, and viking_mxcc_flush_page() streams a page that
is phys_base lower than the one it was given, so the intended lines stay
dirty in the cache while unrelated ones are pushed out.

The visible effect is that anything relying on a flush to make memory
visible to another bus master silently keeps working from stale data. On a
SPARCstation 20 this shows up as every SCSI transfer failing with a DMA
error: iommu_flush_iotlb() cannot get the IOPTEs out to RAM, so the IOMMU
walks stale entries and the ESP DMA faults.

Add phys_base, so these agree with __pa() again. No change when phys_base
is zero, which is why this went unnoticed.

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
Message-ID: <20260928002035.1-2-linmag7@gmail.com>
---
 arch/sparc/mm/viking.S | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/sparc/mm/viking.S b/arch/sparc/mm/viking.S
index 48f062de7a7f..8b4e251bbba2 100644
--- a/arch/sparc/mm/viking.S
+++ b/arch/sparc/mm/viking.S
@@ -38,6 +38,9 @@ sun4dsmp_flush_tlb_spin:
 viking_flush_page:
 	sethi	%hi(PAGE_OFFSET), %g2
 	sub	%o0, %g2, %g3
+	sethi	%hi(phys_base), %g2
+	ld	[%g2 + %lo(phys_base)], %g2
+	add	%g3, %g2, %g3		! + phys_base = physical address
 	srl	%g3, 12, %g1		! ppage >> 12
 
 	clr	%o1			! set counter, 0 - 127
@@ -91,6 +94,9 @@ viking_flush_page:
 viking_mxcc_flush_page:
 	sethi	%hi(PAGE_OFFSET), %g2
 	sub	%o0, %g2, %g3
+	sethi	%hi(phys_base), %g2
+	ld	[%g2 + %lo(phys_base)], %g2
+	add	%g3, %g2, %g3			! + phys_base = physical address
 	sub	%g3, -PAGE_SIZE, %g3		! ppage + PAGE_SIZE
 	sethi	%hi(MXCC_SRCSTREAM), %o3	! assume %hi(MXCC_SRCSTREAM) == %hi(MXCC_DESTSTREAM)
 	mov	0x10, %g2			! set cacheable bit
-- 
2.43.0

