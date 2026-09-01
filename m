Received: from smtp153-163.sina.com.cn (smtp153-163.sina.com.cn [61.135.153.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297CD387362
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 01:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788226022; cv=none; b=nDIBA3tbQnxZCsAN6bTeDB2Qhg3uMyd6mnzm1KzUGulr/ahNHA4WJw2KnmTNDvMrwbWpRxEgihbZW2FO0pUMrAVSFlTJqDozZGNqIFwMnISb7z8VQoBvQcIB931BrV6mIqZ8+z408FKE9WUHSk1WzDIi3gGefJGt52vFoSUAMn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788226022; c=relaxed/simple;
	bh=XphEGZORPY++0vvKvynN2saIwV+kuKOlYonOdF/ZrUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KHaCNdCHG3SGy//1TVav49s+cl5DuRBKgrXRRQRNhKr4pNOB2xQGWig+n1eBA9NyYYcDTt/ntiWvfI9GoeY9NnNB8K9qG9Ae/FkLXlZX1lCc31+kX8AymZrRqEirgV6zbritazQKDDicvpqPYtos2WcqOiGL+rHZ9Zj7iPSlCIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=gjIj1ZWr; arc=none smtp.client-ip=61.135.153.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="gjIj1ZWr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1788226015;
	bh=H+b3PnRJDwEw278XZyKq08CbBBC3StVQSPT3Bazg+2c=;
	h=From:Subject:Date:Message-ID;
	b=gjIj1ZWrwkI0D0W4RPzLzhRzYsSzcA1o4EGCyBzB8OmpeYsHqybkfZXlSit41W7hL
	 0oOiUDq2AcrEts/wk2FLcrp90rlsxQKQ6AkaMSWZFhDXJ8j7IQMZqqOEn4kXkccH8w
	 W+RTTJkSXbU0Pjn4FhxZ2FiH4OZuJyvaga7xC2u8=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.62.194])
	by sina.com (10.54.253.32) with ESMTP
	id 6A9629D300007296; Tue, 1 Sep 2026 09:26:45 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 4501614456761
X-SMAIL-UIID: DC9F97D110C14BBB9E5070F2F89CD2CC-20260901-092645-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+f669f02a0fcc5b2148f2@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [i2c?] [usb?] INFO: task hung in em28xx_i2c_unregister
Date: Tue,  1 Sep 2026 09:26:28 +0800
Message-ID: <20260901012633.1985-1-hdanton@sina.com>
In-Reply-To: <6a95ef74.764875ec.b345.0003.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Date: Mon, 31 Aug 2026 14:17:40 -0700	[thread overview]
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    a23cbb05744b Merge tag 'timers-urgent-2026-08-30' of git:/..
> git tree:       upstream
> console+strace: https://syzkaller.appspot.com/x/log.txt?x=12a6d379580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=5e4e3a0e188a497e
> dashboard link: https://syzkaller.appspot.com/bug?extid=f669f02a0fcc5b2148f2
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12d1f379580000

#syz test

--- x/drivers/i2c/i2c-core-base.c
+++ y/drivers/i2c/i2c-core-base.c
@@ -1844,7 +1844,7 @@ void i2c_del_adapter(struct i2c_adapter
 	 */
 	init_completion(&adap->dev_released);
 	device_unregister(&adap->dev);
-	wait_for_completion(&adap->dev_released);
+	wait_for_completion_timeout(&adap->dev_released, 50 * HZ);
 
 	/* free bus id */
 	mutex_lock(&core_lock);
--
