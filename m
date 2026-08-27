Received: from smtp153-165.sina.com.cn (smtp153-165.sina.com.cn [61.135.153.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632202F6577
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 00:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787789902; cv=none; b=Ls/4e/hu/M4Nu+6sI1JyxM1t1ZtTQGE6nAQx9dQlGC72904Q8sot/D7bnazKXxM+br+1ZHZyMbkMBW7tyZFAu3n+BKnXOqcbRtC1x/cq7q88coUECDvJV7TQu5d61TLJzavSwtw65b9ZxelEty434ufdO+WDriqtck2Qj/BUMnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787789902; c=relaxed/simple;
	bh=vaxtmuegNhBEUI5PUqfgCnHW7HfvBF7r7Lt/LfmPTWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZjElQ5xN4PloyTz7YnKyX+jrwCRrt+26qWvB9i/Fcc98JB1MaDNpllxwh4XgolVW0EHpqf4mI0xl+YX+kz91bWWEekE5+4952ffTMNSvzKwGI12P27l4+dGLsP+QX4InqRqBmxsoREz+EdWPifPzcZqAAGicgWgMXD7H60ASQ20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=htoNN8PB; arc=none smtp.client-ip=61.135.153.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="htoNN8PB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1787789896;
	bh=Eeb2rHoyu1G4oEpJoANuE6GQAMVAEBliRl84T2ksBYQ=;
	h=From:Subject:Date:Message-ID;
	b=htoNN8PBtLzeercd8hUlk6lEavsUXUwroh0b1Cfb+o3xy5yaAvstOj/qNRQ3yW2Db
	 EqGoxWESCm4cl9B2xkxj72rP1J8yWx8Wb8yPLX6PL2M//Hvr+ZwAZYYa1leRdrmhtt
	 Gw3suBlrcFnrhrKViu++KKIcAbOLrn29lH3acbqQ=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.62.194])
	by sina.com (10.54.253.32) with ESMTP
	id 6A8F8242000019D9; Thu, 27 Aug 2026 08:18:12 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 8261814456737
X-SMAIL-UIID: BA1F7FF0EA324806B0B8F6988404DCA4-20260827-081812-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+06fa667a0931a3430026@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	Hillf Danton <hdanton@sina.com>
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Read in stub_rx_loop
Date: Thu, 27 Aug 2026 08:17:59 +0800
Message-ID: <20260827001800.1711-1-hdanton@sina.com>
In-Reply-To: <6a8f1920.1d9ded08.62e62.00b7.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Date: Wed, 26 Aug 2026 09:49:36 -0700	[thread overview]
> syzbot has found a reproducer for the following issue on:
> 
> HEAD commit:    818bebeb63dd drm/xe: Don't hand out the flat CCS storage a..
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> console output: https://syzkaller.appspot.com/x/log.txt?x=151ce979580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=ccca94d2c01b9e78
> dashboard link: https://syzkaller.appspot.com/bug?extid=06fa667a0931a3430026
> compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13a28d49580000

#syz test

syzbot reported a uaf in stub_rx_loop(), so see if it happened after the
complete callback.

Reported-by: syzbot+06fa667a0931a3430026@syzkaller.appspotmail.com
Signed-off-by: Hillf Danton <hdanton@sina.com>
---
 drivers/usb/usbip/stub_rx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/usbip/stub_rx.c b/drivers/usb/usbip/stub_rx.c
index 1e9ae57..26233ca 100644
--- a/drivers/usb/usbip/stub_rx.c
+++ b/drivers/usb/usbip/stub_rx.c
@@ -606,7 +606,8 @@ static void stub_recv_cmd_submit(struct stub_device *sdev,
 		return;
 
 	/* urb is now ready to submit */
-	for (i = 0; i < priv->num_urbs; i++) {
+	num_urbs = priv->num_urbs;
+	for (i = 0; i < num_urbs; i++) {
 		if (!is_tweaked) {
 			ret = usb_submit_urb(priv->urbs[i], GFP_KERNEL);
 
--
