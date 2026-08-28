Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECE844781B
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787919058; cv=none; b=BR8fuIBx5CIVVZO2s2ybPov6gM9Z2V3pwQ75RaWijo7/RWUUjNRJMxnphgdpAW5YX4YdWk4tMzu/fIfyrNKJTlZyNIQja4i/fKSV1BAaTEABoXuUJkM9N/5VUxHMJxwN10ViTufxVy+snQz2q36APcJDGbM85UZII1KxB+oVDc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787919058; c=relaxed/simple;
	bh=SQJ2DNwPG3iJstYPtil57ndkIx6hPCFJNfmHqteuqUY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nw9/lCGhtlNg/mCGh0KvNLg7vadvDGNXLhfeOiz5V9+ahZiMvwWyg1/jg2KbELTAAB6h0yxjSxrDCOo4w2LfR9AOerPIf6jkrmY4eeqBZKNh/fRA/zo6JCOnIQ/X4jOeiXqPtI4xaht2BCPCPe4mkEgy4G+qAmk8LhkG6NtIsPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=FP1EFk78; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="FP1EFk78"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493b966dd74so4834775e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787919047; x=1788523847; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l/wCsFq/Zorgy/BqKS/v6a3TdSdfv1vfVKndsRYo1PM=;
        b=FP1EFk78/3Z51xmcrIHa6d71zY3OghizMWEa9k7TsNntDV/5NqAd0udNYAbxUhM6aE
         R4NYRO0W2JrRtYcIJJjD6+QVtd6eF5mdGru7X07/M1OwYBPw2fuD+BHn11lGFbJ2kryh
         lCt1lk5EJ+eDC2MOtyXIMBcZnYwg1aEfhiCR/ubUE+H7Pc+B924GfP7IwKDEs3lOmpzx
         W/6MxYvWaOxw+Rx3bv/z40UrgMhM8wJ4XCrCVOyzqetbeqiKp7g1B97N7vbF4MWjL+87
         lc5zDmSaFS2LtIBSTQTIFgmPHMH7sLdG1pA7mx/j6jLnnqDhEig8D1wZeb9TpvibTRUN
         MC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787919047; x=1788523847;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=l/wCsFq/Zorgy/BqKS/v6a3TdSdfv1vfVKndsRYo1PM=;
        b=mr9CRn0raGwR29906BYY9BgBeV49Ya3SfV44Y4/atfuAHFgwemS+U0IYbTHMXwYuaI
         guy1M1O3gjAuXMdY/8tlBBr/HjySWSS/InYrX9GurwCG61iOB9hfZSkkLkAUW993nO1L
         xebCwqjabx5BrES0SY8M4IHmGmwAU6XKIbWtrdhmvFj0Fj/0HelLKGIkXDfGZLIMSlW6
         e2pSyW75GQt/f705BqTR4v8o3Fo/7kYwvStGVYkziIGN3lg6Snz5eqeajCQIV/30iaqY
         ZYxV6f2RuB5YhON9VYAsHU0wo6W6V6WZK8Jt9IgjpzO/lgOGX0acO2eUSyXu4+PDOJVY
         6j/A==
X-Forwarded-Encrypted: i=1; AHgh+RogvGqseE+ocB+cN8O4OBA2b0tLpv1RdYYF3lqYRBkAaB4eef1D9iy1DkVK3ywpwT3IIungsMXxS3VnP1A=@vger.kernel.org
X-Gm-Message-State: AFuF++n/7tyskqTm7uoVKQ0okrTCm0a+87tbmdPE0HCxkc6qOmu2i8f4
	3tCYlA9iMWeh+7t38tzRhfUdXgXdlVPLy85N6tsPBqHk/1cGk4vH1/wL9fBkOmz4T/g=
