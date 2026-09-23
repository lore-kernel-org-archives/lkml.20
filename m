Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9092E38F25C
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790137208; cv=none; b=WOU8tJ9I7SfcZpBKRi3Yr9yCHzc7+5UVmYN5+btkiVG1s1WNma1q+Y8FZJW3j+m9CYi/h5rpMhhiNOdNtb7CssTAV4fee4SGybM9hFwR5l0AJlpBofljivs823egRySdqXbwo9ANezo0TqVsB1/n2duW6c+onViTkUiML2UUous=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790137208; c=relaxed/simple;
	bh=HV69CKMH6hrBZEN5j9l1sPF5toNG8bB4o5Y39gOV4vk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=So5olbf4m+Hnf8TnqzwUUjWZIj0ZGwk8p8k3Utn1wepiXq5gl/r6knnKx6qh80g+h/n6bQjIGNYXftMIHY5ZSYJVkAEu+GzsOYpAbygEb1iR/9oZjbxHfhy1CXmVFtVsPGNvSK1ksaEmsl6Uz8cvyZAnpPsjTKNATqKhSXafaYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=idkmanager.com; spf=pass smtp.mailfrom=idkmanager.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=idkmanager.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=idkmanager.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5c83fbd23a5so1265258e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 21:20:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790137205; x=1790742005;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bXIaa9lwQNszVQiM2fHG7rFajy+6MFlPqqteMlpXrzc=;
        b=y2+V5syd4d2+mvhd/ypASWSnKy1dxOUEvSHluah/j+9sITekdlREczcsdUMEcGDc+3
         Cfram/HBH6VxsUJR4fXaVx6tuVb0mTQ3Ckh/awo6BXoN8T6SfclDAYJTHGyr9U6m5i6z
         3PPf4peZr0wjSKr75KUlQZfyYbr5koPlR7seUX0vJkip6VjFq9U8aHEFCY92K+GZNTOP
         8dNcZ9Cz44IRf8zhICSkmtHpKHkxNSMA8/8tQ/6smIGeMorPmWK0QvWHlJK5xwmbq/ce
         X88oiNuYfAgp5uEReF9to8+0GNNkuJpCzP4NNpRzo2CJE2C+U4ZFvlWmEB2KUYZHGSNO
         C+HA==
X-Forwarded-Encrypted: i=1; AKwUvBzeVwDofuyAMA34VrBEDdneijqAT0H4gguBtmKxngzkJz3NmSwNwGZQ4ztAIdhsUPkqAXjly9i/SQZQRpk=@vger.kernel.org
X-Gm-Message-State: AFuF++mFc8HEH2RqVbIS1Mkz7WWw3XMstQ4tLiB1qcRRgLjlVPqmmUpc
	YVknLRFsArwe90jNgRi2NsdzKG1NWt1N8Gi6hVjvo8xJDDvmAAga+WzkaJgP9QUJqLyN2DlmA4q
	HtswNuZjFvw==
X-Gm-Gg: AYBFou1rgljkD46aEFvqqjjjbUxND3Sd5V2As2fQ254sUCluPIHVili0GatZtHdPzFO
	Ka+SAToe9jyzREVegy+XJLXwuI8P1f/UUfoaiWyPMqSLXNX3zOt1wtkZwchquRR4P0Ja62Gpdpg
	1cCTyCGWL2UdiZTyXq5eZN5b6lWivuimd6Vh6ImOOH9UFdtsHEwsVOexSTJZjkwhE8X8/7y4ncV
	1XdOWpNzbxCJPWYgw8kyRCq4czgm1QuHeKy8vHv4LT/vdFO85WDQ7XPOcM8rAzhI+6UAT1CLuB/
	WArurecWyCvx1ugzEVE5vjZ1MeVViGSisMe7t+yzls3KQglL9zAEzH2S8N6luap40VJiK7KiWEk
	iWFO3IdraUHiU00VdiNR++CRdj5pwckoK/uiXe7g6pmIEpvidOztbXFHCpreoycePNMcuYrnhKU
	2VjT93Im7E26IFJ8o4oawHUo+d1tzakMS/J+o+x2p8y5BlafVJb9PLtMjjNA1pZR9yUPdQGN8QS
	dcUuA+kl1vEoWYXni6GDzk72uIFaXUqoh0q6vYLjoihK1gRobM/VZE=
X-Received: by 2002:a05:6102:6212:10b0:7aa:f842:e3fe with SMTP id ada2fe7eead31-7aaf842e599mr3275105137.21.1790137205381;
        Tue, 22 Sep 2026 21:20:05 -0700 (PDT)
Received: from [100.96.0.25] (corp-190-12-36-222.uio.puntonet.ec. [190.12.36.222])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f053a418sm1839977e0c.13.2026.09.22.21.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 21:20:04 -0700 (PDT)
From: Ing. Alfonso Kuen Arroyo <gerencia@idkmanager.com>
To: hch@lst.de, sagi@grimberg.me, kch@nvidia.com
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 mlombard@arkamax.eu
Subject: [PATCH v2] nvmet-tcp: fix stale comment on NVMET_TCP_MAXH2CDATA
Date: Tue, 22 Sep 2026 23:20:03 -0500
Message-ID: <179013720383.9364.11263428288753603011@idkmanager.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

The constant is 0x400000, 4 MiB, but the comment next to it said 16M.
Use SZ_4M instead of a value and a comment that can drift out of sync
with each other, as suggested by Christoph Hellwig.

Noticed by Maurizio Lombardi while reviewing "nvmet-tcp: report a
bounded MDTS instead of "no limit"".

v2: use SZ_4M instead of the raw hex value + comment (Christoph
    Hellwig). The file did not pull in linux/sizes.h yet and had no
    other SZ_ user, so the include is added.

Signed-off-by: Alfonso Kuen
---
 drivers/nvme/target/tcp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/target/tcp.c b/drivers/nvme/target/tcp.c
index e598101..000000 100644
--- a/drivers/nvme/target/tcp.c
+++ b/drivers/nvme/target/tcp.c
@@ -18,12 +18,13 @@
 #include <net/handshake.h>
 #include <linux/inet.h>
 #include <linux/llist.h>
+#include <linux/sizes.h>
 #include <trace/events/sock.h>

 #include "nvmet.h"

 #define NVMET_TCP_DEF_INLINE_DATA_SIZE	(4 * PAGE_SIZE)
-#define NVMET_TCP_MAXH2CDATA		0x400000 /* 16M arbitrary limit */
+#define NVMET_TCP_MAXH2CDATA		SZ_4M
 #define NVMET_TCP_BACKLOG 128

 static int param_store_val(const char *str, int *val, int min, int max)
--
2.53.0
