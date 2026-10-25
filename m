Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792904601;
	b=jnDRuhbK1LhYrYUNtKFz8NGTPjxgoCBeqYmHa7x8YgBockEbpnKpfenIL6kc/gLxh7su
	 bPv6/jY/JKvAN9tKqhJgV6xviYzzR3YfHEoBlWZ6e1GSRa7j0A7h2iTvOlPEATF71aTLy
	 U6I9Te6CUNdEDfojsBE84mgsiVolHfPt1S3IQZQ1sKyd0Xv/8V03MdccF0TB5Rp76zqMV
	 akLATBfXrokZYwwnb7gm21NMdIEOXbBdEdqBB8A67Y/iQioHA8AwQpnb+CjTaZbwIgvn6
	 FPnsBF8+vxdXFiHGjekqkFL2hyaj4ZvvNxkbc9TeanWiDDxBJ/KNTU8fX+GhbmvzVXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792904601;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=TTqaQ6jXWlHRRGLaT8kFyXO3lEvorKEGuHWBDmHOqfE=;
	b=FycxF2wPSkAwRykrm1d87AFH9Mx1H6jxg+1hjRBLIz6nyPyqMnaNat5cAzAIIzCaZ4iz
	 JnJgE6nqZoGhoXcYyOGgja9uaHyThJQ0fUzNd3Ium9zSBT5QxgiFbOvsNHikYrDx2Vj3P
	 fZTxYn1PWjxkoP08ALl0DH3jq+zFolAPJJRntBlTrDn82gAWQfirtpiesu/rZ4q5m+DsP
	 J62rsxBxwoijpw22b7gYOelDAs86BbC47h3Z1sn8gzesLubN17umvS5MxT+s6mGDLaXBi
	 +i88ro6kSfWlEYeH9AAecrE3uLZZ337lvJAimIJjU60DqUcvXa1eutxyclN8NCkWRVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rQAKUtli;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CA5606A322
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 05:03:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63CA5606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rQAKUtli
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1846bc43c28so2118584c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 22:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792904600; x=1793509400; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TTqaQ6jXWlHRRGLaT8kFyXO3lEvorKEGuHWBDmHOqfE=;
        b=rQAKUtliJITBXwUGzzY7EU3EU8wlopChs94F3AdouTEhLusAIKPcGvWV41d3j2hcer
         o3uuXL+8B73uSppRrtT1YP8cI82mAGs151mM4rICjQ8ejH8JAD56vU7r0BJOAynh2VmD
         woQaqL/xvRddMuATZeTOjlCATZGReFVmVVOGY8Z8o3M0kzPD+S0YSTSR0iCRmIU6Ky22
         eD7kIHJE4dGYcVqmoJCyfpHrOAhz9Rz/8Gdo9iGJ/rQMF4C4o9hF9mlwOgir0gFNJ6Xp
         cXNthZ/SdYbhZepXs/KfUEboySxDTm8Xri7nwvJWDM1KBDqJvihCaz3X99J68crmJAqo
         +77w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792904600; x=1793509400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TTqaQ6jXWlHRRGLaT8kFyXO3lEvorKEGuHWBDmHOqfE=;
        b=uJKckW3eoykvV+UG1qR2V8+8tLKuamOMbGurBrJ4vnS2ToerhCrZoPq291QExuVL7v
         0YVgTwxWU2UgZoE2RuoMOKXIXZPRSeoSw/sPr0qvQX4EfVc5pDV0XSsydqkXmA8HxhVr
         XUuFvIcLD0EVr1jTgtJlqjcm52XbpTRUKojYwZpyxYlUh9q3wd0NQZeUXIQr+h+oSF31
         pRowJD1fNIdMkFPevE+5N9m1W/n3yBPUOL95rfgMsieukpquyLP180Co65Lz3B5JBFn9
         JXYfVT6AYQTod7fOja8N41y8PJ+Z3iL2Q8OeNN8TA4c4UPnGdXt6FVjU/bu/aSBQmk8E
         laAw==