X-Gm-Gg: AR+sD114TYYQvfoogpxv5TpbYx2vQbmRC/5y3ffUUnwHxB0oUuSDePWSHA25NUE04vL
	LcuhRbmA2DeYzh+MrwUneP99nYbXekO3udeON/F1iN33+lX5S7QCWtmyABJ1hPa6HJL7hCadGiV
	mdv7v4n3/gwShTHpysOYX08cIfOoGLHhI517s0NV3obsaYDSt2Ra2BGQ3AiFIrAKG+IItRh9Nr2
	Zoaviuyce6Pq8ziGho5C2tEqUc1+taU+kX7pphUn8fRkeZGM4n9csPlhcXftGmwCMyXzsCqwAdn
	T1FdcOL82Jr3dkzozRz9QVISzCbmgyZqOUol64StQDqXbWsQXpM8ATYz376O6KVBXq9GXNvSzxT
	McQ8EawtpfQcPt/qedJJczQZ2CkF9iXz2vb4wrJslWYxZsEWSKIOaTCqKPamUau3NOw+A76ue+F
	/2/67m+Lm3FntVf8WcFFtIuAiQUo0A2Zjnb5rihVt0bpNAnvRRMbUezFAZRFsT2TkFG0gV3qBNg
	grsATsB/JhhG4yDs7S0XhKvpEGCtWxYO9rRVrTqM6pkFWMCCixoWV3iC4HBJ+rvOKmmD8tUX4w6
	JcsdL3H1beJQ/1T5sPxhdNfecykZ5K61x0lvtpZcRnoFow==
X-Received: by 2002:a05:600c:4453:b0:499:8777:ccba with SMTP id 5b1f17b1804b1-49b91c486abmr84183025e9.12.1787919046770;
        Fri, 28 Aug 2026 05:10:46 -0700 (PDT)
Received: from [192.168.1.100] (2a02-842a-d52e-6101-6f8f-5617-c4b6-8627.rev.sfr.net. [2a02:842a:d52e:6101:6f8f:5617:c4b6:8627])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b494228bfsm125368175e9.2.2026.08.28.05.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 05:10:46 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Fri, 28 Aug 2026 14:10:47 +0200
Subject: [PATCH] drm/mediatek: mtk_hdmi_v2: fix VID_DOWNSAMPLE_CONFIG
 register offset
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-mtk-hdmi-v2-fix-register-offset-v1-1-118ad5d7ebe3@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNUQrCMBCE4auUfXahjaDRq4gPMZm0q7SV3ViE0
 rsb9fGD4Z+VDCowOjcrKRYxmaeKbtdQHMLUgyVVk2vdofXO81gePKRReHGc5c2KXqxAec7ZUNg
 fTyHHvY8hdVQrT0Wd/R4u17/tdbsjlm+Wtu0D+/pwJoMAAAA=
X-Change-ID: 20260828-mtk-hdmi-v2-fix-register-offset-879afc38cad1
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 CK Hu <ck.hu@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Tommy Chen <tommyyl.chen@mediatek.com>, 
 Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.15.2

According to the datasheet, VID_DOWNSAMPLE_CONFIG is at offset 0x8f0;
0x8d0 is the VID_CSC_COEFF_0 register.

Fixes: 8d0f79886273 ("drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT8188")
Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h b/drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h
index 521b35c7e14d..bf3ebf5492d1 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h
@@ -173,7 +173,7 @@
 #define  TPI_AUDIO_LOOKUP_EN		BIT(2)
 
 /* Video downsampling configuration */
-#define VID_DOWNSAMPLE_CONFIG		0x8d0
+#define VID_DOWNSAMPLE_CONFIG		0x8f0
 #define  C444_C422_CONFIG_ENABLE	BIT(0)
 #define  C422_C420_CONFIG_ENABLE	BIT(4)
 #define  C422_C420_CONFIG_BYPASS	BIT(5)

---
base-commit: 1b78070aaef63512688aebfbc82365ef9d6660f1
change-id: 20260828-mtk-hdmi-v2-fix-register-offset-879afc38cad1

Best regards,
--  
Julien Stephan <jstephan@baylibre.com>

