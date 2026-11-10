Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.64.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794326359;
	b=3cgy70fLpI6De6keWWeRXvg1WDiZ9rzM/YA0W+QHf6Kdi09sU/imMZ5O7NHAPE0G8TkI
	 zOcPJTBbaallYNjgmOTrPYUh1oYB4pHBOBTlbfCJEv82h0SL7aTC5/A/65ENTJkPp5LaB
	 usfGqdKnp+2eE5GqPErxrpYJk1/S3scZr0NcegtXMmstE4QrfZGOEIkz7APks51EUWI86
	 iCe7QBTp9hlfTeEBsMk0hrBsg9YhO3tFpSpdnFy3GDwowJjXIw5eaU2403ArPvoiZxJT5
	 bi/3mrPzX8OER0/9VjQzzmjYXEl9yDfjEwP85BwrgEszR03Tw3eHIXzc/lxfPk6Pz6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794326359;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Developer-Signature:
	 X-Developer-Key;
	bh=xSV//YIvQFpsiqfyOHHS9nn4wHPA8FQGa2A+LQxzVT8=;
	b=tsE9B/iEzKClpSqt0V1Um99Wttx7RPqiGYfCRch2nkAiZXTooIOac7yPjeYXM3BsbLtU
	 3wSOMPxLHfIz6248R+WnsTNCMew0+2hfw8SY9+tJETvII+y61jyPb2yaOWdjYnA7nRS8R
	 +w4Wa/N0wTQ+an4QwiUu1Hrx/XnwhbPi7+Zy5f4PaAjA8Zl1oqSjeGHrzhfj+f/U5sSge
	 1MHq7lmMo/PqzcNofA4ZxN76SQte3mq4iu9CRZWK7YOTv0CWBdDMTOmnag61dxokIL1a8
	 7usoGGs8l8ihiSf3kWSaNTLF90HhC3bx3SAUO9CtZAFzBzGYZH847kX4lcU0fxcwSEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens-energy.com;
	spf=pass smtp.mailfrom=errorhandling.siemens-energy.com;
	dkim=pass header.d=flowmailer.net header.i=@flowmailer.net header.a=rsa-sha256 header.s=s1 header.b="CZNHcjs/";
	dkim=pass header.d=siemens-energy.com header.i=schuster.simon@siemens-energy.com header.a=rsa-sha256 header.s=fm4 header.b=ehOygUYt;
	arc=none smtp.remote-ip=185.136.64.139
Received: from mta-64-139.flowmailer.net (mta-64-139.flowmailer.net [185.136.64.139])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09526606A323
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:59:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09526606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens-energy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=errorhandling.siemens-energy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=flowmailer.net header.i=@flowmailer.net header.a=rsa-sha256 header.s=s1 header.b=CZNHcjs/;
	dkim=pass (2048-bit key, unprotected) header.d=siemens-energy.com header.i=schuster.simon@siemens-energy.com header.a=rsa-sha256 header.s=fm4 header.b=ehOygUYt
