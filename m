Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792650223;
	b=zdyFOIhym8mIsTgKWKlV+4xOZcjmehsZthu2Mks+A1mrcs0eFhIrQ1m1iUi8IY61tH2+
	 5mbqLHytKqmZVr6azG7WxmxygKGnP9GPVadjyBC9IFe/rl41CF+CL9v0GyCXOOEYkFGse
	 swKNa5yLs6D/AQxoX1hVK2u7OCmAoy3YTItVd8Ym0Ym0K4nXBtrXcByFIslTg9xUF0u7s
	 yt7qo8/59YruaUMyD6kvYiLb2XGm7YDK+NG7jSrXZGdKZhSc/oAMGboVhW1MxDccfb3h0
	 m0CsKApbXZH/aDo2iPasyyTzU/yqtpHl5K5+b3HKq0Wmdxhmg8P4BSiKm19msH/EGCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792650223;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XKaoSo7CF72qp7qnN1m/zkh7lXXkEeRIt+dZZ5Jf4eA=;
	b=wXF1wsgqOyL7YoPF98Tnzf2yP7E98Fl2ZOGClisNSgbhH6hoHWVXVAZY+z0sDicaUK4M
	 +gE78IwuODchsYwvfH5nqkzAvXms+63xzMkVaL37/5suKxL9vH7heWXyM79J5Cjyk8U51
	 e/yF7l0RNc7xK5fydOAesX2iKpb4eX29+IVswkSD4RMZK6iY3GXwr2+HC09YsdhfRfFGK
	 7OI9Y6brgfT41u7TUiiY8uQp9o0jptk2u580qi4OiwN+ISHcebaEPrVBQJ0JYt7bINltD
	 HEGY6EHqLESYxgYLurKBD0tlxFxHzuos+BbpQoqW2pkeL+7SdHMsGiAZ0q3Sibd95LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Hc/wudQq";
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E35606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:23:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14E35606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Hc/wudQq
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8a06b27bf9bso793879b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 23:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792650222; x=1793255022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XKaoSo7CF72qp7qnN1m/zkh7lXXkEeRIt+dZZ5Jf4eA=;
        b=Hc/wudQqghAIl9TCNNQqTBRAhozfHafml+W4KybaBCClmLtZL++dpSErHkbJfTeDuA
         fZxtM0OHlKnATyd/9chgagYHxwr5RS0MqabppqD9INFBqHAU10uXFkOsJGhPk3KhGS4l
         F9i6L6IGTFB1paYuq48j8T/daJCbz2fBH5+GiFhrUj9KNc1xE1NX++OhK8rVd8csuNBy
         4DSQlb2MnohcLtzL52Ig3Lb+NhY9bI72OBKgOCc1j9VEqfD0Kn2jT+Twu9WKgKd8oPwP
         vEDLQPYzo0sIz4FZgPRKcc1jvEYmoyuL9AnCJtRHYMpX/C6KNsxFVZrKRoUpd2GIgzeX
         65eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792650222; x=1793255022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XKaoSo7CF72qp7qnN1m/zkh7lXXkEeRIt+dZZ5Jf4eA=;
        b=M8IK9kdkb7MQwQlF5DB4/IMat7dIQpcP8y6ZplEQOCfQId3+0kxlAmxZ/7fdsqO7eB
         ZhEcgLR4k0U7asV47fvcah1erWaqGJS1HQCiXeJbdCzhAe38ZHB3DHA+o5BTRlskGveK
         64ks5lc7W9v1H8fRmx5B8welpNtKVJ99rTxF9crXalf3WdggMD2kQJ6lLxnSIRntmIuj
         69pPnhZMVtVJQhq2IxcYPPjdI+KPvetueRR7RkLl8ANPJRBlslp7dhZO72v+K8RVmoSp
         IJSPvVw8EynGpC1DTzOwbbhw2iO5i89zBFN0KK4Bx/UFsiZt1wOnVPn3TohAJM7hYOAQ
         iIhA==
