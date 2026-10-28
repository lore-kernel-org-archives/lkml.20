Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201947;
	b=xxfU3P85CicQpyt0n2qxKU6CDLq65ZRzlVJRxTjT3v7AQtEvRn8405QIGqf6Gx8kaqTf
	 EFvC1HgZ1Myu+wmcYS0iL9enEiHTiAqemWioi/leyD+Y1N7l90D0E0Y5KmC8/kv7OQa2D
	 ICh4EbjuXzuqC/s1OJ8SBfaIU/dMl6KjvDky8uqrtbKtDNzv7+Hc6RoaNmFb+RRVRZaE5
	 DVP3fPBqQpF0MbYaV/LDF08bzQmAXND1pdpSZzh3TBSV07hKBhk14i6+ZwcZ6mYHI5wDg
	 XOfrFXmdall8H4rM8xVsjlLkbx3wv0Hfh2XCH1b3/+9WLLQT1bsk1cIY3mmMFwB4lMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201947;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2YqpHNpqDOLT8VYNbKToqFKV9CXwboGOUTNMy2MCQ04=;
	b=MoEbSgvwtjQJ6cm7QyU0Kx7RRBhzIoq4zRZZUukEzfvAPIM5Arloxb7a6ISMkj4e2KO4
	 gTCAmWTWe9B/FSpSYfT+iunT/M3EejMNCoex9DTGDhI7vMzldjziIOwokw60egDXCP7z7
	 bgBZHfGINtBKw6Cw065RaBazgMI9dfB1ZxvmTkvIBElyeJeNp3MrgGwVc7eL5SL8PkLEd
	 0G3gEwcm5A1ZcqciifaIU8thhA9WKXaA8Aj+vfzf6QR7DjABIB5jjhxr6oCoLsQ71aZ1s
	 ttPRIGUx90pEtqHVq8vF8UxT0qDCugFT9DpjKIpt+3UDcPI7/eBGzj8BPeE0nAV5WjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DnQPtUIw;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE8C606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:39:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECE8C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DnQPtUIw
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so666381a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793201946; x=1793806746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2YqpHNpqDOLT8VYNbKToqFKV9CXwboGOUTNMy2MCQ04=;
        b=DnQPtUIwRy+I2bjm1a5lupUuNF0QdFVhy/2wCSZqQ8LSIMvmYkPU7s0zuCVpHd1m1V
         p/PkTA9nj4uRlqNoazBgStQi15oc346+C7LmA7B4V7OLGVvK3xk14JdEGJonGn8dkRPA
         nE3289YyK1/0qWEW4F1umCxE56wOT9lSv3GGQxj9hGCqJlFGhb0W/9b9semF4awl36Fb
         pb/AEockeTA/T35qqS8aMRBHgcwZRy/19KUT/yjWOOYzTBQVecTiTJDNoB+dksmfuZD/
         J16sfC2iT+zQlBTGMdL1kJsCwn7enFj/pDThPea/5ObeH6awa/rGssM5D4yP1zbZa8Ph
         EMQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201946; x=1793806746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2YqpHNpqDOLT8VYNbKToqFKV9CXwboGOUTNMy2MCQ04=;
        b=ZA2aAivmJQnDlESJ/4/Bgx7m/7E5Ui68NA2ilRKGa2b0yFc229uBvkND54OLY0UExp
         DDkTcY4STPF1Oxm59zkxIC5lK68VtHNkLI5Tj/81dgUqcD26HjHyRku0IXPgeDb7pB4B
         T1neR/qW0/v970C0bqtS/3YvfT4cyF6OH5/CWN/huhqk+0ht+zfBrt0r3Csi/s9JiYOR
         xgLF7zXokvN/g468siriOpfvDHWdx2UFhiesxF9Bh7tvjBUeLN4Vk2l9d0P14YXr/c86
         CTasKaz8QnJVpwirJZkLdUm1UM/qtIoVzf5X0+JpF6XbAn2BE+xHSZtZOourDauPG6H4
         lOSA==
X-Forwarded-Encrypted: i=1; AKwUvBzCf3bkhqxDZFxYk1BF+pp3qTVSp56wJbLBIpbv4rGfJ1058f0w/7iAqlq1vHp5+H2cdPEdzhAGjy6ddBE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLM6DR94j0MR2jNcSPEAPexQFuMtGVM5d/LdgWxS9lWdRfLRlBO
	oamJw9PRC2+C2Pik2kBOrpQSWz5JvZeXpDqChdOna3T5u9qFgOf74vGFqqTuGA==
X-Gm-Gg: AYBFou07fC3M8mpiH+4N3BM4z6F4jICebhycCN/oCOeDA69gG8ttfRQtH15u3cX2hBh
	iCdqvAe0kvDuHB+Qxo2ctdsY5B5PPCnGmw6pZXD7vKM5nkao3TWJbUf7JMZ/6w0/XYSdFun/id0
	sdcGMOmF2OB4EtSr3w0DbUAO2OIcldMg2prPbgpufYtV+LFQ7aVgHkkvOTh+N6PKRk+4zO1uc69
	I1y99VbROg9zWsaEhG9iiQcYov3/uNG5h9QaEsjzAZdd2PIqJDbS7oIJYd07xheIfpiELgR/qxK
	QKUoAIc/GTA821L8u27s4WnqH24lF1LuAr5Wn3Jxq4y7t/EzUBMKzJnwiQkiOMMrYtK9HyMDrfT
	m657VHVlXOGfP5BDdZOSrx7Ks2c2tPmhwT+OjxecfRS5BbqFfgmNXpyKbSPPNsEI4IxJGgde1vs
	76zE0r2YRD8uw2GdXgrK+LeTk1ESP3dFEGqkXtD857dRew/F0WbI4DLOfrYtYosDjdpSPa3DYpl
	xFf9L1xTTtEmfoGhZ7REyCVTSaag79Z0RQipNqpEaiys80ZeNHfcr+7poxfpVTujzZrAJcxBkul
	GrittEDEOT0DK1f/IMUdI10eF9ol4CJ9I5feINsgHQ/7D4bmgsYTWNAuqR9wIVAN6FgJbqG32O4
	c
X-Received: by 2002:a17:90b:3812:b0:3ac:adce:60b2 with SMTP id 98e67ed59e1d1-3ae57e33be2mr2149303a91.2.1793201946249;
        Wed, 28 Oct 2026 08:39:06 -0700 (PDT)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae579c5b77sm2033386a91.3.2026.10.28.08.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:39:05 -0700 (PDT)
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
Date: Wed, 28 Oct 2026 23:38:57 +0800
Message-Id: <20261028153857.3972168-1-lixicaicai@gmail.com>
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
