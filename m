Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5347C49BD96
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 13:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791380899; cv=none; b=nUZ4jnarFU8/h0l29OgLUefl2tpBKiwACAB5WL5IQpGUSOAe7VkwBcnqgXmAyOaSwV9RZdEIKBPQvsn7M6a18ePpt3VyFNJVrzPK2CjXIIBHDc8u9Wst+pabjEWOhAJ/g/iCwyuUke3HmcpheXd/kAAAs/5c9dwKAGTxgOwAYdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791380899; c=relaxed/simple;
	bh=j0BTnlAs8SrifsAt/cBhiB5powqOjc7nrqQwOlhg0pg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BcL/62job8LdXggNFsKZEC0/Yx8TQCdGbbm5hv5cjQkatM126C2WmvJ8GOdpSunp6CzcdHdQi8nqHOESWH6lZna+aAlY/k7gfoCfBiyKDPmYNJc90FAPnsLH5aUa1y0meJLyjvQJoHih/nNePF0KVvr6+5sZIC8/wuMIUPHvf80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UypUde2r; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UypUde2r"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-30b6dad2382so4118823eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 06:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791380886; x=1791985686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=66JT1rBrkI19wCOUvWF3hh5nZVukFj+pub4uCRhpi4Y=;
        b=UypUde2rOPKE9BWOl8o/j6cWeXnc3uRAl+518cCmNHfrWYxIbtB8VoifUsQepb84N+
         2xKOl54mMlhwuyDCBfs3rWWMBvwGtiTNMRFaViaRUpWANZfLKCV8H/0ZQ/gFCyRyWB0j
         JcZlVjUv/MqC9sAi8EK/GSgOANaFucdJwHjXsnUMwm8sl/08ULxzqmd+eIIvKrUv2GTv
         MLgjF71i1vknX1mJ3C4BKcTkrO7P+CCPjZUHk6IoVaJ/fUD+u8opkvBiTqUESO4ub5vX
         GWrHoIEIbYyWfyR9JtKLDxljjlpMDhoI7P+1MjtHJk5fWbhH2iwnw4jxDju91GzJN9vt
         /elQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791380886; x=1791985686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=66JT1rBrkI19wCOUvWF3hh5nZVukFj+pub4uCRhpi4Y=;
        b=XI0zZhNElApoYIV4TYe7OAR0kFvGHHmpMfrezIXDxZl1zj1QP18qlXwyRSHZD7/m1T
         gyQaohZ1sAjajQpbGJARLZcaUs0ROOKrOKNIfy37Qq79xtZXs0r7kQn15PcIU+d3rbt/
         bQ0ccywfJXjVB7SGi+TDsBRRDEA90sYOSPlPr+lDZ9sqTIwnV+VrvwL/pewnZAlmk6oz
         SDq0yEUeRDwS53tm8bLDK4Qb2EXdkbTIPCxgDwYCTYRq7PmSbLwAu5RXnwxzRei01u05
         A4hDYyR0RC8N0tQNyyiIVf3lcd5u4PyYdyEvnnsNS5uKpYObad+2E5a83nN75F4yn7eC
         eEmA==
X-Forwarded-Encrypted: i=1; AKwUvBzst4GA4oJFbCW4myAopnw4U88TnWlz5qSgfP+qjgYi7px6hKomqoIarGu6V5QihK6Uba3d7A2lLMv+/C4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJemuXq3aAj5pDCH0gpJrjHTrBZDR38fPZINjNXLXwg2x2yiaZi
	2He7ONzt6My4T4Z++NTo5tpjryr0pub3AnwPzU70SXihyDY11eZ9TsGO
X-Gm-Gg: AYBFou2taAL6ymLLh6POoS7tRS8n1MFQTquUlGQHOXRu4VFGdwRQxGhxEfeaTwREl+g
	E6qQOAvduIisnkLxhN0vSC2liZ7GM+eGebp9oey7iTw2+NLj0UXLczKMs1KZkyhhTOVNbZwZIF+
	7x/0QTh+V9Bw7O4B18CLzGP01G5Lnott8q3IWxuACR7bbUgKNK/kRCLpwlM8WTKq28gxGFeDloR
	Mf+TzJQRBJcgKdaErovqxXE6FxbyPPsbVLIRFyipsr+73TNlF+Whs5c3CKbPCHdzBCgYsB9OkmU
	QkQozDwI3gurC361zMChVgUsUTdbTvYA2dKHD3nw+Fal1J6LH52S4jcQXejFlbINBR2nE9fPXok
	ZSToTVHQSJBWuAFDkr9n5ffYsU5hHdnpiBj4LI5OGOlzsPFAISzpSmM1i2kLere+/QWO+w0fPck
	/mFyHTfbOsNvf/6l52z9hiTMpYpio3/KY+jQnlB8rmQZ8Ly46oJSaxgP0zRoY7v0AY+BXW1rXGA
	37spAjg4xuvVyTDv46vzzWaGSku9WWmfYHS
X-Received: by 2002:a05:7301:107:b0:351:2554:7eb3 with SMTP id 5a478bee46e88-3515dd33106mr2650057eec.7.1791380885967;
        Wed, 07 Oct 2026 06:48:05 -0700 (PDT)
Received: from fedora ([2a02:6ea0:c803:3091::12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515aeb5c2esm7304472eec.10.2026.10.07.06.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 06:48:05 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Jorge Lopez <jorge.lopez2@hp.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v5 7/9] platform/x86: hp-bioscfg: validate SPM state returned by firmware
Date: Wed,  7 Oct 2026 18:47:09 +0500
Message-ID: <20261007134711.473857-8-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007134711.473857-1-meatuni001@gmail.com>
References: <20261007134711.473857-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

status_show() indexes the 3-entry spm_state_types[] with the state byte
returned by firmware. update_spm_state() stores the same byte, which
key_mechanism_show() uses to index the 3-entry spm_mechanism_types[].
Neither is range checked, so a state above 2 makes the world-readable
status and key_mechanism files print a string from a pointer read past
the array.

Return -EIO for an out of range state.

Compile tested only.

Fixes: b2715aa2e135 ("platform/x86: hp-bioscfg: spmobj-attributes")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
Changes in v5:
 drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
index 2d4a3720f80c..25477ecf8822 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
@@ -6,6 +6,7 @@
  * Copyright (c) 2022 HP Development Company, L.P.
  */
 
+#include <linux/array_size.h>
 #include "bioscfg.h"
 
 static const char * const spm_state_types[] = {
@@ -118,6 +119,9 @@ static ssize_t update_spm_state(void)
 	if (ret < 0)
 		return ret;
 
+	if (data.state >= ARRAY_SIZE(spm_mechanism_types))
+		return -EIO;
+
 	bioscfg_drv.spm_data.mechanism = data.state;
 	if (bioscfg_drv.spm_data.mechanism)
 		bioscfg_drv.spm_data.is_enabled = 1;
@@ -153,6 +157,9 @@ static ssize_t status_show(struct kobject *kobj, struct kobj_attribute
 	if (ret < 0)
 		return ret;
 
+	if (data.state >= ARRAY_SIZE(spm_state_types))
+		return -EIO;
+
 	/*
 	 * 'status' is a read-only file that returns ASCII text in
 	 * JSON format reporting the status information.
-- 
2.55.0

