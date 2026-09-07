Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6533AD51C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788771244; cv=none; b=VAN5oOiOIt8aA5MXzF+0d/WJebDsi5BgbF9fCT++Uby3xTVlpxxrsFTypEv/1EFn8Wm31zuEuYDsUww5Y/lfVbF86Xzo70mOV0Y8ZK3zT7m7sXZP0/x3b3q0nbFZWcjvb00K+QOxdO8L5IlM5vHddIDRmUKlhfbVb3yuAUrXQNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788771244; c=relaxed/simple;
	bh=T6jPsbPIyqALI9NXr5wJckEJ9ruwlbMarPcMN3a0lwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BULw+3tx3JEFPKGMiamQtBSzU+GEyP7FndSB3CmJYNgHuN7a+s9S6pOBPapht4EunpDi5j7+gs89wLVUahrQFlBdvltn48QCwRksSDOxAlAxNdgGjVbtyFXNFGmkO3kp9L5HwAxZcFVp4e8Xk71iKF8spjNBd+sg/mqehinWGf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qYXSDory; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qYXSDory"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4843f205a5bso1845273f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788771240; x=1789376040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xKjRQq+ijBRhac/KlHOQ6qKwFk2CUXwuQOECe/rqC+Y=;
        b=qYXSDory8vUVHGO7H9WArfmKJ/shitcRd73TtwHPOdqglPztH+GdoZUXbL4i8vONLN
         j2W5FucCwf0Ek2glggr5hhrPU93nOK0dIwECTR2rycHFD0cMdw2faoaq+Zj6VXu+BC1x
         8wb0zUwBS53XA+2iTLDaTbMaPKjBoaxmusUPxm+4bXUKwtqFnOr0a9bJPDG67aFEbZFL
         5u6RzC8zVdpZKNpDYOEQdXl7FhrxIctkuXcFcurIUO803qJ2/BzcHZTjHw0RJtPdUWwq
         /KndWAFcLG8jjckk5quf5lA4getHgaTeidDg8ZKnD+dJybidpStVmpazExxjOpmshKlq
         luUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788771240; x=1789376040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xKjRQq+ijBRhac/KlHOQ6qKwFk2CUXwuQOECe/rqC+Y=;
        b=b2euSZN+W3eT4ukDdmXc9VuUYrTWrAUNGQWjKOstG85ZN/rZb6JfhSevoCMmKKfE2B
         QWjawZM9sXwFbEUW3tiZBVRhPLjbF/gFPylbcoH11sL4mdj9Rx9huu1NokxuTszYpdTM
         Bylb8fxdYvvSWYjtlJIkpwcO85U9ibmOIQPaxEMNcDnmGI367mXorRP7ij39pF+hvb5t
         7McvcDVboCtxYY8QzaEvmQRp+b8CghzbUncrssi7VOsZwsBgGh9DLjvMWjqen/zNn9gc
         ohfHTSgtt5taOLf3Ul/sD3uXTdaECsQk4/yukjU+RgGj2VtN7T0He4Xf5VYi9tmjFHNh
         kSFg==
X-Forwarded-Encrypted: i=1; AKwUvBxRn6wZAl/ygehKq1D+XsrOhHpX0zlOXWoiO885+IXhd0pHRKunTdfcclghfmigqUYT/Y01bCJkn8COHx4=@vger.kernel.org
X-Gm-Message-State: AFuF++mn1Ct+VtUqkGeF8DcHZv9zbUa5v3nvWiKdWnqcKw3lEomYlA9C
	FWKffXUkz/OdasjEw2McOu89mVJ5Sp5YhcppeKWB7+KQZHeYvIEl2UFL
X-Gm-Gg: AYBFou3U2Xxih7hX969dq2fuqP6nMPX1f37o56wSgacZuInv0FLds3EMSLGKVOD+Toh
	LI+ra7viDMogSUThCVDiiZgNoH3BVJwfK3/TKy/JpmZU4vaEQeHHJc4Itda3xA53VdDGDLywTha
	ENmizykuCzii42J5wBp/FXDnupK4YlMjbBOD1Gc9TNJLRPxjU3350izX8pWcGZoeCELB1cbqn70
	P32tdeXxvUOljDnz774+MEA7QP1vgX2RVXNpyvnCfaMpdK8gygY4tOfH6zs33KFLFuRye5t0h9y
	tyIlc6Z3pe8eIxhPmqLnY+7cAj4cwVIDTaYXiSQ1auryWtyvv+Vberso+Gjcz5Ri0Lb9Mo3Nnse
	aveTLVAqUsPcQSVRMHrKCx0lQ9tC5/DZD5Wnbs/BUFqUVLWFxn+YJnbr/Vxv2oSKdnE1t5rmEcm
	ezmolZHB/trOeuewDvos2demuo48QaA0MIo+4orit3brEskDnkClOU8NiUKl0oJCBfd3u2AuQwh
	wCsskFy7yh+
X-Received: by 2002:a5d:5c82:0:b0:485:8a46:b3b5 with SMTP id ffacd0b85a97d-4858a46b479mr20151350f8f.29.1788771240203;
        Mon, 07 Sep 2026 01:54:00 -0700 (PDT)
Received: from localhost.localdomain ([165.51.77.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d2693e8sm25746158f8f.3.2026.09.07.01.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:53:59 -0700 (PDT)
From: Salah Triki <salah.triki@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Salah Triki <salah.triki@gmail.com>
Subject: [PATCH] iio: temperature: tsys02d: Fix state desynchronization on resolution write error
Date: Mon,  7 Sep 2026 09:53:53 +0100
Message-ID: <20260907085353.54477-1-salah.triki@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In tsys02d_write_raw(), dev_data->res_index is updated before checking
the return value of ms_sensors_write_resolution(). If the hardware I2C
write operation fails, dev_data->res_index remains updated with the
new index despite the physical sensor remaining in its previous state.

This leads to a state desynchronization where subsequent reads via
tsys02d_read_raw() return an incorrect sampling frequency.

Fix this by performing the I2C write first and updating dev_data->res_index
only if ms_sensors_write_resolution() succeeds.

Fixes: 53bf4d067d51 ("Add tsys02d meas-spec driver support")
Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
 drivers/iio/temperature/tsys02d.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/temperature/tsys02d.c b/drivers/iio/temperature/tsys02d.c
index 3ef72347456e..f50426beacdd 100644
--- a/drivers/iio/temperature/tsys02d.c
+++ b/drivers/iio/temperature/tsys02d.c
@@ -73,8 +73,9 @@ static int tsys02d_write_raw(struct iio_dev *indio_dev,
 		if (i < 0)
 			return -EINVAL;
 		mutex_lock(&dev_data->lock);
-		dev_data->res_index = i;
 		ret = ms_sensors_write_resolution(dev_data, i);
+		if (!ret)
+			dev_data->res_index = i;
 		mutex_unlock(&dev_data->lock);
 
 		return ret;
-- 
2.43.0

