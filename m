Received: from r3-23.sinamail.sina.com.cn (r3-23.sinamail.sina.com.cn [202.108.3.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3934348463
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 09:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792228826; cv=none; b=qtGSH7U8cfXSWshmFupkEkIhMwKFWJdggXLvahDeJKnq9GSyDwQG32qlDbKq+SeIvmfh8Cb9m5v6MtiDWKcocM/vWNh8g0l6B1NylmzY2G+YJxC49ohZG+ud644THA88tnzMWYGYMLlBQxw8tx+hQeOiev6VaK9ggxjPKwd2i1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792228826; c=relaxed/simple;
	bh=rAWGPe02zDDUaocBF91ScV2HBenRCf7/jDG4H5QbjOg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PfmI2xn3MGyQxHMfPsu3yoxAwrK8xGPJ8BfzJ2Ow0JJiiXK2fHxcgHobvZnEpb5nDxchUpVmQ9KkVc4NQK9P104RZczURvtbb095lpx1XioPReu5zD2T5IpB0r2s1u5BwmG5ppwHBsSked1a2GbG5kdwASEJueqNz6H893IPMoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=mDasihI3; arc=none smtp.client-ip=202.108.3.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="mDasihI3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1792228821;
	bh=2DORpuK6VypsSarVxLX2Q87bhjJz48M3QZZUjduE5o0=;
	h=From:Subject:Date:Message-ID;
	b=mDasihI3TlOGSppx7Kl1uyxR8lJBKMl4VIsK7ITm3BkQZqdozmQCDY0KdsHv70y1i
	 oFMLrMQORpgfA16QdaW7W9EMVJohetZnw1YsUsw7/TA12bA871OVTlTNeY37iQp6bf
	 6xjNufYtdm7NieyQjD392wLd6j9qlHr50e0vS87s=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.246.238.15])
	by sina.com (10.54.253.31) with ESMTP
	id 6AD33DCE000023E6; Sat, 17 Oct 2026 17:20:18 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 248916816172
X-SMAIL-UIID: EDD7FA40B95140DC8E9839BD7DEE6AA3-20261017-172018-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+c98b21427617af7f547a@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [nvme?] BUG: corrupted list in nvmet_fc_remove_port
Date: Sat, 17 Oct 2026 17:20:03 +0800
Message-ID: <20261017092004.650-1-hdanton@sina.com>
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
 
@@ -2927,8 +2944,10 @@ nvmet_fc_remove_port(struct nvmet_port *
 	nvmet_fc_portentry_unbind(pe);
 
 	if (tgtport) {
+		spin_lock_irqsave(&nvmet_fc_tgtlock, flags);
 		/* terminate any outstanding associations */
 		__nvmet_fc_free_assocs(tgtport);
+		spin_unlock_irqrestore(&nvmet_fc_tgtlock, flags);
 		nvmet_fc_tgtport_put(tgtport);
 	}
 
--
