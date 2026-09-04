Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7876515853B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 00:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788480520; cv=none; b=j8VWNLb3EFtrAz37XNG0sWDBSSdNLlR/W3kJD/QzH2cd1LObPmqJj/Khc9G1OmHL8P6NPyRljz4pqlxSgQkv45dkHsW3imuJej4ghuDEfPuRxJ/tVorWKEb2jYZzDDSAcAFIGQiPmYCKKRKrQ3zL00WEx7fWhmJLYfSQNTX5BK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788480520; c=relaxed/simple;
	bh=b0mz6z83zVCtUhJLb/Mp9OvJFzgVV9/P0wSg48iDAPI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=htviU0mXQPF8z4IpLcYwQ+iupQynFPdYPtSt1FFa/v4DJx2FWX4YLQZwe6pyoD7uWc5wwksXZ7JbnobBUmfJPuNVZoFHuXXMImQ1paXzg1jeFokw+Mrz2jIt0gnH5ZiKdFVuJj4P0mj2OvfnRn+VgtoDzq3h4T/VhB8an+YHpCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UATIn3Qx; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UATIn3Qx"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-398c1101c1bso388110a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 17:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788480516; x=1789085316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GljiUmm1um383ek6AFMz0AxdrrGuN7oQsO/t/B0oBUA=;
        b=UATIn3QxI3FnUKagcJupIiDz7n8SC98hXhb5v87L0//p5hcp/KHbdU971JoyI2kjKA
         9QeT1zS+FORoORe4pg4o43OBQssamcFfojVCaZXs7oaBaN96WQSlUw2j4qd3AefXnU4X
         OQ+c+z/mAQFGvm7gKzULtVKc33pOgo6buWDwccmPCFyBH0uQCp2eaQCTiR/kB10rlttO
         ynKzv8NjuCM5jcrvxSZ6uPLTYj9Q+SbJHn2V+GFTe5Kd0hYCsz+1H30CYDIadvA+Y50I
         0hWZcyYF3en0lXSa3egqsdcma7ZlCy9FQcLUfmjng1dShe1W8BzaKdnGxHgOCcqFYgAz
         0EKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788480516; x=1789085316;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GljiUmm1um383ek6AFMz0AxdrrGuN7oQsO/t/B0oBUA=;
        b=mBPtbeKuCdmb9wkp2e0FbgJtG0oDIzBhdhSkfHdoud+ohFN5QIB4V9gEKG/ws+HNnw
         dRmErlp7KK7MPZLS/yi7qvxfP2UmYuI7X/PvbccjC+BX7zu+B+IL7Ahn3lGdPEQTK9Pa
         67TnA63OQ88mKem55Vkspfz0iMYzxMKOMjsoBFMi64SZQzrCB0PxRxVjUhHytELNuF/i
         5sWT275ANScsQhx/F4Nq8DrF0dBe6UX1spIq7CC1qsmVV51cU6X1mY0CSCc5dx1OgLgd
         CovAFEDsJh76A8g6+yMUrzIuivIPy/jsGA+qsncLqz9y+DIrmWqyR6eyhyLRCIEwjd5T
         MiwQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4mqZjHsC99a5yCumkZYbpUX3CASbCOHfDw48EHfk8jV3MepaUi6V1lViecBeyMBSjQ4ID79zWUR9CFsw=@vger.kernel.org
X-Gm-Message-State: AFuF++kVOdVuXh1Zz4nEOhq5xpNK3zNP59NaFWXy5s9rBa317ZdPB1o3
	cmZ7no+Zq+LC70AqhX/jDkN66jns8x47jJ7Zo3JxeoXrSKkcOJnp7CYi
X-Gm-Gg: AYBFou0E4ZJHzYU+qahv0Jg5uS8rcsXLD/qiZYik0Uola9MsGf74+vsUl9AtSokZHmO
	QYJXH8kAE5h5LdH1An3l5ye9qBfpvQv6qIsQz96sUqj5XLfyivd3z/sH0G89GQwW9uqao/HMuy+
	yD1PlTY7Y6ozRmqBZrplpK2vvSKI7uoI/CR/TGeXsXgSjLM/GEb7ex1bRvrvVh8NPjLZjehYzet
	0qt+wqNuuDYeNgX1Q1qNNIJfsdrs+x+Sn8eMDOf3AV1i1sNgOhj8grtB3XwoGPODvHUMneqQZUb
	pgorrUnqzqm2b/lVHhmkqat6H+I5KJALDUkqxVK710Sk6MurH9g0neVeJ23qWRHv4FnRrTNgHvW
	jpmExTYs7qWv90rRVWVHSx6mitIcdlNnaxKh6Ap7BumsH+qXzyMNRWGtEDxqk54pxpxz/+xm38l
	ZlsHP7bkrnL5NdgKjTqtCBdh/Se9KtfhwNSvZS9O2ZfoGW0MLekiMPzMkAzrzF0Bd9QSclF2gHJ
	TsGydgka/jcRP67K5XP6PzzdYTL6im88mRpst8nbeaMN5yUwhKU+53xh9dXbV2kv8fzQb0Os88R
	DJTHkqoNUnqZiD0AeqfJHljzFPf4UuYDfm5zWertDGUMRufvYA==
X-Received: by 2002:a17:90b:1dc3:b0:398:d6f4:c61a with SMTP id 98e67ed59e1d1-39b26207ee4mr3446839a91.17.1788480516137;
        Thu, 03 Sep 2026 17:08:36 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae8f1448esm4136507a91.4.2026.09.03.17.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 17:08:35 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: x86@kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] x86: checksum_32: allow memory/immediate operands in csum_ipv6_magic
Date: Thu,  3 Sep 2026 17:08:33 -0700
Message-ID: <20260904000833.2058186-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Building nf_synproxy_core.c for i386 with LLVM/Clang fails with
"inline assembly requires more registers than available". The
csum_ipv6_magic() inline asm demands five registers at once: an
early-clobber output for sum plus four "r" inputs (saddr, daddr,
htonl(len), htonl(proto)). i386 only has six GPRs, so under register
pressure at inlined call sites Clang cannot satisfy the constraints.

Relax the register-only "r" constraints on the len and proto operands
to "g" (register, memory, or immediate). Since the asm uses adcl,
which accepts memory and immediate sources for these operands, the
generated checksum is unchanged; the compiler can now fold the constants
to immediates/memory and only three hard registers are needed.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/x86/include/asm/checksum_32.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/checksum_32.h b/arch/x86/include/asm/checksum_32.h
index 17da95387997..f74873a5e351 100644
--- a/arch/x86/include/asm/checksum_32.h
+++ b/arch/x86/include/asm/checksum_32.h
@@ -159,7 +159,7 @@ static inline __sum16 csum_ipv6_magic(const struct in6_addr *saddr,
 	    "adcl $0, %0	;\n"
 	    : "=&r" (sum)
 	    : "r" (saddr), "r" (daddr),
-	      "r" (htonl(len)), "r" (htonl(proto)), "0" (sum)
+	      "g" (htonl(len)), "g" (htonl(proto)), "0" (sum)
 	    : "memory");
 
 	return csum_fold(sum);
-- 
2.55.0

