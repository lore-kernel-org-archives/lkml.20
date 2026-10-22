Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792698573;
	b=r/K60xXdqHi595si1EgglcNceRboO/SIVkE/wmj/y3xErvEg64ekkk96f8YImQsVOH3a
	 HcuyCsN46N1uBRRlDoRQcKR6XcFYOxWyNSSiYNHNS4y6bNNedzhCLhBi0sJdcscJijXxt
	 amL85zoWidEdyDKv/fIpxwSNpR/ZFiv7uJlHcIZ0V7dFWQH3HWpjGda5qAGLIpLoo+Xav
	 bCtPmhTnW0X0llk9atW+csUnDTlm9p9+FrVLEAMBc4HUlc+GVKLVgnBHn6sScY4ya3pcp
	 uycTdH6K30K+1ynpyAZiYPusK7Uv0kuKnENjtAjpoROnLpxrSmb1d1ERGbBR18x4a1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792698573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Z1EfijeQewP3c+Gff9BU9n49Kow6R0+JcO0yHhp/Z0k=;
	b=0JtQSrZODOU0x50hJKfL8Sz4vHCY4hQJokSb7jHATwPQPgE6/1fomwt9B0Zgqe2DGA64
	 S6Xpptqw5taaTKzXmSrFMa9o1KQu4cZ6fs4Lkj60HHhh+7UYWF2XR2/89tnj2pAzTlHRH
	 PArl5FAgI9x4Pd/AtxvxfHsyTDjfXGvnBqw2ILrwpTYtsLQOVUvf8ZkBl3R+JtBnbIEkO
	 kwxBFkICnsFBpEFxhjcmWRjc7m7ZDKTdft1G6uXfucFMIVIOsxsVvW5xuy0EyltfDxI26
	 1AzMqDSQk9xTludmkKzOVcM61mUmPTks3iuhFVLg6fH7pH2VamW7c+NhvMgfTIcgV+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Mq/Uzs9F";
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412BD606A322
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:49:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 412BD606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Mq/Uzs9F
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cd633ef819bso91771a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792698572; x=1793303372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1EfijeQewP3c+Gff9BU9n49Kow6R0+JcO0yHhp/Z0k=;
        b=Mq/Uzs9FX+SfS1W6qgRHY7ID9oHJ8jQC8RenfqjZLRidZ84Z+5ICK6ckMCpm1SyRbB
         pV7oouXOy+vbqqubV89r7eFBt+efCkYmgjOTx6K4XBBqI28au1PFXzhL7QgT3+sCXMt4
         mbLe/4nf7SmMANTxH33MNG3ZMAdgBqxmgSS2+wO/0orQUoK4gemtSrA1TZtOHSBuhTJm
         b4bunv+oXYKCDbwEh/xF1E941KdrffgJ2c83TcuF9s20O1L96oTjazJD7qCFkZdHXD40
         cbl+W4ykMVC2QpIyWILbtItm1kDnbLtGs5gOXDgKfCgKzEy6MMSVROrFotV9rKVu/NfN
         TAiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792698572; x=1793303372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z1EfijeQewP3c+Gff9BU9n49Kow6R0+JcO0yHhp/Z0k=;
        b=RUfgLjz2tJ5kggqCylMZ3hGAyoIDbUr6wOXoWmK7hJBgowR0XBcGJ9XXaO9ucm65K1
         DXTjyTHH261fh4TBFRXjwX5kmuxrBqtOMVOGFG06zBRvI+w8XFcg1p58pptBcJJSlPvr
         lVipyvFSP+P6RgoZLRHTiGXcxQgjX/dzkIdYbPoJrZNyzGdRYh4LHYrBiKQc16WOpacO
         Y9qYo3QD4hMyK0PJpFBEv74oSSVGl1J8bpZgpMZGZKXVgHAa8YaKTcC5udon9Fy09Wxs
         akyh+p+yAjq7rZcwVn63lmSQ7kHWCK1yjl41YX438T7xAlZbYrTL6d0Afr0qhAZH2Ht0
         v6qQ==
