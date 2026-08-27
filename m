Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F364C9010
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787855305; cv=none; b=qjZHnuD8lMnH1kP1WE0L8+nX0ids64hM6wcClVCpO9EEcjkBUg36PsKCVboYp5//7OovfYeRgJ1/2qeyOemGxdG1Ot0NJFVYp1d1epq6ntzUwNW1PMSmgOs6qS0UzZh0Bby3s8/5gPQtRXOcGopTWcv2a7lJ7h03RrMPiVXDnkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787855305; c=relaxed/simple;
	bh=viX4jjItsK90zTlCcfaBZvb8khmRSizMKGI4tuVmIXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XqZCS1QIhmhBtDgYMVnss5SMlRDlQ0a9EBaOBt2LsEj4rXAlz9jEExRiykMSmkPmKHF96XUkDt9yY8UXnpDPSrCZ7bRjjwpiHDgYI2lekmxdnRjyEXmL0hf64sRFOf7wvr+I7zQ0KGhqZAia3DneUZ92aCKT2hCklapNizVqsHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CeLuOoOt; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CeLuOoOt"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c25344a8c6cso23353566b.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787855301; x=1788460101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gKiiL1nTCRECupJrUkk/zMnddPMRB/46RYLC+aZ136o=;
        b=CeLuOoOtVYaLooKONVIIUgwnpR/x7rtUeKYybdb1FZHGZrdn0NoFrdB3EUiGQIi+yE
         9pfKltnIGL4OMygqeb4ZYCS2XOYzlKP8GDrxkYsAJC+el+RBwkJj8UtGrLlLYs7PMNP7
         gj//5n1S8V+Z09axgEfYbGKVm32YTba+si+Q+8j16OL7uadkEA5JLnukKbl+ZM1GLZ8R
         DmZRHZfXBrjfaYs0hFvEm+Ws3qpYT9+Rwwo91DvviBgqQHg17MevSUN5TUVdVzQqMndb
         IdqWsd9XM2OGgrXbCBPApADkEeVCJL07uBNbJebm0MkyxCxl1nJ5oBW6QpqYkbKXDTJN
         ilKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787855301; x=1788460101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gKiiL1nTCRECupJrUkk/zMnddPMRB/46RYLC+aZ136o=;
        b=mNZz7IUgfHs9ya4pd1XltjRishjr5QA0WaxWFNAPNkhkR9MnEo3Hc7qXhhSF/RTg0V
         bncLnUGX+LEU7109wdQTSwmotLk/gIVQEa2uMNnxDlk6VTfqS3j88g31bMX32IQOIaEu
         ZEtm8zugOxECkT36Vk0deK2iG6MtIBcON/FUp7JZ2VHAYVO9iXrspVVBsJgXZSLNVeza
         +tj7JaLxY9Tk8tPo6/CIlkKrS8Q1W6gbWcr0IJHxxebjDKzxP1qFPpdE81+QUbZFdunG
         kZ6LziGu5Z7WiuGUGZR3G/DeKuh4QDRe7g0mX2eQf/eH3WdE41wleuyU0iWDmGRxkefg
         zAeQ==
X-Forwarded-Encrypted: i=1; AHgh+RpdMOVc8Ld2m+9qy41pTpcMyUbMnNyl38gu3UILbZ8HVG1kJgDQwRgUOr81GRgJG6T9doz3+VIqYkBrw58=@vger.kernel.org
X-Gm-Message-State: AFuF++nkmds7b2mZJNadBOWRlOYU5wuVL2HCcMVohu8CXZRs6ER1fKe6
	vd+epnxRQdmQA3hnUBdtlDIksqvJfFJCxMNeqIkSILg28Ib0bu8UXCWK
