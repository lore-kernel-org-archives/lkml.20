Received: from mail-pz2-f25.google.com (mail-pz2-f25.google.com [74.125.228.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4003D331EB5
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 06:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790405425; cv=none; b=WS3T2I3fiOcXxT6PbfkR43Qb8N8ec8NVw3g79afOIHszkH9KlbtiyYd3ZwlaLlGtfgwOm80KUq3nbhT2ucnZX4vU5J2MIYJgaczg7Ywm9k040ddS2MNzEb3+Y7+RYpnW0AoLkqeWjhbhkQDoBkMs3pPKg7IkwxwaOlx1ZNK+PTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790405425; c=relaxed/simple;
	bh=e+Ut2QFN7CI3vbeEn82zMl57Xjd0B2AHAqke8Cvb+i0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UrensWVxyL0EdAHU6utotlaCbJ2ua2DwrBsYNcVIUlCoiqZYR0di3hJIyF2ezdy34g8kgo8424od3FxPLvZ/Ovm0ZhjSamJWujKfLXmrv8/qD5Lp1UV6AHWAvna30QSu2iURKE/8c+vbQeCz4fCKThx6inQRLJv6m81MQwQlD3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=fABC+22k; arc=none smtp.client-ip=74.125.228.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="fABC+22k"
Received: by mail-pz2-f25.google.com with SMTP id 41be03b00d2f7-cc1cebad4aeso488004a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 23:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1790405422; x=1791010222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OSTQl7TWfO/HBakXURDp6p7BA/fXMZ8rsqfWWwwFT8M=;
        b=fABC+22k9AnXokgT5PO+rqln/2f6yH/LaqEm3h464Kr+CVkAgEKmr+dtV754XCIdFJ
         gS/boBd30josbZsaM4VxP/sVQOb6e58fXS7Bj72DWrRwiGrTlyp0t6CDEfp7wQ4yEG0h
         mv7AwdOZoCdRbRvMJXRxb5jIkSoangh62wJitp8cFRp0SXIsKKuw1gRmtLUMk7xJMwO/
         LVmavxAgUHOQq1Py12b95nkGbTX610DRXn7fm1C3h5IrVULj0CSzOWo92G9U/5DeysX4
         ajft3VI4BpyvkzTezCmr84Cm4SXcLRQMT6yH1yqTI5iJBqkLk5kYrwwF4SfZV5CBgn93
         A97w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790405422; x=1791010222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OSTQl7TWfO/HBakXURDp6p7BA/fXMZ8rsqfWWwwFT8M=;
        b=1Yc+DUEvxdndP8oZQ6mK/jLTutc5VBp/WST0lhOqjQ50L9O01hdNA4RmINkgrAFYZB
         2NXUoyIKyKtT0VmcC997KO10igLZnkpaSC2hpm2bjQDkt/vYDz0fW7DPvo5elQB28/+0
         eyu+GZg1FMtFvl52uBX6vBU0UJm2+rrMyMfsnBjYjPW/fL2c23eK82XvIhZzQrHBvsrX
         L4MVL5TNLxE5+MCy9yFqZcwNrr/1YsV6bn8ty+hCoOeNyI5X2dpUuvODxVkvUNIJqaI/
         dy7x3U9d3uvZzxc/Edjkuo9vzXobbacC3eb/xbT6U3pUNFkj/3UE9hdPIGA8Ui88+9xZ
         WoxQ==
X-Forwarded-Encrypted: i=1; AKwUvBzA2U3BbGY3pYOjstkylPZtTE2BmZH7GEaJUQRy8z8ZajlTfBB0LmPdUslgrg+cdl/4vfXlJceGDj8hiII=@vger.kernel.org
X-Gm-Message-State: AFuF++l6MSylJ+wE5ApEJzGJnLEYVX3KtNzi3271smZSNGBCVBQXnJ0p
	846DSwvNE13n5xdgqKAwWpj/SvBm/iDnyZ9Yr9ToeAbcY7FsXjNnU5HjnU2pdw1ZiF6Q
X-Gm-Gg: AYBFou1RLvisxqKx1mb80xp2rQCIO/GY7hMq+lz9e/zERNifQAYp3QI2k1FqR5WZAFH
	XlCNtRYW6ILHXShg4dC/lE7wz6p3AlNePSCUebaqmLiroC+ZKWjrMEYY2u6QxtlsftRGfBQTvrI
	Dk0QbrknzrfiZjCtmroSnrgS5daNwaoIGWS5OnEMYfHPx2h1Dd1zEwx/7z5IPXbx3R/fcweOy84
	aZ2gdeJfbL3JvzkR4LdHQyodJ667StpsCAi/7bdHiJNo8DRkMObx/f7IFMGzZ3ZVrj6/A3rh9ZU
	cHiOgKeJCCYHn0Ez4XyXba5Hy7f2v84UAh8D61vFuKUFxmZGXf2jANYnj2KnOCAvMCdVLX8yVJK
	79yYwiF3N4QAwUft6t0vmYcrkCwb/1d1cEvBEWIOLZ3MGQsN5xea0ls+wOrM9KmAuyBwQ8itMkq
	6qKe88n+GJjdeSrEyqdwzzSqTZChtv4jdcXb1GSx9JoFzpOuoqt9YRUHPSKgh2YzLSoEKPsGeVn
	a2Br/0iINhpIzAgmpjKmEjwPQkulQ==
X-Received: by 2002:a17:90b:44:b0:3a0:cc33:2285 with SMTP id 98e67ed59e1d1-3a0cc3324bcmr2093889a91.22.1790405422398;
        Fri, 25 Sep 2026 23:50:22 -0700 (PDT)
Received: from 954df21a5119.. ([122.51.212.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b498fb12sm3447327a91.0.2026.09.25.23.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 23:50:21 -0700 (PDT)
From: Zihan Xi <zihanx@nebusec.ai>
To: sfrench@samba.org
Cc: zihanx@nebusec.ai,
	pc@manguebit.org,
	ronniesahlberg@gmail.com,
	sprasad@microsoft.com,
	tom@talpey.com,
	bharathsm@microsoft.com,
	pshilovsky@samba.org,
	aaptel@suse.com,
	pali@kernel.org,
	linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v5 1/6] smb: client: fix create context out-of-bounds reads
Date: Sat, 26 Sep 2026 06:49:21 +0000
Message-ID: <3e9396339a0bc331aa8d7dcd319a750b827a67f8.1790398755.git.zihanx@nebusec.ai>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790398755.git.zihanx@nebusec.ai>
References: <cover.1790398755.git.zihanx@nebusec.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

smb2_parse_contexts() validates the complete create-context area but
does not limit each record to its Next field before dispatching it.  A
malformed chain can therefore expose bytes beyond the current context to
a handler.  The QFid handler also used a full response-structure cast
although it only reads DiskFileId.

The SMB2/SMB3 lease parsers made the same layout assumption: they read
LeaseState and LeaseFlags at canonical offsets rather than at
DataOffset.  A valid non-canonical DataOffset could therefore yield
unrelated in-bounds data, while a short DataLength was still accepted.

Limit each context to its Next value, reject offsets before the context
header, and reject malformed chains.  Bound the name range by the current
context and do not dispatch a known handler when DataLength is zero.  Read
the QFid DiskFileId only when the context data covers that field.  Parse the
lease context from DataOffset and require DataLength to match the v1 or v2
lease_context size used by ksmbd.  A size mismatch skips lease parsing
without failing the open.

Fixes: b8c32dbb0deb ("CIFS: Request SMB2.1 leases")
Fixes: f047390a097e ("CIFS: Add create lease v2 context for SMB3")
Fixes: 89a5bfa350fa ("smb3: optimize open to not send query file internal info")
Cc: stable@vger.kernel.org
Reported-by: Vega <vega@nebusec.ai>
Assisted-by: LLM
Co-developed-by: Luxing Yin <root@tr0jan.top>
Signed-off-by: Luxing Yin <root@tr0jan.top>
Signed-off-by: Zihan Xi <zihanx@nebusec.ai>
---
changes in v5:
  - Rerolled the series after fixing a NULL dereference reported by the
    kernel test robot Smatch analysis in patch 5:
    https://lore.kernel.org/r/202609241449.HlHmnZFZ-lkp@intel.com/
  - v4 Link: https://lore.kernel.org/all/cover.1789478666.git.zihanx@nebusec.ai/
changes in v4:
  - Reject NameOffset and DataOffset values before the context header and
    use checked arithmetic for the name range.
  - Bound the name range by the current record and skip known-handler
    dispatch when DataLength is zero.
  - Parse lease data from DataOffset and require exact v1/v2 payload sizes.
  - Add the SMB3 lease v2 Fixes attribution for f047390a097e.
  - v3 Link: https://lore.kernel.org/all/cover.1788516372.git.zihanx@nebusec.ai/
changes in v3:
  - Split the POSIX handler check into a separate patch and corrected the
    parser Fixes history.
  - v2 Link: https://lore.kernel.org/all/cover.1787486936.git.zihanx@nebusec.ai/
changes in v2:
  - Bound each response context by Next and reject malformed chains.
  - Read QFid DiskFileId only when DataLength covers the payload.
  - Extend the SMB2 lease minimum through the LeaseFlags field.
  - Add a POSIX handler check for the three fixed fields.
  - v1 Link: https://lore.kernel.org/all/eb1bc35611f91bd10a4772400b37fac26f660956.1782579150.git.xizh2024@lzu.edu.cn/

---
 fs/smb/client/smb2ops.c | 28 ++++++++++++++++++--------
 fs/smb/client/smb2pdu.c | 44 +++++++++++++++++++++++++++++++----------
 2 files changed, 54 insertions(+), 18 deletions(-)

diff --git a/fs/smb/client/smb2ops.c b/fs/smb/client/smb2ops.c
index 192649fec25d5..749cee88fc38d 100644
--- a/fs/smb/client/smb2ops.c
+++ b/fs/smb/client/smb2ops.c
@@ -4437,25 +4437,37 @@ smb3_create_lease_buf(u8 *lease_key, u8 oplock, u8 *parent_lease_key, __le32 fla
 static __u8
 smb2_parse_lease_buf(void *buf, __u16 *epoch, char *lease_key)
 {
-	struct create_lease *lc = (struct create_lease *)buf;
+	struct create_context *cc = buf;
+	struct lease_context lc;
 
 	*epoch = 0; /* not used */
-	if (lc->lcontext.LeaseFlags & SMB2_LEASE_FLAG_BREAK_IN_PROGRESS_LE)
+	if (le32_to_cpu(cc->DataLength) != sizeof(lc))
+		return 0;
+
+	memcpy(&lc, (u8 *)cc + le16_to_cpu(cc->DataOffset), sizeof(lc));
+	if (lc.LeaseFlags & SMB2_LEASE_FLAG_BREAK_IN_PROGRESS_LE)
 		return SMB2_OPLOCK_LEVEL_NOCHANGE;
-	return le32_to_cpu(lc->lcontext.LeaseState);
+	return le32_to_cpu(lc.LeaseState);
 }
 
 static __u8
 smb3_parse_lease_buf(void *buf, __u16 *epoch, char *lease_key)
 {
-	struct create_lease_v2 *lc = (struct create_lease_v2 *)buf;
+	struct create_context *cc = buf;
+	struct lease_context_v2 lc;
+
+	if (le32_to_cpu(cc->DataLength) != sizeof(lc)) {
+		*epoch = 0;
+		return 0;
+	}
 
-	*epoch = le16_to_cpu(lc->lcontext.Epoch);
-	if (lc->lcontext.LeaseFlags & SMB2_LEASE_FLAG_BREAK_IN_PROGRESS_LE)
+	memcpy(&lc, (u8 *)cc + le16_to_cpu(cc->DataOffset), sizeof(lc));
+	*epoch = le16_to_cpu(lc.Epoch);
+	if (lc.LeaseFlags & SMB2_LEASE_FLAG_BREAK_IN_PROGRESS_LE)
 		return SMB2_OPLOCK_LEVEL_NOCHANGE;
 	if (lease_key)
-		memcpy(lease_key, &lc->lcontext.LeaseKey, SMB2_LEASE_KEY_SIZE);
-	return le32_to_cpu(lc->lcontext.LeaseState);
+		memcpy(lease_key, lc.LeaseKey, SMB2_LEASE_KEY_SIZE);
+	return le32_to_cpu(lc.LeaseState);
 }
 
 static unsigned int
diff --git a/fs/smb/client/smb2pdu.c b/fs/smb/client/smb2pdu.c
index 4ce165e40657f..7a6627400ba30 100644
--- a/fs/smb/client/smb2pdu.c
+++ b/fs/smb/client/smb2pdu.c
@@ -2378,11 +2378,17 @@ create_reconnect_durable_buf(struct cifs_fid *fid)
 static void
 parse_query_id_ctxt(struct create_context *cc, struct smb2_file_all_info *buf)
 {
-	struct create_disk_id_rsp *pdisk_id = (struct create_disk_id_rsp *)cc;
+	u16 doff = le16_to_cpu(cc->DataOffset);
+	u32 dlen = le32_to_cpu(cc->DataLength);
+	u8 *beg;
 
-	cifs_dbg(FYI, "parse query id context 0x%llx 0x%llx\n",
-		pdisk_id->DiskFileId, pdisk_id->VolumeId);
-	buf->IndexNumber = pdisk_id->DiskFileId;
+	if (dlen < sizeof(__le64))
+		return;
+
+	beg = (u8 *)cc + doff;
+	memcpy(&buf->IndexNumber, beg, sizeof(__le64));
+	cifs_dbg(FYI, "parse query id context 0x%llx\n",
+		 le64_to_cpu(buf->IndexNumber));
 }
 
 static void
@@ -2430,6 +2436,7 @@ int smb2_parse_contexts(struct TCP_Server_Info *server,
 	struct smb2_create_rsp *rsp = rsp_iov->iov_base;
 	struct create_context *cc;
 	size_t rem, off, len;
+	size_t cc_len;
 	size_t doff, dlen;
 	size_t noff, nlen;
 	char *name;
@@ -2452,29 +2459,41 @@ int smb2_parse_contexts(struct TCP_Server_Info *server,
 		buf->IndexNumber = 0;
 
 	while (rem >= sizeof(*cc)) {
+		off = le32_to_cpu(cc->Next);
+		if (off) {
+			if ((off & 0x7) || off >= rem || off < sizeof(*cc))
+				return -EINVAL;
+			cc_len = off;
+		} else {
+			cc_len = rem;
+		}
+
 		doff = le16_to_cpu(cc->DataOffset);
 		dlen = le32_to_cpu(cc->DataLength);
-		if (check_add_overflow(doff, dlen, &len) || len > rem)
+		if (doff < sizeof(*cc) ||
+		    check_add_overflow(doff, dlen, &len) || len > cc_len)
 			return -EINVAL;
 
 		noff = le16_to_cpu(cc->NameOffset);
 		nlen = le16_to_cpu(cc->NameLength);
-		if (noff + nlen > doff)
+		if (noff < sizeof(*cc) ||
+		    check_add_overflow(noff, nlen, &len) || len > cc_len ||
+		    (dlen && len > doff))
 			return -EINVAL;
 
 		name = (char *)cc + noff;
 		switch (nlen) {
 		case 4:
-			if (!strncmp(name, SMB2_CREATE_REQUEST_LEASE, 4)) {
+			if (dlen && !strncmp(name, SMB2_CREATE_REQUEST_LEASE, 4)) {
 				*oplock = server->ops->parse_lease_buf(cc, epoch,
 								       lease_key);
-			} else if (buf &&
+			} else if (dlen && buf &&
 				   !strncmp(name, SMB2_CREATE_QUERY_ON_DISK_ID, 4)) {
 				parse_query_id_ctxt(cc, buf);
 			}
 			break;
 		case 16:
-			if (posix && !memcmp(name, smb3_create_tag_posix, 16))
+			if (dlen && posix && !memcmp(name, smb3_create_tag_posix, 16))
 				parse_posix_ctxt(cc, buf, posix);
 			break;
 		default:
@@ -2486,13 +2505,18 @@ int smb2_parse_contexts(struct TCP_Server_Info *server,
 		}
 
 		off = le32_to_cpu(cc->Next);
-		if (!off)
+		if (!off) {
+			rem = 0;
 			break;
+		}
 		if (check_sub_overflow(rem, off, &rem))
 			return -EINVAL;
 		cc = (struct create_context *)((u8 *)cc + off);
 	}
 
+	if (rem)
+		return -EINVAL;
+
 	if (rsp->OplockLevel != SMB2_OPLOCK_LEVEL_LEASE)
 		*oplock = rsp->OplockLevel;
 
-- 
2.43.0

