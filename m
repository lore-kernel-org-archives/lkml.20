Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915153;
	b=2YqIIDMvGlQuDHdQly0f4zs8cvwLXiMdFUoETsbfDt7wuj5It0zZd1FQXZ43Qp1e1EEc
	 bHOqmCQso8dtlIbmjSwDTOhC/ES3zl9JHF/QNBYN311DxoRe5ynTT83tKQG9jWJn757GZ
	 mPtblIAfWlB0iMtGi5atXO9Xgo7qI2Ri0pql3o585PkkmZwHhWSve5PECLGZdl8X4jzjM
	 oFKf8nY4pUSNbUqAZRAx0ZaGePetRYn4LyzApgcRlENCpwqZ9jKIV32PKnspKdGYQJ5Dk
	 ENrCjidzSc72xthtL8i4FiPf3yiu7j7Oy8Xnzn3OS5uf+tev6rBXNxxO1fEYA45KouA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915153;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=ah0q/JTuhX4xDVOrwkG1t5tUQwpt5YsuBa7AH/Yk8Vk=;
	b=VOKxsjhB4ie2v4j89wEBdntvLYqJ8cPitQjiypOhkZZsF8mgBbMTrHVGpq1sQbNhkhk8
	 4TIHnlpk/TerERDzx+FieGbydTRutS4GlxCbKlFZamvYFVx+KSsJqpmsf2k3UuEAjbIDH
	 n+eG0HymQ0G9qpy07gYj78bcso21qTvGUGXHjnBURdwnmysEbuxB0gWTGme5f2Od09OLq
	 sTn67RfXNmOwykJgYSTQmW/il8HVZqzyt4r4llkBzmE+KmCJR8qUAHkW45y6pnYbrJXPx
	 ML2LoLyJHhq7scxg2KU0wBl5Py+/cnOhfS4TVi1/Q6T6dUVQl84dsZD1AgStzeGXMMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qo4NLHh0;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5017606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:32:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5017606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qo4NLHh0
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so54028485e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794915151; x=1795519951; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ah0q/JTuhX4xDVOrwkG1t5tUQwpt5YsuBa7AH/Yk8Vk=;
        b=qo4NLHh0ogbTmblIuWfpznwWJXMG0+KwnFoafxoAsr8TEiyqNoX/Rr2cqPoaHVBaoj
         1N+GY6Dp7f00slvnMKBEoGjc/ixocn/oJOyxUtXL+phgVSDquZGal8htdE8g0r4lfvGZ
         qw1+v93H7+5/nVKdtS7XyWu3yvYyODzreUMemKoxPUg/+0VgKvQb8r2h0glViWMdGy7U
         ueDb1mX1xxqt+MS8HUt2TjnGFF7MG6FTxixnzmLPcDevX+sHeF+bA0e8xkhJ/KbHLMid
         j9gA25awDVpcRHp0CcqdW1FhPs4cyW5PSOi7ygRB63lHqp0nGqfibxk5N7GgP+I3rd2a
         ugyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794915151; x=1795519951;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ah0q/JTuhX4xDVOrwkG1t5tUQwpt5YsuBa7AH/Yk8Vk=;
        b=ug5w4/3wYggIhj/RkO6mpIzh5twToVjAX93BjEGI1pWm6syIrFssJB+9mAZsToxHam
         FTgvyQQjJTB8exJF1vCu1qA4YySAmQywzw2LPtTJYqht7RqZvEPAJz0I6m2FxDC6BEkU
         NQY5HX9vjOpRADv9LcniA171OcG9OZdBukEC2oXYyVWB1YdCXAY4ofoYyFOCZlQMUobL
         6/2SxG+JdVsNYdWCozw7FRWombuQS9fY3msfFeb4T8SGBpGTCsanOrbgaKVGGLiVwuL/
         mbzYmPgEeuk49rJi9lpF38DYB3D+ZrwFm3Xjzx2m4kwBRxqD4JPtUvxIYgsUlcJkuNkn
         WnXw==
X-Forwarded-Encrypted: i=1; AL+hErH25vs4RbhtAVoS+W1/sk9A/3bxZ+XJjmG/ma1B08ns2zLVZCsZ3yPzuGb+dvTwjoEBsI2GqGYNAhEZi0Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ai7/3QplVBV/YA2tJoa5983DQ5x68ugPnhtZPeouhLV4/FR26
	dln44vf3wIy+Fw0G9PzxS1nB3tpXW+4h1V5NAr+IwPVThjjzGkabij/L
