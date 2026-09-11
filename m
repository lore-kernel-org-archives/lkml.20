Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B991030C60F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 03:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789096225; cv=none; b=T+NrratvY8G3OmhokjL+JXMGyPgnwt3Gf9goVP5rwphyX+kbVjvs8x6k4ieX4UX3Zz9DxiZBq3umnAuItySiP5y+kvhN6GmJ9vrecKlTa2tcUFjsXRfJ2z9ZZ26j8lYQoXNAm4sW+hxVGU9sJlJXpd2xc4whZljPnnAqDiQ722Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789096225; c=relaxed/simple;
	bh=Lhtai34JnNJX35WDokE40hIm/9HligBsTA8PHOKgR2c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=odDiiugfy3gI0drrkgwUC31uo4Ts8XamffcZbaPYm4MdKv02G8wTpMYJRs/OphXtyXZt60CA8201WRlycZjPsd2kgG2waSy+LWhUk/1lv5O3pIeB3P31fzMpJi4G29InAtP5BNibIT8vtkBmmtw21VcFTz5MIkugn8b+CLvSIig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j6HOTPjk; arc=none smtp.client-ip=74.125.227.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j6HOTPjk"
Received: by mail-pj2-f1.google.com with SMTP id 98e67ed59e1d1-398e10200a6so226076a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 20:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789096223; x=1789701023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dtc34+Z5/QntunTf9WdL8o2+F8D64gPTWfEUx32hdlc=;
        b=j6HOTPjkjnZ89MDIxUspp95jKxuIqR5GLuBVozFa+1SwbnXwDS/UsxUzmqse/jDMbY
         rrk6mmH4POov4eQSRDxTKhDM4dkK1KfDb7POIocq50lizmWvmyIl5EKtJvsrKhE7ct/D
         xjboEZOeOMSpPSM7N20dxqV1pUamkUF7JFUBHckJ2dYVHGwTnDOSA+LPvQ49s1tpWmQt
         2IZtE1XMEowp4XM+wyDOp8MgOY9+W1+Hj5eT8uxekb6bUUqWAVvmFuBpsKI2JrBbRlvK
         9SzVLn1FIU2OwqpgTMHLXYUQIdUgcaPmqpRbTaITLie7mZnuXxB8dNuRuuEMjzKrJ6YD
         ZGFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789096223; x=1789701023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dtc34+Z5/QntunTf9WdL8o2+F8D64gPTWfEUx32hdlc=;
        b=UwetOQAsF2YGANUOOTOqZq3J2EPVqbhWdPgH01U2cx8MBZEA3qQUUA1z+EOYve6Ev2
         wmbfpF+ar02yJhx979WSWEr8dJvNIIm7A8byZ9mXBZkHm75mlvzpv3VXLhk6Vt9gvwxZ
         QgTeK0CssbObjoaVlRHG6/eUrRaQpr+jfiuYDwOdlr78S+BNMhFDJP9xWROspHMCkJS/
         ZMmDxeQbF3VTN4j816P3S9EnCu/dV6XIVEhO+zBNZpJ/M9sN9HDYBcnhCh/V5YM3N/VF
         0T3nSbiX8wHKBp4jw8nB9GTL8Sw4WJFEFFm6qtzJckrupkXsyPGY15kCYO6bIUoXBdXk
         rPNg==
X-Forwarded-Encrypted: i=1; AKwUvBy/7i4MA1wvmxHArIzBZSOkL/IHYEJApmwk2E4mISh11kax6Fj42coZdPp331jOPW3OP4t0g9zkAkpEuw4=@vger.kernel.org
X-Gm-Message-State: AFuF++k2XstKJbTqE62GyF22KDSvohs/vvvwWsBWMGR2lkNOk+FwBZUK
	5N5kuurl64Dm/Bd4ibHMZ+tdT8FpX0elw4UhlikfEDgi7ylrnV4C6fZ8
