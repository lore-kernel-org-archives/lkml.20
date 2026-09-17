Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20C152122F
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789653100; cv=none; b=bfJvtIIzS0vazqaL06XOL32Iw+wCoXQTofX7lT+hPbwplN1rBs77Wr9ZRNO9VIsHC+LSditm5ZIbtoUOSnvzAv9qz7aSbaW1PQNSZ5iuZzU96dFS2nk8Z+y0y5Yy1wJraLs98ondnXwtyZFjuXxTUdL0NqhDuaBEvhxHQQW8OPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789653100; c=relaxed/simple;
	bh=njZ1f/RGLzOA+s1lQdSuChpiPUDyjkhmqcZbDGC3SwY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JXu1x+x4hrz1/fRj/0hqxSoOXjxo1KRNXz9K1aegRv0n8UcE15LQxwoXrmGyvfr3mliNYPGCCL05LTZ1QMWulYuheE+f2LPPeroHCruqD6x+lR8i/dOkELmvtZKo36a365ppF2NwTTxozyzjvKoz5Q3sPeBQY9wKyblHu/p6gp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FA6nTSmz; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FA6nTSmz"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-495437bb891so5787815e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789653075; x=1790257875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZqUTUUtcpH+QYrYSYHDv9OjVF9PUa57N/cCdTlthFwY=;
        b=FA6nTSmzQSZ2LYfMvXq9Exs7X6Si+JDVPaBsybuRNa8cuRvnlHttTahX7Poy6sZehn
         JzgUXc71TuGYG5FCum5ZWKzvUDZp5555jc1yFXxCNQgLYn57N1Wyb8QdC4i+yr5aovhj
         H9vQIXo/MSEv+HqceKVL2yYZxYCWaHpzKjuxldRXyfOwQsVwhHvpvuEcRl/W32ojkBkZ
         mG8T7H7aH/HZKtlIF+ZNKRd3IkQkwlw05Dxiyxu5PTA5C57a4Vzee0hRfDzipJEHKZix
         DFYlQRmCPzZBHFfJpL70SVvTMFc8+6tjKcBR9hQ8n+H5BhfeDDikPsiJiq+aTbZX4Lj9
         r4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789653075; x=1790257875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZqUTUUtcpH+QYrYSYHDv9OjVF9PUa57N/cCdTlthFwY=;
        b=ArT6Bv/lTwe4FYBlYcAaIjL/kGCAEqDOhz7mGao/sN18tzMPb/2DkADbG4wBrfveQL
         7j+cP1GWKVpa4Er/iy5SVwBZ24pmK3k5ZiMiFzfhGF1Vjt8F+zHx6JL0AbGjDh5A82DL
         lGyI7Upl7yzuo26d2tv2g60FGEZgH0qCmysNgiMj8NwANVmjXqc5ZOqRyI7FYobKUp/a
         mKqjiNLrboI86E2u7yylFfvGf8XICvQRWlTc5We6bPWLFnBg7yWRcf5S06n5SK2U2LMO
         OCtZLfKLifQFnRLH5dCpWSSBbT7bgAv5LOtiBBpua8/buMRCup/NkAPmFs0OUCpXpimk
         pV1g==
X-Forwarded-Encrypted: i=1; AKwUvBxfu1juI/dukDK7xwCy/ac249Z8WaRpRCCk5j3pWvmIiyEGZL37heePduyb0lg0//8LlsU82E+yjtXh8pM=@vger.kernel.org
X-Gm-Message-State: AFuF++kLbQT1IZvLxSclTkmtOR3iAjW2ZSqMqj7GLSFv/8+ZfoHmCEUW
	RT0OA8tQok+x+d90ipkx+rDz5wrLmga7cY9kVneCCysFB5E3hfuLzaPx
X-Gm-Gg: AYBFou0Zc3dNeP9pzsyLztysfArJEmifj8XBq5JLyHgt7TZ+3omFtJH513sPG7F3vPk
	Wl4JDx9n7879PZgtLkWz6n9fZvQ1XA/8fjrYAkELP/4M+AZTEyxCJ1iZ2jFhRYLfblbph8v3D0E
	4e/j7PYcpSeyIiwOvp+VqSVLPuAfiDHY6ws6UemAV3ihtLVh7sheH9OfOVu25tPxViTYGgZiB54
	vHlfIG+ZKZ8gYABDGiB2bKmVz2E4QNF6CCptVVmeJz41cpe+5Uh2EkXfQq0qDfYH49jmMufLcdj
	k5Vyr4DBYxQeILjkgmh0bTXF5GTvmGQ3bvxTqRB76Z8VcGbjAB3qJxJaK+LJUxD8duq/L9w95HD
	AVFGCJUQsw3UXZPgP9s3jl06yjHF+xD2rv0luN2nhOzsWVGfZbfzW9NcULeBqactPfm4A99t3qH
	mVmt89MseIITe4PPLv+uKPA2W/JqSvu9zUDv+4tBz/+VBOU0NRh/6tH7M19sgkhxNGvvM0/aSqo
	Q51ytrffCDhjuEuP+ZUpkjCrwD+ELaS0PH94wv+i3XhgBatYHw0ykDT2hiI+w==
X-Received: by 2002:a05:600c:a59c:b0:49d:2589:d8e9 with SMTP id 5b1f17b1804b1-49fbd1e58a6mr31063615e9.11.1789653074785;
        Thu, 17 Sep 2026 06:51:14 -0700 (PDT)
Received: from kbuild.local ([46.10.181.108])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bcc7d1esm15669993f8f.0.2026.09.17.06.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 06:51:13 -0700 (PDT)
From: Tano Dzhinski <tano.dzhinski@gmail.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Ben Skeggs <bskeggs@redhat.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Tano Dzhinski <tano.dzhinski@gmail.com>
Subject: [PATCH] drm/nouveau/disp: don't reject HDMI config on cards without SCDC
Date: Thu, 17 Sep 2026 13:50:51 +0000
Message-ID: <20260917135051.47683-1-tano.dzhinski@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

Giuseppe Ranieri posted a fix for this to the nouveau list on
2026-01-17, which received no review:
https://ratatoskr.run/nouveau/2026/01/16963412

Fixes: 6c6abab20b99 ("drm/nouveau/disp: add output hdmi config method")
Signed-off-by: Tano Dzhinski <tano.dzhinski@gmail.com>
---
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

