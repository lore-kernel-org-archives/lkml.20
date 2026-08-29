Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1DA370ADA
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 18:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788028386; cv=none; b=iBxqQAOvuCSJ7huJlSYNFuD8yQIkxldDtsQ7kxTVKYUVsWY0kAm4diQL+phuLv/pA6D9T2NSmYfNBwZprACQkFcFoo5V1mQBwYBtDGBT0QRwExva3NZIGcQj3fkHtCUmWg4kiJqE9Dv48bbgIiQDAR06tA3J+AH2GGRSsNXCkgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788028386; c=relaxed/simple;
	bh=k0iTyq30Pts7oCqW5WqZ0ekJF2O8zcdRnmPhaFpT+eg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gnVy5ygOVyOmvRVhb6/NshXvUM9eQN7ZwIrho/bv77mMRJrzLPlzGxGUC9edA/4ikP8nIQhRgQ+u/eJw0Zuw0LHV2e12tdQ9xfDSY2U+Pe+gr+5vfyfRZFAe4sYn/DTbFicDXT/O+YSVcadt1ksUTI+BF/4yX6Qnag7+yxr3AdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f2aG9m0S; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f2aG9m0S"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso21778085e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 11:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788028383; x=1788633183; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=T+s7fLb5lkfJr6wykxA18vctDqherQx/EMTkQ2+CSEE=;
        b=f2aG9m0STY3ATUV0IY7+SBywVN6bjyHrQQc5v2IbGx9zfElIs2SN/FbJJnRHBYU/pu
         tGbWyBK/ihkRILGbmZ81b9lFUg+D9lEl8Wqq2SRjuioknSSviUNmVcX/6KxUDJgIMDg/
         kxFr30LYaZAeVTFnUl3YpfC0aBNbqnCuA8t+NmbSuLcn9yjn20OnYdLt3o38AgDnGwOX
         5U4XhV2iisYr37QNSHS7GpU92lr9WNgKP+bA1NDJU562dX4vduaNJrfpG8OApCOtW0L1
         dmt9cEsumpvH6USzTuAZCHZc7lPxBHh9zDs+HlK0xI0n/nRN9xJb4ffh3BTyvgEbztlM
         ZY3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788028383; x=1788633183;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=T+s7fLb5lkfJr6wykxA18vctDqherQx/EMTkQ2+CSEE=;
        b=K9s923O3Z4hV9eIlJJ1x9iGi4rRZwoYxeof3+RfbzH1P5sxxTTCy26vE9DvmcDP3bo
         57lxur3Snzt36s7wUNU1EjFJyjODnTHja0039f9qkE3vBRrFmUePWRWWwT8Z5S5yYiSH
         pDkw6t+9MqR7Nx/m5ywLYxmmnFLziA24XZryPaK+twdNURwmKFIH+ZMWRcXc314lGMMi
         EkL9mCTn4aNUGP0a+uRxGyD6/QcUGn3bz7sbW3FChdazJWAQCkmm+tntBsJ8dJUKcjlU
         JgrIGnQxbD0Hp92j1rdUK67swvY8YuTGGTnVF6uIrFxCBV4T77YbIlj4SViukSiEF3uz
         PrXg==
X-Forwarded-Encrypted: i=1; AHgh+RqV6+8z9Pz30gHq9IQSD0m64XYKRjqgP40ElaNONnABp5cfWwAu8wT+xyzwDvtrQ7QTex8PUdErm/D7bWY=@vger.kernel.org
X-Gm-Message-State: AFuF++mmB/uqtofJH7uTouZtt6OmBN81jk9l/leuvMy9Px3onHkqJE7e
	n4Y3xOmbjZwjm5iQgVUoQgtXi60uS5RxKkUaPmk58WTKf8wORovgAUcIYhDWLWVl3735dcvf
