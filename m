Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=96.67.55.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794362104;
	b=AXt7CbM5C30HETUTLoAiVqInf5UTxDKEdEqLnTrOO1ZTCQW0d8STgc2kImmxYHdvVwkm
	 xnV7NnernZei5VkbjumtrzK8QmcrIdNiIWvWBPryzpo+9TELR24yxlySjOAhts2ycpUHp
	 Wh5K/XYl4/CvdPHN3Gxmh/GjtLruEBeHpjrI5txd86q2+lDJxqU3rNrczMW30f+331dct
	 SczU9Q0G+tuEVlt/gRsRLnv7JeDtxuPY7kakinnWxeE6DLZS7RdeNeAZu5AengWAYvV68
	 yrcDKQ10jWTRCAUGZXFl66BEWs8VKGbiwz4jq18HmaKaXAGg8b4G5OjZ/9bMr+3nBxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794362104;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=UfNGntUVC1qG4IJCoHGzHjxUnGyQMMUS3zvGev7BnlY=;
	b=WeqBRqmFKgBScIpXXjX1pcakgx6Pe2pyNEpLf6geRblg7+BjP+XDOENXw/kYxWVlWMx0
	 sbh9r9x0GBzTF09sWeY9nKqmCVXpLI8cDke3mt7kjX583Zv2wJBM+KpWaM00gOv/cMyd1
	 sC9fu5fLGkNR7iA0c/+4tHIMK6cC+4gu8VZi6UJ5w+6b05yAH/Orkjn3lAT22qJAnm3gY
	 2/+cWSsd4AY9Oq8Of/gi1GFTPVMbYl5HV9ND9bJD6ehesdyZ/X1YSgs8WtfZuOKdjefj3
	 P/ITDgvHqENtXC+/U3Voto/SoQNkesNhW+8fFA+Uz85lbEs1IT1nWGx+K06k2ew+wMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=surriel.com;
	spf=pass smtp.mailfrom=surriel.com;
	dkim=pass header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=LGIilWSy;
	arc=none smtp.remote-ip=96.67.55.147
Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C14606A334
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:55:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7C14606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=LGIilWSy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References; bh=UfNGntUVC1qG4IJCoHGzHjxUnGyQMMUS3zvGev7BnlY=; b=LG
	IilWSy8XJuBLjUd/vrD2ZcVJV74G/5skC+iHwHwQCfpqjyLJ1+Iy+10KEYlUT+aTrR1i7sd4JA9Lc
	vEJgZRsmdb1L/HymWPXYAowg7Sbh0Sr1F6+0jbgJbxwww35v9E3DyFCABLzgASL1lgivA4krsdy3M
	voT8EeRwwTQnFLsHuvczWToxVVRS8lfwXvf2AKQijTjHUsFIZnLSnQC8Obqye4NOQ1mvN0bO0nFOg
	ZfKwKtgEZ23L/tR9L7EWkcSo0Nwg5AwNtmdYOWoBZ3cOskPwh4bk586/SR2ZEpgFyzhXCWIpmd6RE
	DcKKrj69YSDLV/HzTq347Aao0Wf6MWqw==;
Received: from [2601:18c:8100:a0e0:5a47:caff:fe78:8708] (helo=fangorn)
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xQxXx-00000003lCV-236Q;
	Wed, 11 Nov 2026 01:54:45 +0000
Date: Tue, 10 Nov 2026 20:54:44 -0500
From: Rik van Riel <riel@surriel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, x86@kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: x86/mm add myself as reviewer
Message-ID: <20261110205444.39dc9c43@fangorn>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

arch/x86/mm is an area where the maintainers are spread
pretty thin, which I care about, and know something
about after various TLB flushing adventures.

I should probably help review things there.

Signed-off-by: Rik van Riel <riel@surriel.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 222b7fc2c3aa..ef9d082cf1f4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -30413,6 +30413,7 @@ X86 MM
 M:	Dave Hansen <dave.hansen@linux.intel.com>
 M:	Andy Lutomirski <luto@kernel.org>
 M:	Peter Zijlstra <peterz@infradead.org>
+R:	Rik van Riel <riel@surriel.com>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/mm
-- 
2.56.0

