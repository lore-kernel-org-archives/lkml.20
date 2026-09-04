Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114A23AAF7E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788518946; cv=none; b=KCHCWlgtpWCNCxWMdJ0CkQKAwSJqROI6Go3u6jXYKmUMIMrh6UDJwShNs3BPX2srO7KAe/yHKcheLpGPlC8ty2ZjhT88cxAAqUGI4PetbLgLjDRu0uWP9o8KW3+JcViicaZHKKK/W2D8tWMBf66LWJROTWwrE6N/0nM38NQPJxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788518946; c=relaxed/simple;
	bh=qVcynegpZm1yGmLZX8tUiOczHSGQ8PzLgexY1A3PAtA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=toGcnNk/eS016TZEnM0cI3xoFMH+23v1sVrRZKkxCsq3sD7ln638oyujicjVNfWF7/XwSeeuWRiKUGxWXokr2UEhXl8+P0+4PgjRYL2BkjfVY1gFuYWNuGSYWfZJuJ4MPOvWJpFhZm1LABObMdG6nqz79KRzs/T4cHrlCaQBaMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cuW4tsGp; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cuW4tsGp"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d5335cf904so8012705ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788518944; x=1789123744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OlLVTDTkKLUK1RrWb8jn049QsgDUDcnIGDsaM7mMOOY=;
        b=cuW4tsGpKXvePWLymjwDaiaxCBVjs+P4Cy4ul+5DcnhgBk1UzTospDY74Rz38fSLZN
         GLQh128rehR+/MZ0kkN83btNk+B+UYoNIUN4O3EoUYGOck2nIfXmP0fDDPFsl7KGWn2g
         Bcue/YWsV3tJ7ZiEZzWDzXd+vR6HqnBXjchV88YpbPcIh6w7sbogEB6vp+Za5TV6tbZw
         ItNvI0Szwgdb+a/kUpIIYs2H0MzQ2VNg15ycdROh3UGkWoyMn64bqUa8nuCgUFBVLhUu
         F0jGnKRmlRnfP/6975+YL5hb2nwQT0imefKsEgg0jMVZToCqZvb32AHZ61Fpug2JXYnA
         1dXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788518944; x=1789123744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OlLVTDTkKLUK1RrWb8jn049QsgDUDcnIGDsaM7mMOOY=;
        b=OkdpNHArFRUEC33DLxFpQ6Nla/o2xRLTCRf1aa2n624NrQ5RGfxM0bS8AyCffQ57NU
         pYR7XoeYpuVeCGu8vRALPZMAtPqJ6dhcvX9X2W2FANEys5KtVTl4VKNizGmbCGlA6Gua
         P80iv+WQy/xXlj+n4iAc05QTv/Hs/ACskUKtdBXh5UVHA8BqriCXvDv0dCQ+0izcD28U
         jJ1Zq4xcdwlVu1C8RAI6PWBbJIcPpLaZJoJgZj7MU2Ico5PMS5CfjpBZYhkI8VW1xo/3
         S/7dPbEgg47xX4pCS09EY3GV0ZILW7io1RBsXBMnq/rAbYmqVUKpjd2CX9KB0w/U+6nR
         GMCA==
X-Gm-Message-State: AFuF++mFAkBDFPflZe/u3PK/bkDl2v6F3yatxpvfMIj3LTBuNFCnUKZx
	Xr7Ls4eZMNdKWTYT+hK6kKeOgTj6yArt67LniIr/e3/EzBDJ4sqDLL+d
X-Gm-Gg: AYBFou3LMhT1BrQF27dKqMimIjLsZ3sayO2z0RU/hYv0G/eakVrsVz2yDHLoiL57APm
	GCpq3vskJsJKSkT1x276AoWAiDzJa6tM7a7MXd133A6kkwwMV5vaP/wD67LrAQKlvzNPcIYEEQx
	qLG/39C4T8/8ugiQZwyozcwaBkEokr2Kx88Tprifo3wM+OwoZWF3BrdlBv5ecywjtTJdhx8plLd
	aHmEYY97MYlYOS6qzK0ompkCDyERUIDInhLYbz/Ngffka94AY4ZYyieOQwZx3+9qDNWGi4G5c6l
	/fVJbNva4yPND95ZcY/Pe2W129ASm0NWjKyoh+oR1BtxMaqNN65SNobeIWCyivtagG9wfHE6OYx
	Uob4X4HJPExApKJBqFtd9RnkSf42/aEgx6h9oh42WqJuITKlchZcet4n8cWmqIIR33yFOfaa51z
	4fgTZPuerpOJBKNKrFpWfxqQ/0y1xHCJQbEGRKgzgycrbVAne6QbE6x7OHWp5ChzHwLUm1hDV5T
	6BudNvGVe7gF5Yqf+WxvstM+Q==
X-Received: by 2002:a17:90b:586c:b0:398:a2ed:7b5c with SMTP id 98e67ed59e1d1-39b2623ef65mr8977929a91.24.1788518944271;
        Fri, 04 Sep 2026 03:49:04 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm8583927eec.16.2026.09.04.03.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:49:03 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org
Subject: [PATCH 1/5] asm-generic: fix typo "explicity" in comment
Date: Fri,  4 Sep 2026 16:18:46 +0530
Message-ID: <20260904104854.25272-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904104854.25272-1-hemanth.selam@gmail.com>
References: <20260904104854.25272-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "explicity" to "Explicitly", reported by scripts/checkpatch.pl
using the misspelling list in scripts/spelling.txt.  Only touches comments,
no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 include/uapi/asm-generic/mman-common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/asm-generic/mman-common.h b/include/uapi/asm-generic/mman-common.h
index ef1c27fa3c57..cf1418649b3a 100644
--- a/include/uapi/asm-generic/mman-common.h
+++ b/include/uapi/asm-generic/mman-common.h
@@ -62,7 +62,7 @@
 #define MADV_HUGEPAGE	14		/* Worth backing with hugepages */
 #define MADV_NOHUGEPAGE	15		/* Not worth backing with hugepages */
 
-#define MADV_DONTDUMP   16		/* Explicity exclude from the core dump,
+#define MADV_DONTDUMP   16		/* Explicitly exclude from the core dump,
 					   overrides the coredump filter bits */
 #define MADV_DODUMP	17		/* Clear the MADV_DONTDUMP flag */
 
-- 
2.48.1

