Received: from mail-qv2-f41.google.com (mail-qv2-f41.google.com [74.125.230.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B545C5221C5
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 17:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790877482; cv=none; b=OJ/jkl/qs09/QCsZq1YgHbbO1ZQhuWb1+IzTRz7awYPyn+GMEpW52BUWcUxWP8jCyyTSsb3SMof2oDBoU678hlAq/5Ti2Mvn531jiHYouSh02F2wSMZhzNLkhDTgr+7n2Ih/gIllRQfeH/DIHnO4H8PxpFSPIEyNcc/m6DPZzTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790877482; c=relaxed/simple;
	bh=sD614/wHqA+UNZ8ljapcNbYh8hzDq3pRigpRikE5CYw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HzxR5M1qgih2K6zFgHw+/XL+Nsf1JHcp9c58C5sud/xVtAAJQsL+w0pvGFEwsTX5geqoso4y4raMOCYud3djtTtqjXVkYEnYg/4Ye22ufGvDEPrC6bMtIX5E3hHK280XWWqFr9ERTpJyhCGi1B3KBQjUM7p16TMXgWrnonbVC+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hb5P+2Ih; arc=none smtp.client-ip=74.125.230.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hb5P+2Ih"
Received: by mail-qv2-f41.google.com with SMTP id 6a1803df08f44-9179750d44eso12882446d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 10:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790877466; x=1791482266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fL9Q0QFcSoIbKOwsxFEseNsJaSBrJfTVHaNZtRQHhY4=;
        b=hb5P+2Ih+Cnr47HGOR3lT5hWL0tLvegKdaW23npF97InBUCtkscU8qPl1Sb4dAdXu7
         UUSEJq+ec2zaQy7k4zn/w6iQw3twGT+pqshqL6QvNPbM+7wFxwd8c4Y7bOhaOctv2GOf
         R41BjYmqh3YD+I96ZFf4eGrqTmLju0bOgzSqPJwLPLf5Tz8cr4JgLaah5/1hZAKSrvH2
         ZS6+1lo934VGjyhyg/VvJF0PBUYyXWj5dIJkcwID6e51FCGrQEii7kQm0lnRb/MGITiD
         DuXxwHcFAs7O1jacqUbo/jAFkFler8d4I6lCl+npz0O15JOdYExr+PMHrxxrlK/XQydu
         GYVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790877466; x=1791482266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fL9Q0QFcSoIbKOwsxFEseNsJaSBrJfTVHaNZtRQHhY4=;
        b=bFAFG6ajjn7W0g6vOct5wQtU8J957MtB1lWYZpvDxJvMYTZ0buM+aaVvDTvflYs3WR
         thJnlpWw+TPtixRFdiaSBr6bnMxTKZ0c+XOoLi/kE3sjNOeLIYWhf0ybtF27BYCfIaNd
         ztL4Pmn01w+8lmoYlN+4cRI3aHrW9nLbHExKlHEWFad64xdbq0MprCciUfD9ZU7uvSSi
         kKXR6u1Gy0Ir5h2Tfa8T83RWWoZlUuFMOsgEF/kfEgdWETW1OXGIIqGyKH/qVCafhoAG
         PwLfEcZNhkYcqvbpFg6LRuS7ln9tKZ1HHyAzvpu77ABKdAEv4bgxb7mDAsR1ZrcNdr2W
         pRtw==
X-Forwarded-Encrypted: i=1; AKwUvBxvIyjpPKwp0En3vkjM5eY7UGUOIGijo8yTHi2ncxl1leMNYT/QFliyQLE9PtOps4KzhnU7aHPSy7D1EqI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYTCR22xiG1xNu0/lCEP5pFusCuFKb0W86iNBwyne1dYvXeoQR
	xOR4sobr376RQ7tQ4ngXkurF0PuqwlYR/idASzdsRo29sJnpaUfMFbc=
X-Gm-Gg: AYBFou1sbRdoGG1usloeDveAGzNpMT66jpm/AFLkQJ2mERPqi/0KsE5JyKoxg56NHPu
	jVE6w8L1wdx0RByZgpbHc1n0HS6QPJf9NiH4JjOjH+Id0WfCPyrk0wZAsu5B04LaCrM3V36jEEE
	EpJU7hOiyxaHuwGpCXoRmlFFse0YfM1M+fY/BrYupBUDF6gJpwLFCfpExjnF3D/MkuqRm/x3qNI
	EZnCZjlcchIdXPw2DiiUFoiQwXbDNBnndEIa0ySFyDYhnB0aZtRvT23XwJfPzyjOATnj2yXgLkC
	fnM0IWQ3sZ7R+N8njOS8xrQ3hQVbAVjX60ItK3BsgI6K7OGhpaCQsH5WFm6tot3alZa8n96eHE4
	X124pKit97RhDe0DOMqHcdNnX0dsBbV4FnUtZoQaU4RgvKqE3/Rb6+vrb9UwvgxzIzDzGYLZes4
	IWwySuThWoGRYLxHdreNJ+LXMFx7YXijiNOR3gC7KAtotBw6B7WLA/Bf99SHHlhxNuPQZiNwNlc
	svtwifvCyfQrBKMvjNtitaI+CRXURuvMhK+r5ZNPTApCF2qu9TWAnJkBKoHXJc0d2fjog/4lljt
	o7xoFiDbPO8iq4S4hCIzX4gkCHLv
X-Received: by 2002:a05:6214:8593:10b0:912:517b:40e5 with SMTP id 6a1803df08f44-917c01931a7mr3207616d6.44.1790877465165;
        Thu, 01 Oct 2026 10:57:45 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917a8a9800dsm31853976d6.46.2026.10.01.10.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 10:57:44 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Ming Qian <ming.qian@nxp.com>,
	Ming Qian <ming.qian@oss.nxp.com>,
	Zhou Peng <eagle.zhou@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Shijie Qin <shijie.qin@nxp.com>
Subject: [PATCH v5 1/2] media: amphion: drain message work before releasing core state
Date: Thu,  1 Oct 2026 13:57:36 -0400
Message-ID: <20261001175737.4048254-2-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261001175737.4048254-1-mhun512@gmail.com>
References: <20261001175737.4048254-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vpu_core_unregister() frees core->msg_buffer before cancelling the message
workers, although core->msg_fifo still uses the buffer as its backing
storage. A queued worker can read it after it has been freed.

Drain the core and instance message work first, then release core->vpu
and the FIFO buffer. This follows the ordering in vpu_core_suspend().

Fixes: 9f599f351e86 ("media: amphion: add vpu core driver")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
Reviewed-by: Ming Qian <ming.qian@oss.nxp.com>
---
 drivers/media/platform/amphion/vpu_core.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/amphion/vpu_core.c b/drivers/media/platform/amphion/vpu_core.c
index 85cc4a14f8ed..a0c58ec97a42 100644
--- a/drivers/media/platform/amphion/vpu_core.c
+++ b/drivers/media/platform/amphion/vpu_core.c
@@ -299,22 +299,23 @@ static void vpu_core_put_vpu(struct vpu_core *core)
 	core->vpu->put_vpu(core->vpu);
 }
 
+static void vpu_core_cancel_work(struct vpu_core *core);
+
 static int vpu_core_unregister(struct device *dev, struct vpu_core *core)
 {
 	list_del_init(&core->list);
 
-	vpu_core_put_vpu(core);
-	core->vpu = NULL;
-	kfree(core->msg_buffer);
-	core->msg_buffer = NULL;
-
 	if (core->workqueue) {
-		cancel_work_sync(&core->msg_work);
-		cancel_delayed_work_sync(&core->msg_delayed_work);
+		vpu_core_cancel_work(core);
 		destroy_workqueue(core->workqueue);
 		core->workqueue = NULL;
 	}
 
+	vpu_core_put_vpu(core);
+	core->vpu = NULL;
+	kfree(core->msg_buffer);
+	core->msg_buffer = NULL;
+
 	return 0;
 }
 
-- 
2.53.0

