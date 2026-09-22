Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C635C552955
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790083608; cv=none; b=C+DAGsFvl4cGa7vFNLU6qNMkt7TmD9LG69v134/N0nbwEW+6Vc/h7HbeGlfmf+4blwNTjMHr69yLS3ER1ehf9pctmsNc1KQBsSl/5RAFF1JfxsVudPhkc2+ZwdDvOVJ15GavmL4cP/uosSm68ECUV4KqFpSsZ28C8vJORpCqOvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790083608; c=relaxed/simple;
	bh=cpbOg0Un1sVbo7wYoe1EUrwQGxSNEVk/4dUbdqTIo0c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OozR6ywirfKHG4e4n0n+eD498GdXdXgdqG9t9HtNhTMPtQ3i6vexoYmzQwfbmvCYHfjEloeKYQPs9M2Gp6l+983q5aY4FztExb1iBZonzd3rE4lh8mGTS9CTT96xxPbjsiyCL/WDB6epCrMaYCzfE3wl/WQ+JkETCOCD3nTAMy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=iO11uE/f; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kTcO1OK9; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="iO11uE/f";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kTcO1OK9"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C400A140007C;
	Tue, 22 Sep 2026 09:26:44 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 22 Sep 2026 09:26:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1790083604; x=1790170004; bh=tnpUKcHkVi
	O6Ps+B7HUcLM/JGwZ+2mee55HFrU1wBUs=; b=iO11uE/fGkj3yygX6IYPDQVJZ8
	InVTtKlkMkOUKhiau6jJ/h6FOQAv2HV7/GVPU2xg5QdTZ5ih8hjuTHvLeG5mMgLV
	VYPSF+jBEMdb/5XXZkPn5DH2QEHwYytI1+0QsuHXtaqg9hH9VTDBUxFIk4dFeZ1M
	cSJcXldOknVANomoI2SCouE4HI2PomuDh3yhsx68KEZ4mAQMf0efTWumdZ0Yfy6T
	PSARKeMu4XWLMVzC43MeKi1QwO0wjjHgYl+nYmX5iEWzC/t91UHIKLMxXzGqDsmf
	l0YttspIEcnKpKwI7VhhNYSKsZUAkXXQTR5CQ6PJmphvThqNCXdBK37vsXEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1790083604; x=1790170004; bh=tnpUKcHkViO6Ps+B7HUcLM/JGwZ+2mee55H
	FrU1wBUs=; b=kTcO1OK9DYYIvZkTQXAR54dP2JLgGagAEUJytp4WQysrSSIobyv
	skd7jeHjkYHDhyCOCpcs7jgLPil66VssncwaypIbDHPbd3mMc1RiSBQP8OeC2N2j
	ETP2TQmrXrKWQwxURZpP9yK4e4wbGD9b2rWMnsGri6uJgbHjePlyy1iJffoWvRXm
	E+NVjoCPcca03MSWun4sskePebZRo0aqebyClYhrg1/EO3P+4HJE9jOmBR7l5czu
	F2U+jMGhzV5pArUG1cTTH2k5WdlKe9zxn9+rVe62ws0zxr5Mp1Gp5xAVx7hkXnXw
	2LzpSBnjutihukw/QIZ7WFcW4skLOyaYdzA==
X-ME-Sender: <xms:FIKyan7XCFv5Qu1Unnl8CZGzlo9ba9oJwyHKU8lrwu1I37_gIl6g-Q>
    <xme:FIKyaq09YcjPTux1C7sK05u3io494at4kYrYqGMuBJV-7Ub7Rhkxf1CeJxaqfthNc
    fWtqxnERTt8ZVcmnoAvxuy0377fZqLiNaKOznkGdPQ9ED-SlhOqU-Ku>
