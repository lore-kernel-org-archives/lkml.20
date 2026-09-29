Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865F44EE84F
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790673508; cv=none; b=kzriu3Xn3ydU1E6RS/eAK1dMDallQf7h10g9gALgDc/lcOe3rzt1/8iCJ2qFZkRyi/WAInyLtX+F4VYUyM5iFxPYEwrV2FSKOQtzL7f09P1HG44eenFiOIe5qHIV705YIr5+FVWGsmu4WV2K3MGRh885nvIQnWscNPsJqAxa6BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790673508; c=relaxed/simple;
	bh=TFS0KzSBTe+S2D+lLJyxokiAq25/7TBHzphsYGycxAs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rjr4zbC/MpYWtIIp6CKiHqFKWVRiJr2pExD+ylP05sh0JFUSBoT3Jp6I0mM64nCsYMYShBTzhGM7ii0hZZjcdaFggi0oGmVILBWNQiyrjdzMMNtTccnYO1Z2ymVhWZCEqX+KNt/zUXOAshcxO8JLBnPshCn7mO1TILMEo8rBQ3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io; spf=pass smtp.mailfrom=bynar.io; dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b=WwfWrdsd; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bynar.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b="WwfWrdsd"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48884b0219bso1880494f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bynar.io; s=google; t=1790673495; x=1791278295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m3AWyU/VDrri+MrqCxkbSv5Eh7dGQEH+AnIW5hjUsVA=;
        b=WwfWrdsdv/fv+p43Vcbs4zUCligH+2eOAbX19mg+Pj1NccqlVH2fXeSFeNaa5q4yk1
         bUTmxC3ehV+fv4eB1ZHYyKia8aHcdNo3ve4UJlUM4ZDMQZuz6mG9Gh5uqVrDUMNMKPrT
         UnpYIgRjH0g24YWP7a0r4Nz2rV51T4khp645jIOctXRCAMo7I36mVM5htNq5Az4/l4K+
         D+XaA2J3OsJvebhfmnDKf8qcXmo6tNumyfxInUJStfYK0uMIT2s/1iEeEO2BxTyxkxxO
         J1NINDtZ3iogyPIV+yQa8VS1Yn5xywNaYLnF4cBDtJigTD2VXrhVSYeLnPi2h+R2b+qD
         L9sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790673495; x=1791278295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m3AWyU/VDrri+MrqCxkbSv5Eh7dGQEH+AnIW5hjUsVA=;
        b=J75Gmm9ouzhA1XDcmeP20zhFMSp6KV5V7VAN9sG/iROKO8fN7L1D1h7w4dMH4XGCvs
         SDUrGS3c/GlyTDMXOV5VnTF9sY+1mNfdKKH8vY1MQs2fVVTWFzuaJ4qcp0cm4ZVNHhZb
         BtsEpQ3V9V2x8OfaC0FxCkU1ptgQrcpv4W4fSkq5DXLJVwq894s9f+o7nabO/zrp9H4P
         TW//SyOrqWNvjfAZml3jXsdG2Y1T7DtIGX8TQZJ2qgBtGUFUepSnJvzo9cV8jAlZIAcF
         eFiQzoTCEYJuF1P2FoBJ1bTzQrdMqaT94INJRQoBtaAKmyH/zZvQuBqFFWZrLZScy5ue
         nFxw==
X-Forwarded-Encrypted: i=1; AKwUvBz5XPgVFYUAo3eTD+IbX5Ta2bsO8r7iYphZtwqJs6BmU+cdN93IBWWqaV7dEbrK9DOqg0cuBHxJiQKqabw=@vger.kernel.org
X-Gm-Message-State: AFuF++nf2ugleY3xUmDhnm7liW02Hggqb/4vS5pHBEuAzCJb00Nb4fVf
	EUvrJ9ulU3ib2akKvtLdALSFrXrhYE1E5bveaWozJ1ZQF21lUTVPPv6JncBqpmOfwK1e
