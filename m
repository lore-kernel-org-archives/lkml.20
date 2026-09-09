Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D045552D2A1
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 23:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788996397; cv=none; b=hCiN06atp7Z4dRDlcTL71M2CVUuxi6xsMrD5y5ntXBbC0LHpSZ8BcbFoRgzVObkXaiBSRUOeN8wEjhkBN4vViNa2lu43SX65elbCp2ezMt9D1a7mVn7fIVrnQ824KdVVNijkorRXvut/GLMZwWbmlsEG+kkpadh7E0OFjaC53P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788996397; c=relaxed/simple;
	bh=OVdxTIy0l32ihpvWX2MNEv5STrgK+9Rui3lOFdgMtkw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LOkGOLlj+NFiUSol2or8atP9kouoD6WRZ2qyCqUq+OfvZq5Og6LKbHwlMQjwwgtpdV3vDqXMIS7K50IMcbeAe4mZTUG+WUpqEo3gj3zTnlZomazA/er9MIXywzuRkotYlbCDBjNMSu9WoeEgPXha2kLVMnCL3MHjO615+ifB1/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E79toLWn; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E79toLWn"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93910c3d02aso108413985a.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 16:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788996391; x=1789601191; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=elO0ESwMGeryy/voYSGWGe1Y0YMo4gcHLHddwm68FBU=;
        b=E79toLWnrH+vpJdls0TEDTxc9zk33WiZMe/4uzhbhwhgZILIK91VQ8bSgzrs1HPQ+U
         wK8k/saaIZ6O69GR2XbJxZH9D69yO1tfzwUi1rHKJC7LmqUqe61+mT2yTtjkJ+33y6Fj
         Dw9qhVCULDftdd/RZlycbcxDs1D3AANKpe0jTy+Pes7gZ0oon2afM4wcCYHJW89fOjLQ
         qyElPPc9/QogKj/U0/58V1kGPLHHiELnq1HC66X0fCmB4yn7DZuFT2A+khLMV3rC5zkS
         1RC9mfmmYqHuDHATxQpuyr6Kv4Sjoh9/FU7EydMb5uMmlvBp/81/uuPnc6uNORl6j52j
         gfcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788996391; x=1789601191;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=elO0ESwMGeryy/voYSGWGe1Y0YMo4gcHLHddwm68FBU=;
        b=AEeiYDmAT1TPaLFKsoklgkJlCXXCgZQfLWNL7jgrN/DQhM2VNZV83/Kr7bRO3bjnlP
         EJldn1zkSJkJKBJExcJikbFNxxXMqLR7dur/LEQJs4rYB9BAFPWXnwV2YCaRA4GvjddN
         MBfrePlPMUPtIcsegXgcraCp3p+Pjh3aVOrV72u2UUYlshhyYYIMEZB+E004FlORlue7
         zfaMIkPb8dr9apapU95xxMGPFVbZ9RppfRJpyOr7OeMJr1LZww18vIZYEoQ366jc3KrG
         2wjOmYIP6DRZ1K86VERw9Zl40VEq68P5PgZtoy6INAhVbh+HqzWRYXJTIoDFSpjyVK+R
         mICw==
X-Forwarded-Encrypted: i=1; AKwUvBz631KFinZ3JIuoFCf0X8HX8z/2zJppnZMxYbjLBaqE9YNwF8D+2MYWxzwP5F9Afta9gJavDLupMdOWbtE=@vger.kernel.org
X-Gm-Message-State: AFuF++lpqAAEwbrTauEalExMLGNWTORlk3h0PHxa/WyGYLpAXu1+QJua
	UQDZqKIPXfxxII/r5vJucUpmumBj9weQy1h7xgiZcAvqL6MVjmBwfilP
