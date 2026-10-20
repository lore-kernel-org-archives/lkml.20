Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501226;
	b=bHkN3FlcigsjscInutaQiJ2tGKaFYxPHEuz1i0RYhoAnVh6mVbMiw6GtnpBTxMJog/UN
	 JKU1p5ULzGcHL6ivSimkKEDCzVa0m1nk7bnCYmz3kZL8n+YFCANaNEU+a+zmX1Jeue7++
	 1shGhIYG+/Kx95MNviBk1xYY0mZJOtu264eyJZqBu+qBrYmJzkM7hvXelVEyS2KnD8HFA
	 yfBI9ueOVfmh6Oqzzvu9NsdKPM0vFQzg+IC/4YqgFgKdj3ynyYXYs3D3ZMDvrvIP/9WXk
	 e1Ez+6ZSvbsVgSB4wPiVRUYXl2PJjsjqyInu6iHCLgjpYl8Sty4iZoIbHTeXAecfiig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501226;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=qy10MCNTYPGcfzZL52ZybsUTyOOK881ej/NFqUmLnqQ=;
	b=okTyUAqRGcw1Pa5aQ9UyI0vkl3zvy7QinxshQaz88MZhWdz1s6wE57IYzR1RvcrycjGa
	 hHV6xTL+XRKQkUy8BACbvuYeUdilTr/fb6iCFVEsyavCq0AYtLngvpbBABlY/7OFCnogq
	 3XXw6+YMtIuuYfUurGD1kae6m461Ff5I8dUsbQSv+NGom5Kp0LmhVogWsDV27xKcGHnNJ
	 Ij25ukrCuhEWAkyBtd1M4ja4/YSNugl3TyAYPYAlTwPVtJ2mz+Nbwt0oOJVrtA5zTuNv9
	 N4ijD0rkb4MefNlGAh2QY46HGC/gdX2ZLoUAqOvkm1lDRdHdqLlX2Lu+p6oJmVOq4zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iauC1ZCt;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A787E60A3826
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:00:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A787E60A3826
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iauC1ZCt
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e00eee27dso1882094f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792501224; x=1793106024; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qy10MCNTYPGcfzZL52ZybsUTyOOK881ej/NFqUmLnqQ=;
        b=iauC1ZCtLJ+tB69Zq2X1S9F86cMkdFrRLjxyu/MVuWh2pK1bFBPny4DbJAZbwK5LKm
         b6shBEADPtKYVwAnKkJHpzEpxXYOAX0SLwAnHd2OH/WRq71IK898NV7MUbyoJ0i18lHU
         UolN29yCITahO0d/ipVDB9IoLqD1fFtqvtWewBJQ5/nunil8kDZRbUSkOowryvluPPho
         IYPmqnouL3YrpC98LaCw+TCsoMbNle+CzsRSW5lVhRDMHk5HqTxQZFAs+k7o9xdIzN6s
         lFivEbzR1J0yG4fUUfEGNqqsfNaIsEetXevT3LY5O0tsfczQUe+g5bAWpXv7fpAxqmFN
         yVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501224; x=1793106024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qy10MCNTYPGcfzZL52ZybsUTyOOK881ej/NFqUmLnqQ=;
        b=Cbz0P02lkdPHTmKvu/cn3jnxdb0TbwznjIR8Ddwq1V+jZBW498cXRPk/iITC6+PylB
         upVgVtitfdHi/KbUueCT/8udr2nZHvU7hUhW8u6UtpoSTASwypBMprJeSSTjA06zv6tv
         ml2g6ckRrNb8gvlu3ygkjF15/8TQe+51Epp5A4SoFW9yseKAGzcKQJrlSZGvi9oxdHdt
         6hHsrsS3ol+NqEJPBVuRaZ48qwiWl1QmjVvPWOkaoRK1d4MC/ZRXY3P6nA4eki/AnHJn
         CItcygxVXaPzsojYzyuyAHwQP/Ox9AFVlUx74+p/pBgbp8Xpn5+1DfpK/ZnCxQo0d4zW
         QJBg==
X-Forwarded-Encrypted: i=1; AKwUvBweDlN9XzykjqepaPkX2SQFXy0Vrs4UU9bl+2muKnYbVoRAJyMcxIsPXfnNXDtJNyfgGfJIFZTirofXCh0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMDgH6weTUScW3ueNJySF4qcGKAUTBsC2uZv93c8sfx5UY/TIj
	QCmAeTMeNpFKliBOKkows8CBPtUg54pm/CFc9VCkDBLB8CgPGlbKqePQ
