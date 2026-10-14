Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7063B4E4323
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792019869; cv=none; b=m/2n4Fl3gSXReufvA1oiofCosNmzcv+dPHuZK2l9kZSg+NhsJwBnmSU8urTrJ1ncjrafgBkuRQ2neqvJVklsQBnw6E+tDD7wKUmGzK4R4JgXIIOPh3vrRRMkL4OasxH7l3hYeXL9WflqxdWS2kXbIT1IodsyiLu9oVBf/MVqc0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792019869; c=relaxed/simple;
	bh=vO1oV8bwHSlX0sH4gGWcdp/dFwfkrZ/9K0rxzsPh390=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QyRUONyirLT9RFHFvqiDSRNRjFHkLWekMDm9EPZak4YwqC+lBGjAetUU0iSvVowyKlKZBqMOjZL586DYbblt0vFV/ZjXRMiGt023623ST5Ko2NMTKq9YyoJj+tRg+ufXhqeKP+jaPI95wkMWjfE6alLvBaRdJdyVHvyiXhGj9XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=NpCRQoRa; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="NpCRQoRa"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-30b6dad2382so10844424eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792019861; x=1792624661; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j6C8jGqFinDpuPjyzpS5QwSEVjMYW1BhAN63U/eJnyk=;
        b=NpCRQoRasKFZvwKvpW0aKW6m/lvRoFBO2/N5pssvEJZLla3/AVgvqiDPZJrR09x2Z3
         yjrkl5t3HzZHZuH2//Clj2zoZCJQIGWpLpZhVTZy5mDPlW8OB8MQRWJUm1LJS5Jra2gE
         S4coXQi0QTM4uH068PBHO1tBrXpp2PSas9Q+XBVrULPg4X+GMGiDFWxaYc1a2vrvkJnr
         UGPKJ09jzSR0iRJShm6EfX0bB3JWCKqIs7yWizcyaAC8ncVfNPdYQVoCdjD+aB4NBa3c
         OkCNh9y7Lo7zMdMzTJogV+5RIra5i0OPcjWq7AWkjClcjs5rVrBFvDvMpmlK9w/pdW0O
         QtMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792019861; x=1792624661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j6C8jGqFinDpuPjyzpS5QwSEVjMYW1BhAN63U/eJnyk=;
        b=FeMTeUq9VsqnhYPbajAt1wRcwybZSFxekNkc3skmrqW7m/UC4h5dqHMHnJVmR1DAzH
         qngpl2UJ2E89RdAJ78NzMVkQh1hT1r0prLmQhXBNs++sZdglZpHvIiFiB2xcm0p+ExIq
         PGRZBDH4yG+zOEyG1Sk6q3Ysk9B9EV9IkOs4lJ1TjNhN7ai11bkmbae0KWqoNSltmXN4
         YrJnr9rtLmMJCcDQk4KqDAvgosJENRGuJpVsvI8DxdMKJKQJwu2iUW9mAeBCI6pojCJQ
         4pMJOvLst84C8R6zi7CTdJ4SeWPT+jIU6njWNKqMxCj2/lei8ClDjmPhe9DWmWgMA/ht
         9i1A==
X-Forwarded-Encrypted: i=1; AKwUvBxd081mv1DMYORAdtrITsa3SYoj6pZXi2ej/P/17Nvi+ygdKR4YdruNwKbi5Wl0zsVZq9HyWqoQH3/YsNI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLztf9XgVFzHtdB5AT3nWWQpjSm4SM2WY9DMLLGChVp8Y5yq0iN
	RX6w/A/y6u1oeuzThNi+ZNpCQr/6yGGAu/5r3TWQffniuBETiF+LLv+rZ4DRuadxV4o=
X-Gm-Gg: AYBFou3qx6BJotfLhngP4pHCQbx2ZN0blBg3yZJqmYZ9D5K8uAOUETqJQPRn0QQ4a9i
	/H59WB/aOCemsuetIeJ5nSFuhJJZt7IokvkdWgdtXDXhr12RsgwVd3sLtSID1+VnTVdns71A6OJ
	8Ox24mR2RqkrK91NBupvzVNDZk8mz6k+fXdujfOLcKNN0sM0N1mT8RGK9ja572yToGzbqjOmDEB
	/5Dmvv60sTAJ5vPEDDALjm+1LVRr1JJ7wPyHsog1VwNAi9qGKVewpu2gHIOGoIPPfz+svlsV9Ax
	OryAB2HL1LoZuzrLjW8Wz3Ynp5w2s5CMD12uutgXEAl9Sj1+A2ooLXCIsP57rD337SfiW7Q7kHl
	OlJzU1FTHV2EGn9LvQ723bA6YETy9+F570UiPNpn4ruPN6mzRke4EwUQ4Sk65TljDgUj79KlDld
	1CoojE/GPXHZP1neKHNcmTymVyasqYFEZQhWrIBsNnDjDZSGoI/8SaCzh9YcyZc1/Cffg7YMRGK
	A==