X-Gm-Gg: AYBFou1jTIDcMBqX7Jnsr9oOGfHwuiKoSdSIrqdVmtk61sbp0j3/zTdaEgYp+rI8Mhr
	z/EW1gllPfBbvfDoO29B3/xYhNPDSKrjxUL69OghprxJ/teR2N2JgH/xzb4FIVfYmgzxc2bzoVJ
	ik9Ddxee4ERRyaiaVrJJhOrGWXTcUJRze0yyP0wQzt8TXY00mMkzY/8lSQEnzWsTNJfMePeZh/R
	A11jJs9o5P8Dgd+f5DMhFZP9V2j2Dxq4hVdgEUQv80zfYZdWdPig0vtijZq7vv+0U3m1MYblzt0
	rTSw8ASDGraUH9qaSjW9wvjEAarcTB88ECFGgU25pAvfjoLP48Pm/hsx+VCfywbYE8QJK/6GOx8
	vNIEkplJB+XTdtBWQxohAWfyd9IXxNO+KplDF00Bp6+X9gYM5PuXQwsQa+UGKbqbMqSq2Lm8BWD
	g4+La0wy7TicAksP2Q71E23pCyLILH0gJwszVUAR27RwyYsMXhZLFBeNXyvjdByGKjQhSJGZzUs
	vyiOqXIfWQzCqQuUN5cV0Uq5zI=
X-Received: by 2002:a05:600c:a012:b0:49f:ce73:7ac with SMTP id 5b1f17b1804b1-49ff06fc82emr203552445e9.35.1790673494401;
        Tue, 29 Sep 2026 02:18:14 -0700 (PDT)
Received: from debian12.ucl.ac.uk (eduroam-int-pat-8-79.ucl.ac.uk. [144.82.8.79])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af51c57a0sm2155723f8f.15.2026.09.29.02.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:18:14 -0700 (PDT)
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
Subject: [PATCH 5/7] smb: client: reject FIND data areas that run past the received response
Date: Tue, 29 Sep 2026 10:16:34 +0100
Message-Id: <20260929091636.2618227-6-diego@bynar.io>
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

CIFSFindFirst() and CIFSFindNext() take the directory entries of a
TRANS2_FIND_FIRST2 or TRANS2_FIND_NEXT2 response from DataOffset for
DataCount bytes. validate_t2() bounds DataOffset at 1024 and
ParameterCount + DataCount by the byte count, and nothing compares
DataOffset + DataCount with the number of bytes SendReceive() copied
into the buffer.

smb_init() places the request and the response in the same
cifs_request allocation and cifs_buf_get() clears only the start of
it, so a short response whose data area extends past its end has
srch_entries_start point at bytes of the request that was just sent,
or at whatever the allocation held before, and those bytes are parsed
as directory entries. cifs_readdir() and find_cifs_entry() walk the
entries with nxt_dir_entry(), which checks every entry but the first
of a response against the end of the SMB; cifs_query_path_info() and
cifs_backup_query_path_info() read the first entry with no check at
all. Those reads stay inside the allocation, but what they return is
not part of the response. The last entry, which LastNameOffset locates
relative to the data area, is bounded against the received response
by an earlier patch of this series, as is every entry that
cifs_fill_dirent() parses; the walk itself and the two query functions
are not.

SMB1 is not negotiated by default; reaching this code requires an
explicit vers=1.0 mount.

Reject a response whose data area extends past the received length,
with the -EINVAL that validate_t2() returns for the other malformed
transaction responses. cifs_query_path_info() and
cifs_backup_query_path_info() still read a whole entry from a data
area that may be smaller than one; that is not changed here.

A conforming server is not affected. The data block of a transaction
response is part of the SMB, so DataOffset + DataCount cannot exceed
the smbCalcSize() bytes that SendReceive() copies; coalesce_t2()
appends each secondary response to the data area and adds its length
to both DataCount and the byte count, which keeps that relation.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: <stable@vger.kernel.org>
Assisted-by: Bynario AI
Signed-off-by: Diego Oliva <diego@bynar.io>
---
 fs/smb/client/cifssmb.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/fs/smb/client/cifssmb.c b/fs/smb/client/cifssmb.c
