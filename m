Received: from smtp153-171.sina.com.cn (smtp153-171.sina.com.cn [61.135.153.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB0A488219
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159250; cv=none; b=U7yRQ6nELamqWAZLwLJiUKNfheJM/N3fcyWKnuaTaptFJk0kW1lzkrf8gA8cJngR0V9/9lIwnU5xWwAWqcYGkcn3J+Vz4p4jrxi71qZrx26nK4RI3XwoANsvu7lNsaoB0l1rhgzWWrKmPq3lEQW19Ha6cOYdkJLYdCXnpCTZxmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159250; c=relaxed/simple;
	bh=zx6dnYtelGqLeLsywtD9yVHYHXELou9qbiOWQahNzDk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i0spCpYXfZTTQv+jQO9CcPmYn6JgzXIRO+lwZHwBb0zM8dmmdsZx/Z3fPv0akTMWFVtaMA8yaAJX0aVnX/ddTLxNjYp68jy9WGvfc3qrjXLgqXIPTv1jLNHsnrGlnYlc32OIO0CyzHnfc2lqKOM3Iw9IeXZI2+jpqBBar1Rqhqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=aTNXeBVT; arc=none smtp.client-ip=61.135.153.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="aTNXeBVT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1790159228;
	bh=rkiJccpNbZhaCOokjATGXQRdlQggCsQYMJRLGxjM6aI=;
	h=From:Subject:Date:Message-ID;
	b=aTNXeBVT0mwUpWHla6PJF1LdQ41Dvne0BXKU+SfcV2aX2tnSsoaye5tN8xQu5hQQ1
	 Pmzl0FnNVx1o68DemU/p7GylvAzfXYRfyFthkuuoiQ0/n7nggtX406x3LldYsQB8z3
	 NJ8VqopjYTmB7IBr66LcbHWAvXbMuohTk03CHDVk=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.34) with ESMTP
	id 6AB3A96900000A34; Wed, 23 Sep 2026 18:26:51 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 7321736291688
X-SMAIL-UIID: 46F613F0BA8E473C8F51D29506558E24-20260923-182651-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+9a321aea9d851b299486@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [kernel?] KASAN: global-out-of-bounds Read in bus_uevent_store
Date: Wed, 23 Sep 2026 18:26:49 +0800
Message-ID: <20260923102649.39389-1-eadavis@sina.com>
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
index ddbc4d7482d2..09dbee6d8815 100644
--- a/lib/kobject_uevent.c
+++ b/lib/kobject_uevent.c
@@ -78,7 +78,7 @@ static int kobject_action_type(const char *buf, size_t count,
 		count_first = args_start - buf;
 		args_start = args_start + 1;
 	} else
-		count_first = count;
+		count_first = min_t(size_t, strnlen(buf, count), count);
 
 	for (action = 0; action < ARRAY_SIZE(kobject_actions); action++) {
 		if (strncmp(kobject_actions[action], buf, count_first) != 0)
