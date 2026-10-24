Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792821351;
	b=EoDNBz3sCq/1C5kQ4BE7IkZ5+tXihN4ZXUgeYtoDK5fdwnkbOTrCTFg3p+QMpaTUE5RT
	 6k3XFQo91IvHVi68m6lkViU1NwLVZ3X3Jere2B0aABo2Ws6RxSbq7GrgPiJNRa3im93r4
	 +FUnr0ET0vpBHV7aPtTQbZEMCt6QINk0OwaKwkAaLdceGKk+822B0WP5LVjYGTE2yzdZo
	 3D5oneUrGwm2T+olnhrn1pBxBpGrois2huD+Aj0/zgfWNyiOqC3nM9AOzwKpteOWyRWlF
	 uRSuvy/n2cBDfFTMsmj9cVp4fd/bpJrxEdQLoRYVrNADoP9gosGjMCQ8O0p6qZJg19A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792821351;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=P3RK9WXMHG0tuwk3Uog+befO1lx+KP55QEdWwZwY8Hk=;
	b=BfyDbL0znrBuO34Rz8z9VKWaqsoFC3AOXztxhHqITlVa19Ui2Tlv9H/M2rx0OdUigotc
	 u/qWRHgACo86EUIwKpU3Lbf9sQYPs4KsD4MAzMLrC6NDZsZgt6zwx5ohWvE6awB9taJ68
	 GwhwZtBgJDgfzhCCeJFyrBe9TZhA+qMp9oX6p1Fttmg7rGRlJS9VOQzeOn9lka6pKf/eo
	 MaE9ocX+7RHVeOkdcrpUTWq4sGytZQtnA0opGbvpcjNYETpmbWY9IskZ4UOKt2i6WhXat
	 qcFcISI0uoaKvF0rzERTM3jJnRqBEavfkD+KsQHnX0cJCKgqMK1OfmOn8ncdDrngUAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=Y11PTvEw;
	arc=none smtp.remote-ip=162.62.57.64
Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com [162.62.57.64])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF483606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 05:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF483606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=Y11PTvEw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792821325; bh=P3RK9WXMHG0tuwk3Uog+befO1lx+KP55QEdWwZwY8Hk=;
	h=From:To:Cc:Subject:Date;
	b=Y11PTvEw5m9/XAqe7Xi9bVHJZmOL7yDnxOB8+Y6PQEYNvJjZDvJVe3Z44LvejD4Aq
	 PacEWVh9TZEibVvtBcKbyWiwSJkFh4E+jE1b2+V18nYMvCPlMsjbPGkDTd7+jtJRX8
	 N1dAue72aWp01xu0zWeY3c+cI3mqHpMRf7IGir+s=
