Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BB93BE175
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788537100; cv=none; b=Sk6cHsMblR6EYeR63+4H3Ww8KL543+Zeuzy5Wjz6T0w/ABZwUmMVdKSUSF9dPdjERqgqIcTbnTgJ27J8TUNGTpE6FltDAHoAoxn/J2q/GzpBo+cpw16S2VodkL1TylRqBNEpA91mft17TaOidXZ1lz2Rq67mSei+dshiqf9rA+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788537100; c=relaxed/simple;
	bh=fC8E2y6Z5Q/OrCnge+02KY1tB0zJIUqzvl0v1HTFuJY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=O6vXLmYcGAU/pC4B2phcwZ/SKm5OwFLEoTUBW2sXv45UKCaSbJPkyvWdUie0baXC2+z5Zok/JWn2rmDFuHlQip17twwNRxJKpXAKDSeKVJE7XS0GMx0s9P5QZCCF7s9SvORgk+1ger7CX/9hJVUsueizqByjv0qhXOE4kh2RUrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dqiPsZdN; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dqiPsZdN"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so883093a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788537098; x=1789141898; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1wI7K97Z7sffgIc6844mzrHNbwJsm2GeFEd77pMsddk=;
        b=dqiPsZdNo9wN9qhzSDWkPqqEshJaT0lw/MlfwA8xtLa1jF8/L1CQgItPLmf0d/bwJi
         5mOVx2dwCGGHC+6mdlKcFH1g1zTRZjM90h/oL30jfO5Zt8TLlUwsdiv6tMoq5lb2dUbO
         DHb3JCGvAv30t0CGMID2L3/kBI9ljzWN/ze7ndQDtHLj/OCbGpelxp0n1PHxjuXOqKny
         3H+to5LsKRS/Qkuf56feqcPTvDXR0KxGWFgRxyu18qM3JmGqJ2BOCDvU1vee0DNpJwcY
         X6N/HlvF+bv36et5VJtmglxPy1C2SkdQGOJGUISXY66RL1LhOoYTvecjfxO96yhkf4mY
         kNYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788537098; x=1789141898;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1wI7K97Z7sffgIc6844mzrHNbwJsm2GeFEd77pMsddk=;
        b=iTqtwoZp+e3pYBGxh/GMoA5FpE4dviSk6JEaFNpqwlqWUEWqVP32ovpyjxws0QZxba
         Hga3Np4T0FI//lBiSpsAkrYgQSclM8HFAY6gFBwjCgKQ/oqfdOKo1qQsO+vs/jWNauKF
         TIBC13V3lbJ3LBTQzLPD8kbDML/vEhYkoQcqB+DDXkXfJ1gK+C6xluNK67oT8aeMfnlY
         SoKtKmC+agHAIni+yB0fZnWMAJQvtP1pvCOd6RWJ4IWhV+/pwt6K8AaflUh6z9Jr2lJ4
         g873+6pjFD4SHaLjBeSdqM1Oho8acj4DIP6F4BYk9y/5YC86WVEjQmKyuGzxuT3y/gIz
         IBeA==
X-Forwarded-Encrypted: i=1; AKwUvByUbWZgiFPCaGPhw96oBxDo1fJicPSjVDFsTHgrw+mkLd1CUXpue599NfVG9KG5l4fKvbX3p5WKLQSzgrA=@vger.kernel.org
X-Gm-Message-State: AFuF++mHjrm+tRmNWOme4BTKftzGwqyfg5iwFL9oCOgv1y2kRqKNyw2S
	vK2pToxdEy2uYsfeQbh8FlwzU5Tgr1ohUOfM86VRSyvfAX8knucz7YUK
X-Gm-Gg: AYBFou1LCCMdahMQuvvX4y4iNjYyxxZL+3YoswYOcnGkxOGGPpccSCChEp0ni6ktACf
	dli3LUDjPPUQsKaXS3n6LG1y3Ne1lJA/GgLe5A+mgQywdmx8oifozl9Pp04uwTmyugMYyV9PS2b
	3k+IpNsGXbKJ4aEQFEjqKUV5AyEEuhhxJGAokp69V6ABgbEIpn3VPkUmnPAwdJmR+GGx92zXviB
	ZF+VhoaRu4eEjXN43uGDvE//jBO8XGBfhTjpmyxh0mOhBQZndyY7t2xhr8VtPnO/UyTRwTp/ScA
	dJKqzEAsC2BOWQE2x0gHdsKCppI41nmlCzY5tfrnTKXpgKCrklAZnL85qgN9pGxssI3f7SNHMRF
	In80oVqMzhLxO36b0YEwAmUshCc1FUk94gpCMmUQYm5iv0BTSt+usnQcrcBK/yj63JDPI2d9R+q
	hs0PyrcQoKoDydFtXpH30UYe+NdrEttcxB6U/kdixnXmu2vxKCASwDPTFeVO0VmvLJKrTKgk6Mk
	W0zW2eWpkTTCJwhd+V4USjm9e7skc3DrhmR5Da8+9QytWDzSY2lCWSJ
X-Received: by 2002:a17:90b:2749:b0:398:d292:e6d5 with SMTP id 98e67ed59e1d1-39b26304385mr11311044a91.24.1788537097799;
        Fri, 04 Sep 2026 08:51:37 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.74])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b083e4fafsm11390320a91.1.2026.09.04.08.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 08:51:37 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Fri, 04 Sep 2026 23:51:29 +0800
Subject: [PATCH] spi: mtk-nor: fix runtime PM usage count leak in probe
 error path
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-mtk-nor-v1-1-cefdca098f83@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QpAMBTG8VfRubY6pDVeRS6YMw4ZbSMl7264/
 NX/+y7w5Jg8VMkFjg72vNqILE1Aj60dSHAfDTnmEkssxBJmYVcnENGYUndKSQOx3hwZPr+nuvn
 t924iHd453PcDww0MN2sAAAA=
X-Change-ID: 20260904-mtk-nor-000ff9cb886f
To: Mark Brown <broonie@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ikjoon Jang <ikjn@chromium.org>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788537093; l=1008;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=fC8E2y6Z5Q/OrCnge+02KY1tB0zJIUqzvl0v1HTFuJY=;
 b=Hjljg0NeZLG5gJIKscFNfsTfPBNzmXNZzZZdjt+VFCksVrkMrlsQ8WNQBjn0I6eayViNdBFXR
 nC28js6qxURAaeHZi6f0vbvRDNT3CXLfJnL8bkidZcn+YRJwCce1Rff
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

mtk_nor_probe() takes a runtime PM reference with
pm_runtime_get_noresume() before registering the controller, but the
error path never drops it.

Balance the get with pm_runtime_put_noidle() in the error path.

Fixes: 3bfd9103c7af ("spi: spi-mtk-nor: Add power management support")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/spi/spi-mtk-nor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
index 63f5139176c8..6b6e55d68048 100644
--- a/drivers/spi/spi-mtk-nor.c
+++ b/drivers/spi/spi-mtk-nor.c
@@ -929,6 +929,7 @@ static int mtk_nor_probe(struct platform_device *pdev)
 	return 0;
 
 err_probe:
+	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);

---
base-commit: 9d80aa4617b32f5054c5aa471d06b66704854935
change-id: 20260904-mtk-nor-000ff9cb886f

Best regards,
--  
Felix Gu <ustc.gu@gmail.com>

