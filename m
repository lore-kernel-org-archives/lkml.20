Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7934A0902
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 12:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788612283; cv=none; b=lybIY8y67Au3J0GkDjtUqadpCh6K8ehKYnPaYwsOs8/TVhd85xGqa0Rq8TpQ7mvD2/1/bhjA7l0ADjABV21kSDL3/UNOOErxQwfVjAsTpq6yMhlqflN0K4uk4SWpSh6XD3E8KwQDJQA/Hyjz2u7EdtxUdBdakDUqw/MdvvuhOcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788612283; c=relaxed/simple;
	bh=6f5p//qeeEhJiLT6hla2lNz47zEGEWS2WmSvXXHcHig=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OVHkC3BDCV9b1zlT8XCcJ+wMwMoV5Mh4Zcfoc7USwgdBB13IRNmwIKmBR2ynFOfUmCkc0Qr4sQELNKJsd6WzPizMNCuhcIbfMr95uLIy99NN9RUpcu5VBcg6ZD621Utdkmv90ZwjogEYyjz6bz4hqkzpkhVhy1YKtmxB98xj450=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jzBSFuhs; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jzBSFuhs"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cace91f112so16487665ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 05:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788612280; x=1789217080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sCkeW/rlDEZbQRwhNQlqYVSLXnulFlxF+aDVtk4kLrI=;
        b=jzBSFuhsbkrPCo505JQz3G+xdlugkLc+IBPvSy0XsIfFSJd/c8mRnEylKYpvF/ZV+K
         iQUQvk2s2tPlR5qay3SW81SyUF3LUWrPBD3BL+8kQzuMGyi+PCzUPb2ziwy44odAhWxJ
         KTAOHC2ufuge6vYiRCOS/R/oyBcXjCrVSqvelyemGLd9ZIkupmKYvwNzB5GYnZNZPujQ
         Hjn7VrXRaVdL0DKmXwRFpiet0mtZDoEHvKcaCOFkF1M4dpc5T65ijaEJtaFuAXazWNgX
         EnDpoQPToYSNlZENI5dBX7MQGfVkGX5FExIrLz0LfI9EpCnPlAHcMuO4m31CgfjJ6jSx
         hELg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788612280; x=1789217080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sCkeW/rlDEZbQRwhNQlqYVSLXnulFlxF+aDVtk4kLrI=;
        b=JWNxLh9HRj22WtaOlYTdDLhBOtfaiY7p26hiGqQOVW7lLLprtY3pyZJcT1x+ty+wcm
         PD8jz79xuqY91Z1wCoUJVJzq99V6a60vYxbM3HcIz0M1+9f8SC0M1Lzm2QC9AMAeNZjk
         MQzkn7zdrTwt8apO/SKU1n4L/VfiHZfrLsQ0o8GT0Kz7jBkPEk00f8rFS5Bsrmkwk/LV
         Ig64zpsQTRq8a0fmeRQJlQelGHFtvSN98x7IrFfhbpYguKKGsiC7BcbM+RWJFcOK0R39
         35FYu+GfyaExGXOuK5y/vy0vyDmcNOSDZNR+jAu+Eg+ip+eCCzh+m29U43vVXlExWq3H
         8O9Q==
X-Forwarded-Encrypted: i=1; AKwUvBwHzBnsgGjYB36BwKeN6XxuOcNJN9Tly/EMcZ5qIY4LeBBGQdxZlYb6SB1DKCUPnjTzDwuNSC3rSDDjPaE=@vger.kernel.org
X-Gm-Message-State: AFuF++n6PefW+R7yoZvbtZQ8Mln2PTMJvhLjEMhAkW40PTTBqMIEyiS4
	4hNIu60e/Nuhj2nVaD749W+HAWASqkPLEF/qXJhXPFAKCn16iyc+y2or
X-Gm-Gg: AYBFou2MViZDN6ZA8ojDioiObBHeGkx3pybrd+aK8lh36bC+gu51huid4EYYqiKXidn
	d9QWyFvwJax7xihbzXXRse+8/646VuywWN0FyLm2CiJ5zg5Gp1gOqIJVVGa1qLHq/7nXFldQmXM
	vv2rSQFnuhvhc9+NlOMBD2gbYVNe2u/3+1EVsuFbtxaOYVkGxp31dYicKVIFW/41vBcPcIjMG/4
	CFFPJMmw2VHgxYOvT5qEEyFQ3FPGegz/XIIUm+ZfkGCWdtC6A5TzBG3VX1rNsNyEH6Qvr3eYt3/
	h8A41biSBrrDcodXgglr7Nhmhs/lOMjDbD+ipX4Gw4XjmUsL+0b9k0gvBN6wj5zFeODAd2q5jZQ
	OaPjc6E1iVPi2Kf8yEs2KEl8yVIITDg+JFBWotevauLgXjt6FebM5HxXjV/6zB0mrARjG3oD5vD
	MufnXK8fTkHHDbdseSK/7s9mIsBl+W4AnKCQEepRIYtahZ/AqIa7zYg0X7e2ObFye5fCfmoqkqX
	jHZAVl3d/K6QhLEDB1fku5NUeeOui6O
X-Received: by 2002:a17:902:e805:b0:2db:3b35:1ac6 with SMTP id d9443c01a7336-2db3b351c2emr5928535ad.5.1788612279984;
        Sat, 05 Sep 2026 05:44:39 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3346ea43377sm11740417eec.3.2026.09.05.05.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 05:44:39 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: gregkh@linuxfoundation.org
Cc: torvalds@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux-clk@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH v7 1/3] interconnect: mediatek: fix Makefile typo for mt8196
Date: Sat,  5 Sep 2026 09:44:32 -0300
Message-ID: <20260905124434.6163-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct a copy-paste typo in the MediaTek interconnect Makefile that
mapped mt8196.o to CONFIG_INTERCONNECT_MTK_MT8195 instead of MT8196.

Assisted-by: OpenCode AI
Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/interconnect/mediatek/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/interconnect/mediatek/Makefile b/drivers/interconnect/mediatek/Makefile
index 6bd656668..64170ab16 100644
--- a/drivers/interconnect/mediatek/Makefile
+++ b/drivers/interconnect/mediatek/Makefile
@@ -3,4 +3,4 @@
 obj-$(CONFIG_INTERCONNECT_MTK_DVFSRC_EMI) += icc-emi.o
 obj-$(CONFIG_INTERCONNECT_MTK_MT8183) += mt8183.o
 obj-$(CONFIG_INTERCONNECT_MTK_MT8195) += mt8195.o
-obj-$(CONFIG_INTERCONNECT_MTK_MT8195) += mt8196.o
+obj-$(CONFIG_INTERCONNECT_MTK_MT8196) += mt8196.o
-- 
2.43.0

