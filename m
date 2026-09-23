Received: from out-2z4y-a134.jellyfish.systems (out-2z4y-a134.jellyfish.systems [198.54.127.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2BB372EF5
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.127.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790130728; cv=none; b=QBy1N2asOi9qZmhu+Ma605t8BJs8HpCbJHKum/prOXWgV7SlNHYQ2p+BV7hGtqJO3ZBYqSaeSDabciCyracQudJOUuUyH0lyy6eKqqHyuA7WD8a9s4nE1SfqIn0dNKwmsoITcRc5ALMzftYonC0sWJyx3nlR4xyTeZQHjt0UzkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790130728; c=relaxed/simple;
	bh=H8G1ZpSGU+XEPkSOWl5JwWrQCV5ATc+10WGucScsNZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R0Qvez2WJMocU4YoX9fUgg+HgRFLEguu5986sCjVvpi0Oqd5RQPjhjiPK/rz76zz+1SIkIfr9XFHlt91Jwyx2juIr9DJyHKtKE4Em/9J+qyXZfr8yk6285sjEMp8YudbhiqCoaQ53Pk8iKOx2QYU0TDSDSosVzABTWzNcLksvUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc; spf=pass smtp.mailfrom=tychen.cc; dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b=JxeV8+Gt; arc=none smtp.client-ip=198.54.127.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tychen.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b="JxeV8+Gt"
Received: from fedora (unknown [120.199.7.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4hqLZW45MGz8sYH;
	Wed, 23 Sep 2026 02:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tychen.cc;
	s=spacemail; t=1790130709;
	bh=r5BCBsILvYpkCei8NxC2nBexoyGfpFRtjZRXstiHS3c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JxeV8+Gta6mPvrkqBEcX7kwlYEAqpPcPO5yJBmlxp2MWLyMY9zeRQhNoPUx69Q5gj
	 fgfZCk0mgSYgRKQDuKntGl16gTZQC+q7m7a4bN2goCXzbRjOz/ZQpj0OAC5lg5l+nF
	 NxB8EjwKuB1EvIEkwzUrFZK2ZvudGhURT/E+53XQrJ4YFL9Jj/3JK2pN24rg7eMTGO
	 1UIw8wv0506cABI7dNCAoeidT4/nQTr6L8qJ7Ti85cSy7x4O96egJ4GEwjBQ9phkQk
	 3ykc0JQu5LrqD+r4T5v5Fd6Wp8VIrnICCLH0xOyh2lAv9S1VE5fjabpFUQ/nVsa25C
	 abAFNQ8fO/4Ow==
From: Tianyi Chen <hi@tychen.cc>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] memblock: initialize the region merge end index
Date: Wed, 23 Sep 2026 11:31:26 +0900
Message-ID: <20260923023126.1910311-5-hi@tychen.cc>
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

GCC 13 reports that end_rgn may be used uninitialized when building the
memblock simulator with BUILD=32 and its default sanitizer flags.

Every insertion sets end_rgn, and the nr_new check prevents merging when
there were no insertions, so this is not an uninitialized read. Initialize
the index to zero to avoid the warning without disabling the diagnostic.

Reported-by: Mike Rapoport <rppt@kernel.org>
Link: https://lore.kernel.org/r/179007180279.508753.4595268983388589280.b4-review@b4
Assisted-by: LLM
Signed-off-by: Tianyi Chen <hi@tychen.cc>
---
 mm/memblock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/memblock.c b/mm/memblock.c
index 22d14a637f24..aee1fe36130b 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -614,7 +614,7 @@ static int __init_memblock memblock_add_range(struct memblock_type *type,
 	bool insert = false;
 	phys_addr_t obase = base;
 	phys_addr_t end = base + memblock_cap_size(base, &size);
-	int idx, nr_new, start_rgn = -1, end_rgn;
+	int idx, nr_new, start_rgn = -1, end_rgn = 0;
 	struct memblock_region *rgn;
 
 	if (!size)
-- 
2.55.0

