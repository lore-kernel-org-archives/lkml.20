Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.245
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793676421;
	b=CL0tdAp3ozJitYWaEXwQQwnJLwDqkg50sc46VhU7LbVOgR3oeH7CQZt9u1kn6Vbr86j4
	 8ndlijmWZVDMCly66iXBuiIVQNhSBhvZC5n390SdqJ1B+ePqzeV1mNFqpfVndMT1f503X
	 lUf3Xff4pafQ9Xftih5vevGXzoqL5xYZAko8pM0yr0VYpLPBwAgiLJoWjmX+/3MLHs+jr
	 FUyzs/tBret7LE0Y4w0JoKZlS7o0+cZf9QaYo4TF/sZEtexpp8725DB0ZDNbhYxDfF6Gy
	 0DCl0vSM0+XtnZ6Yw+cRC3YTWAAxqi5hjDNcuxPmoqJpfDdVNhJ3b+5QHGjamgG0xYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793676421;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=7sXvPNBaxHdWaLLan0lLsEk3zIV5UYZaQkD5N7bRqig=;
	b=G0Diz8wvHgvohSTknqNTq/9/Bi7zc9Wpd1UA/QujJ+vM3YbBI71p93jXQaWIjOCssvzb
	 E7ue5lAflyiFLbq81qN/jSbELjb7fOem/NQhQHhugxL3DLbEQVeKU/7kDo34bWpKMn1SE
	 e32jKUWTuPN8YYnaygArRZhyaqClMXN+NJl7Td6d319/n1Tuas/kucU+kkoYZrCNKPnqk
	 zz35SqWp+NDvBOcj6IJvPL3A8NkX3hGPMrQ8pTkWHqgy00F351aYE58lnHe9D01VUXFMm
	 b3HZk74ppXtjO8SkYLMmuh6FLT4Nb432mBZ8Mx0pAWbMbpBoCFJPXWGsS/HiNlY/Qfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=I6lGbH2z;
	arc=none smtp.remote-ip=203.205.221.245
Received: from out203-205-221-245.mail.qq.com (out203-205-221-245.mail.qq.com [203.205.221.245])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B53606D802
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 03:26:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98B53606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=I6lGbH2z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1793676410; bh=7sXvPNBaxHdWaLLan0lLsEk3zIV5UYZaQkD5N7bRqig=;
	h=From:To:Cc:Subject:Date;
	b=I6lGbH2zaVPWaLjPEcHLNkSAEqNj5chJw9+eXzPL6IPVe7uOrSXLBYyRdJepUJYGn
	 owZyY1x3AHHaoJpMbgP2AnyjCsk/Jd+6nc/M5hw53oKRIWxCeFu5NQmSeu+R82bivp
	 ZWyUcBuwsKBxOvvX7LqUZhd0Hq2pK/dTd7BVkkGc=
Received: from shuai-VMware-Virtual-Platform.. ([117.158.156.198])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id 6AF9942A; Tue, 03 Nov 2026 11:26:47 +0800
X-QQ-mid: xmsmtpt1793676407tgbprm8d0
Message-ID: <tencent_A21BAE90D8EE04A5FB98B4168BA73C695306@qq.com>
X-QQ-XMAILINFO: MvUAcPkRmFBfe/k0sJA1gXnVBGWOmN+E9nwdKqhHlDHiisGEPnQQgrKhQ/6Utj
	 zm8pIokQRVlTcbXkkbFkAk8pw6RcVcJvpadsmpDHhm2s4mjNZ+Eq6TYHuy/UY2EPa89FwCkwv3vw
	 0y1Dbg9HDSnNh6mR+qGjpFDDwMKTerjDlZyGcnTiuCYYz5kod/loeKRbllFSCm4o+7A2L4mZLkdF
	 5XjtyJNAJe9JHlyxBd9z41ZkMe2G8AEZNdOVXY5Vs9EKyK+IaqG6G0HC2BQqj4sWaCzFFDekySRk
	 kioT7rmTOsj99OkQ1odU56p5DwzfCbh75Mm8OiKdSSIo0RBjPNFEZnXcCMEVgUv9eu5lP7DPbhIB
	 Ukp7cbcBp0vbNLo7JgNdyfl/LrrAbztm/0r2BKYY6WM5R8NrkPxaJQNAdoeYw+2LPCSY794ZZ3lS
	 n46bvIPpETVmrLw8HcvO2JxATfUzgCLgXBTBKvfTg9iZdT5MP8mr9iwF0EuqqWL8i4JnRZvt82dw
	 GLDcL8MLaVjwKYOqTv4nXG/uodrcWHF+rD12k3dIH5mE0WlChbBN+BVxevfyKO2YXhgWMkca3tpn
	 mHG51pHpIAiOwEeRIIRsAoSghyYYQ7PXOS4NhMiw2PlcW3jpycdgsaYCPD62n0Pj6ZiC2vLOPbOb
	 S0P7dGYHrwYcKvtFr5Tu0lv1rP0vEVXtnppK4+2TyqPVV3gtebYWIeevG5pgFenL5aGL0if5XrVO
	 SZhJSiNrsgSRLUBqhPHFd9Ro54GQIKiAzvK3tvSCID/0I1U8MnRmincIFAPnIMHA0hFjil7ql39j
	 bKIjhkcJ48wUmTfi0hQPVqfEZowGSrQOn0oN/EmzPgIwnI2kyiw6/tkK6CXNG7NwdHRWUVseLf4x
	 I3W9Zq4mdKYrD/ojbWjNU5MF3lQTa8ikcF2P81kxxP9l2QaW0GRSrjGlOTLzcFnD55BPYqhtvwf1
	 bAuLaIez4NraZSmdBJnTOkQYrUtJnIcIQphrcG1a6cAkLEPUGvxv9Tg+15nFfVdiP+Ba0ujPpd8k
	 0PWeCcBEzc3lWFwmhUzxy5yBWsyfcgfh3zPzta15gXcu9ukbIE13Q5mDwXAiY=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: Shuai Liu <847807867@qq.com>
