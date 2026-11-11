Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794406077;
	b=ooDEwsuGdsH89jOT4ViL/QamuMqeh1sWBy/WS9mXG3cm2lZiscS3Kl7L4I0TwFEhWdsu
	 1x3fhLtMICr0G9tqpyc5pXkCy/KwwrAAvZiFK60KiShVrwrZQhfNuZg2MBYILkupNXsWi
	 C/gbEBMUnLJf1UzMsC9rwJj4E/dnizU6+CxwvyZ575g6bPyJuUv/4yZ7tdqs4h20D2/OY
	 a0xJo/aiT0iESvScafKv+c1tt4Ckf1wsxmRpRddaEtkrU8YFLm4UJ18BNyJmiv1ZBMx08
	 97wAOKNXrTl6DyB5a59/0pdRh7dZQroAe2Phu6LNJ0M8cTxPhhjNtfC1C6GumswBBEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794406077;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=x3RzAiD1nujkrt0dHPNnUah2YzBZvBSykZZIS7z7tfI=;
	b=TZFOlpyQcn09S7gTBa1oxgowcL6A+dWA7GXyKDpvGKbF3Z2EveYrPQN4ZHNGt/wDiSrT
	 5+B4DWs0VYJmB5AhqGksmFrjJXkILIruv7XN5vzW23jari8U6iy4A0IMk4nVd6yASN969
	 4jmHvZfbUB3Rje4gxiXIdBDBQvLcTfKcT58VSobFoJIipewTiU9cHmzxSxQDZ1hGKXLyw
	 kcQ6DKFBqDva36yTIKTscYn//cE/HTdRIvhYuyi3Mtg61OZxUWnf2K8dNL6T+AEBfMaxW
	 Ow/Ux1P+Ckb8bKxdvfz3bVqkldlQ1NNXVip53AK48oyBM44a5SIjdcMP8G72N9eA2fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0jHmWFmL;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FE5606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70FE5606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0jHmWFmL
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48dee593f18so2432119f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794406076; x=1795010876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x3RzAiD1nujkrt0dHPNnUah2YzBZvBSykZZIS7z7tfI=;
        b=0jHmWFmL+mjVKXkBf91l1p/raM2AnZkpHV8i4q2vXdFbY3+PaUXqy8/KmAp7KqFHSE
         IyxcEK9/vehSsQkmsmLj3msSWubMucdIiPisoyi+BuV5RzgaTEJdc2txumPDCZ7t67pH
         4cEffI4fm73Y1hakW74woj9tCWbLL9HQNxhLPoVuIzrGwAMdw8Q/7jJxi0nedAcrTM5C
         U91bC+N2px+kXzuMlqA0YV2xA7wmAkD+5+bhqLfAN4unqpIruYPcffdl/r0XcOsXViQ+
         PhJbC7SbjWuxWRCAJ8O39Jy9zjZKZvcI6VV1pfxVFTf5OKbDH9KU0RkowO1BJJKSqS+9
         cn+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794406076; x=1795010876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x3RzAiD1nujkrt0dHPNnUah2YzBZvBSykZZIS7z7tfI=;
        b=yrk2MwIgMvMbZq04IPzq/O6Pc2LZxPa2HVClxCGbE5NvbAmoSh6hiUXQczuOwM4ynP
         XjYyJlV022c48o5VdxLTYydStKveMLDLJ0ULpf9iGl/4Ow9k5g0elD+Hm+zge27ATgGp
         yI/n3VUqFoCURSnZR9o7kq0I/wa222Y8I8CYbeaP6wWY6Fe9CPi4VXGbn+xBqfrUGdUT
         mwKNPAVAqBJyyj6ethqeAtzeFJaHP5SonG7yR/8IA7c95kKsccc1qLHmNesjr9T829mC
         fimQFh3bHebh1nB91eYHpak1qVzKQ5fkuQjPUHbLGfj1fDI7p1ASSU9usEFygNSWE9jt
         e7YA==
