Received: from mail3-167.sinamail.sina.com.cn (mail3-167.sinamail.sina.com.cn [202.108.3.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DED3CB54E
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791791993; cv=none; b=T/cE1HR/5LvaXdrlKfFAplBijPenqkXq2cZU/g8POWJbdaak9HxQ/EVyHRRlLDTD7s46l7GDGEX4SSPoTkyp8BZMqdhB+lfNi3VAm1yHzgHdFyGZ2Q22sYrb+axmbyZWaehwTEzZsAMOMZ6vd3RVr54kSuxE8f66LxOkOZr4xFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791791993; c=relaxed/simple;
	bh=edrKY4TvRJ368ajENKHsCNPq/qRfVm9wmemw7Q7qP1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XDVgc9gEkvTnoSHoYMU7kqiTsSIjFfQ2iYtIzZM+f/8/wDtJspyMw9ho/bDsEz+ZNP2Fri6x/pyZU6GgGfXkRM52Matuox6iSXvFfgGa8XqJMKg23hg2vdm3oytekEjHd3tHsyNX5fqcr9k2j3KjxISKBFWWBZMQk6AZntataDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=oZUKpfUa; arc=none smtp.client-ip=202.108.3.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="oZUKpfUa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1791791986;
	bh=Iapu6a7tccbi03hUneV5+JK98JdHBKTi8RQoWHIxZBo=;
	h=From:Subject:Date:Message-ID;
	b=oZUKpfUaYEbwcUC8Ss/7JCNi01CBpO2dni25fgpNc5/Vv5gdZKpabBAizHfr22W08
	 xokotjX1hwk6sL6o2R6jePEyOOiJAXuduNrlqALSXKv/efssEH7vgamgxhOwa74Bei
	 8iqgaYXx/0ZJlL5Fc9sgVUDWrthJqWVBYbn6LbXg=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.62.194])
	by sina.com (10.54.253.33) with ESMTP
	id 6ACC934600005C82; Mon, 12 Oct 2026 15:59:05 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 5773696685066
X-SMAIL-UIID: 1744AB75C0F3497D95B44021345AEDDD-20261012-155905-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+c98b21427617af7f547a@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [nvme?] BUG: corrupted list in nvmet_fc_remove_port
Date: Mon, 12 Oct 2026 15:58:53 +0800
Message-ID: <20261012075854.435-1-hdanton@sina.com>
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
@@ -1273,7 +1273,14 @@ nvmet_fc_portentry_unbind(struct nvmet_f
 {
 	unsigned long flags;
 
+	if (!pe->port)
+		return;
 	spin_lock_irqsave(&nvmet_fc_tgtlock, flags);
+	if (!pe->port) {
+		spin_unlock_irqrestore(&nvmet_fc_tgtlock, flags);
+		return;
+	}
+	pe->port = NULL;
 	if (pe->tgtport) {
 		nvmet_fc_tgtport_put(pe->tgtport);
 		pe->tgtport->pe = NULL;
--
