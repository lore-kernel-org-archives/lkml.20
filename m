Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D12E35E95C
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 13:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788615009; cv=none; b=F916MsWOdl3EA/JFeCWd47mZY03kvZPT0zko3S27TfFoBzw11/GPrh8MSSZPk775/XVdzYmbvBYawJIcMrgy2+1SWf0Qj7AExEePFcfOkSOC3Mkb+h0mHh6FswIIsLvU6QyaYwkL2WV7DO/1f2fvCnBC9QqCBBDgJ8czcLIUPFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788615009; c=relaxed/simple;
	bh=SltN6IXvVZySJLNlF9QjGwMOqiRfXZapoOtgvjPGYc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z8SRhV76cDIZsC0GGYoQt6YN5a+Tb1w1kzgAF9B775r4GDylkzUMRV2Sxv6QlndPHspWfZdaksvU63oVNDzrZp1RwUcAL7VUwJWlYQM4Erp9DoyhfwiJ8xSIc1850RQHQ/c73H7fd8JcfPkgN4kYpkxVSp7rJ6vTH6gkUQY9I9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N/J8uzzS; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N/J8uzzS"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc149372c14so1021858a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 06:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788614989; x=1789219789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y4u0GWyaTeRSvMtQ0YnsmqSEps2foZyTtNF0hC2tn64=;
        b=N/J8uzzSJHC2Y/zhuamwIuQiBr4fSCcySVSUF9pnuntkDLlKk2Y9EKBp/AokxqGDPN
         UbQT/iAatYPG4beX3RLt0yDg8JVt6vhojDfY6mMzpa1ERZGQ2BdD6hDKL8L0rj+wnKtu
         Czdvqz79AACcWPMgqv6wKAuqv5WLff+ZScu9lWzD1toFlLG0g7xAkDaveofOKYzNQF+x
         PxN7W2L0wBdi5Cic/8nk8anc3d+wU0s84hobz1YaWwBB1njRaIwPw2htpKMaylz1T8Sl
         IPbbtBnM4VssRsZBIamvjvSsBwFTWxhX9iAkDMLtnOazGl2TNRHsqxtrH68PzBBypbHN
         JNMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788614989; x=1789219789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y4u0GWyaTeRSvMtQ0YnsmqSEps2foZyTtNF0hC2tn64=;
        b=G+zuGVcYUOF2vV2spnVBZ3b1+5lI4R4zi0SXEraqcp6hGsMTai+0kb0lzQ+QxW8E6Y
         LihuJ/xIFssR/ulchH/1+zJq5Rn88jptJ9ZPLe+Ooz1/EACi3uI81+S8pM1McUO5KnMz
         7AnZyAuiEIWYC7RpJdo2FkN5VM8UB+ECRDodDJG8bkRNvgojuazfpVK0VdC5MFEazIyS
         wm9kuwhl2rfkGt2hw+k2F1SXuBAujxjfPescyLLfK/H6bUjlgtY6f6ETDMXeOmWsZdfo
         HHtreadrMltrKH4y4uRb3NXbCrnbVdJr+CAhedC2YPByme7N3yrzkVz6ZPGXYGqmeNwl
         sG3A==
X-Forwarded-Encrypted: i=1; AKwUvBwcTHSurPMxcHeE6e+2xeVigE+tBQyJmsXAGJSzAGLrQItf55eSrJjhhCtCtuluuKR6rX7VCmGNL41Huxs=@vger.kernel.org
X-Gm-Message-State: AFuF++mNASrgPjvVyW2X+x1grQ8qIvQLENE3FZwIFpoJnKSiXjdLtJ8e
	kyBEal31DJB0b3bw4V1N8HDG9u9FBdZKeXDzEtjvPuOhSEdj2nU6S8dQ
X-Gm-Gg: AYBFou2NxEsf0p+EspM5UQsac4xO8A0WBjzbNNevyVF2MVLP4naToFV8P4rUYNALujt
	liHe7pFJ7+RDTA8gREHWky/f3J7rn3BNa30V5UVZlWzYhv7YOCuTWrn9vXd5aRyJQI0Z+PU5cDZ
	23w2iqr0uoxpNS8JbeArjOHlIdDY83oyS8obMgu0XfqD/68tLc2jAjnXSsQHRRsSzzyVFcM/8tr
	Cv79coE5NP+Dvldze//FeQ38L7SB1IXqLZpwsWDmGzcRROI8lN+YpUnanULnjo1SwBeLvZsDOQa
	1vuJVLFJk7N+iBcQKLRCYdmltxtvL7oWhL+fdKLjj8ERhuKHY5bdV2Xwv1pWYP4mXhghCmtzKId
	Nn28zz2ik1OuBZVD9/7W7q0DCU0NwlQwwrWOhYe4q4BDS5A2ymKy7dATrLBE0vO0/FsmN5ob4a8
	EyUwxapO6A0wrIVc7cbtkG8vTnTVxjiGPkzFnwiDLSHRRHFaVLeIyUDB6Z95XljUSz8qo1Cnxtv
	b9ftUE/3YCmspsllgdOhw==
X-Received: by 2002:a17:90b:4d06:b0:366:10f1:3d91 with SMTP id 98e67ed59e1d1-39b2614df74mr17583898a91.1.1788614988974;
        Sat, 05 Sep 2026 06:29:48 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c397b1sm16146499a91.8.2026.09.05.06.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 06:29:47 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
To: syzbot+cid5582b8164122eda@syzkaller.appspotmail.com
Cc: syzbot@lists.linux.dev,
	syzkaller-bugs@googlegroups.com,
	jaegeuk@kernel.org,
	chao@kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	hch@lst.de,
	jack@suse.cz,
	axboe@kernel.dk,
	tz2294@columbia.edu,
	baohua@kernel.org,
	linux-block@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	qiwenjie@xiaomi.com,
	qwjhust@gmail.com
Subject: [PATCH] f2fs: handle NULL kiocb in write_begin
Date: Sat,  5 Sep 2026 21:29:40 +0800
Message-ID: <5fdd4d960a6b47ab7cfa6ef0f44fb575fc45d1ca.1788611415.git.qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6a9bbf94.a5e650b3.26d8a.0006.GAE@google.com>
References: <cover.1788438786.git.qiwenjie@xiaomi.com> <6a9bbf94.a5e650b3.26d8a.0006.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wenjie Qi <qiwenjie@xiaomi.com>

The address-space write_begin callback is also used by internal callers
that pass a NULL kiocb, including page_symlink().

Check iocb before propagating IOCB_DONTCACHE into the F2FS-specific folio
lookup flags.

Fixes: cd5bc4fbb900 ("f2fs: enable buffered RWF_DONTCACHE")
Reported-by: syzbot+cid5582b8164122eda@syzkaller.appspotmail.com
Closes: https://ci.syzbot.org/series/cbb9ded8-1388-4a7b-bfa7-44082b04025b
Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
#syz test

 fs/f2fs/data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 6e816c9349a..63625ab3f1e 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3890,7 +3890,7 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 	block_t blkaddr = NULL_ADDR;
 	int err = 0;
 
-	if (iocb->ki_flags & IOCB_DONTCACHE)
+	if (iocb && iocb->ki_flags & IOCB_DONTCACHE)
 		fgp_flags |= FGP_DONTCACHE;
 
 	trace_f2fs_write_begin(inode, pos, len);
-- 
2.43.0
