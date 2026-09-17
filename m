Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837743AD52D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 21:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789681920; cv=none; b=d86nc3vbGbXhfK7Nke+VVwWdkqNHf0yV3QsNwHnU8lqsIVMVwQkPJQqtaAaQj3tTTIydbeWkGLfhANYkpqprkSNrEc/CVlYWsTdruwEpOty/4ibIr9oQ1xcRf/k9SZcZx/3mSpxMHFnjxL+BFuUbLni++Fm65l/1efr4rNC8bks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789681920; c=relaxed/simple;
	bh=41CIsz0x1BEdT04ID5o897mNrgHj7ZzwU6M6OEUmbU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VWKllVVrRgmNzStEbKTniWurJghFR/E3MYx9mvrD5dN+tA+Hp1FLK/2bCsx7gAoqLKeTh9D2cl9JQHdOeiI0zqXLAirfHLv3qLacTkRzmPfTAbt+/JZkzibY25AAGMsooNMiaMgOhgU4HrebsGh1RFZH2mAQr4nCr/MtAcZsqms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OgHI29E6; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OgHI29E6"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f62ccdb1so10797f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789681917; x=1790286717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OBna6qkqR2LOIJTkCDKUQXTi19qvcho2o29JezHr6+M=;
        b=OgHI29E68M3aAMJ+r9szPvkcRjRf1kSAEM1wW8nmGjEr7uLgQcosVHLOQ5hUKnTNIi
         OtdI6sN9mDGdNoyYVuvKvC35runHPj1Y6ZYSVQE409W1nQHXvJTMq3ZaFdWxJnoy+tjz
         HrNrlXd9A9JID7oqq7roLDVeG1BsnvzeBwxwsRDlnEyR3gHyXOFK8PnGytiwnoHtrDk/
         +wIyGtUjgChlp5s3ihIxDpCinJ7hBdGcC8eISmgwjNQ/RUTS7H2X0XsdS6v4Q567frPN
         UC3+id1fLFZXFODUI00Iz6tCiT8Kf++YPQmRMlQaeDrQzsRoa/PLQAIid1ZI3FBQV4aj
         Zmxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789681917; x=1790286717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OBna6qkqR2LOIJTkCDKUQXTi19qvcho2o29JezHr6+M=;
        b=1Xg4ZkisIz6ZTwBsHOUkLIADY35Cb7wr5CS24tF03OEGFOhyb6eaThomU0QaGhpXic
         tISzQmQ5r0JZYiydT95Apu1/OacZn/kAn/vhNBYW2n6kdVvhba2mJf23VXKCBJxSIW8q
         aHIzP6oIRBI4OabkXsX2PfOqWUB+ZWBNTrVzAIGY94by9JHo4eYRLigkng776uoak3uu
         d+Sph39l96/qbDx1QUjPGS72DI6i2DCGdxyXxpoXO7zgrzUFPzONoDxBFQdua4FIQ0PV
         aEN6V2zqppi7QqAwXMZoemRiHW066EkB6rbsk5h1Is1d2tP2xCn1meOXHVtZyyGMXsPV
         /WdA==
X-Forwarded-Encrypted: i=1; AKwUvBw7YkDJKOEFjKNC+RVJR+YZESB0NuE8UYPQQIeuoYhTnTyP32vr58OSaoXvGgb+hKF4WzMbz+uwNcb4bJ0=@vger.kernel.org
X-Gm-Message-State: AFuF++nfz58d6dLrWsSAfaTz4ommwmJolJIPixiDytIT39ORTCaoTK3U
	rgIlgk8HZXGWJdI0RSeMKfwZeMukV4ElgWgBUKJmDKrMFaEsvQZCx+yO
