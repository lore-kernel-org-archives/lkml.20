Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793593948;
	b=PUxH/6ercy0qJDF2Gle96H8fU2OIV+gMuluiYQ23+2bMm9tDEJJiiF70K5+v6NtelSZb
	 KmFNoIVX5w5M8oJ0oQhk28+EfxhsvEbQf4Zr4oMOIqisoO5cVpJf50m8JUmvkQDgVoudb
	 6d+E1ac68As1+DMmjjiftL8TwMWFxSvFEtohwz4Hqa+suFsmfvkhSZsHw0Gx5wfGOKFzF
	 e2JTOzIQqrcww746moc1y4l8D29tytd6uCSXUBrnxf4Q1NNo0Cfd/NVOiILmwwdv+182k
	 jkiZ4sOFDVgCgPdoB8vCih0UqvOAtuAo/ia6GjEmo7zc7KaURdjCst1gfxrNQQysF7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793593948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=N4/DN4JjGSFdmF5hzcGibgD4U5xzUUUKSaINBRUdmcc=;
	b=diKSSdJDtaMc9ICpf9+gL4KuHLrdO5SqYbTYwEgF1CQGRrDfREH6a7By7p6ah7EmLxuj
	 LqgKlNLTJAcuBeZnXir251e2hBmimUeuySpclhez1YrQ8VHKKjI8SYmDrJhj/l4bCnNRo
	 xntRBfFxcHhetAlpIXPW94SPtDr9wV3OBitPSmJeCOGuIGYOOAmXxBRwVmBkQmmukz0yy
	 2hhs3s2kGuiS+N/qqP8rzHmd50KOTfZHkxL/UskehsdTlPkxxdqjoYkLmIGUkmQXx5aLK
	 FQaxhaLBpINohjhxS4Adw1T7vwpRxwzMAmSdYI0NQ9oYxXAA+v4zAkQ8xeH4OwkfEFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZnrfGSUI;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4390C606A331
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 04:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4390C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZnrfGSUI
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36a1947498bso302653eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 20:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793593947; x=1794198747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N4/DN4JjGSFdmF5hzcGibgD4U5xzUUUKSaINBRUdmcc=;
        b=ZnrfGSUIQ5xF9CgElr4CwKGQKaCa+7DIX2yyCiXzq4Y+v1G4z37qIBT2BohmfIVeDh
         1fzj2TgsEamKkLaXEmGswNKzq0RXjG5CpE2ksS1NxK6pVbNfRZTHtZSTa5nCf0c5PSJ2
         JR12YHsZXLZpgRJFZMFwupkaSOBhlKqm8+K3bSUoWggJSu8otcyFX/j7DAXKatX/YAV/
         hu3b6l+s7vckOdE/v4AVSdK+qN8l8xdwx1Vd/VswSO81of/ot++buc+wEfLQ0BSUFNFK
         6nDfrKX/D039rWk170fA0LQej4IT8H0iuY5wD2jRED3iuJAs1BrU67X8s28zC+nMeXnq
         24tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793593947; x=1794198747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N4/DN4JjGSFdmF5hzcGibgD4U5xzUUUKSaINBRUdmcc=;
        b=0ZSAgtHr4oUEYx4rTXKTYBmpzz88eNbUebmYOgjrskUxJRAId7as/wwtYCE9u0UR3w
         MiSgFj5BA94+gIJTG+mh44XB+jM3LGkhXeUKllb2bCDqgxAOPjL/0XJcNd4c5/erclT8
         JkebaAtSVie7Fm7tFmd0HuD1GWwsT3M1QzGh578V/527s0dicCpxcPOPZiN+Bj0UJuxd
         Xh7bLt0gKz+kF3M7Rlc/GlE9nypgqx7PGV3xZ0XI+z1Mdg7SHyvbx1vcSZsOnTKvJBnl
         n8pjEpImom83mAxSBF9tfZRYx+iLj9ZMZ9z6aMSSJJrjFryLYU5bcFCmrJJBEWQJCZxX
         HWyg==
X-Forwarded-Encrypted: i=1; AKwUvBxjVYXPPA0EbAILeGT16LMDKuClW+9xYLgEmZRaVePS6wrArO05RDrA0V+3Iy2yhyEqNkEwOfnsNd46k3M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8u7hzTqFBQgA+X76LT2K8zwMpPWTtOID5sv/l1C2khIHmmNW48
	YQ3MrZY3jFQQ3IwqpjkJRj9t4tU6B9eQ2dDKYoU/TqRjbxPapZghBz/2
