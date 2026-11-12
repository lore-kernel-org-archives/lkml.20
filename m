Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794457307;
	b=cVOayN0YxuvJXx7ifs50bzkksEky3WXGR3AJvF88+ULg9PPSYR06GM4u3TXtLZNnZI53
	 5a7jFeO0DBDFwS0MU+GnHhNufY7IO6nTgU3Ow//hlFZVJBsykPyNUN64VabW6kJ+9A1Fh
	 OW+TXphTn+LiF/k0+C/1vtUbvBXrFqXGiyn1kY8jDymS+nOZfjXXwfADjxPAR/RaOEufH
	 HfM7WJllk1LIj6jG0q3ef6MlYC1P7q4Qu2kL9+/Dh/33bOVjZXW8uNQMXHxap4uiC2NKH
	 38hBtJis/I5jhS01Uw9qMJInYI5VrIf/kRqnHM21tzhdVWfUbrLA0w7znpKI1oWLz5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794457307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=juANi56qwSWTWzrj5h15PKZII373PLXorjRyBOcmsyk=;
	b=MbsO3ddQcnLhPF0sIzUJwxPFBc8TaY1agRY8ch/MEs4oAko2LC9eCA7Plk4zTIQbdR/8
	 HvcVmPc2fL+DHsvQ/RoCXiNbqaLrPAbFzPwmyIXJZpjgHE/mXLUcRr4S5rF1oYzoiUC4Z
	 GqRkXcaUfcFGngxZXuBDCbMl4NaM7OcIO3QIcC9Sdb5TrZX+/5g6oOfD1lc6vc6a9XCa7
	 hBwfzgyzALOd4dAT3t2lAu1Ua7tzmWYJG80bZh5WHmf6ykKiOhMB2Jnv9MiCgplm9MAwd
	 ykn7rIz5n1xgGSUJFpSr2WfdC713xm1PoB/vOBaH8oaEOhC/LSoNs7nQDQ/xgZppOYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dw7uovNY;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADBE606A324
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:21:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ADBE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dw7uovNY
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cdd89d84521so171274a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794457306; x=1795062106; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=juANi56qwSWTWzrj5h15PKZII373PLXorjRyBOcmsyk=;
        b=Dw7uovNYBTbAEZaxM1MG/UZBxai/DRQ4KlDIbj+qtHRUJUbGFavjOePAquBTZafw2w
         QsHna4vo4YI+JpIlO0J1CfUkTJqfiIca2NImwuChbB99Xr8SG9WKBO29RuhdfYhSXOTJ
         dYf6vtLJmarEPrpeTpAN5O9U16bIYKLDMayHC9V8ttfaHSObS2noSX4hlSm3NDKDvy7L
         lm7R5sQ1gC+kik+18I+ulyZYp11Xd4kvxVDz/2SiG1U/Kh6CsXBd3CXJ8858pKPQTKCb
         LkAnObFL/vW1XJpk12r/iKPB8W66LotuX6Qlhl2cRmc4npFMCsMatvRI7zlZeNhZMfFS
         8tRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794457306; x=1795062106;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=juANi56qwSWTWzrj5h15PKZII373PLXorjRyBOcmsyk=;
        b=jFneW65R8VwkJ0Bbp/M9fd7fxoMh/4q9Dxg5xhmodaL93vFw/qo5z2zK2JQCDMdhb5
         0iv3JFPZTuoL135+q5H+No8C1lUFfRoD0syvw/k9L/onLfMxbxfSOkipcpW8TVgonaJU
         /uMCu1wL6Sc2yJwDiHLzHJJwSkxFCEeAAzl3TzG8fPjI19uoGw+kH43Mph9sYIoGgnud
         RKqrbwLEUWFIHuLWJZtIaCcLQPeg3/wVxLn0JV/d/uMGMsowaT175p54yOcEN8VQLFz3
         LvCg4aRt1clRS8q6riG2CGl1cRjbKTkdWhQYIir4m6lOAjeeXmehInMROBsWSLYRSlJC
         VTmg==
