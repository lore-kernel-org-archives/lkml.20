Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D39E4E13FD
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 19:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790365525; cv=none; b=jbm4wLlpU7qYc3Hk4PQ+7+dOulVMiPP3LJRniNNfbPI2Xlh8LrQAajo9ZkTsSIar0kMQEzEnfWDOYZXuLoBo9pkMsiBOJBxIbrOpod7A+VMBhW+Y+JGKhipvYn79HJJSgJgIyAZ06w1hwB/Hik4M6TkzG3seEPVApaH63lb/oVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790365525; c=relaxed/simple;
	bh=DqTT+AgNC8GkL2FYVXCwLzqAXTrl0cGMSGWREvIxuOI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YXGHNyfMzNMPW4npLPTAaHHq1r0qRmWO6FwJTZqQF106e6rikIvNbro1oIKWlvwgdgPymVNtoM2XPg4io5cT68D45WY7jAdaouZy5DRUv/5+qHdpQBUp121p1NKmZ76Opq/xE6VmhJ82mOi8h6eSQyebQ4eFlXB7c7y6Nz9j4ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hJCiSmeR; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hJCiSmeR"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c294ad260fdso194111366b.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790365522; x=1790970322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VZ0Ynd0dcBFAAuLycdGPDDj0ISpvrRpLcRrTrN/I9bc=;
        b=hJCiSmeRKMKnELDMhYNo84BNeBjYUjN2NeHVVzrgvz7kKn3WHTF3vyBsQ5uFJBkdMt
         irYVYCOSj9pkk52Y2ZznutZlXcmJLQ6xTC5LlRKJpSEJXE0xYSxKuHbZWwVZT5tTMBky
         Zusx2SB9tXBlZiBNQmK8bV9uKORoEZvxw1tOoa/V52XX5gKaquFHqlfLVl3YJGUKlIvW
         Esm5m5Ph8T8RwZUX7u39o/BTcOPTrqSvstHmTMmHICid91BdZB9mS+DAylfHVxdJRYKO
         vM6+hBaovH5/CzDQCRDZCfIQerL2TLQRagquHSSMxEs9P7waG1Yli91xl8r0jNwDji1j
         tT3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790365522; x=1790970322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VZ0Ynd0dcBFAAuLycdGPDDj0ISpvrRpLcRrTrN/I9bc=;
        b=c+fS9X9nmuqz3U6TKKQFmATl+fOdNpE1OuroIRgQD1z3Sf5MyBs6M3jyvEKGLnh2r8
         WdD8Po/LZBtJPLFc+4wioGuCmH9nRU8ppZCBuxO8hYesfr6xVmEqn+QylEWa9JOM4lkg
         /E/pr+XO+iwo+F+IHExYfaiPlt7oMntdyDZXaS+jr5Hhj8I9ujr7FNoT5vM9VQFYPZ1w
         rR5WF95g98aKJYI5mTPKDh3NdWts6XqSYlPuxLtH5W0pppJAZ8ZSlg2N/yWgWVVf8RUG
         DBbVjbklkU9B0w7H2ZzXj5QG4bvbXL9aiblFPyV07I4rk/UQFm3QcDuiGjAweItFNL7X
         DqTQ==
X-Forwarded-Encrypted: i=1; AKwUvBwP5Dw2NDoSpoPXvlqkhdH4YzJy+PK7xYmU8NJpJ1l8kvu4Rabf0pSJrrLKOp/KLWfTc8+Wzy+5MF+ZJ7M=@vger.kernel.org
X-Gm-Message-State: AFuF++lTgALau6HoCmP2ML9Q5rnY6MRUSPmgX0N/6giCFs52aINDNsJc
	+8o2uPNUHcloGnoYtmb1Slu0KVz3Tp716B2pgpFN6RusA7y27TA+DHo=
X-Gm-Gg: AYBFou3M97O9rvn0C3Lm22N80o2xVYNeRVPLn2AQFmVGC6OvhqexYx5sXHAhTigH/ke
	+Jd5DTyqTgZpb2HjQCew8Y13jg3UtJNtEqyoABUbeGyNHP48nHGKKuheSemF1UCLdfCs2B+id7o
	mVuYEdjPpIULxlHfkk9+nY0Q9v/v1NFv5/OrXHVRYenSZPC/YyT+L1azqbQKbo7PVo70mgVWyGA
	GTcQgR9j1zjR0ME+LhfOWgzRlQndXANuLxlzRJclndpyC7gwqBhXZurwo4VDse0jophGflLby3/
	muC5lX0PYXBjp4zN1kF1w+LZDkmXL4zt5xAM55aO18DvH75tQDsDLuYkPfRX1SIEqShYh/NaLCg
	XY2HZMRLq+e1bk1g9k+CCLNypJ1uM7+Vm6/9oUZmcGMWK7UTh6JI3Lw99BxCX0zSbdh1K7MODa5
	jgmiIHkhnTeQRTetRMQOZstaBK7ekOe8iX7O4krh3LgGhmvi+wu6YM8D/jb4ySHZ1j0HT7jb2dJ
	THKDyA=