X-Gm-Gg: AYBFou20WeI6BGgWok9jfnNG7RfssKaf1Ifc3VRDHEBq9tzaHCeIUuVDqQGALeduKwB
	q4tOJhPIhNm1bPwJx9ytTnp694FPQ9bz5bOh4z2EFrYjkHXZQyY8duO3QNqDJ+TujQ1KOABicqb
	c5muRZcHsAIDxNFsbpkeWZNfVd+YP0HBtXj5QFHA5WD0T7ZH+IMu1hxHDTeuzLrFFFOlp7/rQ0+
	30T8ofq8WysW2idtRXjlTBOwOY5mwCM8jVicb803hfNW4bZO1MfokM8rEIAeMAC8r2BcGJxhdAJ
	Py3Eum+eycBHpBSRRy2v4kPLROY/o0nWVA1vytamnAHh2omANHXfCmhb8AoiNknrhRhE/fEN0EJ
	eNHeGDhWmFcXhmbwQGfvuckfuRWjQuLj2zgHW5ixkY4F+it9wyUCFRJysekHXfjYMujeWK8/Jxo
	lAqC6LCo7CULOfoDgMAuRAv4ZF1f6FQBCOOplTZVkZZSgCEgxISsDzWBVEYCwFLBOTTDczpPFI2
	DZGGX55Mwuetm94OCijZVi1J8/DG20o8F5YVvSlzDV61eg3TPw+sLTNdroKV0BAC8Ayq4oHUzyk
	9i2e8RV8FepEff9ZESooSYayteaSBBy09PyK/fnw0qYELf1KdEM8EyTkeyEDThGt8jkQiYmjpbk
	rBEUJBqR9UfvtOG2dreDpinsLYXL0BAB925MduIjaE0OgKEZmhiKXl5fwwUqO
X-Received: by 2002:a05:693c:8806:10b0:369:f97f:72c1 with SMTP id 5a478bee46e88-36a4241bbd5mr14639941eec.36.1793593947131;
        Sun, 01 Nov 2026 20:32:27 -0800 (PST)
Received: from NB150512.ADVANTECH.CORP (118-163-147-185.hinet-ip.hinet.net. [118.163.147.185])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm38581063eec.26.2026.11.01.20.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 20:32:26 -0800 (PST)
From: Hsieh Hung-En <hungen3108@gmail.com>
To: dianders@chromium.org,
	neil.armstrong@linaro.org,
	jesszhan0024@gmail.com
Cc: jagan@amarulasolutions.com,
	osama.abdelkader@gmail.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	Hsieh Hung-En <hungen3108@gmail.com>
Subject: [PATCH v2 1/5] drm/panel: feiyang-fy07024di26a30d: Fix prepare error cleanup
Date: Mon,  2 Nov 2026 12:32:11 +0800
Message-ID: <20261102043215.990351-2-hungen3108@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102043215.990351-1-hungen3108@gmail.com>
References: <20261102043215.990351-1-hungen3108@gmail.com>
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

feiyang_prepare() returns without disabling previously enabled
regulators if enabling AVDD or writing DCS commands fails. Since
drm_panel_prepare() does not mark the panel as prepared on failure,
drm_panel_unprepare() does not call the driver's unprepare() callback,
leaving regulator enable counts elevated even after subsequent
successful prepare/unprepare cycles.

Disable DVDD if enabling AVDD fails. On a DCS write failure, restore
the reset GPIO to its unprepared state and disable both regulators,
preserving the existing 10 ms power-off interval between AVDD and DVDD.

Fixes: 69dc678abc2b ("drm/panel: Add Feiyang FY07024DI26A30-D MIPI-DSI LCD panel")
Reported-by: Douglas Anderson <dianders@chromium.org>
Closes: https://lore.kernel.org/r/CAD=FV=Xm48DUT==8HuuGCSFZtLTEk-W2Q6UTfqt-MnM4nULzTw@mail.gmail.com
Signed-off-by: Hsieh Hung-En <hungen3108@gmail.com>
---

Notes:
    Power sequencing note:
    
    The error path retains the 10 ms AVDD-to-DVDD shutdown interval
    used by unprepare().
    
    The FY07024DI26A30-D datasheet, Section 7.3 (Power, Signal sequence),
    specifies T10 > 0 between AVDD/VGL reaching GND and DVDD starting
    to fall. The delay allows time for AVDD to discharge before disabling
    DVDD, but compliance with T10 has not been verified on hardware.
    
    The existing unprepare() comment associates the delay with T11,
    which actually specifies the DVDD fall time (0 < T11 <= 10 ms).
    That comment can be corrected separately.
    
    The msleep(10) checkpatch warning is expected. T10 has no specified
    upper bound, so a longer sleep does not violate that timing constraint.
    msleep() is retained to match the existing unprepare() sequence.
    
    Datasheet:
    https://files.pine64.org/doc/datasheet/pine64/FY07024DI26A30-D_feiyang_LCD_panel.pdf

 .../gpu/drm/panel/panel-feiyang-fy07024di26a30d.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c b/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
index c1d8ca5ca6e1..bb4cc1ea2ece 100644
--- a/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
+++ b/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
@@ -59,7 +59,7 @@ static int feiyang_prepare(struct drm_panel *panel)
 
 	ret = regulator_enable(ctx->avdd);
 	if (ret)
-		return ret;
+		goto disable_dvdd;
 
 	/* T3 (dvdd rise + avdd start + avdd rise) T3 >= 20ms */
 	msleep(20);
@@ -84,10 +84,21 @@ static int feiyang_prepare(struct drm_panel *panel)
 		ret = mipi_dsi_dcs_write_buffer(dsi, cmd->data,
 						FEIYANG_INIT_CMD_LEN);
 		if (ret < 0)
-			return ret;
+			goto assert_reset;
 	}
 
 	return 0;
+
+assert_reset:
+	gpiod_set_value(ctx->reset, 0);
+	regulator_disable(ctx->avdd);
+
+	/* Preserve the AVDD-to-DVDD shutdown delay from unprepare(). */
+	msleep(10);
+
+disable_dvdd:
+	regulator_disable(ctx->dvdd);
+	return ret;
 }
 
 static int feiyang_enable(struct drm_panel *panel)
-- 
2.43.0

