Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F333AFCE9
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 01:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788226180; cv=none; b=QlEfq1t/TVOff4wRADlvmaGQL1d+WPTDzDY+oCPxwGD+88Jp2/CQ/N1SvicHTI9YMz1Iempj3UZk0AtuU/OOpi6v92WI76V5wbp129TI4eARiRuY99QDnBGLvlEcURaW55L4Ud20Np4ALLp6j4VcJC75cIZp0QnaK/Ks3EzKgMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788226180; c=relaxed/simple;
	bh=rtMHX9hWMpcieCzh+lEL0bv+hah6KKo01VRR5TnIRxg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dqPHA8r7Lvc35m0oR0bkgl/4BaH1Gs1zGR9565Uqz4Wg3pthiYJPhTGMRKKjAM8N6NGeqhXW3r6EOl/X70xmOmiuUTz1he70ueJImUzRRFkFNrt80PHhoixpwOWzqih8IEBHjUo85tFxV2ntNg3m17NNPgU0WktDhjy8tSUrJgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=kYb5xAwN; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="kYb5xAwN"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d560775ca2so30154665ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1788226176; x=1788830976; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OBfNFbSVh1FYGWwWZzjs3Er9OcgI7SYTXtrFRcmH5Do=;
        b=kYb5xAwNwhiWSNbH6RfuzP1WB82NHbnhZvRiWJrSfq9wRdg9XH7d9atueRuZtUCtc7
         xLnZI5/AVQ10F6gRIXC8S4GlE0/tnBrem4ji5+0Ho/wv9YJOZqwJLiqU4C7uEGuLd6eE
         JjDrR/kspf/97DGsgDYF4PnSrxVHmxVHA8wp0zh6vDykoBAZN93KcAjwsUbxa5NZJxZO
         3Fim8kP5WxoxfHOZyW8IoqmsfHez8hXiNuQkf16463Yl1D4QCve607DqZu/uBJgyKx5J
         XMfK+hEG5qAzr9p/eWYcLwiowb4fInhedQXmPjolsNaE77FuK293cdpm8n9VJZ3pBA4V
         L7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788226176; x=1788830976;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OBfNFbSVh1FYGWwWZzjs3Er9OcgI7SYTXtrFRcmH5Do=;
        b=I8EWRE0cI0eu90SaKnOH7XzMct8XWkoS2XIGDWqMcbOXU497ZI11U4AV9U6+KFkfj5
         sLQTgMgBLwFvxTCecF5+GVhmEQnAN2pJaBP81crL1Tm8M044XWm8FTY+cnNvUiaFShKi
         qDNJ3oB1qqO7boqLLuccUCn7VP5or+YFPXRKFR600oPCnRB0cZ6g2RK4VLJegLefjc7P
         VPBOY8u7xIvybFhgLs0AG52JXNhDKuRLRBug7ToyyaUmw+OGSQW0jl3tybd6jecwQ9Tm
         ubihcirVULTVIUCuZ75VX3ulRaOTNOf2G3PbXa0ujMlcu1MlgD2qeTo65MptpQ4fvnmw
         xPqw==
X-Forwarded-Encrypted: i=1; AKwUvBwjkw/cshgtu07OEBCaSjyiXEpeCXSdAyHgaI/JDiP/lnqSIwoo++iMvhS0weO7LjlVeA8vA8UmGMiWaBQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mvD1TemmBio/fsp5OCZC9RHBt5vRmH28HyEPxp00GHYFP0khYk
	o3wHzRhKfvhtKibQL1+6fu+4ZXajo2Z+5g9ySbxnAWbYRxBC7U/JK6Pd+fa/D3FYZN0=
X-Gm-Gg: AYBFou2+zp5AWRcLJdcsGyFDJNbBsMj/aZMfIRLkHL1QBiHj3uG8pA6sclMb1pF/6kr
	U0M3pxNs/IHBpifRGWsuUssXFLfk2ACK2hMkRbaSwZ1naPUnSI1wpuJrlWq8wcCl6libQgDpq3r
	3EMV+zvFXHxA7xy6fM0zZqmZZvvN9IEN8a+JhP/v6xtclpKZSeExW7neEfXS0S8RsodaJCrKjHn
	epzwb+vxhTqSAi2Jvt/QFihFKNDepoYf2c89sVBOsLuE+zJGestWgfKCT8N0QCo2W86uhYAopf6
	YWnm6WUzz7aJ19Hp8E6RVP7jIP4Ur2a3dCrOssTbH8BbMzvZI2UvJgsimfs++jsy80aG2UIOGcr
	4Xqt9dED9EkNpbkbaI/HzUDMYH3CRv1VBGOIgiTdHFN0bRu9XJ3Jv+gUmNbfEYfcocUCbfpbraQ
	7EQLS97/BkgFptg2ZD82+OqF8p7Cch1OMnFngsNB07GjSki0URNSOyugtC29BFHC0=
X-Received: by 2002:a17:90b:538e:b0:398:e436:384 with SMTP id 98e67ed59e1d1-398e436066bmr15420705a91.1.1788226176534;
        Mon, 31 Aug 2026 18:29:36 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b5bef7683sm19390817eec.12.2026.08.31.18.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 18:29:36 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Mon, 31 Aug 2026 18:29:28 -0700
Subject: [PATCH v7 10/10] of: unittest: cover /aliases updates from overlay
 apply/revert
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-nh-of-alias-overlay-v7-10-02754604805a@nexthop.ai>
References: <20260831-nh-of-alias-overlay-v7-0-02754604805a@nexthop.ai>
In-Reply-To: <20260831-nh-of-alias-overlay-v7-0-02754604805a@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Frank Rowand <frowand.list@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Shawn Guo <shawnguo@kernel.org>, 
 Grant Likely <grant.likely@secretlab.ca>, 
 Grant Likely <grant.likely@linaro.org>, 
 Pantelis Antoniou <pantelis.antoniou@konsulko.com>, 
 David Daney <david.daney@cavium.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788226164; l=6079;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=rtMHX9hWMpcieCzh+lEL0bv+hah6KKo01VRR5TnIRxg=;
 b=1ks1iRYQYcQtQ1N6ZJWYSjrYQAUhUHbg276RixnPKvUgh+nbWCdPj7jPYkzMYMVpZ1S/O1na3
 Vz+nrvcgLTeCJiwT9Re7r0Sq93Do7kzjil2FU+msI5bnZ2zQR33puwL
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

Assisted-by: Claude:claude-fable-5 [Claude Code]
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

