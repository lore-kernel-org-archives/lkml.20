Received: from mail3-167.sinamail.sina.com.cn (mail3-167.sinamail.sina.com.cn [202.108.3.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9AC3955C0
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791782498; cv=none; b=KOH6KxgE9XnRo99SNGJPKgpdlU9nRQr7gCcPMwtuDptSaPQP9f5GWcDOnVmYe52l/FgCMtiKFOr6OiFuhk1/7QUIa4H3NgKU06J69X2Li5cBABo9CDRcFS6ZSvAjMu8pg19gjxFKohlOy7pi9zyj0H12rNLWnAO6UrjEJm/AapY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791782498; c=relaxed/simple;
	bh=ZjHn8tsQsvx7MxFlL4G7LtQazD6NoIubj3eaYU6MF2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jJfSzebCgKtxa5xyR+PjLlRkn1ClqMreMNCk6V8WSGR4IQiXoIOq/DhByzd9PFhaysdtMJDkbIRNhC9pPjmzOLhXEUqOInPoFMoB1+BS9X9YuGW0fQXSm+f0Mc+aOEStZtb4F6bx4bSz3yWWI+PuZ2HpMftZFIHdyRjKNiWXbKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=QfM6WGqd; arc=none smtp.client-ip=202.108.3.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="QfM6WGqd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1791782492;
	bh=Ew8fAOYFrNF+BdncYjgCITn7UbYLy8FT3TaoEPlL8C8=;
	h=From:Subject:Date:Message-ID;
	b=QfM6WGqdr2LEshdWNZwBEak3tNgTaNDKPdWqwDv7EKf7jbvIvwxhI/ynZoQHHob0I
	 xJpb4bQAana27USliiW5UVgtn+HtsTMT1Y0zWmrvLCfQ7MPGuB9Lxe6aQpjTARIl8B
	 2guV+R/OT5M+2R7PVUfLQ/rdqd6q5o8nlOIga9xI=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.62.194])
	by sina.com (10.54.253.33) with ESMTP
	id 6ACC6C1500002E9B; Mon, 12 Oct 2026 13:11:52 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 4119666685187
X-SMAIL-UIID: F1575B3758374D439B0D84ADB52A349F-20261012-131152-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+c98b21427617af7f547a@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [nvme?] BUG: corrupted list in nvmet_fc_remove_port
Date: Mon, 12 Oct 2026 13:11:39 +0800
Message-ID: <20261012051140.410-1-hdanton@sina.com>
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
@@ -1278,7 +1278,6 @@ nvmet_fc_portentry_unbind(struct nvmet_f
 		nvmet_fc_tgtport_put(pe->tgtport);
 		pe->tgtport->pe = NULL;
 	}
-	list_del(&pe->pe_list);
 	spin_unlock_irqrestore(&nvmet_fc_tgtlock, flags);
 }
 
@@ -2922,6 +2921,7 @@ nvmet_fc_remove_port(struct nvmet_port *
 	spin_lock_irqsave(&nvmet_fc_tgtlock, flags);
 	if (pe->tgtport && nvmet_fc_tgtport_get(pe->tgtport))
 		tgtport = pe->tgtport;
+	list_del(&pe->pe_list);
 	spin_unlock_irqrestore(&nvmet_fc_tgtlock, flags);
 
 	nvmet_fc_portentry_unbind(pe);
--