X-Forwarded-Encrypted: i=1; AL+hErESU2K5HDuHTVbbBFgWSqD/D502bv3EiicOqFH5NfGiJN4L9Qt2sQVsrb/ghvWWh6IyoNKEnmtKX3X+8a8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8KBhtQENVv7kVZEn9BN682V/rgBALYuAAw+/OWPzQFzSHR+/P
	1zeNv9waeQ7OenfZYMSycVsQxFDe83vpcFua3R5erYSc6B0+qOCeWiMh
X-Gm-Gg: AYBFou3LiNUNmsdnRDpBqy+ZE6NCFU0t9lewytVAY8aKJP6ezxkk/cR/a9LIB1oCT5O
	nJ7doacH0iYLwDuwGBdQukf5EX8WnVqFA6tGMUpHJgwO+r3yU33rJftzPInl7/QSGAxkWB6dTap
	rAsJ2y2shAJA9FIs9QzxqpmD+dWrwcf9qt8wFbj0dbNXp7x4QdpHFwJ8Z26rY26EFbbIyU3PvRg
	RnDKcuijiePAxyUPKjZWZAsF74omsXyNOOx8qaVQp9skpilsj9JwNS1qeGpS7Ppi0HhnXIlNtnL
	2BgL9rkVPKszLT0Eog12DSlpexc4U/HN6Ak81ZmgtiDQe8tWUa/8p1ox2Z7OIODxHogzqO2GMbG
	0ka9cBo3wmDYMk+pti+vkAz2sA1YRyqItcV5SR+CDOa1bIlO+SFJFHMykfUk0p/05v67HGsYzxx
	GgTHPWIBZc7mDyyszxJ4bwoHMojcNTdXucz39x6XpKDKXChmaISu3BS/LvBXBnqpUXu1tq5fRHw
	4PKVpeclohnfmblvU3mYY84t08pOeo275/TOMS74YZ588XeROEgTEcwre/CPFWm8QoxGTPjFSxK
	x5q1cKNAoy0ZJjYKi0HyHfAsl9gP5WFr78sAUHULtgLwAUrrmM0=
X-Received: by 2002:a17:90b:50cc:b0:3b1:6e2:3693 with SMTP id 98e67ed59e1d1-3b197c93f2fmr920063a91.17.1794457306154;
        Wed, 11 Nov 2026 20:21:46 -0800 (PST)
Received: from fred-server.tail1cd3ef.ts.net ([2600:381:9205:b5df::7ff])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197b76ccesm2439180a91.0.2026.11.11.20.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:21:45 -0800 (PST)
From: Fredric Cover <fredric.cover.lkernel@gmail.com>
To: Paulo Alcantara <pc@manguebit.org>,
	Namjae Jeon <linkinjeon@kernel.org>
Cc: ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
	Tom Talpey <tom@talpey.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Bharath SM <bharathsm@microsoft.com>,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fredric Cover <fredric.cover.lkernel@gmail.com>
Subject: [PATCH] smb: client: convert path_consumed to mount charset units
Date: Thu, 12 Nov 2026 04:21:36 +0000
Message-ID: <20261112042137.1642509-1-fredric.cover.lkernel@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

path_consumed in a DFS referral counts bytes of the canonical path,
which is in the DFS cache charset (utf8). dfs_parse_target_referral()
applies it as an offset into full_path, which is in the mount charset.
When the mount charset is not utf8, each non-ASCII character in the
consumed part that encodes longer in utf8 than in the mount charset
makes the offset too large, so leading characters of the prefix path
are dropped. For example, with iocharset=iso8859-1, mounting
//srv/dfs/café é/sub yields the prefix "ub" instead of "sub" and the
mount fails with -ENOENT. (A single accented character only worked
because the offset happened to land after the delimiter.)

Translate the count in parse_dfs_target(), where both strings are
available, by matching path components: count the delimiters in the
consumed part of the canonical path and find the same position in the
mount charset path. Delimiters are ASCII in both and are not affected
by remapping. If the consumed bytes are identical in both strings,
which is the case for utf8 mounts and ASCII-only prefixes using the
default backslash delimiter, the value is used unchanged.

This assumes the server reports PathConsumed on a component boundary;
a translated value that ends mid-component is rounded up to the next
boundary.

