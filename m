Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792547411;
	b=BdhtFALW+LzWiMKcqaqmfl+fwsprFuXGsTvzPyr3WhrAd7/1Cf68rTFfx09Csfrx7vXa
	 flyyAslcHi2mO7RwfxIXELalBz7NwIh/xTOnzYV6xRSQVOqNxypGRoJQt5J7CynCVMqyK
	 uJforHFyyKd5BbS/vA+E4WzAVFDhFiAFSfmyqXBS29njPfUl0uitdp98/AuwqurBmek3s
	 CQFaOT7w1bXJaQmdsVMWsul3yfMagNMVhtJsjZP8SI1Nj5QGG+x91KkjYfWu4KQXUAkR3
	 FXb0D2Xcn+6Z18cgmIvhcUDjTx1H+pz//HQjVPEs0uTzVZe+u/2eq+kdR8FycmqC1Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792547411;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8S8G1iypOEwISrWzMI82hOYxhksLEVMBHWgiqS8i/aU=;
	b=qAcS4itwnnA1LQ34Jz1QBvElHjBDyGtZjvYDFZGA3DjmTHeysqRa716vo1s7hpqyzCBA
	 eLLjDh++bYPeY1kqNZ6d31ETvyp8bBdTnz7s4L+FLBIcJy0W+xhptpv2cnmRaxwAcxSTb
	 dRLN4KCpJBy/EQ5v8VO16P00x0VjeNHARwszxdA5GBs89ZonUSAvN6cj84Zpv4IfYl88Z
	 uPAuW97vKODC6d5qO0ZyCNjFkvJxaqUpuEwT/hAGzLb3Pqb2UAdZoCDzw8lTnh1Bp0bD+
	 KHaRa9zZZn5kXBfPw1E888yG88vTQnhlSqHy9DtUs9YPrevNeIcRtujobcJeOdef2QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="dG2eif/P";
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3000C606A322
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:50:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3000C606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dG2eif/P
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so364995eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792547410; x=1793152210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8S8G1iypOEwISrWzMI82hOYxhksLEVMBHWgiqS8i/aU=;
        b=dG2eif/PE7Ui9zyAOSwP0CDj3gTDChftpWOLIMVBFAHqrylKJJyHltQOFo/8SyoEUj
         QMdPrFlEMOerAJr9CNjLvczwXC0kX1CMjE9O5vSIEDUVbaKKYnvdUsU/c3WtLzktyWaI
         /RC4ylzNcpFSy8xwt2ijyFqgn/NXmKHv+VmqKEKuO+wQTbtAhAleZavEc+LCQS6qLaPB
         BbwkyOt97+Tw8UyVJv8aEwIiq8ZQE4WochqLMFY0PdDnFeNRbsHZADj5OG7zrXoGJLhD
         Qvz0S+wsJfFL0XzjBzYAM9QW7ExW44IE+LzxMyKdm5yZtiO8tYgYr71t39Ske+rTScAj
         Uqaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792547410; x=1793152210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8S8G1iypOEwISrWzMI82hOYxhksLEVMBHWgiqS8i/aU=;
        b=K4/u6Q3fQe5O+4Ji/woV04VtHCQ7hGwaSat2Er/rgMQXDoY/d3gbLYO7q0z58HXpfZ
         Ztbd+qlx1vpaVbC8OFZl/Aqcaq7iQe57uMCNZOe1JG80lve1TTaWD/Aa8m8TSO2M2GrP
         r2x+6H4152OriKUaeoP15a6/gw8A/uoQxhW4w2JvV9l+ydXH5/5PhXdv91Jox2j7ZTP5
         S7E1nC57r2fOiSzIVgURFMJNWjQYkDBahveWWOVsKoFyevJLwyk7RAYTeHLkLNLh+RGl
         6TthpDOwrfnNyQCOVSLprblV1Wl6YiOc/9DJ8/Hmgs64mFHrQN4QcNsnJLyPLpPQZKj3
         f+yw==
