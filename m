Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794923529;
	b=j3XfC5ESIfyXRSnPvywTWGEZOZ0ixLTPPmwHCA9lgI9x75CuaFGiYa3msJah1sWV7q1X
	 Cv79dwvmsYqL2y8ORB1Fj+oYI1saWrzBNoNvSsFQqeNgmcIMzOFyxNRCr0ZWeaFaSx1FW
	 sMLHFDF94Q+AWWlFyW3oFHeWXmWF4T45rm1NTsvAB9cHNGeQ+rwCdUkiQVsEcXLgw6x+g
	 k/FaPk/h+ClvIL2PXTsSnYmcZz8r3MyeoBVgeUqqnEqZB94salH3fwVNjwLTUu0r0Jmp0
	 A1dNUI9uPbmSr4PCloRlqgjSpOBIm4dkAXvoYQC7SaRGJwc2zBKTijRcW8JTRFKZm8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794923529;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1CXHuD+7M4E0rte/HpFih0lklRzK6u8QUeFUsQ4kAjQ=;
	b=PzZzqrqc6vDxjpfpVEdA2Q1BhCtZOemuVE5T675tVeNvukAqBGvrPOtnYdZ98iWjW4dy
	 oAwgcp21I1GZkl7fy6Uzku0OPCtdXXF8nUPtTuGi5XdsfCy7ZMjztJmDuUBmghnvC8dN1
	 2xFzD/AmKOM8rOtZUXx2yoI7CfpJyJVaLCd96b3TLq+/4aR2bD74Ew7tEnqQSU8dZcV8/
	 80byNG8B0Mt5mzkDJ+PIuQRULABVpvhMO2u0zjpad9crehdyEg3CW9SjUU6MCvPt7fy9v
	 GPzAv/O8snIAFsPb0GnW8Tj5c9/5H7zNiE9s2Bbz4LILGBBcQpC5w1FuwySbJ//mnXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZnPHt3le;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AEB606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:52:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6AEB606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZnPHt3le
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e9d7791b00so47219115ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794923528; x=1795528328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1CXHuD+7M4E0rte/HpFih0lklRzK6u8QUeFUsQ4kAjQ=;
        b=ZnPHt3leoE3b+zyVtoFqkH78raa5oo30XzURJHdxuTrZhm1A8S03JBHg4cA7pLp3vm
         go2dWcsQh2NfhfYlVKcD7ba08u0oFlN0PvE6NX4pIJmWe0pENj0S9o88FftCXjN6tSTb
         awrZ4QxC6HLt8OY51Upno5f3DuSdzCOfiA8PGyXQtwoFKELK8qAvjyrUVFRJqOTnkscJ
         9gihPWZTriH7M1kMMgS6njXBlBpMmqSomEJVKsXpEjaOGlr4znjiXPfLJkvL+mwDe5SY
         BLLTE+H+b1hPD795MLqStC25u/0iYPysQaCSVdZEI7PBDuqWjqpVWZSyHBmTnP7rzMw4
         l0dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794923528; x=1795528328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1CXHuD+7M4E0rte/HpFih0lklRzK6u8QUeFUsQ4kAjQ=;
        b=xioC2slu41TrCU2Jd5WlM3wgJYxE+vOxmcE3HPUDC2gAlRsdmO/kjxnRXZxgh2kFhk
         pg1jHM+1lrLpS45HwFM3fbIjQKvQFqUIU5EeKZp+6SbvnBznvx8BZIrTd20OAmOMDZfm
         s9zbd/8IJOGrGx4pqE6u2jJa8fJ4ha0esl2+bFCxFeyzm/8n+8CKyqiR4PUSV4hugiFw
         qbiN2+jXLAZ72svdCrx4ixw1fN4UEhchf1Igv6/NzQMYXpLeb+hbWfKAGJJ+Vm/vtF1Z
         auX9m0gE2TwmaiGSZsk+WYuXBeUIgsR8NTwrNFZVaADXO1eKMfRC8NpP2tjW+rd2q2Vi
         buJw==
X-Forwarded-Encrypted: i=1; AL+hErG9+LZTO0kFoILS3Oet/QwBa6qLXOdHa3+a/+lmH/tu+rAF0eTEExt0xzUrKhBEXFjXILHkAweYF90KDW8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8syeXIbApm6JhIXt410MZRFzI/JUSzvVj6C3SszHTioiVOEkG/
	1fKu+6EAyMqWNWP1v+0hOtZWUxWtGMnlRcO3/o6khpcSjwz4Qa/ryUFI