X-Received: by 2002:a05:7300:ae10:b0:35e:3727:5412 with SMTP id 5a478bee46e88-35e37275518mr2835980eec.9.1792019861246;
        Wed, 14 Oct 2026 16:17:41 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35de709d928sm10678679eec.25.2026.10.14.16.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 16:17:40 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Wed, 14 Oct 2026 16:17:31 -0700
Subject: [PATCH v8 6/6] of: unittest: cover /aliases updates from overlay
 apply/revert
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-nh-of-alias-overlay-v8-6-0f74f05ac762@nexthop.ai>
References: <20261014-nh-of-alias-overlay-v8-0-0f74f05ac762@nexthop.ai>
In-Reply-To: <20261014-nh-of-alias-overlay-v8-0-0f74f05ac762@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Frank Rowand <frowand.list@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Shawn Guo <shawnguo@kernel.org>, 
 Grant Likely <grant.likely@secretlab.ca>, 
 Grant Likely <grant.likely@linaro.org>, 
 Pantelis Antoniou <pantelis.antoniou@konsulko.com>, 
 David Daney <david.daney@cavium.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792019849; l=6029;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=vO1oV8bwHSlX0sH4gGWcdp/dFwfkrZ/9K0rxzsPh390=;
 b=KSfTWA8RN8kwkvxeYymegrm+s9/YF1TFnvLA36VUkdztJSJ+reL1vW7b3MYoFmFutTXMc+Fw+
 EiUeWQBct6FDuKmoPOQ7I7oX3uKfPHB+bonJEbhpT+5vV0o63F958Qx
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

Add overlay_alias.dtso and of_unittest_overlay_alias().

The overlay has two fragments: target-path="" grafts a labeled node
under the run-time target base, and target-path="/aliases" adds
`testcase-alias99 = &<label>` at the DT root. The runner applies it
with a non-NULL base via of_overlay_fdt_apply() (overlay_data_apply()
always passes NULL), asserts of_alias_get_id() on the grafted node
returns 99, reverts, and asserts of_alias_get_highest_id() reports
the stem gone. A precondition check runs before the apply.

This exercises the reconfig notifier, the absolute target-path
lookup, and the /aliases value rewrite together; any one missing
turns the get_id assertion into -ENODEV.

The grafted-node reference is dropped before of_overlay_remove():
overlay-created nodes must be back at refcount 1 when the changeset
is destroyed. The post-remove assertion uses of_alias_get_highest_id()
because it is keyed by stem and needs no node reference. The apply is
wrapped in EXPECT_BEGIN/END for the "memory leak will occur" warning
printed for properties added to nodes the overlay didn't create,
like the other overlay tests.

The overlay is not added to the fdtoverlay static build test:
fdtoverlay has no target-base concept, so the empty target-path
cannot be resolved statically.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/of/unittest-data/Makefile           |  5 ++
 drivers/of/unittest-data/overlay_alias.dtso | 25 ++++++++++
 drivers/of/unittest.c                       | 73 +++++++++++++++++++++++++++++
 3 files changed, 103 insertions(+)

diff --git a/drivers/of/unittest-data/Makefile b/drivers/of/unittest-data/Makefile
index 01a966e39f23..fdfec5a7923b 100644
--- a/drivers/of/unittest-data/Makefile
+++ b/drivers/of/unittest-data/Makefile
@@ -22,6 +22,7 @@ obj-$(CONFIG_OF_OVERLAY) += overlay.dtbo.o \
 			    overlay_18.dtbo.o \
 			    overlay_19.dtbo.o \
 			    overlay_20.dtbo.o \
+			    overlay_alias.dtbo.o \
 			    overlay_bad_add_dup_node.dtbo.o \
 			    overlay_bad_add_dup_prop.dtbo.o \
 			    overlay_bad_phandle.dtbo.o \
@@ -66,6 +67,10 @@ DTC_FLAGS_testcases += -Wno-interrupts_property \
 #			  overlay_bad_add_dup_prop.dtbo \
 #			  overlay_bad_phandle.dtbo \
 #			  overlay_bad_symbol.dtbo \
