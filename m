Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BBD547047
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 00:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791158618; cv=none; b=B+YuAZ4gDvqaiOVCRJ+Y6nRnN63uG33QXEAF09h+RUg5Gz4XusXrkyVypggZopbgnnE0pagyugx0v5jUUSNPXDxXBGfA1SvVt65b+32mdHVt2jCA6kDO+jwNVketgdNtWVuIVmQfbtxXMSw6qhKSBCr0KQaChkhZtDqbeYQIpDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791158618; c=relaxed/simple;
	bh=QspYv8lalY2rfG+EsbOgzZyC9jT5VJPlC9822x0zsTw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hj7a26kYI2HIMz9D7JbunilX86o52IeKN5+vmKSpGUwNvyTX7NgdiQjntOZCJOnd0//KRii8sJsFTYv1vVDL0x3kcPp+9WKQN0AbnIV1z89T0TkTxkMLCUurv36zYtD+HTXQ4jyxpPoynTW3mLd0EbjOB2oP4jhIsmcqQ2TDqW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S5l0wmIp; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5l0wmIp"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2dd76b1361dso6879315ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 17:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791158616; x=1791763416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dF19qIW2ffUCh6VD/Ae53xb47tJQQbelYm7eZnXY8lI=;
        b=S5l0wmIpd9svZ7RVE4oJoBFUL6o8M6kSOOpp1GJHNVVX4pu9UKove1x/j9HTSBCGWd
         7IBbv/0hV7LzYd3M6MlHQFadMINIskrRb9enc4gS2hGLqPNgT3eV8pFZ8w2yEoHO7rdk
         Tg84uOXyhOlI4dNdFlPl+F5LMPTdMn9DtyasE7tqWh/SXO3oVbOOteAMsrSUceiDCKQt
         x8MEVyxgf5DJ5+u1Pzs6oi3eTQD8SERx5WvrZrN5ab3yVVI9cexalqlpque/UrEsoQJb
         2skrJqXvtoz7TXeXGobFLj2y9mbTpWX4ACsKdOUWpOqzOYthYj/xGFwsh3U/+E4eReSN
         GYrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791158616; x=1791763416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dF19qIW2ffUCh6VD/Ae53xb47tJQQbelYm7eZnXY8lI=;
        b=m4dewgenSQgb5Gx8vsAtOaBwaQm0kxLMz38pEZ91qx1UCrqr0d+u9wBAR5R/ywnX29
         CCgNJ2EaF3fbeWSQ8sgCNPvJsB3aG+yiON+cOJUHUonerlv8HLnUcuJxxHiDCMpw2Ji8
         0q2q9xfOFmA13SSOyBnxjQcbEx2Bj0t8XmS678cPxfAz3C+r/isTDMtyLZ6XDykGCO2D
         +QVZBH8MtQu71ZeBvBH1C+3+c2X9KBe5CZr4/q3COv7cfZtO+AtM9AbBJ1KRawsTqq6g
         4E6HSVs4GsKyDmla+EpIgtad6CuHle1/VuItpSkUhIo8OfFdrjGqdNgnuygWY+tQ5Imo
         kUfw==
X-Forwarded-Encrypted: i=1; AKwUvBxj27TMedwk7MnirstKYLWMd8aFQUYIzBBLBlVI2JLfiMaIs/RJXKsKvahKFsdgr7PTM3NjrzHyNffKIFk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9/EoXbLVqSQrWi9h/boP6PdH8zAAjDLeh+6JUL71zX6UWkoqV
	kXeh98ULRDqcP/YFgwK/9kIJqpUKQlEUGxwACs9Q+Uc+VDNGrEZ3OBWR