Received: from [172.18.4.77] ([111.31.227.58])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id DD789CDA; Sat, 24 Oct 2026 13:55:23 +0800
X-QQ-mid: xmsmtpt1792821323t8hmf2ii3
Message-ID: <tencent_850ACCC7270A3775F0BB75E4C3A9C2942205@qq.com>
X-QQ-XMAILINFO: NnYhxYSyuBnLddEWiolZDN8rxMmjnyYA8AA3Ph4NL8HEvtIZH43P+f7QYJMCZh
	 HusEN62fUX/ObDbfP+GY4i4bpYD+hnkh5169YZr/ix+9/bGYvGgJRFSUN6f/1A6BH5vR7VpnEbi1
	 PGgGz9cK1gKuA52APicHpxsjrgB0Q/bSrgJZ6XQXFveK2mUcuz48zroLCaktfTTaWnjiOhZg6YVO
	 337bfYWRBu+g1T8ImKAXzh1uZ5Gp/dlXVzL81vocYGkRtYvfW4Zy4/VGheiuDMLwgLeHgbT8XY4y
	 YIWfX3LqQG8P/7JBVQHWzsDIbTD6m10kRAo+uBz0wnoy+NFzP/m47/UZ3Z0mO51NJfaeyC0A9AhR
	 WaYAp+5UJ8XQqM3Q/JSj7HbfqTNCnqlLxzNXNPG3YXXxwYD5kTF7tqmrzwBKnEKTOIuSVjW8Q1fT
	 xF5u8/fyIYilTGq06PHgT7ZlCl0pmbnrjKBztCr9HyFRKZufHVyXG2CrHhGNOIgz3cGRE6pR+UlO
	 qkJoOwn3nIpV9I8jUGzvxlnRRHZxV80MtG0/m60q/BRZRKbbiROeq5MLLro6BZg7IIu/F1RuUvtq
	 w6h8ZQ3WAtB5Jrz7SqAHSm0CWGm5a/ef9kqXAocuiVps8Zbmhm4mKIkoUuGnKPXSPCkmJn8ZwRyt
	 t3ASYEl0BSC5Z61wfHPwvsdg43bU8xKC4JpylzLj9YMrI0KyXqe3Wf8H4Y6jH2ebqlC/vDDP+f9H
	 j+44zUcYnmHiQMXp8NYBrtP8XjvWbrbm9Ug5+4f4rHJWeYOLlkAoXjVIO7wEQxHP2tDZcCgPGqZZ
	 hXJS7m5ns7Ew/Vd3jRpjA8vwudn37wZzrKZa2YjtUGY+SYxQcuifABXI+IAke+M5fYnDaikvzw5t
	 Mi+nCrkGzVk/gbZZGTVMVnUZzhO9a6G5RLhdhGfQhVwCrJsmbWnzlbi93PMPwS6aTN7YwribUuz3
	 tHxcB2QRFUL8rwu+tGwCIkyAkr12RfZmB1SRw1+xTzmVkEDUD4WClsiVhqc7W/zpAUR+xJcLioPK
	 NJ6ANCInZPIbG6svxX6+kSYzjiTPQQPaYB+ShdTwuH+v8cidnLKseyU56P/SkFZRrmlGKMqg==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: Guikun Yang <yangguikun19@qq.com>
To: Dave Kleikamp <shaggy@kernel.org>
Cc: jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org
Subject: [BUG] jfs: KASAN use-after-free in diRead() panics the kernel on mount
Date: Sat, 24 Oct 2026 13:55:22 +0800
X-OQ-MSGID: <20261024135522.65244-jfs-yangguikun19@qq.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi Dave,

Found by syzkaller-style fuzzing of 7.2.0-rc5.  A crafted JFS image
triggers a KASAN slab-use-after-free in diRead(), which panics the
kernel when panic_on_warn is set.  The code is unchanged in current
mainline (checked against 7.3.0-rc7 sources).

The freed object is the dbMap descriptor allocated by dbMount() during
jfs_fill_super().  diRead() later reads it after it has been freed,
from the jfs_lookup() -> jfs_iget() -> diRead() path.

Full KASAN report (7.2.0-rc5, PREEMPT full):

==================================================================
BUG: KASAN: slab-use-after-free in diRead+0xa30/0xc40
Read of size 4 at addr ff11000000144034 by task syz.7.6792/81626

CPU: 0 UID: 0 PID: 81626 Comm: syz.7.6792 Tainted: G             L      7.2.0-rc5 #1 PREEMPT(full)
Call Trace:
 <TASK>
 dump_stack_lvl+0x116/0x1b0
 kasan_report+0xca/0x100
 diRead+0xa30/0xc40
 jfs_iget+0x9b/0x5b0
 jfs_lookup+0x27a/0x340
 path_openat+0x293c/0x3dd0
 do_file_open+0x216/0x470
 __x64_sys_openat+0x13f/0x1f0
 </TASK>

Allocated by task 81617:
 __kasan_kmalloc+0xaa/0xb0
 dbMount+0x4f/0xc10
 jfs_mount+0x28d/0x8b0
 jfs_fill_super+0x891/0x1070
 get_tree_bdev_flags+0x389/0x620

The buggy address belongs to the object at ff11000000144000
 which belongs to the cache kmalloc-2k of size 2048

Kernel panic - not syncing: KASAN: panic_on_warn set ...
==================================================================

(The same report was sent on 2026-10-16 but was rejected by the
mailing list because the list addresses were missing from the To/Cc
headers.  Resending with the correct addressing.)

Thanks,
Guikun Yang

