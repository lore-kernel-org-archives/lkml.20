Received: from r3-24.sinamail.sina.com.cn (r3-24.sinamail.sina.com.cn [202.108.3.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F48A4CF483
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 02:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792203551; cv=none; b=d1aeBlNu2Dr0Mqc6XFA9gXl8zR9kAkb/fcKqltkAR3FlKdX4ei43GKIueLdVm78felj7FBDoDPZ+KhnPPmm9KuBP8P9DyhF840fdt2MS6hKY+RtbCnDCjEOpSDYigcKpK85AUuZoAhDDnUDQG57G0CrzSI8J8J58qERr9gG73m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792203551; c=relaxed/simple;
	bh=eLJkIJR3KuSs0q2tVyYERCeF11aA+DVrsdp6WXqKyQk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iKmFtBpYRAwasvo5AcRJcib9c/ZvFjGPUlF7OVsIzXu2DP0zMAztgd3yhpYLjZdO8xAEhkm28UHrJ6c7WdH3KLLvSKzvzFi8hYvJLYdIk+tYALjlv4zOw9lHwCJty6EUo+bQ3EXjT6pHoHbe8cHs3IJKLtd2jhDi9al8FQJITB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=kk6ioL7K; arc=none smtp.client-ip=202.108.3.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="kk6ioL7K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1792203546;
	bh=dQRfsvzv4x3t9hvfXodBJhoOF5c9RPkztb/0LW5IJG4=;
	h=From:Subject:Date:Message-ID;
	b=kk6ioL7Ki/zBDVLkFphZMQ/XeFx5nhQEgZRYBddexnBOYCVL3n7wYcGugalQLF9JJ
	 npTxzei3urWUXHVEctZaVAQTBfZDELfF7rkGrMyRHWfl7Nyokr9HeIElRhwaHtvUVb
	 DOL/9s0YXKG+ch16wvojWOHv0veORar0ia69WApI=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.254.3.93])
	by sina.com (10.54.253.31) with ESMTP
	id 6AD2D8D2000009D6; Sat, 17 Oct 2026 10:09:26 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 7549286816064
X-SMAIL-UIID: E93293EB192C4A84A1DE3839E246D068-20261017-100926-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+c98b21427617af7f547a@syzkaller.appspotmail.com>
Cc: Nguyen Duy Nhat Anh <neganhat@gmail.com>,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [nvme?] BUG: corrupted list in nvmet_fc_remove_port
Date: Sat, 17 Oct 2026 10:09:10 +0800
Message-ID: <20261017020912.558-1-hdanton@sina.com>
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

Test Nguyen's idea.

#syz test

--- x/drivers/nvme/target/fc.c
+++ y/drivers/nvme/target/fc.c
@@ -1319,12 +1319,13 @@ nvmet_fc_portentry_rebind_tgt(struct nvm
 
 	spin_lock_irqsave(&nvmet_fc_tgtlock, flags);
 	list_for_each_entry(pe, &nvmet_fc_portentry_list, pe_list) {
+		if (pe->tgtport)
+			continue;
 		if (tgtport->fc_target_port.node_name == pe->node_name &&
 		    tgtport->fc_target_port.port_name == pe->port_name) {
 			if (!nvmet_fc_tgtport_get(tgtport))
-				continue;
+				break;
 
-			WARN_ON(pe->tgtport);
 			tgtport->pe = pe;
 			pe->tgtport = tgtport;
 			break;
--
