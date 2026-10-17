Received: from r3-11.sinamail.sina.com.cn (r3-11.sinamail.sina.com.cn [202.108.3.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB293F9F3C
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 05:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792215927; cv=none; b=NDr5/rPbKAPMJ+iDEILXWyBngwLW/whczIBuwiB08ZfqSpfhn87ikH8jqM6vLoYH3ThslT6oT2dJ2prxdoROQZujECMeJnohVBJzAv1FnDIpure1q+6ObZ9hkVDVSFnbH2Ch7KEkaxifNIXr5h4wkdhg3oXGb/k+MgoqAKzykEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792215927; c=relaxed/simple;
	bh=4Z06arjgYdjBh2GrWJg9yOvseOZAdbJxeqp9Hy+zvKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vFtOXWImt65tlrtp/FY8e2y/cURmTi1wSak2JxgRdSChnMYCyCKE9bcavWoshRibtdOc3slyr/5aCSplMRfcnhfPz2NIG+tmWDlAbH4OAqk9kngp82eJpYmSVCfjBFPQZLexgjVo6FCeub2gV9NzMKKFaZ8nk7yFPOmEBX4PdGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=MJHzl9Ft; arc=none smtp.client-ip=202.108.3.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="MJHzl9Ft"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1792215922;
	bh=+d2KJdB04dQ047eI25m+hGvmBYY5N8jOXMu16DOgI0I=;
	h=From:Subject:Date:Message-ID;
	b=MJHzl9Ft6Ln2u5KXZVjv9QUyVaoIocVq//0C/w6XOCAGeH1NBMBxWQMu6SEdNQZuo
	 WQTINDmXu7EYT0hn5Ua5FfHCmliJ0BGiVzz9gUP6l7CmaAxVh+oegsEUTBQ6IvIxiq
	 zIDTlrgih3VzNGDVxrPE8d7rvM1PV5eAGSzcFTT8=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.254.3.93])
	by sina.com (10.54.253.34) with ESMTP
	id 6AD30AD40000418F; Sat, 17 Oct 2026 13:42:48 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 7281556291745
X-SMAIL-UIID: A09AE63EC7724E98B21F0DAEFE84CE48-20261017-134248-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+c98b21427617af7f547a@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [nvme?] BUG: corrupted list in nvmet_fc_remove_port
Date: Sat, 17 Oct 2026 13:42:34 +0800
Message-ID: <20261017054235.608-1-hdanton@sina.com>
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
@@ -1271,9 +1271,17 @@ nvmet_fc_portentry_bind(struct nvmet_fc_
 static void
 nvmet_fc_portentry_unbind(struct nvmet_fc_port_entry *pe)
 {
+	struct nvmet_fc_port_entry *entry;
 	unsigned long flags;
 
 	spin_lock_irqsave(&nvmet_fc_tgtlock, flags);
+	list_for_each_entry(entry, &nvmet_fc_portentry_list, pe_list) {
+		if (entry == pe)
+			goto out;
+	}
+	spin_unlock_irqrestore(&nvmet_fc_tgtlock, flags);
+	return;
+out:
 	if (pe->tgtport) {
 		nvmet_fc_tgtport_put(pe->tgtport);
 		pe->tgtport->pe = NULL;
@@ -1643,8 +1651,10 @@ nvmet_fc_unregister_targetport(struct nv
 
 	nvmet_fc_portentry_unbind_tgt(tgtport);
 
+	spin_lock_irqsave(&nvmet_fc_tgtlock, flags);
 	/* terminate any outstanding associations */
 	__nvmet_fc_free_assocs(tgtport);
+	spin_unlock_irqrestore(&nvmet_fc_tgtlock, flags);
 
 	flush_workqueue(nvmet_wq);
 
@@ -2927,8 +2937,10 @@ nvmet_fc_remove_port(struct nvmet_port *
 	nvmet_fc_portentry_unbind(pe);
 
 	if (tgtport) {
+		spin_lock_irqsave(&nvmet_fc_tgtlock, flags);
 		/* terminate any outstanding associations */
 		__nvmet_fc_free_assocs(tgtport);
+		spin_unlock_irqrestore(&nvmet_fc_tgtlock, flags);
 		nvmet_fc_tgtport_put(tgtport);
 	}
 
--
