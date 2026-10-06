Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7B23D333B
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 23:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791328806; cv=none; b=uee6oYe3cGEGVAgX4qYRNU7EOaRvx5UFw7Fj1qn6h/tnkmQrToMuYX4j3YniRu/NUEh2AfByM+R0sBWEwafKG/NErzuHHy7JuQRsoLGWT1DUIXD/0R07Tnae/FY4DUDXi4/WEPTzkOp4RlPu9usZN3EaISRe+viPNdgTBxzHN0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791328806; c=relaxed/simple;
	bh=10niGZFDiKXJGoD8gFT7VyvErYmYhbHNcKy+3HEGulQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ACGUNx7TOr/Yvo506quCJUtRDrHRG91b9hAp3BmvGXZXAOx0ni0iofYNB9K9FWzRfUsRYPTw97TO972ztlJIrOE0jYXMLWgcy8FfNWOT68ejQ00U3PSxoTWLtW80UP60siz8jNnTcz8GbYkFb8mJsbTQvydJCJu8GNb+WHwGd7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aR6AStLk; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aR6AStLk"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33e6279a1d7so1989251eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 16:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791328790; x=1791933590; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=69yN0Ial5JtjSpn2ZK2Zu1JwU36ThXT4fMCp+kgmyIE=;
        b=aR6AStLk2NOK9Yfr3vW763Q+NLQRtGZEFJ7R2aHtLHWB2Z3ukd7eQqgvgicvVBs31i
         6E4FDtlCamqCI68JL0hPLh43aRSq+rLJMbEfYaVGM2CuKaW8XbCJ5IeijE1T+//rCIf/
         duNkvLKYsppYwZz2G9ie5bMpJDcQ4oxXR0GEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791328790; x=1791933590;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=69yN0Ial5JtjSpn2ZK2Zu1JwU36ThXT4fMCp+kgmyIE=;
        b=cUDhXAXuXm2tzeiSRl/i+t7FyWpW7bfg2rf+TmxUvVUJJ5B0L1Cqewc7ar51fSLuNn
         b+MIAXA7s/OMye0MOb0Y6jy3nBVDoxYLU7WM5E7iSlPxFTDir6L5Z+XWoc6xeOktxRRE
         1f5JtNfP3mzljrdOXu57So0zNqMBnK5AZ39aXEgGigH2/EavViQyCzLHCunYp8q5dqNK
         PPJu6EkN3vituJT/Kif5ZuMQaBzk8cnVcZUaNMvs82M0nmhgJqlro9Q5Ph2IkpM0UFVe
         XydwnUWTmzu6LijlbcorSnoK3r6K67A/7E+CYOaqZ5CYZytwCKH0LjGK8CaVkSsjcGeu
         GHWg==
X-Forwarded-Encrypted: i=1; AKwUvByh6F1hprIl/bnXvvGlT0PpeRJXDpT4cp5XOjY2EzBbe+qK6AHtepYx9r9qNeEsClxsmySdoNHc0cdwyeo=@vger.kernel.org
X-Gm-Message-State: AFuF++nKr7xvqxBpYNb8alVs8/rR5uY6IG5ANLh82uV+s6yQ6lMtlbUU
	2V/j2jD3r9yDRDgVD/II2c5OGGizc33HzN77MzTP9PU9z7zJGigkIK2v8PY28xdVyg==
X-Gm-Gg: AYBFou0cLg2DRWM34qt/89Q+e0h/a/pC7NU4yTCZDdV3OWCwMOMvwaXvmZaXb66GzTu
	9ytLSDsPlAauUr36j/JQQKJP4Ueryb/egbvN1zuHUYskHWsPATrRn7n3DOWGeLkg+NGLFM4wmTe
	fRDDuGocwLVYOtHs79KBu26Lqi4YDTXBhhbC2pay7HMjRnNMonsoThJz4QHDZOt0pOcW3nIgmQs
	SekfjFand8IvBgQrMG0HfrQiYx2SMWA5tUaiT63JkIdd0hPnoH38sSK5cAOiWk16lx00Q+xHT0v
	U6lwdygVf5UUwSVg3YvHaWj4j/BGiv4UNcIFodurp+NaxyJM1WBwN5iF+v55qRhFtCJcKNWDI+W
	52v0WEF5A0b6ZDUuo1ZIFlRipn94qeWHYVo1jF7h0kYSkJO7vT/4xZG7/DcwAv4xSvOH0/KS4cw
	uwepLEvD8t+scc5thCX7XYiAe6AcwyH5SxTQjt0o4Ytnr6L0q5aENpScmi5JdgWp6mnuY+nkXNq
	OSXIAL3OFqlPhDIENklfULtnYOeyF8tZ+OcRg==