X-Gm-Gg: AYBFou0I71kimiqu0/HlUPrZN2zg493Hr8c7/g+BGa7fxH75ITV+CXUSVoCyUrd5YFd
	tobW9WS8OlJqsnR/sAupMQL6JfFe6DkB6K6j5hSDygTARUbmo+PP8F7n2B4/n82zy1Xy048r4GM
	ZJenLQNJeUOzFMJjfYqPqZ5wzzQ2dlR8829oa5y67yBcSTCw1rF9DzQMGvuJH9dGmstOYrByMYx
	IyDxISEQtx5MQo5WS1/ihZoMdAXUepZxnzB4njxX2NTBn1tnhd6SLcS7RU82A08vmHA9zN/gtTv
	qe3S6mCTx3ajqcjeckTFqnjfWiHqW0rOeDw3EQs2nmLw6rxQKPOpSTZq0/csOCI0qrSprlKVAOo
	6IxmHvD6U7r0rzGYCvQ/ZUkc/pCvbkVu7Ga7BGBWbYxeWiZ1Xq8Q0SZR0kSEnus/gYPNzR9k4UI
	QfjKaa18p3q+1eVTrhqw8cyDvbQ9Y26nVwxIF00Q5+rULETW4gGSFK5UdNVh09E3kPKSLHlhUU4
	QIfwpzgY5KiNT2mP//DsKIRDxxLEywRrDYOAwOEZwyX+BtOWHM3wqIu0pgWW9biCBOqDtlRt8/+
	kW9LGYzB/UubnhzA9Qt0y/O8Wrhyu2To6pPs/1CWaiBNsUH4
X-Received: by 2002:a17:903:2f84:b0:2bf:7b62:a038 with SMTP id d9443c01a7336-2e4ea1bed43mr51060855ad.9.1791158615905;
        Sun, 04 Oct 2026 17:03:35 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f6aea97sm27019735ad.45.2026.10.04.17.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 17:03:33 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/panthor: fix kernel-doc for nested struct members
Date: Sun,  4 Oct 2026 17:03:30 -0700
Message-ID: <20261005000330.561623-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel-doc comments for members of nested structs in panthor use
the bare member names, which kernel-doc reports as excess members of
the outer struct, for example:

  panthor_fw.c:143 Excess struct member 'start' description in 'panthor_fw_binary_section_entry_hdr' (did you mean one of: 'va.start', 'data.start')
  panthor_device.h:338 Excess struct member 'core' description in 'panthor_device' (did you mean one of: 'clks.core', 'clks.coregroup', 'coherent')

