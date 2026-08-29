Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155833ABD80
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 18:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788028388; cv=none; b=Lw3tXQBWz3OGq6V9AfZ3lKFEye9PRa8et1n0He7sH/Kf/7YRIcDfTAFdafZPyKzWhCn6Q53rmBmj4v5suhFFAjxlAUAHRmsvWG/N25vA+WoiROO/IifWqFVDdbPqz/5eTRjwj2Q5yAU6Hev4v002iZj6c/urk0TwUKFPL4fLqnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788028388; c=relaxed/simple;
	bh=S0LqqKoJyhJE6B9oZp/qUrmlUVARoa7tbLYQwWMBiiI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sDYMh/VAjZXZJ/Pkg4yh+WyVOHVRNoMjn4iQuQKYQg2gPHS9G22Bl29RqjWhPx/Po66Q3TxhDK4AJz/WSLJJa4XSgGUJtNOoDjgenKuRYAyti9zlbew7FyMLDwsrxLyjNB89EaZeXU+Fs7QS8bAT9Mc+k5OI6ZaYzhUC1QyW8ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mFc7WERY; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mFc7WERY"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49b9320423cso20027105e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 11:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788028385; x=1788633185; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=42z/82WlDmCCPPz2ajG39fqfbcCLmb2ayvQD7foaHV4=;
        b=mFc7WERYUiKbhiTeTh4OV+9SdkJYuOvYwLaH8G6ips52/Zm0X85QPWEiIn/eQ6ET/X
         91w8tzcRbvy+B+oSrtR1cLiwJClMFoCVU4TjA1gLcJ6N4Zp6GFYJ09DLLoEtkrpwkPTL
         VR7o9peqqHzkEa0mU63Mt5HFDEJ4p3b/7Rb9Ooe8bfadOdsPSjfu/YdTaX5mIxEma2DS
         qXZzio4W8X7MVadGFZpHKwNBGlv9oc5MguG3VUCJB1YwXo7LJ5JkEPbz4NvI/mR7O0Kv
         JRBNwDMT98dhY2lH8f2+CHxHMhUWWmPYO5KTEUO2pBKyEIA/Ns2B5KtC2qGLb9dgt+F8
         OjYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788028385; x=1788633185;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=42z/82WlDmCCPPz2ajG39fqfbcCLmb2ayvQD7foaHV4=;
        b=JRgLfa2zOXDZKkCtBRGeg/09jJRzfI6xM+6oB0suSa6FjEYwxE86w2tSi6NS+C9YAr
         BA8DPxcgDeNZx0l4Q+Gb7M+XeeNW3Qg5X/VQw3GgdQ5ODaaSZb488lUxjnO/CbH37Ano
         cGoA8b5PfnDiBAtJqN6t4v9nIfYFNu4pt4twbfS+vHPqe+oTC5mNRCLfi7ZI6V2OiFvc
         teTCkVHro7JES+QML66hRdPE61kvY624BHl9ZQ/eXd0uHwrmogOAoxH8bs0UamCa5tMx
         LfKKZdujBeh0UVwS1anje1MyIYYljp2JNqqGoQ9V6wEMwGC/8zOrS6o2Muw9usjeNzYo
         2fpg==
X-Forwarded-Encrypted: i=1; AHgh+RrcSZHDqONC+EsoGBPcCX43kVYjxI/SibR7SKRasLOh6X5pIq0eRJ1X6jdJ2N+ZlBNng5RanxG7eCZQIRQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kaHathMt6au6XO19Czg4iKqj4uvSfd61bnnLnrT80yvZcgvzfb
	KIvfSDml7RgiwfYxN0GTZBeNzWMTdotUvUCnJa4Qq+b20JdRKqDabTIpO5clcq+2TlhVWyS+
