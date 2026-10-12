Received: from mail3-165.sinamail.sina.com.cn (mail3-165.sinamail.sina.com.cn [202.108.3.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D315048E0CF
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791808937; cv=none; b=ef/6GzyHpskJaSAUZzmFYlE/WP9is84ZE+28BNGVemSMZ74mn0vzvM1RdxGrhKTKuZRUWmdkRfrqcDb87eNGZgYuEhvyx5opwLXvj9CNwsGWTjcWZ8C7adxoo+CRSNxrdqzW9nroAuOlcsKx6+eL4BsH9WYuJqMrFduI+6oCBvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791808937; c=relaxed/simple;
	bh=MemcRqvPf1DQ+OoWL3qafJaRfu5TFI/NA3IVLWbBwj0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n7+L6VckE5WDfJMflbeRmZeJ8jNJmwztiFX7NMdKvFkqQtZnwp3u61RoOYBVW/9/DyPhiZVCYNHn/0I+pEIYb5jRzyGlIDmvr1SSXujD31vW+Rlf3PH+bEE2/0UkI25sBoe6OVF0+jVW6VcU7SYxrjQbua0g8PLhGLsbZPGvE0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=BNaMBJPb; arc=none smtp.client-ip=202.108.3.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="BNaMBJPb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1791808933;
	bh=cqDYoz+42AYAEauIlMjfBYx+CERGy1hVcjX2zhbtq2Y=;
	h=From:Subject:Date:Message-ID;
	b=BNaMBJPbCcyb3+USb5JVp7HwAtAg9USPbrsPuNpZS/5tdE10ke2aufJ8XEEnfJcKK
	 oufq7IQOH+UHTIbfTJbJBVC3lxi7RnCTuPs2HPo+pU08hiNj1uGNrckudjvGonVx3/
	 klR9I5X+yuga3ZH5yuqm2DdFyScN6NxCF6HGzXGU=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.62.194])
	by sina.com (10.54.253.33) with ESMTP
	id 6ACCD59E0000622D; Mon, 12 Oct 2026 20:42:09 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 3916966685065
X-SMAIL-UIID: 0FC1C7C6463E4EC281AB0F0130F8E0FF-20261012-204209-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+c98b21427617af7f547a@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [nvme?] BUG: corrupted list in nvmet_fc_remove_port
Date: Mon, 12 Oct 2026 20:41:56 +0800
Message-ID: <20261012124158.498-1-hdanton@sina.com>
In-Reply-To: <6acbc835.a150a118.27e199.003c.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Date: Sun, 11 Oct 2026 10:32:37 -0700	[thread overview]
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    a5ebb76233b7 Merge tag 'edac_urgent_for_v7.3_rc7' of git:/..
> git tree:       upstream
> console+strace: https://syzkaller.appspot.com/x/log.txt?x=1494923e580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=df4bbab1c2172b9f
> dashboard link: https://syzkaller.appspot.com/bug?extid=c98b21427617af7f547a
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=126a0f15580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=166a0f15580000

#syz test

--- x/drivers/nvme/target/fc.c
+++ y/drivers/nvme/target/fc.c
@@ -1620,6 +1620,7 @@ nvmet_fc_free_pending_reqs(struct nvmet_
 	}
 }
 
+static DEFINE_MUTEX(tgtp_mutex);
 /**
  * nvmet_fc_unregister_targetport - transport entry point called by an
  *                              LLDD to deregister/remove a previously
@@ -1637,6 +1638,7 @@ nvmet_fc_unregister_targetport(struct nv
 	struct nvmet_fc_tgtport *tgtport = targetport_to_tgtport(target_port);
 	unsigned long flags;
 
+	mutex_lock(&tgtp_mutex);
 	spin_lock_irqsave(&nvmet_fc_tgtlock, flags);
 	list_del(&tgtport->tgt_list);
 	spin_unlock_irqrestore(&nvmet_fc_tgtlock, flags);
@@ -1645,6 +1647,7 @@ nvmet_fc_unregister_targetport(struct nv
 
 	/* terminate any outstanding associations */
 	__nvmet_fc_free_assocs(tgtport);
+	mutex_unlock(&tgtp_mutex);
 
 	flush_workqueue(nvmet_wq);
 
@@ -2919,6 +2922,7 @@ nvmet_fc_remove_port(struct nvmet_port *
 	struct nvmet_fc_tgtport *tgtport = NULL;
 	unsigned long flags;
 
+	mutex_lock(&tgtp_mutex);
 	spin_lock_irqsave(&nvmet_fc_tgtlock, flags);
 	if (pe->tgtport && nvmet_fc_tgtport_get(pe->tgtport))
 		tgtport = pe->tgtport;
@@ -2933,6 +2937,7 @@ nvmet_fc_remove_port(struct nvmet_port *
 	}
 
 	kfree(pe);
+	mutex_unlock(&tgtp_mutex);
 }
 
 static void
--
