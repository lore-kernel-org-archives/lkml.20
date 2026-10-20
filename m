Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=61.135.153.165
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792470567;
	b=imS39RAeHTI/ZFYexEWLUd+RCf0dTesbbXCs8Wji3OoLcNOgTJahxXItPNIo/wccSVpL
	 bAKliM2meMzHIv06HUsOrqwpM7VCxt25E15SH5T3BYlIu4kr5HqY9tRF+Pnyi0ppSpI/m
	 iPiUHrPGbpM81lpdHssrwLaZ2nDICALewH7UewclL6z79MKAnD3sV7EW7cgRYk7kYGsTd
	 DN2sVylBKkFXlEIwKASNq1+2DN7ugvKouJCjoSpxPQVGQcicV0yWpkG9dmoEiFXDa0vZM
	 p6U+RFbj6yk1zCh6aYdID9TvA5SiDEA70cxlFsk1nIDX9S4n9cPJHriiILas9GWUwrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792470567;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=mCzFoDLWuL5MueYAMxrZxEvcLjQQoXlRUXfTpC3Q9fQ=;
	b=MzCWHSq3YygnyccCK+lRag0uHFisGTaCBqaK/5dwJhqnrkBE8Xn/q9jqrv+i6ffXtGru
	 J84X2OmcBTJfvYKqikzrOYJrVDd8oAuY8dmt8goDzl8cwrieKlAOeAFWVkN82dNA6uy55
	 rWhqOvumry6ChhGtOu1gRhmw/1msoxXbhIbXgfEIi3SPehKAiOB/r2Msb60F7PTSyl8LR
	 LdfiRzHK6emK9aAgbY58H+JpFXn3P2Y4miwTfW3pUXDyjfASTdm/AtkyDl+IMk9oOF7/I
	 N9gcC9ZfTBECLxjj7x/BbMeFVGghjmtXQZ5J29M5cGZIDnb6L2n06xkpYwb6hss2ymg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=owQqC7yE;
	arc=none smtp.remote-ip=61.135.153.165
Received: from smtp153-165.sina.com.cn (smtp153-165.sina.com.cn [61.135.153.165])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2469606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 04:29:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2469606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=owQqC7yE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1792470562;
	bh=mCzFoDLWuL5MueYAMxrZxEvcLjQQoXlRUXfTpC3Q9fQ=;
	h=From:Subject:Date:Message-ID;
	b=owQqC7yEfRVf+9cpH3KAts6n1Mc69iVaVP6zJGp66mGQJgtUQ3wVFpfyT3y0Y6yUW
	 erDKwV+DpTd5Znj2KzKYu3AJNFi64rmOdoFj+0t7AsoCvyHJTn9f+IiGqF/PTRI3aU
	 yfQEjWxkl2l2TpVPqgjR1tSrveq8AUgterLQik34=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([221.216.116.112])
	by sina.com (10.54.253.32) with ESMTP
	id 6AD6EE15000034ED; Tue, 20 Oct 2026 12:29:12 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 8600584457013
X-SMAIL-UIID: DB9C999DB87D4F2A9950C4ED4CF4C86B-20261020-122912-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+059a2795ad4cff2a2695@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [x25?] possible deadlock in lapb_data_received
Date: Tue, 20 Oct 2026 12:28:59 +0800
Message-ID: <20261020042900.875-1-hdanton@sina.com>
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

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 70dd4ee72eb2

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
