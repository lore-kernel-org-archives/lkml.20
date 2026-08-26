Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF35142589C
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787752445; cv=none; b=N3drqU0XEDLegz46hhzODoZt1uFixJM9OQ5ql8ASs9YfCsxjTlTvnUk4ohXpOXaJndmSt2W1VTni/AKWw3V4DX3wko4HalFJq+azqT7Ur+JOruPn7VHDeCmFivnWVzhTHBpsjX5lTdJhjhgrZYUToI1W+vP3k1mOvfGSg0CIj2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787752445; c=relaxed/simple;
	bh=8rTH+kcGVVWC4O9UYd+nHgJzRkDuUmS9WFz7klp3z7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MDdfTBTY2gQT2X2JDeKJoSK/hQcsb9MQw6qNuejaePDqG/5G0aVhfWyJMPKrKxr6DnMttahxv7kZRLYQ8zuWUYXjqQV7bhxkqd5VJBGQPYoPbJBQQ559pkvD8UR30qgbUjHhzMzwGtQh9J0Zmsenl3JUpssibHGReLquHgQkmAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eyNITQnS; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eyNITQnS"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-482e4998d28so378706f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787752436; x=1788357236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KEVG8kAFLJoKx+jDc12PPtT6k0cGqduvqfafakCoXeE=;
        b=eyNITQnSuYoDtewnJW8wIH7JJk+f2FayOBNMqG1PV3+/nWIGobSSA5rNxl9uvAx5LC
         8JgOH9qTe6EiDF2AnrJmUaLJtaMiBN1P+LUARybeUmvmlpyA6TWVleEnO1JyyyRNnmyi
         yCn8j7a5eqEsepbeLOjqJkFkueJfXSEb4FkWQC/i+93z7tJGMs558yNg3ABwQ/l1T8uy
         zEpOVMOgB82Wbm0ve/zIzBP8j9U8N0HmT7IPQoZpPt0SLiIm4wXe/QuG2I+ATEtdAtJD
         tnaSJ+ejI1sq2GPY24YFK3nhytTTep72/mmk+SeeVTyiOPwqWV05BQlPBENIvdfPumcZ
         yxsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787752436; x=1788357236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KEVG8kAFLJoKx+jDc12PPtT6k0cGqduvqfafakCoXeE=;
        b=A0GlvX38e7figfJ4QikciZrVFKYpoA4M3LAskeZYLstTXvPcPCXx6alu8xBve5AHz2
         iWWhkT6915mmegENMJu88N4/ieX1nbex5QMDgZuWhfz5GC878sLRahp3M5mhcv2ucFYI
         sgdGonNAUs0R7Salxir+cefCPvSuZ0R6VM7OdwvTfDzZ+5gIFMJ7yRZ0PYfBlP15Zhx4
         Zcu0wZ605QkenJrgWzLR7yazOPe7xhUYf2lHZG8u0m5k6sA+MmFWE+F0WGvXwUdq+kRl
         RR0gyFwSIif4QMpslfhtVwCS8Kvsb90z8p8oPw/VoRfpmii5lOuDmKmsMacyRTxiXyJR
         r6+g==
X-Forwarded-Encrypted: i=1; AHgh+Rr9Glsmp+xROY67OhDWs7f4U0Hxrc8i4ANT2D6mxUItKT2X35bjqv8khwzq1/+c88VA3bJ6j1ZSzIwqaWA=@vger.kernel.org
X-Gm-Message-State: AFuF++ktpCOCIKQl/oYJlrYp3eEPFjRBiJVb2oBn0Njjr+lWKi4IYXIw
	MZemTuh68SBd8wP7/y2LZuNylypyFfZmeZCTGDJi3Zz+kVgcJ5nrhDNrsKG/1cZywRM=
X-Gm-Gg: AR+sD104dubmBaE11GhJ+O6fww5DfpAx/ztzHnin0MMnvTC2/P2SZwPcy4mr6ZQkD8h
	GyV8U6vVcWK9zEjb3l2nEJf+HjPjVTSVI4RCrwxKiXGWkpFgw22uapctg38IzBmUwFIkTgp8tE8
	/t0hkbNnhpuD4JjGyvlHMC1zQAvxg+DJEYmfZVE58nugCxJt7iUBs68UGQ+3Cu3jMhEbgGMS9S4
	+FOpx2C3wOIuiaaY+CrPYNUxhcCPH0bBbxJb7So1VHdX/ob5XAil75Mjb6uWhpOxM0G/xtp2w5o
	QL7T/iFvQbe723aold52Is09o9kKJNr3TaoLP11IuK/9DatPB96CuruqG3bVeUtlrxq4HIOtAo5
	hjFRvaRwe8qhdflNghHdHn33dERnQhP6i40y5cuDv4nn5Oxkrvi6Luu3FtsAaeGc8Qbr23mu/DZ
	CLK0ISERMoz9YcrDGpFr3RW+ka9sMgcIbczN6XXcW3rEDVnYJRGeDH+/0OqbkGvr4IGBsAj644r
	e0wwdw9vrFcUpxW/wLD5XIby+jSJQ==
X-Received: by 2002:a05:6000:2c09:b0:482:ea47:4488 with SMTP id ffacd0b85a97d-482ea47452dmr482725f8f.8.1787752436403;
        Wed, 26 Aug 2026 06:53:56 -0700 (PDT)
Received: from MacBookPro.lan ([2001:861:3dd1:ccb0:7ca4:98b:a443:98d8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e279eef5sm2845154f8f.1.2026.08.26.06.53.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 26 Aug 2026 06:53:55 -0700 (PDT)
From: Elouan Da Costa Peixoto <elouandacostapeixoto@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Elouan Da Costa Peixoto <elouandacostapeixoto@gmail.com>
Subject: [v2] media: ngene: Remove all unused headers in the ngene-i2c.c files.
Date: Wed, 26 Aug 2026 15:53:51 +0200
Message-ID: <20260826135351.7473-1-elouandacostapeixoto@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check all headers individualy to see if the driver compiled.
Check if some symbols from those headers where used directly by the file
using grep.
Use the script scripts/checkincludes.pl

Signed-off-by: Elouan Da Costa Peixoto <elouandacostapeixoto@gmail.com>
---
 drivers/media/pci/ngene/ngene-i2c.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/media/pci/ngene/ngene-i2c.c b/drivers/media/pci/ngene/ngene-i2c.c
index 2e9e9774dc6f..038bab38db36 100644
--- a/drivers/media/pci/ngene/ngene-i2c.c
+++ b/drivers/media/pci/ngene/ngene-i2c.c
@@ -10,21 +10,6 @@
  *                         support for new dual DVB-S2 card prototype
  */
 
-/* FIXME - some of these can probably be removed */
-#include <linux/module.h>
-#include <linux/init.h>
-#include <linux/delay.h>
-#include <linux/slab.h>
-#include <linux/poll.h>
-#include <linux/io.h>
-#include <asm/div64.h>
-#include <linux/pci.h>
-#include <linux/pci_ids.h>
-#include <linux/timer.h>
-#include <linux/byteorder/generic.h>
-#include <linux/firmware.h>
-#include <linux/vmalloc.h>
-
 #include "ngene.h"
 
 /* Firmware command for i2c operations */

base-commit: 45c13f3f9e3bb15fd89ff2864c6f627a3b4b4229
-- 
2.55.0

