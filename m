Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EBF3EB0F1
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 16:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792341292; cv=none; b=QdFI6E5OcZfIvbF5KKELXYcqRNtVX+i7Uvxx/lNueufSdETjh3bk0/iFDo4NbPbFW3AYqvj1P9cCelZeJHVyBYyz4ZEWDe3+JpSKWox1bXgEC2MERheOy2dkCB0ZkkwO2M+TXEeJiJwfW1cU7MODveWaDXEJY+qMrezk2xTFGvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792341292; c=relaxed/simple;
	bh=KsvbhHmrpPYdQnremxgLvolRQzFzNASHFLr8Ynq5MnY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tsgue6fn8HIzXlXsZ+nJ0WEoAjaIZRUVt7qnqQO5ABn4LvDQFmChuZNc8oeAH4tkoXulGUz71YXqJLPfn97tDF0u7w3abzExj2Vce4JzEZMC3BGNXBgdSqFufx/0WIVOI6w6tYoS/FBcLatzuTqmYRljNja+6/u58ROGnpXvI1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T9WCeA0Y; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T9WCeA0Y"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3550c917fd3so1576961eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 09:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792341282; x=1792946082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YpKPKplGyC1zv9vCrQd5tlK3JvlHI8Pmz+ZUDoFfyg0=;
        b=T9WCeA0YI514ZO3//AEJhYYo5OYAvjOweaDNxsLm5t5AahQey15DMAnKQIKHLfTW/C
         s6h4FzPx2AwAQyA9xxIdeiF8jWphwBUY+4W1SpmwW2sVzFAsGxDz7qi2T7Xq8I8KpXAN
         a4IbjiwnB8lU9R/cU7rFbqnArwyUQujJ4QVWthHLTUk+3bg6DsXusZMwH3s4lQPWcUxT
         T8BMI0pURZ1AXYaryr83ppZW7UNc0+KRP7Qm0AGS3br6lrDb+boUznKPqGREp/Urt4p6
         QQ6Y/4RoiO0HnuB1WglEnaVajDtjGXodyZrjFpvFdEjmiD4F19PREaaciXFbpInPSRAy
         rbjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792341282; x=1792946082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YpKPKplGyC1zv9vCrQd5tlK3JvlHI8Pmz+ZUDoFfyg0=;
        b=MZlfC2LqGZWsYgtqlGysXUmJ7Ovpxi3gxwxNtx0qsj79KT7jBpvZ+a4IoLhYrSPRLt
         q5szhBbZq4rG22HuR1RrXVUGCkiZ/cpF9V4sYGsVlQLKcTaCRlLrpJ30RfyhVbeKvzdh
         3/Gr2Lto1aphGfjgWwIL87R9YjvTHG9+OKzl9fezYo1N5X/hM5NWsKtKoLc5Cbig1yja
         z/l5KkOuA5uUViDUDazeaSl6QI2YDJHPHqS3OsNytBN/zhUy4JfqIBJc79Kvsm8LlPNt
         Wb+7QZltoBUu+6PpThE2ry37bJaatek+8SKde4RloA/zd6z5+rKeDJSZWbuS8g3YL3eh
         RTow==
X-Forwarded-Encrypted: i=1; AKwUvBwQvNvnX53wot+QJB3FA7o/GjNHHts1fssldDoI69kpBIZSmwtY3GBUuqK3ZDntvicdxEldTNcxWRr0MuE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIoFIYXIO1dlkTmvCXYUJ5IAnhgrgGMnpIhFx6QDar1lPrNsnK
	OQBZdteXen97y+ZxlQ2BN74imZWMeajoYPQLlF/TJMXV+Yd2ZLtm4tAe
