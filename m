Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=219.143.121.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793845004;
	b=M8WGckfvXn5Rokd3ZYxTAMBikvcIf7pJUFLV6/P5dr0xl6Muc3eP1r3KWrKGGAvC0Sl6
	 9wmikmDXR6PRuv6MuJbVdB1sdS4UBf+rp4F8I/+eWGA4l8MDOntNifee/7Ajb4BZ398NE
	 hGSMPReBci/816KlhJQyEcdM6B9uUCXGu7PSV1gsBZQfNHqgkb6uVzeyCVv7WMHE2hTOY
	 AfQc6N/va2XY3ML8lEFe39MLDlHSZbK4NO730FKD89NJbockdVJ7HV+su7xonr4iHiklo
	 CmOYO/XjOreZ5xdN+i9sFF7ADQw1eI2D7GpvwGvulfGP6gwTiQTqOK+5bQb62LtH71g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793845004;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-TLS:X-ENVELOPE-SENDER:X-SOURCE-IP:
	 X-FangMail-Miltered:X-FangMail-Envelope:X-FangMail-Bounce-Flag:
	 X-FangMail-Outinfo:X-CLEAN:Message-Id:X-Fangmail-Anti-Spam-Filtered:
	 X-Fangmail-MID-QID;
	bh=Twiw4KRXHUHQ12rMtoDVbWi7KoiPfJvsi3ucSwrWXEE=;
	b=t0/yk1B99mSPllDgJt2W4k51L9gT1ObVhpOintv8tKdnIQWjWU2bG2/J3AhKAGy5OODB
	 KKfY+xgQ3Ev+rp5TGKsNvKHVj8iIgp4Vz101IeZAzU92m25nPCZhvxhhWLf82e9cOQ/r9
	 tEHXB1o4R55TYP4dv1qOlaARUR+p9F6NF4Pp+rw72MwkOD+iYBeTPvm6bg1s+SRtBcPil
	 R7m3UyXxg/JJeR+cT7IHF73C2B7pW0Ja9awABOsNyX/ZCOsMfW8EdxVKi9qGBHGL36BMJ
	 Am1n8ga9YMN+yE+e+2ODTVvd9XlPoBwLGCfETiP2FTYB9CG3ImWEl2Vc2Ks/rpccp4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=isoftstone.com;
	spf=pass smtp.mailfrom=isoftstone.com;
	arc=none smtp.remote-ip=219.143.121.9
Received: from spam.isoftstone.com (smg.isoftstone.com [219.143.121.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D7C606A328;
	Thu,  5 Nov 2026 02:16:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15D7C606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=isoftstone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isoftstone.com
Received: from ldzh.. (unknown [221.226.109.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlzhangak@isoftstone.com)
	by spam.isoftstone.com (FangMail) with ESMTPSA id 4jKmBz10mpzWNj;
	Thu, 05 Nov 2026 10:16:27 +0800 (CST)
From: zhangdaolong <dlzhangak@isoftstone.com>
To: Mike Isely <isely@pobox.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+b91abe6ef9924496daf8@syzkaller.appspotmail.com,
	zhangdaolong <dlzhangak@isoftstone.com>
Subject: [PATCH] media: pvrusb2: initialize workpoll before error paths in pvr2_hdw_create
Date: Thu,  5 Nov 2026 10:16:26 +0800
X-Mailer: git-send-email 2.48.1
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
X-TLS: YES
X-ENVELOPE-SENDER: dlzhangak@isoftstone.com
X-SOURCE-IP: 221.226.109.28 unknown Thu, 05 Nov 2026 10:16:27 +0800
X-FangMail-Miltered: at fangwg01 with ID 6AEBE6FA.002 by FangMail milter!
X-FangMail-Envelope: 1793844987/4jKmBz10mpzWNj/6AEBE6FA.002/221.226.109.28/[221.226.109.28]/ldzh../<dlzhangak@isoftstone.com>
X-FangMail-Bounce-Flag: 1793844987.6AEBE6FA.002
X-FangMail-Outinfo: 1793844987/6AEBE6FA.002/4jKmBz10mpzWNj/dlzhangak@isoftstone.com/1
X-CLEAN: YES
Message-Id: <1793844992.6AEBE6FA.002.4jKmBz10mpzWNj@fangwg01>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AEBE6FA.002/4jKmBz10mpzWNj

In pvr2_hdw_create(), the error handling path under 'fail:' calls
flush_work(&hdw->workpoll) whenever hdw is non-NULL. However,
INIT_WORK(&hdw->workpoll, pvr2_hdw_worker_poll) was placed near the
end of pvr2_hdw_create(), after multiple 'goto fail;' error paths
(such as v4l2_device_register() failure or kmalloc() failures for
control buffers).

If any of those earlier allocations or registrations fail, jumping to
'fail:' invokes flush_work(&hdw->workpoll) on an uninitialized
work_struct where work->func is still NULL, triggering WARN_ON(!work->func)
in __flush_work().

Move INIT_WORK(&hdw->workpoll, pvr2_hdw_worker_poll) right after timer
and waitqueue initialization, before the first error path after hdw
allocation, ensuring workpoll is always initialized before flush_work()
can be called on it.

Fixes: 29a3006e5209 ("[media] pvrusb2: Remove deprecated create_singlethread_workqueue")
Reported-by: syzbot+b91abe6ef9924496daf8@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=b91abe6ef9924496daf8
Signed-off-by: zhangdaolong <dlzhangak@isoftstone.com>
---
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
index 3c270ef00752..1fb93f4c8471 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
@@ -2398,6 +2398,7 @@ struct pvr2_hdw *pvr2_hdw_create(struct usb_interface *intf,
 	hdw->master_state = PVR2_STATE_DEAD;
 
 	init_waitqueue_head(&hdw->state_wait_data);
+	INIT_WORK(&hdw->workpoll, pvr2_hdw_worker_poll);
 
 	hdw->tuner_signal_stale = !0;
 	cx2341x_fill_defaults(&hdw->enc_ctl_state);
@@ -2567,8 +2568,6 @@ struct pvr2_hdw *pvr2_hdw_create(struct usb_interface *intf,
 	} while (0);
 	mutex_unlock(&pvr2_unit_mtx);
 
-	INIT_WORK(&hdw->workpoll, pvr2_hdw_worker_poll);
-
 	if (hdw->unit_number == -1)
 		goto fail;
 
-- 
2.48.1

