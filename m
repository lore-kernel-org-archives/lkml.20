Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86378488228
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 17:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788283291; cv=none; b=OGnAndA/cjATvq2tvwcS5HWKdmGtm6OM0KBuIOIvPnxKPVcrpJggYTEujNnXvuBY3DjZysykGNj2gWQ6ybE4W7stsEBoGSnXbkp79akFAqdG1JKQbS82A82F8znU5bEIeXvGqtlRO3sL/WxHv0FHcI5F0cgPzgUbw0AA3C0xSI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788283291; c=relaxed/simple;
	bh=LeGDvC3l27Wo7zRvl7F/A9X2MyhBj7RXCYXvGI4LZpM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JL2ixj8OGDHME/EmM7JvBpkRD8WQaid7nyYV/d5JjUTYjbtYbOZ/fXhOJIiOhfRrCpUtQTDKhZLKZyT1gnBoPOcODw/DA4uHFpLcqzqtiJ1thzgVtFV/q5DAjtQylBpW3jTgQzyGX/QSj5MWbJpuEEsdVrVNSZlBqtavtcTS/Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXudvyTt; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXudvyTt"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49cd9add88aso90885e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 10:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788283289; x=1788888089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yxn9qM2Ppo5iTTsOVfzJ7uBe3gU3KpqKhhkdUu2Nv7M=;
        b=BXudvyTtpXxhtGPQoB8C1zIpokgHsWg/+L+eMhWipeTbqcIHkUsalzxF+WVnAVe03f
         JuWzH5kUyLi0C4b9A+F/fRyYwt/bOldpwE/5LNwJ8JM2c/U2Lot6GsjcE51bzG91QIYg
         MNc4nxIlaiGsh675ehRTqdedmQfYSkOu0c2nHpAeyngLM1WxqaYZeOl5PfS/LSX2J1zE
         v9nvZ3tLs7tgP5Uvbgwvs3dwqSgsOU3QUadK1ghM7ZQofHAlie3VUwha9vgdKuOxX5kn
         tshbO2jrtS/iQMgTiuI4bug49y0aT8eeXxHOmbNF4qWDW/0SFPA9Kr7zZacjaG513oXq
         rlyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788283289; x=1788888089;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yxn9qM2Ppo5iTTsOVfzJ7uBe3gU3KpqKhhkdUu2Nv7M=;
        b=rRGTj8JO0OPMt+kcs3PCVa2VQX4FQTYO+sYfJq+8Ht9YJQ02rGfSwccEUdFG6HXVtY
         c3amgDaTVQ/Ze0SV9SUfyzX1zFoU+mVKbSNvP2igB0vrtVjZNU/JEe5GdvIQW5fKMGY6
         fpkfGPtenjB3N1EOHbu5fsenfGC5VYA2VvchFJHxQAfaBv7aTb52P1RsC5OZoUGJkwH0
         KjWe1GvuP+dfdiu7VpqRsWSUZtVYbsJGw9EI9VSfO3sxrBglNPQRBAACV5PeS/gHKAAJ
         2apzf5k1UbL3GWOYQ07Fdlsb2uBD8ffUB9BqgIil87Demg6HgFX3jit8A7mReYlvFRGh
         EYhA==
X-Forwarded-Encrypted: i=1; AHgh+RradowoGZbrJW6VzsW0vmtPT7+xA/atv3jK4V15xBTGHJk62mnm3huDpieb3pm8u9ILAQY8yfbyEChTZKo=@vger.kernel.org
X-Gm-Message-State: AFuF++m8y8TYnwlqi5nFxWwk08Vlhe73G7nFROGjKESXWqZdHYxx+Loj
	MH0Zhrv5fdkUgZDdY9gtv4UeEoajpFYcD7cUxq+MRH1uQ9qfP8BgQny+yWlmzw/dRGjPtA==
X-Gm-Gg: AR+sD12gzfxn8cwfSFNGhQJRk9+V945JZyyMCeLSbhNgZYqKnEMZl1aOYL6E5+ZS3C1
	MtM5o//JGC9+MXhV8my7WBr9opwuD9GJ4sIPUL4zVeS8GbgO41HS4QjGgmRwYQNGUPBNXRwfu4Y
	e5aQXUv1zuIDWb7UZvO9T/hPAg+y4zZ7hrsZPxgDUxnisoeQhDaDlTSvlwLNBXnB/Ez0SBLwjEp
	A2z4l1aXwLhpUt3c3LIlV7RH4VKF+Kc//S5CMEUFO5khPqAqcdQ5HXYhFEVxOXBrdpdPQZtz9Il
	uh67Lc3Jzwuo4rtZI52jBTTlMoaQvHGNu5L0dKyg3moraXD62vWshdnKHswd87/QYq43vytj4Sv
	hNE8pR03M6v4qWCqA06s/6nojl3pVRTMK0mQC4SVNp+XhAamgp5PXFopdLGMOIIajXmCodMN+u+
	2yPhSY9mHDuUG42VIdXd75+TKrl+yjxw9KRyIRc3nzSyvHenVx6EFq2oNOPHMv3lNXhuYmMDDQ8
	vP88qxKsFPHydpGSSeiwS2jkyCzm1UmGRKpCwoXHo8=
X-Received: by 2002:a05:600c:4704:b0:493:cefc:d113 with SMTP id 5b1f17b1804b1-49b91c2d8femr548275525e9.5.1788283288657;
        Tue, 01 Sep 2026 10:21:28 -0700 (PDT)
Received: from DESKTOP-EHH7ATM.localdomain ([102.209.109.149])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72c28sm508846f8f.6.2026.09.01.10.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 10:21:28 -0700 (PDT)
From: Godana Emiru <godanaemiru@gmail.com>
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Godana Emiru <godanaemiru@gmail.com>
Subject: [PATCH] staging: most: video: document the locks in struct most_video_dev
Date: Tue,  1 Sep 2026 20:20:55 +0300
Message-ID: <20260901172055.53889-1-godanaemiru@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Neither lock in struct most_video_dev carries a comment describing what
it protects.

list_lock protects the pending_mbos list. Buffers are added by the
component's rx_completion callback, comp_rx_data(), which is invoked
from the interface driver's completion path (a URB completion handler
in the case of the USB HDM), and are removed from process context by
comp_vdev_read() and comp_vdev_close(). Note that in the comment, since
it is what makes the irq-safe spinlock variants necessary here.

lock is never acquired by this driver directly. comp_register_videodev()
installs it as struct video_device::lock, where v4l2_ioctl_get_lock()
returns it and video_ioctl2() holds it across ioctl dispatch.

No functional change.

Signed-off-by: Godana Emiru <godanaemiru@gmail.com>
---
 drivers/staging/most/video/video.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index 88892b5db..c354d1820 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -33,6 +33,7 @@ struct most_video_dev {
 	bool mute;
 
 	struct list_head pending_mbos;
+	/* protects pending_mbos; taken from rx completion (softirq) */
 	spinlock_t list_lock;
 
 	struct v4l2_device v4l2_dev;
@@ -40,6 +41,7 @@ struct most_video_dev {
 	struct video_device *vdev;
 	unsigned int ctrl_input;
 
+	/* serializes V4L2 ioctls; used as struct video_device::lock */
 	struct mutex lock;
 
 	wait_queue_head_t wait_data;
-- 
2.53.0

