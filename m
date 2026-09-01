Received: from mail-pz2-f7.google.com (mail-pz2-f7.google.com [74.125.228.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00BD42CB08
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788247808; cv=none; b=WfmaOla+2nPIjs7v0mrYbFagm5/+ivwM7t78GbdhBwKWUM3ZRQXcUWg5CWc2lYpzTVPeSganWbWN+sL3m91bM6t+nonPttYTUtOyusU9oAoApWRj8x3h8jvplfH4AXNRw8jHnj8cwGQPbmPsOxmmKDOhIEZD2GCNcbPsPdEyYXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788247808; c=relaxed/simple;
	bh=xzO/aTJ4wURncskDhP1d2t60dg5jb51TSe9AjD2syII=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nCMLn/vtr4siuPOk1XcdgGQ9RMu7t4CsfcabTE3g0ZCyoyvtisV/EX4QNo+puMBXSPUM3uEjF1rQF/nd6yqGD/Re2J8O1Ow+GLfEpGIbtniiCzGUIi5YcDA90Xhm5LH1tvXbnnHYL1dREqTKKhEA8m6r1aDhs0rmbN5t2KuCnZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.228.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pz2-f7.google.com with SMTP id 41be03b00d2f7-cc1ddb3ba3eso2889985a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 00:30:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788247805; x=1788852605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KhflzhJIt+7USEYgr5u9E8oq972mOC3DKuLj0M4QHx8=;
        b=kJRqU3lw9vr4ZDOnFPhhkFclqaN+lRGUrEOOImZzj+yt/IhR2c2lMhEsCGPtWOosfL
         HTgfoFQ35T2mLqzGANWrkO3Qhbb63vM212r345yYk1iviGSZX1Cj7ksFDeLF8wJ32h0i
         b+RL3cUkMx8f2+yxIoB5idVOWM6ysJIFVX+ASwGp/8C31301Fzpta+j5YKhKz7iYtT/y
         p3dROKMHOU55gFymgR4sMBa0vnwjcU7Uvl29DJ63ylepKi7juWo2p5VFctP48fYc2zRd
         YtqoF8zTRTRT6BznH7+J10p3CCSSt9JFILw2AXQxMpisPXohTeHqi84Ihm7uPxm2vLfx
         MBMA==
X-Forwarded-Encrypted: i=1; AHgh+Rojo4qO7hyZrY/EAI+xfGdoL1c97Pudvniv0D/ghWFflEOwRY/At4tENP1Omf09GtsQmgNgmj6ljbM90LU=@vger.kernel.org
X-Gm-Message-State: AFuF++l3uXjxExh/Kk6BD5bis6xYQInijEcb94jJhYi3GPm/HdPCGbJ4
	liFA+oti9q/2Vo1kEYLjD+escUE7rbWPZ88/iBfN9SRFaq1r2hpx5WgW
X-Gm-Gg: AR+sD13+q+rf3XPNPPoMoLk9+FXewnWFh1qA/iFUNa/97OgH3S04y4sgy7ktfWQKsFc
	ZfPoGiXVvQmmv2HIq0Mcucp/6qVZDrBdyUn9opTp8ubN/13Hx/arpPqiDP3Cgm48RrPPWILxs6/
	Iy8dwyHjLf85zAHrDAjIke1iVD5vmVCIvoSQbAx0y46wuNg2ccmx963Zw7ABKJ55ETzBjcf4+Lm
	lNfrFKCGz5sve11hRbqG0Fn7IC1Y3JzmQJxqY8lk4AVnwkJSsGFhOiEA2EyL0cCuq27DX7pAAYS
	WNFZcF39y0+v0sAzaWCyL+nlku70qG/Pi0ioKUPlaGxEAoMd188AZ3m625Z4wT6KVWZm6s61a9Y
	ynJGaey4tH1E+PnAxXrJqhv+5k9wXRzDJl0YJN8n9jS9+lpZ91lQRKQQhZ+0dioYE7RhYhdLUWr
	4Cs1ByD7pKxyzOAc3OaMPO8aaiht2lbz7HOq7UJt7SVr2HX81ySu4CFhvDf0aGkkoMG/pyTV+gH
	16i6ZiTPA==
X-Received: by 2002:a05:6a20:a11d:b0:3c4:46ca:3347 with SMTP id adf61e73a8af0-3d265e3f806mr43132472637.2.1788247804882;
        Tue, 01 Sep 2026 00:30:04 -0700 (PDT)
Received: from kylin-XiaoXinPro-16-AHP9.. ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f330f85fsm5656758a12.9.2026.09.01.00.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:30:04 -0700 (PDT)
From: Xueqin Luo <luoxueqin@kylinos.cn>
To: sre@kernel.org
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cabarnes@indesign-llc.com,
	akpm@linux-foundation.org,
	Xueqin Luo <luoxueqin@kylinos.cn>
Subject: [PATCH] power: supply: ds2780: Fix ds2780_get_capacity() returning raw value
Date: Tue,  1 Sep 2026 15:29:54 +0800
Message-ID: <20260901072954.1953121-1-luoxueqin@kylinos.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ds2780_get_capacity() returns the raw register value instead of 0 on
success.  The capacity is already stored in *capacity, so the function
should return 0 to indicate success.

Fixes: 275ac74629c4 ("w1: add Maxim/Dallas DS2780 Stand-Alone Fuel Gauge IC support")
Signed-off-by: Xueqin Luo <luoxueqin@kylinos.cn>
---
 drivers/power/supply/ds2780_battery.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/supply/ds2780_battery.c b/drivers/power/supply/ds2780_battery.c
index 5b57bbba79d4..ef2446386c2a 100644
--- a/drivers/power/supply/ds2780_battery.c
+++ b/drivers/power/supply/ds2780_battery.c
@@ -304,7 +304,7 @@ static int ds2780_get_capacity(struct ds2780_device_info *dev_info,
 		return ret;
 
 	*capacity = raw;
-	return raw;
+	return 0;
 }
 
 static int ds2780_get_status(struct ds2780_device_info *dev_info, int *status)
-- 
2.43.0