Prefix the member names with the enclosing member, as kernel-doc
suggests, in panthor_fw.c and panthor_device.h. In panthor_gem.h, the
label lock is documented as @lock.str instead of @label.lock; fix that
too. While at it, fix a typo in the @data.buf description.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpu/drm/panthor/panthor_device.h | 30 ++++++++++++------------
 drivers/gpu/drm/panthor/panthor_fw.c     | 14 +++++------
 drivers/gpu/drm/panthor/panthor_gem.h    |  2 +-
 3 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index b55a3f9edd41..7fbb95af3244 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -146,13 +146,13 @@ struct panthor_device {
 
 	/** @clks: GPU clocks. */
 	struct {
-		/** @core: Core clock. */
+		/** @clks.core: Core clock. */
 		struct clk *core;
 
-		/** @stacks: Stacks clock. This clock is optional. */
+		/** @clks.stacks: Stacks clock. This clock is optional. */
 		struct clk *stacks;
 
-		/** @coregroup: Core group clock. This clock is optional. */
+		/** @clks.coregroup: Core group clock. This clock is optional. */
 		struct clk *coregroup;
 	} clks;
 
@@ -260,11 +260,11 @@ struct panthor_device {
 
 	/** @unplug: Device unplug related fields. */
 	struct {
-		/** @lock: Lock used to serialize unplug operations. */
+		/** @unplug.lock: Lock used to serialize unplug operations. */
 		struct mutex lock;
 
 		/**
-		 * @done: Completion object signaled when the unplug
+		 * @unplug.done: Completion object signaled when the unplug
 		 * operation is done.
 		 */
 		struct completion done;
@@ -272,17 +272,17 @@ struct panthor_device {
 
 	/** @reset: Reset related fields. */
 	struct {
-		/** @wq: Ordered worqueud used to schedule reset operations. */
+		/** @reset.wq: Ordered worqueud used to schedule reset operations. */
 		struct workqueue_struct *wq;
 
-		/** @work: Reset work. */
+		/** @reset.work: Reset work. */
 		struct work_struct work;
 
-		/** @pending: Set to true if a reset is pending. */
+		/** @reset.pending: Set to true if a reset is pending. */
 		atomic_t pending;
 
 		/**
-		 * @fast: True if the post_reset logic can proceed with a fast reset.
+		 * @reset.fast: True if the post_reset logic can proceed with a fast reset.
 		 *
 		 * A fast reset is just a reset where the driver doesn't reload the FW sections.
 		 *
@@ -295,11 +295,11 @@ struct panthor_device {
 
 	/** @pm: Power management related data. */
 	struct {
-		/** @state: Power state. */
+		/** @pm.state: Power state. */
 		atomic_t state;
 
 		/**
-		 * @mmio_lock: Lock protecting MMIO userspace CPU mappings.
+		 * @pm.mmio_lock: Lock protecting MMIO userspace CPU mappings.
 		 *
 		 * This is needed to ensure we map the dummy IO pages when
 		 * the device is being suspended, and the real IO pages when
@@ -309,14 +309,14 @@ struct panthor_device {
 		struct mutex mmio_lock;
 
 		/**
-		 * @dummy_latest_flush: Dummy LATEST_FLUSH page.
+		 * @pm.dummy_latest_flush: Dummy LATEST_FLUSH page.
 		 *
 		 * Used to replace the real LATEST_FLUSH page when the GPU
 		 * is suspended.
 		 */
 		struct page *dummy_latest_flush;
 
-		/** @recovery_needed: True when a resume attempt failed. */
+		/** @pm.recovery_needed: True when a resume attempt failed. */
 		atomic_t recovery_needed;
 	} pm;
 
@@ -332,7 +332,7 @@ struct panthor_device {
 		/** @gems.lock: Protects the device-wide list of GEM objects. */
 		struct mutex lock;
 
-		/** @node: Used to keep track of all the device's DRM objects */
+		/** @gems.node: Used to keep track of all the device's DRM objects */
 		struct list_head node;
 	} gems;
 #endif
@@ -353,7 +353,7 @@ struct panthor_file {
 	/** @user_mmio: User MMIO related fields. */
 	struct {
 		/**
-		 * @offset: Offset used for user MMIO mappings.
+		 * @user_mmio.offset: Offset used for user MMIO mappings.
 		 *
 		 * This offset should not be used to check the type of mapping
 		 * except in panthor_mmap(). After that point, MMIO mapping
diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 4f1fab66a13b..e2a0dbd79233 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -126,19 +126,19 @@ struct panthor_fw_binary_section_entry_hdr {
 
 	/** @va: MCU virtual range to map this binary section to. */
 	struct {
-		/** @start: Start address. */
+		/** @va.start: Start address. */
 		u32 start;
 
-		/** @end: End address. */
+		/** @va.end: End address. */
 		u32 end;
 	} va;
 
 	/** @data: Data to initialize the FW section with. */
 	struct {
-		/** @start: Start offset in the FW binary. */
+		/** @data.start: Start offset in the FW binary. */
 		u32 start;
 
-		/** @end: End offset in the FW binary. */
+		/** @data.end: End offset in the FW binary. */
 		u32 end;
 	} data;
 };
@@ -192,10 +192,10 @@ struct panthor_fw_section {
 	 * We keep data around so we can reload sections after a reset.
 	 */
 	struct {
-		/** @buf: Buffed used to store init data. */
+		/** @data.buf: Buffer used to store init data. */
 		const void *buf;
 
-		/** @size: Size of @buf in bytes. */
+		/** @data.size: Size of @data.buf in bytes. */
 		size_t size;
 	} data;
 };
@@ -251,7 +251,7 @@ struct panthor_fw {
 
 	/** @watchdog: Collection of fields relating to the FW watchdog. */
 	struct {
-		/** @ping_work: Delayed work used to ping the FW. */
+		/** @watchdog.ping_work: Delayed work used to ping the FW. */
 		struct delayed_work ping_work;
 	} watchdog;
 
diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
index 5ae37d0d3646..00ed3c46d026 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.h
+++ b/drivers/gpu/drm/panthor/panthor_gem.h
@@ -207,7 +207,7 @@ struct panthor_gem_object {
 		 */
 		const char *str;
 
-		/** @lock.str: Protects access to the @label.str field. */
+		/** @label.lock: Protects access to the @label.str field. */
 		struct mutex lock;
 	} label;
 
-- 
2.56.0