Received: by mta-64-139.flowmailer.net with ESMTPSA id 202611101559081c693ba9090019fd2f
        for <linux-kernel@vger.kernel.org>;
        Tue, 10 Nov 2026 16:59:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=s1;
 d=flowmailer.net;
 h=from:from:sender:to:to:cc:cc:subject:subject:content-type:content-type:content-transfer-encoding:content-transfer-encoding:References:In-Reply-To:Date:Message-ID:MIME-Version;
 bh=xSV//YIvQFpsiqfyOHHS9nn4wHPA8FQGa2A+LQxzVT8=;
 b=CZNHcjs/0H6hmu++gwqye2oGf5y6X/xRHXUqQ3J7an3dEAkeP0ZSv+ZoUJfrTuev1TCD2e
 aGhq7vZ1e/+vGewE83Q+uR2i1IMG1K5llOSj+14PuvoQgh+7vzy0IhRY+dud/JJ4m6kR9a3B
 KUiBq8z/Z45Nkc2z351n4/jY6rIWo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm4;
 d=siemens-energy.com; i=schuster.simon@siemens-energy.com;
 h=from:from:sender:to:to:cc:cc:subject:subject:content-type:content-type:content-transfer-encoding:content-transfer-encoding:References:In-Reply-To:Date:Message-ID:MIME-Version;
 bh=xSV//YIvQFpsiqfyOHHS9nn4wHPA8FQGa2A+LQxzVT8=;
 b=ehOygUYtqrLVxZstx1IJS6c83SVsr2C6oxJFnW/lm4/TCVquwqlnJDnqvVuWvjCvGvr+iL
 ChLBtIUNLRGybFbaz5qp9ml1H7PDZVTfbfQ59+uT9ePZQgk0r6aLJAMP3He8XSLG+x2b4sab
 ytL9l8O+yhTs4dFf67ObE7V0913mCvIdPgqbXIny8wDsbv4VcgP2clAjHVj4GGelM5ZGnCWK
 sSbKQ2btM3+exPTICvIaYCmmo3uc2gcAyWRE44IptQ76/Mlp/BEQsKxkLIOaMy+sfpdKKOPD
 2td+afyU+GZSPt7Q2d9xe//4A3WrB8sywrpFyDK5NmumotCL8le/h+6A==;
From: Simon Schuster <schuster.simon@siemens-energy.com>
Date: Tue, 10 Nov 2026 16:58:51 +0100
Subject: [PATCH v3 2/3] nios2: export __divsi3_table
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-nios2-remove-usage-of-libgcc-v3-2-1449ce37948e@siemens-energy.com>
References: <20261110-nios2-remove-usage-of-libgcc-v3-0-1449ce37948e@siemens-energy.com>
In-Reply-To: <20261110-nios2-remove-usage-of-libgcc-v3-0-1449ce37948e@siemens-energy.com>
To: Dinh Nguyen <dinguyen@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org, 
 Vineet Gupta <vgupta@kernel.org>, 
 Simon Schuster <schuster.simon@siemens-energy.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794326347; l=3006;
 i=schuster.simon@siemens-energy.com; s=20250818; h=from:subject:message-id;
 bh=+9QxRmY6o4vxmPgi/ALJKWN2/H3nqYpovklxL5aNY28=;
 b=QJiMYXpSMagWW9ySu/WBJlUqHmRB3WDmH6R25KGu/RwkJ5tXuh5Mr8YHzvbCUFXZ173gNE7cW
 0PqNyvt84n3CRviyrnCbLVUsI8cPQxAFn15R0AglCsjIyHcQXlkAe+u
X-Developer-Key: i=schuster.simon@siemens-energy.com; a=ed25519;
 pk=PUhOMiSp43aSeRE1H41KApxYOluamBFFiMfKlBjocvo=

As noted in <20261026234452.1086974-1-sashal@kernel.org>, gcc can
occasionally emit references to __divsi3_table, so we need to include
that one in libgcc-less builds, as well.

The definition originates from gcc/config/nios2/lib2-divtable.c that
was distributed in source by Altera as part of the nios2eds in
gcc 3.4.1 (Altera Nios II 6.1 b197) under GPLv2 or later.

lib2-divtable.c does not carry an explicit copyright notice in the gcc
release, the associated nios2.h is: Copyright (C) 2005 Altera.

Nonetheless, the table can also be regenerated by the following snippet:

perl -e 'for my $row (0..15) {
  print join(", ", map { $_ == 0 ? 0 : "$row/$_" } 0..15), ",\n";
}'

Signed-off-by: Simon Schuster <schuster.simon@siemens-energy.com>
---
 arch/nios2/lib/Makefile |  1 +
 arch/nios2/lib/math.c   | 24 ++++++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/arch/nios2/lib/Makefile b/arch/nios2/lib/Makefile