X-Gm-Gg: AZFdTZfnza5QjbrJYhiGbZG/dcLYIec7rWr2y0bkbbV3+JcXQuOV3uvUYGdZf6oOOtB
	PIRx1x0jDgj+3Bm5F1efRjhFR6HNUtVIXWQZ5WXzGf2v8tp1y4zeOWb1L9qr+1JQ8J6v+YTqK56
	JudTscHsfI6pyM2E6jk1lLRdZTZZs6TQffNKfR/OzetgmE+oTWK+xBHpzRDswQdJxP8egIKblg9
	qDhzw8y0UVNSc4c1lbYbQZCjH0/Z/XLExre2FMDewncsWN6OspzgN9LjuF9YDrn4ClfSfXfuBM7
	JKafm8tvqDac4FokAJMH0umnesYUUJTeU7lwY75htFUPf4RpBPnd8eeFHalJG3xxVYFYHj5du28
	2qtF8Yb103toq/O0UVzmBRRaec6bqgXiSg3s6cWVlD6ed3U/64eMoeK50RBZJ84PrfFNHAeLpCF
	Egagu0yYNo6nzk7HOGAtYb29aDdnNta83Zrbip9jZdwbon6Xu+ro1eJnJ1ifn9UJ+Bd2O28bk9l
	5LXI1Bw38GPH902Mg/ysGNvPdgizEhVTmAm29gXML1EVEmx8Bz/CCqMdRWfsXtyDZpJn3VEwQmF
	unllmDrECbSBNT1ut3PmcObCLMQP9V1/4gXriJLyZTe5dHHOSg==
X-Received: by 2002:a17:903:38c7:b0:2e7:ff72:203f with SMTP id d9443c01a7336-2ee0dd9cbfdmr134501055ad.61.1794923528140;
        Tue, 17 Nov 2026 05:52:08 -0800 (PST)
Received: from localhost.localdomain ([112.170.44.210])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a586c1sm15937035ad.43.2026.11.17.05.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:52:07 -0800 (PST)
From: Junyoung Jang <graypanda.inzag@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>,
	Jan Kara <jack@suse.cz>
Cc: Junyoung Jang <graypanda.inzag@gmail.com>,
	Amir Goldstein <amir73il@gmail.com>,
	Matt Bobrowski <matt@bobrowski.net>,
	Gwanhyun Lee <gwanhyunlee@gmail.com>,
	fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 1/3] fuse: skip dcache instantiation for readdirplus names with embedded NUL
Date: Tue, 17 Nov 2026 22:51:35 +0900
Message-ID: <20261117135146.3174252-2-graypanda.inzag@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117135146.3174252-1-graypanda.inzag@gmail.com>
References: <20261117135146.3174252-1-graypanda.inzag@gmail.com>
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

FUSE READDIRPLUS can pass a length-bearing qstr with an embedded NUL to
d_splice_alias().  Unlike verify_dirent_name() in fs/readdir.c, this
path can create a dentry whose d_name.len extends past the NUL.

For such a name, strscpy() in inotify_handle_inode_event() and the
fanotify name-copy helpers stop early.  The kmalloc() and kvmalloc()
event-name buffers retain uninitialized bytes within the recorded name
length, which copy_event_to_user() and copy_fid_info_to_user() can expose.

Some FUSE servers include a terminating NUL in namelen.  Follow
nfs_prime_dcache() in commit 78d04af4995a1 ("NFS: nfs_prime_dcache must
validate the filename") by skipping dcache instantiation without
failing getdents().  Return -EIO from fuse_direntplus_link() so
parse_dirplusfile() sends FUSE_FORGET for the unused lookup reference
and continues readdir.

Fixes: 0b05b18381ee ("fuse: implement NFS-like readdirplus support")
Cc: stable@vger.kernel.org
Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
---
Changes in v2:
- Keep FUSE READDIR and READDIRPLUS getdents() behavior unchanged.
- Skip dcache instantiation only in fuse_direntplus_link(), following
  Amir Goldstein's NFS precedent; forget the unused lookup reference.

 fs/fuse/readdir.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/fuse/readdir.c b/fs/fuse/readdir.c
index 1f6cf565477f..6b2468b575d9 100644
--- a/fs/fuse/readdir.c
+++ b/fs/fuse/readdir.c
@@ -191,6 +191,8 @@ static int fuse_direntplus_link(struct file *file,
 		return -EIO;
 	if (fuse_invalid_attr(&o->attr))
 		return -EIO;
+	if (memchr(name.name, '\0', name.len))
+		return -EIO;
 
 	fc = get_fuse_conn(dir);
 	epoch = atomic_read(&fc->epoch);
