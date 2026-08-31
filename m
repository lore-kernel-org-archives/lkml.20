Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7863E1A262D;
	Mon, 31 Aug 2026 05:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788155767; cv=none; b=qbOoGKl8wR/UCp1kIqEj1fZ8VW8bUcty3YRdFLb/dwknp+1oEK824c598Bq/Ospr3cdoERM7XZ/OQWdGSCq4rGHHDMml94nUILjsNEmmB+BXN9n1UPD4rBUULFy+GJcXu1ELSVB4aUk9XVXzdZf8RJlw/JxUExUC0PRc4Ua3FSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788155767; c=relaxed/simple;
	bh=l2n8U7bbeseoHBECMNeVPIdSinjDevK8UAnn/AEiM/8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ivQhsZDjlH9rU7X0GgDyO7G++FWF+rErxiMlTKfsMrzv73qq+uj4urjtHmsoC8rtV636ZDNarVClY9sPBf1tEp8wU25CwFogYjqMRqJ/2eD/MhTMJS2L+ygxUXfl/yto3pT4JVN87EJ5bpEnz8jarwgsuvimM7Jbal/0sn0vgeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from DESKTOP-L0HPE2S.localdomain (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowAAXSEJmF5VqlHoTBw--.27133S2;
	Mon, 31 Aug 2026 13:55:50 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: mchehab@kernel.org,
	nicolas@ndufresne.ca
Cc: boris.brezillon@collabora.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH v2] media: v4l2-h264: Fix memcmp() size in B1 reference list comparison
Date: Mon, 31 Aug 2026 13:54:50 +0800
Message-ID: <20260831055450.2248-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAAXSEJmF5VqlHoTBw--.27133S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ar1UKFW8JF47WF13Cry7GFg_yoW8WrWxp3
	95GrW3KrWUArZYvr18GFWDGFn0vay8JFWI93ySk342q34qqFs3tw4vyFyUXF1Yk397u3yj
	9rWDtr95tF43Zr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkC14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v2
	6r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
	AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCI
	c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267
	AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_
	Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfU5uc_DU
	UUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAMQA2qU24T0AgAAsL

In v4l2_h264_build_b_ref_lists(), the B0/B1 list equality
check passes the entry count builder->num_valid to memcmp()
instead of a byte size. Since struct v4l2_h264_reference is
two bytes (fields and index), only half of each list is
compared, so distinct lists can be wrongly treated as equal
and trigger an incorrect swap(b1_reflist[0], b1_reflist[1]).

Change the memcmp() size argument to sizeof(b1_reflist[0]) *
builder->num_valid so that the full byte length of both
reference lists is compared.

Fixes: 624922a2739b ("media: v4l2-core: Add helpers to build the H264 P/B0/B1 reflists")
Suggested-by: Nicolas Dufresne <nicolas@ndufresne.ca>
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
Changes in v2:
  - Use sizeof(b1_reflist[0]) * builder->num_valid for the memcmp() size to
    match the style of the memcpy() calls in the same function.
---
 drivers/media/v4l2-core/v4l2-h264.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-h264.c b/drivers/media/v4l2-core/v4l2-h264.c
index c00197d095e7..e2b7dee8ea14 100644
--- a/drivers/media/v4l2-core/v4l2-h264.c
+++ b/drivers/media/v4l2-core/v4l2-h264.c
@@ -440,7 +440,8 @@ v4l2_h264_build_b_ref_lists(const struct v4l2_h264_reflist_builder *builder,
 	}
 
 	if (builder->num_valid > 1 &&
-	    !memcmp(b1_reflist, b0_reflist, builder->num_valid))
+	    !memcmp(b1_reflist, b0_reflist,
+			sizeof(b1_reflist[0]) * builder->num_valid)))
 		swap(b1_reflist[0], b1_reflist[1]);
 
 	print_ref_list_b(builder, b0_reflist, 0);
-- 
2.43.0

