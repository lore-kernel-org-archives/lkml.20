Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DB648165B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788523515; cv=none; b=fiIIusz/5DVH7pVRZehck16PJdQkx1JH+vLIi3OinHZpfxpH+w/bos2eahmgUfS3FrkWFGOe+3UPGY4srpnaiGMBMpoMxxFWbR2nkV/LPV2UztV042y5m7TRZs6fBfeOb+P9v0WHZekZ/G02HwQUSTzuJhtS1R0stDgvyAm2XfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788523515; c=relaxed/simple;
	bh=8adE15hoTmYjmR3LlC5fQqKhAdVNdpxuGbtQOitjp/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mUlzew56RT7xeFQXfTSSX+1af6oGFWNNAyuGUXfOfbhPOgrmVedT90Yxe/l3f8rPqyyC0EfKDkKCyKXqunQhuM171js5wUDUhcPsfRSbSHkJIBosVYd3/D5TSWkGBRTYqvqxUNzOGTeSa7mmOSerF369PFt0H96YWs2mhfISC0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c0E/I0fK; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c0E/I0fK"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4b333de9451so919434b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788523512; x=1789128312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4+3ynWqyKFzddHoGhyE7PRu6fU0EoMOeTQlZ8MJkjTA=;
        b=c0E/I0fKN3Edvw0+U36/xEZVk03vUz+/qUJHBg3rhExZJNHV0Q9Pdy9V3lhtpxy/2V
         Pp/bvXX4hVM2ZCuVULPXUImRhWthWvvYuAcoq32g0+BSkkWgZmvMk+PSoAw7MbWRJ8qF
         en5TZvqfm/g3JhhtkTw9Zw3IfpHWIO5ENuUPVvt7B3GewNwtkXfCQ5nL4xOVz7DRSE3S
         vLBY7uF+7sTFkO4kY533DZDVFDTEhpoIJMIraf6WtQusEX85ZWWuZYSnQpwhwHgcZCfV
         Qw32USDuy8Uk6PWei778dxrmIrA0hmQ8bzPIVJkBQc4yvlDdU6oPzgYw98ohXcmKrWHw
         tAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788523512; x=1789128312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4+3ynWqyKFzddHoGhyE7PRu6fU0EoMOeTQlZ8MJkjTA=;
        b=r3o/OnWEnu6Y7Two3zhsS3I9XuBDxDNPz49wk+FEH8zIns9piUvPPQ0o2yit6M3hns
         tKSM9LMIkGFCKeQSoOg0xvkwmkTNY3Eb4PLr5aEOMu4L4vJ2REFnTICvYZ8Vkb8QqSq1
         3gR5V5vnHEsGdJtOOShJ5Cqp9QRxTg9KuP82WJEJMMOv0hjfMCRABHJWYKjSGA6l6kiB
         Ak+ml106DZNTRvs5KzLfIcPQx/V1RjjDgBaEFojtHkh+8JEgyp4dqU/L/cq9AZ/96KSS
         Uj0MZyfjk+BX1drli38UIhkY1WsSiO3b2jigMaxCzWguefWUZC7UsSvYceo/ZY1qXeC1
         SOag==
X-Gm-Message-State: AFuF++lQgLKaKT+JErlgpYMR5dxWCe6sVu6AdnmtBFRJ/qF25KfSqtOH
	2PlAYD8om7uV+DvprhkBFDBUSQwlh6u0oYyE7WrESmxWA1eLa7whwRbn
X-Gm-Gg: AYBFou3dJlX0lWkH1NWGvNVgPEI/db6n85n9ZTHUI7hXIEVfYi8rpnX8eAUT13P5HU3
	cHk99VI+Hcz3eQjR87wxilJHDNbnVBqcfqIzRls3FbxsOfcnW69rjgbtNqD1LgqnhC7/+j8fO1I
	QDHjIi08aWPy1OpO2a2vYCXa/ZZk0A/lh3DSepFiY28mtw8DlDeh1R/OYW9/nal1bekwlkwcDiY
	ibG9vDf63CL0e3acRvP3Po7FELjuucy1Gk4cSKb/X+nYrwFr7UIYk6gH3JfipQj/5CLZ6iHFaU9
	z8baesVn/2r+fyd1CZUE27EJgWNr4sANeGSlJ5JOSXK8SfbbPu5taOB52qEnL8dqUUEV177QdNY
	dyW7i0TkdsRMM/hJjj2Crt0zCOBvzaNDdFzkJY6W41geBawTSwXuNSV4un2dapRbSmiqL6sKssb
	n1W1kErmsXWE6W2jRqmFUES5PWppKgaX8AVuOyZd3QfgasRk3RorfKl0hFM+NsZpKEK8PaTNvof
	zTm5QZdge2USsAe2UKGoamZHg==
X-Received: by 2002:a05:6820:4b0a:b0:6b3:5642:76aa with SMTP id 006d021491bc7-6b6fd9c41dfmr4112854eaf.28.1788523512355;
        Fri, 04 Sep 2026 05:05:12 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b8f787esm5770422eec.23.2026.09.04.05.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:05:11 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Zack Rusin <zack.rusin@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/vmwgfx: fix repeated word in log message
Date: Fri,  4 Sep 2026 17:34:18 +0530
Message-ID: <20260904120430.17224-4-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904120430.17224-1-hemanth.selam@gmail.com>
References: <20260904120430.17224-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the word written twice, reported by checkpatch.pl as a possible
repeated word.

Only the message text changes, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
index e3a187a2c7a1..3c82801a8150 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
@@ -702,7 +702,7 @@ int vmw_resource_validate(struct vmw_resource *res, bool intr,
 
 		spin_lock(&dev_priv->resource_lock);
 		if (list_empty(lru_list) || !res->func->may_evict) {
-			DRM_ERROR("Out of device device resources "
+			DRM_ERROR("Out of device resources "
 				  "for %s.\n", res->func->type_name);
 			ret = -EBUSY;
 			spin_unlock(&dev_priv->resource_lock);
-- 
2.48.1

