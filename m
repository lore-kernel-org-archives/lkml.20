Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3057B43149B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 19:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788292794; cv=none; b=fYsLOeg94YTt7Pe1W8/K22QWDQd7ex2SSZuFfWRm16LzIoC9f/IKnNuGBnZVHmkQbpxchHPeGuX99ZYIbLfgTHgEGWvkdLNaer62/bR+GIXU6kzTooSWPJvMoQfKoFE1KRNxZF9krfM1yxaKJmMW0He3hvqVezHR/+rUu4Letw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788292794; c=relaxed/simple;
	bh=so+sJEXPcX/c5t2B93vxjpawl6VZJ9hVu3eFKoGAYUY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ewvkGTay6a8/wn5K/RNB2cKM+Dh5StVyfY/9yJlUZpLmFyW0+nYvFyuZ/dp65DCJLaj9YSk5jaQT1+zg65eqWsxFB/CXjzU9hWOzn8UwIlah4lQO7buQI2SLmwU6FXLj6wyhFSt9D9ChxN7cVFndNwtsejnZ0Nm+1iGi10mvruU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hi392hVf; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hi392hVf"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-66e611e7c05so334579d50.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788292790; x=1788897590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=klO9rcY41+qEAIW/kerSCza/k0mNjfQoLBO8B+8gjZg=;
        b=hi392hVfvUXkFuuWzN8y2xb2KSrqiHZgC4gjsvEft3LsVtS8msfRYtX0GIfb/tnu28
         i/WIu5RzVeVZO7FUqmN+Iy74VBX/9+95XpcWcmYOj8mo5UF/oC/iK3I30YY4bsMgaz+o
         fy1eiI88NH8W2ORnGD8c6l25faWKk1gwArpOaAs24EpK+aA5wkBkNdiZg44axi/Bt2sr
         HZTAxPRwe72CrOiZh6dI/OiKeYC/TxOidRlfs8mFnrnh2QO8Bg6C9KleSnkae71vPZ3K
         6N8UvdvgGadu7LqAcThOtodZCywGfT7lixa88OAPcp6tFpwZH2G8ZmsExZSOB+kcu0sz
         EFiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788292790; x=1788897590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=klO9rcY41+qEAIW/kerSCza/k0mNjfQoLBO8B+8gjZg=;
        b=ow/O9xnGXvZ+cLzuRKwb+SERVqdbhR8uTJvRDklWxr9O9dd+osvJvAeR3ZLm5fArTK
         ar4AzCtFtK9GO0DuBwECo5ZtNLa5T1WxxF5cyAZfbfHtmZp/m6LpmfAT3GNHmYs9tp09
         Uvqat7Cz0QTNc+zPIVd/nQm3jvL+o5cpbiUwByKdrz5fzTfC4Mmu5LtsChpjgTUgpzLM
         ciEotAqb5KXZq2KZ5JIVK6tCEmUdZ94UFJyLF/kQOitpds4MZPOpMjjI0qYZD28JQLK3
         Gs0uyc3xvCOKCfSwSoXK8yCrkO8sLskgG+uTWvzPxEb1CQmd4ExIgGQREqJNM3/z9YXb
         LTJA==
X-Forwarded-Encrypted: i=1; AKwUvBxUENrQ9TeNTcMXpRgbWPo2YfvEf335M2rCGlv5JCD2BFIIIt+jkeyzRlkYha//4JB/SpvIn2XI+qGAW2E=@vger.kernel.org
X-Gm-Message-State: AFuF++lCrtWFssGlnCK+LFdN50hsJxTf6HsWjevt4AYgtT9LUVh6qvfO
	AVdLn3MBvsYTjKH7jfZLdPG7RpBPzO3JmOwCeiakkl2YUniY8xEHeQ/w
