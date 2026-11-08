Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794166417;
	b=Y2+jPpYLiYt5/J/gHJLiD+U5yjdDhzKHQjaX7Pa3LNLQePWleG9A8cCJigKjPxERrtY7
	 pN6DLmxSA3RoORP3n0Ij9z0h9JRd084pcMgXovu88TH7p3DdYq7RZ68a+cvI4oij/EScZ
	 VshJxb3oD7t3ZAcKsRh7hirW7sVJlvwOPuBOKGkhy1Ws3SSHpoHDOAI2N2UqskBYdr0y3
	 VPCwSS/cNym6zBVsOB9qGJ6niwi36vbZ1or6a+WfxkihEi6XYxWi2UADjYRy8iJg1LPH6
	 Hon0GGTKailOuyb5v+Hexx0LH0tuVTuoh+p/jh/yTRaXZfghSRw1dSS6Gd4z8dbG2Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794166417;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=gA1PeZUXcKToREHFxU8m4mbzxqXNLHeYj9MYxhwCIdI=;
	b=oC31e0hjTruGG/eFw461yEnxcUxirTbbE8at8gRhVY0jEsr1XLTC8q61xo2ZD+t7VnU3
	 cBL2zmFLXpGVGPIPLlYRu0Z+esQ9tGpnQGS/229vf4CczYQi+fA/F90Si5nemIb8ZqEqi
	 PN5x/QQbS31sRZeJh77YuQGqMg+y+H9RkLEkq8aKKJV5j/EEA1LiqvzEZ47uVmvEeitN6
	 9fSR57bV44CVwRpep6LfvZO21YSF935XQN5xUKhSJOuIax9CI/4WAk+iRc897ED95y9eb
	 oEQFSLLDJ4adTT5JrWfoTulG26EC7tGcfQjh6UfwjIh4HT7GZfq3LTz+Vi+X4DJqkMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HwaFUCdA;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF55606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 19:33:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AF55606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HwaFUCdA
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so1520415e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 11:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794166415; x=1794771215; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gA1PeZUXcKToREHFxU8m4mbzxqXNLHeYj9MYxhwCIdI=;
        b=HwaFUCdAt+Xw41B7z/+FLruyKnlq74ZrsmSnfp/iZU7lSdNtzxNg15FDV5/3soK5Td
         B2wx4vKxjcfxqpq4Tp7pURnslhroX/hNBcIiQaWoszhKDoCjW4ssI3AWAKCTZDq8kIQb
         5sm/FpleXuNqMy6tYke/DpkgHdFnhMGxEaUam1wVFxhlh+m38TvMTC6rPCSnU7NRYzPJ
         E7huMSuzwXeN6/7i3ss9fozIE8+9yizvmte3lwPEIENb8Z2E7ZliP0na3EXWqx9eTove
         0bCk7RySOdsPCMFVdOQa+55QG0THQAz5CD07155JXGe2my61w4Iq0hocL/uBjAzlQOTp
         Lmng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794166415; x=1794771215;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gA1PeZUXcKToREHFxU8m4mbzxqXNLHeYj9MYxhwCIdI=;
        b=JxO8NwiCHho8iBasK762dfyzy+5Rf5agcBYE9cSC0LrZhY+KpseIJLQ0tNmhIr10tA
         yIkn10Frh98dsRpoi8HGK0kHqmenx8KHFA7DYjcFTBjn4YP3UGReZ9t5RWmF4SfzJ645
         Y9NclYX+Uli42OAE4LXzycLfKA8ZuuoqgnjGJNPbhGTaT6ieu6dvrIpZ3GXBRi4Si8Mg
         LZTFEAGP4EnZ1i0oZlzDihdJlmVI7mEDY2yMAWVAZBTr4/Ir4HYDBByCvLs0ALy6fWiM
         jVzGQTJlkm2Lr1fbLBnjO5bF55XbdDC36aFi9mLeK1Xj2TTZZN+P4GxN041T9bjx5A1z
         6tkQ==
X-Forwarded-Encrypted: i=1; AL+hErH2YLB612AUh4kNYZM8c7fe3GgSWadHnjr/eZI1MMr0GMaYZy6YDpK75LUSenQqkJzmg41CHGmEzx52Z2M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rGCrqfBlLDIqZIrK5C6MMe3wTcF5/SgByr6E7YjzqX8p6eVHq
	FYSXI1vIiNXCzlBkQSsZOWI9pzcGh4gxc1zR2fcVxO1+i5xLHjwDcbiz
X-Gm-Gg: AYBFou2HMe203A+IxlHAEZ4V1+VLln+2bIWI8vVDsRA2IMREB1APeL3mkD3zXIGHmS5
	yD1ZUtM0Cg+8rNIoxPxl1xM7LqKJkbhWaQuS6kjDXLlHyATgfnyERSAy3j243ux3NzcRR6Ri9O/
	Bcb+CesvRaqiz+NOrl4FLHPO6pFdndgm5ph+S8NipZpkSo65PFVDncuJiiIK+3eduOQl3dvF/os
	lKQQer+GD6PBGCg6MM0t/iWPf7qYietTNxeAro7ZRU4QR6+2tW27gR4/E9chyJWfxuZQndC1aDj
	HE/CObWPaugbv+ZY48bQaxs4FFIX91fOp8WxtNXfxYijbehtlgWO2jDRga2ReENDSLi8OeBuHyr
	HxL5rHrldIDIi5nXTldh9EzXzjaRvEUwRs61761vW64UY2pqFEzFs5Sj0ZAFaROC1nrgScCpYR5
	uL17OhUVkQ/ZjrENl14UdVAx/jFK3xJoKUsLsQCG1hiRP2+wn7gHOzBbKh6sW1YLNimbkm8DxF3
	+8sylQrUGfshm5DPnxByc7rxLe8TXmCVQqY+0VaHJt2yFPAia5+CwVpP7lAB1MDCtuVMxNUgKtz
	YO48iOFXspzwYoy63mBDDUS/0Oiayr5I2+Y+/l91hg==
