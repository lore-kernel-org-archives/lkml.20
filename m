Received: from r3-23.sinamail.sina.com.cn (r3-23.sinamail.sina.com.cn [202.108.3.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB67F309EF2
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 08:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792311225; cv=none; b=jHU/PkyaAKqsD66l1EqL+xr5ue595/HeEBPsr9LrPvdkHkIB/PoIbZkmkXWqrMY+4fmIFEOrv2DRdrA5ywez2VBErk/Pqg7zpnjIPmAOXjzWA3WGyhAEEHeQ8jEMulA3odO4ouL2fY2ILm15rQ+JfWLjC65NQEu/IPcnSnm70Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792311225; c=relaxed/simple;
	bh=FBe4kG2uujzINqt19zVZKOkXZtgt3Oc8l2Xh5dpCwrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AnXYag8xE/2X8KgdPP3ozUZLMiODKpW/U+ccWCXQkW2QIQuR2pa3e/ur5RJZxPBAY0Ij6zhxdPVDvvbRidCZ6DXHK90r+P1k+YiaKnsxPr/3ozRwO9pkeBPC7P4id1F+leXsHzcijyo0NOSfPQ7cUDnrYLd7h1syQ22MKbLemKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=Sfj68zyl; arc=none smtp.client-ip=202.108.3.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="Sfj68zyl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1792311221;
	bh=7BPefR0HhD7XnFFgvkmWLVe0XaA5oFuWs0Dy91Kjyh0=;
	h=From:Subject:Date:Message-ID;
	b=Sfj68zylsENfhAatzC/riv54Cn9m1hoLBdMDVvElzxpoin9NxcAuZuLZWlIl6bjEF
	 QQL05SNI0AjIF6dv9rwpmvS92RGB/6QaXN2wjRKqH/OD7eGJLkvtjCncQYvd0NCde4
	 RK6aYNS+CUA1kBWjsR+Cdd3duiEfXzeM981T2g3Y=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.244.128.147])
	by sina.com (10.54.253.31) with ESMTP
	id 6AD47FA800000B47; Sun, 18 Oct 2026 16:13:31 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 8252556816347
X-SMAIL-UIID: 3B898D5C5FE2465BA006264648CEAFCC-20261018-161331-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+c98b21427617af7f547a@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [nvme?] BUG: corrupted list in nvmet_fc_remove_port
Date: Sun, 18 Oct 2026 16:13:19 +0800
Message-ID: <20261018081320.728-1-hdanton@sina.com>
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
@@ -1268,20 +1268,6 @@ nvmet_fc_portentry_bind(struct nvmet_fc_
 	list_add_tail(&pe->pe_list, &nvmet_fc_portentry_list);
 }
 
-static void
-nvmet_fc_portentry_unbind(struct nvmet_fc_port_entry *pe)
-{
-	unsigned long flags;
-
-	spin_lock_irqsave(&nvmet_fc_tgtlock, flags);
-	if (pe->tgtport) {
-		nvmet_fc_tgtport_put(pe->tgtport);
-		pe->tgtport->pe = NULL;
-	}
-	list_del(&pe->pe_list);
-	spin_unlock_irqrestore(&nvmet_fc_tgtlock, flags);
-}
-
 /*
  * called when a targetport deregisters. Breaks the relationship
  * with the nvmet port, but leaves the port_entry in place so that
@@ -2915,24 +2901,31 @@ nvmet_fc_add_port(struct nvmet_port *por
 static void
 nvmet_fc_remove_port(struct nvmet_port *port)
 {
-	struct nvmet_fc_port_entry *pe = port->priv;
+	struct nvmet_fc_port_entry *pe, *entry, *an = NULL;
 	struct nvmet_fc_tgtport *tgtport = NULL;
 	unsigned long flags;
 
 	spin_lock_irqsave(&nvmet_fc_tgtlock, flags);
-	if (pe->tgtport && nvmet_fc_tgtport_get(pe->tgtport))
-		tgtport = pe->tgtport;
+	pe = port->priv;
+	list_for_each_entry(entry, &nvmet_fc_portentry_list, pe_list) {
+		if (!pe)
+			break;
+		if (entry != pe)
+			continue;
+		list_del(&pe->pe_list);
+		if (pe->tgtport) {
+			pe->tgtport->pe = NULL;
+			tgtport = pe->tgtport;
+		}
+		an = pe;
+		break;
+	}
 	spin_unlock_irqrestore(&nvmet_fc_tgtlock, flags);
 
-	nvmet_fc_portentry_unbind(pe);
-
+	kfree(an);
 	if (tgtport) {
-		/* terminate any outstanding associations */
-		__nvmet_fc_free_assocs(tgtport);
 		nvmet_fc_tgtport_put(tgtport);
 	}
-
-	kfree(pe);
 }
 
 static void
--