X-Gm-Gg: AYBFou1O7XM32XxVb7iXNJcMDjjqGBz3H9AwMounYjf2Kw+B6859q/ENmHtOuhDP9v8
	+XCZGV+7Ib6I553KwdrFBuY5+mUGcZEy4SB5O9OvXkmgqnVlD++tmNOweOgjgqJrqIaxZVb0hjh
	yiCRGEfzb9sIb+xedUK/Dx6Sk1GUcVe67d53E/EYUoy0pjnNafQvwvr7YbLQxTp2ijLSTSiNfiP
	8Z+5I0rqa8nw2gTMZLh6zT+A7h0vl+esvA4F2GbbPihkD3MCAWspmXAJucsspQV5vhzpVvdOCc8
	NEpGZ7n43zqNbLt2B+NvrDyqAkFzqKOEEDszsC9qmuMLreqzEDdSoF/BFFPIW2zt+YWMbTGlw6u
	HZzzMw8cioIQ/QfN3l7JmMQMHs/dMS5GGKD+Rhv+Qv6+576q+xJ3hGG/xyjfP2AOubXjM+0MBDc
	K8ICxVZb/i2dF5j4Vkj/yqgmxcCmZC/A3UtF0GFxCgBgzOkBTetYvOqbrJgwANBiQXafarC/pMg
	IjUBSjbre9Drg2Tjn0Nnu6sZlpXrXb69xCLM5SWmr5oTHVSpVsbYadrhz8QhQ==
X-Received: by 2002:a05:6000:2505:b0:485:8ea0:da8c with SMTP id ffacd0b85a97d-4871dafc15bmr673423f8f.16.1789681916606;
        Thu, 17 Sep 2026 14:51:56 -0700 (PDT)
Received: from kbuild.local ([46.10.181.108])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf344fcsm19736579f8f.26.2026.09.17.14.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 14:51:56 -0700 (PDT)
From: Tano Dzhinski <tano.dzhinski@gmail.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Giuseppe Ranieri <giuseppe@ranieri.dev>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Tano Dzhinski <tano.dzhinski@gmail.com>
Subject: [PATCH v2] drm/nouveau/disp: don't reject HDMI config on cards without SCDC
Date: Thu, 17 Sep 2026 21:51:14 +0000
Message-ID: <20260917215114.1136715-1-tano.dzhinski@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917135051.47683-1-tano.dzhinski@gmail.com>
References: <20260917135051.47683-1-tano.dzhinski@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Giuseppe Ranieri <giuseppe@ranieri.dev>

nv50_hdmi_enable() passes the sink's SCDC capability from its EDID
straight through to nvif_outp_hdmi(). On pre-Maxwell-2 cards there is no
hdmi->scdc callback, so nvkm_uoutp_mthd_hdmi() rejects the whole
configuration with -EINVAL, and nv50_hdmi_enable() returns before
hdmi->ctrl() runs and before the AVI and VSI infoframes are sent.

The result on such a card driving an SCDC-capable HDMI 2.0 sink is that
HDMI audio silently stops working. Video is unaffected, and nothing is
logged, which makes the failure hard to attribute.

SCDC is optional, and the hdmi->scdc() call further down is already
guarded against a missing callback. Requesting it on a card that cannot
do it need not invalidate the rest of the HDMI configuration, so drop
that term from the condition and let the existing guard skip SCDC alone.

Fixes: 6c6abab20b99 ("drm/nouveau/disp: add output hdmi config method")
Signed-off-by: Giuseppe Ranieri <giuseppe@ranieri.dev>
Co-authored-by: Tano Dzhinski <tano.dzhinski@gmail.com>
Signed-off-by: Tano Dzhinski <tano.dzhinski@gmail.com>
Tested-by: Tano Dzhinski <tano.dzhinski@gmail.com>
---
v2: restore Giuseppe Ranieri's original authorship and Signed-off-by
    (he posted this fix to the nouveau list on 2026-01-17,
    https://ratatoskr.run/nouveau/2026/01/16963412), per Lyude's
    review of v1. Added Co-authored-by and Tested-by.
    Tested on GK104 (GTX 670MX) with BenQ PD2700U and EW2790U.

 drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index 377d0e0cef84..9887b3898505 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -253,8 +253,7 @@ nvkm_uoutp_mthd_hdmi(struct nvkm_outp *outp, void *argv, u32 argc)
 
 	if (!ior->func->hdmi ||
 	    args->v0.max_ac_packet > 0x1f ||
-	    args->v0.rekey > 0x7f ||
-	    (args->v0.scdc && !ior->func->hdmi->scdc))
+	    args->v0.rekey > 0x7f)
 		return -EINVAL;
 
 	if (!args->v0.enable) {
-- 
2.43.0

