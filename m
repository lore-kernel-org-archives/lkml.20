Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794217384;
	b=J2CC493AODxa5qb8UFI/wkKKdRq8Jd8bMrRf3/mUs18wvE9LKfbjZ4s8TpwHp/sf2Iqb
	 syKdoHxBZn8N3VRlJJQhuL+qT+stl+MBQ9nfALvLcYKoIpmweVD+osg/jZOCzLD8Jm/8E
	 DjTP7ypfiMo+ZeBFCM70qnFt91GKcdfefPI2xtQmM0/wLySdB3+4TCvsyexSrQIG/33rL
	 vD0xt3q3bb8JetO1aF9dPBTyKkh0GBJ3xFInmTxPddSBA9N4PLkwSdJoIq3LacbLjb8EG
	 CC8uY8m7WNdimtPmJ3vBG6HBXmmOKIrdXT8+DqXpFBUdFoddNVXsOzz/OISoKyv3CeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794217384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gqkduDJsU90RYsspBtEDgzAr8laZJiGJQKiyzYsJO0s=;
	b=bRQZ38m22zd6F+Bm4cqDvs9C2p+Tnezp99Ikb6g9I6ZDUThdjmxUzi/zzoSVOBpDI+Et
	 FEE4iNHHaZgT9FlTdE90N6VbKzgLGMy6fZhWvCnjiUVHB0P5usFc58tGS2BzkU7vXe7Fm
	 FEK37ZHTyR4TciCNr2v3jnyRcYo7cFVhcW3As4laGFBp90grwiFFi0EhyLFgX7ve23xuZ
	 T2eCrDzugUPRyu0/Zs6GKxpNQ9xb6veXVLiOyJ+w0cMNPaUC641skb1Nqyf5jCTsvGya+
	 iLE5EOjzKpDp/Si8UqSGR5Vi8taTC9SjsICTfU+rF5lKHfSl7ib7aYyas/KU/ciZKeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qHWq1h8k;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CAF606A323
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:43:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58CAF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qHWq1h8k
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-37000e7234bso216409eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794217383; x=1794822183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gqkduDJsU90RYsspBtEDgzAr8laZJiGJQKiyzYsJO0s=;
        b=qHWq1h8kuhl8AnKXCghZeFn5xVLptWCV/ciN7hxaj5pXpeSOCQxm8wsMuipKyOPZwA
         PfR2oEtDNbO+wRHq8IpdTgYmyxXk3mWbaWHHdy893/JNZxhMWuUL1LzXHhf607xQQ1bE
         mDlbhIJTCEFXBY2s54BrA5Xw4TemH0YB1aIjQmSXesWrL0PE0d2qksQX92gZXSaFAMSn
         uOMFoHxqllV0o1N3oKtjoHIsWTnqHA8PMlrxzNXZTvwt9HCu5SEHhZVvFZCm5CxivgPF
         2tLebjJr+Dg9D1ijz7P/+9id1mlghHRBOgh+jfsF74RDO1wAx+bAqjFtl+wivzHo3kEC
         N0yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794217383; x=1794822183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gqkduDJsU90RYsspBtEDgzAr8laZJiGJQKiyzYsJO0s=;
        b=yxfXGEdMaEabHmAQVwpKf5Rxi8imLCmyeVaN+VYZWo83YVlndtLQ76fWpZ5sbpkvzq
         J94Ya2SWWZUqRk9Mvkl3UNuQLupQ/blUQI2654lzUYGmJfrsHNWgAUoaiwhjCoViPWpD
         d5XzTm9KclA+S/E0/qJT5nXsBElFqkupnEwChl72nG2qPDEjC3kyZ2nTHJ4dywfq6zzU
         06Irzi1a+9vezgLXtifkTPz2VHdefROOebi8ImQFLKG6LxLO9gxbuY9mhxKfQAaHENzb
         Eyx3suZlWeZtsv3mwW7YcPG4EPUU5cW6MQoieAqrxswz56VaD6E0cfrfP0try0J5W40E
         hhMg==
X-Forwarded-Encrypted: i=1; AL+hErF9s2ciuOtjW1QaMQduL1RA+TdAnw7/iFliD8dkSKh1Y/bYD4Eb3yFyHi1JiYQedrb6xbVOLotr3zkc56Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HgALOX950M2RkzS1zwnV1nJiydaeXq/B7Hf2FFadR7+HTu/VX
	kNEDvfuu1Y/cmVO0dnPmLMGftHR/0ACBlfkxSOGegunNzFRr/jMNpoHk
