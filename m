Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BFB481DD
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 19:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789845339; cv=none; b=kfr4n7vxfEjdizFgubCxzMZUZbHVLLbB2+3nOh/cLgyWPqw/14RnBoTLfe7phJ6Owq68wuAZSUprNg5Ipbb3e/7nyGUrn8N/qVZ63ZKCoi328WOwfk8sIzpixZrRxSNbMWc5qXCTnEGb+E4qZbrHjte7F5Ayckqx+YuLWXrZaic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789845339; c=relaxed/simple;
	bh=vZGBjZO+3pK6P6r+j1Br2A8tEHTya3afTzlQC352TVg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qK76vi4i3mfinI3OqUq0wGD0+UsO2oPNf1HzmcE9cxtVtjydOWpFCeoW6oCVA33ONW4a7jxPpqLqMnknyLK7dIOcsn6iVDeLy5WrUarJqXemZxQuUTniqeTtuaOF24YORdeKL0QRblYJYG+nsH+OziuKAgri+0fGaU7QbQpAk80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YYQT2uRw; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YYQT2uRw"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48442ea8f59so1165902f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 12:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789845336; x=1790450136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TYG31FNdE+jTjB9/DDoxQaNK7idCKtZmhwSMIq4k/44=;
        b=YYQT2uRwk2WVmGwAzs4bRf8V6lu0LEgT+argTljooI1ga2NlMxCds7Z/1XDGSMGqN6
         1ygd2nP4ISMN+VUPGDbLRm4G/j4Kc9uwW+kIVsiFWTXTGAU1OIIf8/OSjS7aoJu5+SrO
         lAp1K+dETzsu3B8e9bKxYTc1dgRrcSnxvZ2LDYmZePDw4nnyU8Bu0q9Nz9nHL7IovVjr
         s3xwmBRC0L4XL2ha7QAoF7cG4SWaLbzbSfOPoKfgtDfteAQJsOxfQjZIr49SRKERxH01
         K2ddBNFLeKO7A4Fd9jEhc4of4H8hAMBotlrbJJ15sbT1/Lge6xijrIkn2ze88uWY8XWG
         Nx0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789845336; x=1790450136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TYG31FNdE+jTjB9/DDoxQaNK7idCKtZmhwSMIq4k/44=;
        b=tH8oETVJKNBi8R9pfsw9GEBYHOFo8QN0ZcovzGvPgZQBTh/Q1A/IE8tAtLw2b01X/o
         FQmQrNnKceFES0z3z5XIKFR/zBPSrHUd0TYv8PQExlFvL3/WJDmFt+uvWvK58VJjfL85
         eMINv0dHnS1nMDMdFwDW3sBOff6u79L2GQeO74uW2+vCfIm2j56LJnfXvVZrRDcK+CTD
         4tBovdrq9cjtsgGJ54KTt18mkjYIsM6N8cbHocNHTrdccn1arkhsCvM+fIYRBFqbNFDu
         4G34uC93NlLK8+MK4b8B1EFweHRK1ekAtp66C7r7KOtaK3byMZUd3AtUFhthrl/m+oUU
         L2Yg==
X-Forwarded-Encrypted: i=1; AKwUvBwJePMlw2SUlE+iiMPxpVKLOcLkcx1gdqGEEukvN+K33b59WS4TZh5D4GrauPgGKSRy5puWinbc7JoDKnk=@vger.kernel.org
X-Gm-Message-State: AFuF++mNFFWSjIvZoRgQvrTVhLmKgFsi0RD0VoxU/OYNKA9ewuPBCf3P
	EE99gk9ScWqGtiU8PBz7ek8nx5gOUlWg5quvgdkNPZxYRm5p95RxbQJE
X-Gm-Gg: AYBFou0/RyNItaJENX9p4+KuhQAjyGT0vEVkXY9Nr5EuhrT7GaEVkgqGboL5qH86d0L
	WwVzabi9S6W3ETt4asNecIpO/WhUqyUJ/0fUZeSqIhP1AcbQfTSLDQptu1CRdy7RNtNOZCCy2Sh
	kEDTqzwUKiRU9QxolWI+onb9VnStHajqzLNxEKBvqw+4DYk/behwHSkUAviKcw8h768N57abZvK
	kw5/lLCPBJRdeeqLWQuYMWWPKsmCitE+i7HRlX/vl8zmDpLS4hv4qIYfdbV43XUq/DlafEE+C9q
	eao/Pz4v7OH2/1d1qz14/aWacyyU3csZyt7t7rsZLR44VnnfRzAyKkiwyp0WaPkqV8XHloZ3eaJ
	XMGnbfqZT5oGViEh7fS8XutMloKk/r3miHYZY+OPhYExBI+DJzy6FiBxEThdlCP5z2VneYZagJe
	/qOEx2aph8Y8lASlOFR5jH0wSMo4gQNMTEf32XPsN77hjkC/oiVi7XQeKVn2rNltPQnVQpywDRy
	HEz0INFjVZzwKljMHY7/5Q9FtspObEkxXcjTWEwvtukQCSCpJAG
X-Received: by 2002:a05:600c:81c5:b0:49d:28fc:d6a0 with SMTP id 5b1f17b1804b1-49fbd200256mr159837415e9.18.1789845336038;
        Sat, 19 Sep 2026 12:15:36 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872458f7e3sm8932380f8f.25.2026.09.19.12.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 12:15:35 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: neil.armstrong@linaro.org
Cc: jesszhan0024@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	sam@ravnborg.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] drm/panel: tdo-tl070wsh30: Remove panel on attach failure
Date: Sun, 20 Sep 2026 00:15:23 +0500
Message-ID: <20260919191524.268810-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tdo_tl070wsh30_panel_add() calls drm_panel_add() to link the panel
into the global panel_list before tdo_tl070wsh30_panel_probe() calls
mipi_dsi_attach(). The panel object itself is allocated with
devm_drm_panel_alloc(), which only arranges for an automatic
drm_panel_put() (via devm_add_action_or_reset()) when the DSI device
is torn down; unlike devm_drm_panel_add(), it does not call
drm_panel_remove() for you.

If mipi_dsi_attach() fails, probe() returns the error directly:

	return mipi_dsi_attach(dsi);

Once probe() returns an error, the driver core releases devres
resources for the device, which drops the allocation's own
reference. But drm_panel_add() had already taken its own reference
and linked panel->list into the global panel_list, and nothing
undoes that. The panel is left registered in panel_list pointing at
a device that failed to bind, where it can still be found and
dereferenced by later lookups/iterations such as
of_drm_find_panel() or find_panel_by_fwnode().

Call drm_panel_remove() when mipi_dsi_attach() fails, mirroring what
tdo_tl070wsh30_panel_remove() already does on the normal teardown
path, and matching the pattern used by other MIPI-DSI panel drivers
that pair a manual drm_panel_add() with mipi_dsi_attach().

Fixes: cf40c6600592 ("drm: panel: add TDO tl070wsh30 panel driver")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c b/drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c
index fa961abdd2d7..32f2dd2bcee7 100644
--- a/drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c
+++ b/drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c
@@ -179,7 +179,11 @@ static int tdo_tl070wsh30_panel_probe(struct mipi_dsi_device *dsi)
 	if (err < 0)
 		return err;
 
-	return mipi_dsi_attach(dsi);
+	err = mipi_dsi_attach(dsi);
+	if (err < 0)
+		drm_panel_remove(&tdo_tl070wsh30->base);
+
+	return err;
 }
 
 static void tdo_tl070wsh30_panel_remove(struct mipi_dsi_device *dsi)
-- 
2.55.0

