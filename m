Received: from mail3-163.sinamail.sina.com.cn (mail3-163.sinamail.sina.com.cn [202.108.3.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F672D97B7
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 11:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789470085; cv=none; b=pPwmA8fssMrlvyBXXLmJA1/TOLOMOR3oxkEBlKEMp7GCUa7MWRMb3cyLBw2zIgsH4StXM37Ek/gLM/8AOMhO33Q/731JSBw476ZK6Rso7LY2DQWaII7H9n5uX1MIvyT8fuKnegj83z61o8VMy3Y9RdBqR+qLGQdSqOepOAKcxGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789470085; c=relaxed/simple;
	bh=ieYe7JC72f42ZWLIWqEAqgpjx9lPTaJPGfR6FyyCEg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MN4KCdZkXHUNg0F9PTSFPKLKeqf0l/fFT3jWvW9c9ecpAHK5sk/3nK3PipsH3jJVoSvlE3phUl7/xSOdlTBcZ1cmt7tniGBlhshYVrLyldCd+wv0I6C9oAeIgZwBGpZqJvDe+zyMSKd/BFfA3y74jWmW1jc+kMSP2Xnyv7lOkO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=gQwxvmqH; arc=none smtp.client-ip=202.108.3.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="gQwxvmqH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1789470080;
	bh=cylYDqlDo3A8xc1m2/wPaBF795GHyVZGENEpWPIOmY0=;
	h=From:Subject:Date:Message-ID;
	b=gQwxvmqHFRmVm3PD+yUUDgYpfbPWSAH8vLnKGLeeUhtiZjkbnIhmqBreB6hxzbA6y
	 k+LK9W6buaGQbH9Q/iDn93eVsbEGzVVbva2YYcX3f4wb92u+0gqFwPcjT6MNo3qusU
	 atqMxzNi0V22s7MyDXbATrBhc2Hx+9GQ6oCRHWsI=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.34) with ESMTP
	id 6AA9254F00002B9B; Tue, 15 Sep 2026 19:00:34 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 3323126292448
X-SMAIL-UIID: 43B3C56A23244D8192E3197E3579FA09-20260915-190034-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+9a321aea9d851b299486@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [kernel?] KASAN: global-out-of-bounds Read in bus_uevent_store
Date: Tue, 15 Sep 2026 19:00:30 +0800
Message-ID: <20260915110030.918688-1-eadavis@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6aa82301.a211d2ce.1a5198.0296.GAE@google.com>
References: <6aa82301.a211d2ce.1a5198.0296.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Edward Aadm Davis <eadavis@sina.com>

#syz test: upstream 50d05c7c76c9

diff --git a/lib/kobject_uevent.c b/lib/kobject_uevent.c
index ddbc4d7482d2..25c89a36fb39 100644
--- a/lib/kobject_uevent.c
+++ b/lib/kobject_uevent.c
@@ -83,7 +83,8 @@ static int kobject_action_type(const char *buf, size_t count,
 	for (action = 0; action < ARRAY_SIZE(kobject_actions); action++) {
 		if (strncmp(kobject_actions[action], buf, count_first) != 0)
 			continue;
-		if (kobject_actions[action][count_first] != '\0')
+		if (count_first <= strlen(kobject_actions[action]) &&
+		    kobject_actions[action][count_first] != '\0')
 			continue;
 		if (args)
 			*args = args_start;
