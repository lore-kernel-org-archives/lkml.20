Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794349484;
	b=1ZhlNHIE9LQ1eHtq2AtNPPbLmSL6DI/lTry2L96fpDRSSLjnPDMyaw7SWvmdtmlp+FWT
	 PH4FiCPErW54as5J92h7dTSB3KxPatV5TnGa555zwvkAGkhlifpZPiw2Q+8kro2eAgPDJ
	 GthCy0ZV5qtQgmk+KqeZkzLpdVRueGw1m52FKWtMjZVmXqz0I4UQcXdsKNgi6AWcd8V//
	 ypZyZVEWpSYc+4e5WHTh/gb+HoIq3dGpuMdXWIDJtNPRlfcSTpD8WKGnaxjWHvThnVXVb
	 KfRPSPz+3wagvDU/EqspWuIIsryQ1TG1IVXpAhO/tSSosnBB2fv9juOnKaY/6/LpDIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794349484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=J78cfmAO5c/8RMgwJFrdko9q9pXZgG9FioRV6oWOxJU=;
	b=yMwuzJ8ER8SRiYkUHbhLA5YoYVi4f6IgZvPctgjP4tO3Wi0oIeCzhQn+cECOtyhxa4Ag
	 tQioxEt7EV/3F5ZQRQsZs2BB37RF0M0v1mHqbcV9x+BUcA3IUQ7rnKUUfVugZOIcycCZM
	 2tStu+0F//6d2EzgdPpYRUpsRptiHHCsTWwOxsR0Z0DNjr0Zo7swD42iaraSiDBviuw4U
	 WrEKVyxQPmcc11ZvCIqinU7lXVTfZj+o0dX80QZV7k7qVuAeCD5Xrd9tfChYe/5Hg/UZ9
	 bK/RxtnIXKWN+Bji4z0+0SsC6Sxw4GbA6gL74gjL1WlijPpzTyLbppxsTZKAVVfqoRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yeDk6ZyC;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6162C606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:24:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6162C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yeDk6ZyC
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1438d9363fbso1506783c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794349484; x=1794954284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J78cfmAO5c/8RMgwJFrdko9q9pXZgG9FioRV6oWOxJU=;
        b=yeDk6ZyCfgkxoDEXhjOxP2cxy0HvzUprG9b7m9aQw1Ez0wR/ORih8c8h1I323tq1qL
         lxAev85gOIEZiqzk5o2VnNO04ABsG+7gwxlapO3jJQ53DpT5jSy7Sv1cdBnFFLK3yJnJ
         ILHHMSqUsslekSbydXMT8h+h91B29o9MhGfKoTsMSDKquflV1fkdNlZCSHrwJ1YHsKtD
         FWCNVseWOEYdEwjUOKCNK1HTKRlHzeDciT4qF7wMhgPUlSwsMvMi9p7TyqXri0Iqt6nM
         djPXlKN/D13/zkyJ1rKxnOofrAgwb7FTea50bgrTNiQEs8vtBeBATfocmggQo0JXoXCJ
         +sVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794349484; x=1794954284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J78cfmAO5c/8RMgwJFrdko9q9pXZgG9FioRV6oWOxJU=;
        b=Nhxp5aerksl62tlceXHCon80XOi3JCgGK/m8NzBkMo/9qP6js/sLl4epGG312tJuzj
         OpVsdvn4hjM6WLGlnJq4R5VIdwoA20ouq8p6nj0boZpkG9L6lDD+UNx/6a6CGTVg2iG+
         u/+LPY/fAzjGtDUt8H1N7dDUO2AQQwLmqfmRnUYHwmIfXt3FT7qJd51ggTnvjW4FvhSR
         QWqRyxEMrMc+8aPRtpqRUaWpQ6L57kbO0scxcvlRAyOGJtwd7b4ALy9hXDFM1MdkHVU9
         P7HMJX9Sy2SVudVlFCD1j7hFgpRnkwojj2HVm6uRlaGEeXHmkqhSYWvowA+m8s8p1Pss
         B4kA==
X-Forwarded-Encrypted: i=1; AL+hErGgHOH0QquDZUGZ9nGl4zsR7QBrRsYLCpPEbOxXLr93G+qxLuo3lqFuY3AKntWnD7dzp6IQBsPvOEgjX2o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FLkMQ5SEfbpAvKoRExxMUVr+4HVWQRUIqi2reMqH3oaOAI6G9
	B/dOYSq3GTvS4t+IRps45KVWiwWJLQeEw7TDcBJZvrbQwqPwvdRFItL3