X-Forwarded-Encrypted: i=1; AKwUvBxO7zNe78LbI+0uPTh9nipSU1k127ouMKT8+vFVd6PpcLXZTMoAr1iK3yq4AFfHS1sVMV19SmvF1dg0yj8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHHH9XuksWprt7zFZWiKd4sCbOEk+ZNpHi4YDmnRycL/m84dDd
	NohIhg7O18Jo3dz/JvZkXICVlTk5DTn9Gw3+Re0a2A5n3JSvAAF4bYNW
X-Gm-Gg: AYBFou3WpnxXPEupLzsvmIDhf/GeVR+357y4+J2DoHDrHJE21PYBPYrH7QsyFV5wCc0
	ITQ9+Sils2pgrHRvIKrWMZ+u+OPUty8w88MM5V8MYQKXxwiLrNEbpTRQ19B7bXLDUi6bKvTsnqz
	npSFPBgcA7n2b1f/c2xFGMsczFR0EsnnzAc70dm7Y+qQQg8KyOs7nLmS98zlShPbGrh6tLjQrlz
	4g2grB15zWIKFeiVQjzFmQbzfOr8P7qiDItTbIjoQjpkuo9qheUn7dqWr1XGo2zBTEvEa8xKCZK
	0f2oYByYyLSoX/0y8yVwwdG8+kLUDAacinTKKDW2kU3+VKVKZr+fuZXiw9FypJtShR6fKVEFCpF
	R9+q8OzjLSNzFimk+szn6rPYNrHzNmXxy6x5v2WgK9+E5QooQFQJrYuXfhrBU96hocXroNLXC2r
	VBXD7SYpZ7If1Q1JRO7y0lUBL+bXcez26fdq8REVgJIos9Qf7NBYyaypiPxljRyMHg7c99Cv/GR
	zCumCo0Dkwv4gKZlCG1PjunG3ArcpW5c2zCPhDKJRd3ol+QUcgY397Z8JbIp6rpY99jkpj/qcXM
	gFoQhiOktzCEhDGx+pLTsWuyD5I8m7rdnWz50rdXNeo=
X-Received: by 2002:a05:7022:2513:b0:196:7742:3928 with SMTP id a92af1059eb24-1991b420832mr7262785c88.0.1792904600247;
        Sat, 24 Oct 2026 22:03:20 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f44bd644sm4710287eec.15.2026.10.24.22.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 22:03:19 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 22:03:12 -0700
Subject: [PATCH v4 1/4] mfd: wm831x: Support software nodes for DCDC
 regulators
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-samsung-kp-v4-1-e21253295e68@gmail.com>
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
In-Reply-To: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Mark Brown <broonie@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: mfd@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Allow passing software nodes to wm831x DCDC regulators via PMIC platform
data. This is useful for non-DT/non-ACPI platforms that want to
associate device properties (like DVS GPIOs) with the regulator devices
using software nodes.

Add software node pointers to the PMIC platform data and have the MFD
core assign them to the buckv cells.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/mfd/wm831x-core.c        | 47 ++++++++++++++++++++++++++++++----------
 include/linux/mfd/wm831x/pdata.h |  2 ++
 2 files changed, 37 insertions(+), 12 deletions(-)

diff --git a/drivers/mfd/wm831x-core.c b/drivers/mfd/wm831x-core.c
index df8e76e000cc..c4793be419ba 100644
--- a/drivers/mfd/wm831x-core.c
+++ b/drivers/mfd/wm831x-core.c
@@ -14,6 +14,7 @@
 #include <linux/delay.h>
 #include <linux/mfd/core.h>
 #include <linux/slab.h>
+#include <linux/string.h>
 #include <linux/err.h>
 
 #include <linux/mfd/wm831x/core.h>
@@ -1449,6 +1450,32 @@ const struct of_device_id wm831x_of_match[] = {
 };
 EXPORT_SYMBOL_GPL(wm831x_of_match);
 
