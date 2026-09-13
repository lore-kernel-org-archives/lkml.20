Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8BE312834
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 12:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789300961; cv=none; b=eBKvGVxeXjt1+EvM/6cLaYVAiVrqewFrWWZLzOQ6xqtBxIq/ax+qPHiYp5NtD14WERNifA39M898DkCI7PyvyA6hFkmxJ+wvqT+OTDodg2vQUivu/0bJhMcQSSQQCOi6BEJ+1i2VwRlSz+Z7CQgsIXGgdB/aEogizNNRUzEXP0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789300961; c=relaxed/simple;
	bh=mL9fNglYsSBvG//gsuivigf3fT0Ig+s5Ce4nrXosrxo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A1BD5Pe0hLilbZ9KlZb10qZAP9lcbuV8iOiEaUGsX1KRHDvh7x4danhcNjgdUwm/S0BGBSsQAT3fUeOJDSg6WAyed7OGpAc8Xi9uTyqrScWTQhSjX6ZXsJUwfPbNU3xiVwyzeuGesTX+nNp/uViceugJpB2n101z1CpInHO0PdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pps6kOBX; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pps6kOBX"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b350c6920so809128a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 05:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789300959; x=1789905759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dZ5JOsCZ04J11iAGe8msFZoGQpgRKm5XQ0vjKi0ufM8=;
        b=pps6kOBXgjgktfbjeWsZsfWvMadI2JM+QKzeJ+3lUrSVVGa14nXhHEQiM7bk3WS6wa
         fGRG03vq/OQs+61qJ0BlWyNsIb6ZN29hYz9yk3qaa6EItYFdm/0uD2LloyCbgGS6HUxH
         UDky9gnfRCgMHxACrEx+l2J+W8Xr2lAWz+NO7N049cHY5EhW+YGGw4mv96jr9Bvz89d1
         hqSTIuCn6x02p1SZ6txABP49QJQLqSBIHbw6x9A98v2ZkhE7InDOkJ5UbM7F2TDe/A0m
         heYamyWLigRyFqoMF6LaCc5dIt66I/vTF+GFxBUJUHSYglgz34xe2l5zECaHyfcgBzxs
         mdug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789300959; x=1789905759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dZ5JOsCZ04J11iAGe8msFZoGQpgRKm5XQ0vjKi0ufM8=;
        b=YxblsJ0kUFBYSauHYmJB35H+036eg93FntnZBC5GKYitVzw05KYWCV2ndj5GU+zeQQ
         Pmo+71G/KCTa1CPBNpENYtO+NP22e5Ke56vP1bG+aF4f2LYdoBeFdskdpDu5BeXT20Xe
         WzSv1PgcvWrJZZwnyM61Ry+W7s8WN0MVwcazCoJr5zKs9AIKxlsJEk46hh7pFplqm+xn
         PSRPRAMJaIu22V58zDBXmQx+BnGd4xioXTTfROKboAk6LvAaBLfyXEHUs1m4ERfIpGd+
         AndQqSdxch2/0MfAon7pBn+kqrNocnsictudcTeOnBSPyuLK0ltY829zAbt3ROjdsGLD
         lQJg==
X-Forwarded-Encrypted: i=1; AKwUvByr3loHmkBfVc4vN5VHg1jskjk5irNp37i+pNS+2NokkIRIm0x44Ueg/wvIVkktej8kAvC+ahVrAnegGBc=@vger.kernel.org
X-Gm-Message-State: AFuF++nROxYMGEo1p/RVqkQmHHdkIoYQqDRspFyU9nBF0EiHWPvNctEG
	GDHWFDz/WV1I8WEYoJ6Mnhg3prqDTqLGx+bBNW7RShqacQBsAbmAAzXf
X-Gm-Gg: AYBFou1STXgaSDQ1chYAGTdxRoTNa7/BKLxUkp6MbwmArGsXC3muCusgsJWgZws8Kyj
	YE6+NO2j6cps/AOWsdjaEdIsDBwC+/CIR++Ddnl2QfpWdDiBuvh7oxCLtMljmXk98+yuk/QVln/
	Cg5i139E2hWD29zzsrIZ8jbyVQAbA1be0OxfOCQ44bPi5oqKFFMucWdhw05lofjv0XKQw2DvsGv
	afeMUKoQBnL4zTRXFBk/n+v2JdjdL/HW1qXdcCSBE9Q92i5yde/tHUoHF2MIbpi5zTuI9XIMe+D
	cZbJIOresKvF0eFxO9dfk3wmso4rRCBPBuZavaUrnmTJMiHDEZDD1RGAMYta/UzvLshTqcYVFIE
	7Ax5K/pMHezVZqGST/tNcwI2Laib9GtKsJzyvWn3ljliXjco1l8e1t0x+3c6FgBUX/XJI8lT3Rw
	VmLt0Xa88206XEYJgNsYrFKMsUdY9XN3rMYXA48nYnfL/QLD3JrlHM5Mc=
X-Received: by 2002:a17:90b:52cd:b0:398:b426:ca4b with SMTP id 98e67ed59e1d1-39dbc6ef551mr12049002a91.22.1789300959024;
        Sun, 13 Sep 2026 05:02:39 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd3e2dabc4sm27365725ad.19.2026.09.13.05.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 05:02:37 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dmitry Osipenko <digetx@gmail.com>,
	Ulf Hansson <ulfh@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] gpu: host1x: fix runtime PM reference leak on remove
Date: Sun, 13 Sep 2026 20:02:27 +0800
Message-ID: <20260913120227.1559129-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

host1x_probe() calls pm_runtime_resume_and_get() and intentionally keeps
the runtime PM usage reference for the lifetime of the driver because
host1x is not yet ready for dynamic runtime PM.

The probe error path drops this reference with
pm_runtime_put_sync_suspend(), but the remove path only calls
pm_runtime_force_suspend().

pm_runtime_force_suspend() disables runtime PM and invokes the runtime
suspend callback when necessary, but it does not decrement the runtime
PM usage counter. As a result, the reference acquired by
pm_runtime_resume_and_get() remains held after the driver is unbound.
Repeated bind and unbind cycles can therefore leave the runtime PM
usage counter increasingly unbalanced.

Drop the usage reference with pm_runtime_put_sync_suspend() before
forcing the device into suspend during removal.

This issue was found by manual code inspection.

Fixes: 6b6776e2ab8a ("gpu: host1x: Add initial runtime PM and OPP support")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/gpu/host1x/dev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index d2c64728f804..bb6a1647e4db 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -729,6 +729,7 @@ static void host1x_remove(struct platform_device *pdev)
 	host1x_unregister(host);
 	host1x_debug_deinit(host);
 
+	pm_runtime_put_sync_suspend(&pdev->dev);
 	pm_runtime_force_suspend(&pdev->dev);
 
 	host1x_intr_deinit(host);
-- 
2.43.0

