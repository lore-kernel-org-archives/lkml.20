Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793069809;
	b=xIPR6vAhiQfCP70C1BbvS7o/Y/XYan/NmjMXZDjeRicABQeFH5CLXeNkd/k19gg369fR
	 nuVmLIfGdIgVAfAsMd5pJyOiiCKRfXAoyDfND+GAGZx0YfqG5lTkYbPYFHRnvtsWGyDdW
	 jyUR+CtI3mW1FMI9dPlYEPR87dI7UUkpdGOf8GsmEk4hUJPdU0BByIkrw6VZXsODiDVrl
	 3tASKtasED5YPT7ZEbr7XeAqyKrcs2YeQayaNlR3FnCP3LsIs0N/0QNXT5/wN5MDPEMA2
	 BP4exck9bGWTozm7rricg7RQRc39vWrU8zz5IG7TV4dB02LKW/d6odpjd1noZ8YoDPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793069809;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=i2TVROB2tkypKL2JwuC8PelARTqsfICvFAyjnT/ZhdE=;
	b=FosjkpwFjkeprnnkOX8TBRr41mPXYEnIb7w1ScoUqJbx6tiBCGMzrP+fDoWCz1czcVjg
	 koqLwb1/uIw6ovd1RAragIOSRmwcVldk9Q+GvMvEwxe1V1Qk4qDOV83KhFAn1y+1Squcv
	 DyLw9s/Ubk0nwZyWZNUwLNyj0wud26XHGYWlgQENDgMHeMkdJl6ZizlY837DDuM4tifTq
	 7glCbefgvui8o557bOa1PpEzn3W9Uc66OapDJw6Cil5P1+kWEN5p167cmI/V9nDebYSkZ
	 lifXbxtCxn0kMx/ddimYBy4EgSTIr9I+pnbeOdq2Qx7mCZ6Bbg6G1JnCZ18VLwLWgjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kevinloughlin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=OshOJle1;
	arc=none smtp.remote-ip=209.85.161.71
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4E1606A333
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:56:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E4E1606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kevinloughlin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=OshOJle1
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6f8edf0c859so663254eaf.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793069809; x=1793674609; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i2TVROB2tkypKL2JwuC8PelARTqsfICvFAyjnT/ZhdE=;
        b=OshOJle1ccK86kFRhnnl9I9wToaSwSXU+d+gmBvsmvocUT6341f0jhLncIp73TVjuv
         JU8RataLvH4x6mJrLZqrqQgqVWxVFubvIwOXlNccoumrpB4cW/ZCXZfPPk8/b9aZFTsD
         xEiixrF4jSV/+oHgWiil+xDcqhdSLQtWoa4mG07qc3xgZZvAtdwUf+VKxST/PzGxr+xN
         V/X4HwZAFEEzSLo7pM+SHHMTP75CBsnvrK/cis+x2Zz4DJ5oMpAbyFrT9s+kCaZyUaXx
         /erSsmXPnPy4XQzhmG2fTMp2o0It3qf5EWmJy0nfbt1kGnRjFqlYDpbU6jFV87r1MvNz
         tEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793069809; x=1793674609;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i2TVROB2tkypKL2JwuC8PelARTqsfICvFAyjnT/ZhdE=;
        b=rz+LQ9owft0mQos3/QqCBNUQLzDQC7hVfI/vJ4mHOsKxGSmWbJqiCOYiI+plPBSoAX
         m1JxOhigbom4XJnhrqYJhfnpLWNzCJ6elLBXnRloh26PG4TKCXOXcg6DgXXobY43UysY
         VVCu5QOLp4k2vetc8vHcBoQgLW32bYLPrv5/oD3WeDmNI/H2nV025Z03v+A80aaL+xOK
         /zA+tFqg6AA0vQDc1UHy+k1rVCnGt4xxt4KyOpAnCPWNi8IxUf9fdN8ZCyPaNWTWFhJr
         hfyVAqyQmxjsaQxYVSMWIQW9aFPIUsPlYGnsJ3fUKwNPUHUy/jwU301HsEGtPa2N/mZx
         4XaA==
X-Forwarded-Encrypted: i=1; AKwUvBzW2YhSht0uJHuVpFFToiSJyLfDXcEsNm1zMZu690GhhJRG4k5MKLi1EuOkxvX5/O0b6DPedEwSVtH83fI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKM5ly+2avPiEcalLVmAlY6ss2tQDQnqRiIX1SO+3Mtc2yfNEZ5
	uV1z8C3I8ss6hsmuZQ3wqNDzadLwOpN2guzXdRHPoCa9fNUtESLijsKhM1zvuHlLPa32xaPZKBr
	BhSP6EraulK/7K58J81mqPBi1JQYQoMeT4Q==