X-Gm-Gg: AR+sD13RPCIFQakQtRnhCgf+U8SiDnpdV0L6ck0hWXXpgdQl8G94vtpI9fK7Rf8j96r
	+62mEeqSkv7NVLWGVr5sQzlc/lcszN6adq+IDWIqyXs7bRV9jPHDI0r7nEHGZQa76ywGXe/Jf85
	OqmfO39AHglEQJl+aSrKgfiBPcBptU1o68L14/ag7JPYqKj/X/oqqhpuISJv88Ur2kBF73vaz7n
	bW8pjvxnjQwA3FgNZ6eu0jrhW2/K8Xi7df4bs5A6ahY+q3w/OT6btkorVH7pnX7nBPtWtTsEGFr
	6jAElxP6sQ/BBBCxg0iOWCFoM95InwPNLdSBt+HzfCaFItgGZ/y77KDvqpLP8uhX6OhFmreB5Ga
	J0kuTz8QH/cy6C0c7qFDjgof9g7Tm+8RkPWD59WQqLOOx+4CYIlExFXlg0+HCVQzX7FRXwlytoH
	mp4SASM5RteR0W7dHIa4y1baCsxNced8GCSxe0o6VRxqmRy6zpvBwzMUcFsaACltIDqgPXxezYU
	lXr4mp6QoSex4uRpDpLXQ==
X-Received: by 2002:a05:600c:3513:b0:499:7a15:fcec with SMTP id 5b1f17b1804b1-49b91c4faebmr219335465e9.13.1788028385003;
        Sat, 29 Aug 2026 11:33:05 -0700 (PDT)
Received: from [192.168.1.11] ([148.252.146.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccea6b814sm48682495e9.0.2026.08.29.11.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 11:33:04 -0700 (PDT)
From: Dale Whinham <daleyo@gmail.com>
Date: Sat, 29 Aug 2026 19:32:48 +0100
Subject: [PATCH 2/3] platform/surface: aggregator_registry: Fix tablet-mode
 detection on Surface Pro 11
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260829-surface-pro-11-aggregator-registry-fixes-v1-2-ebf5cca9d205@gmail.com>
References: <20260829-surface-pro-11-aggregator-registry-fixes-v1-0-ebf5cca9d205@gmail.com>
In-Reply-To: <20260829-surface-pro-11-aggregator-registry-fixes-v1-0-ebf5cca9d205@gmail.com>
To: Maximilian Luz <luzmaximilian@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>, 
 Dale Whinham <daleyo@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788028380; l=1232;
 i=daleyo@gmail.com; s=20251214; h=from:subject:message-id;
 bh=S0LqqKoJyhJE6B9oZp/qUrmlUVARoa7tbLYQwWMBiiI=;
 b=MXKPGUi9v6ZDIOHsG8KZbdfFkKBS2Fuug4bSn11uTjvSVS7i8HYopUzNE5BMyCzFXwnHALu6A
 nsXfwtyESDhD7Iec/6vULTZvzT3pLhEl0Y+WfiZY0PhT2htcRbXLR2y
X-Developer-Key: i=daleyo@gmail.com; a=ed25519;
 pk=M4mvgx1TB2TniKaedTDsO3PbLKgFosJuegXRXPbn2Ds=

Replace ssam_node_kip_tablet_switch with ssam_node_pos_tablet_switch, as
Surface Pro 11 reports tablet-mode via the POS ('posture') subsystem and
not the KIP subsystem.

The KIP-based driver would remain stuck in a 'folded-back' state after
suspend/resume, whereas the POS-based device reports its state correctly
even after suspend/resume.

This fixes the type cover keyboard/mouse being ignored by desktop
environments after resume from sleep due to the erroneous 'folded-back'
state.

Signed-off-by: Dale Whinham <daleyo@gmail.com>
---
 drivers/platform/surface/surface_aggregator_registry.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
index 82c2144e10ec..2cb8278d98ea 100644
--- a/drivers/platform/surface/surface_aggregator_registry.c
+++ b/drivers/platform/surface/surface_aggregator_registry.c
@@ -415,7 +415,7 @@ static const struct software_node *ssam_node_group_sp11[] = {
 	&ssam_node_hid_kip_penstash,
 	&ssam_node_hid_kip_touchpad,
 	&ssam_node_hid_kip_fwupd,
-	&ssam_node_kip_tablet_switch,
+	&ssam_node_pos_tablet_switch,
 	NULL,
 };
 

-- 
2.55.0

