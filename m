Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01E62D12F3
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 01:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789175466; cv=none; b=pgbgbC5RFQZUEaDdNv+s+xQ0HZ5xj/TEN5emQL9rEPkc7LjmcmobDsVzXNrwxFvrcVupVE77Bpm46m9Ox2+5shmEtyugGrx4OSC+YgLBnoUuEu2R549XnbLLa880vz0JQqgWsQtXbh9mzaTkbg7MMVHpXzwr8GCYo4gQ8UtxIyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789175466; c=relaxed/simple;
	bh=3swsNw31lSkMLciZcYqtrvV/YSRJx0HnmGQgeLeCvZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CRy12WQ5dU3Oj96stMjSAx8n3Uu8toZ+SsNYMCIBaBvwflPNHB8pIdZgIvrVh6qpKPe58pqPycEJ6DEjLOPk1J3cXqpRO41sEP3bskbomN8EOML9SCa5ubCEuRt696eGqPzb2WlSRUS+YJiS6/llTOhmSMJ8HQCRx2pmcCmqV7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H7ijKjql; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H7ijKjql"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-9828b5b20eeso916977241.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789175462; x=1789780262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w/LDGqOYLFoK6KgWIPFbEeA32vwB4mka4PD8SBisxBU=;
        b=H7ijKjqlWd68w596FQJU3EZP3/EHlH2BeI7tS9q3Gl9aeLMmO+A5veNdZBG8H95qPL
         k3ylzfazAtWHQzh/q/ifXsHovWZKRXr5mOwQO7JYfB29CkPt3YVOSUyR05JRi0dPJ2vs
         U0zgR7Jp24QRuLECMn0B3P2xvXZsdOA4cchELR05MqX8OkfgF9aoDfwBoTLG0MoDUEZN
         pYCCBQ2sqPz05Ir0bGXG9IPDZqc0YGotWHKqB9WXdpC5/PW061UiycFBHL+NIzrcrFjk
         ZALDre5HHMspYORxpRy0DLmaJoYW+TzPG08OJqKBtEW/5iZaMc5bu7RnhM8ou7hTrlM3
         lr1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789175462; x=1789780262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w/LDGqOYLFoK6KgWIPFbEeA32vwB4mka4PD8SBisxBU=;
        b=kWAjiInBtAjHb3jt5oQdz4+M8XgcWZPB8Tjcrk6VCg9jbkdPhp4qQiG1wRoG95O5yX
         mUFtgkCVK7gyxjVZ3GCkLAgeygXRpi+VMhisjAYD64rXDu0LyOJxYmPNZE8QuTIqUOWX
         +L60Dw1JSCxI3O2qSxI21qik+902gI16Ot41h4QDxU22w1b/B8fhBCcl4Ljrrj+vH8PQ
         mqf/bzHT6H+TuyKNINLKCmYN5udXlN003cvvoz+an2vs6Ed3qv5RDwAGAD3SiM8Dz68R
         IrWt7uDZOwoBi1kGVd5vzgoqzispOZeE+AMkq4mc6P2qDqz5LDwpeBVA0MXYCc2XmsIf
         DwXA==
X-Forwarded-Encrypted: i=1; AKwUvBzFGDLg1X3GwHI8013zp2yj3N5JdFsShCH8ry63wJ0vEGmgSLLeap5pe65bPsXSMpW/IeCrz/7GU6ecOlw=@vger.kernel.org
X-Gm-Message-State: AFuF++mZaodHqfmNa50G8F26WdL7sK+UCH43IIpYIrzq3nS69P/oi92v
	5lD/9VHvM8BXun6A22voJXHnwds/aVWN9cX2hLxuGmECM4AUiVuImO52
X-Gm-Gg: AYBFou3Bnkr5q3XNzawtaCj+R/SpXndbu3rBWt/0+LOA0jBlBQEkHxFvzn77X87nE6J
	ac6bcRzOl3wuPB0lKtZ1KRgU/685tgH2DT9DqPM3YLM0OnKjp91Zo9yMmDjD6cCdvV2Z0i77hX0
	o5dc6i9GRXLuWFURwWekckE/c84sb+I1ayCNMQSoCBL9ICShr071THg9ApnNqmPXHFWQUDYleCu
	RVzcl2LPdHqiu3Gr23tLjOm6F/lT10QhuA/x0L/rNZ1qhIvUx4onErC++/P+E8dgpXcO1jFqKxz
	LzducI3/pWchOZH5jjAPGPY5Zfe12pQExnRzlKELkUziVvFik/zv4jjorRNVCgJToEF9NC+mK3B
	cSXcrxBbL5rBt0+hUUgfAIkZlT8wmTvRlWyN8nhqnPZ95fmHkh/0YAYmRwDF186rNqNfct4w4g0
	DKuTzWCG7qByMc9l27aHYw8X3NboxDgCM5czP/d1LS7FJqzYxlgf8AAiaem3v1WbO9aMV9xKxF3
	gziHt3KqsSVovQVzEL7e+x+E+wxBDDK3iEUBok=
X-Received: by 2002:a05:6102:32c6:b0:790:9e43:1236 with SMTP id ada2fe7eead31-792aad5521cmr8814389137.9.1789175462127;
        Fri, 11 Sep 2026 18:11:02 -0700 (PDT)
Received: from kernel-dev.servicos.capsula.corp ([177.105.242.194])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-982ba1105f6sm4625862241.11.2026.09.11.18.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 18:11:01 -0700 (PDT)
From: Ricardo Barbosa Dias <ricardobarbosamscg@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: andy@kernel.org,
	sakari.ailus@linux.intel.com,
	linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ricardo Barbosa Dias <ricardobarbosamscg@gmail.com>
Subject: [PATCH] staging: media: atomisp: remove duplicate blank line
Date: Sat, 12 Sep 2026 01:09:36 +0000
Message-ID: <20260912010936.12832-1-ricardobarbosamscg@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove an unnecessary extra blank line to clean up code style
and fix checkpatch CHECK warning.

Signed-off-by: Ricardo Barbosa Dias <ricardobarbosamscg@gmail.com>
---
 .../staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c    | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
index 8e8433f5b07a..370cd8cac43b 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
@@ -10,7 +10,6 @@
 
 #include "system_global.h"
 
-
 #include "ia_css_isys.h"
 #include "ia_css_debug.h"
 #include "virtual_isys.h"
-- 
2.43.0