X-Gm-Gg: AYBFou2o4dmmudLBDbb/PCCM4k8Plf1fJOX91XCOiVtOsTTxzXhMgn4FwIIl3ksgJmS
	xbqmhlIBRQwAoXItA4qWU3r/OVOdQIqx+TrKpnEh6nKNSvaQ1tfp/qvLkqalgOdoSGg2FL1nazw
	VfGJzFA9Ccfo1jgkGQ35CelRkqOcLB9RQqgZIjF0e8UgCnBhGlD5c7l9gf9g7nhbaBSBajPfKZF
	2k0YQhqdGe38r/3+yf3XAn2Z0lYBVSprwOJAWKbmrP9Ooe4Ll+h667ZMD9cD/FI84pbq7E2R3dV
	tto5Q+piBK9pHi0IqZv5kWTdFyCgCtceI50ZamaTdANeR5VAnd5or+KGhvJxPI6iK1kISiEF2FO
	FyzWB16mmcskWqVOsLm3pJUw+Z4FJiqjE3BYBBE6hFBJlpJ9tMsZbwwm6+TTjLr7uri6ZYopfaN
	yRvTPlBJ52UfWitxglCgYgJE1scVRrmgMiU4ceNXO3lkWgBqaIIO15RfsUq9gDUlup4C9Tj1TRi
	ko9S2Ily0UwtWcK7Lu9v3o1wvjHXzmkep2AAtNlNj46EzA0fIgJ
X-Received: by 2002:a05:620a:46a5:b0:939:d676:2ed5 with SMTP id af79cd13be357-939d7e9c974mr229270085a.7.1788996391542;
        Wed, 09 Sep 2026 16:26:31 -0700 (PDT)
Received: from [127.0.1.1] (static-68-235-46-14.cust.tzulo.com. [68.235.46.14])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fb70fbdsm1530498085a.32.2026.09.09.16.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 16:26:31 -0700 (PDT)
From: Miles Krause <mileskrause5200@gmail.com>
Date: Wed, 09 Sep 2026 19:26:26 -0400
Subject: [PATCH] memory: emif: fix device_node reference leak on np_ddr
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-master-v1-1-8800f5647ab2@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSwNL3dzE4pLUIl1DY0PjVLOkpCTDtGQloOKCotS0zAqwQdGxtbUA5oc
 a71gAAAA=
X-Change-ID: 20260909-master-1313e6bbb1fc
To: Santosh Shilimkar <ssantosh@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Benoit Cousson <b-cousson@ti.com>, 
 Aneesh V <aneesh@ti.com>, Grant Likely <grant.likely@secretlab.ca>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Santosh Shilimkar <santosh.shilimkar@ti.com>, 
 linux-kernel@vger.kernel.org, Miles Krause <mileskrause5200@gmail.com>
X-Mailer: b4 0.14.3

of_get_memory_device_details() takes a reference on the DDR device
node via of_parse_phandle() and stores it in emif->np_ddr for later
use, but drops that reference without calling of_node_put() on two
error paths: the devm_kzalloc() allocation-failure check and the
is_dev_data_valid() check. Both return NULL immediately, leaking the
node reference each time either failure triggers.

The same reference is also never released on the success path: it is
kept for the life of the bound device (compared against a later
instance's np_ddr in the duplicate-DDR-geometry check) but
emif_remove() never calls of_node_put() on it, leaking it every time
an EMIF device unbinds. of_node_put() on a NULL pointer is a no-op, so
this is also safe for the non-DT get_device_details() path, where
np_ddr is left NULL by devm_kzalloc().

Fixes: e6b42eb6a66c ("memory: emif: add device tree support to emif driver")
Signed-off-by: Miles Krause <mileskrause5200@gmail.com>
---
 drivers/memory/emif.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/memory/emif.c b/drivers/memory/emif.c
index 2fadad0666b1..44ccc2561835 100644
--- a/drivers/memory/emif.c
+++ b/drivers/memory/emif.c
@@ -922,6 +922,7 @@ static struct emif_data *of_get_memory_device_details(
 	if (!emif || !pd || !dev_info) {
 		dev_err(dev, "%s: Out of memory!!\n",
 			__func__);
+		of_node_put(np_ddr);
 		goto error;
 	}
 
@@ -946,6 +947,7 @@ static struct emif_data *of_get_memory_device_details(
 			pd->device_info->io_width, pd->phy_type, pd->ip_rev,
 			emif->dev)) {
 		dev_err(dev, "%s: invalid device data!!\n", __func__);
+		of_node_put(np_ddr);
 		goto error;
 	}
 	/*
@@ -1140,6 +1142,7 @@ static void emif_remove(struct platform_device *pdev)
 	struct emif_data *emif = platform_get_drvdata(pdev);
 
 	emif_debugfs_exit(emif);
+	of_node_put(emif->np_ddr);
 }
 
 static void emif_shutdown(struct platform_device *pdev)

---
base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
change-id: 20260909-master-1313e6bbb1fc

Best regards,
-- 
Miles Krause <mileskrause5200@gmail.com>

