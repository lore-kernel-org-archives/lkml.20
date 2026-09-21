Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525E64A2632
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790000352; cv=none; b=dZ8AY3f7WeSGGw3A8tm7KImn0OZGUTtj++oEpBvHny384cCxDZDmyU1neJLRtomelTgGwnOpBYDRyRu5d/ZSmE7VwOLhxDi/XzWaJ71g1OQgzl6bPrQeLdcfzDYCzJkTx8YDLOo2OOjir68MbB/D1agTBKsbm3zyZjKa+DtDn0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790000352; c=relaxed/simple;
	bh=7NQB7CbqeJhBU0gwoZAcCCwGqFylrf3yNUA3KAuTKWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A9twLRlCtMOeYzmSLhEszSvwJzRtdyq2BfMcd3DTDEHHhTLTkw2UgI2NetnsFoNOcrLZ/a8whv+KGCnhuLwDeKQ9TWUcJB1nJ6kl2knNneJ+XQmZFKSH5eHhAp9OUnkC0WqRdxB41ZqmN7IaP6/RL1TIJiRU7ZdvxdFyoE+wClI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=SQlD9sHl; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="SQlD9sHl"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso43022945e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790000348; x=1790605148; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pGr9PNK8A3HIW2FQblW4kHC8jz59SbhsDctVzKss3rc=;
        b=SQlD9sHlpMF885fT5c+sjeik+QVnPKZNN65UvN+FKvqnf1UgxU0Ec0KPHIqGkWPdOF
         5tjlCF0AlGkBcyf9HpZAymn2VMNJinJaRfBPJ+oOJ6Ga4CoXKLBw8BxQPqkixlZIsul+
         U6Ql83zp0dSuDoIN22hdt1pgqGDtYzQ4310wQLeX0uW2R0DsTZ6OZUVL9XRfGvGlpJc4
         Y7z/pcmvqUQmF73NAQUavHpQEHkJRLVTGhA82Yy1exthqGhBUfXGWiOCzdIXLh0fj8wL
         0+NUqfbYU0M8MgEP7d1g6IZEcCrO0WpkzF8JaqlZU0zJW4voW3l3wqgshcF2pJl6fzJu
         6eJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790000348; x=1790605148;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pGr9PNK8A3HIW2FQblW4kHC8jz59SbhsDctVzKss3rc=;
        b=HjlzeXZqSZXt6YPXEmClJzU1H7NI86jYtUnDLja8t63UHY/TkqCmpsvQnBIZx7FW7E
         dQi0BdWd5/fAZKgB+F0SYLlLMeqOV6O4nc8fcK8VBofE2xtuebG2EziQXhrUAIhZXsMi
         NfyUhu+HZvo6CQvxKizFLS4S/VN7BC0QUO6uAGMiW2Y2vgve2uT99LiLNeIkUFvm9Chr
         TT0AcRchRc3ApBYb+lR4lPPDO7i0l5YCeuZ2xivIXeC8i6NQkn03DowtdmwCJsyejipo
         EevO1wsxBkfTTWW/sulLzeIvm6zbcIEaK/h6AKhqSGUjV5tmi4+YEhMHrUULFUNxgGbu
         Cjrg==
X-Forwarded-Encrypted: i=1; AKwUvBxceUHYNlK6ogqPN9glhld8aOj85BriwT4PVwXc9zaaZmMvUgrIj+uTiHDbGt9oHi0fDX3VvSyIh1ZIZ4s=@vger.kernel.org
X-Gm-Message-State: AFuF++knElY9du4rCa9+6sEDhFoQZPxTldws2MzM1jGVKpIBgWuM3HD8
	Z9yxlESTe/0Pp9FUwWUzIU1iwQgrBKQTev3/tulTRcbCZ8qeE2rigZZ82uZQd11KKNw=
X-Gm-Gg: AYBFou0aKixkRHAJzNHSmxNgBYoLB4oz7X86KvrRA++vUs8PY9b/09KPNBafiyoFiiC
	jI4w9Kwmc9gZ1TM0S7B5RsuWEbJ53tPKM+UMYiMg8WP2NneDYI5klGV83NrsPZaDaAWfehFd/4x
	Wod+L/qiYTGNRUA0yjDP/qMyKl90Fuxm4cK6/5ZU3lK2Cd1hlgfY5lN/KCs2c9vcPwhVSItzQS4
	EZPSIvP91Bs1UI+cGgcprihyYzw8P3DzM85Hv/OOd1qife19iD8dAJ0mIgjAWmK5WxRHOXZDXMN
	kzadEvxbaLMiv0K5k/6zqmVo47xC/V8mr3gQH/7RbpMCqOh4nT0XLapmsNsvrgNEDSy25n+1/wR
	U8lElTnErthD3/14cQlQqO1xhF+26WTEI9WQvKUS0jG5DW0uKDTMt8PqunD5nkwXMm2qygyzel6
	4zH6rmoubdyXQMlrgfZoV18FZJBk0r/Ta6/BFDEM3biXiZoSVXsFUT8EcFQarmiJ4hNNJ8rAx+2
	olCc/T5PkMSdIRVtP1/5lXr/ALa5sxMbBl1bFVdCkKMJ67ib3s9XLI1n1LsxQ==
X-Received: by 2002:a05:600c:3493:b0:49f:bd3c:bc21 with SMTP id 5b1f17b1804b1-49fc573b55emr149417615e9.28.1790000348476;
        Mon, 21 Sep 2026 07:19:08 -0700 (PDT)
Received: from localhost (p200300f65f19a904d4f76eed31f2ef79.dip0.t-ipconnect.de. [2003:f6:5f19:a904:d4f7:6eed:31f2:ef79])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49fcd0f8563sm266149915e9.6.2026.09.21.07.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 07:19:07 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Alexey Gladkov <legion@kernel.org>,
	=?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Hugh Dickins <hughd@google.com>,
	Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>,
	Hasan Basbunar <basbunarhasan@gmail.com>
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH v1 3/3] file2alias: Include the needed device-id headers instead of the catch-all
Date: Mon, 21 Sep 2026 16:18:51 +0200
Message-ID:  <6259139da4f8181c7b6ca01128ba7c645335850d.1789988540.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1789988540.git.u.kleine-koenig@baylibre.com>
References: <cover.1789988540.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3655; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=7NQB7CbqeJhBU0gwoZAcCCwGqFylrf3yNUA3KAuTKWc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqsTzPV1jgeWLSkidYVaR74w/TcNnjTpQgpxto8 AHidD6Gt/6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCarE8zwAKCRCPgPtYfRL+ TgL/CAC1AVwnpLLgxTrLAkF2GH4zPzt2M0FNmNlVmNzxzunjhXlffDkyWlJaD2wTrB5vItEgsTa Xll2BQ800pyZfkhqWvUbQJC9bNtEOBl1vvIgAvfWsKovISkQxHa8vgrYOogoGWqIMpd1XF/eNbm SEQ3Et68nzemxPwr47YlVQjEAzx+f1Ezo+H6goaAk742lDhIjnd8tsQ9Qz/2VV4+dRpEb6CQkI8 QgiOZ1CDDhVRD2i113b3VMh8+xa0/LRwtcHVJt62Z5ZE9l3vMMxbnmDMoHRYINwL+O1GQLk3jf/ xbGUUHXJkv1s2f2o/qMhvTnJVeboUUDvQztol5XI8slkE/ZV
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

<linux/mod_devicetable.h> is planned to go away. Include just the needed
bits in scripts/mod/devicetable-offsets.c which reduces dependencies as
<linux/mod_devicetable.h> includes several headers not needed here.

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

