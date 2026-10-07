Received: from r3-11.sinamail.sina.com.cn (r3-11.sinamail.sina.com.cn [202.108.3.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CC82E719B
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 04:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791348746; cv=none; b=fbBQBq71Nff4p80NtNTATR6ARwIkhUv9VCZfu3c/puUTcYRPZWNW/kklJwvySWTMH9X2lsqmSr+b1slIpQW1vY29xes7yw5cgrBfGR5y6q7zk5/tQ1EYQp8zPN6HY8u4CEKSVtFW/qzVIBRtGS7LfoEdPcNIekRGjUBU5l5tQ0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791348746; c=relaxed/simple;
	bh=ZsHY4/dMSMNfjQa8ZHc0RKLN0iSSe3TLWI7SDApVbTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qw87T/U/8Zuw8uOp32gXxlZBUUBFpNeIrEG73yhcUhibv/hLjvxc9ixz8LFHhuy5/hAZDWHJkMaCQgZ11CeZMzxxhTCURJPBo/Rm5bUyYYB8LlMePt/2GR+Pjw4jNjsNJ29PHlv50Eijwoa8RWVXgtm90LbSr/rTqQC8/nAIkdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=KKnbhb3Z; arc=none smtp.client-ip=202.108.3.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="KKnbhb3Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1791348741;
	bh=t0pVquboWProfubWZHiZLMJ1kGNqG38MaSrdnvIi4js=;
	h=From:Subject:Date:Message-ID;
	b=KKnbhb3Z5eG0jo4TiHKJ2rk4L2BDt5rj+y35BU/Q0eMI49VZADK7B0kWJMfjF11uj
	 y/66aVcnPP6J5JSZJOwXTAEu00Fu2Q9E5evJ5BFyClaoJ6OvmpqLsCxuOUDTwJW5fk
	 QB0LN0p5aJsE9FCkalp/WImIE5GW/TsqSzxhB+OQ=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.62.194])
	by sina.com (10.54.253.34) with ESMTP
	id 6AC5CF6E00007CA2; Wed, 7 Oct 2026 12:49:54 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 688576291662
X-SMAIL-UIID: C520E789C396490EBA8F43E74923A967-20261007-124954-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+1fed874be1d7e459b5a3@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [bluetooth?] possible deadlock in l2cap_chan_connect (2)
Date: Wed,  7 Oct 2026 12:49:39 +0800
Message-ID: <20261007044940.349-1-hdanton@sina.com>
In-Reply-To: <6ac51f8d.353c8d8e.177895.0006.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Date: Tue, 06 Oct 2026 09:19:25 -0700
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    2c3418fffa9d Merge tag 'keys-v7.3-rc7' of git://git.kernel..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=17ca6ff5580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=929e4854a828f434
> dashboard link: https://syzkaller.appspot.com/bug?extid=1fed874be1d7e459b5a3
> compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=101e6f25580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13cfbff5580000

#syz test

--- x/net/bluetooth/rfcomm/core.c
+++ y/net/bluetooth/rfcomm/core.c
@@ -42,6 +42,7 @@ static int channel_mtu = -1;
 
 static struct task_struct *rfcomm_thread;
 
+static DEFINE_MUTEX(rfcomm_cb_mutex);
 static DEFINE_MUTEX(rfcomm_mutex);
 #define rfcomm_lock()	mutex_lock(&rfcomm_mutex)
 #define rfcomm_unlock()	mutex_unlock(&rfcomm_mutex)
@@ -701,7 +702,9 @@ static struct rfcomm_session *rfcomm_ses
 			return NULL;
 		}
 
+	mutex_lock(&rfcomm_cb_mutex);
 	list_add(&s->list, &session_list);
+	mutex_unlock(&rfcomm_cb_mutex);
 
 	return s;
 }
@@ -743,6 +746,7 @@ static struct rfcomm_session *rfcomm_ses
 {
 	struct rfcomm_dlc *d, *n;
 
+	mutex_lock(&rfcomm_cb_mutex);
 	s->state = BT_CLOSED;
 
 	BT_DBG("session %p state %ld err %d", s, s->state, err);
@@ -754,7 +758,9 @@ static struct rfcomm_session *rfcomm_ses
 	}
 
 	rfcomm_session_clear_timer(s);
-	return rfcomm_session_del(s);
+	s = rfcomm_session_del(s);
+	mutex_unlock(&rfcomm_cb_mutex);
+	return s;
 }
 
 static struct rfcomm_session *rfcomm_session_create(bdaddr_t *src,
@@ -2220,11 +2226,11 @@ static void rfcomm_security_cfm(struct h
 
 	BT_DBG("conn %p status 0x%02x encrypt 0x%02x", conn, status, encrypt);
 
-	rfcomm_lock();
+	mutex_lock(&rfcomm_cb_mutex);
 
 	s = rfcomm_session_get(&conn->hdev->bdaddr, &conn->dst);
 	if (!s) {
-		rfcomm_unlock();
+		mutex_unlock(&rfcomm_cb_mutex);
 		return;
 	}
 
@@ -2258,7 +2264,7 @@ static void rfcomm_security_cfm(struct h
 			set_bit(RFCOMM_AUTH_REJECT, &d->flags);
 	}
 
-	rfcomm_unlock();
+	mutex_unlock(&rfcomm_cb_mutex);
 
 	rfcomm_schedule();
 }
--
