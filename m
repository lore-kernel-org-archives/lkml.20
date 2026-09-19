Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E97E37C92A
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789856265; cv=none; b=io+zcqWvMltyXAspc0O7wvjYhQj3NBXdkrPZSBvY4LLKDXmrMsQ+qG6X58tZ+/rhmbdkVAA+onnywWwjh5N/U9HJlLEOK7z77p/XlwpmXMHEkbDhrr+ETp3tMbOOHlwe6u4oCyI/mMChSSUzzITS5PDt63GMMksvmi5Az1uVRRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789856265; c=relaxed/simple;
	bh=izERj7mMYMZP8a58ghw1dMcUDgkI25VI8ILJPRKWBIM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DExpSXaILQQfghxkrzgL+l6/gdt5C061r+EOWZz7IuBM6vgQfVoCIWKdmiVDF7mZDWtB0fDaeH1aUOj2IRzWcH/B/Ya/4SJULlMsVUMGc5tFsEDT2vmiUqybJYdLDB1GYoFb+izdkgd0pssrQJof1RHERJXvthiKi6mdMlfuvHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gan3Qmid; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gan3Qmid"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-398a1676000so1563520a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789856256; x=1790461056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FF3mgttlrX3lpY2tZYfCgtrWlE9NaF6532nlaa/wgVQ=;
        b=gan3QmidjHp2QFZAt/k2/7icx2bhpNq/6ewCRJi1eSDgBo7OHO2jsb/+1R6T+XqiWT
         nD7D7g2ujRqKBYwBLurlWNInZKnvtQP/APnWmlZAZpOmtIaiJ4SSc0g71zsDFFHs7t49
         FcIPa4+SzPyMG6XDCwFCqRv+TZQwBVUycw88XcW0LltD3Hl+2YMubPhRw+/zUqfRGX9W
         iZfLvSwfkvEPh5m821ZlWqO67Yy6tNyQj+UWqTeP38Bs9V/sHsl3PFN2w6Yj/kNvLexb
         +rC7xPFs39s9lhwzpxVZrq/Qh6BhmvDADOwJJJybOYacPAE9kBbQyPFqXfEyjWT7M2X3
         NS0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789856256; x=1790461056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FF3mgttlrX3lpY2tZYfCgtrWlE9NaF6532nlaa/wgVQ=;
        b=kTqLcyts5SpMsaEl8wktLLb9DnYkXcms+CTmmyzBTlkrgBa7JagRL7twl28hC6gKAF
         WR74TShXWioBMRy+F42fDr6GFin5ltAU5PsNL4w5tvazMH5d176jdMWBKgl0jUpck9rM
         8b+XU27kQNsdokp9y0H6R2CtW6TL/1JC3Qoo0QQCxaRT/tU2bIrTo2jZzNsKg9pvTS8w
         GaE1Q9EG/0yntNh6gCE48Cj6Txep47LZiOWkymkxAsRrBpvgw7XYU+e0vftlvIHcGSCl
         IjvTLmjiyx9+XjzNwFSuZnLDdTc6EJxSZXwIcGxLNP2y1w6tv7PJu34CAv/IEVTXl3lA
         /a5g==
X-Forwarded-Encrypted: i=1; AKwUvByZreGo0Cym6l94KMZM/kRvCSFHxsdQSfjaqlBzqJlgNX5yYhBI4f7wlXkf+POECJvHZ06AhPwnFjJEz5Q=@vger.kernel.org
X-Gm-Message-State: AFuF++ls3fIt+lP6agXjavx75vdnqdO/mYJtan1pZqpSASoUqz/ClnN0
	AtZWT9agETui/hFeVI4Cxus0X6EdXRgJDcGXMdxsaE9zauwFjhbCLDwU
