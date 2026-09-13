Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CAC372EF0
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 06:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789279376; cv=none; b=tEq/gYlPvJ6o4v408B0V/qR/0gyPWelh/orBfAFrkHdbQLRgekUkH2TWwrPXtbmlHDgBDi8uh6n+2qfTaTwav05e1QfxB+JEWQMLq7Q5LHR63kxQN3fVrRM9mr8MEec7VaB/mCtpAEqwxswNdjSrShvXN9n2/s6QIu4JGaFM9Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789279376; c=relaxed/simple;
	bh=65cEKXKhhuEzXufrrcDn2PycVDgDexj8cymvAewKMgg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Etn2VXp5QhmUbRfAzN8TgmB0jiCNdxGh/zMam09meKFE3I1e6SANCdpJuWk7PAs/DrIg+h+MUX0hgvKg9jhVWoIuOrlGVLxTKwXCifu5qqJbjsgyreQHRHHwwas6N//bthbtgNcMNYgAk2fwsXakERqGWGwC+zmIUw+oyHq+u98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dJZHjbiY; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dJZHjbiY"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ed6d6eso5480985ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 23:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789279374; x=1789884174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QgMX8CiibWPEaVVcLSm85/QfWicxIoxBAscuNI56DwY=;
        b=dJZHjbiYA982A4Nt7rpwU7CjA5bYkKwfWzA+oEzq7RKzd/yiIMdD0Zc30eixHEGgIP
         2RGiJ+Cn/l1Q1IdoW0Spe55OnEuBIlnsSeH1cWSeIKRBk//eDw2qF+NkoMmN0GRDXFU1
         MWus2VxSxGEL6cy5J2tGEQPxFh9LqLEDq96WD87Ux0sX80Dy3DQ6vj77vrS6DkJFRPyl
         oFEXJPRjrh5V//8TomAmSkJkVcki2nOfk6WdQKys9WNedfdvtO9GdBZTNEwYtytN9okp
         LxgUR2aP+Y/boJt9l76JZgoNSwaJ6hUi9PYW/IZgRDm/cnjdvIn1oJOW5if1k//19y2P
         YB4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789279374; x=1789884174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QgMX8CiibWPEaVVcLSm85/QfWicxIoxBAscuNI56DwY=;
        b=qBo7maWiVNpEyl+3quZF40YwtL5+5sVmlWYoeF14x4dHT7cr37kyt8/D5QYVfcCUeZ
         JFNBFqBRDdw7rs5TVa5nYqw1Q2YviARiT+U0q3ZuhQzPtH5NvMGn/DcpQ3H2Lp1f8YhL
         MDCG7irRVukjx8EtwzmeJk9+1jHJtFsIImtYMzaOYaBS41zIfM8FY9I3t1dykwoFFiFt
         OcTxPYUb7gXsgePr0G+mIqxV7ez6uW2YtE8Y8a7lGDgOPPqfJgoqXv+H9NeIMDcrp4On
         4lMX+9T1Abari7xK8++Wo77dzVpxiUTPL8n/msA27Dw/SgkgNp5GYsrOSpZsdcanfFkR
         VV+A==
X-Forwarded-Encrypted: i=1; AKwUvByepUwJP/5YGRVZY2ehsFLDA1wxkzRQFZ1Lpwre9olJFDiAUlhFZ8nZ9yDj3riYiGiijDxDGuv2vu93h3w=@vger.kernel.org
X-Gm-Message-State: AFuF++ncKA84HrrpXr8DAuBZS2sv/iCQkZyDIYjYOUxLkJtDxMcE9lDN
	SeYwZhPHyQKWEhtvJt1cwJg0mVuHyz4oQxWot4YpB0TXh1f/L3rgbCvW
X-Gm-Gg: AYBFou1h3x0+UtUOdpzuEoJWRtKfBtXeiao0HMHdUFW6z1uqYvNJ1ZjbrYuE4gkzl3W
	3hBeauCEcxcAdd8l4BjIUIs6wnLqgiiYUEaKNgtprFMO/3V03N+j5KfyC02fREBhWaFZSqmipWH
	PmZkL0o8qvxxBgVZj+lSKGpVufr7QtRH+Aj4mAks0E0HWUFMPJ/W/Um1ROZ4Ztvb+kZJBtoqxdq
	NNuY5nZAhZDg9bqgtUif2waMlOGlLKgR28BfClPYVTzicmWQENts7naK8pesogcGCn1ylGNXtxZ
	WL6azBXRTz1NvOOaMXzgd8XVAK7FmU5qz17u9G7URDq6SB8ECLOzw8X0gf1ABT8syHs0OJGy/cL
	kxtFIyyW30ZuRvm6Vdi+JFCIC2vDzdoOtctw4t5glCtgiddyIB0hXZ933nmHjBzxayu86+PP3cM
	c44r9b/8GCwJLP8uWwZNwfflcRdRYAsFOAVJSK/VD/qoPykXbKgLZG6A==
X-Received: by 2002:a17:902:c947:b0:2d8:d4d3:3fc0 with SMTP id d9443c01a7336-2dd4bdaf9bfmr98050145ad.20.1789279374119;
        Sat, 12 Sep 2026 23:02:54 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd3f0faf19sm23811575ad.12.2026.09.12.23.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 23:02:53 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Eddie James <eajames@linux.ibm.com>,
	Ninad Palsule <ninad@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Alistair Popple <alistair@popple.id.au>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fsi@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] fsi: aspeed: fix memory leak on remove
Date: Sun, 13 Sep 2026 14:02:42 +0800
Message-ID: <20260913060242.1426845-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fsi_master_aspeed_probe() takes an extra reference to master.dev with
get_device() after registering the FSI master so that the aspeed object
remains valid while the remove path performs its cleanup.

However, fsi_master_aspeed_remove() never drops this extra reference.
After fsi_master_unregister() releases the reference held by device
registration, the extra reference remains and prevents the device
release callback from being invoked. As a result,
aspeed_master_release() is never called and the fsi_master_aspeed
object is leaked.

Drop the extra device reference with put_device() after the clock has
been disabled. This allows the reference count to reach zero and
aspeed_master_release() to free the aspeed object.

This issue was found by manual code inspection.

Fixes: 606397d67f41 ("fsi: Add ast2600 master driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/fsi/fsi-master-aspeed.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index aa1380cdff33..d21d06b44350 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -652,6 +652,7 @@ static void fsi_master_aspeed_remove(struct platform_device *pdev)
 
 	fsi_master_unregister(&aspeed->master);
 	clk_disable_unprepare(aspeed->clk);
+	put_device(&aspeed->master.dev);
 }
 
 static const struct of_device_id fsi_master_aspeed_match[] = {
-- 
2.43.0

