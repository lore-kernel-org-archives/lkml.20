Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690782;
	b=Xkq3qyHXEiWfnWI853n+7U3ncW/A9ypGc4UB6o0vLkIiRs4OC8WjrbswKzay+JlcJjC4
	 APeqylTtEFGCZeBJOIEByEsK8/UwzMolbX0USxBbLE1VjfJG+Dxgi2gzcrK8pT8sABWTa
	 HWkc92CLIqWTPT9EFQolnE6teCKW3MZHo8fDBBvzFcA37R+oQA69+K9ikfVGea1HZd21b
	 r6o0gGn2206+bvcYCbB7zOg4+xDV3HSPDKPVwPqII85trxLGwXDwBdc0SnClqGBwqJRLY
	 GaErgPdm8JS74Q6VjbTN082ms+hksAVtAoIwGtdz0F6cv1sqVjrCpqvDAj5//zw0pow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690782;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=i/noOztbS2t6WZeL5Ffb7JJaj+8g0AIhxEQ+LUXgBF4=;
	b=RSHM9IgpnMaE01tywqi6QIvOEbfwmjuAI8nQ1JxQ8v105UgKhlA32P+THRfahkS1iswR
	 uKYA4P2h21GiQ5SwWKwzykHL4c33Lm3Di7WFuJI9mvUXS4mKopO7S6OSWAiuO5s0VZY3q
	 A3GU5O8zSYRlR3+8E5LP/1ggxVvuX14nc6vsePTHoXaeQntr4QfW4kJ6fq6ZzJf7xXQ5p
	 K2v8QxJ2dSvgAqNZrXXRs3wCRdXgvw9AgyaU+EDGXh/sorI33WTq+db8AiIyRIlVBrjZr
	 FdAv/wtzJu1AtFaVay+w09RMYNBfqsm0Fv5v55fcyozzGItGp+lMtBE+VlajXV5lDoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=r9foKYqO;
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5515B606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:39:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5515B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=r9foKYqO
Received: by mail-pj2-f10.google.com with SMTP id d9443c01a7336-2df921c1d0eso7133335ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792690781; x=1793295581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i/noOztbS2t6WZeL5Ffb7JJaj+8g0AIhxEQ+LUXgBF4=;
        b=r9foKYqOLCGeFTWsNvX1SY7qNK0YpcGUhWiUzillccvc067Z5eH6LNl1BhiJzf5SNl
         zXBGTeEhMW4lJVEw2Mt3BH8S2TjxK3PUm8ID7dH78sVgcw3V3MuoJ6y8aBUSOrxHXHGH
         2tvIdn4LUOeB6tjGY/3DNzq8GgSw9KXRIuH0On/gjKlU2OnvpwfBO1AYGXehQPx9YMvK
         x1lWssudXhYG9jZJpALKTl/+K/E8M/pTBiKYjObzYiQnf/cmQPZ/bENQEY7lNruaOHIL
         iLVL8L8dYgmID8Cfr9KkA0JmxitOA693A5HtpscmxuLcNrjMkuDYsmMiUtZkYvR+l4dA
         iCKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690781; x=1793295581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i/noOztbS2t6WZeL5Ffb7JJaj+8g0AIhxEQ+LUXgBF4=;
        b=mnucdtsBEGIjLJDN8DtGysGLc5+1lVSiSMIm791+4JqIRDK5ihKy4OwArhp6WIEB7M
         95k/5yaxGc3Dfgo9Uav/JIqx6KfvkvYIPDOr66IJXt5EVBxuzFThDvrUvsWlY9VMJwh/
         fWAPgz7K1qGnMlA8fTxlyi7MsWBpfls1v0HmjE5Gkax6nxOd4hzGKTNtx0E0Bw27u4uz
         awFKnUzWOTLAONnI2y27gCdOkeqRpGsRgpKFyDX8GWx5GuIIBGynQRE33s5BPf1kaY14
         8SjBc2xEYBBZLJKPx/hFXkTtHiQVBA9cQM4GSaZpkGbcOC0RrNIh2WeoJzXPRAiUNp6+
         gGyg==
X-Forwarded-Encrypted: i=1; AKwUvBwKemSTIPVJ1NDurT8URDMS5qM0ycMla/cblVJKPdCjpcJOwcODc187+B5G2e+gE6g6XP2S8F1MLD518xk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcHViv17GY8CaWSm6u7/C14DqH4cCqxsmgimo1/gDlZtw1jjmO
	V52yy1bW1PGabbVFxRgkZCK4TImwQDGVgZT9GsIljGouI5435pyxff4OU3GQitSTq5E=
X-Gm-Gg: AYBFou0XHRo6Rp5SjmIg3JYTKsM+HPuoTXv96ka5VigU89uSisL44vwJX8n7COu2Wk4
	looYbUoi1CMY4b1GHsvi7yyuynSSulXaUNR6d1StDxUsYrdBpXFNFhriIxKcSoNTQ55tOyFuFMl
	38u3im/vU6+ISp62ZgICsSTAiHgOLGNFZqNOVhQn9IOhI3UKO9M7L1Cf1qpokIQIw4QdEy8FvFp
	w2uoZUi5edzBjaxi6m0cPJRt3GK9dfBnf/hp8apSSi4PcXNVacMh7kV9WPRxPz0krQaMhgD+8o9
	ekOmDBl5wyAKQMuwpY9ZwuLhcNt2ZbmUD5RthGqzWHCJXeWzoQWvbZDp/Uiko8iuepty0lT3DBI
	ieh5mWaGhrYMqMVg+dmkfqSxemorYcTkZ07FQ3PEw/kBQ9adcDiQz73yS+jZgCFjS6HLP/9qP+v
	j81o+rssUjCeAbcdUNpxzAZYOLRHJ3FN6lSIjH0MYzt5YmGlbZX555lU0AuQUGTlb1YPgszsMvU
	PuJGZKCNMMUfcJqZVOcEXVvfs+cDHWrtMEkv9/HJzXntNKvsSkZwSotHLZrgMRt6fVLuTawLb6m
	NBLy
