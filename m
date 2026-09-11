Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7C3389104
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 22:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789164898; cv=none; b=IICoCBBzh6tFcaVNyhVSVr2PH5NjuhOs4xlkwTtxXXKgH/bfeZ21qaRMVf+CYIOxrsSp6Y8aLkol3EOw1eRN9eoLfd2E2yHzHu40aZ4ZbXy/uNo0HT8RLhewvpo56a3JLhR/8WRdvJC3BivxyGMYGC18ayErDfsHtxYyRWcxYoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789164898; c=relaxed/simple;
	bh=LdQoQbgZU0lrWT2pURL+7/e3k5+0HWD3ja5iw2sMZws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T+OaWi5g5Z2ddsFJ1uCxjVzoWpjHmiXm/slJpeDkBF08oQObq2xR3dJSqtUGdXygtYtiNgybI32O/UOMm9occlBxl9RNVisAGFaqVY0EXlHK+wTUYtFGPHUW1IoF3RS/BXqkVKYMA/CTcyX4Fy/jJSiTSkV4X7FLoVP5N49DHpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rrVk6KRS; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rrVk6KRS"
Received: by mail-pz2-f43.google.com with SMTP id 41be03b00d2f7-cc4c08393dfso36353a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789164893; x=1789769693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bZMF2qooMPRk5Hq78os7KgYAWUsTasHU8sMqJeIvwpw=;
        b=rrVk6KRSqjxvzJ+D42cYDvBAtF2/WIXzMMqbkVrCRgEA6udEx+DbmuyffQkpfW9OdZ
         eVo5R5OjMVvCdMTIMluZuG6iYjZvQ2+TiaFyCzvHXSFrePjwcoaDwc92R8hbc9puoF0c
         VLrZ9UfOJkw47pNqd6rksfJtMxgkOIPQH+S5We6VMSvzoU+tw9vBQaagy79oZMO+mNHx
         UCbzemGSeygMJrdlwrhaTYOreDpwJkW48fgi9a0EYLgu9Ynirp2EJTbEEWXL5UupL/CC
         TiAwlASF5L/FHyS8SxF7l+qyEz9iRJIR+SxcYopKL68zxjV+FiqtB0xyvZPi0PkNZyKZ
         wqsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164893; x=1789769693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bZMF2qooMPRk5Hq78os7KgYAWUsTasHU8sMqJeIvwpw=;
        b=EK6BKKKEHoAaDcbqxHJPvq0NUwafQyT+yNtGyKH+tdp+0+kejJdQayN91qYHgZ7lJ+
         pC30JqSzkDXZnMaiQVa80iFHCtXvu40jp3TFMfX/cBAq4lRe5NX9uZiuccqG9ReYFZQ8
         JEZAoI6e+TqbyRFRnRqTumrPN6/onmJRq/xcmtcn1z7tjmtyE9DELcQ8psJE73uZKork
         tjIScIWBZNs23WfbR0kAsCnxThLPwTXruOZ3BpYvEGNcM5ZH7k/otjLVvp9q16gnVyd/
         ZzfJRwpxLmnOyEJUmKiZnTPS5wnYRFR8JepeX/aOUmm5CsGIK79F0H8d2Rwufbfm2OFl
         u1fg==
X-Forwarded-Encrypted: i=1; AKwUvBxkAd80YCfYb5afZrzlsmtGfxWnMhp8nvyGgsmJgRG3ldgqnjX4QODeHYFcujkEtHXaAnKpng8oXjedDN0=@vger.kernel.org
X-Gm-Message-State: AFuF++nM5XyAzgvlhJFH7mbPjHFQDpDP9300s33iqTGNkMDPIymFSPEi
	ouIWROkSGctPUFzC33ok0NgZPFtmlv7XBhYP3ZhM2qCPH0X98g+2+L0E
X-Gm-Gg: AYBFou0cYgqOLBMQALO8I1PRYwFzH9k+b6UzzCoVePGNuUhCu++cu4dmxTwmcr0lVQV
	2M5qc48ehO9F9rjoi2TPfxn9sv0yugl8UWU9l6N1b1ca7reUKQbyu7f6kMF7ol2fm9Oyghrs+4q
	O+hlvh8rhoFUb9Q2Trp6GgZfT88swoFPwewaE9ZTTJgvtxBAleUoMGIxW3EkfrLbwW/g0z0Gk0/
	pHzmOPVahpcNcPz2KSq+tfbSe/vbE3MvZ/dGWMY1pC6/mVF8e6BgtB+76nFR2GRuP30tC9xRa3R
	fVPsL1spiWPJ7u46fY+ATDUFrVriLJjajjhtB3GW39+gL6MickOpChYGmxZY8r7pR4CQOfibiKe
	3nccRqTiaBVtKVVCOquY8xXz0r+WBVOoKAPm0OIl87hsQrEUSWwbs5pG4hTp4acLqto1B9gH1Az
	JjupnMogzpxrkZY0IS45G7tTAXMhyqfuiy2tyBBjAphnHte4a+Xdky5VAs1F30mTNMflOx
X-Received: by 2002:a17:90b:258e:b0:39b:2c00:c3f5 with SMTP id 98e67ed59e1d1-39dbc6d8753mr375019a91.18.1789164892609;
        Fri, 11 Sep 2026 15:14:52 -0700 (PDT)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e51449sm7862656eec.5.2026.09.11.15.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:14:51 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