X-Gm-Gg: AR+sD13rA/c2iwuLlLJ9nCuAZ05Y1nBpexEFoZN8XzGmU7n8w3Z6Uv3DbmHf0KQnRkD
	qCGz5wGeF/TEgwrrHQAvwf/MJtarYJOUFRqkd7EKSVO6jU9n/ghw9N8qPef6lmQVp86hMGs1mz9
	Lh8LuGyCy3f2e/64S0XKO0P+f/BnnmnPXLjNgsYVmmHDueoET8saU8WYfWfe/Sf7QhI79NLVU4r
	kYDRYT4ItsEZrDFHuBUTg3gevUFNKFaUnsCpFN+yi3ONIqFzlnyxFFAyxC9wSs7AVW56wH5M17H
	GBJYOFVzxFLateaGRZ08/F6qnsTa/e0TxHqlPcFHf7LUn2VdKpFgHNAzRH3aAAKqQ40sT9myF4Z
	kZbpGmlBBmtf/XRzhIZfq4xq1IVqa+qyeyZfimZFH9wUlnqH0r1FFVzc68jvFgnixtG/1HANHfK
	9zlGqlEic9odNsMXvNQl56PQopmSWjoCKmsEyyv0gfm0BO1VGXFSzSZWuwfsz1CO6EdRiC/1cvk
	vYbB6OZuC0W4luNJXMjz5LBTumN9lyg
X-Received: by 2002:a17:907:3c84:b0:c25:541:fd3a with SMTP id a640c23a62f3a-c2556c2f178mr55885566b.7.1787855301357;
        Thu, 27 Aug 2026 11:28:21 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c254e4e736dsm61288266b.11.2026.08.27.11.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:28:21 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: sparclinux@vger.kernel.org
Cc: davem@davemloft.net,
	andreas@gaisler.com,
	linux-kernel@vger.kernel.org,
	sam@ravnborg.org,
	Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH 3/5] sparc32: populate memblock from the PROM memory map
Date: Thu, 27 Aug 2026 20:24:15 +0200
Message-ID: <20260827182757.6856-4-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827182757.6856-1-linmag7@gmail.com>
References: <20260827182757.6856-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add each available PROM memory range to memblock as it is discovered.
Keep populating sp_banks temporarily so the remaining users continue to
work while they are converted in the following patches.

Since the complete PROM map is now present before bootmem_init(), enforce
the mem= limit after the legacy bank processing. Adding a smaller
overlapping range would otherwise leave memory beyond the requested limit
in memblock during this intermediate commit.

Suggested-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/sparc/mm/init_32.c  | 3 +++
 arch/sparc/prom/memory.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/arch/sparc/mm/init_32.c b/arch/sparc/mm/init_32.c
index e0e66f91ceeb..75050dfbc2ea 100644
--- a/arch/sparc/mm/init_32.c
+++ b/arch/sparc/mm/init_32.c
@@ -165,6 +165,9 @@ unsigned long __init bootmem_init(unsigned long *pages_avail)
 		memblock_add(sp_banks[i].base_addr, sp_banks[i].num_bytes);
 	}
 
+	if (cmdline_memory_size)
+		memblock_enforce_memory_limit(cmdline_memory_size);
+
 	/* Start with page aligned address of last symbol in kernel
 	 * image.
 	 */
diff --git a/arch/sparc/prom/memory.c b/arch/sparc/prom/memory.c
index 269d6ab5ef5e..59962bc0bc82 100644
--- a/arch/sparc/prom/memory.c
+++ b/arch/sparc/prom/memory.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/kernel.h>
+#include <linux/memblock.h>
 #include <linux/sort.h>
 #include <linux/init.h>
 
@@ -23,6 +24,7 @@ static int __init prom_meminit_v0(void)
 	for (p = *(romvec->pv_v0mem.v0_available); p; p = p->theres_more) {
 		sp_banks[index].base_addr = (unsigned long) p->start_adr;
 		sp_banks[index].num_bytes = p->num_bytes;
+		memblock_add(p->start_adr, p->num_bytes & PAGE_MASK);
 		index++;
 	}
 
@@ -42,6 +44,7 @@ static int __init prom_meminit_v2(void)
 	for (i = 0; i < num_ents; i++) {
 		sp_banks[i].base_addr = reg[i].phys_addr;
 		sp_banks[i].num_bytes = reg[i].reg_size;
+		memblock_add(reg[i].phys_addr, reg[i].reg_size & PAGE_MASK);
 	}
 
 	return num_ents;
-- 
2.43.0