Tested against Samba on a KASAN kernel: with iocharset=iso8859-1, links
with 0 to 3 accented characters followed by a tail, a two-level tail,
an accented tail, a link in a subdirectory, and mapposix with an
accented name; iso8859-15 and cp932 mounts; and iocharset=utf8
controls. Not tested against Windows servers, with posixpaths, or with
reserved characters under mapchars/mapposix.



Signed-off-by: Fredric Cover <fredric.cover.lkernel@gmail.com>

---
Hi Paulo,

This is the follow-up you asked for in your reply to the earlier series.
Based on cifs-next at 25912ed3b75d.

Separately, reconnecting a mount whose prefix path contains non-ASCII
characters still fails with a non-utf8 charset; I'm looking at that
and will send it as its own patch.

---
 fs/smb/client/dfs.c | 70 +++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 68 insertions(+), 2 deletions(-)

diff --git a/fs/smb/client/dfs.c b/fs/smb/client/dfs.c
index 57c90a2512a3..cbc2ea6a190b 100644
--- a/fs/smb/client/dfs.c
+++ b/fs/smb/client/dfs.c
@@ -85,16 +85,82 @@ static void set_root_smb_session(struct cifs_mount_ctx *mnt_ctx)
 	ctx->dfs_root_ses = ses;
 }
 
+static bool dfs_is_delim(wchar_t c)
+{
+	return c == '/' || c == '\\';
+}
+
+/*
+ * @consumed counts bytes of the canonical (cache charset) path @cpath.
+ * Return the matching byte offset in @fpath, which holds the same path in
+ * the mount charset.  Offsets are matched by path component, since the
+ * delimiters are ASCII in every charset and survive remapping.
+ */
+static int dfs_consumed_to_local(const struct nls_table *nls,
+				 const char *cpath, const char *fpath,
+				 int consumed)
+{
+	size_t clen = strlen(cpath), flen = strlen(fpath), off = 0;
+	int ndelims = 0, seen = 0, i;
+	bool ends_on_delim;
+
+	if (consumed < 0)
+		return -EINVAL;
+
+	/* Identical bytes in both strings: units already agree */
+	if ((size_t)consumed <= min(clen, flen) && !memcmp(cpath, fpath, consumed))
+		return consumed;
+
+	if ((size_t)consumed > clen)
+		consumed = clen;
+
+	for (i = 0; i < consumed; i++)
+		if (dfs_is_delim(cpath[i]))
+			ndelims++;
+	ends_on_delim = consumed && dfs_is_delim(cpath[consumed - 1]);
+
+	while (off < flen) {
+		wchar_t uni;
+		int len = nls->char2uni((const unsigned char *)fpath + off,
+					flen - off, &uni);
+
+		if (len <= 0) {
+			uni = (unsigned char)fpath[off];
+			len = 1;
+		}
+		if (dfs_is_delim(uni)) {
+			if (!ends_on_delim && seen == ndelims)
+				break;		/* start of next component */
+			seen++;
+			if (ends_on_delim && seen == ndelims) {
+				off += len;	/* just past the last consumed delimiter */
+				break;
+			}
+		}
+		off += len;
+	}
+	return off;
+}
+
 static inline int parse_dfs_target(struct smb3_fs_context *ctx,
 				   struct dfs_ref_walk *rw,
 				   struct dfs_info3_param *tgt)
 {
 	int rc;
 	const char *fpath = ref_walk_fpath(rw) + 1;
+	const char *cpath = ref_walk_path(rw) + 1;
 
 	rc = ref_walk_get_tgt(rw, tgt);
-	if (!rc)
-		rc = dfs_parse_target_referral(fpath, tgt, ctx);
+	if (!rc) {
+		struct dfs_info3_param local = *tgt;
+		int off = dfs_consumed_to_local(rw->mnt_ctx->cifs_sb->local_nls,
+						cpath, fpath, tgt->path_consumed);
+
+		if (off < 0)
+			return off;
+		local.path_consumed = off;
+		rc = dfs_parse_target_referral(fpath, &local, ctx);
+	}
 	return rc;
 }
 

base-commit: 25912ed3b75dcf5ff623dcb549b925dd0d0948f7
-- 
2.53.0