X-Google-Original-From: Yury Norov <ynorov@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	"Liam R. Howlett" <liam@infradead.org>
Cc: Yury Norov <ynorov@nvidia.com>,
	Chris Li <sparse@chrisli.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Andrew Ballance <andrewjballance@gmail.com>,
	Yury Norov <yury.norov@gmail.com>,
	linux-sparse@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	maple-tree@lists.infradead.org
Subject: [PATCH 2/3] idr: assert static storage for DEFINE_IDA()
Date: Fri, 11 Sep 2026 18:14:42 -0400
Message-ID: <20260911221444.1523311-3-ynorov@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260911221444.1523311-1-ynorov@nvidia.com>
References: <20260911221444.1523311-1-ynorov@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DEFINE_IDA() uses IDA_INIT(), which initializes the embedded XArray lock
with a static spinlock initializer. For an automatic local IDA, lockdep
cannot use the lock address as a persistent class key and reports
"INFO: trying to register non-static key" before disabling itself.

Apply ASSERT_STATIC_STORAGE() to DEFINE_IDA() so that this misuse is
rejected at compile time. For example:

  void example(void)
  {
          DEFINE_IDA(ida);
          ida_destroy(&ida);
  }

GCC reports:

  error: initializer element is not constant
    name##_storage_check = &(name)
                           ^
  note: in expansion of macro 'ASSERT_STATIC_STORAGE'
    ASSERT_STATIC_STORAGE(name)
  note: in expansion of macro 'DEFINE_IDA'
    DEFINE_IDA(ida);

File-scope definitions and static DEFINE_IDA() within a function remain
valid. Automatic local IDAs must instead be initialized with ida_init().
Direct uses of IDA_INIT() are not covered by this declaration check.

Convert the five automatic local IDAs in the userspace radix-tree tests
to ida_init() so they satisfy the new requirement.

Validated file-scope and static local definitions with a kernel object
build, and confirmed that an automatic local definition fails to compile.

Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 include/linux/idr.h                 |  5 ++++-
 tools/testing/radix-tree/idr-test.c | 20 +++++++++++++++-----
 2 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/include/linux/idr.h b/include/linux/idr.h
index 789e23e67444..e2a4b6298511 100644
--- a/include/linux/idr.h
+++ b/include/linux/idr.h
@@ -16,6 +16,7 @@
 #include <linux/gfp.h>
 #include <linux/percpu.h>
 #include <linux/cleanup.h>
+#include <linux/compiler.h>
 
 struct idr {
 	struct radix_tree_root	idr_rt;
@@ -269,7 +270,9 @@ struct ida {
 #define IDA_INIT(name)	{						\
 	.xa = XARRAY_INIT(name, IDA_INIT_FLAGS)				\
 }
-#define DEFINE_IDA(name)	struct ida name = IDA_INIT(name)
+#define DEFINE_IDA(name)							\
+	struct ida name = IDA_INIT(name);					\
+	ASSERT_STATIC_STORAGE(name)
 
 int ida_alloc_range(struct ida *, unsigned int min, unsigned int max, gfp_t);
 void ida_free(struct ida *, unsigned int id);
diff --git a/tools/testing/radix-tree/idr-test.c b/tools/testing/radix-tree/idr-test.c
index 945144e98507..6fcba5b5870b 100644
--- a/tools/testing/radix-tree/idr-test.c
+++ b/tools/testing/radix-tree/idr-test.c
@@ -460,9 +460,11 @@ void ida_dump(struct ida *);
  */
 void ida_check_nomem(void)
 {
-	DEFINE_IDA(ida);
+	struct ida ida;
 	int id;
 
+	ida_init(&ida);
+
 	id = ida_alloc_min(&ida, 256, GFP_NOWAIT);
 	IDA_BUG_ON(&ida, id != -ENOMEM);
 	id = ida_alloc_min(&ida, 1UL << 30, GFP_NOWAIT);
@@ -475,9 +477,11 @@ void ida_check_nomem(void)
  */
 void ida_check_conv_user(void)
 {
-	DEFINE_IDA(ida);
+	struct ida ida;
 	unsigned long i;
 
+	ida_init(&ida);
+
 	for (i = 0; i < 1000000; i++) {
 		int id = ida_alloc(&ida, GFP_NOWAIT);
 		if (id == -ENOMEM) {
@@ -496,11 +500,13 @@ void ida_check_conv_user(void)
 
 void ida_check_random(void)
 {
-	DEFINE_IDA(ida);
+	struct ida ida;
 	DECLARE_BITMAP(bitmap, 2048);
 	unsigned int i;
 	time_t s = time(NULL);
 
+	ida_init(&ida);
+
  repeat:
 	memset(bitmap, 0, sizeof(bitmap));
 	for (i = 0; i < 100000; i++) {
@@ -522,9 +528,11 @@ void ida_check_random(void)
 
 void ida_alloc_free_test(void)
 {
-	DEFINE_IDA(ida);
+	struct ida ida;
 	unsigned long i;
 
+	ida_init(&ida);
+
 	for (i = 0; i < 10000; i++)
 		assert(ida_alloc_max(&ida, 20000, GFP_KERNEL) == i);
 	assert(ida_alloc_range(&ida, 5, 30, GFP_KERNEL) < 0);
@@ -576,10 +584,12 @@ static void *ida_leak_fn(void *arg)
 
 void ida_thread_tests(void)
 {
-	DEFINE_IDA(ida);
+	struct ida ida;
 	pthread_t threads[20];
 	int i;
 
+	ida_init(&ida);
+
 	for (i = 0; i < ARRAY_SIZE(threads); i++)
 		if (pthread_create(&threads[i], NULL, ida_random_fn, NULL)) {
 			perror("creating ida thread");
-- 
2.53.0

