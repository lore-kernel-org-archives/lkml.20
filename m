Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792758739;
	b=I1VrIOgdXGpEE/bx/sWoXW9VCROnQQbf5sVAoVmcXoS6cq/3QayMf0FR6MLgcUwrrGZe
	 MOlbTkCyijDrkBobtAlqqDZCUL2VoSUNKEch+Yh1pwx09sWf0UQ/TciC4SH+R746328kJ
	 qa2Xjks8lk1ULX4BlzJM0E5DWBLV6fK1iSwcH9zyZkHJWgpgqAbOdncwGFkB5TVa1tVBq
	 EPGCGjI+jk8I08ndHDwuaR9hikHx+wsG546lqUtbGRD/R+L6ZvJCl3M+QfTWMnPvwuEFf
	 LpHaT38L0EF5wXVpg0d8NsxpJB6Q5C4BEjhQOrd2HrYbxPbeCdaSmvXvETfOWYtQ9GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792758739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=scUqe+m2AaEqm0y3/EgjFb3VXYqdf50pvfoJjsmh5EY=;
	b=VcRYrm6caYRorKwt00PlCQNQ4wDT1ToD6vcgRte/PcQSKdmzfAUlIcFE1RqOf3fMZ80V
	 XG+pWZMkpmm0iY7oNpV8ybbI3+lrWH0B8RIi/5tdzZTZ9aWMlKu41ZIkyVtOyU0qan/yZ
	 7R8La2uBl9lkifyp6jSTXn+g/LYWMAcdgStM4UeLpHc5pkLaXqN3rawaVJ53hVGwuB4i6
	 5fYhGdM7wUQHraS2lrT1dDjx+qqje70q7WRUx2aw2AW2CkO3bUSniWDphz4oDFSPWi+9x
	 lDwrS7G6BVSIfkYh4Ew+mSMmnKhdPcreOTHhSlJ6zt/Z6o2qYIrMXqCHT+mtj+kYFEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GPh22pHN;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D147606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:32:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D147606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GPh22pHN
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso8021355e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 05:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792758738; x=1793363538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=scUqe+m2AaEqm0y3/EgjFb3VXYqdf50pvfoJjsmh5EY=;
        b=GPh22pHNy6oEy80Pd6NlwxS2/yjBHv9mEZo3KflXm6BlueOS9REwdzfSO57rDEfS3T
         i9l2bBuN0sIoJKTxT/aALyY4jPWc6SkigtG6wkTUQXhJNWAopFPlvBWKH9Um7CnB5cvf
         sghFWk+AmH6JiGVVyZjzrkjiZ81Pq5/KGylY6NJovcI2adf9Ycs2MTIVRfvGboHhJ2sv
         FjnPF5km8dk0vUlqMdHsK6GeMcxv4uZv1w1rjy3tCYJjUO8ec9F6yT3461g8F9YPhzTN
         37FRTu+Ubxox9E7GeI4ppKjCbB8iVnFayhXJuISAn5bOMKZsVhoYAKIzrV0Ym1b7XINa
         vHXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792758738; x=1793363538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=scUqe+m2AaEqm0y3/EgjFb3VXYqdf50pvfoJjsmh5EY=;
        b=dD3ssHLmGSVjosAbaOrGEvh7TaznR/vlE1IQj6+Yh9KaBM0jmq9iBhu1s3gyr6m5bW
         /v5o3yorg/ZjyBMFJcAkfocbsLIHW9XMgtffw5LtQSTd137FCoZtavOdWVXqyfv91qYU
         Sl87SxxHgLuRkqRm7cIkE0PauSdh0E2KFQVX+ZDScvvbaFH0iXBEWfvSxG/7dIJhnLAl
         u3tlVGvggZqBD8z4SMoXso1M+p2g1rYzVjDL0Wnczcl1sBe3rNszlWD3PkfyvzSKa9Tz
         rTrsPE/qxqFgBamy8XxA5YbC3JhSmjrP0oIFLSKxEDY2U7TGJgFtO6HS/IZsfil1YQH1
         BD7w==
X-Forwarded-Encrypted: i=1; AKwUvBzOXe1A99lRG9VNZfA7N0oWJKSDgwGg9xlSE/yqsWwtSJ0kF069nmmMOhl8x8y1SqjjUxPG6AhKpkHm2CM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJeD/TdYfW1jNRwAx8TcI7/dYf6sFFLGdTV82C8NAaImZVjCFhy
	NsNLyrc6ebxPVbCf8ecbyzN00lLxI9Laibpi/DWbtRvRO1UUWSa7267Q
X-Gm-Gg: AYBFou0bs/A0iEbz24w1z/StI/frIKwK2FqEMjeqI4OV5CeEee5kK/Vx04qf7+t3rAL
	iS7uE6JaBm6wS1gdxuus0CJfgalxAnFw1IiWlcapmsUT4qvybga4YkXfFQ4u2Ghy0MLYLyViGku
	+mTqkAM/9XY0spkythLTpIWZ9XCBwgTPhjgJBZ90JpFQeEK8NMLUBXD1zFQ/e8NlCRdoimCAT7J
	zpJwnydKC537AL4RSJLPY1c6jM5d9XqRIGslm39xXj9FgteaDi6unHR3/06KOr9+UTvEbEfijV3
	P+qrCewBAwOe74ui8MDozlh/zQ1pHe51DpnVlWbMXfzsffPqg1PwKeFR1EgQQ52TB+C7xiA9Bwv
	TVOILYRRBIz2zIGgyRFXJPTYn7KyZDn6H9ecps9bR95zAxZrrB3VxnOY7/D0lRk+ffYoOR+7jTY
	t1XngXDGtH7LvcaX8QEHY0uuuOIuQO/MU7fsU5+zP+C7FiXJkhYb91OAyIBL4apBIqJHSVAuJJ0
	agm1qtEWHbcIezNZaHVycFFs4cFDiqNDczO67MguI3lKFz084EPydA=
X-Received: by 2002:a05:600c:1911:b0:4a2:74f:46c1 with SMTP id 5b1f17b1804b1-4a211c9de53mr35206875e9.8.1792758737396;
        Fri, 23 Oct 2026 05:32:17 -0700 (PDT)
Received: from salem.. ([141.85.144.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2b064084esm646595e9.9.2026.10.23.05.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 05:32:13 -0700 (PDT)
From: Lorena Tanase <tanaselorena3@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Lorena Tanase <tanaselorena3@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH] staging: media: atomisp: Fix double blank line
Date: Fri, 23 Oct 2026 15:31:58 +0300
Message-ID: <20261023123158.6176-1-tanaselorena3@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed blank line to ensure linux kernel coding style. Found using
checkpatch.pl script.

Cc: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Lorena Tanase <tanaselorena3@gmail.com>
---
 .../media/atomisp/pci/hive_isp_css_common/host/input_system.c    | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
index 68b0ad27615d..66311ab4880a 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
@@ -6,7 +6,6 @@
 
 #include "system_global.h"
 
-
 #include "input_system.h"
 #include <type_support.h>
 #include "gp_device.h"
-- 
2.43.0

