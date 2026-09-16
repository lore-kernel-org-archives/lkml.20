Received: from mail-pj2-f35.google.com (mail-pj2-f35.google.com [74.125.227.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90F24A4996
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789551646; cv=none; b=blCiSZ10byPBX6eHBnURXupp62zcIRR5Wg9RjuDXlhVwRSegarl1E7MhImGVQ4eXhz6oJsfAU3I/2mD8DpwKETlTuVOrOIkbUxVdZanCz2xLIx6OSRgnxrbZ8QNuFSHrbXE7rjYawEEcGm/LJPuh0RwKLes/uoPZWhYb/QO0ewk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789551646; c=relaxed/simple;
	bh=0BwYFsUGvhV1ukvG7oNNQBcKUzIkdDHy2xDOs9Zgzoo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bMgMRdwPwasn/jdG6kqRZqp90e51zCwfVC+3q+MeXQTCnjMv2fHP1saGWUP0RYftS6/fBK3QA3yybpA1XvX4+33HpGe17ecT4YSmgUvu+Gw5l8bLt4oe0Jrd9i95lsw/IWmEKydiWRQXR3N1ktHRNlRaGK0YQASqZ9DrYzzjLtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZkvNbT+P; arc=none smtp.client-ip=74.125.227.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZkvNbT+P"
Received: by mail-pj2-f35.google.com with SMTP id d9443c01a7336-2dd77300825so7166005ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789551632; x=1790156432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fM73VnuFZuTPcoMVOXLILsNnW/aM7z64LAY6lfOcaCE=;
        b=ZkvNbT+PIp8OV2r0K+9DhXB6MdXYrUtJyOaoriucXQOp8UpvU1k7jJVAN2W2DfcwL+
         +Ohh+dWogRbEUcMkhBHzHQBwxzIm+I1D2wIBgqu8ftdJI7Z8TS0mQOdBhmGzqxkb9TGa
         EOCOSSPAndRV1oDZiNDJGF//QLCSA7yfHWCR60RF4t+qjLG7ymHMcGfZyDiLuRtyD6S2
         wu7zUTCVPfNYguWehQGWegsEzwniCB74mN0esMmyNO3FPSch9a2IvY0lSeXJWhOcnuEE
         qlDdLsOhEGEx4rd/Cbj74Xy6OLNKeOQLkN83u7Lsni1jlSUzd46kSClBlPBtrZhMzRou
         mwgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789551632; x=1790156432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fM73VnuFZuTPcoMVOXLILsNnW/aM7z64LAY6lfOcaCE=;
        b=eOtXWA3q1NJ4jJdSqLh8PaN6oFgQlde5Q+zvN2/dhqvSTRWX/sqY5v8qq3JwDRtllJ
         zVsWWpoQYzN8stS7FkFRE3jHwGitxX4ag8Ef7qS23+pCduCJ0OKPVN5xZ+EHcNCN1SVW
         m/4mnviqDyIzYqAZl5p96ySGYtDl9cyxzKd+p/+kV6UsL0MLV8Kh9ZaELYi9mqpkcqV7
         dxubBXoTuuajU5qs8buENpLQKvObBzWm1qTQ+xZNAwfd77vFO1FaKpAjLITqnn0+DP5H
         dgq1z5R2LpAX1roMw/Auiz2wXNJlJvBgIFqOcZmAvb6s5ZpDtVrknM/4xkn93KoM17Bl
         RmQQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjSy7ImKylQYkTXgki2Y1bmjvenxfW2CrN58wJohVm7xeJrbJJXFXQyNudJtscVTo3GnB5B95hf5t2vzU=@vger.kernel.org
X-Gm-Message-State: AFuF++l/yS+SeYo8+1bmZz5jlUbLvqChDZx2KqPxeUFq7MC++z9iZzuc
	2fa4YVLm85KApWt/YIzzfkWjnSP8FDL3aoRnPOMM79mmqyEvgkKVsGGB
X-Gm-Gg: AYBFou01CuAtmkUEPp7RX9xo1QeO5Yxs0qddrJjAMCVh91EfRvqv+DjBXLhkCccacK5
	BnH+Hdn/YZ8T9KsjIEF7nx44OSVV6BfXwyWMhKvLEjN0px/yLRhy11m/P8wBWD/PqWYynL4AtLR
	6aItxvVDFBY7g63rRF0LX2U9OAYI4Zom/ikchYSLVr2IrcOZxOLxKrrTFewhHMIoMBfns5mYtmv
	YCo9xKvj4cEujYLQzdV/09w/NMIp0+Alpd7C6r2KLU2NSXY04q5EjVIkJRMhtLXa5ln/X5C+Tj1
	fiQZonv0ql5mOAtyxJERsuVOaJDkfslM0CoKI0mX+yRJnd/sBJJwzqxvq5pOXWwQn4i6UF0IINU
	hNPLntXR/Z4uMHEe6h+J1gGR57tnPBUwiJcGuZBylSv/pSQCwIQVyUydS5vTTvLbJBhXk6IbVEx
	RcQkcXH2ri9z6bM8Dk+F+Lio15xONlbCzCITZEQ49YtsQhfycKXs5bf3Dvjtl5WdphCznETVEki
	+LDZP1avfN1qS5YY4SLKGvQg7v4HzJ28iP36mqL7CS4kPwqIV5Yc7XAKjjUA8ppBqDhTXUcf5rz
	UCWNyNnPBeWkVJs=
X-Received: by 2002:a17:902:c40d:b0:2d9:216a:cdd3 with SMTP id d9443c01a7336-2dd8e6368a5mr40284535ad.18.1789551631564;
        Wed, 16 Sep 2026 02:40:31 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89e92ecasm8622865ad.29.2026.09.16.02.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 02:40:31 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Cen Zhang <zzzccc427@gmail.com>,
	Yilin Zhang <yilinzhang@moonshot.ai>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ALSA: pcm: Propagate snd_pcm_stop() errors in snd_pcm_drop()
Date: Wed, 16 Sep 2026 16:40:14 +0700
Message-ID: <20260916094014.33609-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

snd_pcm_drop() currently ignores the return value of
snd_pcm_stop() and returns a pre-initialized zero instead.

Store the return value of snd_pcm_stop() in 'result' so that any
error is propagated to the caller.

Found by manual code inspection.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/core/pcm_native.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 000e926a1e6a..74054b9ca712 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2267,7 +2267,7 @@ static int snd_pcm_drain(struct snd_pcm_substream *substream,
 static int snd_pcm_drop(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime;
-	int result = 0;
+	int result;
 	
 	if (PCM_RUNTIME_CHECK(substream))
 		return -ENXIO;
@@ -2282,7 +2282,7 @@ static int snd_pcm_drop(struct snd_pcm_substream *substream)
 	if (runtime->state == SNDRV_PCM_STATE_PAUSED)
 		snd_pcm_pause(substream, false);
 
-	snd_pcm_stop(substream, SNDRV_PCM_STATE_SETUP);
+	result = snd_pcm_stop(substream, SNDRV_PCM_STATE_SETUP);
 	/* runtime->control->appl_ptr = runtime->status->hw_ptr; */
 
 	return result;
-- 
2.43.0

