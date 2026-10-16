Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6623B14BC
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145376; cv=none; b=Ye04Wl3LOb/07tr10vTI10ZV6vk9PvaWIb7L4cB8UO231UZaWbDDJAnR4riJriyZnv3yamVS59P4V5dU+a8MhjcJo5fXTv+0A8kzWuIJU2UyfzPagaJy51eyGOp4qbHEJofSoqmb2BrmUez9U6T9TRfd8YB2vaWkAEhApUmHflw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145376; c=relaxed/simple;
	bh=Ur2mWENevbAqkMKf+HRRkyjbQkZyf/rnCbjk7Y7fVtE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tlq2dzPPRpzQYBtj6I8bthAyOUq/XRDAq9C/ZM6gy1+gVLFSfLz6Yz3KBIZfams2diGzXPOFmAQFnOXS4qQUujKdYpcXmkJ3KZZ6LrNAM/l/fAOIUwQoAknpjAi3WQlvtPTqv11ue2laRAWyIN4hRuXcvn/n7VwM/vMiz6V9Pao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=jsifkVYr; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="jsifkVYr"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a161d9b8c7so44244245e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792145372; x=1792750172; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/yeubclmkesk/1V3922jAnkkUkaI/ZuGA3yC0ETcQg8=;
        b=jsifkVYramCYci/chOBcf5ASOSQcuqHaNkcju0520vxF2IWTi+nU+a3XvvZPQsgjVL
         HUT5WttulueoiOTZB7dM8BhpplLM1frH4wWF7eZCcVK5xCnt8l6EnRSG4VdKHuzb7W+8
         LBi6DfVxarnUgYyI07nRz264bFq+AfdHQyfLZXPKXhpl/4q2a2BlE+beM8NA3T25EBVp
         1H8ywAvfmMMZOBupp5pyvJYbf3qpaGtWqoHUwPzE2SDIUACOAC16vScyO/FhxWe90FKp
         GX0OAl1qScTmJ+Vx5v3ImRw9ouSP6Vsj/Ntg2GABuTEGcHwRlYB6vFpJGkyJ5oYry65w
         vYdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792145372; x=1792750172;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/yeubclmkesk/1V3922jAnkkUkaI/ZuGA3yC0ETcQg8=;
        b=oqLW1BN5yLtTaTmOkIHkbBEZOHE++sPttqaF2wUyKL9uxGeznT66v4cemncYtvhPTP
         ZEqn+8Sa6TPxldsu1bPbhHOxLXizVMBmPEBTlb01OC0gGheQhjzW72vV5BSGgNvyMm8k
         nLUu8DYhvHH2x6qQq39fDeVTKTbnwkgHH3uyIikhJERVVtEFqmDTZcRI++iWp7p4zBSJ
         Ep4H9nx0774OcxUKUCxL6MM95VBFE0dwrt+AoHcK04HIyH0ZR22uNx+Zg/NsuJB+q1hF
         CDg4RuGoOiZNrR1wpp4OlXN8B6H0qDRmm1lR/cYNFFy6wcgf14/2Xj4DTtDGRcJFqs2a
         QuLw==
X-Forwarded-Encrypted: i=1; AKwUvByDgoJp/8ev9KDYDkLv2NNwGWdz3jWkYdNjAngnF/zgSmEjJ9vj3p4g7A/WLbMZiI0Lr+9qxAvY6/8Fngw=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5Fk1HneFFBex6BT6KwsolKXoSAokXpHkPJeIO2h7tu6dfB6sg
	46OTLkSf4tvax/FuuxY9apR4WJ7+lQK0PtI+9ALFqKIvbmAgc6QtZJnqugq5Z5MaZRUztQivdlX
	Opcq+
X-Gm-Gg: AYBFou26H3i4OdtYhOwmRQrsSiIzuYnETYbKt5X3XbZzdEcHx9iK/KdlGFvlzWtXkUs
	T3MRVHBovZL4CSBzFRGsqVS6e0Q/tZvKKXB81LomHDEC+Mu8bkHeqxiQsdAgVs97q4az4PVJHE4
	R78de9OFP01gwnVtikZLs4aOtoOK8M6QR7zdJDgJuSyl5Vq69nbeGsJdkd9MrRbSZwDLcAb01hb
	bH9MZbRDnaiOhIaK66p99VgWkn1CJtbGLIOwgps0njAK6xJtxxSZsLtuXsVocEy9j4XmlhckBOg
	T5mbqbOurgylK+uFx7xYa1j7kOKuYuFrXiwTrGHnExN31oxAkgrDGb2fHZGRDvVrEHO5tb/HnwA
	MmAoXjjCXrFGd+7yCQLFxHH5AiNK0536du+V2LgxTHQTjzSjpvbqzD8ABw5xlNXrUvj1c2W7UIK
	KNkQ4oFjf5LseykTPLqzrCxB1mo+7QFrVlfVj+J/IdWad6du347bOsIsx5s/3lY7HerYw+RylD7
	JdEI/a4fvBEITsf7EU+PFpe3t+cv7Q/EffsQX+DZNR1MPuSeL17xE20P8gG
X-Received: by 2002:a05:600c:46cf:b0:49e:8191:e5cb with SMTP id 5b1f17b1804b1-4a18e4a3ac7mr473891235e9.5.1792145372652;
        Fri, 16 Oct 2026 03:09:32 -0700 (PDT)