X-Gm-Gg: AYBFou2IqbmUyo3apdycAXlhs3n/wAxnXUcPPDfGM98W4TmWx0CyM9xww1tdwvf9FGk
	Gr589MkcyP+U9qeLW/+bA5UBbsIZtmZabzRFRYdyGnjWoJIlS19e70v1bSXs1n3Lhf7F3yl9zFV
	zuZ6AGNE4TscWD6qaWAmuhtmoWPCMHdrweNivsOn2QHKbnC39ySrrfHGBhJpIIksOlRPY102X6l
	G7BMMrJgKjqHJQgC5nMSANf/z9KNZ4G99Gi3XEjiaCj0IKcLC0Ityh3jeTsxSc2mpFAeoPlb8tw
	nlfafJ/Hbix89nS11x9FFJ8BgrF9hxj25KniYx85+llUKjqwbsebWx6jUrnB70FMch3wvDxlJNJ
	Ey3ueXqRw8kg+S+ss5Etdpa8coVbgaDKhpouAmKvM6dEGXMFeXp9oSnflYSLsHTl03iBYjHJdxe
	2ZtDbtyJHzNmUZ588LZ4xq3Lu9a8Hi7Lg1dJH/lFSn/UiEBQSy1DA4XGWgupFNq9B5sNARMc7ae
	HDYcIFGzHVzcalY3/psvC37ktdeJdzyLSvJiISAhEaq1JgIiX6UaXQjemF6iilc/YRQPkPe63E0
	O3R9VQ==
X-Received: by 2002:a05:7300:dd45:b0:358:5bc0:4f08 with SMTP id 5a478bee46e88-361a2b3a5cdmr7150254eec.37.1792341281979;
        Sun, 18 Oct 2026 09:34:41 -0700 (PDT)
Received: from codespaces-393231.mimvmn1ww3huhhjmzljqefhnig.rx.internal.cloudapp.net ([4.240.39.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6e33sm26303667eec.7.2026.10.18.09.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 09:34:41 -0700 (PDT)
From: Eklavya Singh <eklavyasingh2106@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Eklavya Singh <eklavyasingh2106@gmail.com>,
	syzbot+1459655b2bf1e798f9d0@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH] usb: gadgetfs: fix use-after-free after a failed bind
Date: Sun, 18 Oct 2026 16:34:34 +0000
Message-ID: <20261018163434.129569-1-eklavyasingh2106@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gadgetfs_bind() takes its reference on dev_data only right before it
returns success, but its error path calls gadgetfs_unbind(), which
always calls put_dev(). So when bind fails it drops a reference it
never took.

With ep0 open the count is 2, one for the superblock and one for the
open file. A failed bind takes it to 1, closing ep0 frees dev_data,
and the superblock still points at it. The next open of ep0 then takes
dev->lock on freed memory:

  BUG: KASAN: slab-use-after-free in _raw_spin_lock_irq+0x3d/0x50
   gadget_dev_open+0x4b/0x1b0 drivers/usb/gadget/legacy/inode.c:1919

syzbot gets there by making an allocation in bind fail, which is the
"failed to start USB Gadget filesystem: -12" message right before the
report.

Take the reference before anything in bind can fail, so that
gadgetfs_unbind() always has one to drop.

I tested this on dummy_hcd by writing a config to ep0 with fail-nth
set and then closing and reopening ep0, for every fail-nth value the
write goes through. Without the patch KASAN reports the use-after-free
right after the first failed bind. With it, 122 failed binds give no
reports and the last bind works.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: syzbot+1459655b2bf1e798f9d0@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=1459655b2bf1e798f9d0
Cc: stable@vger.kernel.org
Signed-off-by: Eklavya Singh <eklavyasingh2106@gmail.com>
---
 drivers/usb/gadget/legacy/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
index 67c6ffaf4..f5b97dcd4 100644
--- a/drivers/usb/gadget/legacy/inode.c
+++ b/drivers/usb/gadget/legacy/inode.c
@@ -1688,6 +1688,7 @@ static int gadgetfs_bind(struct usb_gadget *gadget,
 		return -ENODEV;
 	}
 
+	get_dev(dev);
 	set_gadget_data (gadget, dev);
 	dev->gadget = gadget;
 	gadget->ep0->driver_data = dev;
@@ -1706,7 +1707,6 @@ static int gadgetfs_bind(struct usb_gadget *gadget,
 	spin_lock_irq(&dev->lock);
 	dev->state = STATE_DEV_UNCONNECTED;
 	spin_unlock_irq(&dev->lock);
-	get_dev (dev);
 	return 0;
 
 enomem:
-- 
2.55.0

