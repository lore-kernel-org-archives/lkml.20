Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF234E73AC
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790673498; cv=none; b=kbVnm5A8duy9W75iBKJk4go6mhql8qBWbD8iDLkEDtdEgxzPfIyWqxswwlFko3MdJuNvCg/qqr+LI8OUJim6yxUQaTfMeQTJG+Y86KQECMeD+Xe0MTPGJrarylto/vgsCsuaflInKfX5/lg5pWK+RQoD5IJ/4QEDYNp4s5gRQfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790673498; c=relaxed/simple;
	bh=pEph43Q4tLHUpQYb4svQJJhtSj2TohB6leiXzLJ6EQI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JNq5sBEepEQaqW7biAs9hs/5MSo0FKycR/Cp9YN6yyjbvKWDhsRdyZx5bAZqKGJ4zMtB+ytRoY1h3uXRU35jgKzGNbyN/yEUblvax28/0+krax8UeaDdUFtDhLP8LZG8vwzEnzGBj/WSs2kzfn+WjobwEbn9T72dzF+gYRJlL7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io; spf=pass smtp.mailfrom=bynar.io; dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b=TV2WdM4S; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bynar.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b="TV2WdM4S"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a006bb267eso9260415e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bynar.io; s=google; t=1790673490; x=1791278290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qrwh6pTbzOUCUmhZLljCP6/BsT/ROquyHGFoBYg3wGQ=;
        b=TV2WdM4S9GXzXdEsvmOhcF7AyBHyCsHmaJxRVPq83JvZXgsfLeJ4D0jszk1drw/Lvi
         8szxO4GCRNttmWbKEVOzySswJk7Sy1kbPNse5qe1qbXluOfzxEg6TqjeZxpK4gIxw4kY
         hrCu2XnIlPvKZM3sx5n44Xczm2zN3/693rSMzyO7q6HudU6JnBA8OtJ/JRgQWNPV/mBK
         PNcymodyOL2gRXgB4ZJMVvbnKheJTIf7uljBjLrJZKb+glIiOsZ8SUpeD2nMBaNC4rzl
         komAELBTPedohYXBDq5iBWj0QtvSpgr66ClFLu6PLnwhl2eWZJg4+pZKw4a8jm7nFxF/
         uXRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790673490; x=1791278290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qrwh6pTbzOUCUmhZLljCP6/BsT/ROquyHGFoBYg3wGQ=;
        b=ms/WxMwrg7o53+uoaOOBCI38yqw+mpD31ExQ6f15fCdm8WRAvmRRiJu1dbv1kt3Sl6
         m9l6SZNCweWV7dzQbOYSTKInR6bYOEY9fw7KIjOuFvRuNcC5OzODi3T8gACRyMwUxEEX
         KMqUZdkddzaBtcrhCveAdpAy0AljjtGcg3KPA0hrWZ1zUTJkwZxLIMRDUOe7IcXbL0fA
         9krN7v0AzZQreSwXSwlUrEsqkKb8kGj01olVIUpr/btKzq83A6w5poNqQHnZEmIR2wz2
         JC2dkiNzoAhMqzz+EQEjH7lGX9JWhituHU4ZQZIkcJchY8szAljQG1iS+qAxEBkDISET
         A+Ow==
X-Forwarded-Encrypted: i=1; AKwUvBxofEj6Z1CtoQwggMDXo4uRrPkQZepSzGlF3kFjOISW38eeBH5xqlzyzeXgkU+ptifmB05ERPdAB/Gitss=@vger.kernel.org
X-Gm-Message-State: AFuF++l6dadvpBswAAmQQVEG9IQ1AUH+9sMXfjezB1G1LCYz9h3bOqVx
	ZetHgV6pJuhnbaJkY33DJ+sZVlCxHusp8D5WmKDPS4ey2ClfDLtfNmSqXURoYz8zvKBh
