Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB574749E1
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145379; cv=none; b=Nj9BczkYHBOU4K3JiaVuKl1W+kMGurP1gYqj2bhPLqYyTQeo6bs07yzzsEkVEnP68QO+sQimLlFVOFaQSN86oqCmF8u5ui9xPdM/OoHF93LPptrSYHTxqXUKaXMFOZfqz+ylbct7q3fZHr1n/U45N22Z2oDfWSfLEvQa8h2HPJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145379; c=relaxed/simple;
	bh=StArse6vzC22jTZzr8Vk9TfoFQsJlR7FiSGJzL8xoV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f+CZ5OdLyCmYlLYpfZ9kz8Ih++whutuByyXDJJPQASyU9VeYs5GHksv4f81m6bKQducvHCDlgYZHPZZvOj5VmVnD2Hy+YntnC3APMvSVNgoQmKG9d2+gEtPrZERYekNjPuQxCFmoE0KS/6WWWLFTn3rFagLluus/0EJAoeo21HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=b7OubmUZ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="b7OubmUZ"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a161d9b8c7so44244615e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792145375; x=1792750175; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d5LlemccQQ+O1yFFWB0Q9bwHIyFD4+ramy2B0VAnxL0=;
        b=b7OubmUZcmvY2bL7r8j67ApqypUpu8/qQyS6QbGfO7T1E0R4B5so5VYf5FofKfzlPY
         GE5jQn4hF9Mb/6P0my1QN0PSLGM9apqpoEofHu4kj+6MaJaclcFrRoSowa4AXO4GBK4T
         p/NaczxaxUGJShv3v2jSxj/eTssNZbF1NM9X0aK+09DR9CIcrZVFQEW7ANcNANEW9ev6
         g2DjLQywWkNgtnVxUwKjGyA4iSFg7MsdRD9Hd38OOn6zgYGogBre0OiwWZ1cJ8FlAgtV
         TO16Y1x+b3ax+Gns60Wj1XMVBcPh4nJfqA9bdM7A3kf3BhjVfTfYxl+4XMZpgxlmR5gf
         BEIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792145375; x=1792750175;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d5LlemccQQ+O1yFFWB0Q9bwHIyFD4+ramy2B0VAnxL0=;
        b=1Y8JiKFeJYgpAJM5tI+PwCh/8oM9VM6bO4jURWKmX3BeZQzwZ39ngi7wzhdeS6Opou
         udFBDjlgAN5hw/iWGlHgNZvkt0tfyJwg4clxT6i26MQfh+DQ1z3d3bc9GAeu8d7Vb4Vh
         UVOp7C9D5dojRfPbaYGxXO7pMncLNHFjIKqwjAFk82605+TcEl/PeQ+sygvwRePvrTBU
         w/ZuA4yfQw9qBYWq04k1sjcQLsXwY7XWm3/p3k7h3aOqLLmT6ruRwyq/dTnpxW0Nsi0E
         sAJitj8tXTC4v/IBpHD2URXAUxqvZtjdJ38/x6dcliqnIw3iG097OVMgB1a21MupG9So
         rRGg==
X-Forwarded-Encrypted: i=1; AKwUvBzPOmZSCL9vDH4ynoVHGlI+UmflEH0CErxWiuj21Y1Kjg/iB7zHSpWOvqTiO9WbvEHQxcOw1Se3A+qXrRE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJ/uLPROo3f5xuD9pwQnFuy0Xh58bNQfk23i+b+WT1TpztpFT3
	iudkljHpH/uh+D/g64emwNP8u/kUkFHGBRt5hn7pzSOT3mMK1Op1Oisn77npV3DfaHk=
X-Gm-Gg: AYBFou33OTleWPJ3H8NajppCl2TWsmtYciz+Idvd36TS/hAz6aSCZKQJ1dwfsLGHfOR
	ypyrt/CxNr8AS4i+b0QhN92ggrR/EnE5pvRpUN/ScOqqCXawUo1mD2+orZYcAQ1nYKYvsaC8Fw6
	VZ3FIuiiCUtCicB9jDUdZw7HRF+kcj0I1EAiav3d8bMUMRZ34G1bWxgaauZZmHj5IvqmWqZt4J/
	kOt/CuoxQ+UUvjTBDuh4THjVaZpEPaB0ZFLVDzCeiPQZ2LxfjCKABJKLxm7h01fVT/ZT2XvER1m
	DuM58bYpqsJBvysh8ZSt4d0Pb5RmlRfbFhOfVs82fqVQ+mZMiv4RLvOwpGHQzce+M0I4X/hFByt
	iVWueV6SbYP1ubLvWyFPjmz60chSdYlh2TRS7L4fTSkUdtKuDh8CXrgMDxvTlqiMJ7x+0X9X8f6
	B0NuXjzOV+7CZMaTZ7+Qv3f0NnQpDp20Ic39sbdhXdAL2MTjSo+Ng7hLzhyAT8S0krMr527ywQo
	CxrHGzZqyiP4H7JRFHHmmbZLE2RPDmqv1pZjvlVoZt9t0+oWJfM0jb+HWLylDzi/hXJ0QY=
X-Received: by 2002:a05:600c:190b:b0:4a1:82cc:1e9a with SMTP id 5b1f17b1804b1-4a18e4b2b25mr440003355e9.17.1792145375240;
        Fri, 16 Oct 2026 03:09:35 -0700 (PDT)
