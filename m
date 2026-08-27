Received: from mail3-165.sinamail.sina.com.cn (mail3-165.sinamail.sina.com.cn [202.108.3.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A17364052
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 00:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787790690; cv=none; b=pLSNzXxA90VeGXwQSDQ6jTNJqzSKGVsmvg6Vu7iPLOnIumyvTlMz6IfuKrxXwkDw8g3nXX5hyApHP83TlEXlbmlkaUVcOHYQsuMmUW3QB/k47c/Ao1yMDE0FU5WNY+/AGbttmAX5ouzcKpXBTiRX2WcvdualsoLr1DffoqeRAlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787790690; c=relaxed/simple;
	bh=FqKErcPlOCyS3dSmFrCFhaZLH+j/il29Ig7syq3GMYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NcUCW4RquGVtQm9GnxjwyPThszNu3SpnNEGpg8ztS5FgjqgOVer8UfgS7NPqI/axaws5vcrejQTtNH+3/3Kayrft8XEyF6NdTZkFZaAa6foeWMl1j4JJpcdm6xFoYgLChNpaexP5QC54w96ZLFDX7EYB0/IVvdO+ytz24zxmtDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=d3iQb5C/; arc=none smtp.client-ip=202.108.3.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="d3iQb5C/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1787790684;
	bh=uJpY4Cs830rTJKy1kN30/cL0TAiM//gB9vQvlFCEOpI=;
	h=From:Subject:Date:Message-ID;
	b=d3iQb5C/zWGeToW4X4fe//5GBQ6HNLydTJCen2PBxE1LZlXuQ6VhBI+OOy2h9T49M
	 oJionNEkzfR+XuPic1+lHCGfTaaMbVNG4wb9k+2jtqIrmKJ/x8ZCn12cYI+9zYr7OI
	 w1PIEonsFvvqyD6Rp3rDUEE6NCFkBb9NellS4wls=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.62.194])
	by sina.com (10.54.253.33) with ESMTP
	id 6A8F84110000488E; Thu, 27 Aug 2026 08:25:56 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 2500656685188
X-SMAIL-UIID: 938E49097C244D3B8CD94B26DB73C7D9-20260827-082556-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+06fa667a0931a3430026@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	Hillf Danton <hdanton@sina.com>
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Read in stub_rx_loop
Date: Thu, 27 Aug 2026 08:25:39 +0800
Message-ID: <20260827002543.1744-1-hdanton@sina.com>
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

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 818bebeb63dd

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