X-Gm-Gg: AYBFou16HRF6GbKn0t3q01kz/xv0S/desRRkj5HywJ7co55l8HG16/jyRP+sNRe5yVp
	6g7VbOzgkJHd1D+WHFA1Kc44+DurlEvtq8gHB6EgnSaRpmIAPiaBcZjalSC7W/M8kqVdMn1vlmN
	f952YBxpSE2n3W3cST0DrQSj56pfy0xLoSX+tR65hndKDfSq7S51f6qWHSystXBr7gaWZrKdTfI
	C+uZN3M5YHzZMFpdi3c+028q6ikrp/L75qjlM39B5TlbCcHVXTh6v8o2yYIJDC8VGZOz9seiIgq
	KqrPXXQVLJ1Ab66x7RfQYYpLhfTsGb+005fICgNLVplI73c2yr1sVKQyEbylxze34Eg4xNGxAo4
	MNMs6DzqT6QSjJN45KPVu/e2Kk/ca0ZPLQUieqL+JXHlClGCdZH8XbRiF81S7IBpY7AO6hKzVG2
	GhNfMi7X31xLvlRENyQR5Z3Qd8BEP9fCX+kbu1FCS0NDH+jx+d6Fm+IuZl5u8XuUFAUlROLuo38
	KzrWTrPigQ9k/UuEXtR9pf4a9zGnd4G3WR6ufTWeG2WqFVQ1XiC21pmaS74jNWsfqiYxkDhttfx
	7spuiSjM1ju5CoyBEyzNS4sN1K3OGWjqqN2iEbO/hULfm5qDH0Dzk5zQ2H0=
X-Received: by 2002:a05:7022:2594:b0:1b3:a8a6:b55e with SMTP id a92af1059eb24-1b3bef4c391mr1435246c88.24.1794349483523;
        Tue, 10 Nov 2026 14:24:43 -0800 (PST)
Received: from localhost.localdomain (wood.seclab.cs.ucsb.edu. [128.111.49.37])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b4efc2sm8424966c88.15.2026.11.10.14.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 14:24:43 -0800 (PST)
From: Praneeth Balasubramanian <praneethb2002@gmail.com>
X-Google-Original-From: Praneeth Balasubramanian <praneeth@ucsb.edu>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Praneeth Balasubramanian <praneeth@ucsb.edu>
Subject: [PATCH] media: hdpvr: Hold io_mutex when restarting streaming after a timeout
Date: Tue, 10 Nov 2026 14:24:35 -0800
Message-Id: <20261110222435.205738-1-praneeth@ucsb.edu>
X-Mailer: git-send-email 2.25.1
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

hdpvr_start_streaming() expects dev->io_mutex to be held by the caller,
as its comment says. Every caller takes it except the restart in the
read timeout path of hdpvr_read(). Commit 6bc5a4a19275 ("media: hdpvr:
fix locking and a missing msleep") added the lock around the
hdpvr_stop_streaming() call there, but not around the restart.

The restart checks dev->status before its USB control transfers, which
can take seconds, and sets STATUS_STREAMING afterwards. In that time
another thread can start and then stop streaming with
VIDIOC_ENCODER_CMD. hdpvr_stop_streaming() sets STATUS_SHUTTING_DOWN,
drops io_mutex and waits in flush_work() for the worker to exit. The
restart then sets STATUS_STREAMING and schedules the worker again. The
worker does not exit, so flush_work() can wait forever.

Take io_mutex around the restart, like the other callers. A restart
that races with a stop then sees STATUS_SHUTTING_DOWN and returns
-EAGAIN.

The missing lock was found with an LLM-based tool that checks callers
against the locking rules stated in kernel comments.

Fixes: a503ff812430 ("[media] hdpvr: fix interrupted recording")
Signed-off-by: Praneeth Balasubramanian <praneeth@ucsb.edu>
---

Notes:
    This was found by an LLM-based static analysis (GPT-5.6) that checks
    kernel code against the rules stated in its comments, as part of research
    at UCSB SecLab. The patch and changelog were drafted with Claude Opus 5.5.
    I reviewed the patch and take responsibility for it.
    
    Testing: builds without new warnings with W=1 (x86_64). Not
    runtime-tested, since I do not have an HD-PVR. The hang is from reading
    the code, not from a reproduction.
    
    The patch applies to mainline 9ba46df34488 and to next-20261109.

 drivers/media/usb/hdpvr/hdpvr-video.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/usb/hdpvr/hdpvr-video.c b/drivers/media/usb/hdpvr/hdpvr-video.c
index 4290b2367fa3..b7afcebe80e6 100644
--- a/drivers/media/usb/hdpvr/hdpvr-video.c
+++ b/drivers/media/usb/hdpvr/hdpvr-video.c
@@ -475,7 +475,9 @@ static ssize_t hdpvr_read(struct file *file, char __user *buffer, size_t count,
 				 * streaming.
 				 */
 				msleep(4000);
+				mutex_lock(&dev->io_mutex);
 				err = hdpvr_start_streaming(dev);
+				mutex_unlock(&dev->io_mutex);
 				if (err) {
 					ret = err;
 					goto err;
-- 
2.25.1