index 9d5bf1df520c1..86433dcaac7e5 100644
--- a/arch/nios2/lib/Makefile
+++ b/arch/nios2/lib/Makefile
@@ -7,3 +7,4 @@ lib-y += delay.o
 lib-y += memcpy.o
 lib-y += memmove.o
 lib-y += memset.o
+lib-y += math.o
diff --git a/arch/nios2/lib/math.c b/arch/nios2/lib/math.c
new file mode 100644
index 0000000000000..ae65cc11667fa
--- /dev/null
+++ b/arch/nios2/lib/math.c
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/export.h>
+#include <linux/types.h>
+
+u8 __divsi3_table[] = {
+0, 0/1, 0/2, 0/3, 0/4, 0/5, 0/6, 0/7, 0/8, 0/9, 0/10, 0/11, 0/12, 0/13, 0/14, 0/15,
+0, 1/1, 1/2, 1/3, 1/4, 1/5, 1/6, 1/7, 1/8, 1/9, 1/10, 1/11, 1/12, 1/13, 1/14, 1/15,
+0, 2/1, 2/2, 2/3, 2/4, 2/5, 2/6, 2/7, 2/8, 2/9, 2/10, 2/11, 2/12, 2/13, 2/14, 2/15,
+0, 3/1, 3/2, 3/3, 3/4, 3/5, 3/6, 3/7, 3/8, 3/9, 3/10, 3/11, 3/12, 3/13, 3/14, 3/15,
+0, 4/1, 4/2, 4/3, 4/4, 4/5, 4/6, 4/7, 4/8, 4/9, 4/10, 4/11, 4/12, 4/13, 4/14, 4/15,
+0, 5/1, 5/2, 5/3, 5/4, 5/5, 5/6, 5/7, 5/8, 5/9, 5/10, 5/11, 5/12, 5/13, 5/14, 5/15,
+0, 6/1, 6/2, 6/3, 6/4, 6/5, 6/6, 6/7, 6/8, 6/9, 6/10, 6/11, 6/12, 6/13, 6/14, 6/15,
+0, 7/1, 7/2, 7/3, 7/4, 7/5, 7/6, 7/7, 7/8, 7/9, 7/10, 7/11, 7/12, 7/13, 7/14, 7/15,
+0, 8/1, 8/2, 8/3, 8/4, 8/5, 8/6, 8/7, 8/8, 8/9, 8/10, 8/11, 8/12, 8/13, 8/14, 8/15,
+0, 9/1, 9/2, 9/3, 9/4, 9/5, 9/6, 9/7, 9/8, 9/9, 9/10, 9/11, 9/12, 9/13, 9/14, 9/15,
+0, 10/1, 10/2, 10/3, 10/4, 10/5, 10/6, 10/7, 10/8, 10/9, 10/10, 10/11, 10/12, 10/13, 10/14, 10/15,
+0, 11/1, 11/2, 11/3, 11/4, 11/5, 11/6, 11/7, 11/8, 11/9, 11/10, 11/11, 11/12, 11/13, 11/14, 11/15,
+0, 12/1, 12/2, 12/3, 12/4, 12/5, 12/6, 12/7, 12/8, 12/9, 12/10, 12/11, 12/12, 12/13, 12/14, 12/15,
+0, 13/1, 13/2, 13/3, 13/4, 13/5, 13/6, 13/7, 13/8, 13/9, 13/10, 13/11, 13/12, 13/13, 13/14, 13/15,
+0, 14/1, 14/2, 14/3, 14/4, 14/5, 14/6, 14/7, 14/8, 14/9, 14/10, 14/11, 14/12, 14/13, 14/14, 14/15,
+0, 15/1, 15/2, 15/3, 15/4, 15/5, 15/6, 15/7, 15/8, 15/9, 15/10, 15/11, 15/12, 15/13, 15/14, 15/15,
+};
+EXPORT_SYMBOL(__divsi3_table);

-- 
2.39.5

