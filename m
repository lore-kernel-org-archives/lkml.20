Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794177364;
	b=DVBFP5iDXFJB+coqQMWAcff8BcZWHht85hYeesvilkJ/Ru+H+xCB+x2ResA6HeTxmwcf
	 tXD8otd+H1uj3xa21LGEq8s1r902+ReIoewfx9CR/NCX6hQftjn2jedjFCqSNDW95beTh
	 iSL0WS0P1r3rmiPplmHbQv5hAXD2eQKlCcPArfslhwEL3Q//zdWq9NyeoFW988WyW9TX3
	 +CVeqj9h7v3MlZll5bnmT1F7DF0yGojuNcwb60Ls5XSq2dvxs9EtqwoZWdR0SxBTtrwTS
	 UnZ+vPpwBimDT2xcAb+mqgRZWrI7b7a74M/bUUHU/SEVzDSVcxsqczUKrmIvxEgxxzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794177364;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yjigVlqZ7YlJzjIRljgnWOG1b/RgP2qYk03IHWd+kyQ=;
	b=nRGMCHs7BeGfQdzU51aMwp05FpnYXPpt2E1ocNUQwU9xwKa/ymfZWFk68GY3n0pkjRxY
	 IM1Jjeo95C/+atxI62P4ir9RA18n4WllM2iM4mjosse55gK2dWlDPUj7pq/QKO3o57t9J
	 mWzFLaF1OnM10PzskHVKA8gzWTNOumKDqTCac1fb3/hHUWDlzWTJVsMr7E+gnYqqiBDcz
	 UeZ70h1SAp9jqArZu7TDWfRO9oKZfeB4CBlTz9TDWC3rlmmO6+9o8YxGkflKjL+1cxCCM
	 s0ge0AnnQpE71BeBftlxkAiQkdI1zVuJQDy/qQuerShRCqZjFFNqzRlspvT0JmLyEVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qPdEvlXN;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344F8606D82E
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 22:36:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 344F8606D82E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qPdEvlXN
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b70880c0a4so346080a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 14:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794177363; x=1794782163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yjigVlqZ7YlJzjIRljgnWOG1b/RgP2qYk03IHWd+kyQ=;
        b=qPdEvlXN/8NYW+AIFOUBAaAsmqasuqAXI+HQki9oDLjkSxLb6+KPwYlg0VepThaJ4u
         jhs0LZWMGL2Hti/VATF3AZ49ta8ezuKTNpoKCxa6Rm22lXmIENvG5E6MIfWkYMbA9J7i
         7M3BOY/40qFCSj+vzVzMjgYEWgWXhd7YDXjyfrGPZ4nKMkLAMqbKr9tADXgNZurxlGQ9
         21eI+WhVw1SaZrxx1xiGxKCVDzj74mh0ZAo2Dw63UKwoWmTQN5MgMTPqzV2lnmfdOiK3
         LBgvVAOq1j8lH1z7UO4wy4D7mcL77tqTof8+IQAdAfyPYuYQiwXG2BFuCqTi4GIM1uAj
         t0mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794177363; x=1794782163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yjigVlqZ7YlJzjIRljgnWOG1b/RgP2qYk03IHWd+kyQ=;
        b=NwvU0byDv7bKshdyo87rCmnyn8IYPq7TZ2BNr0aMSNFe3qkcyxLS1IC8L7oaqU2GcK
         /gss+hPXxO4rfl4bq/GaAyF43PSpPCJewGAoa26rHMJVfv/N34a5ClR+yUFN+F5rRMG1
         g6aJk1yVXjHSvTtrBqUnxSdn/2ASJsubCkTQuOuyoZBShgWl6wkzbGF7+cHxT1YFd036
         BWbVk5SXXKyHb7hNmmgXmL3WF5OZyuTVhhQYUfkjqopK9/89YBSKFfVLNO5KVzOMQ2R1
         av8dCxzkjpm1D7LkRvK7wLEANU3KMX2HlEEikiwvD/OaJl4RuwTkoeXOaSjvdzI9PuLI
         pGiw==
X-Forwarded-Encrypted: i=1; AL+hErH3WrTP/oMGLrUY2V6XgT1AwwKggZ7b3KgrRSuQarw8/yEOlw46GJh46flawge6me2e74h6x4aqlnyfGc4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IVox6mCkSBTZ6S+H8dsmSAnszYrPk1L2WQUliTGS1UlspyzWz
	w1v8PGSMDfKnFZS/A1cu9ZKRGy1/bTZcPJWeqmVNe9ebvviK0BVP+AWR