X-Received: by 2002:a05:693c:87d7:20b0:34b:d400:e999 with SMTP id 5a478bee46e88-3515db9c5efmr355962eec.5.1791328789999;
        Tue, 06 Oct 2026 16:19:49 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:63eb:e7f9:1d47:7d47])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-3515abb5389sm1959671eec.2.2026.10.06.16.19.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 16:19:49 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-pm@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Jyri Sarha <jyri.sarha@iki.fi>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Melissa Wen <mwen@igalia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 02/13] drm: Discard pm_runtime_put_autosuspend() return values
Date: Tue,  6 Oct 2026 16:13:30 -0700
Message-ID: <20261006161337.2.If1822f9a34be06cf5939be44ac6465c543087c75@changeid>
X-Mailer: git-send-email 2.56.0.360.g66cac248cb-goog
In-Reply-To: <20261006231900.3230373-1-briannorris@chromium.org>
References: <20261006231900.3230373-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Several DRM drivers use or propagate the pm_runtime_put_autosuspend()
return value, which is not particularly useful.

Returning an error code from pm_runtime_put_autosuspend() merely means
that it has not queued up a timer or work item to check whether or not
the device can be suspended and there are many perfectly valid
situations in which that can happen, like after writing "on" to the
device's runtime PM "control" attribute in sysfs for one example.

For this reason, modify these drivers to simply discard the
pm_runtime_put_autosuspend() return value, and change the return type of
v3d_pm_runtime_put() (whose return value is never used) to void.  Also
drop the redundant pm_runtime_mark_last_busy() calls right before
pm_runtime_put_autosuspend().

This will facilitate a planned change of the
pm_runtime_put_autosuspend() return type to void in the future, similar
to commit 3afd8df02433 ("PM: runtime: Change pm_runtime_put() return
type to void").

Signed-off-by: Brian Norris <briannorris@chromium.org>
---
This patch is independent of the rest of the series, except for the end
(changing the return type). I expect it can be applied by individual
maintainers, and we pick up the end once the dust is settled.

 drivers/gpu/drm/panel/panel-simple.c | 8 +-------
 drivers/gpu/drm/tidss/tidss_drv.c    | 7 +------
 drivers/gpu/drm/v3d/v3d_drv.h        | 4 ++--
 3 files changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index c95964ba25a9..193d1b2b0ba5 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -318,12 +318,7 @@ static int panel_simple_suspend(struct device *dev)
 
 static int panel_simple_unprepare(struct drm_panel *panel)
 {
-	int ret;
-
-	pm_runtime_mark_last_busy(panel->dev);
-	ret = pm_runtime_put_autosuspend(panel->dev);
-	if (ret < 0)
-		return ret;
+	pm_runtime_put_autosuspend(panel->dev);
 
 	return 0;
 }
@@ -389,7 +384,6 @@ static int panel_simple_get_modes(struct drm_panel *panel,
 
 		num += drm_edid_connector_add_modes(connector);
 
-		pm_runtime_mark_last_busy(panel->dev);
 		pm_runtime_put_autosuspend(panel->dev);
 	}
 
diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
index 1c8cc18bc53c..44b0b009c29a 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.c
+++ b/drivers/gpu/drm/tidss/tidss_drv.c
@@ -40,12 +40,7 @@ int tidss_runtime_get(struct tidss_device *tidss)
 
 void tidss_runtime_put(struct tidss_device *tidss)
 {
-	int r;
-
-	pm_runtime_mark_last_busy(tidss->dev);
-
-	r = pm_runtime_put_autosuspend(tidss->dev);
-	WARN_ON(r < 0);
+	pm_runtime_put_autosuspend(tidss->dev);
 }
 
 static int __maybe_unused tidss_pm_runtime_suspend(struct device *dev)
diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index 29fa14be130b..eb002048ae9c 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -669,9 +669,9 @@ static __always_inline int v3d_pm_runtime_get(struct v3d_dev *v3d)
 	return pm_runtime_resume_and_get(v3d->drm.dev);
 }
 
-static __always_inline int v3d_pm_runtime_put(struct v3d_dev *v3d)
+static __always_inline void v3d_pm_runtime_put(struct v3d_dev *v3d)
 {
-	return pm_runtime_put_autosuspend(v3d->drm.dev);
+	pm_runtime_put_autosuspend(v3d->drm.dev);
 }
 
 /* v3d_sched.c */
-- 
2.56.0.360.g66cac248cb-goog

