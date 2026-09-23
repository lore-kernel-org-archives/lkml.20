Received: from r3-21.sinamail.sina.com.cn (r3-21.sinamail.sina.com.cn [202.108.3.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392813AAF62
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790160986; cv=none; b=nVj/Y15JkwM5jxOaXWmVqz8Hb+n+VummGta5bJUd/T7DB35CQG3tsx7SaCcgCXzl0HMgnMbl02m5q9Xw/U/zXtVbzQS+hdUbIyz4L70/BioHP118B9zoCAsAVBUFVA/Q2TBFJwwavuDSEpFebYAVXND7AXFsKFTINUAYzF58shk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790160986; c=relaxed/simple;
	bh=zmC3b6pdxiH/U/JC0k/shEkrMtbgQW3YUdxmHb5/QkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FhzgRQDZYtUwosmxy1OOV06yIDzMrSUthaJpMOz7pKW2hCYNhAIoQXOZk5yssRSParNiTIUJ5UiF37N9OuNRcN787rLQ1w4AmIanM//fKDhLkp+BkXIZkIpx5Pe69FvXk9eV7d7p2Ns2cSdCD9HZMwhzM37H8aKi2HCxEes56VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=wXM7F9xO; arc=none smtp.client-ip=202.108.3.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="wXM7F9xO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1790160980;
	bh=3ld3E1kieTmSwQvUOMXsxB6JXXsMC+E/XubT+M7MaWk=;
	h=From:Subject:Date:Message-ID;
	b=wXM7F9xOSbIz7U5lYFIR/ol3Ez5pL96cvGyE1FCb/rlwIMOZl30bvjRfuUcn9HDmA
	 PYKdavMYajKIqr99xi2H7IsdF5RsXIPlq7p+WNUOZpS5TheiLkQGi0JoXEv8jJldtO
	 FtnEuxMfLMZIHcjRLenkd8ygKuZk+Yv34yfAR3b0=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.33) with ESMTP
	id 6AB3B01B00003731; Wed, 23 Sep 2026 18:55:30 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 5415726684944
X-SMAIL-UIID: 4882B670D1F1403D930C985F4290CF71-20260923-185530-1
From: Edward Adam Davis <eadavis@sina.com>
To: eadavis@sina.com
Cc: dakr@kernel.org,
	driver-core@lists.linux.dev,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	rafael@kernel.org,
	kay.sievers@vrfy.org,
	syzbot+9a321aea9d851b299486@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH v2] kobject: optimize count first value
Date: Wed, 23 Sep 2026 18:55:22 +0800
Message-ID: <20260923105522.43514-1-eadavis@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917075615.999497-1-eadavis@sina.com>
References: <20260917075615.999497-1-eadavis@sina.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The user writes to the regular sysfs file "/sys/bus/acpi/uevent\000" is
as follows:

write(r0, &(0x7f0000000280)='add\x00', 0xff0a);

From the parameters of write, we can know that: buffer is 'add\x00', and
buffer count is 0xff0a.

Since atomic_write_len was 0, kernfs_fop_write_iter() would silently truncate
the buffer count 0xff0a to PAGE_SIZE.

In kobject_action_type(), the strncmp() successfully stops at the null
terminator for "add". Then the code directly attempts to access index 4095
of the 4-byte string literal "add" via kobject_actions[action][count_first],
potentially hitting:

BUG: KASAN: global-out-of-bounds in kobject_action_type lib/kobject_uevent.c:86 [inline]
BUG: KASAN: global-out-of-bounds in kobject_synth_uevent+0x79d/0x7d0 lib/kobject_uevent.c:200
Read of size 1 at addr ffffffff8d72559f by task syz.0.17/5917
Call Trace:
 kobject_action_type lib/kobject_uevent.c:86 [inline]
 kobject_synth_uevent+0x79d/0x7d0 lib/kobject_uevent.c:200
 bus_uevent_store+0x3d/0x90 drivers/base/bus.c:917
 bus_attr_store+0x74/0xb0 drivers/base/bus.c:172
 sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6af/0x1050 fs/read_write.c:687

When the buffer does not contain parameters, we take the smaller of the
buffer string's actual length and the buffer count provided by the user
as count_first.

Fixes: 5c5daf657cb5 ("Driver core: exclude kobject_uevent.c for !CONFIG_HOTPLUG")
Reported-by: syzbot+9a321aea9d851b299486@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=9a321aea9d851b299486
Tested-by: syzbot+9a321aea9d851b299486@syzkaller.appspotmail.com
Signed-off-by: Edward Adam Davis <eadavis@sina.com>
---
v1 -> v2: change to optimize kobject

 lib/kobject_uevent.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/kobject_uevent.c b/lib/kobject_uevent.c
index ddbc4d7482d2..09dbee6d8815 100644
--- a/lib/kobject_uevent.c
+++ b/lib/kobject_uevent.c
@@ -78,7 +78,7 @@ static int kobject_action_type(const char *buf, size_t count,
 		count_first = args_start - buf;
 		args_start = args_start + 1;
 	} else
-		count_first = count;
+		count_first = min_t(size_t, strnlen(buf, count), count);
 
 	for (action = 0; action < ARRAY_SIZE(kobject_actions); action++) {
 		if (strncmp(kobject_actions[action], buf, count_first) != 0)
-- 
2.43.0

