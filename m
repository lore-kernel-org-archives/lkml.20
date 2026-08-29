Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B083955C9
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 16:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788020771; cv=none; b=S1mHSrpEYXdxXyN6aGF0hPjhk1yqJM1zc8cIJXPgusG2Tze3my4OheKtZO22VFGjLTzRWaUvhzXQz7G8AnF7cX3yz/WC28tvbGsrqaw38JzuYNWlKi52y8Gre/TRNqPKzBeRR6TQ2wZ3ek+6Zzm2LUe+KjzY9twpAsop7ih5+rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788020771; c=relaxed/simple;
	bh=jW53cz7kjVnoXurd4I3ohM3xctyABDVxUF7y45R7I8I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sg/ZLHQdM0lq7Clr9RepP5TaPQi2RVpRS3z+of/9I95SWyacpWaoetz495qwoLwn3inE8asGl/SsVhixQ7y1+mmNoamRSjma+NfSCbPNGqJH6+4UIT3BfKPKB68oX+AA4tXlYvfZQen8dIuf2+JEqz+WIAPI2UTEAbM0Ax0ZAgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PW1BKHt/; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PW1BKHt/"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-495590dde14so18923115e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 09:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788020767; x=1788625567; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w5xGBgSpjI6ilIuBwW9NQ1zMvUmD0ICcrq8TK/D9+gk=;
        b=PW1BKHt/BQIFdUZ0IEIgH2T+rDrVAiifzaCSL+Sr8BtlYQ58+QmLXsEPG4Cv0ht+jA
         Mvm+Crh/LSanbQxkb1hGNhMTaKPQp3jverAcALoWEVT6Vf/Un3ueUwYuuij8o7GxBQCm
         sijmQ5ZBKJfUcjB+/ao5tkpn7BYqEJdTU6niTrvpBRzbvR3P9i3vAku5uLShRLwKkyfz
         T2+/xKOplQoqnkq4V8Ypi9hWWDbKqFzM2v0x73aGcWj9a/jveQhrho/6oEvdGll/Mdn8
         uMkYK1hwZ1qb8nM3TcFfF5Koneq5R+dc781pUcYsSy7RMXAVth1bYDvkxfp1VtgNS06k
         OnLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788020767; x=1788625567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w5xGBgSpjI6ilIuBwW9NQ1zMvUmD0ICcrq8TK/D9+gk=;
        b=mSaHW5bR6qvhH+mS7UCXLHz84oeUI309GUxOuDwcitrAIDE0LQTK6/TdfIHsW+CVSm
         n6svp4ChYG/rlVGRTgOgV+YH3/L8pXPdgOciJffY7FEWp9b0oyZmBfNsVYAs2w1gUm3Q
         CzbUbG77x/d7q3lTFzyV4hFpERo2F/7/qHKog2aOdUkoTpUGEYBHiJbGW68gyzLCe5qZ
         gHns7cVShTYsbk7tiL6qLbVW4c3cyi2ppKwVu0Yy+KnK2vAJiw44YkP37eplg8Xq3gzw
         NlV4rxqJogEdQIpzs6t4XOGNtY3uMl24CneV9UqLOZPFv3fYn+oSolUIxgY2RJGSajdc
         bZXQ==
X-Forwarded-Encrypted: i=1; AHgh+RqENschmIYwBHEfTHZrEDGttnqbn828a0BwQIdFOzOD444lpAnLpWwqZlTHgjX5t1AvuQgtFoycOVGNkXg=@vger.kernel.org
X-Gm-Message-State: AFuF++kl3PxdiHMs1ej2dROk8LUDG6Edl1vx039K77nV3JG1NwwT0rcD
	5teJ+4E3OYrajRDn1ro1GFyCzRrJMnw6jXneap/ofwitv0Yi+bu2unIQ
