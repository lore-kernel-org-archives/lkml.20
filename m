Received: from r3-23.sinamail.sina.com.cn (r3-23.sinamail.sina.com.cn [202.108.3.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36AA4594E
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 01:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792286365; cv=none; b=i6E9GDngHii7CByAga3EdB69VWmO6kPcne1iZ9yBCYMj/ewEiXYnS98YKJ3cdiLQ228yLao1H1w0/jIU1Aa3n6Fgp4kicP4i0fGzzMIGL6FIsVk2nrUhfXDXJ0YtnaG+2I6Ti8aNTyJpZ5bGWqsPXIIi/G0dCzeNlS0km4iR72I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792286365; c=relaxed/simple;
	bh=Tm+b5u/qrdxZHH7pbcE93/+dL3/5x0KwR5V5mU2ooWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GAW6IauZD6/GzExZBcQKWA35lsqJWfFLchUO+L+VW6m8lpZxO0juF/jlHdtTMc7Q7QH9UC7jIcoZ5MiSNCSI13KSzpLD3a4/FkyYaGZMSfVGgJLEzqTzphLo0t9SaCZN8oxk9OSEmdLoRp4rg19z3q5bq47QfAKMfIrWOUVgEpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=bObcn6C4; arc=none smtp.client-ip=202.108.3.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="bObcn6C4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1792286361;
	bh=YQMrKi/h/RvwgPWFKGo/FTNW9QoVCRH3iru1yNa4pFo=;
	h=From:Subject:Date:Message-ID;
	b=bObcn6C4PYPjhARXerfXgnLSZkTpEL4EGtHAQcyca5M9VTrPKs6mgbH4kpbreIS/2
	 bXEgVgGsYzVXgkpZ+USL3TC30OZSHZX9ZD5C5Iuz1XB7e/3DgB5V8F9i6UY750vvFa
	 Xf6ECJJ8o1HYqNmIhRATj4BcHTBRnf7ZygYVFA6o=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([221.216.116.228])
	by sina.com (10.54.253.31) with ESMTP
	id 6AD41E9200005591; Sun, 18 Oct 2026 09:19:17 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 4832746816308
X-SMAIL-UIID: 290C255286CC489AB4F00453ACD92C52-20261018-091917-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+c98b21427617af7f547a@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [nvme?] BUG: corrupted list in nvmet_fc_remove_port
Date: Sun, 18 Oct 2026 09:19:04 +0800
Message-ID: <20261018011905.671-1-hdanton@sina.com>
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
@@ -113,6 +113,7 @@ struct nvmet_fc_tgtport {
 	struct nvmet_fc_port_entry	*pe;
 	struct kref			ref;
 	u32				max_sg_cnt;
+	int				assoc_freed;
 };
 
 struct nvmet_fc_port_entry {
@@ -1271,9 +1272,17 @@ nvmet_fc_portentry_bind(struct nvmet_fc_
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
@@ -1414,7 +1423,7 @@ nvmet_fc_register_targetport(struct nvme
 		goto out_free_newrec;
 	}
 
-	nvmet_fc_portentry_rebind_tgt(newrec);
+	//nvmet_fc_portentry_rebind_tgt(newrec);
 
 	spin_lock_irqsave(&nvmet_fc_tgtlock, flags);
 	list_add_tail(&newrec->tgt_list, &nvmet_fc_target_list);
@@ -1474,14 +1483,20 @@ static void
 __nvmet_fc_free_assocs(struct nvmet_fc_tgtport *tgtport)
 {
 	struct nvmet_fc_tgt_assoc *assoc;
+	unsigned long flags;
 
+	if (tgtport->assoc_freed)
+		return;
+	tgtport->assoc_freed = 1;
 	rcu_read_lock();
+	spin_lock_irqsave(&tgtport->lock, flags);
 	list_for_each_entry_rcu(assoc, &tgtport->assoc_list, a_list) {
 		if (!nvmet_fc_tgt_a_get(assoc))
 			continue;
 		nvmet_fc_schedule_delete_assoc(assoc);
 		nvmet_fc_tgt_a_put(assoc);
 	}
+	spin_unlock_irqrestore(&tgtport->lock, flags);
 	rcu_read_unlock();
 }
 
@@ -1643,8 +1658,10 @@ nvmet_fc_unregister_targetport(struct nv
 
 	nvmet_fc_portentry_unbind_tgt(tgtport);
 
+	spin_lock_irqsave(&nvmet_fc_tgtlock, flags);
 	/* terminate any outstanding associations */
 	__nvmet_fc_free_assocs(tgtport);
+	spin_unlock_irqrestore(&nvmet_fc_tgtlock, flags);
 
 	flush_workqueue(nvmet_wq);
 
@@ -2917,6 +2934,7 @@ nvmet_fc_remove_port(struct nvmet_port *
 {
 	struct nvmet_fc_port_entry *pe = port->priv;
 	struct nvmet_fc_tgtport *tgtport = NULL;
+	struct nvmet_fc_tgtport *next = NULL;
 	unsigned long flags;
 
 	spin_lock_irqsave(&nvmet_fc_tgtlock, flags);
@@ -2926,9 +2944,11 @@ nvmet_fc_remove_port(struct nvmet_port *
 
 	nvmet_fc_portentry_unbind(pe);
 
-	if (tgtport) {
+	if (tgtport && next) {
+		spin_lock_irqsave(&nvmet_fc_tgtlock, flags);
 		/* terminate any outstanding associations */
 		__nvmet_fc_free_assocs(tgtport);
+		spin_unlock_irqrestore(&nvmet_fc_tgtlock, flags);
 		nvmet_fc_tgtport_put(tgtport);
 	}
 
--
