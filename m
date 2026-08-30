Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF10A3B3BEC
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 12:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788091685; cv=none; b=TBc627gbsUn/GKGLqrPaRlKm5VVlgCkr08mY9NYWAWejBlL7H5dd/o7hB8FW0O3qO27mE53HbUSrpBsIL8dhlK6DF3Vw2d0RKrsX379ppNW7TJT0Lep6EHHg4oiNDMUrRsei3AF2VyVAot3NPDzkaK2AgGv0Pzi5DyJ6/FSita0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788091685; c=relaxed/simple;
	bh=VmbFlELFJ3Rn+I0JOfMdlDLEE3OEnrmuWAkyZTBARKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r6aK/oEykbn4GLpCuWrwBe1XPSpFhNEDS98pURYcTuN8bzoWZCkYwkvSm3sbGK0ePjGjZ6sJIdjwoudtdB2/MOOgHkKzP6cYcZpnAjQrHJ7zdXRR1eJl1FjCB1kG1d+ZtNFLhWjLslnwNbQVBMONtUDGgyV2vMA78Zdcia47YXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kUKynZOk; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kUKynZOk"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2569aa5116so250660566b.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 05:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788091681; x=1788696481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uJ7HB4Zmwe3amRULeH6fSoLAudldxAC6NdOXYXWuTOQ=;
        b=kUKynZOkJTzl3jCgeGVf25oKJ285QGb/XO9krKc6Zp8qZH1eqybC8+4xiZpfMHhfgq
         YDAYhw8FLUG3dDLnCjO4kRLBYkDg+erVwByOFmDzgzUEiNHnnOVkGLspNSInxQrthrvk
         5+0gM/7iPyFos1nQboGirqRmQi+V0Hs8YFg8Vy9Wnym4WNeUa+/Ocxr0VQ0FBRU95Z8U
         7PP1I8euDpfvFEkcsOfsZKKuzeiHYLxtiCCXsW46klFN2G9sjkUg0rKvTYsgi6kzVTbs
         0IHpQM0noLdqeTmUVK2Kuwr7qUWsvp7fNqQjDZnUTzh5f+KKpCzeyODODVE3PPGTT/1v
         9Dug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788091681; x=1788696481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uJ7HB4Zmwe3amRULeH6fSoLAudldxAC6NdOXYXWuTOQ=;
        b=bzYzCwV3e4h4jzI7FP8X77hcKA0oqy7Dzf9yf23uVB+HmYcJtM3WbHqNtEXfPwbAeL
         8xsgov4cP+aw3yQvBPp93BizbsENJsg/4ktpr2kvXUZih1RvA06UbWvqw7hJ2pW9fkcI
         ZWnCWdtLQogsksEBDsQ66BLLNpnAfdrMcSlPc0w1kt2Sv5EzqXECnt7IIfr4D4s4F0Xj
         o72ZYDK3QX0Q6uSrEjcwRAoOF3pu/RhZn0Ia7Pvkj/nGOuNMsMk9DJ86cOVjkmEAZ5vl
         2xEvN5MaPl+GO1PNdPK06f/ro39qETKhO/e1DbXu8L01zc2/V1ddDM2Ckr9//Ne36iux
         KQ1Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro3u+HhySP/cwkAxZA1ouOUF2c+U4Ub956bDS9vzO4mHPrhi+rrusVvLD0xSsO04AxIjm99n+H5hC9/KoY=@vger.kernel.org
X-Gm-Message-State: AFuF++nLQIHvaYGKHK+xGaxtA6CxyzrxDFgzsCeocYxXUvjpdQ3vccXn
	7SbBSq6oFrGc8FHH6pTEfbQUmfbnxX+4GdmL3LEDG2wHGUgpmOcf7wTZ
X-Gm-Gg: AR+sD12BQoNEnoCkQF8zmyE/nW5MuGv0EvQ2L0JaQ6lV1lo/78cbLK1jQkTA18gVAB6
	hB2WP6ZHVtwpMKC1472xRcYSSX0Bh5p8UJuwYI6a5MW0sHHgAaNSwmfbco/idvI0ia0xTqhEX8a
	Ez9Q+SORsnlA8PyGKea3M1k5xVKZfuiCD2JZS90nHIAZ9l82GGHRXuOVCcvhOMySHji/IYqsDx+
	dWV1k08bzQIr38burp3eta+U893MXNgyeCNHrm+9pDAhasctoOmzSK5KYfQ+x0Mtqp1CVUe+VFZ
	bo9/EIQRFd+OqRTNb/OptsjaEZ6KBiZa6iqhWIMIA5J+QythjVRC65jmlZJ+3kuWnGpqz7ppOt5
	9FvYE+PpIe0f38twuh3OQcye0a5IulucEwMDZWOERQ2wVOunp/RVFWa45zX7kLqNoNeUBZVLVf/
	juohAoe2d1mMjBx+rqXoV+8j8hramK/+HtBbj0FvwehmEbNm8x7N8CncVG4JA0erIqeFyZEJU1p
	++4rQhSFMM7d1NYknj/84BNUt4ggmQ=
X-Received: by 2002:a17:906:99d4:b0:c25:3e36:acc8 with SMTP id a640c23a62f3a-c25966d7ff6mr110233066b.4.1788091680875;
        Sun, 30 Aug 2026 05:08:00 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee09eb6sm304287966b.10.2026.08.30.05.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 05:08:00 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: sparclinux@vger.kernel.org
Cc: davem@davemloft.net,
	andreas@gaisler.com,
	linux-kernel@vger.kernel.org,
	sam@ravnborg.org,
	glaubitz@physik.fu-berlin.de,
	Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH v2 3/6] sparc32: populate memblock from the PROM memory map
Date: Sun, 30 Aug 2026 14:06:42 +0200
Message-ID: <20260830120742.20950-4-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260830120742.20950-1-linmag7@gmail.com>
References: <20260830120742.20950-1-linmag7@gmail.com>
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
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
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

