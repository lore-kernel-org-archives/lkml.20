Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0998147D464
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 16:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791044157; cv=none; b=P8ZW14FHmex0KM2TlRmBcGzp99JjTm7aVwnQJO8aHGAEAhgxvmR0SXw3qFaDeT2tQUHcetqnpqLacNKmHUDYNsxFBdJYaCjRhx4VHKXpEwOQhFyBoAWVtUNjQ7jlLdRBUPrylhNAgOCXYDq3+a1UBCqaFgVMGYIj99x3H5TjqNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791044157; c=relaxed/simple;
	bh=IqX4cuiZOSTMNkwOUZgJRhPlH5cYBJ7ZGzsXK6vo020=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VeRSwReFLoHKhCAco86D30feyaWhVE+SXtbM6CbAJbJlZpJXrDXI4ehAim7bwQa1EGKXcUqSpaP7J71L/VobtzuS4TQuZ9druTOOIk0CfR83DZkwrx/167d6KkVsHjHRP1CeQe2L3RPCtCrYYSNBeVgmA7IGgb6v+xKYZFLlnsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mgZY8fwk; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mgZY8fwk"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48afe75f055so422088f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 09:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791044152; x=1791648952; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eJALif/NZKKKwgBHANRUIYhyULS4mSKxyPgmAZ59sbU=;
        b=mgZY8fwkX873W91xTHmVQoFSH6aPKlPNlqOsIsbO7L4hoStgDqQgRjUMrPwxb5IIYR
         fTpRrqIlZ3H+Mwz/XT3K2F1KWETZuC4IlsSDqtHbgYL7bG052Dn2GoA3266kFCH0Kvnz
         klDB+l/p6HFQdgPGAucSqWwJS7B/1B44RPEl+iyPEe9sCadT4keif6f6VYJJtPOIR7Ph
         V+INPEn350V55u6wjescb0yCzWUbEDGDMV8KoYl8SOCp9jMkMJKuDFGZj6S/vhb05KNW
         UyEOaHiZj+q06VIghDb8N3r0nygmmECVCy80JKAO8aLwGQP+kSoHYz0iV5bs8VSuSoyJ
         RV/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791044152; x=1791648952;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eJALif/NZKKKwgBHANRUIYhyULS4mSKxyPgmAZ59sbU=;
        b=aXwDdQQZPL9IYX2QhDIVjoh7NG75og7HyK95WqGHXXjgcBcbkW5B2BOYWnqDl6eRof
         vOplvohe/hLp/dkudZj6zEynaRGXo/ZDPlG2s57C8YeBoQ/FobfBAYrM2L/AGLf3Vu7N
         1yHAG3wkXJdnTDVTWDzxQMBnyYtFAmZDUpfSgM99k9Y/ojUgwaFExl0QkrapCCNQ/ZFj
         rkLSNo4UnTLdpFFPYp3So4QUjdza/FLaWy7aA8RZCVu/0ulQCDSWhafnp5w+R/4E3qlB
         m+ROSrWfzqlJiKJJTmJJD+h7uTMjtrKOhPtNwn3BMTZww0w4Nw55n7nq4/rgi7A8P7oV
         2SOg==
X-Forwarded-Encrypted: i=1; AKwUvBwl8qmHn39g79rJYrBAEOe1M/8Y/j90K7ci7sRKSlKNEuvP4GeUFkRQq0Eh6SKHSAtoirGu/J49cFaTLqM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtf6okMxM92JBlVU5TDH8WdLRvjIYhD/HZF9cuS6pTAJNZ8QKU
	Eg/OAxHZUoX0tK8z76IvMZPivITXYJdGrJUUcG35s26AOV4XktJkGJ5t
