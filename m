Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793161340;
	b=PBJfJfLXEps9JM6SBBJ7GNIXW3/SPCDUBxbbJNy7bJhxwqlIxv3JFnhbMVr8QCm1Dixx
	 I53rWl3YXBkgSlTqxWQ1GbkgjZIIjyfKcI4bitUII+Xy/P9lD9L5brkZQiNtjQLtFAMxm
	 KuSW1gyx/vf12cLavqk/yRoAJEQkqSS7DUrH6zOwn5Gw56mXWHeZ5B59swn+qDKq97xDr
	 1KggeHM8ttSd+NhOOX9Sxy3LJBtjSW3f4VsS9hmfGCgMvzvB1aZYvwp/xFlvh4gf8RYOv
	 qP4GcE5VP9PyzdvUi4Tx6sRFwDfC8MmHkMkuLNAjbZ0ZhQFX2kL88ZlioTYz4lVkgfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793161340;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2YqpHNpqDOLT8VYNbKToqFKV9CXwboGOUTNMy2MCQ04=;
	b=3Epp8Ev5Ump6mHJInbYt7m7rcldVa8S2yzXR4/PDHOjLIkc54fb9mhzsk10KP93YSWnb
	 JGsgQcyay6NbO52D8C2FDW/xc+QCSxwJhsGwtRS6ixXXakdCaIkrqg0Q6jau1YGt5Xt4f
	 jXOZuz0kF74sSQXGa7tTpRHyo1hEmbqCamIE2Pyflcukm94hMPb5UBSfO+dorfw8DQUnt
	 CPV5qoH3TvTFlMeXEH9lR1ykASbGhO3O4AFGgKpMy004SOuxh7qV2Gp6hVdX9cxBDgM3f
	 9rMj/SYFV34Ua5U+BuAJVPwuoWcSiGKO1FMkK3JKES0unQs0nGW+VYbAOjkyAB/52tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I1JGt23F;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251A8606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:22:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 251A8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I1JGt23F
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so456004a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 21:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161339; x=1793766139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2YqpHNpqDOLT8VYNbKToqFKV9CXwboGOUTNMy2MCQ04=;
        b=I1JGt23FsHtgCOscyKDdKGx5k/HZmyZWe0YBK2uJx8EpM+33TUn+kE7JGAkMnn+xJ7
         kvWotbmiCHFo2fZ+lAor4COcxEb+FjyWiHMyJ+Q8WAKaN/aB0Fd0mP58A13UwCZLWRi/
         Dhl2vISj6YIljMsi02mxodV4rAJ60nfdHNUdOQ+bnzpzLG6WRhb3JUtiQfVArs+cMPgq
         bafiqn95fiDdSU9nlPldMoQDEMwLOUW0cO6pu+oGOcxsZoSqO5oYRl+GdAXuxtVebrrU
         XGAl/AwHYmghVIwn4mEhvXaukADgKXiDBY4/lW4jsxLeuRZMXc8StdezhMuwSX0y5TR5
         L5EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161339; x=1793766139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2YqpHNpqDOLT8VYNbKToqFKV9CXwboGOUTNMy2MCQ04=;
        b=BSACsK4Q5EN/WaUfIKeAlXIXJqw0VAxfEZ7LDud4tVBIBy9W7Z3estYKt1mk9CGfcw
         RppdDmFh+YL7UJlkq2vOjlEcWuv7NZv+ECRLACYfII/7SKWtVWfEkGLbjbQTdMtMUlNo
         ZWroqTMrADhNEUKWN7s/nsW6hckD9KLE2s/iUhdLNELUAU5poigZT6pLJZL8Jae5mAKF
         Eps6injn00eExtkU/eLtu5oY50i4TUm0idGatnvukyQiVXM90g68ygEnoAxl8JkoE0TK
         GN0tjAhrQQfiZdkegqC62t2nBsXX8zc4EaAC0jlzfpIicrLdI2Uu+mFejXbJiaMXWZ3T
         Nosw==
X-Forwarded-Encrypted: i=1; AKwUvBz72Nf6VqYcmeD1jsWEG5AfyfPdSlB95D4RpETPGGa2ADZ+yPsY9rGBpjHWosz/cBNDPpyKYYlGeWqpsPM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL77D1TckUwxAwgtvuXz/FcC7pKvxSB1vSdVaQebBYjkP7yIOeR
	y+ROdo+c/FoHAZX4su/+In4TL4h/H3bLPqVw1LK7RKPToAWsTODWzwDC
X-Gm-Gg: AYBFou37uhB9NYMgj5ZHq99995ZFPv20jaVO7a1jMnikaHqiqALUSOcF43nHIpboi2W
	xxfwjGAGYXJc/DScMQAQDdqujDEPPV+/x73qnMIfvbtRCtorp4N3mZUIbgzNaTidEDZxQNm7trQ
	zS7FDo9SzbQbPzPc8Qb2Ztf9BKDB+VN/K3RIVAHzh9lkEQTYmCrMCBaKNEouoiyU87oALfnjt1t
	eS5tb14KuuI/fVRrmnRxg2Un0VKdYXN+5cUOxxVeEphIy/RiKmtBbCs4bq4xkWCCMAj43jBigtq
	g7+KeKHAhpwRueHpfNZPjcC5RFphboXJJDdjhV8H300U3C6t9LkrJEdHwd54IHC3VpPpNv26LCd
	dCY3iteibgf/wtJ803iqPAdQLB18M+mG3LFPfKsirNFSh0rPoyHqmEwdcf/ghSdQ84SzFR/AT/p
	jk8Z/RQ9w6/WSzZArzOq8uq0gpjv/DNQuRz1+sWl9eWJXBmd61Ta3IYGwqiOHjFJi25E38udSsE
	7IZpxRGLNzwGq0ik75NnOtJMpUYcf9FENquJdXvmrtD6CwlAMmXuOjfEeC4jVo4hyqRxpq+98c4
	NxnETMPD+bk3tewVc8/VWnF1imMsw9jqb9GwPSjXNQlzjMDh
