Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4E53E9C0E
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789310360; cv=none; b=NxOQ9HeOLgpkQTYm6wqOrzNENh/xzz6o4C9sELUEOTNu/XsdQ7vy49ObGCQAtfQmVyfbw6MoN2YaGxwJhTlCXppeqv1nVmuIg29fMmeNgs++izeF93dw+X0HR/nFYjwL+WJhwjQX6w7qSE6usVsr7ZrxLafVM8mHero8iVted+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789310360; c=relaxed/simple;
	bh=jiMrzmDOfg1nWOBVZ7m2UVnsQM7VW5f1VNF2Ud+H8Lc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WTGEh6/Yr0Ylj8iHAZ/gUJf+N/0Cb1VJHiNPbhGMZLye2r0eGUPN5+v4uGYzLiW2UpnmWi5PhR+eU0ORlG7jpFHJup9ws8QHPDhLPuFJE7Wdi6C6XNrxGuKYknyGFc5MmMhr3JVGnf/Qg7elzzvzQ7D88SwjARbdGzW0Q/L7QhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cUxtCzFk; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cUxtCzFk"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so2310708a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 07:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789310358; x=1789915158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QV8gjzCfofnh3QCpS/nK9Zmu81UQ7ALKKOBtGf8NykU=;
        b=cUxtCzFkLmq6MFlqJtPpUjAgHRMRTt+4EBAGEr3y4fg4ShlXgcRbqe5QIDX1jGi6Lq
         20CY8MnscPil2KI5hf1g8fE/ifrlr1rGdoapzJzKYAp+y5ZGOUYQLzX0CbyGtU0cjgCS
         l0ovV4LuFLwe/O8rGSwTbozIodOafMBrTj1sswZKYoVyvDbaEuRCFbkxvswcCS3SExUa
         UgEWhUOm4X5xcMg0nfZcGvOx/wFkc5PW2JJ9GgtLlQenmn8T8GV3GEKcfXHSTfxlNVvL
         XnyMt84vNnLxdm+fkdDFgFpxWU22xTWRP1EJRarYEaG1YFVUkSpLA8ZGr9NSozD7JdK1
         2FQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789310358; x=1789915158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QV8gjzCfofnh3QCpS/nK9Zmu81UQ7ALKKOBtGf8NykU=;
        b=nqpSIl0pvIAL77jaJXdNWtmz8QMltMTk6aMUcyqYa+q+g8+rzfqwfsPubGvpWBe1Rt
         sof+HRiTv/frj0yj/YnC5utDMerdP+f0cJDi7XKADpKdmTkx4eGgJv6ugRviuU2UONrb
         IQGcZBBt6S3g+q5pxwYl53r5uaZkiiSmpeySWazpCJM5DULXn6AhDfW61iicYI2ggRoX
         vItiD3CoZL5N6lbrlhNtF9mjF4l6ZZvo3NzWPUc4hOyL7GQ09tOgx0i8V1e6yJ5ofcoX
         vAv/eL6bQvofZGrDsjkeJbtgxg7RY5PskMH1fFeLw5mePd21GngQB9DN1s8D0ognLdeH
         WHhQ==
X-Forwarded-Encrypted: i=1; AKwUvByasgqLzFR0scZov6IXerL4sVI1A7Xs3mKYdTu5EezJIZKytR2QXR5lBDX5R+1ZQSV7aYIRl+1foyS8fJc=@vger.kernel.org
X-Gm-Message-State: AFuF++kxSnpCTtLtQUFydtIcBBK1fgFe8zyN8geMkHfWsIbxJlN1FtJ3
	QHR3BcevoEL1d2etO4gyjaTOmxQjrTgIWn/4Ou5Gy7LW6fLtjIQOJ4GM
X-Gm-Gg: AYBFou2df3F9pyPIGsDJoxpRDuTI0+btEzY5zl0p/N8pZnaMlvQ/rPHa5HcjDOxeYzy
	diy2gUMk1mcHI424UZ5nxDb9k4asKLrsy3C2fvZNwXgarOm+ZMdwgReIJl8yu05uuPNQ5SS+pmG
	63++uXYH29eHqxlnuMXVvkKWyDdZL8zHrUdnlvdDHaIMzNul+Si2nmlWZYJOa/w9WbBM4I0KKB6
	aDSEx58VjNdn+dEJO4zglVwYJng295ZNCpapSc2KTBnva7DouiXfd/cW/kdHV/GEL87DF5rH9zE
	95mMyZbbIdHYyP2NTB2q4uJUvhHwAtWw1Gm0WEv5brS8l7Vf/SjaC7ga3duW92poZyQqKG9EB4N
	U3u+xT2vC+q820oiNrLVBU/7zjulBxi+IQJpKThfk9j33cHozMlC3cgqTDN2OWjecXM0Omj6IyV
	riw2rGz6mXNZXJziwdbSgRVuDIYJnMbGP708LujZSvcVxBLvMSdX/IaA==
X-Received: by 2002:a17:90b:4a8d:b0:39d:8222:6436 with SMTP id 98e67ed59e1d1-39d9bd8f51cmr22611245a91.7.1789310358118;
        Sun, 13 Sep 2026 07:39:18 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d94bb0119sm16289560a91.2.2026.09.13.07.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:39:17 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Ivan Gorinov <linux-kernel@altimeter.info>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] HID: winwing: remove unpaired hid_hw_close()
Date: Sun, 13 Sep 2026 22:39:09 +0800
Message-ID: <20260913143909.1589019-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

winwing_probe() starts the HID hardware with hid_hw_start(), but never
calls hid_hw_open(). Despite this, winwing_remove() calls
hid_hw_close() before hid_hw_stop().

hid_hw_close() decrements hdev->ll_open_count. Calling it without a
matching hid_hw_open() can therefore underflow the count when there are
no open users, or incorrectly consume an open reference owned by
another HID user. A subsequent legitimate close may then underflow the
count instead.

hid_hw_stop() disconnects the HID users, allowing them to release their
own open references, and is the proper counterpart to hid_hw_start().
Remove the unpaired hid_hw_close() call.

This issue was found by manual code inspection.

Fixes: 42d020b54edc ("HID: winwing: Enable rumble effects")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/hid/hid-winwing.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hid/hid-winwing.c b/drivers/hid/hid-winwing.c
index 9cd25a77999e..e18728f215ae 100644
--- a/drivers/hid/hid-winwing.c
+++ b/drivers/hid/hid-winwing.c
@@ -388,7 +388,6 @@ static void winwing_remove(struct hid_device *hdev)
 	if (data)
 		cancel_work_sync(&data->rumble_work);
 
-	hid_hw_close(hdev);
 	hid_hw_stop(hdev);
 }
 
-- 
2.43.0