X-Received: by 2002:a05:600c:1d18:b0:4a6:42cc:bf6c with SMTP id 5b1f17b1804b1-4b960d9bb75mr43471715e9.7.1794166415480;
        Sun, 08 Nov 2026 11:33:35 -0800 (PST)
Received: from [10.111.176.198] ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76cbfa121sm105422115e9.1.2026.11.08.11.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 11:33:34 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
Date: Sun, 08 Nov 2026 19:33:11 +0000
Subject: [PATCH 3/4] drm/vkms: add a KUnit test for the precomputed LUT
 table
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
Message-Id: <20261108-lut-v1-3-f762d70ae4cd@gmail.com>
References: <20261108-lut-v1-0-f762d70ae4cd@gmail.com>
In-Reply-To: <20261108-lut-v1-0-f762d70ae4cd@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Harry Wentland <harry.wentland@amd.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>, 
 Arthur Grillo <arthurgrillo@riseup.net>, 
 Helen Koike <helen.fornazier@gmail.com>, 
 Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Oarora Etimis <oaroraetimis@gmail.com>
X-Mailer: b4 0.15.2

build_lut_table() turns a per-pixel interpolation into a table lookup, so
a wrong entry changes the composed output with no other symptom.

Compare every entry against apply_lut_to_channel_value() for the same
channel and value, for a 4-entry LUT whose channels differ and for the
256-entry sRGB one. The check stops at the first mismatch and prints its
channel, value and both results.

The tables are built with apply_lut_to_channel_value(), so this proves the
lookup matches the interpolation, not that the LUT arithmetic is right;
vkms_color_srgb_inv_srgb() covers the latter.

Signed-off-by: Oarora Etimis <oaroraetimis@gmail.com>
---
 drivers/gpu/drm/vkms/tests/vkms_color_test.c | 54 ++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_color_test.c b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
index 1a1c7cac2f15..cdbb74d16b5e 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_color_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
@@ -88,6 +88,21 @@ static const struct vkms_color_lut test_linear_lut = {
 	.channel_value2index_ratio = 0xf000fll
 };
 
+/* Channels differ, so a table built with the wrong channel does not match. */
+static struct drm_color_lut test_distinct_array[] = {
+	{ 0x0000, 0x0000, 0x0000, 0 },
+	{ 0x1000, 0x6000, 0xb000, 0 },
+	{ 0x2000, 0x4000, 0x9000, 0 },
+	{ 0xffff, 0xffff, 0xffff, 0 },
+};
+
+static const struct vkms_color_lut test_distinct_lut = {
+	.base = test_distinct_array,
+	.lut_length = ARRAY_SIZE(test_distinct_array),
+	/* drm_fixp_div(drm_int2fixp(lut_length - 1), drm_int2fixp(0xffff)) */
+	.channel_value2index_ratio = 0x30003ll
+};
+
 static void vkms_color_test_get_lut_index(struct kunit *test)
 {
 	s64 lut_index;
@@ -393,6 +408,44 @@ static void vkms_color_ctm_3x4_bt709(struct kunit *test)
 	KUNIT_EXPECT_LT(test, out.b, 0x100);
 }
 
+static void vkms_color_test_check_lut_table(struct kunit *test,
+					    const struct vkms_color_lut *lut,
+					    const u16 *table)
+{
+	int i;
+
+	for (i = 0; i < LUT_RESERVED * LUT_TABLE_ENTRIES; i++) {
+		enum lut_channel channel = i / LUT_TABLE_ENTRIES;
+		u16 value = i % LUT_TABLE_ENTRIES;
+		u16 expected = apply_lut_to_channel_value(lut, value, channel);
+
+		if (table[i] != expected) {
+			KUNIT_FAIL(test, "channel %d, value %#06x: 0x%04x != 0x%04x",
+				   channel, value, table[i], expected);
+			return;
+		}
+	}
+}
+
+static void vkms_color_test_build_lut_table(struct kunit *test)
+{
+	const struct vkms_color_lut *luts[] = {
+		&test_distinct_lut,
+		&srgb_eotf,
+	};
+	u16 *table;
+	int l;
+
+	table = kunit_kzalloc(test, LUT_RESERVED * LUT_TABLE_ENTRIES * sizeof(*table),
+			      GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, table);
+
+	for (l = 0; l < ARRAY_SIZE(luts); l++) {
+		build_lut_table(luts[l], table);
+		vkms_color_test_check_lut_table(test, luts[l], table);
+	}
+}
+
 static struct kunit_case vkms_color_test_cases[] = {
 	KUNIT_CASE(vkms_color_test_get_lut_index),
 	KUNIT_CASE(vkms_color_test_lerp),
@@ -400,6 +453,7 @@ static struct kunit_case vkms_color_test_cases[] = {
 	KUNIT_CASE(vkms_color_srgb_inv_srgb),
 	KUNIT_CASE(vkms_color_ctm_3x4_50_desat),
 	KUNIT_CASE(vkms_color_ctm_3x4_bt709),
+	KUNIT_CASE(vkms_color_test_build_lut_table),
 	{}
 };
 

-- 
2.55.0

