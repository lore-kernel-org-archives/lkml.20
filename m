Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794874663;
	b=wSf/4cxe0GD4tnT/at2i9ElW0JqOPN+crD2qIKkUwQVUqZin5zh1soJ7WDE/Xzsg1eQw
	 vnTBJsLYDpAxOFqf7/JEDHUSNALYxUFfYQwkH6/dfDqW5yV0+gUjOJSMiBRZqSl1b9I2w
	 +tSrUnX4ULYY6mHQKFpF8JipIuzdJlefusv1AoG8H4LMuNi2/3+72aoJxxKodPuMT6NRM
	 xRzPS5ybM/l9VB2fEt/HYNIVoyoRov37dh6uK6VS/cnmYm+kUTRaURx+Skm50jwhIqtCI
	 3MszzXovMmttIXx0CcnJYZ2oXQUQjRcFD8y0Ovdi7h4yRl0vNszxTpx+P0vhQkr6Xbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794874663;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8uYmVLMlUVU+cxd5o4cJaxLmzYdA/McqGttb5PW87pg=;
	b=KL19m1jWVxJjqMtYoZPtLD6W7/tU5t9h5bdXG7W9U9XofMgXL5UmQcwaFIiHyq8NvdIL
	 1f2JCPouXEGQNMCcf0NTQLiQ9eQoPw3XY+cvnVmpbCTBEyNcHc43aGhfp4fgANZO0v3ca
	 vrInDjU2PUoZlMO1IBndIj+9GU03VcJJvdbW6KeicRS1h+ynd5NkCv2HzbFnYMKCZlNBP
	 MCli5yg97vq3Jye4OtyHMqIiKWzNcZ5K3Lc+XDCa3Hr1H6Gb4fdVqZkecGKuVKtRYUrgJ
	 q+7damswm5v4374TEk2294sovk9LFzre9yPnFQc1JPpxLpbaO2pPyZOwm5gZuGDwVPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hedHCCss;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF50606A891
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:17:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABF50606A891
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hedHCCss
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so2367856a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794874658; x=1795479458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8uYmVLMlUVU+cxd5o4cJaxLmzYdA/McqGttb5PW87pg=;
        b=hedHCCssyR1sZA5kE1raSkzS+NrwJlryckT3Pigc2Xd5W6k/AifZkT1N3a0WslBvS+
         eXuq0BExtzuNzVEfDs9GK5So+KUWSs0DeDuzMk+5exFiS2L95kLtOo2uXyo15O2igJVs
         OwyyJRXD0qvXxK4DgQeOg7bOU4c7kd8sbz17Qmidk7APckKgguTH195cTYmrV9JK4FnU
         m0Xb3xRXeWRKDem2fHbQz2XsuJNqcf2XneYP32KW/OBxKd+y8XFc9z/jLfIdIEdDroa+
         mkeAG68eqWbDHzH4RjcjKgnGTqplbR0nvmly6gSJzasleHdN7Rq6GseoyZKlCZ2e3OCQ
         FRAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794874658; x=1795479458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8uYmVLMlUVU+cxd5o4cJaxLmzYdA/McqGttb5PW87pg=;
        b=zb8PEangy+i9J6v27hpYfvMwfwjksBC/+zbakQdP289bt/TRJBeJ7tTrg4e4WPcZxD
         WQSh9SqRNyuwp59G9VUWHo7HFNzkt769NNya2xR0U0ZJFbwdAvkm/Bqqxo15aJjIiB0+
         tT9M+ismE2lYJGgeVf/pwtZiQGkSd6gDzhHWyiz5+Pr5hKZwK2ci8XuVxrgGRFz8tU8F
         ncAjxavpuwZwhS+4tOje9VIsEAHIpfWTJ6XHeWMu5UIuN00zjAErt1nWXVLeXIncXLQq
         h6D038I9+/jOGra3TUA0fcTCvtAtI+VjXpOmGrlgYQqpHQ16QBe8CRZBwJXbbczo0FmI
         Podw==
X-Forwarded-Encrypted: i=1; AL+hErE0AywtgtoWJW0XCmuPrAkIIQ8sz6BgWwMhbPHqTR8O8CtJfijuFCSAM1lOxqYsBmfsbA7QFhchNfAQzGA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9k2VTeK06s+yfveX3zpX1WxST9poFoJuKgAEab3muRyENzPGw1
	Y5NbLISmMrCydWtsApo8RRDFvPSuWyh1eBhS9kWEADCaHBHASO6o2cWc
X-Gm-Gg: AZFdTZeKSpbp7JUB5AOH7s46FVHrsPrqwjt5LjC2dktrCKfDUmc5qj59IHdh385Mwk0
	CG2m1EyYG8Nviahx0UE4lpuMmTaQAchyelp+Ko1YZzfhUuXIaweQrCi7ai4ERD8n9+pGrr19ZUW
	Zu1Zc9Jg26h0V+KvPDNq0oqkeyCB7kEHNmfEnSwtvA49eM8TNKjnXN3eJE+M/e70DWvcw5wAvMI
	0pK7pxbL9Oydqu2+gphrRH4p3zlj6JI0kH80t/Ruc+lwvm1bU81L1+SkeKdXnfk3k+/NZPwgdIp
	auxbPQC2j1a9mWzZvN4EVGOZqnLrpxeox94FoDpjYCmv0Eq7VCiTQQrYpzVyhVZxO3vtpQyeYpy
	IvgIblfDEYDMMfAIS+QFC6pa1xk/9vtP3X/qMcgAwpEGq8q9gdladObELCD+edAzn8AwY61kBP6
	B7mb0oYtRvXoP4DQWcTZSdkycsfjN919BL1voHNikzkHqog2ErtJOX4WhplG6Cwvc1an0O6R93E
	pnNpd5sdHLfI2T6pjUqGomAhmftcpUA04ycVY0Txrlv3uBLPfOixBKgD+R2ps+DhG0zM0BTbV7C
	fRUQQlQZGjIo5xxiU+F75UAIqBxBgGIcwysQG51YDmYYjCNmZr36awSMydZ3hdagdhbv8H4+UHG
	vdmgKDrq9L8My5lx0aRq79VtFtD76Kb12DjlSeRhYin1Mb37MX7OHHQuG5ohcakrd2bpmyy5U4K
	h//4de90jN2/t4WCR/TXWz7gkk8mcG+FaxThmOmwemKLkDlsmSw9tKR6nvna0vMw==