X-Received: from ioyd21.prod.google.com ([2002:a05:6602:2bf5:b0:9c4:de2b:c40f])
 (user=kevinloughlin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:1ca4:b0:702:c1a4:7563 with SMTP id 006d021491bc7-7126910deb4mr1003099eaf.8.1793069808399;
 Mon, 26 Oct 2026 19:56:48 -0700 (PDT)
Date: Tue, 27 Oct 2026 02:56:08 +0000
In-Reply-To: <20261027025616.1632690-1-kevinloughlin@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261027025616.1632690-1-kevinloughlin@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261027025616.1632690-6-kevinloughlin@google.com>
Subject: [PATCH 05/13] efi/libstub: start unaccepted bitmap at address 0
From: Kevin Loughlin <kevinloughlin@google.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@kernel.org>, Jason Wang <jasowangio@gmail.com>, 
	"=?UTF-8?q?Eugenio=20P=C3=A9rez?=" <eperezma@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Kiryl Shutsemau <kas@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Michael Roth <michael.roth@amd.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Alexander Duyck <alexanderduyck@fb.com>
Cc: virtualization@lists.linux.dev, linux-coco@lists.linux.dev, 
	linux-efi@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Sidharth Telang <sidtelang@google.com>, Punit Salian <psalian@google.com>, 
	Peter Gonda <pgonda@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Jacky Li <jackyli@google.com>, Steve Rutherford <srutherford@google.com>, 
	David Skidmore <davidskidmore@google.com>, Kevin Loughlin <kevinloughlin@google.com>
Content-Type: text/plain; charset="UTF-8"

When EFI_UNACCEPTED_MEMORY is present in the EFI memory map or the
platform supports dynamic memory unacceptance (such as AMD SEV-SNP),
start the EFI unaccepted memory bitmap at physical address 0
(phys_base = 0) instead of the lowest initial unaccepted address.

This ensures that pre-accepted low memory below the initial unaccepted
region is addressable in the bitmap so it can be dynamically marked
unaccepted and re-accepted later via virtio-balloon or free page
reporting. Non-confidential guests without EFI_UNACCEPTED_MEMORY
continue to skip allocating the table.

Signed-off-by: Kevin Loughlin <kevinloughlin@google.com>
---
 .../firmware/efi/libstub/unaccepted_memory.c  | 45 ++++++++++++++-----
 1 file changed, 33 insertions(+), 12 deletions(-)

diff --git a/drivers/firmware/efi/libstub/unaccepted_memory.c b/drivers/firmware/efi/libstub/unaccepted_memory.c
index 757dbe734a47..fcb622ac0564 100644
--- a/drivers/firmware/efi/libstub/unaccepted_memory.c
+++ b/drivers/firmware/efi/libstub/unaccepted_memory.c
@@ -2,15 +2,28 @@
 
 #include <linux/efi.h>
 #include <asm/efi.h>
+#if defined(CONFIG_X86) && defined(CONFIG_AMD_MEM_ENCRYPT)
+#include <asm/sev.h>
+#endif
 #include "efistub.h"
 
 struct efi_unaccepted_memory *unaccepted_table;
 
+static bool efi_stub_has_dynamic_unaccepted_memory(void)
+{
+#if defined(CONFIG_X86) && defined(CONFIG_AMD_MEM_ENCRYPT)
+	return sev_get_status() & MSR_AMD64_SEV_SNP_ENABLED;
+#else
+	return false;
+#endif
+}
+
 efi_status_t allocate_unaccepted_bitmap(__u32 nr_desc,
 					struct efi_boot_memmap *map)
 {
 	efi_guid_t unaccepted_table_guid = LINUX_EFI_UNACCEPTED_MEM_TABLE_GUID;
-	u64 unaccepted_start = ULLONG_MAX, unaccepted_end = 0, bitmap_size;
+	bool has_unaccepted = efi_stub_has_dynamic_unaccepted_memory();
+	u64 unaccepted_end = 0, bitmap_size;
 	efi_status_t status;
 	int i;
 
@@ -30,19 +43,27 @@ efi_status_t allocate_unaccepted_bitmap(__u32 nr_desc,
 		unsigned long m = (unsigned long)map->map;
 
 		d = efi_memdesc_ptr(m, map->desc_size, i);
-		if (d->type != EFI_UNACCEPTED_MEMORY)
-			continue;
-
-		unaccepted_start = min(unaccepted_start, d->phys_addr);
-		unaccepted_end = max(unaccepted_end,
-				     d->phys_addr + d->num_pages * PAGE_SIZE);
+		switch (d->type) {
+		case EFI_UNACCEPTED_MEMORY:
+			has_unaccepted = true;
+			fallthrough;
+		case EFI_LOADER_CODE:
+		case EFI_LOADER_DATA:
+		case EFI_BOOT_SERVICES_CODE:
+		case EFI_BOOT_SERVICES_DATA:
+		case EFI_CONVENTIONAL_MEMORY:
+			unaccepted_end = max(unaccepted_end,
+					     d->phys_addr +
+					     d->num_pages * EFI_PAGE_SIZE);
+			break;
+		default:
+			break;
+		}
 	}
 
-	if (unaccepted_start == ULLONG_MAX)
+	if (!has_unaccepted || unaccepted_end == 0)
 		return EFI_SUCCESS;
 
-	unaccepted_start = round_down(unaccepted_start,
-				      EFI_UNACCEPTED_UNIT_SIZE);
 	unaccepted_end = round_up(unaccepted_end, EFI_UNACCEPTED_UNIT_SIZE);
 
 	/*
@@ -59,7 +80,7 @@ efi_status_t allocate_unaccepted_bitmap(__u32 nr_desc,
 	 * The bitmap will be populated in setup_e820() according to the memory
 	 * map after efi_exit_boot_services().
 	 */
-	bitmap_size = DIV_ROUND_UP(unaccepted_end - unaccepted_start,
+	bitmap_size = DIV_ROUND_UP(unaccepted_end,
 				   EFI_UNACCEPTED_UNIT_SIZE * BITS_PER_BYTE);
 
 	status = efi_bs_call(allocate_pool, EFI_ACPI_RECLAIM_MEMORY,
@@ -72,7 +93,7 @@ efi_status_t allocate_unaccepted_bitmap(__u32 nr_desc,
 
 	unaccepted_table->version = 1;
 	unaccepted_table->unit_size = EFI_UNACCEPTED_UNIT_SIZE;
-	unaccepted_table->phys_base = unaccepted_start;
+	unaccepted_table->phys_base = 0;
 	unaccepted_table->size = bitmap_size;
 	memset(unaccepted_table->bitmap, 0, bitmap_size);
 
-- 
2.56.0.307.g5fe7bd680c-goog

