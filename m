Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F318383333
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790045315; cv=none; b=hJBvbvXQbqmT5YeC2SV5euTBJ/hkK3fVJ0lmJDzxQMTeThpSI9ytucKrtNcT2naYc6qVv9QTWQRdsjgmvQWBxAGZwTB0kwp682q1T3KdGdG6VkrmgnD4ypXzRRUyAAZ4dHVFY+WWD6ZPLtdKrzY7Wb8uIoiPVck48bdUIY7EwpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790045315; c=relaxed/simple;
	bh=vvm8Ml9q1Tf4TVKcptL0B8794cZemUp57P1StvY2U7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TUuTYIgDmjLyYDSUGVV+15EBdgHzW/bnCp0ReS/y55RNnofJU0c1LCB6e2lE4D5V+/PWIsQzZ6T8mKBBXmvfWojWD0q8Gx1kBrWfHG6D1wR6MUT/LTLr5bWPycJ3/5Q8yF7g189b96tWxtCd0dd3KZHCCFXYGfaELKJCWXtYnUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eJpWcoYr; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eJpWcoYr"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469d249c4so3240598b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790045311; x=1790650111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5WX6Mfh4l0Vw/8UzDpK6UHvwa+BQE0w9TDFZftgIIYk=;
        b=eJpWcoYr2eVCiZ6mOXAfw2vs9peOC+u5k+0YHTIriryDMf8FeAZqar1+S5IjUZwikm
         BDvqTjtlZ1JAfo/ta7I5P60RQc0EKtTPgFtUJIqW6agSSMYGr7gLMH3ItXisYU1dCoZx
         lv7Jzv/PIQIBjF+bdJqurU9/D3fbrAaKQKToesk3V9ePrJaRMwLnxWl0dBuiAog/negb
         qNlaZWzyALeXQLY3r3OOmRVQr7du00gZZ7U56wG2UaxduMWOHRTv59Rhu2DbH0zYDpLe
         +FPTilEDNXJj/nMcQPtj2tTFXKIUraNOz2JvE+ZD8RJtosfGLSHSpw8HgMH+IToSd4tv
         Aj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790045311; x=1790650111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5WX6Mfh4l0Vw/8UzDpK6UHvwa+BQE0w9TDFZftgIIYk=;
        b=ofYHGGvE04g3gNo9ZQKtGcQvdX2Fff1IObNWA9hfJIn8lfjdOymHoDV2upXGgW6jTq
         4Gvdqfv4WuctR1jQJLPYlVrBeBiMb+h7aPtZWRCbfLlY2W3OR0tw+dDmCFAHflABCg0n
         vyi4QHzsvATKeiEOen5m/JBH9MKP5WIYPn2S+en8I9x9jIQRU/mnpT3rLdqMJzmY8Aoa
         uUFSgHgUQqkOZF50SaKj/4hlrfqWMnDOy2i1MCA3MYxVGJOVaLUhhWy2/2IuUvWYNQmO
         oWyQFLi+2rlgDMqND42+2IwOlqR/wdS/OBpSGu1lyeiB3NgTZtzsY1BmrHCFn/7WcaPO
         9pSw==
X-Forwarded-Encrypted: i=1; AKwUvBw8dNGhIryEx6DTiKyz91WvX1/v5ltYjVnH+upQVemVzl04mSrHJml2sEasAEEbNKXq6k40FUNMcDCYa3A=@vger.kernel.org
X-Gm-Message-State: AFuF++nwceS+SIaHZDbQh/P1hRwGZVD4/iDRLgNU90G+QYIwkaIFJ/m6
	/k1lN9L3/gc7wAdL2UEueVp+ljb0Wnag949s0JWAyV6rSRTK9bczTyEl
X-Gm-Gg: AYBFou2iMVK+BTC1Q0TkXTFVShsjnwyM+41YdksjSL20CXyGVsEfDMWI8rP8n1eeaNi
	25N7TKqCBr3M50ha9tJ96t3xjgMeb2FbaR4d2g7XOF02QpmM0fXayXuIt3Rr1WsPi9PGY5Mirf2
	g+ofhVhU9dmb9acTGOZEL8Q0ak0TRatoUMwY8yjUWs/Z0x8GkoluuBqdxwWn9Xx+OUGAbdFYzEd
	Rv3lPUBxd7i8VwnXUqz1/io1b87vWk9kn6BIeuB1Y8eOXiJEozBXOCdJwRSWITqhz6Xu0iRxHIj
	o+OD5cvIZv4+pe33of97oKP14BghxByLLlHchjBX0iC7paJs39TLWX5J+xQFVKMDIbjWQ/nmnR2
	a05b3Ur7fJMDrdE8NCSIi4TkJyMwsuKJv5D7DY4p/7RqCmw80C5TLiz1FpAhZvZTtQE4XkPA3js
	6YdrDmnO3Dc5EriIdCSlDBDv/wdJ+/Ll325Hgiwoc8aeUk1S/m/iKmlpdSLgP2IN65/9B6
X-Received: by 2002:a05:6a00:278d:b0:879:ffd9:126d with SMTP id d2e1a72fcca58-879ffd91ae4mr6025072b3a.15.1790045311312;
        Mon, 21 Sep 2026 19:48:31 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87c336aba96sm112998b3a.61.2026.09.21.19.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 19:48:31 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Damon Ding <damon.ding@rock-chips.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-usb@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [RFC PATCH 3/5] usb: dwc2: Adapt the return value changed for disabled blob
Date: Tue, 22 Sep 2026 10:47:18 +0800
Message-ID: <20260922024724.191412-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922024724.191412-1-inochiama@gmail.com>
References: <20260922024724.191412-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check EOPNOTSUPP for disabled helper function as the change in phy core.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/usb/dwc2/platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index ef0d73077034..62b663ef1504 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -243,7 +243,7 @@ static int dwc2_lowlevel_hw_init(struct dwc2_hsotg *hsotg)
 		ret = PTR_ERR(hsotg->phy);
 		switch (ret) {
 		case -ENODEV:
-		case -ENOSYS:
+		case -EOPNOTSUPP:
 			hsotg->phy = NULL;
 			break;
 		default:
-- 
2.55.0

