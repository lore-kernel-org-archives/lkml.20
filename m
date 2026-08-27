Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE8B3822A9
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 04:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787804577; cv=none; b=Lup6Y3BSV25BzNxBI0wF9yRYeNj0cFWQn9l5axCqXCqZW/hzJfyOKOosNV94RyKAoJ9st8+1/e/sjFT7bPtaR3iF6rqIczPHIFWCBAVDwtfeCT7LefrpCTV4jCVdO0j01wCt4q/IkW+aZ3SKeKs/RvGg/yy9igo0eo/Fa5NNAQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787804577; c=relaxed/simple;
	bh=i5j4N3jc9IGaXr4Y8SA04YnztwfrViAVW8ve5zNs9Go=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xt2PuJR8ysvXThs86HxLGchji3WwSWrekzP1NlVUhhhBmmK6hlpvH5wKdGuAeMjRYog8HnulgjqcGpUhpWyxrZxoT23WDd7mCvautw5xsY8acaZBrgq6ozm1HSCqS4v0gb7/AlVkQjcdUT4tUFPtSuAKXd8HSKR8Ju1OOBWzduo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JPEiYx8t; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JPEiYx8t"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so2105279a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787804575; x=1788409375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7U1BnFeXoGQfM9V4KkXP+ZPWf072nK5WtXag0RShRII=;
        b=JPEiYx8t50DXnUk7PJlui5zwWPbxoKKJbKF9HnYBMEJWch61cnAHjw9A9F6R59ODle
         /6ycmoQ7IxQr/JvIGoSYL0B/rY2dOjFJRLrrFehQYpxA9zFPJw8YohJ20lkJMojeK1v8
         M/gBa+NsGH99tbOIUdQgpibMw1LPhEGaqFfovYo+VKp/X6kv1+deCcmf4hIJYHV5AMlj
         RGN6iS9s5bF2sPpeEzGsakGoPgtzxNMPJhOskQhJXzUpl4/4oyjuYutUD/6lwf7s7EHh
         0QA55NjCeGenkUYiQvB5P8vgE8YgCbo59QYohSirur3vkdbAhRq4Iz6vyFtI+yB9QlKT
         Qq4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787804575; x=1788409375;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7U1BnFeXoGQfM9V4KkXP+ZPWf072nK5WtXag0RShRII=;
        b=LnBIulYkZXlsKTW3FN4Ti4nBrIOPnQrxClqgTe78JD0SBgYioCecmEZBSyEIYQEfC2
         xbmlM3sIyZ/x/eVHzHFvLoJkgA6rols9W4BGHUogFCnq4UDBJO6Q/xeSOMWCChKgWFcp
         GuMqlHqJHjDhY/+qMRFOwSxUEMn+fdA9aHtuQPWLXKchOkwoCTLRUXA8FosxZcI4n1zG
         FSllgvLcsF4Hm5RQu6Uf/PlhozcxxA7UXQH5Ty0uU5Gud2y5bkTM8Vu/X/ooMjZyina8
         MrRNoSr+RPkhyARMUtoA5u9OxDr8whroBrBb74RPPRTwyf2/vTg4ZDVEvM7G/zgUUzEd
         NNcw==
X-Forwarded-Encrypted: i=1; AHgh+RpZilnK1evw8NS2yD8rTgsvv4fW3rAglLh7AbcZwI3zORv37aLChnmSbLCbIAs/QIuzw1snvAs64MAuYbs=@vger.kernel.org
X-Gm-Message-State: AFuF++kmCLxsDGx9aTlUOXvGTtaVlr5r4ZBBHpC+306gAT+y4Zsv+ZrO
	82s2wtq1s9hJMYf90qXZsvplfPsxpAiFOlZ1WY8i6z+Jr4UsFtk3cowq
X-Gm-Gg: AR+sD13CThcFUbaC7WpPBh/78LN62NDMW+lXcwPn8tYC6qpnskhFVkdgVjKDf2O+REJ
	OnzfCaaE8XpE8nyH7UR2empLE8g5aaix+DUkXKWkMoMSV1qZc0fZdqJ2/savNWowO5u1pDIppFi
	oPedtMHJ4fSTl3JVaYnzegTpf0iGM8/XXSOYvMAhuqfzdhd0J1XNKlSQAMQqSxuhxtUnMn7Pu4Y
	fcx3FKhI2EZZapc+/L0PL6pGXr/KQpHd3nIoEdzwBOaEFNvMcr6XU/YHp02lCp22bP86ZiohD6a
	c6/pzCyj4PcDa4SThj701f6UxbGwrv40kNoAm0waidVJhYH9IarXSNK1zwVNbSz0idDBNP0xoPB
	0pV8Wk3vT38G+7ugJZIlVtUYKdQAG4wTFN03wqBB68Tg+LxmV6RMSC7rrj+wMN3ESKswU9v6qU5
	yAtdIi+A2p8Lruybw5HmuT0/ipSvb7dP91kTzQ0mEMoMc7WHeRlmdJxvnEjYsNiky7tQ==
X-Received: by 2002:a17:90a:e70f:b0:38e:11ba:992c with SMTP id 98e67ed59e1d1-3966d4587b7mr25543337a91.12.1787804573880;
        Wed, 26 Aug 2026 21:22:53 -0700 (PDT)
Received: from Default ([2409:40f4:1012:4330:756d:2890:a615:2db9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a905cf38sm19697942c88.12.2026.08.26.21.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 21:22:53 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: dwlsalmeida@gmail.com
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jeffin Philip <jeffinphilip14@gmail.com>,
	syzbot+c7fc4794e59786f5b4dc@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [RFC PATCH] media: vidtv: fix uaf in vidtv_bridge_on_new_pkts_avail
Date: Thu, 27 Aug 2026 09:52:29 +0530
Message-ID: <20260827042229.12561-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Attempting to unbind a dvbdevice that is in the process of feeding
data causes a UAF as we free the underlying device without
stopping the feed first. Fix this by stopping the stream first using
vidtv_stop_streaming(). However, our codepath in the reproducer
(mentioned in the below reply) does not decrement our users
(dmxdev->dvr_dvbdev->users) to 1 after it has been incremented to 2
by our read() in the reproducer, that is only possible on .release.
This can cause a task hang as dvb_dmxdev_release() uses wait_event()
in the wait_queue unless we use a close(fd)(in the reproducer).
Is this a problem? Please advise.

Reported-by: syzbot+c7fc4794e59786f5b4dc@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=c7fc4794e59786f5b4dc
Fixes: f90cf6079bf6 ("media: vidtv: add a bridge driver")
Cc: stable@vger.kernel.org
Signed-off-by: Jeffin Philip <jeffinphilip14@gmail.com>
---
 drivers/media/test-drivers/vidtv/vidtv_bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.c b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
index fd69b4ee16f4..98d918c7f0ff 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_bridge.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
@@ -550,6 +550,8 @@ static void vidtv_bridge_remove(struct platform_device *pdev)
 
 	mutex_destroy(&dvb->feed_lock);
 
+	vidtv_stop_streaming(dvb);
+
 	for (i = 0; i < NUM_FE; ++i) {
 		dvb_unregister_frontend(dvb->fe[i]);
 		dvb_module_release(dvb->i2c_client_tuner[i]);
-- 
2.55.0

