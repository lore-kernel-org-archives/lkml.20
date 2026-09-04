Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E60852ED27
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 21:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788556838; cv=none; b=FoKog+tNUrTOWETlVjQ2QvbkuIRIIdRwg8yVLHQ5mo1RwTAdfJ3rJYrIIPJ6ImxKBrRFN/yRieQXJXr7fceLQ4At/BrgbmzaBHpVm/5vlzpG85rOODrFisklVen8Un5ym3Gc2XhU5Kkj+FWojtnFm2APRfGHeuIQySeBh9j+wDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788556838; c=relaxed/simple;
	bh=P0eQcHYcmOWKVxWCx0wymuD9OObSAIkm60t94YUG3AU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GqJzANfV5YR7C3GhbgvjAivNO85CnLRLFjiYg9U64yyNqHBp74onIlJBARmB26UsvBTwEda46P0rFBqsK+7cQNPO3rnJwfBebQkS56Zlay08kRaFLPVKKIzX4uClw1+bwHW58D5xWwObWf3YqQd8pJKpeUmNzFjYrcdAMJ7v/E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gFbb4FyN; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gFbb4FyN"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d72ae08fa1so14390485ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 14:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788556836; x=1789161636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CgbXePwlXIIaNUXfDEVIwWo//QzJGVGkingWQIsticc=;
        b=gFbb4FyN6xOvtQIsGa8E1N3FXjfhAZ74Wgvx2lqS8rrlRGRFr/nYvtLyaPvnogTzfw
         IHw6v41lruPymauvRZuhuVfSAGD3L9vhgvQxjj45/p5kTSoeRK4kmJTQusWNYVEaVjSv
         vyH1f7xbKWF+piqOwRVTK0y87O33SNRd+hAgc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788556836; x=1789161636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CgbXePwlXIIaNUXfDEVIwWo//QzJGVGkingWQIsticc=;
        b=ZcpvqJ8gF9j1EfO7P1ICh+xg5TfgaxWbTUtRrK59RQgD4f17CevkmIWOkbzEOvvsV6
         +o4lUg9z2U9lxeeZCbvBP1fFoIIntD1De2mdd8XnzZQdlIsig2bfCWYUbkkvL1ev92oi
         y32WEpmz7Psqk/FT5/WPXRZtT/mEPo2seRq97jaxiRFH71b2FgMKpJ7GDId2LHKE7I35
         c4LouY1Erp4WS2LIjYT5hX4IDJ5gnuYK0GvAfDMwqGt6SZxZDeDE92X98VmNA4r8M+AE
         bD4lQmCFZo46A/EEQpoIQ2MjT/xu6+S1va5OtcoZktjAMC7tSLAnrveP9AB5d0M9IOOj
         UN3A==
X-Gm-Message-State: AFuF++ncwzCX8vC0lDJdFWDv+nBXtqPq6EyxauccLIwwZqbX7W0nKF1+
	j7/rDApYd7AeyhJvuBlg7LQ+s8edr9Zc88lTTwm9MWetApV7DI5m3Ysi4NlPriop8Q==
X-Gm-Gg: AYBFou0VLDVIGiXPzp6cMOQmmz0jjcBK/9/qXMOqaypkum+EDkblzfDtd4ZwGdtzAav
	sTsl7Ruogrhb8bwam346DTr4BvQs5a8HABjVdZq9tjqbxZ/5K0O3srO5NyJqhUIag0yHOT5QaTo
	QFqeAuOvPv79qgdC/kU+8ug2WQmUCGAUdcVzWMvC5wUAS+YF2TFyzJO0ioBR1Gh0ZPMFYR84EfQ
	R2r7+POn1ECpdHqZXDud8ReJVUjEZLbYGL5hMGl1CGgch9XffbZV6eCaLx8nxL/XzlBz0u3gcih
	t2FkDyDSb8CYYlfhp6fAK8X7y3ADfdvYzi2g32o+RuL4hL4A89x52HDP2Az05gXFgJRiXou8ioq
	mv0AvzXFHK07qrT0VwGSALQXL7oWYs+tvjFiIko37XoHSaHyUyRlhIb8ABtyzRCZ3gbon2+R4an
	xSPgATld2RJ39X61Pw4gyjbmuLNpKzLcHUushrybFRpjnUBl/cIzE8V9mROHeAn3Sd7hnnQUYE6
	VVyB6MY3oqZdkGgI7abMLPlmDI=
X-Received: by 2002:a17:90b:56cf:b0:398:dcf6:d40e with SMTP id 98e67ed59e1d1-39b262aa580mr14262560a91.17.1788556836441;
        Fri, 04 Sep 2026 14:20:36 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:5597:62ab:c321:4a7f])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-143243bfbe3sm8877936c88.11.2026.09.04.14.20.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 14:20:35 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Len Brown <lenb@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	linux-pm@vger.kernel.org,
	Pavel Machek <pavel@kernel.org>,
	Doug Anderson <dianders@chromium.org>,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH 07/11] PM: runtime: Clarify ->runtime_idle() callback return value handling
Date: Fri,  4 Sep 2026 14:12:12 -0700
Message-ID: <20260904141215.7.If6e26acac7770c65446dd0b81f891948abb38973@changeid>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260904212000.4167880-1-briannorris@chromium.org>
References: <20260904212000.4167880-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This doc says "Negative error return codes are ignored by the PM core"
for ->runtime_idle(). This is misleading: any non-zero return value
(including negative error codes such as -EBUSY or -EAGAIN) tells the PM
core to abort automatic suspension of the device, which is commonly used
by subsystems to prevent immediate runtime suspend.

Clarify that unlike ->runtime_suspend() and ->runtime_resume(), the PM core
does not treat negative return values from ->runtime_idle() as a fatal
device error, and that any non-zero value stops the PM core from
suspending the device.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 Documentation/power/runtime_pm.rst | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/power/runtime_pm.rst b/Documentation/power/runtime_pm.rst
index 620b6988deca..334fbdcd8fd6 100644
--- a/Documentation/power/runtime_pm.rst
+++ b/Documentation/power/runtime_pm.rst
@@ -203,9 +203,14 @@ suspending the device are satisfied) and to queue up a suspend request for the
 device in that case.  If there is no idle callback, or if the callback returns
 0, then the PM core will attempt to carry out a runtime suspend of the device,
 also respecting devices configured for autosuspend.  In essence this means a
-call to pm_runtime_autosuspend(). To prevent this (for example, if the callback
-routine has started a delayed suspend), the routine must return a non-zero
-value.  Negative error return codes are ignored by the PM core.
+call to pm_runtime_autosuspend().
+
+To prevent this suspension (for example, if the callback routine has scheduled
+a delayed suspend or determined the device cannot be idle), the routine must
+return a non-zero value (typically -EBUSY or -EAGAIN).  Unlike
+->runtime_suspend() and ->runtime_resume(), the PM core does not treat negative
+return codes from ->runtime_idle() as a fatal device error; any non-zero value
+simply stops the PM core from suspending the device.
 
 The helper functions provided by the PM core, described in Section 4, guarantee
 that the following constraints are met with respect to runtime PM callbacks for
-- 
2.55.0.979.g7e5102b832-goog

