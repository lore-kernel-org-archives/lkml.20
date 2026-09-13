Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC46B1F0E34
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 01:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789263824; cv=none; b=ifrjbx/Lkn9z8E4CAw7Tfi5pQ9gvDLpxIljLbmeMa4mQE/gFmZm1PXIwORPyqUgqL8BA/3ZsoHfXI3STv2dY5xfxxE03ZrWj0dk/WKsBHrjENrQLIgp+WlK04bpxMxXPMQmkhaxTTsRewm9I9NEY2VOf4XFpD61DOR9QqeNp/Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789263824; c=relaxed/simple;
	bh=xbqmWE7TjVXjZipAzoB6FiWnOv6WAhfUg92RHYzDPuk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LW9pvKJm2Z1P6oc04+X5d2ILRhkbFsa0mxPqoeIw3EvDDHAVKUIGZOZJnq4EReRr8xYvPDAFDbfi8ri+p2kb7idw30M/+E0mXkvxSdvFX/FAnyTGGgfxsV5wzNsoI1i4kE9WW3cAqLSHZyX5cAbWx0dQdAWAA+mgexadnsMwohA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LV1702K3; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LV1702K3"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-530e2f50d01so11465001cf.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 18:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789263822; x=1789868622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iZgRUJgrir4HbmBZI5QyozVncxVzl2w6YsVJNS43te0=;
        b=LV1702K31p9vOXXy4tMlpZ17y2Ok8J6yKTTmvV7uishbEAxzinjkbXFqK/m55hR2nG
         SV23I2+vuHaRJ+6yRl0H8aUSY9AjU0y7gR5LP49lQxwVcf1wWtOxVC/DuGOURyYlfsbw
         TTzhgweGhF2Vp2glF5bgAdiitoj0LWRyitc04pBmzIXdSpiI7Wc85MroXtmZiJgFwu0x
         ZDQLYESd2G/vfTgzIajFGV22FXwpnZ1OifvHfHRTuF3sKOwTbhQLGv2LA63ScC3y5JPp
         9kbMXSv34k8FzayiVrZJYG56c82QZgittsZBBE0JlFL5gnw5wX43EoEddIUJYGGmyZET
         XJAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789263822; x=1789868622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iZgRUJgrir4HbmBZI5QyozVncxVzl2w6YsVJNS43te0=;
        b=fwzdFImAt6d864lLrra/PFbncP8BfV8nsbD8YfAPXGCBdGG+ork+MUEffxjdeQUFdG
         DJuaiTpcdqZ1QyCkuiCrWXRClUDJB1EOpZRgMtoSiUPxYzpOS8g2d+XnEj6LEhLlsIUC
         2/yd3zGCC0XQY0uapC25YrCGOTAQeIPe+xBzQjWnp37xa9tuygkSwQasDIRVlnXzhFw9
         UWBa7x+mecBdJSvMbNRt5wCePKEM+opIFJCdKs1+64dkRAnhjr78oWZ6GN0u02PYEHnx
         TqkC1zSVP5tfHIAFuCTY+OoGM/AxxWjmh/dBz705ytsAsOIjG2k7uZCMWzpw34w3VeYy
         z2+A==
X-Forwarded-Encrypted: i=1; AKwUvBx+Hg983AoyZw0wnXDOzre1hDnyB8y38WMfCqoswF3ZJ6Kv27+RUBka0rMi73etGkBBWInlGK7H8alFSWI=@vger.kernel.org
X-Gm-Message-State: AFuF++lTi/NGhFbapEiyTAusAkLMmxRadVKOU+1+tSjZDxbYJ2s0TwTO
	Z8L4RQ6WCYlURuL5a3huMECMjjZ/HtKOGgndJm1VvDXtVd4redRx/ys=
X-Gm-Gg: AYBFou1GXq1f5DaydCtIpHKle9wQuf5y/+bL71OwKWqtUgDSWEUk+DHoKwjYhnSRiDY
	we3a4hnTEqoFKTJK9W0J9MCPUao0jqzWCl2IVTNlkfvZziL65F++W4nEpzJWPbAJa3SuhMrOuJf
	lH17oE2fLVnGVDaGbY468njtOcrXjBJSIATnjzFxphavrwIJBx3SQxZpO4AZa2EQGxc4o4xKAMP
	lyzbNaQRIemZlMMxydRhoyPOxrZvRu/Xh0V/2LXRGTIyCJLmjIJUR7bVVTUS7RrA+IchClGhtYp
	yJgMNON9n9qPNlWaunBx0hrKqjEBQHoA5Iuz1KGddyEYneirrqSzob2ogHro8/N34P/LrhMqIUn
	lIlAb/UnXXqabIfCupY1sWEdRgewlhYPR7LKgIyecDR89F/463viupXJsUJa1I+LoUJC8xaRs8D
	iu2PlXOx+4S/k5QEDKgfi6I6KOgyR6WTxrJTCTsiuvsHGKmACk7Q8j++Yddt65dv3JSWo3Ya6r4
	YhqxgVmKKRMLuk/5FzqPW7gne9IpttWRr9+CH505d3Xit+2BSMctlhKV0MDYM7aLmsmNXJRwUtD
	LeTfyBqUJO99TS8Uc1urnZTofvqNwrgghg==
X-Received: by 2002:a05:622a:138c:b0:530:fc42:f4bf with SMTP id d75a77b69052e-530fc42f6fbmr4960731cf.24.1789263821700;
        Sat, 12 Sep 2026 18:43:41 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca45b61dsm59685581cf.6.2026.09.12.18.43.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 18:43:41 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Jacopo Mondi <jacopo@jmondi.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Akinobu Mita <akinobu.mita@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] media: i2c: ov772x: power off sensor on ID read errors
Date: Sat, 12 Sep 2026 21:43:35 -0400
Message-ID: <20260913014335.37568-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ov772x_video_probe() powers on the sensor before reading the product and
manufacturer IDs. Since the register read error checks were added, any read
failure returns directly and leaves the clock enabled and the powerdown
GPIO asserted.

Route those failures through the existing power-off path. This covers the
old OV7720 and OV7725 sensors while preserving the direct return when
power-on itself fails, the product-ID mismatch path, and control setup
behavior.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 30f3b17eaf49 ("media: ov772x: add checks for register read errors")
Cc: stable@vger.kernel.org
Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/i2c/ov772x.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
index be3ba284ee..e20a109d60 100644
--- a/drivers/media/i2c/ov772x.c
+++ b/drivers/media/i2c/ov772x.c
@@ -1280,10 +1280,10 @@ static int ov772x_video_probe(struct ov772x_priv *priv)
 	/* Check and show product ID and manufacturer ID. */
 	ret = regmap_read(priv->regmap, PID, &pid);
 	if (ret < 0)
-		return ret;
+		goto done;
 	ret = regmap_read(priv->regmap, VER, &ver);
 	if (ret < 0)
-		return ret;
+		goto done;
 
 	switch (VERSION(pid, ver)) {
 	case OV7720:
@@ -1301,10 +1301,10 @@ static int ov772x_video_probe(struct ov772x_priv *priv)
 
 	ret = regmap_read(priv->regmap, MIDH, &midh);
 	if (ret < 0)
-		return ret;
+		goto done;
 	ret = regmap_read(priv->regmap, MIDL, &midl);
 	if (ret < 0)
-		return ret;
+		goto done;
 
 	dev_info(&client->dev,
 		 "%s Product ID %0x:%0x Manufacturer ID %x:%x\n",
-- 
2.47.1