To: linux-mtd@lists.infradead.org
Cc: richard@nod.at,
	syzbot+3a8099322b09d8d073d1@syzkaller.appspotmail.com,
	luquijeffrey@gmail.com,
	linux-kernel@vger.kernel.org,
	Shuai Liu <847807867@qq.com>
Subject: [PATCH] jffs2: initialize f->inocache to NULL in jffs2_init_inode_info()
Date: Tue,  3 Nov 2026 11:26:47 +0800
X-OQ-MSGID: <20261103032647.70138-1-847807867@qq.com>
X-Mailer: git-send-email 2.43.0
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

new_inode() can hand back a jffs2_inode_info recycled from slab with a
stale f->inocache still pointing to a jffs2_inode_cache that was freed
by a previous mount's jffs2_free_ino_caches().  jffs2_init_inode_info()
initialises every other pointer field but leaves f->inocache untouched.

If jffs2_new_inode() then fails before jffs2_do_new_inode() assigns a
fresh f->inocache -- e.g. in jffs2_init_acl_pre() -- the error path does
make_bad_inode() + iput(), and evict() ends up calling
jffs2_xattr_delete_inode() which dereferences the stale pointer when
reading ic->pino_nlink, causing a slab-use-after-free:

  BUG: KASAN: slab-use-after-free in jffs2_xattr_delete_inode
  Read of size 4 at addr ... by task repro
    jffs2_xattr_delete_inode
    jffs2_do_clear_inode
    evict
    jffs2_new_inode
    jffs2_mkdir
  Allocated by jffs2_scan_make_ino_cache (jffs2_do_mount_fs)
  Freed by jffs2_free_ino_caches (jffs2_put_super)

Fix by clearing f->inocache in jffs2_init_inode_info(), consistent with
the other pointer fields there.  Verified with the syzbot C reproducer
under QEMU with KASAN: the UAF is reported before the patch and absent
after it.

Originally proposed by Lucas Jeffrey <luquijeffrey@gmail.com>
(Link: https://lore.kernel.org/all/20260909023955.1642244-1-luquijeffrey@gmail.com/);
that thread has seen no activity since September 10 while the bug is
still reproducing upstream, so resubmitting with his credit.

Reported-by: syzbot+3a8099322b09d8d073d1@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3a8099322b09d8d073d1
Suggested-by: Lucas Jeffrey <luquijeffrey@gmail.com>
Signed-off-by: Shuai Liu <847807867@qq.com>
---
 fs/jffs2/os-linux.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/jffs2/os-linux.h b/fs/jffs2/os-linux.h
index bff2134d771d..e80b786c9ea2 100644
--- a/fs/jffs2/os-linux.h
+++ b/fs/jffs2/os-linux.h
@@ -55,6 +55,7 @@ static inline void jffs2_init_inode_info(struct jffs2_inode_info *f)
 	f->metadata = NULL;
 	f->dents = NULL;
 	f->target = NULL;
+	f->inocache = NULL;
 	f->flags = 0;
 	f->usercompr = 0;
 }
-- 
2.43.0