index 7eb83dd737fc..107ca76e53d1 100644
--- a/fs/smb/client/cifssmb.c
+++ b/fs/smb/client/cifssmb.c
@@ -4412,6 +4412,7 @@ CIFSFindFirst(const unsigned int xid, struct cifs_tcon *tcon,
 	TRANSACTION2_FFIRST_RSP *pSMBr = NULL;
 	T2_FFIRST_RSP_PARMS *parms;
 	struct nls_table *nls_codepage;
+	unsigned int data_off, data_count;
 	unsigned int in_len, lnoff;
 	__u16 params, byte_count;
 	int bytes_returned = 0;
@@ -4530,11 +4531,19 @@ CIFSFindFirst(const unsigned int xid, struct cifs_tcon *tcon,
 		return rc;
 	}
 
+	data_off = le16_to_cpu(pSMBr->t2.DataOffset);
+	data_count = le16_to_cpu(pSMBr->t2.DataCount);
+	if (data_off + data_count > (unsigned int)bytes_returned) {
+		cifs_dbg(VFS, "%s: data area offset %u count %u past response length %d\n",
+			 __func__, data_off, data_count, bytes_returned);
+		cifs_buf_release(pSMB);
+		return -EINVAL;
+	}
+
 	psrch_inf->unicode = !!(pSMBr->hdr.Flags2 & SMBFLG2_UNICODE);
 	psrch_inf->ntwrk_buf_start = (char *)pSMBr;
 	psrch_inf->smallBuf = false;
-	psrch_inf->srch_entries_start = (char *)&pSMBr->hdr.Protocol +
-		le16_to_cpu(pSMBr->t2.DataOffset);
+	psrch_inf->srch_entries_start = (char *)&pSMBr->hdr.Protocol + data_off;
 
 	parms = (T2_FFIRST_RSP_PARMS *)((char *)&pSMBr->hdr.Protocol +
 					le16_to_cpu(pSMBr->t2.ParameterOffset));
@@ -4568,6 +4577,7 @@ int CIFSFindNext(const unsigned int xid, struct cifs_tcon *tcon,
 	TRANSACTION2_FNEXT_REQ *pSMB = NULL;
 	TRANSACTION2_FNEXT_RSP *pSMBr = NULL;
 	T2_FNEXT_RSP_PARMS *parms;
+	unsigned int data_off, data_count;
 	unsigned int name_len, in_len;
 	unsigned int lnoff;
 	__u16 params, byte_count;
@@ -4650,13 +4660,22 @@ int CIFSFindNext(const unsigned int xid, struct cifs_tcon *tcon,
 		cifs_buf_release(pSMB);
 		return rc;
 	}
+
+	data_off = le16_to_cpu(pSMBr->t2.DataOffset);
+	data_count = le16_to_cpu(pSMBr->t2.DataCount);
+	if (data_off + data_count > (unsigned int)bytes_returned) {
+		cifs_dbg(VFS, "%s: data area offset %u count %u past response length %d\n",
+			 __func__, data_off, data_count, bytes_returned);
+		cifs_buf_release(pSMB);
+		return -EINVAL;
+	}
+
 	/* BB fixme add lock for file (srch_info) struct here */
 	psrch_inf->unicode = !!(pSMBr->hdr.Flags2 & SMBFLG2_UNICODE);
 	response_data = (char *)&pSMBr->hdr.Protocol +
 		le16_to_cpu(pSMBr->t2.ParameterOffset);
 	parms = (T2_FNEXT_RSP_PARMS *)response_data;
-	response_data = (char *)&pSMBr->hdr.Protocol +
-		le16_to_cpu(pSMBr->t2.DataOffset);
+	response_data = (char *)&pSMBr->hdr.Protocol + data_off;
 
 	if (psrch_inf->smallBuf)
 		cifs_small_buf_release(psrch_inf->ntwrk_buf_start);
-- 
2.39.5

