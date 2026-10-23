Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792742207;
	b=U8JRrkmDHBmo336+A7ertxEz3LfffBBDqj1QBLU4UF6W7ntRWF/R9ISlMD4Ef8gHfT0t
	 3/1dwxSgBLa5wVcGeVpyEXRbX+W8PDW2wmmrbOjiiEbQSZWq0TvshgmvvWrxrZuyqYrTS
	 TmSzWUTx9Jg+JpRFk94NxshmOROS8y+zR6Zj7mBNWJ09Xt5IJRSgUsWsb3Swam1wcTmVo
	 ELFjPl6Nze1k2Ke6dkZ/I1sOu/zNY3AfQO6j09Yss59JDE+B5IJZL3AQxmjR0SylrfqWz
	 N+/MqQhR0ibNkabpi3+o44FwCzqj1o1vSdiVY2zm3buMl6z4iBbRZ8YRu2Eq5xpDkzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792742207;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DfG6IQdCHVcjOz6fH5EIp6RTNiOXw697TBLXZk9szkc=;
	b=UGrF4b1LQH2VahzAFcZYb65Pzy158pXvIFMQB+9cflgmn7Wt33KNg0xDkWRk+YKjKywM
	 uv4EwkdXN7xbu4aASpLw2xMcO0C6/GlSErUAVHDa5dlbZYntOeLAH1eRzrbbbE9FK2TwB
	 XDoc2MBCfaupjTsoKsZNk/F98x7s5vuVtX2ZLb82jhCbLeOqIFJA0Hk5XcqeJblfaPy9w
	 csD0Oe9UlmJ2Flum2eeRCS1uzgCTQQuZX09/E+CqsWFa2N/DgzUGcujiiunjRgYt9A7uh
	 WyeQTWpxndwXdw3jIaY4HXxs4eZFG3ZDbYLUjAgYVAm/KjOipRqwKkN9nZ6iGJjxUaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AE78vyvh;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746DA606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:56:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 746DA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AE78vyvh
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-89f85edd210so212779b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792742207; x=1793347007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DfG6IQdCHVcjOz6fH5EIp6RTNiOXw697TBLXZk9szkc=;
        b=AE78vyvh6pkCM6fwA8TEVkYW6bk0oAve46hIm+EBvVO8eXS9UkcyuDpO8jEAfTVZTH
         PZ+S9PFYTB9UWgydOTr2ymakLk6eVhPoM+I1+O3lKjOu8ZikE9cs6lElR02f76FZog5e
         522CjFGkQASD2+G0QnBGpnd9N6NhL1QJxHokqGf+gl6ndsWgqJYS4t32O5O5FjnIYq5g
         T+NfLevvxK8QhyJiV+OoDF1e1OjHXlmTP4NWBzVlcYYllgeMViRshwm7j2/id172RSax
         aOU1+7qD7PLXQH61xaYJBKdyfEfL6+82PD96/al7/5Q6BcnV6kTltwh3l6PItZO+xhHH
         pHcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792742207; x=1793347007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DfG6IQdCHVcjOz6fH5EIp6RTNiOXw697TBLXZk9szkc=;
        b=OEkuE0EDWONmk2SNvSHfFK4GsCXZsSSC8GZ1/5e++AZt3QQX0UxqH5NhUubvq13fI5
         dreFw5eUwMuLCetVRlY3rJ9+FVrS3HCN2cplh4srUZ/U7pXrHuYMwXQK7AhtMjj6g1k7
         UFAmdQIdsKmjZ6HYdl5qMwNAMie+0uz03GMyhqLu9A11Ydd0SVVrg/nXQ3ZXWq1IswV9
         XdboBY1w+KBl5I6+g+5lQuAqxzcp9MSZdBlJQajTe9oEuZ1W/lQgb/GVvAeIfwV5v9qp
         5P+xXfcWetgoSr+Q3KmJlAV8WHlPkImzMZMO6RLgQ6mPiYwgUWj1ztoYcG0+cwwtih/m
         X0KA==
X-Forwarded-Encrypted: i=1; AKwUvBxUUXIm4runIs5N/DIZiqhHI0Pbd/hDb/JbmxB6gQTBefvAJmeJseBn92JdNmBD3VmGarb6/+jvfrqEiRA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVcJGP2+lGoyi8Vsj7NKmLixsaYR6LdMCH5MiLBs+xkqhMA+kC
	bW09uRCWyK1VfUcAOMxdf7yThVkkDeCsEWnxBEDSFI0lk4aU2lyNAhSAYEi+Qt4B
X-Gm-Gg: AYBFou3Zw2/8YXMPen8II2LOeWzsCK46tA/f7ZSYg6FBPGJVHuaC6UJ/l6cp5FZPWcM
	l4PYAqzOYr0wCVqN5t1uaGXaMKIwRVIrJa92ZV1F8FeMo4O4ebbiBdN7cvW5Eyvs9/BtjG7jO8J
	XJG+YbJ89dsY+XtsIZ21nKcwA1prBLge5OReTJ6SljPGg5Or1zRhWq3wIa1wYQXhAL+qrtGpRo3
	Lm4hQat3PKBD1zp/tJaDvOCV2qQo1g+FjObg8FJjvKwCZCUD4Oaw2hzcd7E6XAJ65TNbJMdA3c+
	YFAvysYsG9VTOG6daxholLQwDABXcbHDKp39z+wWqX2fxJqUJ5RrFwHnvhkhtfVjfsLutci4Zyf
	NSO+RZ3J0d+1lcRgKWKXSHjp3ygSOb3i0nogzmjqb1BuGvg9341yXswg4iiwzq0lW2I7cn+7fHM
	CXbWyclfipN5r52royvqU5sdxCyHB83/HZA4Qj1Vf0GKf7HB0h4xNTWDRqUyTIOqn21ra1/uEeK
	ZSmhk4miu+p2663IfKaqGee7ZyFodaIS3SmIm4XCQF7U+3W/cCZ3yShJbGy+d+ITAQMoiLQFEzu
	xMA6sH3/YGWGFKnwuMCddLAawR4=
X-Received: by 2002:a05:6a00:2d22:b0:89f:9ea6:1dd9 with SMTP id d2e1a72fcca58-8a2c6d927damr1178514b3a.38.1792742206707;
        Fri, 23 Oct 2026 00:56:46 -0700 (PDT)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a2c930dec7sm437340b3a.52.2026.10.23.00.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:56:46 -0700 (PDT)
From: Li Ximo <lixicaicai@gmail.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH] media: mtk-vcodec: vdec_vp8_if: guard list_first_entry on empty fb node pool
Date: Fri, 23 Oct 2026 15:56:33 +0800
Message-Id: <20261023075633.3662574-1-lixicaicai@gmail.com>
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
Reported-by: Li Ximo <lixicaicai@gmail.com>
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
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

