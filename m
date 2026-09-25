Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B7518D62A
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 03:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790306435; cv=none; b=kVGcWL9ZjswWMsAQGJW41I1BjhDTlue0eKrC4j6pKxvOZvHBNlYsB9EXfPly8M44JaoScTCflAkdXEcpt5SpR2wD1PISZWNkBWr/mi0jjDnuRQ4HLEr6M7DngMA19XrGmdlzW0fC8RF/ZLOB6aLAlWEEDiWtKP00TbzfhCYFvmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790306435; c=relaxed/simple;
	bh=ZJf+JShVktOxWNIkQh2BjsSQvRmw1spd0qq76xt9bF8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=By1pc1GHmVSTJBdiS4edVAYwglfFsRCgHVDke7EUeEwZwnGjp8LPM+7PUJhC0bAe7gdEjVm3nV6tarOt1oJNnUxUBW+EfHfTdmlDd1G2vCCtSX/Br2WE3Q48XlAGXe2FTGb6qEzmj2VySG2T6VFmFu6fW/EB7QMTr9Er0aYSzXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n+JzoQx+; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n+JzoQx+"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-3411e0ace58so454175eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 20:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790306433; x=1790911233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oLWyQJ000YJbN/yXuhq9LAU6RRH3ViLzBHEd7qrKzUM=;
        b=n+JzoQx+dAjLcI5p21lniXj0q6FeNKm8onYnK39lqJXGJ+NZhAU1CmuffqV9FYcnXu
         Nf4wdJ1y4tO1ggD1STCJesMupNc8n5QumKXVTzvhFxMyYdZCZSqgiVmEITe5rzsuV27H
         n0m5a+S2s2l4+aYW4MucRwdg4cnt7XMZyQrGvhWf0EbdSgD78qXN67VwM4ApLpqsge03
         7KVEvxDgbytJsohuqHpkkqlsrE6RywMZuQ75iuELkaoFMy/8CUeAZ6dWB4P+prdSRn1v
         cH0skalNB3O4PKlf5wt1ycnjA8DCjBavTvk/Td7nbKcgx+yOlu6Y/rZ+Y5doew9iJxNb
         ODPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790306433; x=1790911233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oLWyQJ000YJbN/yXuhq9LAU6RRH3ViLzBHEd7qrKzUM=;
        b=YmpiGu8xKsWBVBmhNYud3MgckBA7k91bk/iQpsMQQV8OR5fTcnI4xGZFFD1x6olaaf
         O+iPrz1VXPM0BRxy+6Ekq/aY9Et3oLJjK202YTrv4vm4CoKK8IkzDa0zZ1S76PsLEuwg
         5Z3OC4VMS8xzV6Og6IofmMTTapnmVYuHmOgoqtGsVmxXl9UiUnYnPqlZvYthFniyLNt6
         lGsaCGyg0ahFF3LX3wBf3dh84hfZhberQKLVioiX0HsTD0e0BzewPFn2WwZa0HPaIgBV
         EtTR2GaSuKVBJP7NeqyagEZCG+ML8vVWExfLeeciUIwqrkvEzR4KDRTR/hA3xA4Y8r9C
         hpFg==
X-Forwarded-Encrypted: i=1; AKwUvBxL+7DBaC6b64g4kbWc7Sv5+1PFKuy7vfRlJmhi9paiqilaHjdDVFftSVV5+RRobd7wH1dQ75DPKKn7wzk=@vger.kernel.org
X-Gm-Message-State: AFuF++lsrT/bbHf94UsEZ27w+U5/ppOxsk6RGSGCZIzXRuUIHOgXGYho
	8h/6tkNuhg+raRYTNOvymEtrLItTce7iD8QPwKE213WqI0FHwBdjzPq9
X-Gm-Gg: AYBFou2f2vNJ5lbYhijzqPGHD6YhEgcgGFOInzcYFl3+cJmkTI168VfU5CE7Dgd/exv
	5hSMFrspQ4gh1kc/oseXIuguIAnMu3G1t/DkkXwMmISvEx3ylH9NrNDZoD1Rh14Qx8HcbaPeb15
	7UBBMl47vQrLyNphYXAgBu3FJ4gjIeK+2TCOcfKdM2krkBB64CjuBaOqpwrMTZwczPxveCqTLIS
	w8MJsxM/cL75X9NVm1HpMibJ5tznbmEHPG03EkSI/sataUhWgSYl0wUXbfrJemQM6r5cZVVmLoy
	qg83A3M0des5ET0duJV3h77UIZTfdOYbP3gu73rh3gkrbFENPz4tnlXge1+BM5msZGlK96OnToh
	8Mli0FDrm4F4Ws6pJ+jHexo6L1NFwHeaGHXL7SJJdojz8mVfo/LymyyluhbKHYwOZ0k5ymt/huu
	wOry8PgEcLyF4HBaNuoOuuh9qw8fIdbKJmCj+Vj8ovg2SpiSQgNSv2hAsMP/TZhfbg02bi2KjPq
	eO787g3Utzx9TkN63eX2SC0+yWNyFyw8cNe4A==