X-Gm-Gg: AYBFou28oi0GBX2RQKU+Cwbi0lDvx5TW30c4yPlcpLDguOlqXUQf2DR2Vxyi+/qvicM
	4VO/zMguXwjaXIN7JgvIrpWC3xZ7swuzqCP8FfXuSN2biwfMNW/lQ9KTMlhb9fIlV3ICh+Cbdw7
	HJAwj9+2YH3dVQPkwUpmr/RXm7v+JLDZ3/ZLktCsgLhsmjS+s4xgyxaLyA8xUszs4PWQYC8bcWe
	OQ7aVcL+gjZ4hdM4fHND5FfRHo3KZtABCIcYBXVr1WZf9Z2LkpYOCfiQ9WpKH1yMmu4Tdaa5rFl
	f+epwulZ7iDShN4ZBdrU9CTyXk+h3WIQFXlIbpjoQ2ZgtmaH8zRGYE5KbBnzayxzfYYv7RLDRXm
	WwO/8wVoDTHfj1Cbjj4VIEOUB5NWSvZJLrAqmAtP3BShX/IWNcaaL5U5cmJVa0VcsQEtBa44CNJ
	QGHeXFllADRQXTM1tjX2OHAwwxKw9uHc8AFhtk1vcXnaClgqbWscf2oysFQxfTttWsBowX9Bti0
	7Imly4kCs+fpOqSxCHIHuSovi+oUf/VUb/MCy/YDojmr3i7neSuKmoYJy/O0sx0UeyKH9mIzZs=
X-Received: by 2002:adf:e34e:0:b0:48d:b8a1:53c5 with SMTP id ffacd0b85a97d-48e07fc0ab6mr16744823f8f.56.1792501223683;
        Tue, 20 Oct 2026 06:00:23 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d830e91sm6114754f8f.54.2026.10.20.06.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:00:23 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Tue, 20 Oct 2026 15:00:15 +0200
Subject: [PATCH v3 4/8] of: unittest: Test fw_devlink with GPIO nexus maps
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
Message-Id: <20261020-fw-devlink-nexus-ready-v3-4-fd6f1c17e16d@toradex.com>
References: <20261020-fw-devlink-nexus-ready-v3-0-fd6f1c17e16d@toradex.com>
In-Reply-To: <20261020-fw-devlink-nexus-ready-v3-0-fd6f1c17e16d@toradex.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>, 
 Frank Li <Frank.li@oss.nxp.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Leonardo Costa <leonardo.costa@toradex.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Add OF unit tests that call the fw_devlink add_links operation for GPIOs
routed through nexus maps. Verify that each mapped consumer has exactly
one link to the final GPIO provider rather than to the nexus.

Also cover direct references and all GPIO property spellings recognized
by fw_devlink, including the deprecated singular and unprefixed forms.

The gpio-map routes its entries to different providers so that selecting
the wrong entry is caught as well.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
v3: Route gpio-map entries to two providers, use a middle entry (Herve)
v2: https://lore.kernel.org/r/20260910-fw-devlink-nexus-ready-v2-3-17ac82dbe226@toradex.com
---
 drivers/of/unittest-data/tests-phandle.dtsi | 39 +++++++++++++++
 drivers/of/unittest.c                       | 75 +++++++++++++++++++++++++++++
 2 files changed, 114 insertions(+)

diff --git a/drivers/of/unittest-data/tests-phandle.dtsi b/drivers/of/unittest-data/tests-phandle.dtsi
index 554a996b2ef1..f5d7ee072c90 100644
--- a/drivers/of/unittest-data/tests-phandle.dtsi
+++ b/drivers/of/unittest-data/tests-phandle.dtsi
@@ -79,6 +79,45 @@ consumer-b {
 				phandle-list-bad-args = <&provider2 1 0>,
 							<&provider4 0>;
 			};