X-Gm-Gg: AYBFou1qsC3WvWr9DpNJtYcENEwc5zNaFDXcKzdkh2tZ1IBx321ewV9R82vf0LYevhL
	wKXHDoF8ySS6i17xgamQ9IaSrVmrKG1iPrwrD1QSjZjLVY2N6qO+R6YETcp9hYk7CJoKWeqaeV0
	IsxR9+63i3ZWBrW2ZiY9WbfzmTXeqzq30aCViRx1IwNHdMvAOmS4jzE80DJfbxJUewQAWiN33AS
	mC0Egh3tioy4b1YZZFGZtIaSqn79nbqh80NxH/jPo4WLiiMcvPu3irFrWuxevE3uu2BDMbj8SeD
	nk0cT2zaJjyIDclLhuoWSVafELo2csM8cjnDoZvVVLE9BDLeaulweam7GAB4B7uZDHkwjiD+89W
	8yVWtXQJwO29MyQI3T7yhFzoutv8zuucKejFeh1EkOGDOlu0lMvQTSbjwT28BbCnhXbYP1ZFSvA
	6h81C7qOhQz2BWwDWXbrwNisDiOvuFLyV4ICbZJvXEFP5EnwRmGCedgzrnjrqKEJCby8NsALQBL
	ykLHrMzAfRH0xn10ldeTIcz+726arhdVbqNPg==
X-Received: by 2002:a05:600c:8710:b0:49f:fefa:cfcd with SMTP id 5b1f17b1804b1-49ffefad13fmr120257145e9.5.1790673489890;
        Tue, 29 Sep 2026 02:18:09 -0700 (PDT)
Received: from debian12.ucl.ac.uk (eduroam-int-pat-8-79.ucl.ac.uk. [144.82.8.79])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af51c57a0sm2155723f8f.15.2026.09.29.02.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:18:09 -0700 (PDT)
From: Diego Oliva <diego@bynar.io>
To: Paulo Alcantara <pc@manguebit.org>,
	Namjae Jeon <linkinjeon@kernel.org>,
	linux-cifs@vger.kernel.org
Cc: Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Bharath SM <bharathsm@microsoft.com>,
	Jeff Layton <jlayton@kernel.org>,
	samba-technical@lists.samba.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] smb: client: fix use-after-free infoleak via the readdir resume name
Date: Tue, 29 Sep 2026 10:16:30 +0100
Message-Id: <20260929091636.2618227-2-diego@bynar.io>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260929091636.2618227-1-diego@bynar.io>
References: <20260929091636.2618227-1-diego@bynar.io>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CIFSFindNext() copies the resume name that cifs_save_resume_key()
recorded from the last entry of the previous response into its request;
psrch_inf->presume_name points into the response buffer that entry came
from, and nothing ever clears it. find_cifs_entry() records a new
name only from a response with a usable last entry, and cifs_readdir()
only from an entry it walks to, so a response that carries no entries
and leaves last_entry NULL, because CIFSFindFirst() or CIFSFindNext()
rejected LastNameOffset, refreshes neither and presume_name keeps
pointing into the previous response. That buffer has already been
released: by CIFSFindNext() before it installs the new response, or by
find_cifs_entry() when it rewinds the search, which does not drop the
name either and can then fail in initiate_cifs_search() before a new
response replaces it. The next CIFSFindNext() then copies up to
PATH_MAX - 1 bytes of the resume name out of the released buffer into
its request and sends them to the server: a use-after-free read
that leaks kernel memory to a malicious or compromised server, which
can provoke it with a single FindNext response that carries no entries
and a LastNameOffset above CIFSMaxBufSize, which is all the existing
check rejects.

With KASAN enabled, a server that answers a listing that way gives:

 CIFS: VFS: ignoring corrupt resume name
 ==================================================================
 BUG: KASAN: slab-use-after-free in CIFSFindNext+0x8ca/0x14c0
 Read of size 4080 at addr ffff88807c823f98 by task ls/83

 CPU: 0 UID: 0 PID: 83 Comm: ls Tainted: G    B               7.3.0-rc4-00457-gf14572c203d5 #69 PREEMPT(lazy)
 Tainted: [B]=BAD_PAGE
 Call Trace:
  <TASK>
  kasan_report+0xdf/0x1a0
  kasan_check_range+0x10f/0x1e0
  __asan_memcpy+0x23/0x60
  CIFSFindNext+0x8ca/0x14c0
  cifs_readdir+0xf51/0x29c0
  iterate_dir+0x1c0/0x570
  __x64_sys_getdents64+0x133/0x270
  do_syscall_64+0x109/0x5d0
  entry_SYSCALL_64_after_hwframe+0x77/0x7f
  </TASK>

 Allocated by task 83 on cpu 1 at 13.497119s:
  cifs_buf_get+0x36/0x90
  smb_init+0x4f/0x110
  CIFSFindNext+0xf7/0x14c0
  cifs_readdir+0xf51/0x29c0

 Freed by task 83 on cpu 0 at 13.584018s:
  cifs_buf_release+0x41/0x80
  CIFSFindNext+0xfce/0x14c0
  cifs_readdir+0xf51/0x29c0

 The buggy address is located 16280 bytes inside of
  freed 16588-byte region [ffff88807c820000, ffff88807c8240cc)
 ==================================================================