X-Gm-Gg: AYBFou0T7Km3cUjtPiBCzpKBERZozPRFQHfyY28qe1ifDtpTRhUhE+46dPj7ONaAy/8
	q3/QlUv1cg4mPn+1MYJ1atfc3hRiShtYKjJ+msPQtIB8grTtIuh4hCBgYsf7LyGqILtRzMmC6qT
	IS+UH42PZB4wocJbRhiSbzAHDm0j+/fA4WbJLiJrHWhiiXHkwxYQsL7sOPg2sVa4QehrNdt+vXA
	ehJYbEr9g3mOTJpMxwVJbYNQb/01RbNwS/3T5CuCEnS5I2s5FI9hT/BGiZalCcQH23MMMJdyfwh
	+mh8U3qx2X1S+3QB8KY6p3Kc50yM6ymbCvOOEK5VBPssRDKa3Gek3xpmO6NlxbZs4DvOMoY7a+6
	QiQdmWwhsxRQMvrBk3ERw2LSHUx1jiPNoM5RWnquF2lJyUqy6j2w8qaRnC8Cb9zqAjnlJJzovXL
	bpQrd3ESflwruQrrjLnZhKIy3DemARO7byqxcl849skDDhpasHCJOMp4qhzrXyV/A8H+T9KqQXe
	yaZLArAbSSecPpjvWkoxcgW2bQLN/cPut1CBwAgNBISxQuNO9blRhaA3noTvpYAMqq54ssRdFSM
	8n/dnom/WAIEwxD6iJBUqKuUU7b5cacMvPww9ONBEr3GozRV2u8cci/BUJsuO0937rZTMm4=
X-Received: by 2002:a05:6402:5288:b0:6b7:1d67:eeec with SMTP id 4fb4d7f45d1cf-6b7224522bamr1427849a12.14.1794177362272;
        Sun, 08 Nov 2026 14:36:02 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721ebc7b0sm859272a12.14.2026.11.08.14.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 14:36:01 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: davem@davemloft.net,
	andreas@gaisler.com
Cc: sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linmag7@gmail.com
Subject: [PATCH 5/9] sparc32: preset modified and referenced bits in kmap PTEs
Date: Sun,  8 Nov 2026 23:34:15 +0100
Message-ID: <20261108223516.1125534-6-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108223516.1125534-1-linmag7@gmail.com>
References: <20261108223516.1125534-1-linmag7@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Preset SRMMU_DIRTY and SRMMU_REF in kernel kmap PTEs, matching
PAGE_KERNEL. These mappings do not use hardware M/R transitions for user
dirty/accessed accounting. The protection applies to persistent PKMAP
entries as well as transient local mappings.

ROSS SPARC RISC User's Guide, section 4.2.1.1, describes hardware table
walks and PTE updates when a write or translating operation encounters an
unset M/R bit. Presetting the bits avoids those updates for kernel
accesses. A whole-context cache flush does not perform that translating
access.

This also provides the PTE convention needed by subsequent alias
reconciliation, but does not by itself provide that protocol.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/sparc/include/asm/highmem.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/sparc/include/asm/highmem.h b/arch/sparc/include/asm/highmem.h
index 14b03f348823..d451232625d3 100644
--- a/arch/sparc/include/asm/highmem.h
+++ b/arch/sparc/include/asm/highmem.h
@@ -30,7 +30,12 @@ void sparc32_kmap_local_cache_flush(unsigned long vaddr);
 void sparc32_kmap_local_tlb_flush(unsigned long vaddr);
 void sparc32_kmap_local_post_map(unsigned long vaddr, pte_t pteval);
 
-#define kmap_prot __pgprot(SRMMU_ET_PTE | SRMMU_PRIV | SRMMU_CACHE)
+/*
+ * Kernel kmap mappings do not need hardware dirty/accessed tracking.
+ * Match PAGE_KERNEL and avoid M/R updates during translated accesses.
+ */
+#define kmap_prot __pgprot(SRMMU_ET_PTE | SRMMU_PRIV | SRMMU_CACHE | \
+			   SRMMU_DIRTY | SRMMU_REF)
 extern pte_t *pkmap_page_table;
 
 /*
-- 
2.43.0

