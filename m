Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344BE36B924
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789137771; cv=none; b=NI+pGq1Q//SYW9222nV0a3bMOJ8Ms7M9sPvaA/OJ4VAvIVspTGEmvN6dZqWMSTCWzRPxIGvVu2Sj73Cza+ARkHZyOdvSsZnHcHJKaVRpZkdzwQUtmOc8nm5z4awyn5I6WiW8tk5u+VjiIk+EbCxVEznMz6n7CbzrztW4ytfqGkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789137771; c=relaxed/simple;
	bh=ETAktZ2QqHsWv3xS6bFropZQnc1xNBFVWMWX5r49MRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eW9tTxNbC8E7DRUTxou5Go00LP7NisQd6CAQtBEECjXeUAmfpFkN87YSWQlRzlCVIyMDB/cY0SnMd1lDCUqRn3jhoNEprtGQy7/rlaJUkOvik+IXBoeaPjTNBfwVEUy6mRKqZHqc9BAXjqzLZhCw20olIXHas+3R4e8OSaj0PCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KMuTAQ60; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KMuTAQ60"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so14986055e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789137767; x=1789742567; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zmqtfnwwI+zawdSfV+Bb8zoK3g+hxNVqzzOe1wmmaFk=;
        b=KMuTAQ60E1CNCd4URXitK1S0G1TPbtFo/8O8pHis1hFlmUoTVHMXiXNQVvL5tTNkJk
         7xlpb9OjCsSQguxNa/njBoRk0dh9fLjoT1Jd7nLCVirRR7lR6ptF/nwcTO/oZ2dn1Z6J
         v/5m1+jI+XymI4y1S8B3tamh5a47cE053BCWZf76epFHDHjDpUXVJfXrVWVBkDD8aAxm
         VRP90l7RbEnDe6d+8TPz19FyjXodJnFsbAK94SJA9xssWf+u9KJx+brm2OWPM6zHNCdr
         F7I1coQzJHToof84FKaohuh4fKiA+446oeAEh5dIYeYntLaXFQ5zrY8jKVuo18z1Bw83
         9hzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789137767; x=1789742567;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zmqtfnwwI+zawdSfV+Bb8zoK3g+hxNVqzzOe1wmmaFk=;
        b=OeYNBrvBq1BkUF9NHSf5UXUymTaSMnaFgH/vtj3U50o5k5SjHMVDRNeifV28y+ql2R
         m7eeYf50raB8+EpR0Oziy1pm9a/0cSmuX4eiafBTUbG0Bc4zUCLIGr4thm7+arcwMMNW
         fK6uT7KB92OGyg9GKLgYoaAatfEU9uAwPvR6ZNcsN7D5Wq/rEiBXsYAoR0Hzr1LkNPAB
         xwsgJ+gu31ezatkxHSuVwXOQJumgqLGQoVhNYVyLJbmAwSVFqswXA/4wJxj2oSqAhBAS
         INbUtzdyTrUeVVBEOAqCEWMtn32mrUcWs6Q5lN3F6wpV1rlNU96CaQfDMitxKWH2oW+U
         b9cw==
X-Forwarded-Encrypted: i=1; AKwUvBxx2dvp6zMs74KP/Lxt4RTPGtbVLm4zlwBoZbsbXBM4yDk9axiR+J95eWRK/IN9rD4NBcjsJy98BNABMMM=@vger.kernel.org
X-Gm-Message-State: AFuF++kBtbr8vxZzhoUdbrCIbsxhXsZhD5dffrgiOFy5UYHLNOBRn909
	grKX7rtFIOHythUeR5N5G5wf5nSqm0xh0weGG3Wqh9+xDYvH0G7I6zGK88q4P/9JI/4=
X-Gm-Gg: AYBFou0uz7L0AHHbW0mZT+WZpExsxw9Jg4RIJxdR/hbl5/t9Y+uNYq4AMfimin5FnwV
	AlCgLT1051oTlwHqu21wvlIyzD442ioNhrJqAYzxqQ4zxESsZlwSpYa/IcKhFY0QVjh0wDXekVR
	jq2Q9NB+e16i1m18X/qRxx0JV6rKJS9Dm2P2if31y5jAiYYfky6LWH3G/U2v6Je7Hvsl8bCF+y0
	iYDOziGUtkiq3nBUKjdaceRnQ4B2ayKt8778HOFKhXxMrO9WhPdbtNj00W5crWFD/mNBMmyLAW6
	xIk7wVv/16JKbdosOflDnDoNyuw1new62s4MHXmR6kEEo/cDR6rO/1r5RQEgivIzBaEyUXzTQs5
	USPggSqNlAK5G1ZXuTvinwMiXMsqviN7+NO/zU6dwc5S/xB8oryAjfA3V0KYRdWQKEFvtPlTIxY
	UzKqUJrXukjyGoKR+lCYkaLlc1DXT0iaNnS5oT0ic0c8gAoyFZAHHJyK8rPO3kkSstuMGi2otaA
	zaI3Lo=
X-Received: by 2002:a05:600c:1d1c:b0:49d:2562:d670 with SMTP id 5b1f17b1804b1-49e6199243amr52252455e9.14.1789137766949;
        Fri, 11 Sep 2026 07:42:46 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60ababd5sm107038405e9.4.2026.09.11.07.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:42:46 -0700 (PDT)
From: Petr Pavlu <petr.pavlu@suse.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>
Cc: Xin Li <xin@zytor.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	David Hildenbrand <david@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Aaron Tomlin <atomlin@atomlin.com>,
	linux-s390@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/6] drivers: Include linux/slab.h for kmalloc() functions
Date: Fri, 11 Sep 2026 16:40:33 +0200
Message-ID: <20260911-module-include-elf-v2-3-954c732975fb@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911-module-include-elf-v2-0-954c732975fb@suse.com>
References: <20260911-module-include-elf-v2-0-954c732975fb@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

drivers/char/tpm/tpm_crb_ffa.c and
drivers/virt/coco/arm-cca-guest/arm-cca-guest.c use kmalloc() functions,
which are declared in linux/slab.h. They currently rely on this header
being included indirectly through linux/module.h -> linux/elf.h.

Add the missing includes in preparation for removing the linux/elf.h
include from linux/module.h.

Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
 drivers/char/tpm/tpm_crb_ffa.c                  | 1 +
 drivers/virt/coco/arm-cca-guest/arm-cca-guest.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/char/tpm/tpm_crb_ffa.c b/drivers/char/tpm/tpm_crb_ffa.c
index 025c4d4b17ca..af4466cdc297 100644
--- a/drivers/char/tpm/tpm_crb_ffa.c
+++ b/drivers/char/tpm/tpm_crb_ffa.c
@@ -12,6 +12,7 @@
 #include <linux/arm_ffa.h>
 #include <linux/delay.h>
 #include <linux/moduleparam.h>
+#include <linux/slab.h>
 #include "tpm_crb_ffa.h"
 
 static unsigned int busy_timeout_ms = 2000;
diff --git a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c b/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
index 0eeddd1ff05b..54dcfc1681ab 100644
--- a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
+++ b/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
@@ -8,6 +8,7 @@
 #include <linux/kernel.h>
 #include <linux/device-id/platform.h>
 #include <linux/module.h>
+#include <linux/slab.h>
 #include <linux/smp.h>
 #include <linux/tsm.h>
 #include <linux/types.h>

-- 
2.55.0
