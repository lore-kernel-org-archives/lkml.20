Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660136;
	b=rG/5f1NhPjCMRsxQ8Mvvj6Ut3JNk1ddZENEY053hDjK9iBPXYB4KT6GObQHQrCdLQRTo
	 RY9QhN9wFqQDf23L5x+YRG57F03IgR2dSBnQwyArGoUnJYHZFNgr4amo434JcXxaZwlOr
	 HqbxmEXovcKnjK5/LS7g0kP74d90qUzRyXpDrhdwAwFwO7w5lcVoFnvw38d2JUMi36l5/
	 ji9Ug8c5pkol0Mmiw0cbx3wjLCf6/kMUWlfJK7Tkp1vXnk56sW4kKVGIan69VKazgzE1s
	 8GfGYG9+pSCy+ewbEPr7pQKY6lw9J0mVYj3205F+5QwOEclIXci5x6LdbbQcfMT14aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660136;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=djon3MaXCvkq7QGoVgGYTZVR9paDezDGky2Radk1/Ys=;
	b=i9j9mMfZY31WNDolbrwIke0XUkkL0GoeUpG9NMG+TiIvZKPshDbpGI55IYq3c1YMpLEU
	 luma+vMPbbimr/vCsaXo1GIzn/mkpOrC/3sdXglvCqSeYou3nG2W7umJMGe6IH9ZEZ9zL
	 IWvT7F0cWEtU90pKL3dziHRBxX5vFcmK+9vzEeiygKeea55lBocJF+RqmHBbZtdk6vYtB
	 jx8mBzT2uvRPQAHiH6IPOy4pmwYx9jacbXsCWPi0IjeTKKromOffW5ScJzPXBC3ZsXSDK
	 MhPMmfEmpNQSzRUp86GxuVg8W34hgonWpN7YZfDXNjmbAWGmCyHGTk1eHIZ5RFuR9Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QvJHn5pu;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6C4606A333
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:08:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D6C4606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QvJHn5pu
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3a7cfe8f761so398381a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792660136; x=1793264936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=djon3MaXCvkq7QGoVgGYTZVR9paDezDGky2Radk1/Ys=;
        b=QvJHn5puihBTZ8jQ+YngfDAgvsQEEMrRW5H6LGdGZooxSGEyHCi8RownA1labNtfrG
         ZLZuGfyoy5DKyuYKajCyXvBARd8aV370KBHtOklYle5NvpSVBT0KEO1uUZpEJu1H58Qi
         0er7ON55k2PcFo10DEyPe0FchOKhIIqwfH+7pyz9MHrRARXHmHk7hras/ZLVr3NgHf2S
         Vsp+RaR6qlk24hb8+AvF3hV5nco0WHlssxkn+6lD6FCQmNhj7Mkm4IPz2s8+1Bdk8fuD
         GLJAxieWUKGV6GCTSLUkXfb6aEV8oUPvu3J8pbzTFwf7CtevJSehQ2z3kzIMgcdDnSJD
         r67w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660136; x=1793264936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=djon3MaXCvkq7QGoVgGYTZVR9paDezDGky2Radk1/Ys=;
        b=myiTNuJ/OSeO9CDndGnUp424keBFN3Vz3UIA2RtQ8aY4MUAQWWxMR6z+xKnR3U6Cbk
         chJouXQCTNgQSsFNIHhUPFYVce1gZYPwqqrhsbtaVOyEWhqyhV0pOdJ6KpSk5ZXVghuz
         X3PoRpItcAiKB+uP9Win2v4NwA+LdBTiHaidZAnB4runsMtZRcIiZ8SW5Z1REF8Slcc2
         5tYH9fsyt/c4U7PIE0/YmjWXAeu0wUZ41TsizuvrJbR8r1yMg8pe4q+UKn0sl0NT/gn8
         wncz5C0KBJ3Q2KI4hx/rIZcC3AKA2Ja9PJ6AcNqNW1LKp2RwlLKijiHz57X/U49Ka/8e
         WpZw==
X-Forwarded-Encrypted: i=1; AKwUvBwq7oeIt3L8ELvNYVIJ/LTbEJzXsBxWwtggjQxywFGzC8bGg1iDfJww62ORWZ15TVCltqzHaqXSuauOjpY=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1He+9emnebe8I+i2XI6I7cZnecII/b6aydvRCNrqLVcXVSpye
	wxkq0CcdSqo+Xf0PLR35oiilN18yo3/ATNRwbItvNpSr9bsxqtd6iv+m
