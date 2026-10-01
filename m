Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E32347D478
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 19:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790884736; cv=none; b=HBY9Spfq/OnlRwcb95J1g2O5m/ZQX6TLxqT5YoU1Uvm9cKgfq5+dcwXUGOs2mMRdtDr2XKs8c/AJAHq0SB0KBn4c67dSDFYmTF6bEnguCYqqk8yOLbAm7JcZ4dlucJfYu0MVROgHw0iHix3O6ge8VYLf6PspIZZnspsT9sFuvbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790884736; c=relaxed/simple;
	bh=lsZA0e/b5sbxRypRHbpgPYpst0BDN0tACu0nxjitEDo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UTidAiQiB9n1dwKsXD0d7bPu2Bb4umyy12sk/hTb8ZJTxVaZFAbRCn0eeUAvWueb9qxwCcCv+QxmGXB408/ah9AOJ+Jb+xZDusWiBeXNaY4JQ+7b95Jpv8JAJf7/OeZR8Pa/nv75nGo4l1TVYr8klVofwsu+1NiEbhFKNyRoaBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MW9NG43D; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MW9NG43D"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48aff58e6abso1334185f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 12:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790884733; x=1791489533; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NZQM6qPjUipP3twsEWuLikKTTxPNmXURRnws6p/YBzA=;
        b=MW9NG43DFNo6qZ4lnwguXoSMpr5jJL8BFlH35NVvTjZti+bf45nbUleWV3TdeeY2lV
         BzMGeW6gVtPiJyOj6nq2W1oA+lqBXE2rUhYBdqysIiGE3HPVUyPL7e7+PAM9KP49Ns0l
         myONMDkxccoPAirj/9p9Odq2HJvRPGAuk4243wcZiRg+3WT2Wpq+0wqbru/Mjy9s2hdE
         /r/6RKbKaF+YzYIs6JA/UfKOp9LQipgtz2f8LONNq6UiH3x/y0GpCQMTfFNwNeaVXmmj
         9nL1HwlfVmQJDQP/pV8TaeGiJFi7waxrSSTE+ygN0hdWE/MJ3KW15wOZrX9U/VSO9mH7
         /siQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790884733; x=1791489533;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NZQM6qPjUipP3twsEWuLikKTTxPNmXURRnws6p/YBzA=;
        b=asdxOQ0e9oxAUPo0da1VDtEzXI8mM2IwboCIiLGjtqSYCi+4RgIR+tu8UbNNJ3ZyBV
         cunADxRzys8FV+Wuvnwd++ugwl4yN0FRKPUun2bQnO2ppsCzrZzeK40orhhdkSgrvcoi
         BlLLyeNZ6uudsxO7xl0ypq0rl2WPHz2d4V1vp2Mpx2IPxanN9E9qhabXl7E8Bq3EPOq1
         QjofbZQWEm3fP/33KF9+26vY8JwdVDJfiwdBCk4/lPWDM1AfaSvHwYte6Z+U2Yxfi7Db
         0+DvJjq/5EBMpraebpwRLU0qP9v1KokTpz7fLkQL0K/PmDBH9cwH0BE3DTGrWZN0Tkco
         D3yQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2NBOGNFTJwEaxoHUh01cgIMI9FZmZA7MVDqY2NCKIXw03ZrMnKz45ruJ/Zufcy8kTONQK9j2s/CLXhDQ=@vger.kernel.org
X-Gm-Message-State: AFuF++l5Kq0gf8cQ0D+0bnDk0sVx/7fFliYjzNUqeC5swNxFBIBY31xK
	LWoVLf4eIooWxg2SSSjdEnedlqNpQflMRpLGZsuVADnNoBiydaOp62+a
X-Gm-Gg: AYBFou0LSXZFDa1mbf3J7stGUW8B5kx15Qcj+eD1b6F3vkrI75uvUwMsXIapfFfdWRB
	eQwtqPRRKH8Ph7Nbyh0gzcIx2o9ThBLE/Qx88cG7ELGqdYUl8vhI5kfhX+n7HnxT8ZLU6+cewgo
	BXOFMjClHuTj13x7RdBDA6A6Uq/Fsx5TXYRq87A/TKhQr//wIBfmZONJshGKKEZwF0xtc7slfF+
	6jXe4qAusGCMyhM0QNT1Edw6TLWQbEhpd3ueRb0vjOEToyT94zJCycl/rZtkrHB7VtvoNDSDZAW
	ktZ58VXI2HuVKDgTLs0K+6WXPYeMM3Y+TiffsD6iwGjEsGWcF+O1sHkTSysk0L08Y3aZ0nDaxdQ
	hKQGgi64wRS4gyPDNXrtVLfT7aeEZFb8WpiGyXPwc+lIXW3USyvYZkSXOtTPaxkt8Eu8pKo5Jod
	1i2mAVQg471X7cx3qdQL9TWjPaEnBKOk+sGuUvDSolXqPvaZQov/q7oChlRQLEVtGReQXTuzR1g
	TMG99wzww9hF2zXkz24NfwrSg==
X-Received: by 2002:a05:600c:3490:b0:4a0:1b14:e845 with SMTP id 5b1f17b1804b1-4a0274d1600mr11350325e9.2.1790884732686;
        Thu, 01 Oct 2026 12:58:52 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.112.15.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0276f92d9sm15031045e9.4.2026.10.01.12.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 12:58:52 -0700 (PDT)
From: =?UTF-8?q?M=C3=A0xim=20Pedraza=20Padilla?= <maximpedraza@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Francesco Valla <francesco@valla.it>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-embedded@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC v4 01/13] drm/clients: Kconfig: indent DRM_CLIENT_DEFAULT with tabs
Date: Thu,  1 Oct 2026 21:58:35 +0200
Message-Id: <20261001195847.141192-2-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261001195847.141192-1-maximpedraza@gmail.com>
References: <20261001195847.141192-1-maximpedraza@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The body of DRM_CLIENT_DEFAULT is indented with spaces, unlike every
other entry in the file. Use tabs, so that the next client added to the
list does not have to pick one or the other.

No functional change.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Màxim Pedraza Padilla <maximpedraza@gmail.com>
---
 drivers/gpu/drm/clients/Kconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/clients/Kconfig b/drivers/gpu/drm/clients/Kconfig
index 6096c623d9d5..8d8bc37ec9f2 100644
--- a/drivers/gpu/drm/clients/Kconfig
+++ b/drivers/gpu/drm/clients/Kconfig
@@ -114,10 +114,10 @@ config DRM_CLIENT_DEFAULT_LOG
 endchoice
 
 config DRM_CLIENT_DEFAULT
-       string
-       depends on DRM_CLIENT
-       default "fbdev" if DRM_CLIENT_DEFAULT_FBDEV
-       default "log" if DRM_CLIENT_DEFAULT_LOG
-       default ""
+	string
+	depends on DRM_CLIENT
+	default "fbdev" if DRM_CLIENT_DEFAULT_FBDEV
+	default "log" if DRM_CLIENT_DEFAULT_LOG
+	default ""
 
 endmenu
-- 
2.39.5

