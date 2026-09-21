Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2286A32B99F
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789978940; cv=none; b=cwzopI8OdGgpRemHSZNEJYYqZ+Vui6XBZhW+qc1JvoGO5HPgoWXy8xPK6eB9c7cXdVpkANRywTZYBauYKpOTSnvakEiODLwMGGP5ofIGoMVGWjAlGl5BHhaBkwBfygDlgkXKlSOvDdlP64eVAB8Ok+B97yfvZSofdwE7h/4h9lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789978940; c=relaxed/simple;
	bh=SMcDrXDqlMLMSWItZhzONWpiQQwJGuLMdSYPsacLrYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LuAl9+ZGYz3p8O1M+zfw8FRgv/So3KDM2xMbM88ULIpQ64BekAEil/AeSKvpfeF2t+I+rZvHj47UHTBDhkpQDIIRXd/hiAyI/DgBPLaXRftGG91bBCIiypNcyNCbA4ToUZT3dTIvNHquSHnTE9JBltHFZ1TRtibOL5RLdC92t7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RoJoQddb; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RoJoQddb"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8686f46e4adso2260855b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 01:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789978938; x=1790583738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oroj33Lk2vXbfhyXWgQGSCksQ6cUFJmkYowA5JxOAlU=;
        b=RoJoQddb4uchlqXHykM7A5DA0hHgsTQxd6w3ppr/vHUbNXoFw6RvEFmU0xDeDW28wB
         R0+7U/fNHLOeWkyEtHKArLnGGGD6TJ3Tu/7O673l97T3gbpCM9aYp/TqUA56qHb9zoWH
         8mHTJFHqhsTgf84LMxdaZR5vFEW+Y+a5GGMufMx+/130kZ2JO8ASA3SV0+1FhbnWrVcT
         Yf/fs+zlxwPQNDKqveOLoz3urLEpj5LyUkQX3PIF6YDhNDsMlLegNhNhJtHDi563cDPn
         E3affXEMOWeUfNQBX/zfXJnoo/G2MdoevDdY89a0wzLy12rHaDOEIx6aC7s1lgWGd57S
         VDKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789978938; x=1790583738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oroj33Lk2vXbfhyXWgQGSCksQ6cUFJmkYowA5JxOAlU=;
        b=VR7qMi5E+nEuOiozTynTidaqSO0Wu4dBzH4IHrVSI7A4zTK4HnPvJ9FdsgOvtkzM6G
         8N/2tczjAymAO0Qtadcz3BqiV9bdKyWaS49NRd8PsKNiOi4fCchf7SMpfp6Xbv9YaiHl
         rVKRAU1Txa2rNaIlhgZg0bPw5XhW20RnoQB5ALixidM87Hz35dMGeXGxHQ7G97/wyjOl
         ifntp8PJOKzle/jbMwAAjV/smjEDrRI//XfctkvUTtBT1RzG6bpxoQSyoJN1w4+wUxKm
         JckYxV3vNVBEV9O1AKri13OxfFXcOXVIcPaS4leUNz8Fddv7OaTArA2baNfHJvkUOBIl
         H4sw==
X-Forwarded-Encrypted: i=1; AKwUvBxp5qHp3XdnSwUYcd2W585w00orikAK8wAjLxs5vL6NPZlvjXVmYIEYcbtGWcQ44iOX/p2w0VPFuvToHnw=@vger.kernel.org
X-Gm-Message-State: AFuF++lZNs/SGDdfL2Y5W4XzYepA/SgxdqNH5qCDLKnG8LaasZK9X6mL
	T1xIRInLXfuX+pPukReIM/k0OfhuTPGbk2v3pAUeu9m95k+jGsHBPDty
X-Gm-Gg: AYBFou0VK6Pbj4tDQ3g1FSKYWKcofYd7HD1FM4NB/BWosc7X7x+aV3SC2IBAqv+qhQr
	gFiN0V//o8upT+gMVRMoNtwtor1OdZNmea70mk/7Has4KCCSDqmHUGj5nxB7anky9fXMCMe1S49
	4yZrEP5RAVlbRqWRXGb3GHR2JH/tA03HZHCv9kALayayZ0Afjxyt+wXDzfz2E+0cbHz1IbyHoo0
	z5y+sAHf/H4PWapBxUBxxni0d+9QzCqJXlEVpLCgB3qw03FwabEmC78NusvBAzNze9xmgla+FDQ
	MoGxRsxq1dWqV7rCtvmD0zfHM+Y608StyfF1fil1p4aEo7ujh5f+sjh6uI/FURVEUP88RJONWy7
	LusBvfc4Q24uQHMHX1+18KxWnJ+D5XIeme+0OP7aR3Ts5plFcpraVnf51OWbDJ0hSAKv9jm9tRN
	Ah+HZDMxMmv3Lt60GzbgW0PoOWIcTFCzDtmEQn5a4SyqtTZzu7TEaUPm1QPpqefky2vw==
X-Received: by 2002:a05:6a00:893:b0:871:9e1b:8a75 with SMTP id d2e1a72fcca58-874dd7f8ab2mr13461980b3a.20.1789978938500;
        Mon, 21 Sep 2026 01:22:18 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877aa104197sm2861748b3a.45.2026.09.21.01.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 01:22:18 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Ulf Hansson <ulfh@kernel.org>,
	Dmitry Osipenko <digetx@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] gpu: host1x: fix runtime PM reference leak on remove
Date: Mon, 21 Sep 2026 16:22:06 +0800
Message-ID: <20260921082206.234421-1-lgs201920130244@gmail.com>
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
v2:
  - Replace pm_runtime_force_suspend() with pm_runtime_disable() after
    dropping the runtime PM usage reference, as suggested by Mikko Perttunen.

 drivers/gpu/host1x/dev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index d2c64728f804..123143b2836b 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -729,7 +729,8 @@ static void host1x_remove(struct platform_device *pdev)
 	host1x_unregister(host);
 	host1x_debug_deinit(host);
 
-	pm_runtime_force_suspend(&pdev->dev);
+	pm_runtime_put_sync_suspend(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
 
 	host1x_intr_deinit(host);
 	host1x_syncpt_deinit(host);
-- 
2.43.0

