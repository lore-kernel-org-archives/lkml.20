Received: from mail-lr2-f8.google.com (mail-lr2-f8.google.com [74.125.230.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1D04AA3F4
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 13:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791378849; cv=none; b=XDSjjOVbtMku/hi9743oPNWd0VXxtMgeNSGcymwVkjBrKd7cfL9V+rLjTXqFEOKF2KwfJkmxP2XDrXWHmMgEVt4j89quJFRuhHRKiwP56HPZKMJqXszAWmTuYZ6quIbtEL206YqzQLDe4mMg/neS+MIkByUf4owhxNSzPU62bQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791378849; c=relaxed/simple;
	bh=kJ4NvHUo4zbotyE0mXOMEDCCr5w/LemtNXeMWfpX4kk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XNZBDdBfORRRUh66arDKLIg/GpB7Qwey5V/PwQihhz1bX9eR/aeeZPnYvbV/g9Rbs8++qgDBMtC5Z180e8x4lgCTwpopx8ZbGRp4iKy429Y1qvQjC/kJnhui7c8dkLLYpDZtdq4lKzxNfDra/Gnu5t371u3yGn+p9HMlgC3dLQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YoyPnek5; arc=none smtp.client-ip=74.125.230.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YoyPnek5"
Received: by mail-lr2-f8.google.com with SMTP id 38308e7fff4ca-3a9997a8e7cso2214071fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 06:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791378834; x=1791983634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/eJt26JNJaGGd2UXwu5+cQQ5n63otBhQmpzqf8cor98=;
        b=YoyPnek5Q08eeXOvmH/IKDg4N8M4njjZ0wQif12nJ5odNfqsT4C/05c0WhD42bmMqh
         /RiFfnTDHQsQV0likXM09sS9mtt9M9Gl7uz2ZNRA0T57EkMCVJtnY96pGcPAG9TqwItZ
         UXE+3kLYRIAbUyb9x/SVvNKOy+W56/+L1B4Yr+d/cohvHrazi0FF+Bhjj+KcKt7WzF2K
         KfnOmFIESrgOUFxbYNJayLg8YcOevxBO8lGPx7LRpDX0iuUJ1oCazZHhfjdXfVcUycJs
         2zeSiBDb31Dpdd+ILk2aOwFpK6uORTu0n4o2ipeMbVCSJFCRhzH9eIlNvJFyZU0vHn8z
         NGPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791378834; x=1791983634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/eJt26JNJaGGd2UXwu5+cQQ5n63otBhQmpzqf8cor98=;
        b=Vsl3Er483TCe9hKvFyiqQJvXzoXUnCNrh1RFsHfIcfMQNYLsZMWFzIqIOabCkWKO5B
         cHsLheeMoHNQ3WzfLIT0JbgdPocjCGxRfXkTkZrLSuLk+v7C0qxK98PBbUCfXmqvYSfa
         prr+vP5iPDv1/tOfTLLD2geZdC6y8lx7E+GLENnD83Cy3SsoSj3tsg0XFQCnQ/nChuK7
         yIroYxgSv3RSBABMidEy7wHtCmzV4gEcI1tXmYBY/5TkgxPr66pEDmT+FMjnWIjOveac
         0SQfaVnZqtKvLLTQyncLjptQUp9P7lq+Z+VPn+sJxsonxfSWNHUvSK08QcPYTzZeDRJ1
         +TIg==
X-Forwarded-Encrypted: i=1; AKwUvBwMFBy4TuPuBIw7ygFs7jRDc095UEh/rt63ttK7LLe4HKbpnDIXWWvFx2L9HBhCU7u90YnURe8U1Ff2RhI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLoN9v8nMOXwT9zdwxkRsmsVK4y1kFNA/AEWxOtW4ZZ5x9nxcMo
	Cu1ZF7qA4HzUwmUHzkGZVAFWpdodFrpReW50Yel/pkqR9s/A+9BrVSjF
X-Gm-Gg: AYBFou0fxFlMAOD3it7T5sKb349LPmy0HJdaQ2/LVSL8ItWHhfapuNzA6crn/fWF3zI
	yMHHOMjtw/UnaOBX8d6YJqtmvTtUDbIX6v6PY4/6LYY3BA3nDDhPaMXk1ooFWBImc5BsbnglPWX
	STsqs+i/QjBC5Vpd0WECa7+DunHQ7hIuc8jqkZA/ta2gFmA1NPXQ4QY0pRbjtZVGEF+rjMYstIk
	Iwz+/qAAC3NHHd0n8sfufC7lQVHo4xJfLGi6eYWFKqerTO8dXJtuEVab8XmY/smICiXgkEZ7Jmd
	NDf4t+T+stG4xyIC7lu5F6wPQjWXPqkSn/INj5MzLSX5sb8TJ39LwMUyfZ+RepS9T86sEHHSYaZ
	fUdf1tuF4b18N2KFwCLlVQhdVghW97EV+yF+Nui7HRsbdpc4ZVddFXczia8dpuKknxh70N34CN1
	TiKe1qjL5BKMguALIqnekWRz8pdh3PlI9qVxtcp9pXp5NwHqIPe7BwFjcX4ZPrrXduc3CjoN19C
	4zSjY3p5yf1Zn42
X-Received: by 2002:a05:6512:3d02:b0:5bc:b84a:9c1c with SMTP id 2adb3069b0e04-5bcd072c698mr891760e87.48.1791378833512;
        Wed, 07 Oct 2026 06:13:53 -0700 (PDT)
Received: from localhost.localdomain ([78.40.184.2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcd30a8494sm15055e87.81.2026.10.07.06.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 06:13:52 -0700 (PDT)
From: Roman Demidov <roman.demidov.nn@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Roman Demidov <roman.demidov.nn@gmail.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Ray Wu <ray.wu@amd.com>,
	Daniel Wheeler <daniel.wheeler@amd.com>
Subject: [PATCH 6.12] drm/amd/display: Fix out-of-bounds read in dp_get_eq_aux_rd_interval()
Date: Wed,  7 Oct 2026 16:13:47 +0300
Message-ID: <20261007131348.120412-1-roman.demidov.nn@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Harry Wentland <harry.wentland@amd.com>

commit e8b4d37eba05141ee01794fc6b7f2da808cee83b upstream.

[Why & How]
The aux_rd_interval array in struct dc_lttpr_caps is declared with
MAX_REPEATER_CNT - 1 (7) elements, indexed 0..6. However, the offset
parameter passed to dp_get_eq_aux_rd_interval() can be as large as
MAX_REPEATER_CNT (8) when a sink reports 8 LTTPR repeaters via DPCD.
This leads to an out-of-bounds read of aux_rd_interval[7] when offset
is 8.

Fix this by growing aux_rd_interval to MAX_REPEATER_CNT elements to
accommodate the full range of valid repeater counts defined by the DP
spec.

Assisted-by: GitHub Copilot:Claude claude-4-opus
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Ray Wu <ray.wu@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
(cherry picked from commit a55a458a8df37a65ffda5cf721d554a8f74f6b04)
Cc: stable@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Roman Demidov <roman.demidov.nn@gmail.com>
---
Backport fix for CVE-2026-53330

 drivers/gpu/drm/amd/display/dc/dc_dp_types.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dc_dp_types.h b/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
index 223c3d55544b..b128f1da98c9 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
@@ -1112,7 +1112,7 @@ struct dc_lttpr_caps {
 	union dp_main_link_channel_coding_lttpr_cap main_link_channel_coding;
 	union dp_128b_132b_supported_lttpr_link_rates supported_128b_132b_rates;
 	union dp_alpm_lttpr_cap alpm;
-	uint8_t aux_rd_interval[MAX_REPEATER_CNT - 1];
+	uint8_t aux_rd_interval[MAX_REPEATER_CNT];
 };
 
 struct dc_dongle_dfp_cap_ext {
-- 
2.53.0