X-Forwarded-Encrypted: i=1; AKwUvBwGZ5u6ueiCBJ1XyiNMQXnD1jAiSmjkO7kOxHWkhSKU51SLRTYAB+2zXP78OE7Hg9ZAEGQp9Ddee4EpOt4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKzvTyO4C/+3eGggGO6IvFC5HDRxW9X8Zl92IgWdN0GKk32C/Bl
	3sUO3rDKgi4jbQRJV4BaMAsLmJvUDZF+WxVX7+pUQKNt8+1bVjBCx8Tk
X-Gm-Gg: AYBFou15zwJzhpeiUGd2CWIcJJO9m6QcHdebTB2JibFKKevy26HWW6vn9LV7qf32RSd
	/vY4c0y+4uqowfgcliSywm2w5uTzX5rlDyHVzIHnJeEeb3bAo1xMehMJLJtvS0NCr9WBqwfGzZ1
	9u5rbITim7/TPfDkRROGrZtuF+zRP8B++MyTzf87eN7bLD9shDnyqmMlEO2Ut3hTSNev90eoAuG
	j3a7Wyc2v8xa6X2EIxJR4FVneywfkMMNKVPE10QPuqdIabhE5WAZnTrTbZDDhtOu5lvvItG288h
	UqgC4kVpSgOgmU+sqOZkmOF5uMp+bafMbER5Gbocon7hYeTEgKpvBMlPKcTFYUYSCX2GgoaNRes
	8c1pkFzpF34+PQSBv6O05n7k8jN5IAoM+XhyyO7KWMtY6E6ziGrRB9lLqK1rkd3tWg/9bmObmj0
	A4YeXfM+5Zb/ETCWydZzNraOBAXQsrMhitOvkZxLQKhmfluCE/sv7JmjsbwvV8pfNipE1PdvRoC
	B4MKQSrJD1+FSYAyjnAILY06KP+klH+rJi8Gcsimxv/EaMeRy6MRlpn158O
X-Received: by 2002:a05:6a00:4612:b0:8a0:4807:456b with SMTP id d2e1a72fcca58-8a089f5bca8mr3365981b3a.37.1792650222338;
        Wed, 21 Oct 2026 23:23:42 -0700 (PDT)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0894b49dcsm1632102b3a.16.2026.10.21.23.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 23:23:42 -0700 (PDT)
From: Ping Li <leeonion.muyu@gmail.com>
To: james.morse@arm.com,
	ben.horgan@arm.com
Cc: sashal@kernel.org,
	andre.przywara@arm.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH] arm_mpam: make the mon_sel_lock guard return -EIO
Date: Thu, 22 Oct 2026 14:23:35 +0800
Message-Id: <20261022062335.758832-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
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

The mon_sel_lock guard class reports -EBUSY when the lock cannot be
taken, but every other failure path of mpam_mon_sel_lock() returns
-EIO.

Encode the error with ERR_PTR(-EIO) in the guard class, so that
ACQUIRE_ERR() reports -EIO as well.

Suggested-by: Ben Horgan <ben.horgan@arm.com>
Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 drivers/resctrl/mpam_internal.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 1f86cc158100..2f6dfb9d3906 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -204,8 +204,8 @@ static inline int mpam_mon_sel_lock_init(struct device *dev,
 }
 
 DEFINE_CLASS(mon_sel_lock, struct mpam_msc *,
-	     if (_T) mpam_mon_sel_unlock(_T),
-	     mpam_mon_sel_lock(msc) ? msc : NULL, struct mpam_msc *msc);
+	     if (_T && !IS_ERR(_T)) mpam_mon_sel_unlock(_T),
+	     mpam_mon_sel_lock(msc) ? msc : ERR_PTR(-EIO), struct mpam_msc *msc);
 DEFINE_CLASS_IS_COND_GUARD(mon_sel_lock);
 
 /* Bits for mpam features bitmaps */

base-commit: 8ea457f746d915d55f78b43d33b1cd618f3d93ad
-- 
2.34.1