X-Received: by 2002:a17:907:daa:b0:c25:f7dc:2d9 with SMTP id a640c23a62f3a-c2ac23815a1mr612064266b.26.1790365521464;
        Fri, 25 Sep 2026 12:45:21 -0700 (PDT)
Received: from okuroshi-laptop ([185.229.191.71])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae782a2d2sm162896766b.61.2026.09.25.12.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:45:21 -0700 (PDT)
From: Artem Maksimov <okuroshioffc@gmail.com>
To: Jorge Lopez <jorge.lopez2@hp.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Artem Maksimov <okuroshioffc@gmail.com>
Subject: [PATCH] platform/x86: hp-bioscfg: Support allocation bios vars
Date: Fri, 25 Sep 2026 22:44:54 +0300
Message-ID: <20260925194454.6850-1-okuroshioffc@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On HP systems with a large number of BIOS
attribute instances, the kzalloc_objs()
allocation in hp_alloc_ordered_list_data() and
hp_alloc_string_data() can fail when physical
memory is fragmented, leaving the driver
unable to register those attributes.

The same failure mode was already fixed for enumeration_data in
hp_alloc_enumeration_data() by commit 916727cfdb72 ("platform/x86:
hp-bioscfg: Support allocations of larger data"), reported on HP
Z2 Tower G9 and Z4 G5 Workstation systems:

  https://bugs.debian.org/1127612

order-list-attributes.c and string-attributes.c use
the identical allocation pattern and are still affected.
Apply the same fix: fall back to kvzalloc_objs()/kvfree()
instead of kzalloc_objs()/kfree(), and return -EINVAL
early when the instance count is zero.

Link: https://bugs.debian.org/1127612
Signed-off-by: Artem Maksimov <okuroshioffc@gmail.com>
---
 .../x86/hp/hp-bioscfg/order-list-attributes.c         | 11 ++++++++---
 .../platform/x86/hp/hp-bioscfg/string-attributes.c    | 11 ++++++++---
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c
index 5bf8d40bdf81..80ac15435a18 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c
@@ -98,8 +98,13 @@ int hp_alloc_ordered_list_data(void)
 {
 	bioscfg_drv.ordered_list_instances_count =
 		hp_get_instance_count(HP_WMI_BIOS_ORDERED_LIST_GUID);
-	bioscfg_drv.ordered_list_data = kzalloc_objs(*bioscfg_drv.ordered_list_data,
-						     bioscfg_drv.ordered_list_instances_count);
+
+	if (!bioscfg_drv.ordered_list_instances_count)
+		return -EINVAL;
+	bioscfg_drv.ordered_list_data =
+			kvzalloc_objs(*bioscfg_drv.ordered_list_data,
+						bioscfg_drv.ordered_list_instances_count);
+
 	if (!bioscfg_drv.ordered_list_data) {
 		bioscfg_drv.ordered_list_instances_count = 0;
 		return -ENOMEM;
@@ -438,6 +443,6 @@ void hp_exit_ordered_list_attributes(void)
 	}
 	bioscfg_drv.ordered_list_instances_count = 0;
 
-	kfree(bioscfg_drv.ordered_list_data);
+	kvfree(bioscfg_drv.ordered_list_data);
 	bioscfg_drv.ordered_list_data = NULL;
 }
diff --git a/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
index f3dfba270f7e..095201004d87 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
@@ -101,8 +101,13 @@ static const struct attribute_group string_attr_group = {
 int hp_alloc_string_data(void)
 {
 	bioscfg_drv.string_instances_count = hp_get_instance_count(HP_WMI_BIOS_STRING_GUID);
-	bioscfg_drv.string_data = kzalloc_objs(*bioscfg_drv.string_data,
-					       bioscfg_drv.string_instances_count);
+
+	if (!bioscfg_drv.string_instances_count)
+		return -EINVAL;
+	bioscfg_drv.string_data =
+			kvzalloc_objs(*bioscfg_drv.string_data,
+					bioscfg_drv.string_instances_count);
+
 	if (!bioscfg_drv.string_data) {
 		bioscfg_drv.string_instances_count = 0;
 		return -ENOMEM;
@@ -390,6 +395,6 @@ void hp_exit_string_attributes(void)
 	}
 	bioscfg_drv.string_instances_count = 0;
 
-	kfree(bioscfg_drv.string_data);
+	kvfree(bioscfg_drv.string_data);
 	bioscfg_drv.string_data = NULL;
 }
-- 
2.53.0