X-Gm-Gg: AYBFou0CU9edfJWfd6pS8jhs+WOhO7Gk+wNWjRtNHQy7W+0vO0O3nJPcB2tWISqdfoV
	RT+5EHnQPMy3P3hSZQMECWliMeXAtZK5B0fBA9uPEDPlzBdwnspAYHHOOiXM9C2/xJCsR3cOzRG
	CteasBNwR0P6E4rUhaWk43OoteF2vbTANXtB/CWUUNANilEzTu50gMtpA/MGkGeeOW2RAGZg7GD
	irfxdm1V7zKxvohNQRm+vBRFYMWt32n5OLkZMuYGaXQkV0WJVJwT1ROVY9tD1PZnOP5DPMlYK6t
	RNRdEKIQMhWD7eyPcV456l2p+nacnqzhdI6MOM+tP2ki1NfLXtnlmrpw9UCZ6XYLbmHUo6x4D6B
	mwlPM40TBnH66HDbXeuVw8aPg9iyrarhLOjrvk3BX17OxCm/7wBRmF4DBNk2PweHIssySpIhvV4
	6RZMi3uAr5Y0EQkJ6aP6PPjwLsjEt44+faBFj3+LBtxupbF7s2FCKIBXbMkgsbK5ROInXpT7GOM
	WduMzvs5y+bFxt7m+Lg7yY33M4bOl5+qzRx63oq9dqVbXeqMJT2Uz1WS5CzWle0ufTkFfSnb2wN
	B82kEK7OGtmE55yb/oI+FWHSYT48kpsCXjpu1/rD
X-Received: by 2002:a05:693c:8801:10b0:351:207d:bff4 with SMTP id 5a478bee46e88-3725302c1fdmr7378443eec.4.1794217383012;
        Mon, 09 Nov 2026 01:43:03 -0800 (PST)
Received: from buddy.mshome.net ([104.192.108.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265a179c1sm11189758eec.11.2026.11.09.01.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 01:43:02 -0800 (PST)
From: Jun Yao <yaojun8558363@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	security@kernel.org,
	Jun Yao <yaojun8558363@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] fuse: hold inode reference across d_splice_alias()
Date: Mon,  9 Nov 2026 17:40:06 +0800
Message-ID: <20261109094006.205170-1-yaojun8558363@gmail.com>
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

When fuse_direntplus_link() calls d_splice_alias() with an inode
returned by fuse_iget(), d_splice_alias() can drop that reference
before returning an error. In particular, __d_unalias() can return
-ESTALE when it cannot move the old directory alias. The caller then
decrements nlookup through the inode pointer. A concurrent
FUSE_NOTIFY_INVAL_ENTRY can drop the last alias and let RCU free the
fuse_inode before that access.

Take an extra inode reference before d_splice_alias() and release it after
the nlookup rollback or after a successful splice.

Fixes: b8bd342d50cb ("fuse: nlookup missing decrement in fuse_direntplus_link")
Cc: stable@vger.kernel.org
Signed-off-by: Jun Yao <yaojun8558363@gmail.com>

---
 fs/fuse/readdir.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/fuse/readdir.c b/fs/fuse/readdir.c
index 1f6cf5654..aca25e5db 100644
--- a/fs/fuse/readdir.c
+++ b/fs/fuse/readdir.c
@@ -238,8 +238,11 @@ static int fuse_direntplus_link(struct file *file,
 		inode = fuse_iget(dir->i_sb, o->nodeid, o->generation,
 				  &o->attr, ATTR_TIMEOUT(o),
 				  attr_version, evict_ctr);
+		/* Keep inode alive if d_splice_alias() drops its reference. */
 		if (!inode)
 			inode = ERR_PTR(-ENOMEM);
+		else
+			ihold(inode);
 
 		alias = d_splice_alias(inode, dentry);
 		d_lookup_done(dentry);
@@ -254,9 +257,12 @@ static int fuse_direntplus_link(struct file *file,
 				spin_lock(&fi->lock);
 				fi->nlookup--;
 				spin_unlock(&fi->lock);
+				iput(inode);
 			}
 			return PTR_ERR(dentry);
 		}
+		if (!IS_ERR(inode))
+			iput(inode);
 	}
 	if (fc->readdirplus_auto)
 		set_bit(FUSE_I_INIT_RDPLUS, &get_fuse_inode(inode)->state);
