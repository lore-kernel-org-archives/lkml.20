Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A275B39D3FC
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 22:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791066812; cv=none; b=CNg8qJPDHNXIGZlFjFyK4bvxTnwnZO6x/qBEXZ0r0Tuch8q/Y3zGa+kgrhN0+pPF6s4rX1pvBbG6SVSCxFcy1XS3Uq4N8MGdHrS4x1LNVyTDcg2d3qCzp0bi32qLKWkbqOFX0pBZz0osuAeMxxI42G3o1TA1Fv1Vi1RkWpLngQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791066812; c=relaxed/simple;
	bh=B+AzlxaEDOIbUR2XgxY3SS/3ebqvCC16gLh4COnivCk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XffGa2COkYtYM7fzftUr3Tf+8ey6CVtz67eAp6vhTvI6oV02TJwTxdKIwozI9vmWaru0i/cidwjOk8Kg8sOKirR3S2ta8cJMeG2Gd9bF0a3VqjjaSoNn40i350GNgiiFjHK65rqMdGhh4gWpMS4S6/hHuoNvrHwu1/WPD+bLU20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L5Tq+hTy; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L5Tq+hTy"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48bbb06e746so247393f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 15:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791066809; x=1791671609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KOWsHQRSHb+0OiLgXs2lkzN27RX1yq7wkT9nw+eMr9Q=;
        b=L5Tq+hTyDUHAbG3iCzWGTJ04AAPYTVT183bVZoJKQwBF0CjwhxFxJF7z1mVOX1+TaH
         tAh5oZ2xPNzdbvL5AwlCzc1m6vG6p9YDLpzfwROilKB70T0oaNVRqIy8COGOcbbVbayg
         /S0SKhFLsSL75i3T51/W2yujcifGgFGrPbJighRHpdtxaNBesL/creeOf4tfhHMHQ1h1
         4yy5Fa2Kb8zOjWxH8ItKtv+m5lQmC65v6f5GUFZk/Mp/0CNbTUv4LWXX5p+k/69pAHIo
         6bXL10Yr2+wVWs7bvt8+iAPRPWjgRtOKnoG4cOdnBBk7pc4GNtBQxEDA2TZtn9eXgP8b
         pA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791066809; x=1791671609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KOWsHQRSHb+0OiLgXs2lkzN27RX1yq7wkT9nw+eMr9Q=;
        b=EhWf/Kuc2zjOI9186aO2hhi3rJdSA7GYDpKu50FKwP/gvhEbcnyaabMJTgTi4Cg2CZ
         TkL9PO/AJLuFEiVsrpH/v4Zixyh49Erl7870PT3WKS15LhjyOBSGhufFhijb2unA+L0P
         I7BLjTLlOYJ+BzAeomLAVu7Br48pPQcKSW0uIIO5rK2n2CsBx5XUGoj1tqlClXuUTKvo
         UzGQd6E1cpATqALAUKIElE9B7HvfNjDKOOKpfDfoWusEYvDOMrwwcn4EvTELoCky4bn2
         ghtywLRp30pxlXvYj7e8Kak1mfMYV88cFS5eIC+8WJg6+LMhYXXWC4XNMwvyMoyn0EY1
         DfeQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQ6cJzWNlR8xztFzU1LuJuM+G++jgr2tZlr/mVRGZTsAV4GyX/X9VycE/Jhzrhtfp8VAy85NvRWs9qAfk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkScACp4JcFfrxiP2lr+/F2cJ0yLNtrb6mBAf7rhU5JtjsqAId
	wxoLkW9Fp2Ga165e8v0qvIuttcfXtrRd5+hgw/4GXhJOcxz8cogNhaet
X-Gm-Gg: AYBFou2SyqafNvlcLwZwPXd5JK98HEB/imI5Kwi1bo0fYmYpRKY9FV43pSMqUb1+FiW
	J4asgRKbDTHwzL2sjYBZvcrRbNpqFo5m4x1ySTZTLcOEd6BNt57Y1QcdGQ/M8sYgRfod77JPSPQ
	qzbMKaF77ZaAWL1haxHH6s2YUD5oGWPbo+sBWHx6TYd/FSTnbsKVoWQbf0cPxM4Buvdwv0frbKi
	XwLZ6E0C+YBZ1zRC+7lgsTaCqCpHUHCyT+0bHm+mSVz2HMRb0brU4T81X22s1913r3n7pFwp56S
	Beb0YWASu64BArCjWmDKbu+W4JSwHJm5I+oU6U28FKbPSinP+xGXBoVujP9VScIVNa57IFBxTy3
	Asv4jCINwdjowOwTx89wxz5WDwmMSDCP/3J7c5INxB+TBARQLnVdB15ZatzS5iV1NIS31EV418C
	tNbBl4ONQKcwzco1Sxm+Ly0wU1UYyBjdn6zPXd8cyznX8LS/GmBZnYUyW7nqx8qiih43iTjZp1Z
	mI9hlRmcgTIfXyQ4sLoyQaZStu9YGDODa1i+phiIRWK/5jKLn0oO4FKhhD4c2v6xWRgYSQWRw==
X-Received: by 2002:a5d:5f91:0:b0:486:f907:ebec with SMTP id ffacd0b85a97d-48c47fe4ee6mr5052425f8f.31.1791066808651;
        Sat, 03 Oct 2026 15:33:28 -0700 (PDT)
Received: from voyt-laptop-dell.fritz.box ([2001:9e8:bd7a:9200:44fb:d9e0:fc9a:51c9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c5270569fsm1886371f8f.5.2026.10.03.15.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 15:33:28 -0700 (PDT)
From: Dmitry Voytik <voytikd@gmail.com>
To: Kiryl Shutsemau <kas@kernel.org>,
	Chao Gao <chao.gao@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-coco@lists.linux.dev,
	x86@kernel.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Voytik <voytikd@gmail.com>
Subject: [PATCH] coco/tdx-host: add Kconfig description
Date: Sun,  4 Oct 2026 00:32:37 +0200
Message-ID: <20261003223237.513456-1-voytikd@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the issue when the driver always gets compiled as a module.
How to reproduce the issue:
	make mrproper
	make defconfig

	./scripts/config \
	  -e CMA \
	  -e ALLOC \
	  -e KVM \
	  -e KVM_INTEL \
	  -e KVM_INTEL_TDX \
	  -e INTEL_TDX_HOST \
	  -e TDX_HOST_SERVICES \
	  --refresh
	make olddefconfig
	make mod2yesconfig
	grep '=m$' .config

	returns only this driver as module:
	  CONFIG_TDX_HOST_SERVICES=m

"make menuconfig" doesn't let switch from =m to =y either.

Signed-off-by: Dmitry Voytik <voytikd@gmail.com>
---
 drivers/virt/coco/tdx-host/Kconfig | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/virt/coco/tdx-host/Kconfig b/drivers/virt/coco/tdx-host/Kconfig
index 57d0c01a4357..5a13ec6f51e8 100644
--- a/drivers/virt/coco/tdx-host/Kconfig
+++ b/drivers/virt/coco/tdx-host/Kconfig
@@ -1,6 +1,10 @@
 config TDX_HOST_SERVICES
-	tristate
+	tristate "TDX host user interface driver"
 	depends on INTEL_TDX_HOST
 	select FW_LOADER
 	select FW_UPLOAD
 	default m
+	help
+	  See INTEL_TDX_HOST for details.
+
+	  If unsure, say N.
-- 
2.55.0

