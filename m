Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8423F0AA7
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 18:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790273059; cv=none; b=qk2MLPp7fFlrf/63+N69a1aakMAVIuiteh4PTbOES6eIbIFHhUZBczUvTb/QkVgRT+pXycvGE7y15LzC0HPnj3Nz8k0MWzwTn1M6DMOr1FBMOyTq92bMMb6SbTkp0Uq9sQkKuGmSDfs1bmzOIVBpPOFLJ950he5fkrY8F2E7jjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790273059; c=relaxed/simple;
	bh=y7PL0+ejjyHGcnok7ngTGhIV4WHYWuQR9i0Pn0Z9nR8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WrLbN4icR6k/REBW4r6iN0kx4PUhtBmM7eXaRKBQII0SCjJ8O7CXc0fQD1IGfPhqqx4FGWVFO//fv3CvTpWzoPp4SXsAb1Z02237wpAUE/GbUWyFQNrLR5KcjG3nDWzuyer32LlGd8dTUcQ1yU/7c1YzYGzIDUZzHJ04x2tZvPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MuWAQ0Hy; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MuWAQ0Hy"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c2946aa0d5aso186209266b.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790273056; x=1790877856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8ZaSVO+SF6MEByvXtiNZMR9/TYrsAkgI1sYilat2LtQ=;
        b=MuWAQ0HyO144YjPCnNEPhO39lRH+EK2CCiHkS2HHTlJEuTpToT3q2pzYDLi/znwRPW
         gpMN57KKXWivPsxe5Mf5Jc8dqR5lj41L+HH8LvR6qIXadM5FGFdCnWbnbzxU5xYHMcOf
         RvxU9f8Q63v6zQyh/CAnzDoHE0v8OAIgIQSkOtW2pV8d15tburpy9Fuc7xohb92c9mhf
         RazyWXt8TPqBZAAulmhR5UnEGIOXvFvxDm1uxNF/uQvt1jR7zrG1uTd4xah2r+2foTtR
         UxYJitxk+AvGqAUv+RMRmig45/5/f/AcR/IS/LFMk7fQ2kmk8z6L73KdkUGmpmN+acpg
         87qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790273056; x=1790877856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ZaSVO+SF6MEByvXtiNZMR9/TYrsAkgI1sYilat2LtQ=;
        b=mlqDJxk9HyegpIG7rXBGNCJmPJt2Y+EeXF6U+KcilxJWWbksQU4M1+nJNznBG8SBLO
         efjl/TnHoVYOxbVBPm1eju44mjy5+G8UZkQZFO+BTicLb9V8cZU2hfRCZVnm2nxBKnMe
         rC3R2EhGjS22hjJH02WA2xtYpwGSXgDPjnPZHFdiRC5Q9ewoLHxiQt9zcuT6dMCrLaIv
         I999xfzZmRBICKsf+kNYxvMjyXafPlt5Idn9+qEbvm6dH2DbLhK2facx4dZfH10c5ai7
         TQwbzicm9zj4uL5LOgu0qLNlKPMKgv2SJYuD0NJzyvdUByXjgW8jMmXGay9yRcTzrLVo
         uYWg==
X-Forwarded-Encrypted: i=1; AKwUvBwud/vW7eAWxqfbzTGX4KLEYbzDQIe9qTgh+DzB0kbtuQLUHEFqs/j+q6iTgQDWCZkkwcAk8kKswdtIBRA=@vger.kernel.org
X-Gm-Message-State: AFuF++mTBxyBsH9fXS4OiGrokp1f/5mR24HLd8f9T72oUhmvgV0jM2FO
	C5zKXgyb9GGmHuBEeiFJL5j+EcuTH0O8agC6x1p0pWEImECPRrQVdxrDY0VN2xNN8g==
X-Gm-Gg: AYBFou3BWUamngAadqWs9peW85uVw8I43OuqtEawu0xg8/juQwT90xJw9AZkru8o7qq
	zjsfg6iIVtJE3oR+IRiERKUTzpo/+req3u58lZ60wcbrzA2ql4YfFyygRSJvwIFONn2+lZSPV+N
	2CEAYux8ItDxrwNR0C2tx7SrFJSTvVwTjTDp6M68A6GpdbzpOBJd6iaErDuB7edQr9uzBtJMh9y
	0qlUAhQ696ZELuO2/U3K2R4QD40Fwp9fb08iGLlFEE51fvB1Me85rVPHb5QQky679aljRJPUxwe
	RAACtBg3DHYwa8ORPGyj/n321jtZSpCUC304NpGHFq8B3YNrbcM0O+T1oWtdRZAsVap3iN8GKT4
	QASNbrDXP29xwSTBpGN1TmrVMw0FprC4XVDGFmD8pUIwHejvJm/zExa8n9UeoMGw6Nq4WOGyC+a
	sueM04rNpuCSpdUvt1kbGLAAfjwZX4s8vvnXM3IJqalF6ux8oKiessB3XlaySW+nNj4ipBSoWBM
	CMD
X-Received: by 2002:a17:907:6ea9:b0:c29:42ad:acd0 with SMTP id a640c23a62f3a-c2ac23a733fmr314809466b.30.1790273055386;
        Thu, 24 Sep 2026 11:04:15 -0700 (PDT)
Received: from okuroshi-laptop ([169.150.245.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae6610a6sm336715966b.39.2026.09.24.11.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 11:04:14 -0700 (PDT)
From: Artem Maksimov <okuroshioffc@gmail.com>
To: Jorge Lopez <jorge.lopez2@hp.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Artem Maksimov <okuroshioffc@gmail.com>
Subject: [PATCH] platform/x86: hp-bioscfg: support large bios data
Date: Thu, 24 Sep 2026 21:03:41 +0300
Message-ID: <20260924180341.34064-1-okuroshioffc@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Memory allocation for ordered_list_data and string_data
can fail if contiguous physical memory is fragmented or insufficient.
Switch from kzalloc_objs to kvzalloc_objs to fall back to
virtually contiguous memory when physically contiguous
allocation fails.

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

