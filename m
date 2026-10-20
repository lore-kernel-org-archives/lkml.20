Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.108.3.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792457400;
	b=i1fnoeffJvXzeNs4xr/m2nsPQc1jVfgA0IiUmQkywHaqh1x4ZpfzHMkdL27Uoqpw55Jn
	 sgzRRQMp4RM/H5QgD4TNLTY4OQmL3xVOrVRdQffdiSVeNOmcf1hF5kjIYlomSJHEHWIMT
	 kx3C77JfFmRWTszXMsh39deK2cgnmnqd51ydsmA9QJp1aRRc5cxebj3w8tVCFRlc5mHzo
	 gHkijzJ66GP1d5mpxxfEt5zV5yShmP6wjOIpjWIVs97x+xWzRSfrbXWEfP5gP+xoK3z4r
	 xIWQ4M5NTqv9lYOB/AKL2zf+LzOf6xhka/PqgiclmymtR3NpzD48nHGYtCKM+xHuT4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792457400;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=+abIs6JGtVJDYrViXruqbAOCT+E66w+f0GEYLymuYBU=;
	b=2iSP2kywi0hbVvTbylfJApsW4HzHNDEIw9rock1YCi6iqF95WILc5qovvuQnWSSkmFi6
	 1zWYlutkzryPXS3GAiIiAQCTouUX/GirA7uCTkIY6gevp0Y0olirfACNFZ5P18b2SJA9/
	 vunKBKhusK0TcvldB5XEpT5Do9n5fpOnrWeuAKkqkHuIKipJ1SQmPebRxbz365eL/F8DZ
	 MLGDxFmxowEV1dwcDPMs9kDPDSVbdu5Zsxpj6jHgkmHqlxZGdrFtK5gb63h482tSUsJc7
	 FcdVLwymaaG7x+46uO0teU3jw8W1tPWCqQJz1RoPGDV8DdAsMnMxRT1HDaK0W9Q7xfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=cFZABQBH;
	arc=none smtp.remote-ip=202.108.3.21
Received: from r3-21.sinamail.sina.com.cn (r3-21.sinamail.sina.com.cn [202.108.3.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79973606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:49:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79973606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=cFZABQBH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1792457397;
	bh=+abIs6JGtVJDYrViXruqbAOCT+E66w+f0GEYLymuYBU=;
	h=From:Subject:Date:Message-ID;
	b=cFZABQBHv4YenwI+DwDl4owtBc1cQMjzwdjKhXAZP1HIPjYs08j8oC8SK3sQZeVB+
	 JJCUgXWmgEIL2x2EI+VWweBP4cUawjoIYoFv6soVpd1EehawltHKBvq71EkMh1pMBV
	 5NO/rSOycpLvJfpFKMEmgnKxCEynXsiBnvvYfhUg=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.246.239.235])
	by sina.com (10.54.253.33) with ESMTP
	id 6AD6BAAF00002C34; Tue, 20 Oct 2026 08:49:54 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 157796685337
X-SMAIL-UIID: 1BDCA595C8FF4260AE224795627391E2-20261020-084954-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+059a2795ad4cff2a2695@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [x25?] possible deadlock in lapb_data_received
Date: Tue, 20 Oct 2026 08:49:40 +0800
Message-ID: <20261020004942.859-1-hdanton@sina.com>
In-Reply-To: <6ad66d73.2431563d.3b88b.0026.GAE@google.com>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Date: Mon, 19 Oct 2026 12:20:19 -0700	[thread overview]
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    2c7935600733 Merge branch 'bpf-zero-extend-the-index-in-in..
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git
> console output: https://syzkaller.appspot.com/x/log.txt?x=13598f01580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=964a8fc052e56fe5
> dashboard link: https://syzkaller.appspot.com/bug?extid=059a2795ad4cff2a2695
> compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=117c5031580000

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git 2c7935600733

--- x/drivers/net/wan/lapbether.c
+++ y/drivers/net/wan/lapbether.c
@@ -139,7 +139,10 @@ static int lapbeth_rcv(struct sk_buff *s
 	skb_pull(skb, 2);	/* Remove the length bytes */
 	skb_trim(skb, len);	/* Set the length of the data */
 
+	/* still with rcu lock held */
+	spin_unlock_bh(&lapbeth->up_lock);
 	err = lapb_data_received(lapbeth->axdev, skb);
+	spin_lock_bh(&lapbeth->up_lock);
 	if (err != LAPB_OK) {
 		printk(KERN_DEBUG "lapbether: lapb_data_received err - %d\n", err);
 		goto drop_unlock;
@@ -343,6 +346,7 @@ static int lapbeth_close(struct net_devi
 	struct lapbethdev *lapbeth = netdev_priv(dev);
 	int err;
 
+	synchronize_rcu();
 	spin_lock_bh(&lapbeth->up_lock);
 	lapbeth->up = false;
 	spin_unlock_bh(&lapbeth->up_lock);
--