X-ME-Received: <xmr:FIKyamAuE3ocLaVjH7_Pm_9-DVqGbiAJlogvbANjLtfVj6Nr-mOP_bVKbmUfeHWbtBYA-WKNEdHD0yQn2IFmxirRMm4hkunz1DlqK3HtuUs8>
X-ME-Proxy-Cause: dmFkZTFFuPb2uVMR8UpqNNhYsTo9IAYDDZmyCOM3QOtrP+TnGIby2GN4IyN9ajMPE8gG+N
    DfDgVlo7wMSFjnYUgkEK7YDwCSoqM32BtPRkGJWgiIpDeVjfY18NA4pG99mrXXs/M+ceJy
    2Yn8h+TA88ivMg/v7C6Dkgfrijkf5HVWQj3za89vF6gfb9klxZvxsfvGOstI5YHj+HhpmL
    LUZOF2n0pWOjMnt42FPACPylMCbF6fU1kprOc7hGUmy0fFwdeL4MRxNA7Gk+fK3Y0nbMZr
    NKyGDmHAFUe6C2cTVbGqOVVHaA74lw/D5MW5hGk5q74vplUCEHSdSvbRDMC9XvhtUMs+I/
    9GzUnDJeuA2p45mA0I6GAa+OEtqniiY+rj4SsInV9PfNKrDJshWdNIvPwulA/VZJGwyivp
    i0t8cXJC2um0ZzzdyAABtJu+o6oGZFl99FJ0oICFY5+u8kuu5tgstfnXPbleDxPA2XDJh5
    vwoyjR/0SB9hjRI+PEncQxqqj22YNLEInapm5/uWFqujoZGpx6y4hX7PRlz7ZbMiUjXWwv
    vgcf4Y+FaKx354Ch4SkR3R/8TZz9qq9w3kCGrz4jyqMeqsUAgUgzIVbA0bQiWuU/TgvhnK
    QK1gv8vL7w0NyqxN8OTqZwfRSRzK0BL7pAPkPSfsEU+3SXXYIkCQkwFz6j0Q
X-ME-Proxy: <xmx:FIKyak3q7NOxB3mUx0ymLXd3dR8MmJSzB-gvwlxVKSJ68vm6rRJIYQ>
    <xmx:FIKyaouj8bb3eT1zteTzlXr05sxc3D5gliM30JNhzijWavoAIWbrfw>
    <xmx:FIKyas57x_3yhc3DCyzpriVfMDRPUNIZTNbeBtU9uSd_o1X7zfmhrA>
    <xmx:FIKyahLTkEEfS-XUckJNvMuzojwTJtb8ZwYdvte7NmWnGuSpN8T7iQ>
    <xmx:FIKyaoumfQli5ieOSmY_ZX6Ayi7mbhrMJkkgJoofJd07g_RAcbS6I4mJ>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Sep 2026 09:26:43 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] firewire: cdev: fix back-transition for iso_resource_auto client resource
Date: Tue, 22 Sep 2026 22:26:39 +0900
Message-ID: <20260922132639.191593-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The todo member of iso_resource_auto structure represents the state of the
client resource and normally transitions in the following order:

    ISO_RES_AUTO_ALLOC -> ISO_RES_AUTO_REALLOC -> ISO_RES_AUTO_DEALLOC

However, concurrent access from the work item and the file descriptor
release function can cause the state to transition backwards from
ISO_RES_AUTO_DEALLOC to ISO_RES_AUTO_REALLOC.

Prevent the back-transition by checking the current state before
updating it in the work item.

Fixes: fcabbf40fae5 ("firewire: core: move allocation/reallocation paths into specific branch after isoc resource management in cdev")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-cdev.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
index e49d8a58be09..664952a67a11 100644
--- a/drivers/firewire/core-cdev.c
+++ b/drivers/firewire/core-cdev.c
@@ -1397,8 +1397,10 @@ static void iso_resource_auto_work(struct work_struct *work)
 		} else {
 			// Transit from allocation to reallocation, except if the client requested
 			// deallocation in the meantime.
-			scoped_guard(spinlock_irq,  &client->lock)
-				r->todo = ISO_RES_AUTO_REALLOC;
+			scoped_guard(spinlock_irq,  &client->lock) {
+				if (r->todo == ISO_RES_AUTO_ALLOC)
+					r->todo = ISO_RES_AUTO_REALLOC;
+			}
 
 			if (channel >= 0)
 				r->params.channels_mask = BIT_ULL(channel);
-- 
2.53.0

