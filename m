Received: from r3-18.sinamail.sina.com.cn (r3-18.sinamail.sina.com.cn [202.108.3.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60403BD62F
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 04:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792212173; cv=none; b=sJZZIwcdSjBm/CjTHtJdUbzBjXx18zvNycCtV54YHdSXI/HSEpBBhln8JdqorPrDU8c3A4z4mEZGeCsTqJTMQCwRH0gGiojnZSmHvJYKEktIzqCBVtPkSHxISi720XX7qFbDJ3QJMuMGb09SvHehORX728Xg4FzFoL4QGbAzSS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792212173; c=relaxed/simple;
	bh=CYDCMU7y2puuqhcG+SdwZOwH6UbYA/lZgXO+t+RBfaU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EusRUHfFgTt4cFm6/4zCIMTrf+iIg3gH02QlpDowEsuqJyLVtfKJnxphKlCYoa5Z1yp457AnBuEl0T2iAvwc7j8smaiDEvPbHNQAbzJ3VlOSGsY6BT6GgZJRgH/1QKLKWMp+c5MUin9WcDq4J8V8vrqmSrspImxJidzLmRFEG8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=QqS55tRj; arc=none smtp.client-ip=202.108.3.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="QqS55tRj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1792212169;
	bh=BskqoNCi93425CRRKEPt9taK65QKIHdz1n3pwAuDSUc=;
	h=From:Subject:Date:Message-ID;
	b=QqS55tRjT983RFyIy4Mn73j9e/1VsECpcwJMVSu5YELuqS0a6JLtw3poat5yNEj8c
	 P4vl0KxMIZJItka0oD8ViPUJOEzqEkBDrbrf7C40DkcmOuZ75e5Uj1skjwE04Qnia6
	 bKTFVF9phBzEYrOtpX6Xl1l6wk1qM2cN/6Fz2DxQ=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.254.3.93])
	by sina.com (10.54.253.32) with ESMTP
	id 6AD2FC970000445F; Sat, 17 Oct 2026 12:42:03 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 1458214456967
X-SMAIL-UIID: 8B8CC8C79CA74C83ACB32DF89A91ABBD-20261017-124203-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+c98b21427617af7f547a@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [nvme?] BUG: corrupted list in nvmet_fc_remove_port
Date: Sat, 17 Oct 2026 12:41:48 +0800
Message-ID: <20261017044149.584-1-hdanton@sina.com>
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
--
