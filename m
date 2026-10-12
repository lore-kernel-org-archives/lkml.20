Received: from smtp153-165.sina.com.cn (smtp153-165.sina.com.cn [61.135.153.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567D53BE627
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791801548; cv=none; b=BD3vCrOy3QWfBKKuMTK33A2mJhXe7lnualA4TcNOUUcUUrWiAFA57BKVajdVDCFxzHmtXJNdu+3UIuY+xcVJtAUmHp5Ic2GspRyq/43rcYJww/PmEPyn2NVznZejRmqqeGOar0JHb1DPEloLhnH8FaqSqEnKIJKmkmFzqALGGTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791801548; c=relaxed/simple;
	bh=X0JJliFX0Yy3L+U6hmHheiZao3abuIvWppZAjK7hRfU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pkEXK7JNRPIJMlAx0bYgwetUZdmorL5fblRzCI9k2RCBw/ACeBFgmYezlSbwoNPvjtcU03XOd+1rRjKUHqS/yWLCnNr8LAgWpvwyAbOATxAyNyV23ghyYQqtHsiEK7/UTcRbXzZDVq2wglSIMcQPsNgGC5s/jW4Tf8bwMzdn9mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=pBcFmzRP; arc=none smtp.client-ip=61.135.153.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="pBcFmzRP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1791801540;
	bh=ukVarLXrPh83UpZOzwe0wfxI9EU/SJwxx2o0Z1/ws4Y=;
	h=From:Subject:Date:Message-ID;
	b=pBcFmzRPnGTjxur8Duj+m7JXCS2iet9Vri5JGStLVKITmpPrJRDvjwOO1W5uWcOtg
	 VdjBFMovYX2QAR3vHjjUuNLU7+JdiRiB0bQuAwidqOvQKKQJv2Fw5SC7CdQCTuLZYF
	 +fISs+N1rW2xY3A6DAlbtqVDQebYfhUU0zJZbSeU=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.62.194])
	by sina.com (10.54.253.32) with ESMTP
	id 6ACCB77B00004D3E; Mon, 12 Oct 2026 18:33:32 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 6978254456642
X-SMAIL-UIID: C49E6DC83C2B45ABBA9D7387E5CFBE4B-20261012-183332-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+c98b21427617af7f547a@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [nvme?] BUG: corrupted list in nvmet_fc_remove_port
Date: Mon, 12 Oct 2026 18:33:21 +0800
Message-ID: <20261012103322.472-1-hdanton@sina.com>
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
@@ -2915,23 +2915,26 @@ nvmet_fc_add_port(struct nvmet_port *por
 static void
 nvmet_fc_remove_port(struct nvmet_port *port)
 {
-	struct nvmet_fc_port_entry *pe = port->priv;
+	struct nvmet_fc_port_entry *pe;
 	struct nvmet_fc_tgtport *tgtport = NULL;
 	unsigned long flags;
 
 	spin_lock_irqsave(&nvmet_fc_tgtlock, flags);
-	if (pe->tgtport && nvmet_fc_tgtport_get(pe->tgtport))
+	pe = port->priv;
+	port->priv = NULL;
+	if (pe && pe->tgtport && nvmet_fc_tgtport_get(pe->tgtport))
 		tgtport = pe->tgtport;
 	spin_unlock_irqrestore(&nvmet_fc_tgtlock, flags);
 
-	nvmet_fc_portentry_unbind(pe);
-
 	if (tgtport) {
 		/* terminate any outstanding associations */
 		__nvmet_fc_free_assocs(tgtport);
 		nvmet_fc_tgtport_put(tgtport);
 	}
 
+	if (!pe)
+		return;
+	nvmet_fc_portentry_unbind(pe);
 	kfree(pe);
 }
 
--