X-Received: by 2002:a17:90a:ec84:b0:3ad:c4e9:7beb with SMTP id 98e67ed59e1d1-3ae58299f81mr884221a91.43.1793161339299;
        Tue, 27 Oct 2026 21:22:19 -0700 (PDT)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a501083sm1163714a91.8.2026.10.27.21.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:22:18 -0700 (PDT)
From: Li Ximo <lixicaicai@gmail.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH v2] media: mtk-vcodec: vdec_vp8_if: guard list_first_entry on empty fb node pool
Date: Wed, 28 Oct 2026 12:22:13 +0800
Message-Id: <20261028042213.2729117-1-lixicaicai@gmail.com>
X-Mailer: git-send-email 2.25.1
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

From: Wang Haoran <haoranwangsec@gmail.com>

list_first_entry() does not return NULL on an empty list; it returns a
wild pointer computed by container_of() on the list head, and
dereferencing it corrupts memory. vdec_vp8_if.c has three unguarded
list_first_entry() calls on inst->available_fb_node_list: two in
vp8_dec_finish() (one unconditional, one on the show_frame path) and
one in add_fb_to_free_list(). The pool holds a fixed number of nodes
(VP8_MAX_FRM_BUF_NODE_NUM = 10) prefilled by init_list(), nodes leave
the pool on every successful decode (two per show_frame decode and via
the vpu error / resolution-change paths), and they are returned to the
pool only through the userspace-driven get_disp_fb()/get_free_fb()
calls -- which themselves use list_first_entry_or_null(), i.e. the
driver already treats the pool as exhaustible on the return path but
not on the take paths. If the VPU firmware keeps reporting a stale or
zero prev_y_dma, or if userspace decodes more frames than it
reclaims, the pool is exhausted and the next list_first_entry()
returns a wild pointer into struct vdec_vp8_inst, after which
node->fb = ... and list_move_tail() perform an in-structure
out-of-bounds write and list corruption. This was found by code
audit; we do not have a reproducer on real hardware.

Fix this by switching the three take sites to
list_first_entry_or_null() and bailing out when the pool is empty,
matching the existing style of get_disp_fb()/get_free_fb() in the same
file. On exhaustion vp8_dec_finish() now logs an error and stops
tracking the frame instead of corrupting memory, and
add_fb_to_free_list() simply drops the buffer.

Reported-by: Wang Haoran <haoranwangsec@gmail.com>
Link: https://lore.kernel.org/r/20261023075633.3662574-1-lixicaicai@gmail.com
Reported-by: Li Ximo <lixicaicai@gmail.com>
Link: https://lore.kernel.org/r/20261023075633.3662574-1-lixicaicai@gmail.com
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
v2: add Link: tag referencing the v1 submission as requested by the
media CI; no code change.

 .../vcodec/decoder/vdec/vdec_vp8_if.c         | 22 ++++++++++++++-----
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.c
index fd15d462b..ba34c71f7 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.c
@@ -308,15 +308,23 @@ static void vp8_dec_finish(struct vdec_vp8_inst *inst)
 	}
 
 	/* available_fb_node_list -> fb_use_list */
-	node = list_first_entry(&inst->available_fb_node_list,
-				struct vdec_fb_node, list);
+	node = list_first_entry_or_null(&inst->available_fb_node_list,
+					struct vdec_fb_node, list);
+	if (!node) {
+		mtk_vdec_err(inst->ctx, "no available fb node");
+		return;
+	}
 	node->fb = inst->cur_fb;
 	list_move_tail(&node->list, &inst->fb_use_list);
 
 	/* available_fb_node_list -> fb_disp_list */
 	if (inst->vsi->dec.show_frame) {
-		node = list_first_entry(&inst->available_fb_node_list,
-					struct vdec_fb_node, list);
+		node = list_first_entry_or_null(&inst->available_fb_node_list,
+						struct vdec_fb_node, list);
+		if (!node) {
+			mtk_vdec_err(inst->ctx, "no available fb node");
+			return;
+		}
 		node->fb = inst->cur_fb;
 		list_move_tail(&node->list, &inst->fb_disp_list);
 	}
@@ -352,8 +360,10 @@ static void add_fb_to_free_list(struct vdec_vp8_inst *inst, void *fb)
 	struct vdec_fb_node *node;
 
 	if (fb) {
-		node = list_first_entry(&inst->available_fb_node_list,
-					struct vdec_fb_node, list);
+		node = list_first_entry_or_null(&inst->available_fb_node_list,
+						struct vdec_fb_node, list);
+		if (!node)
+			return;
 		node->fb = fb;
 		list_move_tail(&node->list, &inst->fb_free_list);
 	}
-- 
2.30.2