Received: from localhost (p200300f65f19a904af4079c70d984f00.dip0.t-ipconnect.de. [2003:f6:5f19:a904:af40:79c7:d98:4f00])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a1d3e2e602sm4705635e9.5.2026.10.16.03.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:09:34 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>,
	Armin Wolf <W_Armin@gmx.de>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>,
	Hasan Basbunar <basbunarhasan@gmail.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] file2alias: Include the needed device-id headers instead of the catch-all
Date: Fri, 16 Oct 2026 12:09:14 +0200
Message-ID:  <30a25a723b7a29a2e139df8375193804e826fe49.1792144769.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3685; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=StArse6vzC22jTZzr8Vk9TfoFQsJlR7FiSGJzL8xoV8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq0ffQglG8p1ykdM02kso4ZGd8t3J8uTOKLyLi3 NDcpRcli7aJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCatH30AAKCRCPgPtYfRL+ ThiSB/0ccZVYeQiSS8heiwwwlT76lepqwFM3Pa1Yqn9hnlvPBp8HAeYKfPWRNhEOLN4AFx6DzUX Hlk8eqTLW23EY1iA3umhTEddbrz9IZXE2s2u+CrNjfh4mjiryfnCwRfv7SSkNmA6kiQEOBf+Ed5 obe+fRua6M3OoefocaE2MrcnE4wCnceN1XAlWflt0XkqX/n2utjTqvj1Kj9gkEK01IskQX9Q2+F FAXcbmKeNxcu9Ouq20aZo3GiVO9MmTQTGgXsjFagphhSBC+3EfxcQXkZ4PzTMpd8C2wlbVMs71H 3S+WIDTv2e6dJ/mN7IXAKhWqZR6mbAhebUzpGpj5koUE6aBZ
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

<linux/mod_devicetable.h> is planned to go away. Include just the needed
bits in scripts/mod/file2alias.c which reduces dependencies as
<linux/mod_devicetable.h> includes several headers not needed here.

Acked-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 scripts/mod/file2alias.c | 55 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 54 insertions(+), 1 deletion(-)

diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 88bff3207277..7d76233a8d5d 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -122,7 +122,60 @@ typedef struct {
  * even potentially has different endianness and word sizes, since
  * we handle those differences explicitly below */
 #include "../../include/linux/cpufeature.h"
-#include "../../include/linux/mod_devicetable.h"
+#include "../../include/linux/device-id/acpi.h"
+#include "../../include/linux/device-id/amba.h"
+#include "../../include/linux/device-id/ap.h"
+#include "../../include/linux/device-id/auxiliary.h"
+#include "../../include/linux/device-id/bcma.h"
+#include "../../include/linux/device-id/ccw.h"
+#include "../../include/linux/device-id/cdx.h"
+#include "../../include/linux/device-id/coreboot.h"
+#include "../../include/linux/device-id/css.h"
+#include "../../include/linux/device-id/dfl.h"
+#include "../../include/linux/device-id/dmi.h"
+#include "../../include/linux/device-id/eisa.h"
+#include "../../include/linux/device-id/fsl_mc.h"
+#include "../../include/linux/device-id/hda.h"
+#include "../../include/linux/device-id/hid.h"
+#include "../../include/linux/device-id/hv_vmbus.h"
+#include "../../include/linux/device-id/i2c.h"
+#include "../../include/linux/device-id/i3c.h"
+#include "../../include/linux/device-id/ieee1394.h"
+#include "../../include/linux/device-id/input.h"
+#include "../../include/linux/device-id/ipack.h"
+#include "../../include/linux/device-id/isapnp.h"
+#include "../../include/linux/device-id/ishtp.h"
+#include "../../include/linux/device-id/mcb.h"
+#include "../../include/linux/device-id/mdio.h"
+#include "../../include/linux/device-id/mei_cl.h"
+#include "../../include/linux/device-id/mhi.h"
+#include "../../include/linux/device-id/mips_cdmm.h"
+#include "../../include/linux/device-id/of.h"
+#include "../../include/linux/device-id/parisc.h"
+#include "../../include/linux/device-id/pci.h"
+#include "../../include/linux/device-id/pcmcia.h"
+#include "../../include/linux/device-id/platform.h"
+#include "../../include/linux/device-id/pnp.h"
+#include "../../include/linux/device-id/rio.h"
+#include "../../include/linux/device-id/rpmsg.h"
+#include "../../include/linux/device-id/sdio.h"
+#include "../../include/linux/device-id/sdw.h"
+#include "../../include/linux/device-id/serio.h"
+#include "../../include/linux/device-id/slim.h"
+#include "../../include/linux/device-id/spi.h"
+#include "../../include/linux/device-id/ssam.h"
+#include "../../include/linux/device-id/ssb.h"
+#include "../../include/linux/device-id/tb.h"
+#include "../../include/linux/device-id/tee_client.h"
+#include "../../include/linux/device-id/typec.h"
+#include "../../include/linux/device-id/ulpi.h"
+#include "../../include/linux/device-id/usb.h"
+#include "../../include/linux/device-id/vchiq.h"
+#include "../../include/linux/device-id/vio.h"
+#include "../../include/linux/device-id/virtio.h"
+#include "../../include/linux/device-id/wmi.h"
+#include "../../include/linux/device-id/x86_cpu.h"
+#include "../../include/linux/device-id/zorro.h"
 
 struct devtable {
 	const char *device_id;
-- 
2.56.0.rc1

