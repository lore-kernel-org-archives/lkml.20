Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431454B129E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 13:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788443572; cv=none; b=JHbmyJX84t+oAA8isYrfinHKxFLLTzhcNOLp6JH7fmP7yrKuZY4nOVVyfkXe1LeUwD/wmMbYVP11XgVMD+AZ/oFplIHNwR+YQeIehRdftUUszUhFJkqdU/hOS/qLgFG5npitg8P40u33ffwOuPVrh/pDUFBt7gY2On3yqPfcgpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788443572; c=relaxed/simple;
	bh=A9tFXtu0XWRFcdfwCqDHDr5yuN/58LVPsyUpMIW1Ps0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bFDKbDW7pOn/pt9scb6Mn8YG15d0PAZ+zMSphf5tvMn7485cpttOE7iGTSoU+I/+qx/J1fy7pv46jViX3RqKbuK5cJLp015K0ZamI52YegCiMxGhJJPCOrFJRp7YCNmjT2BuEAdSr0Yv5yiTJP2rJSGuOwOiN5FGKJo3TPxTJDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BxDtd7Rr; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BxDtd7Rr"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48433e9562bso553092f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 06:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788443553; x=1789048353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=csh27SRclgEY3hCLE8xf3YTKQW4fhH5v82nkgEIQKps=;
        b=BxDtd7RrTkSLcDHlzFqae6piLIxi8lklen/ukPmCL4yQ08H/IOd+MDidvLFiQ0me0f
         QKMo5JLGhZS6WRMECBXIIr+ke0mUNF+6ktCQby+V+un0exzlbpJB62RmaUAqRWjp8EHK
         WI+FRUHf7dg30Q99Lpd6ffB3vhlaRo/cQcKzv7pDhCxC8nS4TTtLB1gI0u/tY23P/Vk0
         LmIhZ4NhcIdUtpNuwk+wGLYd/ZJqAEFY1/TEU1nShT9/1AVytLb6UvqYJwYykXmat3oI
         77w8rcJhceYhR/SRuv5uX/xGvaE8EKQGJv6NP2O7Po2oHow+sNnZG/mGNU3osD2uw8xU
         6VuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788443553; x=1789048353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=csh27SRclgEY3hCLE8xf3YTKQW4fhH5v82nkgEIQKps=;
        b=A/UELNM6A6+MTj8/mL45smHhqrhO/PUZlC8vY49G6ouE5fcEHdejLwDdyJqj+BmTXZ
         bFsN24ZPjsQ2LszR8K+e+TX+tnH30+/DVqE7dnCISRkJcbL2hTtRDFOaPIAXuI5E5cfx
         lQWppEXde8bBweRhEvDN3rODuAc/+t35GnzbMBdVsqx+X1AVibU5+tuxy9LzQ1RGbJRp
         cWA7zT7skf0lExjIUmwEe5XABa3VoQiumuSWMjeZg991TjZT5UThwBCrkKsyxpw6c3c1
         AmJoBsAWZxPBFZcA2k3KQThilfDyEJbDOUVRQvnXpgagyF6B869XtEDGBLnZhYubB1qA
         hvGw==
X-Forwarded-Encrypted: i=1; AKwUvBwKolU7iNIiX6OvLryQhAqrzhRiaaHmfD74E1knihHtFr4NmUwB6kChM++8/OCY5t7lpUxosQPTpF2w8AM=@vger.kernel.org
X-Gm-Message-State: AFuF++nAan9ACVzFXzQr6vLyMEQq4BL4wUpccJ0Yu+PS/geU5NLnElUv
	gS7q8ZjEOrAjLXwdjhJcsVyP9bc6CHt0Vyr9sZDORVOexv1CzkmhJfZm
X-Gm-Gg: AYBFou22zF7I/zZBVgYZG8nHRjn4Qm3A4cu6UtXNrsKVsufYhKiW83+x5on23a+5ALL
	kwYo30DjNRV0QbkBPZWsV2y34IiAzmh/a02yoNiJImlTPv5rcwwf/B++3WV9cHCX7uUZLvKNEI/
	qM9e/FAOI5btc2F6D3Eux1Dw07mTr4BW71bqkc4DK5F3+VdTFexTughFzXErMm4/2I4Is2vQVfb
	FtRT9iBfBs2BBB351YkVLql3B6XbWqjvzGOw8dklgaLqbyAEFvUkD1tyXufPVPzTXoxcGgpbBWM
	o36fyDPptMMqexpMUkJQ7oat/2NNfxD9ycu9br1cSnsx9Fv9u4FbhjzBhdKS42enDtxI5yqa4Rt
	t0EvUckkPcux0BJnxQNO0g7uio4xkVFxbdk7MXPj2UkCd586owtDslrULc2/KRwZVRs/Ao6UJTu
	GhE4bn+g8ifIHCPJD+obnzXrGcQfu9882VuEKZLk+aoE0DYP42CUiy8O/0qnoohbAdU5O4oCIGK
	BBDQncBAC/iQF5cSaLsXq0SMDQMByxbbVqjzStfgMl9runEBEqSszO2LPOmQQ==
X-Received: by 2002:a05:6000:178e:b0:483:3695:6ea6 with SMTP id ffacd0b85a97d-48488f1b111mr21280968f8f.20.1788443553101;
        Thu, 03 Sep 2026 06:52:33 -0700 (PDT)
Received: from chubuchnyi-ThinkPad-P1-Gen-4i.tail30ebf2.ts.net ([158.173.155.197])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ed2edfsm13597771f8f.23.2026.09.03.06.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:52:32 -0700 (PDT)
From: Aleksandr Chubuchnyi <chubuchnyi@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksandr Chubuchnyi <chubuchnyi@gmail.com>
Subject: [PATCH] MAINTAINERS: add Tegra CSI bindings to TEGRA VIDEO DRIVER
Date: Thu,  3 Sep 2026 16:50:58 +0300
Message-ID: <20260903135058.2598642-2-chubuchnyi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tegra20 and tegra210 CSI bindings are not listed in any MAINTAINERS
entry, so get_maintainer.pl does not match TEGRA VIDEO DRIVER for changes
to them and reports neither linux-media nor two of the four maintainers
of that entry.

The entry already covers the VI and VIP bindings, and csi.c binds to the
compatibles documented by both files. Add them as well.

Signed-off-by: Aleksandr Chubuchnyi <chubuchnyi@gmail.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fc320b373..e4f50fe24 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26924,9 +26924,11 @@ M:	Luca Ceresoli <luca.ceresoli@bootlin.com>
 L:	linux-media@vger.kernel.org
 L:	linux-tegra@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
 F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
 F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
 F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
+F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml
 F:	drivers/staging/media/tegra-video/
 
 TEGRA XUSB PADCTL DRIVER
-- 
2.43.0

