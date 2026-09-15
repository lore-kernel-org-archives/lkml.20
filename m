Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28AF364052
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789445271; cv=none; b=rUwhuCEu9C9bmDULnk1aWaIr5x+ZMma3PR+bZptrPg/nWNBOOj+Wk2s+7spw6OQoJbBHNtLtoalc6xXI+dKsE+y5/ZK+2bch6sEMMLHHhXVKGYqXghd1WUGTD1RoFOZ3f1Kh4IPgbykDtOWdmfyjIHOKR+tiBMip6c/icVVZYyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789445271; c=relaxed/simple;
	bh=cKIa06wIrW0ac3Zj9WiXKI6LjS+pD0AlCBrNRRwWLsY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ALhk2ylSj8E7J+g0OKxGodkeVExbrs03vihW5YJxkIJuVA04hmTapdi/arffQ4G0bHi8L7Rn/9OYaa7l8AXJB79ZS3kwX/ua7LihjwRKlrwSORtprleDQtFzMH0rA01oQ3eEKzvp5ISQB20hOgZLUchAJpgW8jDboOq00Mq6PzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lr5C/36V; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lr5C/36V"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5c9649f1fcaso2707066e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 21:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789445269; x=1790050069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xladwkSFDEGqZk+H5BcCxNk/qet3/6nEXAvoznyM27E=;
        b=Lr5C/36VxfQsM4vZANjYl9FOB/gDNyHqLl/hK67DU/KuANB/42kFCj32+IQsPdhPpH
         3fTQv7/hgHuYUG1rvILll0Y+v9K8/ypVTfpsz13Yr1MvwaQ5fpwsdSNR18V6WZSzLOH3
         u06tWR4sVSode4bpbwRKKwWwB1NPHmrHtfXTWpCmUr/k5LVLvbgNY+cRDuIFFLq+DRar
         RKbL08B+AxCNokGwddryZg1BOnHtflbs3Cvd0h2CCXMqxG54kuRX0jVEWGhGMX5Mon5q
         27qt+W9vQ2+rDKliOxOJo7WdKxeAZJenUx5EJ9fH2cgEg3KbSqfXYYzL7eguwOUpLg4i
         oTrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789445269; x=1790050069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xladwkSFDEGqZk+H5BcCxNk/qet3/6nEXAvoznyM27E=;
        b=yDOfYYVYGuGk9vdenqz9f9g3vwAaCmH6JI4PVFqe+5pDjKL1bfKlteBucqPfwxi6mM
         hj/8GZjVKDqdi3qMwPMGrYahqGojrBVR9EJ8oaj5l4HMkhdKcYAhsE9mFxro9nEev7/4
         NZJwWC/+Z1wOi7T/6BRKpAcee8SW/krcOiU1ZfWeDF4rKC02arm3tL0hxfMEh+4bS/gE
         rdSjLxcO2lskyf8BGAaONUNuNzLe82w8g8L94JKIu+UlHq7ul0D4ZF4T804Vs7beFf5D
         hHLVuJrK7BX6L9RVqx+P3rwebxcL0EL1DK2ZSrQMevNypCG5zjyEnZW3kQBGgJ7xm/n2
         hp6A==
X-Forwarded-Encrypted: i=1; AKwUvBzWOuRifLwtV/5kCFDnvfYseKz2ytAD2nSBf9/TqpdjnLgE1guFkvQwMdQBL78NeSpKFfEp8W/uU2h+bos=@vger.kernel.org
X-Gm-Message-State: AFuF++n9ONXuFzjgHTD4GBmHKFKBC54ByFEof35fZ6IPWgjCzs2sRZdq
	T61JM05iTLKfLH0iCzkV3Dxko7mNaKG66RMrBAUUb/4zYm4flxyfy+NgWPLNdVS5Lj1qnA==
X-Gm-Gg: AYBFou279xlnAtOsbK+GnhhyB9/3QENMCHXIzELA6c5aDQ2+Drtw/MFR3zvyY+hSDgk
	keePnxa0lD3Nz1CWmYtFlEO0MoewgvOZw+xB46Tkdomew8Uqshr5i9GgsBXZCLQ5D08w21/d/py
	vugdguZiq0Mq2vyHyOVjsutW5AXGPPhTIAtrzhLpogktPIfdupz0aYRgdr6Z8s9X7knPz5wyrOA
	uy+xiGBsvmdIm5xo5BReVehES95yHfDHWV/33o5b4wHt0odQmPBck3jIKcRUpeap0f4+RhjUY5O
	I5XiXXVnhusLRXMrOWj73R2tcdLLCHCaSKn0aJZj3dsDCZcn1GO0zlxuoDNb0sN5oGFoKwJTNql
	h7kY9SwiKDfOSdg4GEloHreNvJ5MPKve0L72RQC0nGRXaLA9C4iFrbEIMvm4r+GU3oVeJYjs2ti
	YHbzGM9f6iKXaIBufBCw2pteJvs2ddFHGqcptAukupM+G8N7FEomMWAE77JWdPALI3
X-Received: by 2002:a05:6122:21a9:b0:5c2:c0b2:9880 with SMTP id 71dfb90a1353d-5c981adc33fmr6838000e0c.1.1789445268666;
        Mon, 14 Sep 2026 21:07:48 -0700 (PDT)
Received: from beelink.. ([187.13.206.89])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c8470d78casm13754001e0c.7.2026.09.14.21.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 21:07:48 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>,
	Bingquan Chen <patzilla007@gmail.com>
Subject: [PATCH] usb: gadget: configfs: zero-terminate Unicode property data
Date: Tue, 15 Sep 2026 01:07:25 -0300
Message-ID: <20260915040725.2421387-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unicode extended properties account for a trailing UTF-16 NUL in
data_len.  The show and descriptor paths consequently consume one more
source byte than ext_prop_data_store() allocates, exposing the byte
immediately after the allocation.

Allocate an additional zeroed byte for the source string.  This preserves
the descriptor length, supplies the terminator expected by both consumers,
and prevents the one-byte out-of-bounds read.

Fixes: 7419485f197c ("usb: gadget: configfs: OS Extended Properties descriptors support")
Reported-by: Bingquan Chen <patzilla007@gmail.com>
Link: https://lore.kernel.org/all/20260421141010.5607-1-patzilla007@gmail.com/
Cc: stable@vger.kernel.org
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
 drivers/usb/gadget/configfs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 183a25f65a..2041b97ffd 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -1351,9 +1351,10 @@ static ssize_t ext_prop_data_store(struct config_item *item,
 
 	if (page[len - 1] == '\n' || page[len - 1] == '\0')
 		--len;
-	new_data = kmemdup(page, len, GFP_KERNEL);
+	new_data = kzalloc(len + 1, GFP_KERNEL);
 	if (!new_data)
 		return -ENOMEM;
+	memcpy(new_data, page, len);
 
 	if (desc->opts_mutex)
 		mutex_lock(desc->opts_mutex);
-- 
2.43.0

