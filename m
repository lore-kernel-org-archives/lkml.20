Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863634E5347
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790673504; cv=none; b=CECYDh3tXWp2SRVUuwcAFijgu3ub3sSNsOSBjnK5bfa0nMRm9d4Z6sKoNeb1ZGvtQ7vGJ2D2jn6eX4gZl22GePQ2WobeNaXaakpcj2sJWHhIMDk5fZHgJb7IGH1lRaqB0sarcwPOk1tB/W44XENNf8gEg5iEU11krbuD6OOvok8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790673504; c=relaxed/simple;
	bh=Pt/R6SVo00hbmkDx/ajgKJIFRaCBRu+cOwilMe50Q08=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IWCOBOhZbAAiBoxjAhjJ7U4pU99IO3VHScdYvcEoAsP7UipDlYZZUGPDLDQUjo1Ynlof3C8QLewTLCQnUoYc1XcwOERyqbJ/omzTNwLD1leHXfQqJ8NlO93VsC7bf6y6o2HvtQH24+vCLEu8xSpVSPhYzreLKeMdBr7WVhfmu8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io; spf=pass smtp.mailfrom=bynar.io; dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b=XETdJEkX; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bynar.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b="XETdJEkX"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d822dso29403015e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bynar.io; s=google; t=1790673494; x=1791278294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HEbcuQOsNHhsaRTUGzUpNNx6G2yduARsAJYBmH+qlpU=;
        b=XETdJEkXfcqFGs5+tLDjo1EKro9nPcc1t/EMp7n+oGeBnxYKRL0FsblhXVE/881zdZ
         txafAeQV+KDxDC8v55hTfXzDplLwEcTo0uQ1y0o8XlN8KRsm8rPXAjht9ObQJ1yew9NJ
         0CubvgjLp8NbFROePqQEw22tLfQD6Q1oA61I9md+6OQXzBY90WFwN19XZ3oLCoHUXR25
         vtC/1zIsQKunRt5dWk61d14XBEnIYKaDkCn55SZzspjlGTfUVcWEaT+QQgACokMUxb6M
         qvCBLy8gT02nmq0/LdA1jjQ7sqo4kJDZn26eGG2htR1l7hX9OeWpQ5n3asMY5GHtiiCx
         avWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790673494; x=1791278294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HEbcuQOsNHhsaRTUGzUpNNx6G2yduARsAJYBmH+qlpU=;
        b=0IOem75QwavoBEpVv3e5gEVdddEmWFVYkAQ0Y/vSoafjh/xHuyuAbwKMNycivG8z35
         QUSCAKfjhy6sJK0xDgsTnc6qEO9AatavCW4G1CutaDJbJDUlcLc34IvTy4c6WQOC3RA2
         nYdAXr7C1Ml0O6/eqpo3zcixRp5c3upDnDL0C2hBs2Ydh4h2bqx3b4bVgeWo1/kql40J
         175FZFIHL6iIgaQQ8geSoYxlBEUqDjDyIlDox7u414TK0WxqChRD+OCwcP/vUSM56S5K
         ZF5XvWiF068eAutxwR/wCbuwQBYEpJTrIXCMswm0CNi7ISSmPMCYE/bKIcEQm5GYFoFi
         m/8Q==
X-Forwarded-Encrypted: i=1; AKwUvBwFt4vV8fSHPGLfTrwcQdXwzpEp7RnuRe2rsgGOoSWWkIEuCOAgCBSYD2wwEneHZzrixU2/eD7x3kf3E3w=@vger.kernel.org
X-Gm-Message-State: AFuF++lGUQt2B73wYRXEkBpJT6Nx5VqV5AsXUNZaUfblRA7fqv+8Fb1X
	P/oXYvxqUMdP2Ogzz3wLGgi1RJVtDJXtSexQyts9mEQXuaJmBRVhRzWG47jfyo86mSDh