X-Received: by 2002:a17:903:4b0e:b0:2e9:a166:f7fe with SMTP id d9443c01a7336-2ea440a4ec4mr51883235ad.62.1792690781547;
        Thu, 22 Oct 2026 10:39:41 -0700 (PDT)
Received: from localhost.localdomain ([121.128.174.79])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7b3d15ffsm1483045ad.56.2026.10.22.10.39.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 22 Oct 2026 10:39:41 -0700 (PDT)
From: Yongjun Gwon <d3bugee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Tom Talpey <tom@talpey.com>,
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ksmbd: serialize directory emptiness checks with readdir
Date: Fri, 23 Oct 2026 02:38:32 +0900
Message-ID: <20261022173832.14696-1-d3bugee@gmail.com>
X-Mailer: git-send-email 2.55.0
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

SMB2 QUERY_DIRECTORY holds fp->readdir_lock while it calls iterate_dir()
on fp->filp. An SMB2 SET_INFO request with FILE_DISPOSITION_INFORMATION
can resolve the same FileId and call ksmbd_vfs_empty_dir() on the same
filp without that lock.

iterate_dir()'s inode read lock permits concurrent readers and does not
serialize per-file iterator state. ext4 stores its dx readdir cursor and
fname RB tree in file->private_data. Concurrent reset or refill can
therefore free a fname node while the other worker still traverses it or
retains its RB-tree link, resulting in use-after-free accesses.

An authenticated SMB client with list and delete rights on a directory in
a writable KSMBD share backed by ext4 can trigger this when the directory
takes the dx readdir path. The client overlaps an SMB2 QUERY_DIRECTORY
request with an SMB2 SET_INFO request carrying FILE_DISPOSITION_INFORMATION
on one live FileId.

In one x86_64 SMP KASAN multi-shot guest using ksmbd-for-next at
171df27077fb, the unmodified kernel reported a cross-worker use-after-free
before a panic. The first report's access and free stacks show the two
request paths directly (trimmed):

  BUG: KASAN: slab-use-after-free in ext4_htree_store_dirent+0x488/0x550
  Read of size 8 by task kworker/2:0/29
  Workqueue: ksmbd-io handle_ksmbd_work
  Call Trace:
   ext4_htree_store_dirent+0x488/0x550
   htree_dirblock_to_tree+0x535/0x990
   ext4_htree_fill_tree+0x319/0xba0
   ext4_readdir+0x175a/0x2f40
   iterate_dir+0x1b6/0x630
   smb2_query_dir+0x1003/0x1cc0

  Freed by task 279:
   free_rb_tree_fname+0x67/0xc0
   ext4_readdir+0x13a9/0x2f40
   iterate_dir+0x1b6/0x630
   ksmbd_vfs_empty_dir+0xa2/0x100
   smb2_set_info+0x2ffa/0x45d0

Take fp->readdir_lock across the entire emptiness check. This places both
iterators over that handle's filp in the same lock domain while
preserving the disposition status handling. The exact code change
completed a warning-free x86_64 KASAN bzImage build. Tracing three request
pairs showed that the two iterate_dir() calls no longer overlapped and the
expected statuses were preserved. A further 1,600 reproducer iterations
completed with expected statuses and no KASAN report, Oops, or panic.

The reproducer and complete guest configuration are available privately
to maintainers on request.

Fixes: e2f34481b24d ("cifsd: add server-side procedures for SMB3")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Yongjun Gwon <d3bugee@gmail.com>
---
 fs/smb/server/smb2pdu.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/fs/smb/server/smb2pdu.c b/fs/smb/server/smb2pdu.c
index da82d80..f5fe3cf 100644
--- a/fs/smb/server/smb2pdu.c
+++ b/fs/smb/server/smb2pdu.c
@@ -8918,6 +8918,7 @@ static int set_file_disposition_info(struct ksmbd_work *work,
 				     struct smb2_file_disposition_info *file_info)
 {
 	struct inode *inode;
+	int err;
 
 	if (!(fp->daccess & FILE_DELETE_LE)) {
 		pr_err("no right to delete : 0x%x\n", fp->daccess);
@@ -8932,9 +8933,13 @@ static int set_file_disposition_info(struct ksmbd_work *work,
 		if (ksmbd_has_stream_without_delete_share(fp))
 			return -ESHARE;
 
-		if (S_ISDIR(inode->i_mode) && !ksmbd_stream_fd(fp) &&
-		    ksmbd_vfs_empty_dir(fp) == -ENOTEMPTY)
-			return -EBUSY;
+		if (S_ISDIR(inode->i_mode) && !ksmbd_stream_fd(fp)) {
+			mutex_lock(&fp->readdir_lock);
+			err = ksmbd_vfs_empty_dir(fp);
+			mutex_unlock(&fp->readdir_lock);
+			if (err == -ENOTEMPTY)
+				return -EBUSY;
+		}
 		smb_break_all_levII_oplock_for_delete(work, fp);
 		ksmbd_fd_set_delete_pending(fp);
 	} else {

base-commit: 171df27077fb49b4af2c53ad2cedcd0e39664fe8
-- 
2.55.0