X-Forwarded-Encrypted: i=1; AKwUvBw6BzF1bP7//l8fRDkfrZA/mfhD8hGbXvIJV7eY6MWOAuvj7P1ynsjqlUVu1t1Y1/R15aPaa+YkOR0iMKQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJW8pH0UpRHHCm5/h07LNN+PIaGww/SiCfIV0oWnPA99/l/heqT
	jbU1sX6FdaA9xw7t5iR8uXGMvQ1fgJgZJtw8BWxiyKuWso081o2r2Bpu
X-Gm-Gg: AYBFou3wyJS5tzkot5MjErXQ332RQ/AUOq+UNFPQkRTi6j16m44eSL3CbOGZDvAzu3Q
	EZK9GuKjSVcGdy8Cj2oUGZAmGgxc/38HbZFCWwPhhh0EooIwj73f+ivpnMppmpwOC1HtuyTLrcf
	EtrE8tTU/TJEkXxWtdxKD8qlolsv7NgRTWFnJXqqai4fppUFlpwqd46NAIH9ee67H8mQ+WfUC7X
	rasqijIonvk7F2i4JoSLCN4GqismNRyNbgrWIYB+qaowUL8oGum8lL1jNUcjCp0urfYvR3fV7SD
	NJ998Tia1QKmWB9S9+lETy8kheeJWCC1tU1yhhg/4OqbSe+rIl5pCIHA1Rr766IFZxE0tlZLA91
	qAJE9TYbj6S9gdEb7XCGQ7d7VCeXaadELk6WuM7kaPn1Qz6uvOB3Sxor7rE2FHk7CFvnl8lxizU
	zoAgDWRKZjTNA8PXM+cMCgdeuhXHsB4w9isFnXufPtYjcux2ijzdBTIbvREXnLvJ5YilkgoaWO5
	wHg2zIRRt6e2PJLmeaY2ChngkvmZTpMOsy7nHA3ms05OfY9V0UNsj0FBjHVB3aZiHMgc5V43pnu
	qKdo52h3Stm4eUe/AGnlF3yI7wE2gyZ51nCGf9ITrgKv
X-Received: by 2002:a05:701b:4504:10b0:185:b157:f271 with SMTP id a92af1059eb24-190a51e5f49mr758501c88.23.1792547410075;
        Tue, 20 Oct 2026 18:50:10 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:92d1:8038:c4e7:1f0c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bd6b7ccsm2106839c88.13.2026.10.20.18.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 18:50:09 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-input@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] Input: soc_button_array - use __free() cleanup facilities to free memory
Date: Tue, 20 Oct 2026 18:50:00 -0700
Message-ID: <20261021015004.1537738-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261021015004.1537738-1-dmitry.torokhov@gmail.com>
References: <20261021015004.1537738-1-dmitry.torokhov@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch to using __free(kfree) cleanup facilities instead of doing manual
cleanup or abusing devm for allocations that are only needed during
probing.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/misc/soc_button_array.c | 52 ++++++++++++---------------
 1 file changed, 23 insertions(+), 29 deletions(-)