X-Gm-Gg: AYBFou1bWur1OsqwaWL1ncQ37J1OV8xVB8MBN3wniJRDPheSGNj9kPc05Ls71pgjomX
	BpQ6DuG8g77P2fqTjb3tuE+Vt4psR1dzrliWKSn2h5l+HJXRaYLYNPXdc3Jh6I+Krqz32cwoDNM
	uR2xCi0rsJ13L7btOGcaoCl0vuwkRqi/4j9YoNHY2qVRf/rcWVZJlPP83SFtMFy0lthrKwh8gGR
	LPExCmQIqL7HBkFboyt6LkueDpSs5UPyKfX/a3XsalU3N4wwSLBg/geLrN+SO7c77UNr9GC8qwW
	A0HaZ2yv4P8HpaRBS6r8xSuGg8bvkOeiPOP828np8WIqHq2Vq9VW5OiXVcDbg8WmNuzJoDFMiGc
	AarrfWLa097leKTuRQKd+Hou15/pu56uNdZ3/Yr9y3ZcXype7SOR7kcrb73qPdZ1xXwoXsSdmLi
	DLugZ6hRAfXpMYfZ53ep/P1LH138pEa6lCP0Rwf/PYe59JtF4tj1l2SQ==
X-Received: by 2002:a05:690e:450d:10b0:66f:7d56:cf77 with SMTP id 956f58d0204a3-66f87582dabmr3200931d50.26.1788292789853;
        Tue, 01 Sep 2026 12:59:49 -0700 (PDT)
Received: from adriano ([181.173.249.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-86c186d60f8sm1528187b3.36.2026.09.01.12.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:59:49 -0700 (PDT)
From: Adriano Cordova <adrianox@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Adriano Cordova <adrianox@gmail.com>,
	syzbot+2a3de29133b40e8f69f3@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH] media: as102: initialize mutexes before registering frontend
Date: Tue,  1 Sep 2026 15:58:56 -0400
Message-ID: <20260901195856.19910-1-adrianox@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bus adapter mutex and the stream mutex are initialized after the
frontend has been registered, but the frontend's stream control
callback as102_stream_ctrl() takes the bus adapter mutex, which can be
used before it is initialized:

	INFO: trying to register non-static key.
	...
	as102_stream_ctrl+0x27/0xc0 drivers/media/usb/as102/as102_drv.c:259
	dvb_frontend_open+0x7eb/0x1410 drivers/media/dvb-core/dvb_frontend.c:2825

Initialize the mutexes before registering the adapter and frontend.

Fixes: 41b44e041811 ("[media] staging: as102: Initial import from Abilis")
Reported-by: syzbot+2a3de29133b40e8f69f3@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=2a3de29133b40e8f69f3
Cc: stable@vger.kernel.org
Signed-off-by: Adriano Cordova <adrianox@gmail.com>
---
 drivers/media/usb/as102/as102_drv.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/as102/as102_drv.c b/drivers/media/usb/as102/as102_drv.c
index 6b1d3528a0a7..a6dd675689f5 100644
--- a/drivers/media/usb/as102/as102_drv.c
+++ b/drivers/media/usb/as102/as102_drv.c
@@ -287,6 +287,12 @@ int as102_dvb_register(struct as102_dev_t *as102_dev)
 	struct device *dev = &as102_dev->bus_adap.usb_dev->dev;
 	int ret;
 
+	/* init bus mutex for token locking */
+	mutex_init(&as102_dev->bus_adap.lock);
+
+	/* init start / stop stream mutex */
+	mutex_init(&as102_dev->sem);
+
 	ret = dvb_register_adapter(&as102_dev->dvb_adap,
 			   as102_dev->name, THIS_MODULE,
 			   dev, adapter_nr);
@@ -341,12 +347,6 @@ int as102_dvb_register(struct as102_dev_t *as102_dev)
 		goto efereg;
 	}
 
-	/* init bus mutex for token locking */
-	mutex_init(&as102_dev->bus_adap.lock);
-
-	/* init start / stop stream mutex */
-	mutex_init(&as102_dev->sem);
-
 	/*
 	 * try to load as102 firmware. If firmware upload failed, we'll be
 	 * able to upload it later.
-- 
2.51.0