X-Gm-Gg: AYBFou1zE8ZZseHV4d0RexE58NZ8b5w+/utXJk5++8tHFO1NGM49KUMHOtwQK7PGZEo
	S9IvcFGVFD5tvsZGYLj0FA07oOBYYvCJzl4XCBOVxPz15D9dJ9UvAeLTTK/N2CuRaoWtBE8n9yL
	AjoznncFz0qC8ziYGOJAncqFCHk9bkCImtNpqF3XhEHo/2bFFtN5PUDoISw7wH8M3wF+S47C0h4
	fcGoe07MyoOfoEpNZ1mK6EdMYwAXau/OIjOjOta8fjx/kvqV4/LNok/y26MqdwjTgn0co7deESy
	a79WCD2c1DCxgda8suwmATT7YHdSwAQ2sfN75ZTVjhp+c1A+GypNP+wNGWqrTvJ6l+ADT3BKAN/
	JPqHXW0cwO2mwhdjvZoca+myumW2PoofpbSR4lxPzP/QYP1Fkv92e9nT9pdPu48L5Rzr4l7qU+9
	f7GAgc3ooO63UnqoLyg1lTOsOoFLWgdzSC20q+CnlN+w6ddrlPynFVLM5GyzU+yy7hgqX7Z2+nV
	h/DrDDjRcST9jsnuSZEouqSD8g+KH+8VuCFCQIiNCjhY2QpdvSvFebl56r9+whDIOtUppg7bS77
	U1/TVQc4Rh3GT+Wza6sTAgfIHXzKOjvI/Kf9mDZb4Q==
X-Received: by 2002:a05:600c:8b34:b0:4a2:1364:252a with SMTP id 5b1f17b1804b1-4bb559f7039mr282186425e9.3.1794915150911;
        Tue, 17 Nov 2026 03:32:30 -0800 (PST)
Received: from [10.111.176.198] ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a4de4cb1b6sm1908215f8f.3.2026.11.17.03.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:32:30 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
Date: Tue, 17 Nov 2026 12:32:19 +0100
Subject: [PATCH] drm/fixed: use fls64() in drm_fixp_msbset()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-fixp-msbset-v1-1-60526519ae2d@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM2wpAUBCF4VfRXNtlnIpXkQuzDUY5tAcpeXcbl
 1+r9V+g7IQVyuACx4eoLLMHhgHYoZl7NtJ6QxzFOSImppNzNZOS8mayIs8spmSpIPCP1bGfv1p
 V/9adRrbbm4D7fgCm7wGSbwAAAA==
X-Change-ID: 20261113-fixp-msbset-5965c14bcb9b
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Oarora Etimis <oaroraetimis@gmail.com>
X-Mailer: b4 0.15.2

Replace the loop with fls64() on the value with the sign folded away.

Output is unchanged. The loop runs once per bit it has to skip, so a
channel value takes it about 47 iterations and 347 executed
instructions. The replacement is 6, and the work is one bit scan: bsr on
x86-64, two bsrl on i386, clz on arm and riscv.

Signed-off-by: Oarora Etimis <oaroraetimis@gmail.com>
---
drm_fixp_msbset() walks from bit 62 down, one bit at a time, to find the
highest bit that differs from the sign bit. fls64() returns the same
value in one step.

In the other users it is only called a few times, so the loop does not
show. In vkms it runs for every channel of every pixel of every frame,
and a channel value is 16 bits wide, so each run starts 47 compares from
its answer.

  Link: https://lore.kernel.org/20261108-lut-v1-0-f762d70ae4cd@gmail.com

Fold the sign away and let the CPU find the highest set bit. The range
drm_fixp_div() shifts by is unchanged, and the output is bit-identical.

Counted with callgrind, gcc 16.2.1 at -O2 on x86-64, function body only.
---
 include/drm/drm_fixed.h | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/include/drm/drm_fixed.h b/include/drm/drm_fixed.h
index 21d822aeed55..7dbe89ca30c6 100644
--- a/include/drm/drm_fixed.h
+++ b/include/drm/drm_fixed.h
@@ -28,6 +28,7 @@
 #include <linux/math64.h>
 #include <linux/types.h>
 #include <linux/wordpart.h>
+#include <linux/bitops.h>
 
 typedef union dfixed {
 	u32 full;
@@ -121,13 +122,9 @@ static inline int drm_fixp2int_ceil(s64 a)
 
 static inline unsigned drm_fixp_msbset(s64 a)
 {
-	unsigned shift, sign = (a >> 63) & 1;
+	u64 v = (a < 0) ? ~(u64)a : (u64)a;
 
-	for (shift = 62; shift > 0; --shift)
-		if (((a >> shift) & 1) != sign)
-			return shift;
-
-	return 0;
+	return fls64(v | 1) - 1;
 }
 
 static inline s64 drm_fixp_mul(s64 a, s64 b)

---
base-commit: fc72cd52fb284f3707fa36a68ea5a22543a51d71
change-id: 20261113-fixp-msbset-5965c14bcb9b

Best regards,
--  
Oarora Etimis <oaroraetimis@gmail.com>