diff --git a/drivers/input/misc/soc_button_array.c b/drivers/input/misc/soc_button_array.c
index d4dc4e7116a7..8d782ef4f78b 100644
--- a/drivers/input/misc/soc_button_array.c
+++ b/drivers/input/misc/soc_button_array.c
@@ -366,10 +366,10 @@ static const u8 btns_desc_uuid[16] = {
 static struct soc_button_info *soc_button_get_button_info(struct device *dev)
 {
 	struct acpi_buffer buf = { ACPI_ALLOCATE_BUFFER };
-	const union acpi_object *desc, *el0, *uuid, *btns_desc = NULL;
-	struct soc_button_info *button_info;
+	const union acpi_object *el0, *uuid, *btns_desc = NULL;
 	acpi_status status;
 	int i, btn, collection_uid = -1;
+	int error;
 
 	status = acpi_evaluate_object_typed(ACPI_HANDLE(dev), "_DSD", NULL,
 					    &buf, ACPI_TYPE_PACKAGE);
@@ -378,8 +378,9 @@ static struct soc_button_info *soc_button_get_button_info(struct device *dev)
 		return ERR_PTR(-ENODEV);
 	}
 
+	const union acpi_object *desc __free(kfree) = buf.pointer;
+
 	/* Look for the Button Descriptors UUID */
-	desc = buf.pointer;
 	for (i = 0; (i + 1) < desc->package.count; i += 2) {
 		uuid = &desc->package.elements[i];
 
@@ -397,8 +398,7 @@ static struct soc_button_info *soc_button_get_button_info(struct device *dev)
 
 	if (!btns_desc || !btns_desc->package.count) {
 		dev_err(dev, "ACPI Button Descriptors not found\n");
-		button_info = ERR_PTR(-ENODEV);
-		goto out;
+		return ERR_PTR(-ENODEV);
 	}
 
 	/* The first package describes the collection */
@@ -414,32 +414,26 @@ static struct soc_button_info *soc_button_get_button_info(struct device *dev)
 	}
 	if (collection_uid == -1) {
 		dev_err(dev, "Invalid Button Collection Descriptor\n");
-		button_info = ERR_PTR(-ENODEV);
-		goto out;
+		return ERR_PTR(-ENODEV);
 	}
 
 	/* There are package.count - 1 buttons + 1 terminating empty entry */
-	button_info = devm_kcalloc(dev, btns_desc->package.count,
-				   sizeof(*button_info), GFP_KERNEL);
-	if (!button_info) {
-		button_info = ERR_PTR(-ENOMEM);
-		goto out;
-	}
+	struct soc_button_info *button_info __free(kfree) =
+		kzalloc_objs(*button_info, btns_desc->package.count);
+	if (!button_info)
+		return ERR_PTR(-ENOMEM);
 
 	/* Parse the button descriptors */
 	for (i = 1, btn = 0; i < btns_desc->package.count; i++, btn++) {
-		if (soc_button_parse_btn_desc(dev,
-					      &btns_desc->package.elements[i],
-					      collection_uid,
-					      &button_info[btn])) {
-			button_info = ERR_PTR(-ENODEV);
-			goto out;
-		}
+		error = soc_button_parse_btn_desc(dev,
+						  &btns_desc->package.elements[i],
+						  collection_uid,
+						  &button_info[btn]);
+		if (error)
+			return ERR_PTR(error);
 	}
 
-out:
-	kfree(buf.pointer);
-	return button_info;
+	return_ptr(button_info);
 }
 
 static void soc_button_remove(struct platform_device *pdev)
@@ -458,6 +452,7 @@ static int soc_button_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	const struct soc_device_data *device_data;
 	const struct soc_button_info *button_info;
+	const struct soc_button_info *dynamic_button_info __free(kfree) = NULL;
 	struct soc_button_data *priv;
 	struct platform_device *pd;
 	int i;
@@ -473,9 +468,11 @@ static int soc_button_probe(struct platform_device *pdev)
 	if (device_data && device_data->button_info) {
 		button_info = device_data->button_info;
 	} else {
-		button_info = soc_button_get_button_info(dev);
-		if (IS_ERR(button_info))
-			return PTR_ERR(button_info);
+		dynamic_button_info = soc_button_get_button_info(dev);
+		if (IS_ERR(dynamic_button_info))
+			return PTR_ERR(dynamic_button_info);
+
+		button_info = dynamic_button_info;
 	}
 
 	error = gpiod_count(dev, NULL);
@@ -507,9 +504,6 @@ static int soc_button_probe(struct platform_device *pdev)
 	if (!priv->children[0] && !priv->children[1])
 		return -ENODEV;
 
-	if (!device_data || !device_data->button_info)
-		devm_kfree(dev, button_info);
-
 	return 0;
 }
 
-- 
2.56.0.212.g129ede20d9-goog

