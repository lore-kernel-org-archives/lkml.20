Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=61.135.153.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380449;
	b=GVx7xGImHSMib0oWE62uG60qa8cyVOt5EdqK5qGDFcERBcm9k3JcNkIRrN5GbbZMTrHj
	 H6cCpOl+ot7x8ZYW3V0c4G7BcnHGrMVR3z2gx8esXil6isRGfnOgnHuamC6L4dbK+xl+w
	 4n36YKixgvN2JAF0RehC5GwKeAXwkhnnjadBrMbX4KjW8NumObUdpptgiwoU6KUSXCds+
	 i5PJpyaPw2uTdUAb2WcY7jnZyAfgSM/iBmN8J6BEcg9h4Qxe8ifGSnzp0OtnTfkfVAbxt
	 SZGqYkLx3axcmEnexOvywrd5YgOM9JG7zwJ3HnCIvHs47c51itMhYgSqO6ZO+oXKkzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380449;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=2ouSIVibQ0IAuWP6veUt46S6PYfL1Q7e71p91rBGGR8=;
	b=jDP0qI8hdfIi5yY+L/trX7RCz0DElfss/+Vm/1EiyOm1QUn3LujtdO7FcaGGVpd2yWGY
	 ax+yYY6MZ3vit0+Wkxja8tvijqBRcvgt+Wvn0c6J1PGE5uq2W23WyvPEXXokRToj1HXAo
	 vwmm4lChab/AQvsftMKZ+Ly+y8390jwOgeb9icyaoT1l4HveeouJMZLMZd09mlkWja5Vo
	 hZ8TLflCR93pjT57EjzrfsVr0ynulmY+BE2F3lr5d7FlDhjASNBywddOJhXNtFDo1Zqag
	 5C8SKJKnvioyKj9GptlrXgyFMmVymEAvNxobmZIjTFcU9vRXnsxxAsK89ZYqjAqQj6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=lFc7wsOv;
	arc=none smtp.remote-ip=61.135.153.166
Received: from smtp153-166.sina.com.cn (smtp153-166.sina.com.cn [61.135.153.166])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2E7606A320
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:00:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF2E7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=lFc7wsOv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1794380445;
	bh=2ouSIVibQ0IAuWP6veUt46S6PYfL1Q7e71p91rBGGR8=;
	h=From:Subject:Date:Message-ID;
	b=lFc7wsOvdNMlMLuTGS6/3FhI2BV520y9+2NOBUXRZw3tSLd2YJpUKldUvl+UQx3Ty
	 wuj26Fgr3obDuCSzluUdLU3VmlSZuIphb8QcOODHCWhXsYTkRIWkb+4KxHkM4VZg+U
	 rq1gRppMjx0SfySzRVq1Bi9GoRQSBjDRFO0ICo0s=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.244.129.109])
	by sina.com (10.54.253.33) with ESMTP
	id 6AF4128F000073E2; Wed, 11 Nov 2026 15:00:35 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 2496976685437
X-SMAIL-UIID: 234134A976844ED78BCD497480B8C07D-20261111-150035-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+b1146b58a9d6d90e0eb4@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [bluetooth?] WARNING in disable_delayed_work_sync
Date: Wed, 11 Nov 2026 15:00:36 +0800
Message-ID: <20261111070037.422-1-hdanton@sina.com>
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

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci

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
