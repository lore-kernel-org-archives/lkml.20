Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EDD36495D
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789971898; cv=none; b=EIsDGJzHm/0c7SMiiKhC5EyKDO/AjhFMkc5lcnw06j4dengUlwffYZkvGOUe3z5Ge0B8XHsQw5vIZ6bVTZGz/1I59SZnVrkNvcJUB0Lu0TskpIwwwIkocGEEQqNZiKvqaDhN4zVj/ScnXXAzJroTHJUUWi6SU5OnBMI8g1I9paY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789971898; c=relaxed/simple;
	bh=pA549//OYM7fyJIc7yxSbMcyjzH13X8kC3Rw7VmSaNM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mb0vMp/sRrg+UPo2hLvWOAj05L30DG8w74YvR9unKw2MkuqFYDdKUlgDX4DIZvLBag2OTx4jYYtmecef71pvEpOYYhGysQn8ObNFyFdZU/lbBfneq1TfXnMGaIcdVok/BZE80wja0RPjuYbbPlYi9u8jTZV6TjD1JL3tI2tThjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jnTBVffg; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jnTBVffg"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469a3490bso2743153b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 23:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789971897; x=1790576697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AJ/GHRkp98XLTockNWA7TYk+PmU+zv6J0kw1z2p9qwE=;
        b=jnTBVffgHqBZ/BoaQr/dBO5sR2a3IJRsZIIzh+KqeVFwl9/JlkJpAJG2zVFcSwDJA6
         zZjCZPCzdHspLtLZyPO9bAGSEC3fUpDahXZ/Hny3BrxPqgK1sxqEF/wFHIjJlfQ1pUB7
         5ZjowWh2Q5t/hFQOmxYkOXe3P8U+zvg0RMCrx5y7hsg1PRBIUbiOTkwEZo4eNSKiXsux
         3iAF/pwYF1Hy1iwOb/VxndYAHeKKEOX1N+KdCK60Xugt30yVtbG+z8GCYdhz7orolGFZ
         n5mFuXMC8t82ulLzmyN2n+ujl8TzdawfX7/F+Unq3NVjrlku8vOtGwkyn9KGLbIXCDb9
         ey3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789971897; x=1790576697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AJ/GHRkp98XLTockNWA7TYk+PmU+zv6J0kw1z2p9qwE=;
        b=mH1ALSClaN1l6JcSTe8x7LH9WRQhTKcbHGzllNUIWkaUa6L3cYlWhky/TdKWygOmGY
         97gizqUnCoFz5XnRRnKEZad/G4FM30WV63jdukz6WEECfwlLmz09o4pwViFSbpw8R5PN
         S03ftBg0cpLHsJ0C9kiJd2i3dyOVI7rTdHEt1VrDJEaw5R7FVEO7TmZptMr60WqYOn3U
         59ZD8RZJ7NWTalOoswOpUJVUR8ei5qiT2G48jQuTt+9DF6aOBMJY/Vo9h54tb8zIEaIr
         eEu7ISxtMOp6gaWwpQhd6bYWkZLWJqZyNYMyj+U62CeSCiRy+NE5jsIMPut0JqDTDwdl
         c4Dw==
X-Forwarded-Encrypted: i=1; AKwUvBxjIADiaXdv3pJbDRuaXrAN9nCcxkVmn7I3PNvvK66Zzdrg7/41QP710LIwrU4ZNndJdnEUfPq9vp+ePCQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nw2faHpP+dDoATkVBdWPIWeWjYJD1pySOGdBKlkJIJhDJUxRzi
	5hLjlga+XQUs8ZFFnVORuErPcNOcNHxVW4MWhRtzdQjbo1vUC1yeUvex
X-Gm-Gg: AYBFou1c+YXeuHBxmydz49j6mon+BTtbsgpUN1jEYYZC8PBgYifpPfLUVBu6tnKbqQt
	Nb5Bo/AL7uy7hW2RxGFcAM+yy1YUQrGvLG8adaEdbRPRBtgGW2PiwAxsCKrv6vSDmtNGE8CHy3P
	0pimYmEuPCTvbDFqtJHNZkhajHcxyH1EvD9a0OJq5bXN3o8nUTMq10OSE1wunZsQtFW01iGR7OD
	qklVYMxzbUeNBGBbtwPri41l68qSMnvNBSlo1HNbF3XxarxpYPShcuFo3lQKEr4aUIR4oKLCh/+
	wNax0LQH979cjb08RYQ4gvY2vVzlLbDv4ObPt1g3o1mzSgDg37F94noNl4lh+UeaJTsM+tW7ttl
	ksuzb+7cmR5GDGzwH5YcMCapN+KfvmXPZPwpxxihrz+50eE5dtogmeVgoHTkeP2SzaBVmF87OJE
	RupOAUkwYgF/eRQ/jhTZR2IuWz1Pe+cW661mYiyvubyDPX/8TfY9A0Ih/MRW6B/tQMDBPHY96Ka
	8IFPNYHEKAbd55Micr4MfpStoxFjtN7hiDSdUB19ErfxWXDZkXL/SxEwxMYvNKlVjvjcI4+Veqa
	dc8nxOI=
X-Received: by 2002:a05:6a00:f0b:b0:878:34d7:697c with SMTP id d2e1a72fcca58-87834d76ce7mr6330562b3a.42.1789971896493;
        Sun, 20 Sep 2026 23:24:56 -0700 (PDT)
Received: from DESKTOP-G3E0OSP.localdomain ([58.224.60.243])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877aa107908sm2750128b3a.46.2026.09.20.23.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:24:56 -0700 (PDT)
From: Jinseob Kim <kimjinseob88@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] iio: buffer: serialize buffer teardown with mode claims
Date: Mon, 21 Sep 2026 15:24:21 +0900
Message-ID: <20260921062421.64647-1-kimjinseob88@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Buffer-mode claims hold mlock to guarantee that the device remains in
buffer mode until the claim is released. Normal buffer updates take
info_exist_lock followed by mlock in iio_update_buffers().

However, iio_device_unregister() disables and deactivates all buffers
without taking mlock. This can invalidate buffer state, including
active_scan_mask, while a buffer-mode claim is held.

Take mlock in iio_disable_all_buffers() so that unregister honors the
mode-claim lifetime guarantee. The info_exist_lock -> mlock ordering
matches iio_update_buffers().

Fixes: 0a8565425afd ("iio: core: introduce iio_device_{claim|release}_buffer_mode() APIs")
Suggested-by: Jonathan Cameron <jic23@kernel.org>
Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
---
 drivers/iio/industrialio-buffer.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/iio/industrialio-buffer.c b/drivers/iio/industrialio-buffer.c
index 2c9ec93dff47..d60bad5492e7 100644
--- a/drivers/iio/industrialio-buffer.c
+++ b/drivers/iio/industrialio-buffer.c
@@ -1377,6 +1377,10 @@ EXPORT_SYMBOL_GPL(iio_update_buffers);
 
 void iio_disable_all_buffers(struct iio_dev *indio_dev)
 {
+	struct iio_dev_opaque *iio_dev_opaque = to_iio_dev_opaque(indio_dev);
+
+	guard(mutex)(&iio_dev_opaque->mlock);
+
 	iio_disable_buffers(indio_dev);
 	iio_buffer_deactivate_all(indio_dev);
 }

base-commit: dceba8e581e3e8f475da0efbd7a73f3d9524ddd2
-- 
2.43.0