X-Received: by 2002:a17:90b:4c0e:b0:3ac:8741:e2e8 with SMTP id 98e67ed59e1d1-3b1b07ef0bemr13037975a91.8.1794874657803;
        Mon, 16 Nov 2026 16:17:37 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abe77179sm1194081a91.11.2026.11.16.16.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 16:17:37 -0800 (PST)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: Paulo Alcantara <pc@manguebit.org>
Cc: Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Bharath SM <bharathsm@microsoft.com>,
	Allen Pais <apais@microsoft.com>,
	Rachel Menge <rachelmenge@linux.microsoft.com>,
	Hardik Garg <hargar@linux.microsoft.com>,
	Adam Kim <adamkim@microsoft.com>,
	Siddharth Chintamaneni <sidchintamaneni@gmail.com>,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] smb: client: fix busy dentry on unmount from persistent handle reopen
Date: Tue, 17 Nov 2026 00:17:33 +0000
Message-ID: <20261117001733.192399-3-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117001733.192399-1-sidchintamaneni@gmail.com>
References: <20261117001733.192399-1-sidchintamaneni@gmail.com>
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

During unmount, cifs_kill_sb() waits on cifs_sb->outstanding_rreq for
in-flight netfs I/O requests and oplock breaks to complete before
flushing serverclose_wq and fileinfo_put_wq.

While cifs_kill_sb() is waiting on outstanding_rreq, any cifsFileInfo
referenced by an in-flight request (req->cfile) remains on
tcon->openFileList. On a mount using persistent handles, if a reconnect
runs on cifsiod_wq during this window, smb2_reconnect_server() calls
cifs_reopen_persistent_handles(), which walks tcon->openFileList and
takes a new reference on open_file via cifsFileInfo_get() to reopen the
handle over the network:

  Thread 1 (umount)      Thread 2 (cifsiod_wq)    Thread 3 (workers)
  -----------------      ---------------------    ------------------
  cifs_kill_sb()
  wait(outstanding_rreq)
    [blocks: rreq == 1]
                         smb2_reconnect_server()
                         cifs_reopen_persistent_handles()
                           finds open_file on list
                           cifsFileInfo_get(open_file)
                           [cfile->count: 1 -> 2]
                           cifs_reopen_file()
                                                  cifs_free_request()
                                                    cifsFileInfo_put()
                                                    [cfile->count: 2 -> 1]
                                                    dec(outstanding_rreq)
    [wakes: rreq == 0]
  flush(serverclose_wq)
  flush(fileinfo_put_wq)
  kill_anon_super(sb)
    -> generic_shutdown_super()
       BUG: Dentry still in use (1)
       VFS: Busy inodes after unmount!

Fix this by incrementing cifs_sb->outstanding_rreq when
cifs_reopen_persistent_handles() takes a reference on open_file and
decrementing it after cifsFileInfo_put(open_file), so wait_var_event()
in cifs_kill_sb() waits for any in-progress persistent handle reopen to
finish and queue its final put before draining fileinfo_put_wq.

Fixes: 340cea84f691 ("cifs: open files should not hold ref on superblock")
Reported-by: Adam Kim <adamkim@microsoft.com>
Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
---
 fs/smb/client/file.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
index 146ff2adfa244..e0b56c6c2c743 100644
--- a/fs/smb/client/file.c
+++ b/fs/smb/client/file.c
@@ -2044,6 +2044,7 @@ bool
 cifs_reopen_persistent_handles(struct cifs_tcon *tcon)
 {
 	struct cifsFileInfo *open_file, *tmp;
+	struct cifs_sb_info *cifs_sb;
 	LIST_HEAD(tmp_list);
 	bool retry = false;
 	int rc;
@@ -2060,12 +2061,16 @@ cifs_reopen_persistent_handles(struct cifs_tcon *tcon)
 	list_for_each_entry(open_file, &tcon->openFileList, tlist) {
 		if (!open_file->invalidHandle)
 			continue;
+		cifs_sb = CIFS_SB(d_inode(open_file->dentry)->i_sb);
 		cifsFileInfo_get(open_file);
+		atomic_inc(&cifs_sb->outstanding_rreq);
 		list_add_tail(&open_file->rlist, &tmp_list);
 	}
 	spin_unlock(&tcon->open_file_lock);
 
 	list_for_each_entry_safe(open_file, tmp, &tmp_list, rlist) {
+		cifs_sb = CIFS_SB(d_inode(open_file->dentry)->i_sb);
+
 		/* do not flush */
 		rc = cifs_reopen_file(open_file, false,
 				      CIFS_REOPEN_BOUND | CIFS_REOPEN_NOWAIT);
@@ -2075,6 +2080,8 @@ cifs_reopen_persistent_handles(struct cifs_tcon *tcon)
 		}
 		list_del_init(&open_file->rlist);
 		cifsFileInfo_put(open_file);
+		if (atomic_dec_and_test(&cifs_sb->outstanding_rreq))
+			wake_up_var(&cifs_sb->outstanding_rreq);
 	}
 	return retry;
 }
-- 
2.43.0