X-Gm-Gg: AYBFou188PzaLDmRGUl9qf6gsjFKEjdDzmgjtu/VrEegl7fYLvcraEAy2gxCFVkyxHj
	nQQOLI90yNKzccXoW/1keXk2Pm1xKolQvb5wIcGsbg3vqyLKdWcsGoiitv0l+xP3qP2e7bflWp/
	vY0V0Ix51kexUvhV47qeM66ft1gyTqaRNo8vVr5TSg0ae0Uyn+3ih79gN7yK+nqitdEmFXJZaAm
	h1zERlur8IZHBk8tNi8S1+elr5FEh5YGJn/IiMcV2PX08sJiyF7yII6jLntSKSqNVbm6JD575AO
	5DRZqL7x5XPBHWDxnFsbHwhoibgLT9HqADhEqGgAN+4scw/ow7sAPhPQG21xCCt4nugRJwo9yX2
	SjE2vobW2tqXlGU6oEoaMGmrNvnjgrZRkkudGG0r95onwGTaHXZAVScdUMVEkhwJb3xXWd8YkK7
	jA1S51l+vzO92BBEUNo2YcL6iXqme+QKHQJKzoHS6D6+qbGLc2aQN2gboX9TqgW6jlgR5ETBied
	NsfIllJCNIPvMbPx9x9FDvS0Vw=
X-Received: by 2002:a05:600c:5492:b0:49f:ffd0:4039 with SMTP id 5b1f17b1804b1-49fffd04049mr133236405e9.32.1790673493576;
        Tue, 29 Sep 2026 02:18:13 -0700 (PDT)
Received: from debian12.ucl.ac.uk (eduroam-int-pat-8-79.ucl.ac.uk. [144.82.8.79])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af51c57a0sm2155723f8f.15.2026.09.29.02.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:18:13 -0700 (PDT)
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
Subject: [PATCH 4/7] smb: client: fix OOB read in the SMB_FIND_FILE_UNIX name scan
Date: Tue, 29 Sep 2026 10:16:33 +0100
Message-Id: <20260929091636.2618227-5-diego@bynar.io>
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

cifs_fill_dirent_unix() finds the length of an SMB_FIND_FILE_UNIX
entry name by scanning for its terminating NUL, over up to PATH_MAX + 1
UTF-16 units in cifs_unicode_bytelen() or PATH_MAX bytes in strnlen().
Neither scan knows where the response ends. cifs_fill_dirent() only
requires the fixed part of the entry to fit, so the name can start
exactly at the end of the received data, and a name that holds no
terminator is then scanned for 8194 bytes, or 4096 bytes without
unicode, past the end of the received data. SendReceive() copies at
most 16468 bytes into the 16588-byte cifs_request allocation, so for a
response of that length up to 8074 of the bytes scanned lie past the
end of the allocation. Before the preceding patches bounded where the
entry starts, the entry itself could start up to 820 bytes past the
end of the allocation at the default CIFSMaxBufSize, and its name 928
bytes past it, so all 8194 scanned bytes would lie outside.
cifs_fill_dirent() rejects the name afterwards because it extends past
the end of the response, so nothing of what was read is used, but the
out-of-bounds read itself remains.

SMB_FIND_FILE_UNIX is only used with SMB1 servers that offer the Unix
extensions; SMB1 is not negotiated by default and requires an explicit
vers=1.0 mount.

Before the preceding patches, an entry placed past the buffer left the
scan out of bounds from its first read. They bound where the entry
starts, but nothing bounds the scan, so a name that holds no
terminator still runs off the end of the allocation. Reproduced on
the unpatched tree with KASAN enabled, for an entry that starts
inside the response, which is the case the preceding patches leave
open:

 ==================================================================
 BUG: KASAN: slab-out-of-bounds in cifs_save_resume_key.isra.0+0x75c/0x7f0
 Read of size 2 at addr ffff88807ee640cc by task ls/84

 CPU: 0 UID: 0 PID: 84 Comm: ls Not tainted 7.3.0-rc4-00457-gf14572c203d5 #69 PREEMPT(lazy)
 Call Trace:
  <TASK>
  kasan_report+0xdf/0x1a0
  cifs_save_resume_key.isra.0+0x75c/0x7f0
  cifs_readdir+0x1ed6/0x29c0
  iterate_dir+0x1c0/0x570
  __x64_sys_getdents64+0x133/0x270
  do_syscall_64+0x109/0x5d0
  entry_SYSCALL_64_after_hwframe+0x77/0x7f
  </TASK>

 Allocated by task 84 on cpu 1 at 15.751078s:
  cifs_buf_get+0x36/0x90
  smb_init+0x4f/0x110
  CIFSFindNext+0xf7/0x14c0
  cifs_readdir+0xf51/0x29c0

 The buggy address belongs to the object at ffff88807ee60000
  which belongs to the cache cifs_request of size 16588
 The buggy address is located 0 bytes to the right of
  allocated 16588-byte region [ffff88807ee60000, ffff88807ee640cc)
 ==================================================================

The two bytes read there are one UTF-16 unit of the scan, at the first
byte past the end of the object. The scan carries on from there,
reported again 2, 4 and 6 bytes to the right.

