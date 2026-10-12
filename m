Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F92349B210
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818488; cv=none; b=BiT37sPsmPekoiz/x8/YAupjA05JZbzpwaob8afFHOgTMJJ8KpYMw8VNF9JJ7HvQ0MVU0XYT/5uDS1XZ2dzLZo37ZTFcHK9hkHzRBbfDcnW7bzwUeD0BRWhPiCw5VfLONsMSkIIncMiR7FnBbYYrfCf+4wRdLkIz1Cc3X3DCK/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818488; c=relaxed/simple;
	bh=G2XY5mbE08vqUsJiWbswLBTOR5Dwtz7xnSrdAI1wj3k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iEmk916Yfjs9rH2XP8GvwFM/NqnATE7oQX3w4uoqPp5nqkPwYbpKuZbxmGffMdXsZYQ2/JL2rc2+ZUKrTqc+e1zeex2yN8qoKclrF+L7t3iHSAqnvw3yR5Ax9oMKDHSexDG6LrlId5lylIe8zIXBHOx8WrbNXdjGB1nOoo4ndX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l5PGddvu; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l5PGddvu"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3514b90bb89so3782310eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791818486; x=1792423286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EkQ2fSP0Uv8z7vsyAAy4/OpXnLsDXMhIw27wTwsr6Bc=;
        b=l5PGddvufMJJwVqBR1QzOrPxLfzJjt42ejdK8OcVxCtDA+uSCSCeUqap1PnXFD0Tc8
         G8oHNYn1UodZB+4cNLUJ4slHIGvEP6Eqnjzfx1IUJQKMEdzi1od0Q7HDnNDju3I3oL/m
         LwKQpyDBqol0qevUywSpYHdho+Dl3NwgngBb7hUnG8Cd8xmxqdJFdNQevXafy9cit6wz
         lgQEyBFbZtONarlASDAp+Yx+FK4zmK8YwCPSFTxVKnA82qLsTwIEgmdRdInXXafOKJOR
         C1zFAiLZndtdbTQ4V44yj8mAf/EaXsyKI2bg0iAm0Tg2pnHqMO/0/2B5eeujZJqHOdW2
         O/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818486; x=1792423286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EkQ2fSP0Uv8z7vsyAAy4/OpXnLsDXMhIw27wTwsr6Bc=;
        b=ioook3NldmYcabSVemxSW1KQrK6GufIfvC9J57rBiiyprVsOIEVa+qaRmf2F1U35rT
         WmoeFiqf2vJPxK4WqYphuO+GFqGBzuPJoF9Y24EC9GxTDVtmlR05p8pOuYtKWSLySvjz
         BgBNBTTuPiEGfB7XYba/3pKaKCT/oemNEQpfjwbJB86VJzodKP75DA6AdXV5t6JaIza8
         2eqgwnt4pY4r90wrIQYqSpnLj8pYlZhC+I4JX3xMP59rpfHKgpMxu8P3VF6UJ+l2+gdV
         3RagOmF8yDCeD5tPu7oY0OH4dMR+JCkDHmPq/Lg8CXMF5oNRrVjsUyLtHTX5jRMvss8V
         i6qA==
X-Forwarded-Encrypted: i=1; AKwUvBwB2f8vZOWi76/1lD/Ac+yUNo2ZpAgzMGYQPu8xdn6wFmmPXIXv8Zo0dGuR6BGFoDFX+uSYA0rj1IOFKyU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKp+RMoGb2x8K7FSnM/0pNU6FXlVgwl72Gjljer3BnV3KZYLRRC
	sel2WHMLBibqWcAuo4kcohmddmZTrUORfC4vYlU1yaTzIKaGqhGSS1lyEgbDOQTQI+M=
X-Gm-Gg: AYBFou1p2LnRBqyUj+fxStTAN0uu6AmYtZAYfoIsWqvg1eIm4CV3ytB65bIZnv7DpB8
	+i5HXvaFIn1fjDVcJhH7dEK2STJaJipI0q6EmyKOBHyQZtxjW6CW9RoR1qY5wZt59w0Ob7uag1w
	SusSy6G2ooUvjkABLb3VGdbEmL78l3aiOWj4QgKYWQ/wm/WBEhnlf+dSMNil5rcvxxDWcW9ftJ4
	cSoO/KNL+bgL2FfT4YZLo4gybgpsBfM66DTo0jQPvOXG97vd+LwRMqCfPq/trTj1xMN/W/dAjNM
	Tp1522Wx96yldutza30gVqCHTeyoUjfj6qmMnNaypUmZhAdWZdBhPl5i3DKyuRcPBvWKEdSlMGK
	d63TlBkiHdTIBCbr7zTMLY43WUlb/YlfPOUj9HE6XjeIfayG1a9KHr51Q3IwJeZ0krT0C90nzj7
	w9u+JoV7kl+j8GlqrxATHOTb9eJh7eQR2gM8plTbbhU90t2jdGe2plPIlbOP5MO6LcZY5631tqr
	ZFoOZdSuZhFdP/aHpbR/aMUFqjmbp2/JP+4vLU/75RDoF18QG196CZSLP1ZH/KgHdHINZFb4w==
X-Received: by 2002:a05:7300:de48:b0:353:82b2:205f with SMTP id 5a478bee46e88-35382b220a7mr12152634eec.16.1791818486220;
        Mon, 12 Oct 2026 08:21:26 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:301c:f8cd:c1bb:8d21:6c07:8107])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35977229a6esm18721660eec.8.2026.10.12.08.21.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 12 Oct 2026 08:21:25 -0700 (PDT)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Oded Gabbay <ogabbay@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>
Subject: [PATCH] accel: ethosu: Fix kernel-doc for ethosu_gem_cmdstream_create()
Date: Mon, 12 Oct 2026 20:51:11 +0530
Message-ID: <20261012152118.33548-1-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comment documents an exclusive_vm argument the function never had, and
leaves out data. Swap the two so the list matches the signature.

Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
 drivers/accel/ethosu/ethosu_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index 9afe2549e..2b89f70f4 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -712,8 +712,8 @@ static int ethosu_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
  * ethosu_gem_cmdstream_create() - Create a GEM object and attach it to a handle.
  * @file: DRM file.
  * @ddev: DRM device.
- * @exclusive_vm: Exclusive VM. Not NULL if the GEM object can't be shared.
  * @size: Size of the GEM object to allocate.
+ * @data: User pointer to the command stream contents.
  * @flags: Combination of drm_ethosu_bo_flags flags.
  * @handle: Pointer holding the handle pointing to the new GEM object.
  *
-- 
2.46.0