X-Forwarded-Encrypted: i=1; AKwUvBz0s9zBdD9T+pl+XA7uGYCOcdgFkAK7C5IhoXeGijrQngP7YwOwvVGoohG5xXUvQGtg5JruLqs38dYPaZg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLg7onXFrfTWC+9A8jy38pgxIJbAbuPng31J9/HXvQ9iYcu1G3B
	ONDbLsc/tuXAca0ruy3wrUMasege1seDqaWl3iSXp45AwYMH3labvRkR
X-Gm-Gg: AYBFou13AxdkWwYL0hLNo0CUvIYfgOwM07OTAoZbm+xssXUHFAY6zQnLLaa6ddHenYs
	HGk+wO1NtAjQWzKh9wKuLHJKbhKSS2UJ7QxXhwomP/pEsT40XGrdhvvwuvEHfwzq7rqNyoqairW
	jFK4ZXT9fICDEXkS82WAzK+246aQF9e3TyE7FuiTN7j+nZeqK1zpndnmoNPSlgwG9DZ2ZY6MvLY
	NOUh/YjUWmFW2yq5acZqm1vIEymCHJnttY+i/rZZHvPofCqlITlUVbF3WZl62DeSFCrTOFo0QY2
	3QUrzkLLalulhBM95K9vR8aGIc8gz0aU3yPE+Jh0RgJIBq29n90gFzLEJTX9eumyxLZPlmv4Q3Q
	Vw8CGA0Ou0bg0MCdk12s6iqU7mXENMJeAqN+Rzzos0bBPw0FEoxl7YvBVXNw/Wv4fLYYNUN/ljP
	CG9F2NUpVrcUbCnRHzONyGxJmjySYPQWq439+r1EW069fPAu4OGfkNftOkwbDoieUX3LijmFpvL
	F+LPNuyeUzkeaz8aKYo+x49u8eIgsjdj5hsRUMO0/9pkpexex0dEwMm+XvCaio8UwAATlXmjYQT
	/DhZZFkYrB0SY/4bH0Moj7nGzIZsCp8c
X-Received: by 2002:a17:90a:ec8c:b0:3a7:bb1d:3688 with SMTP id 98e67ed59e1d1-3ad86c91b1dmr5059374a91.27.1792698572531;
        Thu, 22 Oct 2026 12:49:32 -0700 (PDT)
Received: from casta ([42.116.198.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada490d4bfsm6400293a91.10.2026.10.22.12.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:49:32 -0700 (PDT)
From: Nguyen Duy Nhat Anh <neganhat@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Duy Nhat Anh <neganhat@gmail.com>,
	syzbot+809dfc586f33fc44b6ac@syzkaller.appspotmail.com
Subject: [PATCH 2/3] media: em28xx: clear v4l2_dev.mdev on media device unregister
Date: Fri, 23 Oct 2026 02:48:59 +0700
Message-ID: <20261022194901.14302-2-neganhat@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261022194901.14302-1-neganhat@gmail.com>
References: <20261022194618.14170-1-neganhat@gmail.com>
 <20261022194901.14302-1-neganhat@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

em28xx_unregister_media_device() frees dev->media_dev, but leaves
v4l2_dev.mdev holding a dangling pointer to the freed allocation.

When a process closes a video node after disconnect, v4l2_release() calls
v4l2_device_supports_requests(), dereferencing v4l2_dev.mdev and causing a
KASAN slab-use-after-free read.

Fix this by setting v4l2_dev.mdev to NULL in em28xx_unregister_media_device()
prior to calling kfree(dev->media_dev).

Reported-by: syzbot+809dfc586f33fc44b6ac@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=809dfc586f33fc44b6ac
Signed-off-by: Nguyen Duy Nhat Anh <neganhat@gmail.com>
---
 drivers/media/usb/em28xx/em28xx-cards.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
index 8440eafad44e..40fec8b025e8 100644
--- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -3776,6 +3776,8 @@ static void em28xx_unregister_media_device(struct em28xx *dev)
 	if (dev->media_dev) {
 		media_device_unregister(dev->media_dev);
 		media_device_cleanup(dev->media_dev);
+		if (dev->v4l2)
+			dev->v4l2->v4l2_dev.mdev = NULL;
 		kfree(dev->media_dev);
 		dev->media_dev = NULL;
 	}
-- 
2.55.0