X-Received: by 2002:a05:693c:3697:b0:33b:eadd:9013 with SMTP id 5a478bee46e88-3400151f9b5mr3573191eec.6.1790306433251;
        Thu, 24 Sep 2026 20:20:33 -0700 (PDT)
Received: from tutebook.tail57d09c.ts.net ([2803:9800:a0a8:8014:618c:a663:bfd0:635e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3414407c548sm2603948eec.8.2026.09.24.20.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 20:20:32 -0700 (PDT)
From: TuteMthCD <matias.civadda2342001@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: bitland-mifs-wmi: Fix profile handling on Redmi Book Pro 14 2022
Date: Fri, 25 Sep 2026 00:20:01 -0300
Message-ID: <20260925032001.111062-1-matias.civadda2342001@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the TIMI Redmi Book Pro 14 2022 (board TM2107), the firmware returns
the current platform profile at byte offset 2 of the WMI response.
The driver instead reads offset 4, which remains zero in the observed
responses. Consequently, profile reads report balanced even after
selecting another mode.

The generic performance capability check also requires a barrel-jack
power supply. This blocks performance selection on this USB-C-only
machine.

Add an exact DMI match for this model to read the profile from offset 2
and require external power without the barrel-jack restriction.

Tested on physical Redmi Book Pro 14 2022 hardware (TM2107),
BIOS RMARB4B0P1010, running Linux 7.2.6-zen2-1-zen.

Assisted-by: Codex:GPT-6
Signed-off-by: TuteMthCD <matias.civadda2342001@gmail.com>
---
 drivers/platform/x86/bitland-mifs-wmi.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index 3a373184519d..c132902bc5f8 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -14,6 +14,7 @@
 #include <linux/dev_printk.h>
 #include <linux/device.h>
 #include <linux/device/devres.h>
+#include <linux/dmi.h>
 #include <linux/err.h>
 #include <linux/hwmon.h>
 #include <linux/init.h>
@@ -38,6 +39,17 @@
 #define BITLAND_MIFS_GUID	"B60BFB48-3E5B-49E4-A0E9-8CFFE1B3434B"
 #define BITLAND_EVENT_GUID	"46C93E13-EE9B-4262-8488-563BCA757FEF"
 
+static const struct dmi_system_id bitland_tm2107_table[] = {
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "TIMI"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Redmi Book Pro 14 2022"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TM2107"),
+		},
+	},
+	{}
+};
+
 enum bitland_mifs_operation {
 	WMI_METHOD_GET	= 250,
 	WMI_METHOD_SET	= 251,
@@ -195,13 +207,18 @@ static int laptop_profile_get(struct device *dev,
 		.function = WMI_FN_SYSTEM_PER_MODE,
 	};
 	struct bitland_mifs_output result;
+	u8 mode;
 	int ret;
 
 	ret = bitland_mifs_wmi_call(data, &input, &result);
 	if (ret)
 		return ret;
 
-	switch (result.data[0]) {
+	/* TM2107 returns the profile in byte 2 instead of byte 4. */
+	mode = dmi_check_system(bitland_tm2107_table) ?
+		result.reserved2 : result.data[0];
+
+	switch (mode) {
 	case WMI_PP_BALANCED:
 		*profile = PLATFORM_PROFILE_BALANCED;
 		break;
@@ -229,6 +246,10 @@ static int bitland_check_performance_capability(struct bitland_mifs_wmi_data *da
 	struct bitland_mifs_output output;
 	int ret;
 
+	/* TM2107 only requires external power, including USB-C. */
+	if (dmi_check_system(bitland_tm2107_table))
+		return power_supply_is_system_supplied() > 0 ? 0 : -EOPNOTSUPP;
+
 	/* Full-speed/performance mode requires DC power (not USB-C) */
 	if (!power_supply_is_system_supplied())
 		return -EOPNOTSUPP;
-- 
2.55.0