The same memcpy() first reads past the end of that object while it is
still live, a slab-out-of-bounds read that the following patches
bound; that is the taint the report above carries.

SMB1 is not negotiated by default; reaching this code requires an
explicit vers=1.0 mount.

Clear presume_name and resume_name_len whenever a new response is
installed and when the rewind path releases the search buffer, so that
the name never outlives the buffer it points into, and reset
resume_key with them, since it was taken from the same entry and would
otherwise be sent with an empty name. A response without a usable
last entry then continues the search with an empty resume name rather
than a stale one; CIFSFindNext() skips the copy of a zero-length name
so that it never runs on the NULL pointer.

The next patch in the series leaves last_entry NULL for a response
that carries no entries, and bounds LastNameOffset against the
received response rather than against CIFSMaxBufSize. Responses that
are given a last entry today then take the path fixed here, so that
patch must not be applied without this one.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Fixes: b77d753c413e ("[CIFS] Check that last search entry resume key is valid")
Cc: <stable@vger.kernel.org>
Assisted-by: Bynario AI
Signed-off-by: Diego Oliva <diego@bynar.io>
---
 fs/smb/client/cifssmb.c | 9 ++++++++-
 fs/smb/client/readdir.c | 3 +++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/fs/smb/client/cifssmb.c b/fs/smb/client/cifssmb.c
index 6dddbd84b93b..67f033b960e6 100644
--- a/fs/smb/client/cifssmb.c
+++ b/fs/smb/client/cifssmb.c
@@ -4543,6 +4543,9 @@ CIFSFindFirst(const unsigned int xid, struct cifs_tcon *tcon,
 	psrch_inf->entries_in_buffer = le16_to_cpu(parms->SearchCount);
 	psrch_inf->index_of_last_entry = 2 /* skip . and .. */ +
 		psrch_inf->entries_in_buffer;
+	psrch_inf->presume_name = NULL;
+	psrch_inf->resume_name_len = 0;
+	psrch_inf->resume_key = 0;
 	lnoff = le16_to_cpu(parms->LastNameOffset);
 	if (CIFSMaxBufSize < lnoff) {
 		cifs_dbg(VFS, "ignoring corrupt resume name\n");
@@ -4607,7 +4610,8 @@ int CIFSFindNext(const unsigned int xid, struct cifs_tcon *tcon,
 	name_len = psrch_inf->resume_name_len;
 	params += name_len;
 	if (name_len < PATH_MAX) {
-		memcpy(pSMB->ResumeFileName, psrch_inf->presume_name, name_len);
+		if (name_len)
+			memcpy(pSMB->ResumeFileName, psrch_inf->presume_name, name_len);
 		byte_count += name_len;
 		/* 14 byte parm len above enough for 2 byte null terminator */
 		pSMB->ResumeFileName[name_len] = 0;
@@ -4662,6 +4666,9 @@ int CIFSFindNext(const unsigned int xid, struct cifs_tcon *tcon,
 	psrch_inf->endOfSearch = !!parms->EndofSearch;
 	psrch_inf->entries_in_buffer = le16_to_cpu(parms->SearchCount);
 	psrch_inf->index_of_last_entry += psrch_inf->entries_in_buffer;
+	psrch_inf->presume_name = NULL;
+	psrch_inf->resume_name_len = 0;
+	psrch_inf->resume_key = 0;
 	lnoff = le16_to_cpu(parms->LastNameOffset);
 	if (CIFSMaxBufSize < lnoff) {
 		cifs_dbg(VFS, "ignoring corrupt resume name\n");
diff --git a/fs/smb/client/readdir.c b/fs/smb/client/readdir.c
index 9530e5b01564..6ab4e687c3e4 100644
--- a/fs/smb/client/readdir.c
+++ b/fs/smb/client/readdir.c
@@ -752,6 +752,9 @@ find_cifs_entry(const unsigned int xid, struct cifs_tcon *tcon, loff_t pos,
 			cfile->srch_inf.ntwrk_buf_start = NULL;
 			cfile->srch_inf.srch_entries_start = NULL;
 			cfile->srch_inf.last_entry = NULL;
+			cfile->srch_inf.presume_name = NULL;
+			cfile->srch_inf.resume_name_len = 0;
+			cfile->srch_inf.resume_key = 0;
 		}
 		rc = initiate_cifs_search(xid, file, full_path);
 		if (rc) {
-- 
2.39.5

