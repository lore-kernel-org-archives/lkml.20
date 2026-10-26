Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.108.3.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792988507;
	b=WqGF9RIQpaArsp3/oOi5ldWwoGZ2KYpfhUromoY/C/imbVoPtRCB3GDHWZUulAGa/3Xh
	 ljEc72pShGFD2+3Zza+ENMBc7OQBFw/amdjWvre8j9+QPTejjVa0wQkW9UKG2Mlih2vcG
	 eaPtACMvoB48M2dcWUdcyiGC+tVb125cbyZGpAxQCIbrBjVZRusILUjD43RNk5UwLlvxX
	 yRTyOjuq2FL7aiITLAde2dMlxzGexuCCb0pPV24HZtl5aFyC6+wF/Z7mmkl0iV93LB6gG
	 xT5yn2ltkUX2/41lijkcU7+Z7AxSolR9NlCuRVTkpm+GRTFY9/Rn/ymO8N3nRC3QRew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792988507;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=CUCN+Yc9xrYZdlF3x/awRVSb0dFgGk0gG/fA1JFqvus=;
	b=BjyDqieYGfYdUJF/0N6YkfOlEk+AUbGyVn/Xo7xpIbulH0mro/TSELiFo3a+440bDjHK
	 c7BUvFhnidBKrK5qPS7AXq+2f4wECdkzuMS+WqTyUBBxWBYhta+QPMNTij2F7nuCEXIfH
	 HPR86r+JfkF5JENeg8K0g8pbsePZG7UTsv5eFChg6unmvGDWMYlO9pOmfzp5blVUFdU5y
	 9PbdY3EO3BZNqYYYGEXHpApAcXTyBKCrdIA6bgJezbthpaY0ZbALfmwdA4ZLfIRokXjgi
	 jeIjm7GP87jopfs01JxPvhwduNREsC7JHdAZPvXOKL/TNyFigrUWZ/Ihyz0h2NSyh3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=DhcP4ZJw;
	arc=none smtp.remote-ip=202.108.3.20
Received: from r3-20.sinamail.sina.com.cn (r3-20.sinamail.sina.com.cn [202.108.3.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D87A606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:21:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D87A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=DhcP4ZJw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1792988504;
	bh=CUCN+Yc9xrYZdlF3x/awRVSb0dFgGk0gG/fA1JFqvus=;
	h=From:Subject:Date:Message-ID;
	b=DhcP4ZJwG1RxeR1KDiBzZr93CkpcDdf5k8ZtG/gpwlMCNh3RkKNUVCxr2EHWwexiH
	 6chf4sdlS3ya+14OR02YqUI5TvAvtN6C81rs70zead450VtGRXIwFBoCt0FIzGbYUg
	 lmxKzs1QaVwUZ96BmgdwmOqOWKJSUKvGWbxmKmZk=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.32) with ESMTP
	id 6ADED5510000216A; Mon, 26 Oct 2026 12:21:40 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 6065414457132
X-SMAIL-UIID: 2283B7CF7A9F49A08C918F959AAAB6EA-20261026-122140-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+a2626a25eb2595e3ec3c@syzkaller.appspotmail.com
Cc: agk@redhat.com,
	bmarzins@redhat.com,
	dm-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	mpatocka@redhat.com,
	snitzer@kernel.org,
	syzkaller-bugs@googlegroups.com,
	ejt@redhat.com
Subject: [PATCH] dm: reject kcopyd client destory if it setup failed
Date: Mon, 26 Oct 2026 12:21:37 +0800
Message-ID: <20261026042137.178310-1-eadavis@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6addec28.412b1182.196980.00aa.GAE@google.com>
References: <6addec28.412b1182.196980.00aa.GAE@google.com>
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

The value of cache->copier is -EINTR when failed to create a rescuer
kthread for wq kcopyd, in cache_create(), the code jumps directly to
__destroy(cache), it merely performs a simple check to see whether copier
is NULL, potentially hitting:

BUG: KASAN: null-ptr-deref in dm_kcopyd_client_destroy+0xae/0x480 drivers/md/dm-kcopyd.c:980
Read of size 4 at addr 0000000000000174 by task syz.2.19/6560
Call Trace:
 dm_kcopyd_client_destroy+0xae/0x480 drivers/md/dm-kcopyd.c:980
 __destroy+0x172/0x2f0 drivers/md/dm-cache-target.c:1973
 cache_create drivers/md/dm-cache-target.c:2604 [inline]
 cache_ctr+0x1674/0x2bf0 drivers/md/dm-cache-target.c:2649
 dm_table_add_target+0x58d/0xc70 drivers/md/dm-table.c:749
 populate_table drivers/md/dm-ioctl.c:1602 [inline]
 table_load+0x325/0x8a0 drivers/md/dm-ioctl.c:1645
 ctl_ioctl drivers/md/dm-ioctl.c:2221 [inline]

Set copier to NULL to avoid destroying a invalid kcopy client.

Fixes: c6b4fcbad044 ("dm: add cache target")
Reported-by: syzbot+a2626a25eb2595e3ec3c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=a2626a25eb2595e3ec3c
Signed-off-by: Edward Adam Davis <eadavis@sina.com>
---
 drivers/md/dm-cache-target.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/md/dm-cache-target.c b/drivers/md/dm-cache-target.c
index 1a5072425c4a..b562bf59124c 100644
--- a/drivers/md/dm-cache-target.c
+++ b/drivers/md/dm-cache-target.c
@@ -2544,6 +2544,7 @@ static int cache_create(struct cache_args *ca, struct cache **result)
 	if (IS_ERR(cache->copier)) {
 		*error = "could not create kcopyd client";
 		r = PTR_ERR(cache->copier);
+		cache->copier = NULL;
 		goto bad;
 	}
 
-- 
2.43.0

