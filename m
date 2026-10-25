Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=61.135.153.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792890113;
	b=KJ8aUPqweyWqZ7XAE6xDcQZ+DfFfRXlqS9PFqro6zamrC+WkwCvOCWMJJ18v7Z8gAVEp
	 kV0jLUIO7aO5d+QB6VuXPJHR7MUvwWNuVPJrTGSXhpt+0OM6LTmxd87MulljD/JNne7Pe
	 UJfx2A9/NpZU4AhUStl2jAh3oeMMqUIrUIPuJsMm5Wn98JpvBVh6Wg3tho82+YKOZ0D2P
	 lS6LdRy0lBiwSPloFxrsotFoFK7BN88sfBHkWID4sTJZllhEn/CZSJl2afcb8tRud5UBQ
	 c14jL6AhkX96e1LO73qHpGaTOOa/ZdLFJYO/e99SDHhcbCdyy+ZWf4vrnGxSq0tlHgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792890113;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=yqTKmgmP2zf6EFfDClO8G04+2/dJbqhXtznY2IQAftg=;
	b=eGq6hPdqyk4MG+pPHwEOu42+Mrt31CM4xqONdtihz4SeS2OKAmZXkoLW0zL+AaaTIMs/
	 iydxfQoApoxgnwYpmdKqlsSQNqq7a+7GJ1HK5xysXLWeSMNkmyoilxMxTNTNmQU8htMfA
	 PZ8lnOqXo4UAsW/RGGmOitFkAfpnZxbpKlUejDjYCv1F7OQMzEJQbf1NYm/fA9ONfBdAM
	 a2b2dEAjHcVnJrU2E6Ju8+2wph/PWIkczWhH6Hx4AMHkVsv+odVeY83RocAf1zyytHFyT
	 TUNMJNd7dZBvZBi8wRhKd5x+jUToOCM9m5Bxhnvk8o25SZFhsQbqZP0bAysvum2rrvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b="pcwd5t1/";
	arc=none smtp.remote-ip=61.135.153.163
Received: from smtp153-163.sina.com.cn (smtp153-163.sina.com.cn [61.135.153.163])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4219E606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 01:01:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4219E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=pcwd5t1/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1792890108;
	bh=yqTKmgmP2zf6EFfDClO8G04+2/dJbqhXtznY2IQAftg=;
	h=From:Subject:Date:Message-ID;
	b=pcwd5t1/e4F8o+CKu0hyyE/G8ncSE8fEATNh+BBD7pFAnYqT0xLf5XGBvdVTgez6t
	 CIeT0f3hpCCdtTAKkk6Phm2xPBu1O0OtDC102P59iFTNjYKIohVHa+xjj+kakKwol9
	 17LsbJuW+q0viu4WK2AaC3qFPRpjoEIUFBQEsR+k=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.254.1.249])
	by sina.com (10.54.253.32) with ESMTP
	id 6ADD54EF00003890; Sun, 25 Oct 2026 09:01:38 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 8697174456657
X-SMAIL-UIID: FB151329637B45088D635C168D864685-20261025-090138-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+8e6fc64255334ccf3ab3@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [dm?] KASAN: slab-use-after-free Read in snapshot_ctr
Date: Sun, 25 Oct 2026 09:01:24 +0800
Message-ID: <20261025010125.1085-1-hdanton@sina.com>
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
--