X-Gm-Gg: AYBFou3WII8vgkL3vVLtYOM5NLnbtM91yq4rI2S/NZlA7HkjvIPMWkfEmBzOh5GD3NV
	ZFPshDqGm05gHbXmshD8WWLmG3nI1C/HQ5+O2tZ4vSNhqj17ULOHnJilT+kbtK0fJJmKFL3Nj1i
	J4Qusm2tdvD4woVPc4e7X7qJwRzaOnruCKo2KwkmfNPC2ORZVcXOu/HcsYzRBnOgddCQpSB95pO
	y7RSyTLaQzz1GCpt6IZwil+8nBSwUkJEf448tIt6UAM01Ufc83n/MbXDXT4fVtxWxmrg9/T7MRd
	8qhOiW2rNnmRYABEBpCtQtiaXylbNRQFYIh42FNzUsXano1qzKvMTvHIGXWzIn7h/XSm2M0yUmo
	9rYk9hygiRmvEOc64gAy0z5VihHHWwvDsrbHlCp0hmYQcWtJgdVZS3c2+tPs08CJZ95QMfK1OvE
	tkkZbtsezCaIQkkVLPfhd4upltLWENlZdDRD02ASdfzgQZnNsC8n9wXzSsAZSBnWX+eK3F4YvFy
	PrdrUDWJ56B5nyg+c3x1SSggnN0/4COKovVmG+BnsTHXXNLSuvjwD2L3UCMnzw7qrxF
X-Received: by 2002:a05:6000:2382:b0:488:84af:caf8 with SMTP id ffacd0b85a97d-48c48018dddmr3795373f8f.55.1791044152278;
        Sat, 03 Oct 2026 09:15:52 -0700 (PDT)
Received: from localhost (p200300eba703ae00ca7f54fffe019321.dip0.t-ipconnect.de. [2003:eb:a703:ae00:ca7f:54ff:fe01:9321])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f8c4asm14067659f8f.37.2026.10.03.09.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 09:15:52 -0700 (PDT)
From: =?UTF-8?q?Johannes=20W=C3=BCller?= <johanneswueller@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: =?UTF-8?q?Johannes=20W=C3=BCller?= <johanneswueller@gmail.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jani Nikula <jani.nikula@intel.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v2 1/2] drm: add edid_overridden flag to drm_connector
Date: Sat,  3 Oct 2026 18:15:07 +0200
Message-ID: <20261003161525.23600-2-johanneswueller@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261003161525.23600-1-johanneswueller@gmail.com>
References: <20261003161525.23600-1-johanneswueller@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When an EDID override is in effect, the physical connector may not
match reported capabilities. Adds a drm_connector flag that allows
drivers to detect such mismatches.

Signed-off-by: Johannes Wüller <johanneswueller@gmail.com>
---
v2: rebased, no functional change.

 drivers/gpu/drm/drm_edid.c  | 2 ++
 include/drm/drm_connector.h | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 42f4e41c459f..9ea6f5f19131 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2424,6 +2424,7 @@ static struct edid *_drm_do_get_edid(struct drm_connector *connector,
 	struct edid *edid, *new;
 	size_t alloc_size = EDID_LENGTH;
 
+	connector->edid_overridden = false;
 	override = drm_edid_override_get(connector);
 	if (override) {
 		alloc_size = override->size;
@@ -2431,6 +2432,7 @@ static struct edid *_drm_do_get_edid(struct drm_connector *connector,
 		drm_edid_free(override);
 		if (!edid)
 			return NULL;
+		connector->edid_overridden = true;
 		goto ok;
 	}
 
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 899643586bb3..d242fb922741 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2394,6 +2394,14 @@ struct drm_connector {
 	/** @bad_edid_counter: track sinks that give us an EDID with invalid checksum */
 	unsigned bad_edid_counter;
 
+	/**
+	 * @edid_overridden: Indicates whether the last read EDID was an
+	 * override (e.g. via debugfs edid_override or drm.edid_firmware kernel
+	 * parameter), which can cause the physical connector to differ from
+	 * the advertised capabilities.
+	 */
+	bool edid_overridden;
+
 	/**
 	 * @edid_corrupt: Indicates whether the last read EDID was corrupt. Used
 	 * in Displayport compliance testing - Displayport Link CTS Core 1.2
-- 
2.56.0

