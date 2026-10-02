Received: from mail-lr2-f34.google.com (mail-lr2-f34.google.com [74.125.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41DF47533D
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 11:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790940078; cv=none; b=QGvSdcb4y0mgjFec8RiM9sfUnFOaQA7tc6O4MZhMIQvxq6kzp0itTv9yaDERKL/yDTAljidpxA1EJ2WO9+gypnd4Qf4ynckHAqDq9oh8QA5xqwUzLyPU55qp+bdzGJV21X+p719MyrLODvz55dwu2/AA59LxFxo40PakHP8KsCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790940078; c=relaxed/simple;
	bh=rkCcOHhvP7Z1T5ywcz6uiBs+Yi1x1yW7MGEBQeGtYM0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RkfxC7+CAcu3y3F+AzmefbKHBQFV7tDqTaFuKI0Jke0ftuW7+qb/8wKkFCL65+CF8lZd+YQ7s41qQ7JimqBpoXHN4GpLLi5YufbwgxD5TE8ObtdeF6uypZl2BUUQEuUnairRxkTOJsTDZTEGcWorZbtkXc8Do/QuM6c04rzMeD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hTY95VGy; arc=none smtp.client-ip=74.125.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hTY95VGy"
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a7823deaddso6823311fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 04:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790940075; x=1791544875; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wWsaWvAs491EwexC4j9Mtw9mN2AsoOlrDKvF/57KANQ=;
        b=hTY95VGy8H146W7rDSVk0OI4SfwsOjhc+KeZjJggd/EJnp3fRMcQAsytrBpO3nRV1+
         2vkjtTZ6yWh/cWLUXJdKz09oKH6o+5eOGPBLvQFtFKVFKYSB3CigklIjpQK6FGirT+EN
         ZogfX1F49SO0pN8P8Tix7NlJMgiG4sSHTdd0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790940075; x=1791544875;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wWsaWvAs491EwexC4j9Mtw9mN2AsoOlrDKvF/57KANQ=;
        b=XSNdtvZ/xIXKhjj/k4DHgCQOndko2zdxf1IDJxWmOsUIbsfuDBfezQisiMMtiQ2OK5
         A0phj0+aFOc3TcsR/mhUi/kmbeEmeSp4oN9D0pZbczRjLy+t3+Z3x8LJEug2IW9O5IIB
         glA+/LvVHRWqT7MRmMDBtbllOGT9/qjUTRIJ1nI0NDG2S2itPcwxyr8r7T/BMr0Vi9Or
         JXpidhXiFK9f7UEDuj9C1JLfVO4ZPjkg6TmCfOuxB0qvtSm+6swUyQyoaqt5vLIgdaPV
         I++S+HPeZxZVvBzPcb+LaEn1ifQ7LUq2qiq8BcJTuYkIuTSeLG+yRQ9vhRtxdszRFisK
         IoNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMBoww4gyVpm8tS8osF9G0qzQGhNJ9MguCcde/WtNNGo6aPcXrksUARYo/WnjJea4ki4tquXK0QAOO/PQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJigxGD5S4pze9YOPWknQaOZQ57aON0r04bALJAbETn0BNnHYs0
	Og2HD+zd1MooAhzpP69PwgDA119EKXtRnKym2XAOSnFOD7QUOMEGWlDVHbBlbST6abnD53G/YdH
	cZg8=
X-Gm-Gg: AYBFou09NmS8lKyByOYzCy0Pqh07B3lo6Wie9Pc3UaGDIdRJYlIwTdNQF4H1Z4iP4A9
	aBt7d370/Rt5StbE11IhVJZofx4UMTdBEm4fsohkGcJkXEqY5xkbR9P7ZxEwxowT6P+3NOQMWpF
	WyoAXpD4vTgOJ2IPYJbs/7cwxst8nJCqwAm6jGBtL6YaQoFE+CpUGEqyPvCzPsbvKnhGmZTl38N
	lIZKyYvL4BHn782Wj7IjAFrdT7d/TnOuQfaoi++OBV/KK2LgJVAXaQcpcaoXy4IQjqLQe7Qd7dF
	biyuNURZ3ayXynehwNNwyKztPAsSL5mZZ0AxJYit6Fl1X7mWIDdhNGbXZpZiiRvi+Ir1rOft0C+
	gUi5N8LdIREqVMaWBz/+NBNOKj5TUgM3lqmF/PXmGFSef9S7ftGFFrXKDfQp4nrDQTCuj1hERgB
	iTxxiyoZbMHXX5x9vc7tB8nGfCkh1zRrHPpzdV/A9u3WLXlm9nv8nZjruGe3HYRlpmm58TSjPq6
	5LBE7FvEqMRkQRkb1Qa0j29XxjTz7eTVfsIjPBmdiECVR8SVHfWDcnh
X-Received: by 2002:a05:651c:b14:b0:3a6:4739:2008 with SMTP id 38308e7fff4ca-3a87ebf5707mr5347261fa.0.1790940074663;
        Fri, 02 Oct 2026 04:21:14 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e324350sm8562931fa.36.2026.10.02.04.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 04:21:14 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 0/2] media: uvcvideo: Do not read beyond the uvc_status
 urb
Date: Fri, 02 Oct 2026 11:21:09 +0000
Message-Id: <20261002-uvc-status-11-v2-0-a98a135df0eb@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKWTv2oC/3XMyw6CMBCF4Vchs3ZMW7xQV76HYVHqALOAmt6iI
 X13K3uX/0nOt0EgzxTg1mzgKXNgt9ZQhwbsbNaJkJ+1QQl1EZ1sMWWLIZqYAkqJWg+a1NV0ZDT
 Uz8vTyO/de/S1Zw7R+c/OZ/lb/0lZokRlx1NL+qzFIO529m7htBydn6AvpXwBTTK8760AAAA=
X-Change-ID: 20260813-uvc-status-11-99b9e27a8ea9
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3

When we receive an interrupt status with a control change, verify that
the urb has enough data before we read it.

While fixing it we figured out that one of the mappings was using an
invalid size. It was working fine because it used a custom map function,
but now we rely on that value.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v2:
- Use wMaxPacketSize for the  urb size (Thanks Laurent).
- New patch to set the proper size of V4L2_CID_ZOOM_CONTINUOUS.
- Link to v1: https://lore.kernel.org/r/20260813-uvc-status-11-v1-1-2cf43e9590b0@chromium.org

---
Ricardo Ribalda (2):
      media: uvcvideo: Introduce scattered field for uvc_control_mapping
      media: uvcvideo: Do not read beyond the uvc_status_control memory

 drivers/media/usb/uvc/uvc_ctrl.c   | 18 +++++++++++++-----
 drivers/media/usb/uvc/uvc_driver.c |  2 +-
 drivers/media/usb/uvc/uvc_status.c | 18 +++++++++++++-----
 drivers/media/usb/uvc/uvcvideo.h   | 15 ++++++++++++---
 4 files changed, 39 insertions(+), 14 deletions(-)
---
base-commit: 7fa44c2c123c17c4a3856ffac5e384409267cced
change-id: 20260813-uvc-status-11-99b9e27a8ea9

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