Received: from localhost (p200300f65f19a904af4079c70d984f00.dip0.t-ipconnect.de. [2003:f6:5f19:a904:af40:79c7:d98:4f00])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48dfd4c0894sm3754051f8f.12.2026.10.16.03.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:09:32 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>,
	Armin Wolf <W_Armin@gmx.de>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] devicetable-offsets: Include the needed device-id headers instead of the catch-all
Date: Fri, 16 Oct 2026 12:09:13 +0200
Message-ID:  <b67483fb2e838141c98fa41f926435f346daf8e8.1792144769.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1792144769.git.u.kleine-koenig@baylibre.com>
References: <cover.1792144769.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2918; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=Ur2mWENevbAqkMKf+HRRkyjbQkZyf/rnCbjk7Y7fVtE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq0ffOaE9VFde6Ihj/+d3P3Dey18AaQByOrUIA0 vtOg70HlLCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCatH3zgAKCRCPgPtYfRL+ TnORB/9lv38zaEHCfDW7EBZdsBKUa1L2oNwmxB470Ws2tPazlfC0IttSio7xG6PFtBeQSYnALNY wKIWhWB8eLEwx4KLXjYd+7ugOjakhIFL5Ij2c+jJn5Iluntq7TKrmJaM99MP2StJQUK8xmai7f+ pgbYoG3EAZafvcHqea8CrcfKn/OiXd0KXZwHJ0WdzDUurDxN1PD4Mz5skuM5ayZayjy+QEuUxNh VH1ZwL8xqa+x/+unEB256Owz0X6T8Dg28M7x0JaZ076mQkbQpSe+T5qDbc8uFBWJ3X+mFiUwXV7 ecAe51Leen54nN2g/fvcSH/9pzmt3+o5dJUKs6YRR4v1cQsQ
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

<linux/mod_devicetable.h> is planned to go away. Include just the needed
bits in scripts/mod/devicetable-offsets.c which reduces dependencies as
<linux/mod_devicetable.h> includes several headers not needed here.

Acked-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 scripts/mod/devicetable-offsets.c | 56 ++++++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-offsets.c
index b57dbbef8777..1f4bbd014a3d 100644
--- a/scripts/mod/devicetable-offsets.c
+++ b/scripts/mod/devicetable-offsets.c
@@ -2,7 +2,61 @@
 #define COMPILE_OFFSETS
 #include <linux/cpufeature.h>
 #include <linux/kbuild.h>
-#include <linux/mod_devicetable.h>
+
+#include <linux/device-id/acpi.h>
+#include <linux/device-id/amba.h>
+#include <linux/device-id/ap.h>
+#include <linux/device-id/auxiliary.h>
+#include <linux/device-id/bcma.h>
+#include <linux/device-id/ccw.h>
+#include <linux/device-id/cdx.h>
+#include <linux/device-id/coreboot.h>
+#include <linux/device-id/css.h>
+#include <linux/device-id/dfl.h>
+#include <linux/device-id/dmi.h>
+#include <linux/device-id/eisa.h>
+#include <linux/device-id/fsl_mc.h>
+#include <linux/device-id/hda.h>
+#include <linux/device-id/hid.h>
+#include <linux/device-id/hv_vmbus.h>
+#include <linux/device-id/i2c.h>
+#include <linux/device-id/i3c.h>
+#include <linux/device-id/ieee1394.h>
+#include <linux/device-id/input.h>
+#include <linux/device-id/ipack.h>
+#include <linux/device-id/isapnp.h>
+#include <linux/device-id/ishtp.h>
+#include <linux/device-id/mcb.h>
+#include <linux/device-id/mdio.h>
+#include <linux/device-id/mei_cl.h>
+#include <linux/device-id/mhi.h>
+#include <linux/device-id/mips_cdmm.h>
+#include <linux/device-id/of.h>
+#include <linux/device-id/parisc.h>
+#include <linux/device-id/pci.h>
+#include <linux/device-id/pcmcia.h>
+#include <linux/device-id/platform.h>
+#include <linux/device-id/pnp.h>
+#include <linux/device-id/rio.h>
+#include <linux/device-id/rpmsg.h>
+#include <linux/device-id/sdio.h>
+#include <linux/device-id/sdw.h>
+#include <linux/device-id/serio.h>
+#include <linux/device-id/slim.h>
+#include <linux/device-id/spi.h>
+#include <linux/device-id/ssam.h>
+#include <linux/device-id/ssb.h>
+#include <linux/device-id/tb.h>
+#include <linux/device-id/tee_client.h>
+#include <linux/device-id/typec.h>
+#include <linux/device-id/ulpi.h>
+#include <linux/device-id/usb.h>
+#include <linux/device-id/vchiq.h>
+#include <linux/device-id/vio.h>
+#include <linux/device-id/virtio.h>
+#include <linux/device-id/wmi.h>
+#include <linux/device-id/x86_cpu.h>
+#include <linux/device-id/zorro.h>
 
 #define DEVID(devid) DEFINE(SIZE_##devid, sizeof(struct devid))
 #define DEVID_FIELD(devid, field) \
-- 
2.56.0.rc1

