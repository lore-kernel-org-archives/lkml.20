Received: from smtp153-165.sina.com.cn (smtp153-165.sina.com.cn [61.135.153.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564B93BD638
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 23:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787787188; cv=none; b=Dr0QECDrlvB9hUbhxPlemEl9Wg9i7Z3r7NAx+DemEbeqECJi7lZh7VjHws4ao+Oz3fNJMZP+a7ePVhVTEjqyENfoQTXgcIagynrc0EseQyG2lt8i4jQwpoSrl5E1nFystB3YWsgfkvBH2VLrSvNxkUlJHyccFu0N3c9C5pOcJ2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787787188; c=relaxed/simple;
	bh=OJktJtV+qX+sW+kSWNcCMSD90w9QyiiiWtK2uPO4cDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KnJGSdMjbizO9PkTpUO5baUQUrVt0E33PLiYmzEju84QzfoSgFPShIEMMc2pIPxnmHQbVKgKKQKiQQPr1xcmXYGHt+MSsTOZ+nICDvHya2NJu0fQ4nwYbf/7PJxYNDDA4BIeuXXVdlMIrtclVaIW/tbSNUxe5UeYNYTsRhs1umU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=WA2MCVtU; arc=none smtp.client-ip=61.135.153.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="WA2MCVtU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1787787181;
	bh=z7NVLUeT3IXpcruB8yDuSQR7CeXHHzX3nh/b3su/gdY=;
	h=From:Subject:Date:Message-ID;
	b=WA2MCVtUiv5cr07m1HeQ2o+XeTc3NBC9EaGQkhP9j6MKgQZJcfabRFu65HuJn8Px9
	 Kew6Q5JzdBbfn1li8bX9CWOFLkORk0TNgfyRs5o6GtcuXdAsUFXUS3KiNYUnLVT8XS
	 K4VuPxHNWSggb+Yv2bH0pbFiCS/vFTBI2cMiz+5I=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.62.194])
	by sina.com (10.54.253.32) with ESMTP
	id 6A8F77A700007DC3; Wed, 27 Aug 2026 07:32:58 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 1565314456623
X-SMAIL-UIID: 44313303416740568BDE82687C768323-20260827-073258-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+06fa667a0931a3430026@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Read in stub_rx_loop
Date: Thu, 27 Aug 2026 07:32:44 +0800
Message-ID: <20260826233245.1621-1-hdanton@sina.com>
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

--- x/drivers/usb/usbip/stub_rx.c
+++ y/drivers/usb/usbip/stub_rx.c
@@ -606,7 +606,8 @@ static void stub_recv_cmd_submit(struct
 		return;
 
 	/* urb is now ready to submit */
-	for (i = 0; i < priv->num_urbs; i++) {
+	num_urbs = priv->num_urbs;
+	for (i = 0; i < num_urbs; i++) {
 		if (!is_tweaked) {
 			ret = usb_submit_urb(priv->urbs[i], GFP_KERNEL);
 
--
