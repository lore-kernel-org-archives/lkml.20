Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADE442050;
	Fri, 28 Aug 2026 02:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787883610; cv=none; b=kHLvxsOl9lrCZNEGczP4Gplkc8+lVNazIC5xSkesKcLuxKvfLONXWdm7v92wlOE4y+bcQweS1VjASAZVptVlaOvEeYi/Ed9CCA7djhqthvAri5pXPXgtiluR35FPcZgZtsdQj/AIJdgJH4uRjpb56vF2vCTZ1fqhavyOy8Y0Sdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787883610; c=relaxed/simple;
	bh=Xbr73mh4+G/LMHmEIOCSQ3lh2lo5ed90wySLdSSpMvs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HZyWE6ETfxZqv1NEbM2nh5coqOFHFRQZWygtewwLWXElqsM8qCy4PW7g5yl80zRlbCKGd1SjBu7GT1o4RQZO5eDCLa9nMVmlemWmMrQf7ohHLfMt+8fN4TN4ET/mpvYf6lppfyF5NTBIdHsI2ZZZgpi2a0Upqfo9q5hXniR0iv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from DESKTOP-L0HPE2S.localdomain (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowAA3aEJO8JBqdjLWBg--.59165S2;
	Fri, 28 Aug 2026 10:19:58 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: mchehab@kernel.org
Cc: boris.brezillon@collabora.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH] media: v4l2-h264: Fix memcmp() size in B1 reference list comparison
Date: Fri, 28 Aug 2026 10:17:39 +0800
Message-ID: <20260828021739.25766-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAA3aEJO8JBqdjLWBg--.59165S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ar1UKFW8JF47WF13Cry7GFg_yoW8GF45p3
	yrGrW3KrWUArW8Zr4UKayDKFn0qay8Ja12g393G3s2qw17tFs3tr4vyFyUW3WYkrZ29r4Y
	9rWDKrZ5tF43Zr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkK14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AK
	xVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
	0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1l
	IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
	AFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j
	6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUjIJmU
	UUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAANA2qQuVyhoQAAsd

In v4l2_h264_build_b_ref_lists(), the B0/B1 list equality
check passes the entry count builder->num_valid to memcmp()
instead of a byte size. Since struct v4l2_h264_reference is
two bytes (fields and index), only half of each list is
compared, so distinct lists can be wrongly treated as equal
and trigger an incorrect swap(b1_reflist[0], b1_reflist[1]).

Change the memcmp() size argument to builder->num_valid *
sizeof(*b1_reflist) so that the full byte length of both
reference lists is compared.

Fixes: 624922a2739b ("media: v4l2-core: Add helpers to build the H264 P/B0/B1 reflists")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/media/v4l2-core/v4l2-h264.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-h264.c b/drivers/media/v4l2-core/v4l2-h264.c
index c00197d095e7..1b1421caf488 100644
--- a/drivers/media/v4l2-core/v4l2-h264.c
+++ b/drivers/media/v4l2-core/v4l2-h264.c
@@ -440,7 +440,8 @@ v4l2_h264_build_b_ref_lists(const struct v4l2_h264_reflist_builder *builder,
 	}
 
 	if (builder->num_valid > 1 &&
-	    !memcmp(b1_reflist, b0_reflist, builder->num_valid))
+	    !memcmp(b1_reflist, b0_reflist,
+			builder->num_valid * sizeof(*b1_reflist)))
 		swap(b1_reflist[0], b1_reflist[1]);
 
 	print_ref_list_b(builder, b0_reflist, 0);
-- 
2.43.0

