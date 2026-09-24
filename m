Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C37F32C924
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 19:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790279741; cv=none; b=MJvxosTS33JC+SoyL4MZ01voUQ7RPFNuRMBgKMaY7ylQIKkDoDoGoe9KNrFWpuEnVpTRhFbpw3WQn5jjYJBv2Ae2KzsOAQmMlfeLwxoNC3nx6J121IohPCVAA0oMl5qRXyL/+IR15sX9qh/jR6H5iRXBGVykXvAQ8sMI66bmJtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790279741; c=relaxed/simple;
	bh=D7keJcwSqQOp0NdseY0wgS/ZtqGq5arWxyNwX4kPY/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pyf9azLTcCerCnHA1kncw1OsnxO5I5IMdmsAafwphbVlcy9MKZ3Uk4O3wQ2pn9EmRmZ5QIZk/G8+KrGxCrnLtRSAMcPAvm3+ppBnnlAcsbw40HTAjNhlWKhehN+WxUmK81XMErfXOoVooDPYKAxCFsNzEiBOwzP+UJjGSrALrqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T2ffVWZT; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T2ffVWZT"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3931so1687035e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790279735; x=1790884535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=enCFhbXwk6dv8V+Qy1/Wb32GY2e39ckcjINn4OP9c1c=;
        b=T2ffVWZTjlXPmKdN31mN2kxJ4x/5mXymv4ikfd6E22R1vjZeaF1eLaUr96Io7vQp4j
         4K4CtDcMiiHlQ60CgKcSwXFH8vpTH4j/EDOzPH3Hyun+ZhdgN0IBm9Iv54ust0QaI4tj
         Wn6QN2zc/O2eDpDtlYeLZPR07XM7oUX/rW42MVVYVvGDce6tGTGXX7OuMYnHrCg4UaGH
         wVjku4mUnKRKg/9W/8I0x3BbKBFEoCIhQGkopqw4AFaEqKtXy+l398U+No5UqSvMG8G6
         +HEr2VOP+MJKeM/lWjs2nAc4lw6ZJzpwR8eLScMFs4vH7hOQwhXPBESnUnMemNH7yeWF
         13KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790279735; x=1790884535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=enCFhbXwk6dv8V+Qy1/Wb32GY2e39ckcjINn4OP9c1c=;
        b=z+2z+Y5PAKvv2O2I1WAQJcadYvNgiqJ8ZFyy0ySogtMnAQGoxrh48WBGW3n6UJm4q+
         DO8Nx9bcL0b81dJbLX1DUoNhT3X0un7rBpIdtVn4VfBICCdiMqkIZBAHuc4O/b+PbR5B
         ++pdDwXaJ+QJWrrfiEiWOHM4vaGWHskjFs4Fzzv78CZzb6k5HTW9HCNKbpZyCF5dPb8F
         YKYHphQIeBXgbW2yenHAnpZJm+6pmSQskTpjxahGDxr/pfJ3h5as7sDFHLAgGZ/oUIvV
         DZ4uIYZs7vZf/WUrlNeheDbvtyMRp/2FJD0eAgdsOvYlqSbPAHflC78awsLMos5C/NEr
         atAQ==
X-Forwarded-Encrypted: i=1; AKwUvBzV1nM9Oup8yNXdjXEHApvAccw30DCDH7ZseYZWE6X0mN9Pij5HZnfOi/LCR6mCRO73ydcOwJrCfLj3fDY=@vger.kernel.org
X-Gm-Message-State: AFuF++lAkLyNdEDwwqacrbtVJUAixgJtwt+MfnGwwUsnA5UCeJDdO+31
	rDzABVu1Eq9dDVzWDoIqdz5K3kRs311TTUZJ2yS+EAUq6kznM26tTTEZ
X-Gm-Gg: AYBFou359rvKW40MCTUaiWStMxlMik0VjrRfBumNL5ks/kN+kQ0/5WUrMGDNrePG4MN
	DJX2cTHcPmFK22OSS6YeCf7dN4juYw9GRmjlQJP1JP110D98kj8zCCgd6lhZXhahpSqhVmXaqm9
	C8VenanJRlOSy+bKsUtgOcKQ3W5VfuCAVnU8RVo2wPJvPa8oEYr07yyO4T9gEQWDvnsyYr4Re5n
	3FyI3onN3CIM6WQqM+rUO3z6cSYaHISk2inNi0a6TqoukXo/EuRUDOCyxe5fekUK1vzKqxw/pQ+
	LpWcz+6vGw+sGtb22BhgGNjN93+mXPnFjvtfL+B5RFZN7muY2JmV+iZqklzX6LuW5/MeKry2r54
	1sCa6saoKJf1OLDWW6uudd4hKy4XX/trKVy43jd6v/7LXZnFIjK7G9EyNYzgTrIG3yJoofZNj7d
	S/oTZx58b6alo7L+8pVjpNI7nGAy0+SO8QTv0dAmPHmCV10dKgY9QkjRWODIPOeKjO+hBmfmffP
	g+zoqdZ3z4HBNpUHfo8bN1um8T7KNkjK6q+DndPYbn9F1Y9Ax2/
X-Received: by 2002:a05:600c:6290:b0:49e:799a:8969 with SMTP id 5b1f17b1804b1-49fe6707bb7mr68120475e9.30.1790279735177;
        Thu, 24 Sep 2026 12:55:35 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff06cbd2dsm1277235e9.12.2026.09.24.12.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 12:55:34 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sam Ravnborg <sam@ravnborg.org>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH v2] drm/panel: tdo-tl070wsh30: Remove panel on attach failure
Date: Fri, 25 Sep 2026 00:55:12 +0500
Message-ID: <20260924195512.336690-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <message-id-of-your-v1-email>
References: <message-id-of-your-v1-email>
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

Switch to devm_mipi_dsi_attach() so mipi_dsi_detach() is handled
automatically on unbind and tdo_tl070wsh30_panel_remove() no longer
needs the manual call. It still returns directly on failure without
touching panel_list, so drm_panel_remove() stays on that path.

Fixes: cf40c6600592 ("drm: panel: add TDO tl070wsh30 panel driver")
Cc: stable@vger.kernel.org
Suggested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
Changes in v2:
- Switch to devm_mipi_dsi_attach(), as suggested by Neil. Drop the
  now-redundant mipi_dsi_detach() call from remove().
- Keep drm_panel_remove() on the attach failure path, since
  devm_mipi_dsi_attach() doesn't touch panel_list on its own.

 drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c b/drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c
index fa961abdd2d7..ea59d4993ff5 100644
--- a/drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c
+++ b/drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c
@@ -179,17 +179,16 @@ static int tdo_tl070wsh30_panel_probe(struct mipi_dsi_device *dsi)
 	if (err < 0)
 		return err;
 
-	return mipi_dsi_attach(dsi);
+	err = devm_mipi_dsi_attach(&dsi->dev, dsi);
+	if (err < 0)
+		drm_panel_remove(&tdo_tl070wsh30->base);
+
+	return err;
 }
 
 static void tdo_tl070wsh30_panel_remove(struct mipi_dsi_device *dsi)
 {
 	struct tdo_tl070wsh30_panel *tdo_tl070wsh30 = mipi_dsi_get_drvdata(dsi);
-	int err;
-
-	err = mipi_dsi_detach(dsi);
-	if (err < 0)
-		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", err);
 
 	drm_panel_remove(&tdo_tl070wsh30->base);
 }
--
2.55.0