X-Gm-Gg: AR+sD10T33tYkkYIr/gCCG/XURSWpxfI1RGOthmPL8K8nH07N6/rhP8Q1ZeLxVriFKp
	R6asDzYFHZ1N4jOrHFYgIDGbhgAVbM6pZdTyS/0RbhHIhtv9S/Hx8XVReerbq32mt9uuAxR4wak
	r5V/36X811qwJ3iFFbvh3FixH7jqU/MjgAyM60Xv0bm+0hZHa06dDrFpEzHoduoDihdY7lwy/0g
	OcJSGgtnY+PFkZDvacj1GTHUFlmBbwAgutCShKbLsYrwC+15zrdPhyP9JRjCZaS/JhEjuXCZ1C2
	yoXvFW56FwTkmIHWjGm7iZTVvW6MuU9ODqIUfg2ehmv/nAUcGJmJTSD0B1XuadpFoydNbKlrRzM
	gSP4pqarX6ghEBkLXlGXl7XUERNHsgQUOMzNBokfBrs3QGXPB5jFO0QSsQfc4rvToTAfoSDP25k
	ZcsEoisokbxrZJW+njUbCii8+k3B+CAIeWAeMRyWQjx5lQFouFgL/w9UW8aw6c2UQLHp1vHAPsj
	B2w11fdhKeZ9RGZaouINl//ZpwSV9msHal9oHzddNEc3ZtKCQCkXmkU0PqC4AHHUOsvaLflQ8ET
	xJLSxpQjx2oDPrrh0rbHci7vS1Ko5UmgiafNEjU53pjYgkO37UOON2fgqi4ZBu0nYmoeTxhj3C8
	wKrw76seQs/FhxzYOaZrW+9bE
X-Received: by 2002:a05:600c:3f0b:b0:49b:9105:cdaf with SMTP id 5b1f17b1804b1-49b91c30753mr238882735e9.8.1788020766759;
        Sat, 29 Aug 2026 09:26:06 -0700 (PDT)
Received: from [192.168.1.187] ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b92679be5sm137861705e9.3.2026.08.29.09.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 09:26:06 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Sat, 29 Aug 2026 18:25:59 +0200
Subject: [PATCH v2 02/11] iio: temperature: ltc2983: reorder headers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260829-kernel-header-removal-v2-2-c67739d5dedf@gmail.com>
References: <20260829-kernel-header-removal-v2-0-c67739d5dedf@gmail.com>
In-Reply-To: <20260829-kernel-header-removal-v2-0-c67739d5dedf@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Crt Mori <cmo@melexis.com>, 
 Puranjay Mohan <puranjay@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joshua Crofts <joshua.crofts1@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788020764; l=1026;
 i=joshua.crofts1@gmail.com; s=20260530; h=from:subject:message-id;
 bh=jW53cz7kjVnoXurd4I3ohM3xctyABDVxUF7y45R7I8I=;
 b=vRKc/P6bsoTAgoKVduQrnTAL4h9aFwVkauDZfyddLxMN6RSmFItdItNOPs8U8rHKg+72G62rX
 eEKDnvXoETwCdvmQXYipeA9lkZM7KiPckvlDPXTAWmNTbBuIQWo9pGM
X-Developer-Key: i=joshua.crofts1@gmail.com; a=ed25519;
 pk=RTDOoVwgeL4oFdASj9U+cxJuIjXuXk73zkjnGOJKbEo=

Separate the IIO specific header and group unaligned.h with the other
generic <linux/*> headers.

No functional change.

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/iio/temperature/ltc2983.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/temperature/ltc2983.c b/drivers/iio/temperature/ltc2983.c
index 6efb5252a773..fe9eec3058d4 100644
--- a/drivers/iio/temperature/ltc2983.c
+++ b/drivers/iio/temperature/ltc2983.c
@@ -11,7 +11,6 @@
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/kernel.h>
-#include <linux/iio/iio.h>
 #include <linux/interrupt.h>
 #include <linux/list.h>
 #include <linux/module.h>
@@ -19,9 +18,11 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/spi/spi.h>
+#include <linux/unaligned.h>
 
 #include <asm/byteorder.h>
-#include <linux/unaligned.h>
+
+#include <linux/iio/iio.h>
 
 /* register map */
 #define LTC2983_STATUS_REG			0x0000

-- 
2.55.0

