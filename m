Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256C045FFCF
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790342785; cv=none; b=e62Op2xmX0TRp1fN8Hn7I5/bUIrIJPDENLaELitkhdOrIXeTM5aWSZwWVtPz0t9PRTNQVMk59G/7WVGAzNEYbiZGlmZQjMQPdjLLW76jMs69Mn9m/CNj88P2aNGTTv1mJriusAv2ngcabSxakDfdoBnIge9s104fm7uPP6Hkzsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790342785; c=relaxed/simple;
	bh=pfcyiPkQvaVAgSx92tfOQfAilEzyRqxbXNKADc8zJWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MKoUNxF2J/NU05BLyF/hVWR2pOXPf4lP0dzKzSYoQ7M1A1LPO5dwFDIIBSN5C2gCIUGLnsjgxasxzfHnTTdDRHbGxjssubKVTRozBsRoSbBy7vUhdzS38Lmycek1x5IseqhedFQeRNxHNGvqGNCn7sSGJGisKWKLcxeB/jx6w4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PoluHP2S; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PoluHP2S"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ff23af865so5578845e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 06:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790342769; x=1790947569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=06duDdNGXEXO3D6IjmbJBB78lIY9/9EMnDOm9nOMKis=;
        b=PoluHP2SMd3ANfb2PuqiVs++eMPVp13NkvwTk+6fWTlsfnYCOlCvmc2h9zzOB92Ah4
         CqJN8g31GnSmC1njmTxWs4vMPdpa2kiZV4PNNSpZya9KVPT5lpHhTYyqqcdh9q1BIdFh
         yvXbkTgohwhSjtAZa1Fubw14lFgPMl0aMSjxkTuHnIKz8/vbm0TNU8KB+jdkraB/fOlT
         S8MVY+efl4RUXOTeAWheNsg/eBQyKE/ox8u46mFapjYbiyYiMvJvasdKZDhC+4rMwwVd
         UNkPm1ZYKEiNz78iNFlmV3NJ/NMeN+BGks7neTY1kgoMfcr+pymVaYi6wqb/fIuB8wA5
         B+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790342769; x=1790947569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=06duDdNGXEXO3D6IjmbJBB78lIY9/9EMnDOm9nOMKis=;
        b=QSnxI7UCRZH70d4JIuBT0dDRg7t5oSiyS9kzY7ZaBn0OSoQNs6JDGpxLI3ZLokNWxq
         L1JcvfP/haLl5VUie3P0UKW6VGYd84FQUND0qrIE0M6ZqmLC8n2QPSAI+liJPvHmxqqB
         L55XwU/RMjbJv5yrFeCnIPcei8sOGt0mqGidN9be6L7SOxpk7XKtmaGvxq4uuhaabiWc
         p+LExvE6lWBQ9+DktwkeCdCcYloWMQ4xQX2SzGoaYGg8RLrGC21yfoFc+7Sb/uYpOj1l
         xUXf+B7Bha7zBeXbjJqq0Gpf+Sv0RyAMoXe0J7lf3wmfgJNpsijlFNK1EpctE+ZDnWgK
         AhDg==
X-Forwarded-Encrypted: i=1; AKwUvBzAu0x0B4INQymsDVUcd6COXTl3zLjD+hmuPnutQ6bd1Ob4VJy8WxlqZwA1e+ejm15M4hRNceIKJGrpK6k=@vger.kernel.org
X-Gm-Message-State: AFuF++kGyB92ptn9eCqN/p/YJ8psOE1gKxGh0jRKDqNqiJpfCwfkfFj8
	aGBMfi+oNgNMISLOOG/AbLbsJtKDMQSxMkYocfU1unlx3UO3g1AtW6g0
X-Gm-Gg: AYBFou2QtRr/hGVPNcf9uSjL1gVsrm/PAHwXCtg1VNpcV8Jn6UIiMiRu18hNCrpCtvG
	Ik0S+9VyV4XMdOmfsVzL+HJ40bNqZotmG6HnLqG43o83cRTv2jPSpP1n9UHbA3lxG6cI0motyXg
	BEu/nc3VpXz2SH6JPhqaz1ZxoZNpxeZlLk+xOoR9GAeQVdn0k2rs/G3uyl0TgpIvEVN00rXBznD
	MEr1dmE+noYl3IQaJ3SSDupPQpLJ9NvSeIz8UpufFDimjdkDZztOO7x5qL1URFFyi9vIEtRk8ue
	p43a5PExV/4qk1R8P4UhorNf7eTybueuoU5Mzf0S2a51XRkGNYxXyNtctv8WueykWwhHMd1Dcwm
	C/ILKzruMjW+7U85wFuO87vYaRVjU6dxK2mpQxbD6ZVj8cW/oE8Qvw1sKB/0FLnjn/J9Tph2h+e
	s5Tr6fO4XBtBYg3S1DG74HSoxflf2KB+eYPJdpDR0CzF9RvZVqvNHKScQvvIOnrZAxHMYAXY1ly
	sgKEwYZDw==
X-Received: by 2002:a05:600c:6087:b0:49f:df99:ff13 with SMTP id 5b1f17b1804b1-49fe66e652cmr93012705e9.21.1790342768794;
        Fri, 25 Sep 2026 06:26:08 -0700 (PDT)
Received: from localhost.localdomain ([194.154.195.114])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4887a354c47sm7488028f8f.15.2026.09.25.06.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 06:26:08 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Douglas Anderson <dianders@chromium.org>,
	Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/dp: don't mark the AUX backlight enabled when enabling failed
Date: Fri, 25 Sep 2026 15:25:58 +0200
Message-ID: <20260925132558.27518-1-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If drm_edp_backlight_enable() fails, dp_aux_backlight_update_status()
still marks the backlight as enabled. From then on every brightness
change only updates the level and the enable is never retried, so the
panel stays dark until something blanks and unblanks the backlight.

I hit this after resume on a Samsung ATNA OLED panel, where the first
AUX write can fail while the panel is still waking up.

Return the error instead, so the next update tries to enable again.

Fixes: 10f7b40e4f30 ("drm/panel: add basic DP AUX backlight support")
Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -4634,7 +4634,9 @@ static int dp_aux_backlight_update_status(struct backlight_device *bd)
 
 	if (!backlight_is_blank(bd)) {
 		if (!bl->enabled) {
-			drm_edp_backlight_enable(bl->aux, &bl->info, brightness);
+			ret = drm_edp_backlight_enable(bl->aux, &bl->info, brightness);
+			if (ret)
+				return ret;
 			bl->enabled = true;
 			return 0;
 		}

base-commit: 4c253ac4b29b8c6cc6fdef8f92d4facde62e63b9
-- 
2.55.0
