Received: from out-2z4y-a131.jellyfish.systems (out-2z4y-a131.jellyfish.systems [198.54.127.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92AB36B054
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.127.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790130728; cv=none; b=UV+vs1QlhW6oP+9z5BEZAPFx4LZt2QIXaoGg7RCtryMGu5T187ewF0RjBj/DNgIn1YSsLVJjNs6NkWr1xi1oV0oO+TLIO3lZtEnbW5y0LrSIhIuKMGMgSMDinNa8dfySxsMv9aRziYLPkw6lf7umintHyFd00b5TirtUhKFaZXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790130728; c=relaxed/simple;
	bh=U62+tggc8nNFxAYbHZrx2WK8iGpKMeEFQdo5LOE9Urs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d1WhrEjIOTh77ShAklo40vXvMP4gBCGe8g6xjfLZN7zFanNGlJrHplzfk/vmHjq9tkSOzu9mWi1WFkOMSh95gr5QTyj+YrIW+HI45ScVjblduPj0QxM/rOvYww6oiyk5k2ccTSNlpWOzwlW4gANj/0b7jI0MkH66EGziH1550Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc; spf=pass smtp.mailfrom=tychen.cc; dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b=pqPP1eUl; arc=none smtp.client-ip=198.54.127.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tychen.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b="pqPP1eUl"
Received: from fedora (unknown [120.199.7.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4hqLZS3Tcqz8sYF;
	Wed, 23 Sep 2026 02:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tychen.cc;
	s=spacemail; t=1790130707;
	bh=eY2FwUhC+QO6BDI+/C9DuRURjCy94COvOGbyA9JIVXI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pqPP1eUlaCDTUv5yCrMgjH2Wc/3DT6OkW+73aUgF1rN5slTP+4VSHmpSU3PFtP6Sf
	 9+2OlvqjVW+bGed9UI7fz9L5qPAvygnMpQQ5bfpVf3ZIsVzSnXY0YMRfSjiuzguuRn
	 4aTDwgxNHI1FpzJaGcVTyDkuNtWvoUOmyPEgaIuwh7/IFPjYd1eaDEbvw9EvQNNIYv
	 qHyvBfuoCA5UTn+5tF8yB/W9W93XPPMqw7uu9ijIL3WOllCaQvdH3uKN8L7mtJGrTG
	 BR9Fv6Vx0S9ky/PKpnL890E8FcFT4nIBpUR+gQCjcYFtme25oYZLLm4KYCxUwdRxWc
	 hetsWI7wL3cGg==
From: Tianyi Chen <hi@tychen.cc>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] tools: use __pa() in virt_to_phys()
Date: Wed, 23 Sep 2026 11:31:25 +0900
Message-ID: <20260923023126.1910311-4-hi@tychen.cc>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923023126.1910311-1-hi@tychen.cc>
References: <20260923023126.1910311-1-hi@tychen.cc>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: hi@tychen.cc

With 32-bit pointers and a 64-bit phys_addr_t, GCC warns about the
pointer-to-integer cast in virt_to_phys(). It can also sign-extend
pointers whose top bit is set, turning 0x80000000 into 0xffffffff80000000.

Use __pa() to convert through unsigned long before widening the result.
This preserves the unsigned pointer value and matches the other address
conversion helpers.

Reported-by: Mike Rapoport <rppt@kernel.org>
Link: https://lore.kernel.org/r/179007180279.508753.4595268983388589280.b4-review@b4
Assisted-by: LLM
Signed-off-by: Tianyi Chen <hi@tychen.cc>
---
 tools/include/linux/mm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/include/linux/mm.h b/tools/include/linux/mm.h
index 84b5954f66c3..480526de8d65 100644
--- a/tools/include/linux/mm.h
+++ b/tools/include/linux/mm.h
@@ -30,7 +30,7 @@ static inline void *phys_to_virt(unsigned long address)
 #define virt_to_phys virt_to_phys
 static inline phys_addr_t virt_to_phys(volatile void *address)
 {
-	return (phys_addr_t)address;
+	return __pa(address);
 }
 
 static inline void totalram_pages_inc(void)
-- 
2.55.0