X-Gm-Gg: AYBFou2LmYdI0u4G96Rw/ekJDmbPQp2eh05C+6pVIpDFapOuDPrZgVb/SUhjacyKhg8
	E19Z3jaJmJtuEQkrIF1nlBO/3wvIdrfMvtShi2pHlUDr9Ti3bnrZgR8yO13VBCXLB8Cb4qVnHWu
	o1D/J5+0/NTy9zABdY8+tw+/evX+CDXUFKGso/mKpZgLTbM8lFEMLjoOkqOlusNlBM6FKyIKdPG
	g8+pG4DfOZygtpQup7TvS7HUiGA6txpkhfLt9G7YMKBD9vZHjAQZtwGgTXJXYpinP6n9WWmETbm
	QTJxFbIbox4XVdU8k1R6v53VpkmHrMtRKDAPE/rkwLBoITN2wFm7Uy53zvRgtvVUirIK+ZabS48
	1kVpV+j6qgab28IO4mizd7jljBwKsjsDietIP87LNGJ1yTlJdAOcOXI7GaovlJsQDBQ2hGK42PZ
	tg4WWUljmNMbQk5v9OFGvxA+XlUddBXV4qjwEDGLA+Qpst2O5urCKYJEgu72NFJ0RPAhMnMlFD8
	V98E0OeDzAY/8zLNVhvtT2avUOxh2aAeYOLs9CgU1EU03JYMT4+UjoeejE3rxlt5tCYAo8wNjdQ
	qY+UDQxN1LC8SJd8NFMx
X-Received: by 2002:a17:90b:57d0:b0:39e:6c69:f479 with SMTP id 98e67ed59e1d1-39e6c69f5acmr5095649a91.56.1789856255528;
        Sat, 19 Sep 2026 15:17:35 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c6dd585sm5925296a91.0.2026.09.19.15.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 15:17:34 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: ericvh@kernel.org,
	lucho@ionkov.net,
	asmadeus@codewreck.org,
	linux_oss@crudebyte.com
Cc: v9fs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] 9p: reject RERROR/RLERROR with zero errcode and guard 0-link drop_nlink()
Date: Sat, 19 Sep 2026 22:17:34 +0000
Message-ID: <20260919221734.3708000-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix two issues in 9p client and VFS inode handling:

1. In p9_check_errors() (net/9p/client.c), a malicious or buggy 9p
   server returning P9_RERROR or P9_RLERROR with ecode == 0 causes
   p9_check_errors() to return 0 (success) while leaving the unparsed
   response payload as if the expected reply message type succeeded. Map
   ecode == 0 on RERROR / RLERROR to -EPROTO.
2. In v9fs_dec_count() (fs/9p/vfs_inode.c), only call drop_nlink() when
   inode->i_nlink > 0 so unlinking an inode whose server-reported nlink
   was already 0 does not underflow i_nlink and trigger
   WARN_ON(inode->i_nlink == 0).

Fixes: bd238fb431f3 ("9p: Reorganization of 9p file system code")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/fs/9p/vfs_inode.c b/fs/9p/vfs_inode.c
index 3829554ca369..12db5ff61554 100644
--- a/fs/9p/vfs_inode.c
+++ b/fs/9p/vfs_inode.c
@@ -503,7 +503,7 @@ static void v9fs_dec_count(struct inode *inode)
 
 	if (!(v9ses->cache & (CACHE_META | CACHE_LOOSE)))
 		return;
-	if (!S_ISDIR(inode->i_mode) || inode->i_nlink > 2)
+	if (S_ISDIR(inode->i_mode) ? inode->i_nlink > 2 : inode->i_nlink > 0)
 		drop_nlink(inode);
 }
 
diff --git a/net/9p/client.c b/net/9p/client.c
index ef64546c6d52..e63e8c2a853d 100644
--- a/net/9p/client.c
+++ b/net/9p/client.c
@@ -448,6 +448,9 @@ static int p9_check_errors(struct p9_client *c, struct p9_req_t *req)
 		p9_debug(P9_DEBUG_9P, "<<< RLERROR (%d)\n", -ecode);
 	}
 
+	if (!err)
+		err = -EPROTO;
+
 	return err;
 
 out_err:
