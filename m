Received: from mail3-166.sinamail.sina.com.cn (mail3-166.sinamail.sina.com.cn [202.108.3.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773902DEA8F
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 07:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792222305; cv=none; b=UlAf6QIXDvQWkQbmsU0AWin7jK8/L1XKtaebAk1vcpdpCXqGGoIe2rNAZqk2TS6qAkFiwxi0sZuroUfQKQfYSRwhDSzm6uKJqKdZmXsEWUxSWWttdkHjahnjOJAwibAPV6hEwL1r8VbDe7r8MOVt+ju+VXuE7uWesB09zlpPQ5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792222305; c=relaxed/simple;
	bh=HZUqoNLn3HtsHp0HGFWV6ERsGNNJ23Snd7/CCWSjlR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hHN8lv/5he4tfEdKCeflZzePDrbk3ccrDEss3aMELhx+qYylp00i0akLd50oC64QnBHfZM/m0P7Ud4GweeOmkob25tR/CBk2H22ISeCQp47QKN606CEWiiSO6vlXWJMuYVa0LT/kztUiBupH7FJQ99wGgvygiuCBztYHojC594c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=GZhH6RRo; arc=none smtp.client-ip=202.108.3.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="GZhH6RRo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1792222300;
	bh=/r9uT2nurP+dosJlXZlxCrQNxd9soq9XGeuZ5kkDoaI=;
	h=From:Subject:Date:Message-ID;
	b=GZhH6RRocvS3Nl0pAVRzSVo43UEtAf3aVpOeXGQF5Td62arz4NXTgIn4iJlrXoQnZ
	 OD/ncVhFkY01Axwz13qMqa4DAvw7TVMqC9gWqRtHR1Q4q4lOvplP6+HAsFuQ46naUz
	 7T4S5/3k5OsHFtCi70xk0i74yKOm9E7xAhiXFLS8=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.254.3.93])
	by sina.com (10.54.253.31) with ESMTP
	id 6AD324310000505E; Sat, 17 Oct 2026 15:31:00 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 8932686815928
X-SMAIL-UIID: 774D2D4FBB37426E83527326A9FBF75B-20261017-153100-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+c98b21427617af7f547a@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [nvme?] BUG: corrupted list in nvmet_fc_remove_port
Date: Sat, 17 Oct 2026 15:30:46 +0800
Message-ID: <20261017073047.631-1-hdanton@sina.com>
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
@@ -1475,6 +1484,9 @@ __nvmet_fc_free_assocs(struct nvmet_fc_t
 {
 	struct nvmet_fc_tgt_assoc *assoc;
 
+	if (tgtport->assoc_freed)
+		return;
+	tgtport->assoc_freed = 1;
 	rcu_read_lock();
 	list_for_each_entry_rcu(assoc, &tgtport->assoc_list, a_list) {
 		if (!nvmet_fc_tgt_a_get(assoc))
@@ -1643,8 +1655,10 @@ nvmet_fc_unregister_targetport(struct nv
 
 	nvmet_fc_portentry_unbind_tgt(tgtport);
 
+	spin_lock_irqsave(&nvmet_fc_tgtlock, flags);
 	/* terminate any outstanding associations */
 	__nvmet_fc_free_assocs(tgtport);
+	spin_unlock_irqrestore(&nvmet_fc_tgtlock, flags);
 
 	flush_workqueue(nvmet_wq);
 
@@ -2927,8 +2941,10 @@ nvmet_fc_remove_port(struct nvmet_port *
 	nvmet_fc_portentry_unbind(pe);
 
 	if (tgtport) {
+		spin_lock_irqsave(&nvmet_fc_tgtlock, flags);
 		/* terminate any outstanding associations */
 		__nvmet_fc_free_assocs(tgtport);
+		spin_unlock_irqrestore(&nvmet_fc_tgtlock, flags);
 		nvmet_fc_tgtport_put(tgtport);
 	}
 
--