Pass the number of bytes that follow the fixed part of the entry to
cifs_fill_dirent_unix() and stop both scans there. A scan that reaches
the end of the response without finding a terminator now fails: it
returns a name that ends exactly at the end of the response and would
otherwise pass the bound, so cifs_fill_dirent() requires the position
of the terminator of an SMB_FIND_FILE_UNIX name to lie inside the
response as well. Accepting such a name truncated at the end of the
response would turn a malformed entry into a directory entry, or a
resume name, that no server sent. A name longer than the PATH_MAX cap
of the scans is still truncated there, as before, when the response
extends past the cap. The message cifs_unicode_bytelen() logs when it
finds no terminator now covers both limits.

This patch depends on "smb: client: fix OOB read of the resume name
sent in TRANS2_FIND_NEXT2", which adds the end argument of
cifs_fill_dirent() and the length it derives from it; the backport
note in that patch applies to this one as well.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: <stable@vger.kernel.org>
Assisted-by: Bynario AI
Signed-off-by: Diego Oliva <diego@bynar.io>
---
 fs/smb/client/readdir.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/fs/smb/client/readdir.c b/fs/smb/client/readdir.c
index fdbe22b24c47..1e121c970685 100644
--- a/fs/smb/client/readdir.c
+++ b/fs/smb/client/readdir.c
@@ -456,16 +456,16 @@ initiate_cifs_search(const unsigned int xid, struct file *file,
 }
 
 /* return length of unicode string in bytes */
-static int cifs_unicode_bytelen(const char *str)
+static int cifs_unicode_bytelen(const char *str, size_t maxlen)
 {
 	int len;
 	const __le16 *ustr = (const __le16 *)str;
 
-	for (len = 0; len <= PATH_MAX; len++) {
+	for (len = 0; len <= PATH_MAX && (size_t)len < maxlen / 2; len++) {
 		if (ustr[len] == 0)
 			return len << 1;
 	}
-	cifs_dbg(FYI, "Unicode string longer than PATH_MAX found\n");
+	cifs_dbg(FYI, "Unicode string not terminated within %d bytes\n", len << 1);
 	return len << 1;
 }
 
@@ -532,13 +532,13 @@ static void cifs_fill_dirent_posix(struct cifs_dirent *de,
 }
 
 static void cifs_fill_dirent_unix(struct cifs_dirent *de,
-		const FILE_UNIX_INFO *info, bool is_unicode)
+		const FILE_UNIX_INFO *info, bool is_unicode, size_t maxlen)
 {
 	de->name = &info->FileName[0];
 	if (is_unicode)
-		de->namelen = cifs_unicode_bytelen(de->name);
+		de->namelen = cifs_unicode_bytelen(de->name, maxlen);
 	else
-		de->namelen = strnlen(de->name, PATH_MAX);
+		de->namelen = strnlen(de->name, min_t(size_t, maxlen, PATH_MAX));
 	de->resume_key = info->ResumeKey;
 	de->ino = le64_to_cpu(info->basic.UniqueId);
 }
@@ -589,6 +589,7 @@ static int cifs_fill_dirent(struct cifs_dirent *de, const void *info,
 		const char *end, u16 level, bool is_unicode)
 {
 	size_t len = end > (const char *)info ? end - (const char *)info : 0;
+	size_t nul_len = 0;
 
 	memset(de, 0, sizeof(*de));
 
@@ -601,7 +602,9 @@ static int cifs_fill_dirent(struct cifs_dirent *de, const void *info,
 	case SMB_FIND_FILE_UNIX:
 		if (len < offsetof(FILE_UNIX_INFO, FileName))
 			goto too_short;
-		cifs_fill_dirent_unix(de, info, is_unicode);
+		cifs_fill_dirent_unix(de, info, is_unicode,
+				      len - offsetof(FILE_UNIX_INFO, FileName));
+		nul_len = is_unicode ? 2 : 1;
 		break;
 	case SMB_FIND_FILE_DIRECTORY_INFO:
 		if (len < offsetof(FILE_DIRECTORY_INFO, FileName))
@@ -634,7 +637,7 @@ static int cifs_fill_dirent(struct cifs_dirent *de, const void *info,
 	}
 
 	if (de->name && (end < de->name ||
-			 (size_t)(end - de->name) < de->namelen)) {
+			 (size_t)(end - de->name) < de->namelen + nul_len)) {
 		cifs_dbg(VFS, "search entry name extends past end of SMB\n");
 		return -EINVAL;
 	}
-- 
2.39.5