X-Gm-Gg: AR+sD13XZ+MZCdhkGifeXwXsLajguq5/uY+HKlBAvX0I9uNAF381kh0xO82NEYwLt5P
	JWQz8bHQvM+gmpGrnlBWGlQz3OJarTwRkeG+ahP1JfFerT1fG4k2HiGQPgLh8utNNOWi1Z7YfOk
	LBr0wAGGqFeydAgYFpa/w11YuJ0emS2uIpoT/oWx1nHIvjQFnypsfmz848VDerXoXc2SN3YBEt2
	5+sQEfZxyCsDGgxc033RnqLzb9V3lDv+ne116W7P/fdgp7ewYWufoXdgMyuDjwWy/rBm+CM0mop
	6QBcM4LDhLS+1jGBTPdQ0rv5y3pqfEQhU/hYdLV06JGLFvDLqiWyKNBpunnHn/CtD/leemmZ1mC
	2v9ByVrr90ocACrSyaRADHJhuXHCqtXM7Sw6KxMuE5mt+XAvP31UUaoNwf65ybAM7i+1A0O1Nw5
	8uD2C+id//9raG8KHcSyxiTqrN4KsWF1eTy31m8w0L9fK2PPHkTq5igFOOvcl2qKXGkcTB6qpLY
	dLUySjN95kDoREkKz2spA==
X-Received: by 2002:a05:600c:4514:b0:499:900c:9c68 with SMTP id 5b1f17b1804b1-49b91c1f2a2mr233129365e9.6.1788028382804;
        Sat, 29 Aug 2026 11:33:02 -0700 (PDT)
Received: from [192.168.1.11] ([148.252.146.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccea6b814sm48682495e9.0.2026.08.29.11.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 11:33:01 -0700 (PDT)
From: Dale Whinham <daleyo@gmail.com>
Subject: [PATCH 0/3] SSAM registry fixes for Surface Pro 11
Date: Sat, 29 Aug 2026 19:32:46 +0100
Message-Id: <20260829-surface-pro-11-aggregator-registry-fixes-v1-0-ebf5cca9d205@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBCF4auUWTuQjFCrVxEXaZzEcdGUmVSU0
 rsb6+rx8eBfwViFDS7dCsovMSlTgz90EB9hyoxybwZy1LuBzmiLphAZZy3oPYaclXOoRbGtWNU
 PJnmzoR+dPyZy6TQQtNysvB+tdr39bcv45Fh/fdi2L8U3qd+MAAAA
X-Change-ID: 20260829-surface-pro-11-aggregator-registry-fixes-1b013f20f782
To: Maximilian Luz <luzmaximilian@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>, 
 Dale Whinham <daleyo@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788028380; l=994;
 i=daleyo@gmail.com; s=20251214; h=from:subject:message-id;
 bh=k0iTyq30Pts7oCqW5WqZ0ekJF2O8zcdRnmPhaFpT+eg=;
 b=X4V5bLZ/YK6DWtkEs2o5HFWma/eZpM8XtUfiAHiJBtwKd39/OH8dZWzMzuzwxTWAR9aYynq7F
 n6aKhz8/m3PAN/ofzdUYXoEwxGMvlf6DBR34ZoOYDuVxHdEiAtN6IvX
X-Developer-Key: i=daleyo@gmail.com; a=ed25519;
 pk=M4mvgx1TB2TniKaedTDsO3PbLKgFosJuegXRXPbn2Ds=

This series brings a handful of important fixes to the Surface
System Aggregator Module client device registry for the Surface Pro 11
(Qualcomm X1):

 - An unneeded driver was removed, silencing a dmesg error.
 - Tablet mode detection fixed by replacing KIP with POS driver.
 - Performance profile and fan support added.

Signed-off-by: Dale Whinham <daleyo@gmail.com>
---
Dale Whinham (3):
      platform/surface: aggregator_registry: Remove sensors device for Surface Pro 11
      platform/surface: aggregator_registry: Fix tablet-mode detection on Surface Pro 11
      platform/surface: aggregator_registry: Add performance profile and fan support for Surface Pro 11

 drivers/platform/surface/surface_aggregator_registry.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
---
base-commit: 3eaac948bf4505bc7e3b12d3ccf4ad900e5df082
change-id: 20260829-surface-pro-11-aggregator-registry-fixes-1b013f20f782

Best regards,
--  
Dale Whinham <daleyo@gmail.com>