+static int wm831x_add_devices(struct wm831x *wm831x, int wm831x_num,
+			      const struct mfd_cell *cells, int num_cells)
+{
+	struct wm831x_pdata *pdata = &wm831x->pdata;
+	int i;
+
+	struct mfd_cell *local_cells __free(kfree) =
+		kmemdup_array(cells, num_cells, sizeof(*cells), GFP_KERNEL);
+	if (!local_cells)
+		return -ENOMEM;
+
+	for (i = 0; i < num_cells; i++) {
+		struct mfd_cell *cell = &local_cells[i];
+
+		if (strcmp(cell->name, "wm831x-buckv") == 0) {
+			int id = cell->id - 1;
+
+			if (id >= 0 && id < WM831X_MAX_DCDC)
+				cell->swnode = pdata->dcdc_swnodes[id];
+		}
+	}
+
+	return mfd_add_devices(wm831x->dev, wm831x_num, local_cells, num_cells,
+			       NULL, 0, NULL);
+}
+
 /*
  * Instantiate the generic non-control parts of the device.
  */
@@ -1620,15 +1647,13 @@ int wm831x_device_init(struct wm831x *wm831x, int irq)
 	/* The core device is up, instantiate the subdevices. */
 	switch (parent) {
 	case WM8310:
-		ret = mfd_add_devices(wm831x->dev, wm831x_num,
-				      wm8310_devs, ARRAY_SIZE(wm8310_devs),
-				      NULL, 0, NULL);
+		ret = wm831x_add_devices(wm831x, wm831x_num,
+					 wm8310_devs, ARRAY_SIZE(wm8310_devs));
 		break;
 
 	case WM8311:
-		ret = mfd_add_devices(wm831x->dev, wm831x_num,
-				      wm8311_devs, ARRAY_SIZE(wm8311_devs),
-				      NULL, 0, NULL);
+		ret = wm831x_add_devices(wm831x, wm831x_num,
+					 wm8311_devs, ARRAY_SIZE(wm8311_devs));
 		if (!pdata->disable_touch)
 			mfd_add_devices(wm831x->dev, wm831x_num,
 					touch_devs, ARRAY_SIZE(touch_devs),
@@ -1636,9 +1661,8 @@ int wm831x_device_init(struct wm831x *wm831x, int irq)
 		break;
 
 	case WM8312:
-		ret = mfd_add_devices(wm831x->dev, wm831x_num,
-				      wm8312_devs, ARRAY_SIZE(wm8312_devs),
-				      NULL, 0, NULL);
+		ret = wm831x_add_devices(wm831x, wm831x_num,
+					 wm8312_devs, ARRAY_SIZE(wm8312_devs));
 		if (!pdata->disable_touch)
 			mfd_add_devices(wm831x->dev, wm831x_num,
 					touch_devs, ARRAY_SIZE(touch_devs),
@@ -1649,9 +1673,8 @@ int wm831x_device_init(struct wm831x *wm831x, int irq)
 	case WM8321:
 	case WM8325:
 	case WM8326:
-		ret = mfd_add_devices(wm831x->dev, wm831x_num,
-				      wm8320_devs, ARRAY_SIZE(wm8320_devs),
-				      NULL, 0, NULL);
+		ret = wm831x_add_devices(wm831x, wm831x_num,
+					 wm8320_devs, ARRAY_SIZE(wm8320_devs));
 		break;
 
 	default:
diff --git a/include/linux/mfd/wm831x/pdata.h b/include/linux/mfd/wm831x/pdata.h
index 75aa94dadf1c..d5d9d9600756 100644
--- a/include/linux/mfd/wm831x/pdata.h
+++ b/include/linux/mfd/wm831x/pdata.h
@@ -12,6 +12,7 @@
 
 struct wm831x;
 struct regulator_init_data;
+struct software_node;
 
 struct wm831x_backlight_pdata {
 	int isink;     /** ISINK to use, 1 or 2 */
@@ -132,6 +133,7 @@ struct wm831x_pdata {
 	struct wm831x_status_pdata *status[WM831X_MAX_STATUS];
 	/** DCDC1 = 0 and so on */
 	struct regulator_init_data *dcdc[WM831X_MAX_DCDC];
+	const struct software_node *dcdc_swnodes[WM831X_MAX_DCDC];
 	/** EPE1 = 0 and so on */
 	struct regulator_init_data *epe[WM831X_MAX_EPE];
 	/** LDO1 = 0 and so on */

-- 
2.56.0.257.gf7497c7d27-goog

