Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.108.3.24
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794441268;
	b=yrzX+OGB9U/yN8lNgr82POWeTq/9zzidH8/Al3DKQWY5Y6MoNij6lrda9nY6zlnnPkSb
	 2wYGReoVYWvZSg+3vcW50inGcLK43o+pMicsElyOJjY+gDqGF3cQoJCZAGU95NqYqhUzA
	 g/9FJanfZ96LKLP3FBo5PYAMjXXCxf81b9jBNcP0ZhlwHzKF3kDB+MUNV6d3mv1/ftxQB
	 aVYFKIpWXrQBSG6eTpRxXW86k43z1gyewPQkbEtLMOnT8QqanzuWz0n9g+w1n9XksVblY
	 B6eFcYyceHVfY0Rr2YhO/ins2CHuuBu4OKQELg6u8xFxBhtpfTCr8LfOiw0E1fEz/Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794441268;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=UyAJ5kJwvbBsuuagMuqH0uqvCIRf2LNOJbAvJkGPWDc=;
	b=Ppm9mdvsAm3i0b7YOVhDh9DzZIUO+iUoAwZAQ57AsU/Yj5wd/mY3wEoo3mticucdp/8W
	 NMeMjmH3TPmz8UtBwY3X94ZMa44YA+s7AGcvo+6LOCBcmp/MDr2gthE4FYJCryVoSokJl
	 e0tO4pU1Kj8TvvZBqIWa0komkFtW5s7g1MoHfyyIG0/c2fSK08YmA+e1pZxzyvkIgyPyx
	 xFv5L1U2fAqbxX9dzWmWHLPJGixMmYWEpx6pNSRupjodPt4djJUVqgDsMyGRtrn5R0Rkl
	 NvlLiNL1xWvRmgafDeOImjWjEaAgIB/jk7m78ab7qIZ+Y7Yg9h9x1FfOehn2SsaKgNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=sDJmPVy6;
	arc=none smtp.remote-ip=202.108.3.24
Received: from r3-24.sinamail.sina.com.cn (r3-24.sinamail.sina.com.cn [202.108.3.24])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2AB606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:54:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A2AB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=sDJmPVy6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1794441266;
	bh=UyAJ5kJwvbBsuuagMuqH0uqvCIRf2LNOJbAvJkGPWDc=;
	h=From:Subject:Date:Message-ID;
	b=sDJmPVy62FuW8Te+t8W2UY0uxr+qHpgTE8lf9E8hrtoaXmvtMfvx3PiQxy4vRFSWq
	 whTjN581i8mWI6x6Kmsx5MGnjJTZRr/Mf/5HgPCYNof5Rcwuf4vYNz4uY7p73BF1ay
	 y2GKzVAdQ9kzZ88wSkjuLgHIG3WuB8tv44QR19no=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.246.239.105])
	by sina.com (10.54.253.31) with ESMTP
	id 6AF50025000001B3; Wed, 12 Nov 2026 07:54:16 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 9846096815980
X-SMAIL-UIID: A440C302B0374BF9BF0CDE3F682F057D-20261112-075416-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+b1146b58a9d6d90e0eb4@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [bluetooth?] WARNING in disable_delayed_work_sync
Date: Thu, 12 Nov 2026 07:54:02 +0800
Message-ID: <20261111235403.447-1-hdanton@sina.com>
In-Reply-To: <6af2d48b.4dd4714a.f8d02.0024.GAE@google.com>
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

> Date: Tue, 10 Nov 2026 00:23:39 -0800	[thread overview]
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    58c1eb84e977 arm64: sdei: Preserve the interrupted context..
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
> console output: https://syzkaller.appspot.com/x/log.txt?x=1070f24e580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=a58b6b4d667e7a61
> dashboard link: https://syzkaller.appspot.com/bug?extid=b1146b58a9d6d90e0eb4
> compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
> userspace arch: arm64
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12869155580000

#syz test: upstream  master

--- x/net/bluetooth/hci_conn.c
+++ y/net/bluetooth/hci_conn.c
@@ -1151,6 +1151,7 @@ static struct hci_conn *__hci_conn_add(s
 	}
 
 	hci_conn_init_sysfs(conn);
+	hci_conn_get(conn);
 	return conn;
 }
 
@@ -1316,6 +1317,7 @@ void hci_conn_del(struct hci_conn *conn)
 	 * rest of hci_conn_del.
 	 */
 	hci_conn_cleanup(conn);
+	hci_conn_put(conn);
 
 	/* Dequeue callbacks using connection pointer as data */
 	hci_cmd_sync_dequeue(hdev, NULL, conn, NULL);
--
