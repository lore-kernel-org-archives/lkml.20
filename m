Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D27A3F787E
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787826882; cv=none; b=hYSKJ4Gom3UfzEF/yy5y+hgxdYXLc1dAuGAM35LtceVt3qyGTH4zgyJInRAg7CfdFB5SQGeDDjMIAJhxwZbuMvq5ZavZ4mA0tB32E8uSs/haX+jK8IK6EqdoqEwhw1B6sC76rUQK5udPkmIfwBjpi7OoU9Gt6O03LoMCUnqifuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787826882; c=relaxed/simple;
	bh=QB/05QxK/C1QnSzjMw37a3FHbVINUvE4y6anV5HaDSA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uourYcK2idhOeZcFi+eVhMBtJXvU8/hy3sOoRt+5tQ4TEG+9JfuX28/sp72qhO7YG6dmb0PTDZV35cm8Fx9WFFwNEXePx4njuqQv708IJYzBj1GwIIO1vvhTtH54dq2pfzxUAcpdBwSXXcOguaVWOk53+k7YOXtw1DrIxz+fqqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N5mt9U7o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N5mt9U7o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED9A41F00A3A;
	Thu, 27 Aug 2026 10:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787826880;
	bh=OYAS+bQ1Ywmr3MiJ8QFUm7cZDm2IkeiM6rs0uMt53Ig=;
	h=From:To:Cc:Subject:Date;
	b=N5mt9U7oBNIf3gTp1QHYaHzqY+0HOlbWSOw9ZOhiWdK9vjV3h7kGfC9NXRgE9wDVg
	 7rVomqvNO3vY6doA6l2cIpM2P3IWAFTlkH1Op1HUNPJ1lsQBV846BNSqB3k0XIcpkz
	 k3BAKGtKPMQxt3Rf3VJC0d2yNvC/iwNCJl0U89cqEjdiJvbnPAmP7Svj+v9nVfdd2Q
	 snzqJi1muiKStt8qmvmfheMgsQSrm7MqVm/A8++XGLZw9hTZFduiZ67/IeuIC3PkYt
	 Z8F6KLZ1EboMoOatQrQ/Y5Iu7KEfMFpVBieJMWEHYzFRdx/Ltqn6Op1I7p1W6dh1DC
	 36N1WbDNvy+2Q==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.ams.internal (Postfix) with ESMTP id 55CAB198003A;
	Thu, 27 Aug 2026 06:34:37 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Thu, 27 Aug 2026 06:34:38 -0400
X-ME-Sender: <xms:vBKQauYgckaa_NJ5jVYiRe1PaqONhxRew7IgffUC-Ivrm5gLAbKZ2Q>
    <xme:vBKQamntroB964bsv0gNxCAMiWb4LOsgqxt6Y2KIXT_hN9WerBiWH-YKNZqT1b_5I
    Sfb33RNYLzO3oUUE7cmpG2TrdQCQwTemMarSuYefs4Au_VM61XWHWI>
X-ME-Received: <xmr:vBKQasXz_f17R147rvdNugqSSnuaHMPtH52mC6Xqr3sX8DQVV_Ror9B16-o>
X-ME-Proxy-Cause: dmFkZTFjohsw3HXZQJsT0uj+pnPqzgvzWtT/qvsjRpTVFjAbOFOsPC98teyoDax/kgH1uu
    ycNhjv8wURCYJu2mklv9mCkyAQJA3RfpsVxpwdty0HXrWUI9hvqL4m6Gv3tl9CRMQGX/iL
    H8VxfT+mWrOk6gTEWo1sj36ev7XmzFTd5PYGuFAKtf6QKhsmJ7oWNWJcRgRiK8uLf//ih7
    Znf4Ei8xFV7VHwL6tP77E6dWXd7FPli35rmKKPOQ8AxDU0/rH0ozBbP6VI+oH4OSR5iOd+
    uogxH+Aar9zt+/JFys1gQFwECbMgdJ2Nc0jxBgySTM6Cn0nQqRio9hqEjps6ExcYTiX6tY
    1la+osfKhfTyElqL7S204kOSyjKUXtDVdsSBbEmUqM3uhIHgNpIwwjMOxwAwO8rBE3Qk2O
    5HqLaY64RkxbU3TeGq6bVU2ihKjuXiULxUokEVT8x6sUfgt1Bptkv2h9325A8dDQpqM2Lq
    uAaqmyqlusv1z5Y4u9pEgAvW+NhtVcP8hn7q/xT15t9WSQvtK5ZH5WO4NoP7i52bjXPJFQ
    sXVwyam06FqqludT487UGFGVak5+MwpFIPO5SbMdXoB4ph021fMGuWlBri9xOb1i543ZJw
    OVsuULE2p5OKJqeiD/dnHsKVI8/pjvYkv9DPezfRSwAOTh7JRadmTllj23RA
X-ME-Proxy: <xmx:vBKQagII3ns-bm82xsUrhhXEdzXUXaVa0DoFwGJ5Plq7eTzTaIRJTw>
    <xmx:vBKQakvIDjkavzs7KMicrKCaDS1i4vSa-DQJ0W9UU1T9H_nmQUldgQ>
    <xmx:vBKQat0pQ4PDLXHSMmO2xaggM9PBaF6naYgRZy_OxXODV7RED7ATWg>
    <xmx:vBKQakPyrLvyR2jwfn16bH9PHA1Wvv6SuB4yUQg1_mOVxEo-N90OYg>
    <xmx:vBKQalVtREHedzrHOwHppXL1t3ROqXmgCDNGUf0Igq64AjZRGHbYNd-e>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Aug 2026 06:34:36 -0400 (EDT)
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R . Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: add myself as a THP reviewer
Date: Thu, 27 Aug 2026 11:34:35 +0100
Message-ID: <20260827103435.1371882-1-kas@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I have been working on transparent hugepages since 2012, starting with
the huge zero page and file-backed THP.  A lot of the code that causes
pain now traces back to me.  It is only fair if I share the review load
for THP.

Add myself to the reviewer list so get_maintainer.pl puts me on Cc: as
well.  It is also my commitment to be more active in reviewing this
code.

Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1be7da9b6e2e..f5bb29ba41c5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17264,6 +17264,7 @@ R:	Dev Jain <dev.jain@arm.com>
 R:	Barry Song <baohua@kernel.org>
 R:	Lance Yang <lance.yang@linux.dev>
 R:	Usama Arif <usama.arif@linux.dev>
+R:	Kiryl Shutsemau <kas@kernel.org>
 L:	linux-mm@kvack.org
 S:	Maintained
 W:	http://www.linux-mm.org
-- 
2.54.0

