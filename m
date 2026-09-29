Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59603374A0E
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790668923; cv=none; b=iF1040rVhzM3jmZtF2LYxJU8542ojPqu6DaMWxI6U/0aG8abT8xlF8NNs+zSNn+wgDhypW9aLsf8dxWUhYQFSCf2EiRnfv0RJS1nDIRgkVeJaUcHLpKm4oSAddphp71ZDUxTTH8Cg3Hmx9i7a6psQNbQ+/8H8qsEtF/2OwmjwGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790668923; c=relaxed/simple;
	bh=azIHzYP1x9a5meWEF2wJyB+SWJZ55oIXl0DGRzrzQyE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WggkdNJS+MK3kUArdh+5BDlC3D+l9GkqeRmf8CzylsuueR8bwEsvcbmmVwHwMDDY5KsBwbKx4LaLGCgdWSgQnXyiERAjIHXhmrhKddwsZ6XSS4zyriWXtaxf1q/x2YB13L2I4jq9Zo9ZIAJq1++Ge9NZ/AvHsi3KzvxrCASJTeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fMc9BsB8; arc=none smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fMc9BsB8"
Received: by mail-pz2-f38.google.com with SMTP id d2e1a72fcca58-882833a9f61so1830465b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 01:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790668922; x=1791273722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SSQZyZEz06a3fdZn5+IeTwoBHZwphcMSLAQAOls5WNY=;
        b=fMc9BsB89WBGN5KX10hwv5DWvO7k7K3eIHSihPcGecAj6r/rrAz7xDCSxcxW6awDSt
         teE9CFQNWfvzYeQhae78otGLIEQ8ysika6L2PY+k3AXixeM4zUidKQr2lITOR929t6jM
         lYlE8E4dnndxKDQtXwDGZ+BZzaSyZPVDCwz8EIKoT+n0lVWHxDgtH7ATAuUQaIHYduf+
         lSxkPmwH6fHNyu6jdrG28ig4gn+eHTn/Y3Vru4fR1zjBaTB4NdeVWoECzHa0WvLhzYgJ
         ptNiBkB6/JkxsEBe289qkrm/8uklruiSkYjaBQwOnCvraqieWAKXRZGMb7W7lzh1c+0E
         DYWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790668922; x=1791273722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SSQZyZEz06a3fdZn5+IeTwoBHZwphcMSLAQAOls5WNY=;
        b=T+OdgkHvDt48RZZ5JUdDUayUn0m4tXdDIWX0acaH4Fk8Z9kv0qUuQ1AhA+MaPvxLus
         E3Rihc44P7c6nzY+e02oTACNvru8EJYC/ZEI8ZB3ZZroAq8yMDNfIF0m32QKY17URSH0
         2YkkYcBgsJS1dVNspk62VIo+psZLRKRzJ9PAB9b5KjyqwJRs8PcBNbqJulUaJjCzna4k
         iUODHPZHDOX4Qev/sU3HwEY1J0e6x7kSUfu/eztRn4qWAPnAlUD3EXFTmy6hfbTmE2Fi
         /9QnjT9hZOjLyjRo98aN+Gz21b9vG1UZV+UdoV193UojO9trZ6oQzp5em6lZP12CobMo
         E2dA==
X-Forwarded-Encrypted: i=1; AKwUvBzETm0hDF+hwWPwo70hA010YTBosnwwJcD4FDpub21NR4pZHQyKdQFOLPaeyo4+NFEMtR+GMsSNVpR+qbg=@vger.kernel.org
X-Gm-Message-State: AFuF++lq0Lk/a5Tfp5lJCEnSU3co5fqCQlPjMURCDCAZzmwD+Y3huAOr
	WWSa+rD6Pmvh+dx5eSv2lBXmFRVLBFkMIKZG4tkAu0QteWvc0xhctiGR
X-Gm-Gg: AYBFou3LbR4y3dFzvuQt/zY2NE+IWXX4AvyH+eKQnDTQZencuWu/5idNaKBFzxioJ/N
	52peIdYtOwmk9iKveApFL3c1tpJRvUuAiIwqlMVu4IrwcojzWorTeIp1mjMVeUGStxVDhiu6tTY
	Q3N/VBhAMXuoMcFg2qYnvYfdv3thtejmBxkKnGuzwxAu6u3Rg9BXFP1Xtx+i4b8X9ujHvbxJVQh
	V+ApCptHEWVs2bBn9wco59B4J/xOCTCQiitek2WTKB6GGawRfdIuH/IAiSSHFzxTIAumTMaDdDu
	8T9FHK+LoiINCMl6PO4O+XxwVCUP7hk9VradMyV2lOo8k4SQ3dFt4sTMa7Kdqqu58EXfxExvKiE
	vzv0m/kasUd0FyKQsK567FnnOtVBX0/TJEkELr8IroIduTi4hiYrJIKBDL2/AmwSRNsCNIWxAil
	DpqA62q3cWllYz6O9+u8W/tHEYEN1OCW/MTYIxHdqk6/yt2Ei4fljC4tMPQdcFMKprJQqgJ7kfF
	FxlP11fCIiZB5DcQKCX6HNXKvV979qrVMceauUY+3zoFRa7LRAVFg+f
X-Received: by 2002:a05:6a21:820c:b0:3da:ebec:69c1 with SMTP id adf61e73a8af0-3de26c83b87mr11531089637.24.1790668921486;
        Tue, 29 Sep 2026 01:02:01 -0700 (PDT)
Received: from pc130107.ADVANTECH.CORP ([123.51.235.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-885e1067425sm372775b3a.13.2026.09.29.01.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 01:02:01 -0700 (PDT)
From: Hsieh Hung-En <hungen3108@gmail.com>
To: neil.armstrong@linaro.org,
	jesszhan0024@gmail.com,
	dianders@chromium.org
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	Hsieh Hung-En <hungen3108@gmail.com>
Subject: [PATCH] drm/panel: ronbo-rb070d30: Use mipi_dsi_*_multi() functions
Date: Tue, 29 Sep 2026 16:01:43 +0800
Message-ID: <20260929080143.559685-1-hungen3108@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the deprecated mipi_dsi_dcs_exit_sleep_mode() and
mipi_dsi_dcs_enter_sleep_mode() calls in the enable and disable callbacks
with their _multi variants, as suggested in Documentation/gpu/todo.rst.

The callbacks retain the same return values. The new helpers additionally
log an error if the command fails.

Signed-off-by: Hsieh Hung-En <hungen3108@gmail.com>
---

Notes:
    Compile-tested on arm64 with W=1; not tested on hardware.

 drivers/gpu/drm/panel/panel-ronbo-rb070d30.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
index c3fbc459c..ebe6352db 100644
--- a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
+++ b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
@@ -75,15 +75,19 @@ static int rb070d30_panel_unprepare(struct drm_panel *panel)
 static int rb070d30_panel_enable(struct drm_panel *panel)
 {
 	struct rb070d30_panel *ctx = panel_to_rb070d30_panel(panel);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
 
-	return mipi_dsi_dcs_exit_sleep_mode(ctx->dsi);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	return dsi_ctx.accum_err;
 }
 
 static int rb070d30_panel_disable(struct drm_panel *panel)
 {
 	struct rb070d30_panel *ctx = panel_to_rb070d30_panel(panel);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
 
-	return mipi_dsi_dcs_enter_sleep_mode(ctx->dsi);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	return dsi_ctx.accum_err;
 }
 
 /* Default timings */
-- 
2.43.0