X-Forwarded-Encrypted: i=1; AL+hErFBPasjsk3U+GS/9H5dlmd6/O8jmm4TQMkVVInv7sOgFxXdu+Mw+G4a3LF3AuHr0RO8ZePHZRLJluzG/Is=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QXWDCDl+UbXOYdRYk92lPKS8RB6BXTgGhfSetBgV18Uy4BN09
	3pKlblEMfraG0j9Vuobaw2u7Xi4qOCnEeeo+eRJvcjgUaqa8L8pYKaE=
X-Gm-Gg: AYBFou070AIUUacRW6ZpIEkEOX9KKdBkT8jEYFF2TNAQcrm2IbqVvcd/20p1D6lpBfW
	RyCaO1OCjIe5YE/MQzj47Tk2Vnp+3DIb/LQjfTO940C4fHjlt2k+nW/4kg7wj4bLkvd/b6a3A+z
	LmmAkhV/3W2KXUuD4rqQ8H/6Wl02QVmPq1frvIpsX9bOmsmCApgEw6hztByd5kZ1nmw0ChvlQl0
	C0cS74nyb9m8YNELnyjOZLRq4715I6aHo07AL/Q/yi54XEqLjFWhm7nJDJfpuZ9q/N1+eB0Pe4t
	BVjsz5nCSaq76SWLGyCUf6yBwrJP4jxLJn2jatHbyOJpcn5xSrRHC9+Bvq9oSuTLVJ/a25xeMtB
	3S0fQF3tJqtn5mGfKwCfzMjogUJGwipSe+HpWd6STgvHTw3woHfNUJ2qxFVyoouzZ0hbHU6Cget
	wj7DWAXVmHTcGFpi2hcdyauJvYk6nKmbHxnME8yW+agB1zM4qPIf/7t5tQ3CS1L4l3xj0mtt50c
	o+cnkkrxTETGcsOqn2m0Se6kaIdKc7uc4oI8m8ash7fZ5oSkrsmT3JKPbOzemv3aBjLxNEO01XT
	UglcXLgKcaG26wQ=
X-Received: by 2002:a05:6000:2201:b0:48e:5cd4:aa60 with SMTP id ffacd0b85a97d-499c9dad952mr4864181f8f.42.1794406075481;
        Wed, 11 Nov 2026 06:07:55 -0800 (PST)
Received: from localhost.localdomain ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983284c990sm10604532f8f.3.2026.11.11.06.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:07:55 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: Zheng Wang <zyytlz.wz@163.com>,
	oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH] nfc: st-nci: use timer_shutdown_sync in ndlc_remove
Date: Wed, 11 Nov 2026 14:07:46 +0000
Message-ID: <20261111140746.375923-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
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

From: Tristan Madani <tristan@talencesecurity.com>

ndlc_remove() uses timer_delete_sync() to stop t1_timer and t2_timer
before cancel_work_sync(). However, the timer callbacks
ndlc_t1_timeout() and ndlc_t2_timeout() schedule sm_work, and
llt_ndlc_sm_work() re-arms the timers via mod_timer(). This creates a
circular rearm: after timer_delete_sync() returns, sm_work can still
re-arm the timer, which fires again after cancel_work_sync() completes.

Use timer_shutdown_sync() instead, which prevents the timers from being
re-armed by mod_timer() calls in the work function, breaking the
circular dependency.

Fixes: 5000fe6c27827 ("nfc: st-nci: Fix use after free bug in ndlc_remove due to race condition")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/nfc/st-nci/ndlc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nfc/st-nci/ndlc.c b/drivers/nfc/st-nci/ndlc.c
index be4808859cfa9..14e1213d76c9b 100644
--- a/drivers/nfc/st-nci/ndlc.c
+++ b/drivers/nfc/st-nci/ndlc.c
@@ -283,8 +283,8 @@ EXPORT_SYMBOL(ndlc_probe);
 void ndlc_remove(struct llt_ndlc *ndlc)
 {
 	/* cancel timers */
-	timer_delete_sync(&ndlc->t1_timer);
-	timer_delete_sync(&ndlc->t2_timer);
+	timer_shutdown_sync(&ndlc->t1_timer);
+	timer_shutdown_sync(&ndlc->t2_timer);
 	ndlc->t2_active = false;
 	ndlc->t1_active = false;
 	/* cancel work */
-- 
2.47.3

