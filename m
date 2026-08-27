Received: from smtp153-166.sina.com.cn (smtp153-166.sina.com.cn [61.135.153.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662903AE188
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787818581; cv=none; b=rxXnlqDnif9RADxhNCDftXZ9nLoRaqmd7DPUnRJrsdcNsnQe9jzUE1Dqhf1B1aGCiNIxxvtb2h44W5gnLfEDNHrsmZjpL1bMscJe/qUjK9eHkEed7tQQom+gzjhy3jEYjrGAbOwkqZShfn4EAG2PYiARmVjrlp/OlMtA3ASSX5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787818581; c=relaxed/simple;
	bh=DNL6vgkyw8uXqcVjDbvi9LwFW9vMiO2VC/fqcXID/ls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AT0apugHPKylX85eOnkjBGAve3huAW2zhsROdpMdYDIZaph+zGRt0qnnh7Sp2WYuFWgfhjPszk9aCyTG5BH5HDV+Q9QspVfh3xpx9Fy6ZBfS2w6ivi0CwN1vi+tUmi8j8QkKw6RnHgxZKERimvAa5nQY1DE1qK3M+sYtdLaNvkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=SLGXtTUl; arc=none smtp.client-ip=61.135.153.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="SLGXtTUl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1787818573;
	bh=qKfEQ7o/eoHs9NRMsF+NhBhP/cNLwdpkjXXgbX681Jk=;
	h=From:Subject:Date:Message-ID;
	b=SLGXtTUlNaeNCyeaUfGZ6L76wgKLHCUfc8mSjDpwWFcZ2vaofwDb+LYKfIA/AKZpR
	 BE/GMVdN0gn8jcU5zyp5pLIPbmw9+KhAuSecWGrRPGO795Y9q2B6UmBNPo7mWttYED
	 ttVvA7rw6c4JjeZCDVmZeZEnGHG+LjTewcClf194=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.62.194])
	by sina.com (10.54.253.33) with ESMTP
	id 6A8FF24600001086; Thu, 27 Aug 2026 16:16:07 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 7251856685968
X-SMAIL-UIID: EF603BC328A144C28A9C0863E7F95D5D-20260827-161607-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+dd764a450d93885d847f@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [kernfs?] possible deadlock in kernfs_link_sibling (2)
Date: Thu, 27 Aug 2026 16:15:54 +0800
Message-ID: <20260827081556.1819-1-hdanton@sina.com>
In-Reply-To: <6a8f3f8b.50659fcc.60cd.0005.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Date: Wed, 26 Aug 2026 12:33:31 -0700	[thread overview]
> syzbot has found a reproducer for the following issue on:
> 
> HEAD commit:    818bebeb63dd drm/xe: Don't hand out the flat CCS storage a..
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> console output: https://syzkaller.appspot.com/x/log.txt?x=10059625580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=ccca94d2c01b9e78
> dashboard link: https://syzkaller.appspot.com/bug?extid=dd764a450d93885d847f
> compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13de8d49580000

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 818bebeb63dd

--- x/lib/once.c
+++ y/lib/once.c
@@ -93,6 +93,6 @@ void __do_once_sleepable_done(bool *done
 {
 	*done = true;
 	mutex_unlock(&once_mutex);
-	static_branch_disable(once_key);
+	once_disable_jump(once_key, mod);
 }
 EXPORT_SYMBOL(__do_once_sleepable_done);
--
