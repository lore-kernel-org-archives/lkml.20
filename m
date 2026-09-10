Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D13D48A8A4
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045101; cv=none; b=QGjyKWxWUEl0fYNTKy1WSIWnA/AGrOYsMvSvfd6dNOkyyc7ADk0w/8JnoIVt29y9WZYI7ctPLtI/OBnznI5vvJhbLr9KHGDnGMkPKkT90u+7LUa0C3JqG7x9rfvawqyJx+iWUOtdhfH1H1/8nVLqoty2QbdYX7vEm/9Qbu3JGAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045101; c=relaxed/simple;
	bh=eDB4A6Lwo/gDz5Acpsb0IJtqQRbTmROpMeCy9cYBs8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hCZCodIMepz40t7mj9SZ4iWJ4N6/1krevTcAEao/Ue2mlSjqePbwqvybjYlrd7dpfaeHT7XqZHWhfV//RcZPJg2oZ7q57xQAEUjLPUsGi9xYKTM85n38+XdbyPXT9Kssx9YEV79x7KpM0KYXBtCkN2IAm35jQ9HaWJTQ6WayPNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b42YW58x; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b42YW58x"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-39b9a99469fso2927706a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 05:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045099; x=1789649899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bKdmUJYxYgq8tpbG7VT9pIxvv5zd6VcFqq2QVmbg6wI=;
        b=b42YW58x+HwpXj9HrjuINZrpfkM7gk+mWkUTLKKyibsb/LfTGZyvZBYilVGWBhzwuf
         CeBxxlAjyx53aVTQlfXHPMcRUzrQdu+KZTIkNh98Lb3dMFgIrmlht+apgpRpu9I6dwtB
         U3xTJaHblh4iJGZSgVkIAMRvNHF7JEMdSYz2g1GFYwu1SDuMIl9B5x5zIslNePNk7x14
         cfbj6w0MM7DOV3K0GY47oHmHJrPT0NmFj3aF7zxprKMPhGRK7RuqYZSqyYkNHI9i7Bm6
         +EKZQsNumdOhwNhu+1PpOinO0Phs9YeD4AREmkPLE55Ufg7jeeCRUor5qlGH2rafRk/8
         IY+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045099; x=1789649899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bKdmUJYxYgq8tpbG7VT9pIxvv5zd6VcFqq2QVmbg6wI=;
        b=qXw+fBhaXQyj/PpMgPf+/ru2MThyQUoKEXpkNr69TO++w1U/kLOMAOIQnVRboq+kzT
         9BhcVhxB1gOROYdFPh71kCocHsCwSoHp9psRSFqdtgwcGnD8VLSxQkFI0HuC+EAzoPjQ
         Yl8h+cwT3jAvUCg1sZ7ZlE4fHbS8QKO2fxj0wUmx9PIov35BFDu4PcrnOnaDKL2afeUW
         xhzWyOjj/OgcjDx7sqahTt4Fd/MvcENnNp15hervpOv+ANouHJwo8/yyCfzew1Kqe3XR
         TwJHhMndLjw5QA4zBDs9+p/UJr+8RBVXITItWGQBTqtDYtWZUmQ03HiOHivPkw6DfqN+
         XJRA==
X-Forwarded-Encrypted: i=1; AKwUvBxZ4MNT4N7sl97m7g2tWMl0bCdSX8wi10vQVppgv0DTJASc7MJwHsST1CA/tQrCeLEMy1f49Rr6+meU2f4=@vger.kernel.org
X-Gm-Message-State: AFuF++m+euKwT/9tsruO7AM0w2hmQxE/YYZ+wBbFXTWjYwieazSLzPPK
	DFcjrs9mLyfhdYh2K/Myvu6+ETyiSw4sCYkPjIWIPhhFT/v13q25NEhu
X-Gm-Gg: AYBFou3Feu9Lw/yMgNaTLRcdoBZKl0vnnYjDalme1YfrMAgol7F5bkAX2sPseONsfVG
	iksEeQdxI20/MGr3ZpGlhLBRbNxVWT+izEoI8btXJpMDDbsjHE+vJ7gLSPdEZEGtoeI72wspiqR
	N/kQpXphDFAJTfH4raGLMVPFm0JyNQlk0cT/phqjBOL+INrmJOljHCuqN5jESgDD9fbuoBKlSQj
	10WyORUUXJDYi9L/XazUeUMBQc93MMcDj/W0TSSWdVurAj0IqvSNCglrfYB+4ZOJXNw29RuFf8+
	JPBsqS9YpGjXIewps2lIhtMOihmYjyOAnVbAh9onoK8K7uAe3zPLlEzSNPT93UKOMVDX13OYgr4
	5PWMexKXYPVGXbi8IULG2bxvcv1NgMSg70iRAEsU6iYcw9jUnDTuVfAu2G0y58b3hWeBL0PrrKC
	bWiL+rr+ZGqugaliNU3p9JcwU9SPx3VjlSalo2OKaCjHUuMuej8RHrOT/hOyBfIWGyX04v1ZjKG
	7IDfoZc838R+5/N4X7H9gzsY1hnkryVLWMRZB41PPDXqHYl/ekBydAq7tUTTqmqtfswA+oTvQ0M
	Fz3iJ3iRmgAX8vA=
X-Received: by 2002:a17:90a:fc47:b0:398:9c0c:7c72 with SMTP id 98e67ed59e1d1-39b2627fe24mr58655781a91.25.1789045099266;
        Thu, 10 Sep 2026 05:58:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:58:18 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 04/13] ASoC: mediatek: mt8189: Validate MCK ID
Date: Thu, 10 Sep 2026 19:57:33 +0700
Message-ID: <20260910125742.150902-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910125742.150902-1-phucduc.bui@gmail.com>
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

mt8189_mck_disable() only checks for negative MCK IDs.
Reject IDs outside the valid MCK range as well.

Fixes: dc637ffeed6c ("ASoC: mediatek: mt8189: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index 933179f2a5ba..88f15a9c2513 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -675,8 +675,8 @@ int mt8189_mck_disable(struct mtk_base_afe *afe, int mck_id)
 
 	dev_dbg(afe->dev, "mck_id: %d.\n", mck_id);
 
-	if (mck_id < 0) {
-		dev_err(afe->dev, "mck_id = %d < 0\n", mck_id);
+	if (mck_id >= MT8189_MCK_NUM || mck_id < 0) {
+		dev_err(afe->dev, "mck_id = %d\n", mck_id);
 		return -EINVAL;
 	}
 
-- 
2.43.0

