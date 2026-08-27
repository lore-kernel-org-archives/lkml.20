Received: from smtp153-162.sina.com.cn (smtp153-162.sina.com.cn [61.135.153.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E089B21A453
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 00:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787791611; cv=none; b=IzlxCDDMEFfv+ATQ84FWFPsT7URBRzwAEdRNfKMe5df+YJGKokDetzDTZq45o76P0qLEOIYou2tXDSNzsCC9WcGqCkZOUsabTQqMvhhfOi4M06KJxTxNnxboswu5Y6GOjEY4I290rq8yAqAgB9W8lsJZH2DL5Ig1Xq2vDIC8HFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787791611; c=relaxed/simple;
	bh=BwXs9sXjPxBuBWPcTIiteCDojP6r8tjBBzNRXAGprqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aRHy4jcSuAyW/B2fkGrI8eS3+GKtmQIsYh9ywoM++KwG0OWOZz9bzwvKoSZYGXq9l8gNlonQT8fAJ/mxpRYYDfFwh/VLGWQIaBnXuNmNiNK/MTFdFA+onD50frZKCLSp8MQTTdJucWPom2HmKEFgnZhHXv3MOpR1vsaUs7TDjSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=exiv8gqc; arc=none smtp.client-ip=61.135.153.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="exiv8gqc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1787791604;
	bh=Bzbw5GXehUKlDyJD9N5lUq+z9BfwSV9Q0pnIkgGy8GU=;
	h=From:Subject:Date:Message-ID;
	b=exiv8gqcWqPHURO/9ts/6bJ0AwnxdEWDBlvUg3C/4GKdUy92Uu6ObIamyvyq1A03+
	 SCY+p3VEfEOXTdOFWC2puFd1ZfS+Xd0e1d8+zeAUBONMKOzU3iXKJb6RZ9TTcl4QtI
	 HaN8VfjsRF5j1zIBe2LMsTl7RJtccdZgilievbkI=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.31) with ESMTP
	id 6A8F88C9000037C1; Thu, 27 Aug 2026 08:46:04 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 5347296815927
X-SMAIL-UIID: 96494F32C0BF46E78E7B35667A41DD6F-20260827-084604-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+06fa667a0931a3430026@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Read in stub_rx_loop
Date: Thu, 27 Aug 2026 08:46:01 +0800
Message-ID: <20260827004601.134804-1-eadavis@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6a8f1920.1d9ded08.62e62.00b7.GAE@google.com>
References: <6a8f1920.1d9ded08.62e62.00b7.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Edward Aadm Davis <eadavis@sina.com>

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 818bebeb63dd

diff --git a/drivers/usb/usbip/stub_rx.c b/drivers/usb/usbip/stub_rx.c
index 1e9ae578810d..85370b3bc600 100644
--- a/drivers/usb/usbip/stub_rx.c
+++ b/drivers/usb/usbip/stub_rx.c
@@ -606,7 +606,7 @@ static void stub_recv_cmd_submit(struct stub_device *sdev,
 		return;
 
 	/* urb is now ready to submit */
-	for (i = 0; i < priv->num_urbs; i++) {
+	for (i = 0; i < num_urbs; i++) {
 		if (!is_tweaked) {
 			ret = usb_submit_urb(priv->urbs[i], GFP_KERNEL);
 
