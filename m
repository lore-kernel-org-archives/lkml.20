Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793620984;
	b=0CHbVFJ8nSmA2iULEUa69vzl/5mWuyUW/P+jdQ1qyzRsZQbD1ise/huBljmTm2bwOluL
	 brUdR00shb3s1LTHc86JZVHAsLzX9uqSZL2nVCRcGa5Ce35YcAK2VzP9tlI5V6zxX35zF
	 hSZms/RJT3cNztR4v7SrDpDTTEpEdY8/am5XWdN9a6hriB8E5vqhMHXsdRVXpBvoqPqHL
	 ow7dM+nCfJr1hNbISS5ImSbs0EQIrvXyd/6ZrwIYxbuMzWjzB+r1GLJjl+jgZZPFPQ8vI
	 JjCswGEEc3555C0QyoA3vF0IU2qwsORbwqpqFaw9ZOF4yALpON1jaTxTFBVVsTpVa8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793620984;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=1j6tvj7dTxZZqAAb1TjK73MeIN6sac9EpgfEUpWF2c8=;
	b=Qcq3OKnAkPJ+ggyBGRs1iTImhObBc9oXtLjSy7IsAulGBKRzbiREpsBMXKNELjTHisas
	 R/3tYNsS/k2HGU+IvTMo3lyfzB3VoWRhfGeMLILILq7K4rU5hQz635SNaCZLvgIFcW66f
	 xUXVcx+8sZlgAk1UZnk7nm/xrHKI3BMMCO7O3lEYwHG+HlPDsaSy2OnF+sEQN5Ccxk0sU
	 /ueAtD+Jdo65XqjbeK9BEf9fSED6edu+o1h7dDsvWzaAnU5hyO8QdJgQnhuuB9tYOJBZ5
	 3wqqe5A270tyZxak1D3JDukpfGZrSofHCpFP+rxceaHzjWpizc4mM+yigRoIVaBoa4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF34606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:03:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAF34606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4f8281066c4so3950191b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:03:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793620982; x=1794225782;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1j6tvj7dTxZZqAAb1TjK73MeIN6sac9EpgfEUpWF2c8=;
        b=MUDrY2oSKtYEIyg681CCPfuB3JhoOmVnr+6ZHFzjwpvgxaaCmMLCuWOxxaKYMInnjs
         cxDfzodb0yJNpZINmALUJAfRxCZCYJmtN+IlWQLPRjCtFeZoeVhH42t5yTnZUf+0xu/P
         eK4KelAnexCa5ewtwDcVRslbLwiYFPTQmJpgrUzu4MvD8y9cpq7nGm1o3IblRmjp3cZq
         iJlG6/ktLucIpdVHtNqKdyJkq+HKgxos2BjHP8iu/iVtw62D1nCjEmgwm8GONSDMUWRO
         MU4ykjw6WWJTPN9pWbSMA413YGvpNNUvf4SA/RhFaAlU4H1wZSfTUZQRGasD9DftXu0y
         7VQw==
X-Gm-Message-State: AFq9FYLGwAhPtawck0Ge0SKEbW8fDahL1H2o8kTjVmwTMvrQyX9mZk3a
	5Akf0upCLKxanUMlrEzCH0xuXDySfgN/h8CztUVC/SWk7CVqPnCpgEdork2FZ7cLQuz/QY8PnYU
	pyqlOlQupLuTqpf3CHVY95JTwSPq32M7KZLM1B+sVulLpbIciRdrbDQKMAUI=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:150a:b0:4bc:fbd4:2a43 with SMTP id
 5614622812f47-5640dec83eemr6545362b6e.41.1793620982537; Mon, 02 Nov 2026
 04:03:02 -0800 (PST)
Date: Mon, 02 Nov 2026 04:03:02 -0800
In-Reply-To: <6ae78458.64e51036.15cf6a.0015.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae87bf6.6552420f.2a0efc.0e6f.GAE@google.com>
Subject: Forwarded: [PATCH] media: em28xx: clear dev->v4l2 on v4l2 init failure
From: syzbot <syzbot+54648a6c1187a7ef46a6@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] media: em28xx: clear dev->v4l2 on v4l2 init failure
Author: kartikey406@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master



If em28xx_v4l2_init() fails after registering the video devices (for
example in v4l2_mc_create_media_graph()), the unregister_dev error path
drops the initial v4l2_device reference but leaves dev->v4l2 set.

If userspace still holds an open file handle to a video node, the
structure stays alive. On USB disconnect, em28xx_v4l2_fini() sees the
non-NULL dev->v4l2 and drops the initial reference a second time. The
refcount underflows, em28xx_free_v4l2() frees struct em28xx_v4l2, and
the later close() makes v4l2_device_release() touch a media entity in
freed memory (slab-use-after-free in dev_dbg_obj()).

Clear dev->v4l2 in the error path so em28xx_v4l2_fini() returns early.

Reported-by: syzbot+54648a6c1187a7ef46a6@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=54648a6c1187a7ef46a6
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 drivers/media/mc/mc-device.c            | 3 ++-
 drivers/media/usb/em28xx/em28xx-video.c | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index f8ea7cfe10b2..039ef7d04ac7 100644
--- a/drivers/media/mc/mc-device.c
+++ b/drivers/media/mc/mc-device.c
@@ -674,7 +674,8 @@ void media_device_unregister_entity(struct media_entity *entity)
 		return;
 
 	mutex_lock(&mdev->graph_mutex);
-	__media_device_unregister_entity(entity);
+	if (entity->graph_obj.mdev)
+		__media_device_unregister_entity(entity);
 	mutex_unlock(&mdev->graph_mutex);
 }
 EXPORT_SYMBOL_GPL(media_device_unregister_entity);
diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index 84424284d486..ec4ed2b0e5fd 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -3137,6 +3137,7 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 	 * v4l2_device refcount to zero.
 	 */
 	v4l2_device_put(&v4l2->v4l2_dev);
+	dev->v4l2 = NULL;
 	return ret;
 }
 
-- 
2.43.0