X-Gm-Gg: AYBFou2KSS4FjtIPgoz51T9R+S1QDfUnIqbt0pk//OPm6q+7Olp+smqQrUMjH5M3A1l
	povYLJnOYh6eV5W1LXpDwV73F5R53ahQhgjSnVNZBc6I7Pb9mZm9JUv+ornmmlCHgGfNqdoKY3k
	O9r/HbuzSGEgUFgmahSNKfgbSIo2D3bWzD8x0BXXl3ftuGncj8ipg0AQoI+NWnV74r7rtDXeATi
	KG86yPzLw6nXC5GGovSs1z4/HlGqsmTnvK6tXh/p+CldV5J7upVZwhW+eFT+ydNPw4/ycLTmhv3
	QV0ceiS6oL2fcuQfXnwu/IBbt5y+FYYdt4UbSe8jZRWikj0WYIXXAPJRh2RkYBoKU8WjYWB1sgV
	d/EIcoBefbxj6WPc7DSrU0yl0nZd76BRkdXty1/HoGxAKaklcxisLWt9z4LY7wjbm/kUFHwmOdC
	u4OrH0izoeYEU4g9anylSvHfI1jOYswZVRIE0H92xBSmGM7yO2/JmANraXert0CZNAxAS5kqI7/
	eyXbQ23Mzj3Jq4xN4YL
X-Received: by 2002:a17:90b:5287:b0:398:9bd5:490d with SMTP id 98e67ed59e1d1-39d9c22e224mr3463607a91.20.1789096222067;
        Thu, 10 Sep 2026 20:10:22 -0700 (PDT)
Received: from embedsky001.tail6d6b2f.ts.net ([183.34.211.247])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9959ac65sm1981207a91.16.2026.09.10.20.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 20:10:21 -0700 (PDT)
From: Yonghao Zhang <hyz3367@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: rishabhb@codeaurora.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yonghao Zhang <hyz3367@gmail.com>
Subject: [PATCH] remoteproc: sysfs: Fix stale coredump attribute documentation
Date: Fri, 11 Sep 2026 11:09:44 +0800
Message-Id: <20260911030944.1645477-1-hyz3367@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The documentation of the 'coredump' sysfs entry still advertises a
"default" configuration option and describes it as the default value
of the entry.  Both date back to before the option was renamed to
"enabled" and the default configuration was changed to "disabled".

Update the comment to describe the three options the store callback
actually accepts, "disabled", "enabled" and "inline", along with the
real default value, and fix the coredump_show() comment which wrongly
claims the configuration is exposed via debugfs.

Fixes: bf41a0910cb2 ("remoteproc: Change default dump configuration to "disabled"")
Assisted-by: Claude-Code:glm-5.3
Signed-off-by: Yonghao Zhang <hyz3367@gmail.com>
---
 drivers/remoteproc/remoteproc_sysfs.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
index 925b0cdbe577..c37736ff4acc 100644
--- a/drivers/remoteproc/remoteproc_sysfs.c
+++ b/drivers/remoteproc/remoteproc_sysfs.c
@@ -76,7 +76,7 @@ static const char * const rproc_coredump_str[] = {
 	[RPROC_COREDUMP_INLINE]		= "inline",
 };
 
-/* Expose the current coredump configuration via debugfs */
+/* Expose the current coredump configuration via sysfs */
 static ssize_t coredump_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
@@ -87,14 +87,15 @@ static ssize_t coredump_show(struct device *dev,
 
 /*
  * By writing to the 'coredump' sysfs entry, we control the behavior of the
- * coredump mechanism dynamically. The default value of this entry is "default".
+ * coredump mechanism dynamically. The default value of this entry is
+ * "disabled".
  *
  * The 'coredump' sysfs entry supports these commands:
  *
  * disabled:	This is the default coredump mechanism. Recovery will proceed
  *		without collecting any dump.
  *
- * default:	When the remoteproc crashes the entire coredump will be
+ * enabled:	When the remoteproc crashes the entire coredump will be
  *		copied to a separate buffer and exposed to userspace.
  *
  * inline:	The coredump will not be copied to a separate buffer and the
-- 
2.34.1