+
+			fw-devlink-tests {
+				gpio_provider_a: gpio-controller-a {
+					#gpio-cells = <2>;
+				};
+
+				gpio_provider_b: gpio-controller-b {
+					#gpio-cells = <2>;
+				};
+
+				fwdevlink_nexus: nexus {
+					#gpio-cells = <2>;
+					gpio-map = <1 0 &gpio_provider_a 3 0>,
+						   <2 0 &gpio_provider_b 5 0>,
+						   <3 0 &gpio_provider_a 7 0>;
+					gpio-map-mask = <0xffffffff 0>;
+					gpio-map-pass-thru = <0 0xffffffff>;
+				};
+
+				gpio-compat-consumer {
+					gpios = <&fwdevlink_nexus 2 1>;
+				};
+
+				gpio-compat-singular-consumer {
+					gpio = <&fwdevlink_nexus 2 1>;
+				};
+
+				gpio-consumer {
+					test-gpios = <&fwdevlink_nexus 2 1>;
+				};
+
+				gpio-direct-consumer {
+					test-gpios = <&gpio_provider_a 1 0>;
+				};
+
+				gpio-singular-consumer {
+					test-gpio = <&fwdevlink_nexus 2 1>;
+				};
+			};
 		};
 	};
 };
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index e255f54f4d76..f15c110dbf4d 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -10,6 +10,7 @@
 #include <linux/dma-direct.h> /* to test phys_to_dma/dma_to_phys */
 #include <linux/err.h>
 #include <linux/errno.h>
+#include <linux/fwnode.h>
 #include <linux/hashtable.h>
 #include <linux/libfdt.h>
 #include <linux/of.h>
@@ -710,6 +711,79 @@ static void __init of_unittest_parse_phandle_with_args_map(void)
 	}
 }
 
+static void __init of_unittest_fw_devlink_supplier(struct device_node *tests,
+						   const char *consumer_name,
+						   const char *supplier_name)
+{
+	struct device_node *consumer, *supplier;
+	struct fwnode_handle *consumer_fwnode;
+	struct fwnode_link *link;
+	unsigned int link_count = 0;
+	bool found = false;
+	int rc;
+
+	consumer = of_get_child_by_name(tests, consumer_name);
+	supplier = of_get_child_by_name(tests, supplier_name);
+	if (unittest(consumer && supplier, "missing consumer %s or supplier %s\n",
+		     consumer_name, supplier_name))
+		goto put_nodes;
+
+	consumer_fwnode = of_fwnode_handle(consumer);
+	fwnode_links_purge(consumer_fwnode);
+	rc = fwnode_call_int_op(consumer_fwnode, add_links);
+	if (rc == -EOPNOTSUPP) {
+		pr_info_once("fw_devlink tests skipped: OF supplier links are not supported\n");
+		goto purge_links;
+	}
+	if (unittest(!rc, "failed to add links for %pOF: %d\n", consumer, rc))
+		goto purge_links;
+
+	/*
+	 * The suppliers list should normally be accessed with fwnode_link_lock
+	 * held, but that lock is private to the driver core. These test nodes
+	 * are isolated and have no concurrent link updates.
+	 */
+	list_for_each_entry(link, &consumer_fwnode->suppliers, c_hook) {
+		link_count++;
+		if (link->supplier == of_fwnode_handle(supplier))
+			found = true;
+	}
+
+	unittest(link_count == 1, "%pOF has %u suppliers, expected 1\n", consumer, link_count);
+	unittest(found, "%pOF is not linked to supplier %pOF\n", consumer, supplier);
+
+purge_links:
+	fwnode_links_purge(consumer_fwnode);
+put_nodes:
+	of_node_put(consumer);
+	of_node_put(supplier);
+}
+
+static void __init of_unittest_fw_devlink(void)
+{
+	static const struct {
+		const char *consumer;
+		const char *supplier;
+	} cases[] = {
+		{ "gpio-compat-consumer", "gpio-controller-b" },
+		{ "gpio-compat-singular-consumer", "gpio-controller-b" },
+		{ "gpio-consumer", "gpio-controller-b" },
+		{ "gpio-direct-consumer", "gpio-controller-a" },
+		{ "gpio-singular-consumer", "gpio-controller-b" },
+	};
+	struct device_node *tests;
+	int i;
+
+	tests = of_find_node_by_path("/testcase-data/phandle-tests/fw-devlink-tests");
+	if (unittest(tests, "missing fw_devlink test data\n"))
+		return;
+
+	for (i = 0; i < ARRAY_SIZE(cases); i++)
+		of_unittest_fw_devlink_supplier(tests, cases[i].consumer, cases[i].supplier);
+
+	of_node_put(tests);
+}
+
 static void __init of_unittest_property_string(void)
 {
 	const char *strings[4];
@@ -4533,6 +4607,7 @@ static int __init of_unittest(void)
 	of_unittest_dynamic();
 	of_unittest_parse_phandle_with_args();
 	of_unittest_parse_phandle_with_args_map();
+	of_unittest_fw_devlink();
 	of_unittest_printf();
 	of_unittest_property_string();
 	of_unittest_property_copy();

-- 
2.43.0