+#
+# overlay_alias.dtbo needs a run-time target base for its empty target-path;
+# fdtoverlay has no equivalent, so it is also not included:
+#			  overlay_alias.dtbo \
 
 apply_static_overlay_1 := overlay_0.dtbo \
 			  overlay_1.dtbo \
diff --git a/drivers/of/unittest-data/overlay_alias.dtso b/drivers/of/unittest-data/overlay_alias.dtso
new file mode 100644
index 000000000000..17e02d1940f6
--- /dev/null
+++ b/drivers/of/unittest-data/overlay_alias.dtso
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+/plugin/;
+
+/*
+ * overlay_alias - declare an /aliases entry that points, via label, at a
+ * node grafted under the run-time target base (empty target-path).
+ */
+
+/ {
+	fragment@0 {
+		target-path = "";
+		__overlay__ {
+			testcase_target: alias-target {
+			};
+		};
+	};
+
+	fragment@1 {
+		target-path = "/aliases";
+		__overlay__ {
+			testcase-alias99 = &testcase_target;
+		};
+	};
+};
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index e255f54f4d76..2f5e4056efae 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -3475,6 +3475,77 @@ static struct notifier_block of_nb = {
 	.notifier_call = of_notify,
 };
 
+/* created by cmd_wrap_S_dtbo in scripts/Makefile.dtbs */
+extern uint8_t __dtbo_overlay_alias_begin[];
+extern uint8_t __dtbo_overlay_alias_end[];
+
+static void __init of_unittest_overlay_alias(void)
+{
+	const char *base_path =
+		"/testcase-data/overlay-node/test-bus/test-unittest100";
+	const char *target_path =
+		"/testcase-data/overlay-node/test-bus/test-unittest100/alias-target";
+	u32 size = __dtbo_overlay_alias_end - __dtbo_overlay_alias_begin;
+	struct device_node *base, *target;
+	int ovcs_id = 0;
+	int id, ret;
+
+	base = of_find_node_by_path(base_path);
+	if (!base) {
+		unittest(0, "could not find alias target base %s\n", base_path);
+		return;
+	}
+
+	id = of_alias_get_highest_id("testcase-alias");
+	if (id != -ENODEV) {
+		unittest(0, "unexpected testcase-alias%d before overlay apply\n",
+			 id);
+		goto out_put_base;
+	}
+
+	EXPECT_BEGIN(KERN_INFO,
+		     "OF: overlay: WARNING: memory leak will occur if overlay removed, property: /aliases/testcase-alias99");
+
+	ret = of_overlay_fdt_apply(__dtbo_overlay_alias_begin, size,
+				   &ovcs_id, base);
+
+	EXPECT_END(KERN_INFO,
+		   "OF: overlay: WARNING: memory leak will occur if overlay removed, property: /aliases/testcase-alias99");
+
+	if (ret < 0) {
+		unittest(0, "overlay_alias apply failed, ret = %d\n", ret);
+		if (ovcs_id)
+			of_overlay_remove(&ovcs_id);
+		goto out_put_base;
+	}
+
+	target = of_find_node_by_path(target_path);
+	if (!target) {
+		unittest(0, "could not find grafted target %s\n", target_path);
+	} else {
+		id = of_alias_get_id(target, "testcase-alias");
+		unittest(id == 99,
+			 "of_alias_get_id() = %d after overlay apply, expected 99\n",
+			 id);
+		/* changeset destroy expects overlay nodes back at refcount 1 */
+		of_node_put(target);
+	}
+
+	ret = of_overlay_remove(&ovcs_id);
+	if (ret) {
+		unittest(0, "overlay_alias remove failed, ret = %d\n", ret);
+		goto out_put_base;
+	}
+
+	id = of_alias_get_highest_id("testcase-alias");
+	unittest(id == -ENODEV,
+		 "of_alias_get_highest_id() = %d after overlay remove, expected -ENODEV\n",
+		 id);
+
+out_put_base:
+	of_node_put(base);
+}
+
 static void __init of_unittest_overlay_notify(void)
 {
 	int ovcs_id;
@@ -3649,6 +3720,8 @@ static void __init of_unittest_overlay(void)
 
 	of_unittest_overlay_gpio();
 
+	of_unittest_overlay_alias();
+
 	of_unittest_remove_tracked_overlays();
 
 	of_unittest_overlay_notify();

-- 
2.54.0

