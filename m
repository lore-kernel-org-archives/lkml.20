Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793087371;
	b=t2oITGb1sqN+/19ibsoz+i5UJce7UV80Jr11oHVTpK7w7k5fKGMRpxj6s/htvGF6QxhD
	 lBcByg8p6DhbRcM38RhGfdLPdWq9C56R9dbn7bEvQbvaUUwZuZGpr8jPj/VdpuW38CMRy
	 rIDDHyM7qOn4GWknMqlkRKCODYfqfHO1N1nsYx6JGVkCUW081qW7X7vm+acK+x/zSE3x3
	 gXbgs5vzIQl5j8HPnoAczkVBjgejqmo7LikynRIdp1zG38+q40xWYOTYEXOzykeV6EerG
	 kx23WrT5ab5E5nwW7zjpSsImR6r7AM2Y8zrAf+CWpCi97QGfU4Ez1jFfhT387ndc8OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793087371;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=N2JsolwadF0ifSqnijIzcvLeMzpHcVPvB+pPL56nmno=;
	b=w5lfpDvaLoO0ssCVG3MOWROyh0Pa+IYodC/8TAPIEvgQRkZBpKpaFARovdZ6yxlQTWkw
	 yAxiwG2oKb5E4AEe0MNom2PpDrcBc1AJhVYIhy8hQbkT1kzeY86Lj90o5m4y5K8p5C3GF
	 GSNNXn+uB2s9dDR7DXpSdmkyeteUbdZPyPAlVXa2KJhziUIT+qtsVYZYCdWDK1wxmXPYS
	 thByP/RmoAIAbumQXIwQ9SW2YXuiBE+P45KZI8Wj/5YP4u3xD97WQZpubFVSzAyvCn4+7
	 hawZKqmnWqDTCuzi+/a738IhROvZW6rvD7sQxNxPvUMVg5Tux2Qtqe6Yhj3EV+AnsdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=S+3ovd6W;
	arc=none smtp.remote-ip=115.124.30.133
Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA9B606A324
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:49:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AA9B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=S+3ovd6W
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793087360; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=N2JsolwadF0ifSqnijIzcvLeMzpHcVPvB+pPL56nmno=;
	b=S+3ovd6WAIkZWcev3vTKTi6g1CNFtg9goZxsH/G75W+l32Nzmjwx1VRsj3sJsuqmC0mYAKTA4y9w7c9TRriycduwv41V5hCb+6bBOqWzH82CbEvopS8FH2UdCr6v8dUsl6HePy6vrCDO7uW+oqui4lpYpI94SvZMC4N9MDz4pOs=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R351e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=tongweilin@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0XDd8d4v_1793087359;
Received: from x31l07246.sqa.na131.tbsite.net(mailfrom:tongweilin@linux.alibaba.com fp:SMTPD_---0XDd8d4v_1793087359 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 27 Oct 2026 15:49:19 +0800
From: Weilin Tong <tongweilin@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Ryan Roberts <ryan.roberts@arm.com>
Cc: David Hildenbrand <david@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] tools/mm/thpmaps: fix missing order-1 file THP statistics
Date: Tue, 27 Oct 2026 15:49:03 +0800
Message-ID: <20261027074904.3328878-3-tongweilin@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20261027074904.3328878-1-tongweilin@linux.alibaba.com>
References: <20261027074904.3328878-1-tongweilin@linux.alibaba.com>
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

File-backed THPs can have order 1, but the per-size counters are only
emitted for order 2 and above. Fully and contiguously mapped order-1
file THPs are therefore missing from the output.

Start emitting the per-size counters at order 1.

Fixes: 2444172cfde4 ("tools/mm: add thpmaps script to dump THP usage info")
Assisted-by: LLM
Signed-off-by: Weilin Tong <tongweilin@linux.alibaba.com>
---
 tools/mm/thpmaps | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/mm/thpmaps b/tools/mm/thpmaps
index d92aace005c1..30a8e915d677 100644
--- a/tools/mm/thpmaps
+++ b/tools/mm/thpmaps
@@ -295,7 +295,7 @@ def thp_parse(vma, kpageflags, ranges, indexes, vfns, pfns, anons, heads):
 
     def flatten_sub(type, subtype, stats):
         param = f"{type}-thp-pte-{subtype}-{{}}kB"
-        for od, nr in enumerate(stats[2:], 2):
+        for od, nr in enumerate(stats[1:], 1):
             rstats[param.format(odkb(od))] = {'type': type, 'value': nrkb(nr)}
 
     def flatten_type(type, stats):
-- 
2.43.7

