Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.108.3.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792925615;
	b=HJrFuZhAzaa15QQo6AN2JWUWnud64BjP+Mc33PQ7lOIiuVoUpJz+wyIdt7FbImqo3Q8f
	 JDCl8YltsT96aoYx6bVIhmlMzv7BsOJnhcuVVy0dn56UQDwuxisrbsHF/aRXqv4FPq9nU
	 vUMnL2txoFyklVNBbm+RR1rHYLR4FRZpYD/fGyv7XUe8fvLQkGKnQqIcJtfy+rQJ9Brro
	 nRfNpn8oCTBLMt/zKUJ4FpSRZLu2oMhoLYwvjay2sdYIXEyEUzOoyp0YIyG3SEtcvvXCy
	 mC4J0iXFqKqyp9ZH25OpbZ4WZzO+3O942ncssZSlxejZiJ99EDWI1dpbR3cXXkpcqbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792925615;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=zVPVIevQ2+RA/xYQCl+WFJZrVw4+BqUD1pwMwn5wSlE=;
	b=zyZXxP+1AS+3A9e0lZNHrH0iUw6v5sUL3lDSckpY1XHBW0w8riIPXiifrzQFQfWVMNdZ
	 pKu4JzypmfPIA+VDI2XK78+vpCBbtSto3v/R/RBu7ECMrKCO0/hx8AgNlGNfCB3amiTAE
	 bsy9CVb/RBwgAM5hJWbwJvMGJCJxJiXsIkzaSqxPiT/WYHO0hCL/36bBHokesHgbFW/zI
	 sRa2lvw/ktFpHeX/Cky3/XUwxBP2XIawMXjG7gZRVgOpDx/PwtzhYuoJTsbJ9Vr9CbiE/
	 rmNM5IKFbU/9Rz+/Lipf83KZ6M4QZWWpF4NvUB/ZMY6dJMhs45y2iG/mCE65mzvANeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=FOTGf9R8;
	arc=none smtp.remote-ip=202.108.3.20
Received: from r3-20.sinamail.sina.com.cn (r3-20.sinamail.sina.com.cn [202.108.3.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578D9606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 10:53:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 578D9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=FOTGf9R8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1792925613;
	bh=zVPVIevQ2+RA/xYQCl+WFJZrVw4+BqUD1pwMwn5wSlE=;
	h=From:Subject:Date:Message-ID;
	b=FOTGf9R8m3UMJq+fU1RLQsZuo3k2FQTBaBTxZKLA+4fIT/Lfr7tF1kNnWWy1qzWY3
	 aPakDCQqVA3SZPnUwg5fcliya0kypOy+kxjATAsQ4b5IUYAVC4GM+AzNDp/uec5U/h
	 T6BMLnvzUpyWaYPTXYWyYP3aSK1Qroq4J9mkhMis=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.246.238.232])
	by sina.com (10.54.253.32) with ESMTP
	id 6ADDDFA0000062DE; Sun, 25 Oct 2026 18:53:23 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 2673924456912
X-SMAIL-UIID: 340D044D953E496082DFDBC6D1EE664F-20261025-185323-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+8e6fc64255334ccf3ab3@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [dm?] KASAN: slab-use-after-free Read in snapshot_ctr
Date: Sun, 25 Oct 2026 18:53:09 +0800
Message-ID: <20261025105310.1134-1-hdanton@sina.com>
In-Reply-To: <6adcd395.998fdb85.f0000.0011.GAE@google.com>
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

> Date: Sat, 24 Oct 2026 08:49:41 -0700	[thread overview]
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    f47d223627f8 Merge tag 'vfs-7.4-rc1.sync_close' of git://g..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=127202a5580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=97e47414c855a3d8
> dashboard link: https://syzkaller.appspot.com/bug?extid=8e6fc64255334ccf3ab3
> compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16a47f71580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13edba35580000

#syz test: upstream  f47d223627f8

--- x/drivers/md/dm-table.c
+++ y/drivers/md/dm-table.c
@@ -400,8 +400,8 @@ int dm_get_device(struct dm_target *ti,
 		if (r)
 			return r;
 	}
-	refcount_inc(&dd->count);
 out:
+	refcount_inc(&dd->count);
 	*result = dd->dm_dev;
 	return 0;
 }
--- x/drivers/md/dm-snap.c
+++ y/drivers/md/dm-snap.c
@@ -1390,6 +1390,7 @@ static int snapshot_ctr(struct dm_target
 	if (r)
 		goto bad_read_metadata;
 
+	dm_put_device(ti, s->cow);
 	return 0;
 
 bad_read_metadata:
--- x/drivers/md/dm.c
+++ y/drivers/md/dm.c
@@ -823,9 +823,8 @@ int dm_get_table_device(struct mapped_de
 			mutex_unlock(&md->table_devices_lock);
 			return PTR_ERR(td);
 		}
-	} else {
-		refcount_inc(&td->count);
 	}
+	refcount_inc(&td->count);
 	mutex_unlock(&md->table_devices_lock);
 
 	*result = &td->dm_dev;
--