X-Gm-Gg: AYBFou2rkoDDBQwjsvKVGufX6T8Kg1lWsUxeXi1pdNPe5KVmPFW2lSh+Dhmr+05fIKE
	lnmd2cYy8MPqMChaBJzGi9amJTN6rlsRWehDOisMvfXWSkZ5G4Pe/l4PCJHYcNJEjYtXnvNUIwv
	lfzw1oprrMDxClwdoV+Bt2kyGOMgEZ38xE/98kwH74p5rK0qaX7c/tPhtYeFBxlIcytN6eb/Fgz
	QQK8aU0Z+LCKHAIBOaOLIDM9qwDUdUc/ik2CtfFpM+M54pq9FstCBSrUr7G74+Sz5hjYQFdL6B1
	uQngV35e362IcuAuFl9MWQQoDzLN/xwjkMvl858KoVwxTbLSnyoK9HeJ4dZRh+NqduHF9FEsnlK
	O82kb+gU89PP5T42JdPMwSfMntaTomSCzwKFqTFtMkjDiytkOleJ+Fcurff3qnNsYJT77WODZcx
	7lSzjFrE5iI+ZY4psw8KI70GKHnaOqMLFgG8Mug59TXv/QKvbD2thFSVfHlemm87/UPFLE/mkeI
	w+8kTmuYxqslJSDzzC4dwp7+j1k6Yi5tvJq16vO/dmzB/haMKQ=
X-Received: by 2002:a17:90b:5868:b0:3ab:330d:6e47 with SMTP id 98e67ed59e1d1-3ada6c6bb67mr998870a91.10.1792660135625;
        Thu, 22 Oct 2026 02:08:55 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada490c096sm3325111a91.7.2026.10.22.02.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:08:55 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: mark@fasheh.com,
	jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com
Cc: heming.zhao@suse.com,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v4 2/2] ocfs2: snapshot the dentry name while tracing file release
Date: Thu, 22 Oct 2026 17:08:42 +0800
Message-Id: <pm-ocfs2-objects-candidate-0088-v7-6324344256f0c3b1c3d8-2@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-ocfs2-objects-candidate-0088-v7-6324344256f0c3b1c3d8-0@gmail.com>
References: <pm-ocfs2-objects-candidate-0088-v7-6324344256f0c3b1c3d8-0@gmail.com>
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

ocfs2_file_release() passes the live dentry name and length to a trace
event while holding oi->ip_lock. This lock protects the open count and
delays RCU reclamation of external names, but it does not serialize name
changes during rename. The dentry can switch between inline and external
names, and a separately loaded length can describe a different name.

The ocfs2__file_ops event sizes and copies its __string separately.
A concurrently rewritten inline name need not remain consistent between
those operations. External names can also be selected at this call site;
the existing spinlock critical section protects their allocation lifetime,
while a snapshot additionally pairs a stable name with its length.

Take a name snapshot before acquiring oi->ip_lock and release it after
dropping the lock. Keep the trace call and open-count argument inside
the original critical section. Cache the event-enabled check so the
snapshot stays paired even if tracing is toggled meanwhile.

Fixes: 468eedde23d6 ("ocfs2: Remove mlog(0) from fs/ocfs2/file.c")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 fs/ocfs2/file.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/fs/ocfs2/file.c b/fs/ocfs2/file.c
index c6e7606ff9e1..b3a37b9d259a 100644
--- a/fs/ocfs2/file.c
+++ b/fs/ocfs2/file.c
@@ -141,18 +141,26 @@ leave:
 static int ocfs2_file_release(struct inode *inode, struct file *file)
 {
 	struct ocfs2_inode_info *oi = OCFS2_I(inode);
+	struct dentry *dentry = file->f_path.dentry;
+	struct name_snapshot name;
+	bool trace_enabled = trace_ocfs2_file_release_enabled();
+
+	if (trace_enabled)
+		take_dentry_name_snapshot(&name, dentry);
 
 	spin_lock(&oi->ip_lock);
 	if (!--oi->ip_open_count)
 		oi->ip_flags &= ~OCFS2_INODE_OPEN_DIRECT;
 
-	trace_ocfs2_file_release(inode, file, file->f_path.dentry,
-				 oi->ip_blkno,
-				 file->f_path.dentry->d_name.len,
-				 file->f_path.dentry->d_name.name,
-				 oi->ip_open_count);
+	if (trace_enabled)
+		trace_ocfs2_file_release(inode, file, dentry,
+					 oi->ip_blkno, name.name.len,
+					 name.name.name, oi->ip_open_count);
 	spin_unlock(&oi->ip_lock);
 
+	if (trace_enabled)
+		release_dentry_name_snapshot(&name);
+
 	ocfs2_free_file_private(inode, file);
 
 	return 0;
