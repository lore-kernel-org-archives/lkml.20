Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.64.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793375638;
	b=cg9tRMfWGb9eDWt2fiaWXSJ7PvCFU6ulv5pQ1viG7APgOXDgF4DKUFd+gE1DQ7RaA9aB
	 HWkz2TeiGt4OR1fZXMhS/wNBQZcV2cYD6KIJSm9Rp8RR0wWFmhCARJH0Tm7bS3ao2AHqR
	 vfSe9eQ8wyTqpySYMzHdRgCi7QeasTUcANn5T8bf3785tqYkAO13FjIIwMmqUzsQlWOuf
	 OkLo7TM0YyVHCurmprwa27ZQ8YzcZALVYYT0p5DkRKsoa5CJ1SqFgziReOC0tQCo5QUlB
	 N2DGPz3Jd0Mpj5qlppnUtscWHXi81jF0iHRmsQegUVAzL+RLeElyITmdA8dIZsiL6+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793375638;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Developer-Signature:
	 X-Developer-Key;
	bh=zVlJZWvlsMYzGvPrya2if0CS3qMyX3iXEs6Q71b34AU=;
	b=iBQYi+ApCG1NSMCDM8XTDQPXXW/VNPoJDsz0C7P98TDL+1Jl1p6H4INN3xcCaq9TDiV/
	 v41KKz+9JBj1gOkateUJUsDVDSAkIoiUg7LWde6oEmWmfuzG8uUKLFSIVvfZFXlNY6jKb
	 n3KBK0V7Js0hcDStlPb2w6ZJIELQr9Le2tpsRAk2S3PZ5H+caUsDyUfpbsSl8vNEP3s0F
	 2R9G6+LNCnsqLicNLmfl2PmJArpROMMuRZ4x2cU2vULXXZSDS+3XViswbgtyXwBaZuk5z
	 8gRrjA8ZA7dkOFJkLqNSq0Gys/F4Ulf6BcILvEiWkO6c2JK7CCyokMhnnyEjgtmlCyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens-energy.com;
	spf=pass smtp.mailfrom=errorhandling.siemens-energy.com;
	dkim=pass header.d=flowmailer.net header.i=@flowmailer.net header.a=rsa-sha256 header.s=s1 header.b=M5ysR1Uf;
	dkim=pass header.d=siemens-energy.com header.i=schuster.simon@siemens-energy.com header.a=rsa-sha256 header.s=fm4 header.b=rVn1whTh;
	arc=none smtp.remote-ip=185.136.64.135
Received: from mta-64-135.flowmailer.net (mta-64-135.flowmailer.net [185.136.64.135])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77222606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:53:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77222606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens-energy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=errorhandling.siemens-energy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=flowmailer.net header.i=@flowmailer.net header.a=rsa-sha256 header.s=s1 header.b=M5ysR1Uf;
	dkim=pass (2048-bit key, unprotected) header.d=siemens-energy.com header.i=schuster.simon@siemens-energy.com header.a=rsa-sha256 header.s=fm4 header.b=rVn1whTh
Received: by mta-64-135.flowmailer.net with ESMTPSA id 20261030155348b25e9368200019fd2d
        for <linux-kernel@vger.kernel.org>;
        Fri, 30 Oct 2026 16:53:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=s1;
 d=flowmailer.net;
 h=from:from:sender:to:to:cc:cc:subject:subject:content-type:content-type:content-transfer-encoding:content-transfer-encoding:References:In-Reply-To:Date:Message-ID:MIME-Version;
 bh=zVlJZWvlsMYzGvPrya2if0CS3qMyX3iXEs6Q71b34AU=;
 b=M5ysR1UfdFfgG72VtfeDpXZkUGlA0lzdnh+E6Vx9DtPHg4oWNacfMP1U1Oa9WKmVocx57X
 Y6qfqhJaGw1d8Sf74m3esP9HfAUsNfY0480U/6S0oYcbwzpNdYj2ZDtQwTL7j2prSCvrrhiF
 b264dR+2brdAP7XTQaLloztBuqHEY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm4;
 d=siemens-energy.com; i=schuster.simon@siemens-energy.com;
 h=from:from:sender:to:to:cc:cc:subject:subject:content-type:content-type:content-transfer-encoding:content-transfer-encoding:References:In-Reply-To:Date:Message-ID:MIME-Version;
 bh=zVlJZWvlsMYzGvPrya2if0CS3qMyX3iXEs6Q71b34AU=;
 b=rVn1whTh6ZJzSnCK0jG9/zWALMH1m5sIm5q+FHgQq5/6kqen4eVTzE434yzrau4BQMF+3v
 8lavek/4x98T09cy2VYWLsNtrpkNyaYzltwQr54xwXdesjn++oUro6BI+xgozeZcooSKGHAn
 gVd7p4dAGjgdebR1tYYGyP8KL+TGdo61Z3YcqOIKajYv9QKpGmrQ/8jEJJ3XiGIpdzSuZTl6
 UkUGyzGhLuEqOdjorUjYFHfjF/UI73uJbCdmXFIuUsFpFAIvAZfUEeY2DhsSWhNixkNJ1MU3
 KB9Dt8RttPFcu7+e5WoPnFQsIcpicBczJB5F2Mea4NCqOPbO4dF4yiNA==;
From: Simon Schuster <schuster.simon@siemens-energy.com>
Date: Fri, 30 Oct 2026 16:53:05 +0100
Subject: [PATCH 2/3] nios2: export __divsi3_table
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
Message-Id: <20261030-nios2-remove-usage-of-libgcc-v1-2-4e341c66082e@siemens-energy.com>
References: <20261030-nios2-remove-usage-of-libgcc-v1-0-4e341c66082e@siemens-energy.com>
In-Reply-To: <20261030-nios2-remove-usage-of-libgcc-v1-0-4e341c66082e@siemens-energy.com>
To: Dinh Nguyen <dinguyen@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org, 
 Simon Schuster <schuster.simon@siemens-energy.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793375627; l=2677;
 i=schuster.simon@siemens-energy.com; s=20250818; h=from:subject:message-id;
 bh=+P7nBdY/7mnOT9h5Kk74m4/zznCDoWQzsVI5g9YAjos=;
 b=APaTIzeMKdc4HyqWhRkZvEVszV5C4w4nzaWnhfjf0JB7NHW19fJsFWegtJv/a7MaZZohlysKg
 nE0WrxtFPQxAIeVxWPvQUC2PwmHzd7rXqtXU5lSZzaTShnCdMhAinnP
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
 arch/nios2/lib/math.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/nios2/lib/math.c b/arch/nios2/lib/math.c
index 9a89fa268a96e..f4a4e7d1afeee 100644
--- a/arch/nios2/lib/math.c
+++ b/arch/nios2/lib/math.c
@@ -117,3 +117,22 @@ int __gcc_bcmp(const void *s1, const void *s2, size_t len)
 }
 EXPORT_SYMBOL(__gcc_bcmp);
 
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

