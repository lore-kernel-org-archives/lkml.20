Received: from smtp153-165.sina.com.cn (smtp153-165.sina.com.cn [61.135.153.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA1234B43F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 22:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789771901; cv=none; b=J/XuCzlja5Nz2/r1ksJhiZRmqP24pHMowK18RJoUlMpE7xmoCBh+CXaDEuwzVSFvLjZBuJPjaZEaFi9YL7+6T/f3arnBNwS8w/oIyzFLWZgokcItvN36IQzwAl1F8sCQylcRVtiD2Uv1y0oMOi97SY/AAUUtu3R7UPIzyyBIE0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789771901; c=relaxed/simple;
	bh=NF1REK0wQIB6g4/ec0JBY8cBG19sn7ze+4FNpXUhQJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q8oqTsp80k9z3vefy4BJ5KI/RBM/Gg7eaEeydwzHvd//bNhm3N1290fvT/uq3/vPOcbMJB9W5gM2mwFNKpCQDh1t6s0jmVvBVmTjiTwMpQXnIJMYfqXaspIq4nfq0REs69JcRE98gwLBmUVnc9F6LzizDNJZEGDRXBX/k6p4S7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=GTjvG27A; arc=none smtp.client-ip=61.135.153.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="GTjvG27A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1789771894;
	bh=YfgjbXbPxX2nIR0cBamzrZCRJM1DILDIs5AzYNdANW4=;
	h=From:Subject:Date:Message-ID;
	b=GTjvG27AoTZKH9wSd4LQnIx9wZ53ji4DoeLDRZVElQyc5KrYyyXoleIFRSCIvsn0R
	 QQH06dptdKe3elpKw2IRPWAChaUNfhGu5m25uqWp3Pw7x38Cqc3KsBDRKhZ0vDlLGr
	 yvUJVXAGOXtRMVCP6XO3ZkDcbsS/qkjFTo9v2Efs=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.62.194])
	by sina.com (10.54.253.32) with ESMTP
	id 6AADC06900001403; Fri, 19 Sep 2026 06:51:24 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 8627344456770
X-SMAIL-UIID: 82449037A5EF442B91301E0986251026-20260919-065124-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+b5ddc2aecb8d1b29c871@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [net?] WARNING: locking bug in finish_task_switch (3)
Date: Sat, 19 Sep 2026 06:51:11 +0800
Message-ID: <20260918225112.173-1-hdanton@sina.com>
In-Reply-To: <6aadac13.b398a7c9.1f86be.003c.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Date: Fri, 18 Sep 2026 14:24:35 -0700
> syzbot has found a reproducer for the following issue on:
> 
> HEAD commit:    50d05c7c76c9 Merge tag 'landlock-7.3-rc3' of git://git.ker..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=15b5f8c9580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=5e4e3a0e188a497e
> dashboard link: https://syzkaller.appspot.com/bug?extid=b5ddc2aecb8d1b29c871
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12ab4525580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14d4e915580000

#syz test: upstream  18fbf5151d2c
