Received: from mail3-166.sinamail.sina.com.cn (mail3-166.sinamail.sina.com.cn [202.108.3.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A2C1632E7
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 23:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787787997; cv=none; b=ngSmRWoMoCBsC+JRIXsxTdxN2L6kTrSx46ZtXDJXOBIE3gWrEhqqpaGrauUWulJYWSFCvv9FCW0k2aHNpJPsFApwboKNxDl1FyxIat+3tA6xG8K29/W8W6+DWMzqUQsHaRle1tpScAAVHxKKzIak/LjqiWutK2AGsqifJ3HR/ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787787997; c=relaxed/simple;
	bh=RVQ86g2GQ/C+BNUNKCTf+0oQXQWOKXnTJX2/V+nSbDU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EhCn3y4PShCJHa82BjhKUx3czKKOIjH8FOL9S8KICAaHoJlgPyi9qXo2vNrEfXfu4D6UZP2LqIdBN2vp5hwbThsZjjNlxMgK6op1NrcKoOfCNKhktRq5c9JbKb/2cRFD77g/v6gTAh79wGnAAimpCvURC/qrk0PELrlfit27v54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=oRdUsJFy; arc=none smtp.client-ip=202.108.3.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="oRdUsJFy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1787787993;
	bh=r7EPxTtHPSGnVNasCTsGHEkzX89tLIFPHryJGLkSsXE=;
	h=From:Subject:Date:Message-ID;
	b=oRdUsJFyWES1zCs3GpeWAEBf2JkbakbPAQVlhOy5G518ZxRm+et8UjrhfiH9mb0l5
	 qhx505yviwHsCTZP/AnEPddOkUaJIaQaZT4S3nyNFKT6s/4sBUgAGeIMsoA8a0CFTP
	 bUsvdTUAwqb5332ZHojrdIJTvU+O8vYwDTma/Wyo=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.62.194])
	by sina.com (10.54.253.31) with ESMTP
	id 6A8F7ACC0000722A; Wed, 27 Aug 2026 07:46:23 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 4302536815935
X-SMAIL-UIID: FEA8AB1A73294FCB810C93CBE28F852A-20260827-074623-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+06fa667a0931a3430026@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Read in stub_rx_loop
Date: Thu, 27 Aug 2026 07:46:09 +0800
Message-ID: <20260826234610.1637-1-hdanton@sina.com>
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

diff --git a/drivers/usb/usbip/stub_rx.c b/drivers/usb/usbip/stub_rx.c
index 25d77d4a1061..763f79806bd8 100644
--- a/drivers/usb/usbip/stub_rx.c
+++ b/drivers/usb/usbip/stub_rx.c
@@ -606,7 +606,8 @@ static void stub_recv_cmd_submit(struct
 		return;
 
 	/* urb is now ready to submit */
-	for (i = 0; i < priv->num_urbs; i++) {
+	num_urbs = priv->num_urbs;
+	for (i = 0; i < num_urbs; i++) {
 		if (!is_tweaked) {
 			ret = usb_submit_urb(priv->urbs[i], GFP_KERNEL);
 
--
