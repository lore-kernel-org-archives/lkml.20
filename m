Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4773F4DD3B1
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 15:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791473169; cv=none; b=nD3L1eWzt+/tdwgWevjefcwwO2HvGysBkHxGpyn9/qMc81efK6d8H/OgPIrXWDUelTIkZNww/B+3She7IZ7evz856eIbpK6hD0LSnItE3FGL2clrs8pn1U67zpaIy+Og5JjXozFo7LpkkTN4Vx2ofMM4Lf/0mvgT0WwxL9QCNAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791473169; c=relaxed/simple;
	bh=SJ9KJpodhwEYTk19NTjove+q80LlRP2MkrvZiq9WY4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=axgR+tHjEchDqslKamlVQwz4O7pDrEp7rf/V0VMPd7CIWor2gUOesGqAT4Li8j4qE93ZJ2+ZVjykmZnL57d+IfpsWLvHVZawtCKDsf/mLOUU4I/ePhE2zQfRGGfkF6iNV1EoCMtKVWolLUykASjPF3UWEco/gLM08o4kHtxK+tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OittZr9n; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OittZr9n"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cd1da64fe53so66373a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 08:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791473160; x=1792077960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6vUlfKA23oQppqoRycgB2o9KkYLVdkjzS/q54uEzSfY=;
        b=OittZr9nShm/8m17ed2N2njJckSkke6793j1iIErq2OMbRQ9FB9xTNmh8kHBIMGBkL
         iYVkcztqbtS8LN6u47qY84ZmwAluun4wc2xpxW1QOWWXqdb1GL9qVJKH1LZFeyewDmLS
         ttvfv8qEVQe/DXHC7Z80Vn6f1n6dtVwyMLpfqwnJuSX29CzVGaVjWEzODZ1CaWPzY1xG
         DziMDDINLXcHrqWRGpIclXDu5df2YiQn4AkNZ9nhuGuBZYyaHhRTU1WBPPejxIa5Ip6m
         5itgqC83JbqgiS9EQxKAcTpZ1pHWbxzIrVvMCMdCbBuM/Y9pM57LcOvvmjc3ypEopnEe
         itpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791473160; x=1792077960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6vUlfKA23oQppqoRycgB2o9KkYLVdkjzS/q54uEzSfY=;
        b=aSJ5cIQzpVU9iopkUkG4aUih6/Jm4kuNn+P7RdVN+bh6nyci7vmsSg595rZToBa3gh
         cF3HFu7/MdhmorzDVyd/g/S0B0mJXvzK/pr+Rx9PMUcG++k1ucSXwG3dPBRsrAOTV+k6
         Nynsbf7HiGCYSsrOHyuUqsuMYedKMzJt+Gq8SB7KQ5fzHWJ7wnJml+7FigoHKZESVsFN
         eUoDSMYAc6g6NQd4v1ivzHExHjdvSF0rssJM/P8PnqjCQG8E43McQ3AbHn60ZEUAPJ67
         klYC7dpl5XRznTBO3fOklHzUUV3ymby8EXsdLB8dZPIycY5EQjMCSqnji+Gje8aCfBF5
         esow==
X-Forwarded-Encrypted: i=1; AKwUvBzYo2SBkPaf5cTV5B6NiKYZP62TdoMqjkVbRVsfW77ER/2l/LwU6fbwRHWzBNEK8DQDff1qsAq9b1NBqmk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ966Eos43n3MMyv/C/cyW/gLxJvnJAasS0hEy/POFMRH4ZFpoB
	aDx72REu1P5EP2HQQrI9NwQFG8x/kFWi6nCWNmaSwFR9puE3nx3lHuHq
X-Gm-Gg: AYBFou0wRiT/S3OIL0gg73cKetN6bJP7LhpRGMAfTOUjwXcZrNCM2kT5RaAlKvfbJOW
	B4MXeYm/L+zzKe1Yq5J3khUYmmDdyFWZaVnytwoB1Yllnkdsp0ZrTyvsQ6g4L8QzYc92/wBUYey
	0Zet9Sq7UZYxKD6Zs70qqfeKPu7bSPp82C+WTdN23ez5d/u9p0QsGY8fRJ/w/vnu5AkAWr1y9n1
	gO/EQuTBJfa4XT25D9Svm1ocKH8FOjSR5n0IwYK7Ni7CdQKdsxgkzEoUEvCPY1Y1MqlK1RyTNPf
	ANl4WzyVA9bCFowv3ASPYH5/6Lf9V7bws6UtZ2c+UcTdnYd55MA/nr93BneMkF3IrdzYc6RfFCW
	qFKhDsaPygfmXJQVw5W4Q6C/5bH8WLLItsFMv7Lg63Tpn8R961JP+4qOSACJyznGmac8hiJUicW
	qEEgILDvw3oM+8a07eeF1B8bW6CoKPh3+BLVtRq/jsBqoADrooAuuEVl1XbvQ06ms=
X-Received: by 2002:a17:90b:4d84:b0:3a0:7d5b:8d3e with SMTP id 98e67ed59e1d1-3aa8f85f446mr4223589a91.1.1791473160361;
        Thu, 08 Oct 2026 08:26:00 -0700 (PDT)
Received: from ser8.. ([221.156.231.192])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1c17b63sm5554792a91.12.2026.10.08.08.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 08:25:59 -0700 (PDT)
From: DaeMyung Kang <charsyam@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Tom Talpey <tom@talpey.com>,
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	DaeMyung Kang <charsyam@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/3] ksmbd: use the existing xattr name for a named stream
Date: Fri,  9 Oct 2026 00:25:36 +0900
Message-ID: <20261008152537.4147299-3-charsyam@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008152537.4147299-1-charsyam@gmail.com>
References: <20261008152537.4147299-1-charsyam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SMB stream names are case-insensitive, but ksmbd stores each named
stream in an xattr whose name is case-sensitive. Opening an existing
stream finds its xattr with a case-insensitive match, yet the handle
keeps the name as the client spelled it, and every later operation that
needs an exact name uses that spelling:

 - a WRITE or an end-of-file change creates a second xattr, so a stream
   created as "Foo" and written through "foo" ends up stored twice, and
   which value a later lookup returns depends on xattr list order;
 - delete-on-close and delete-pending removal can fail with -ENODATA,
   or remove only a case-variant copy and leave the original;
 - the share mode check compares stream names with strcmp(), so two
   opens of the same stream that differ only in case do not conflict.

Have ksmbd_vfs_casexattr_len() copy the matching xattr's name into the
handle when the stream is opened, so later operations use the name
already on disk. The match must have the same length as the name it
replaces; the stream lookup passes a length that includes the
terminating NUL, which already guarantees that, and the check makes the
copy safe for any caller. A stream that does not exist yet keeps the
client's spelling, as before.

smb2_rename() compares and looks up fp->stream.name case-insensitively,
so it behaves the same with either spelling.

Fixes: e2f34481b24d ("cifsd: add server-side procedures for SMB3")
Cc: stable@vger.kernel.org
Signed-off-by: DaeMyung Kang <charsyam@gmail.com>
---
 fs/smb/server/smb2pdu.c | 8 ++++----
 fs/smb/server/vfs.c     | 9 +++++++--
 fs/smb/server/vfs.h     | 2 +-
 3 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/fs/smb/server/smb2pdu.c b/fs/smb/server/smb2pdu.c
index 12a43efdb..4d43de74f 100644
--- a/fs/smb/server/smb2pdu.c
+++ b/fs/smb/server/smb2pdu.c
@@ -3341,7 +3341,7 @@ static int smb2_set_ea(struct smb2_ea_info *eabuf, unsigned int buf_len,
 						     path->dentry,
 						     attr_name,
 						     XATTR_USER_PREFIX_LEN +
-						     eabuf->EaNameLength);
+						     eabuf->EaNameLength, NULL);
 
 			/* delete the EA only when it exits */
 			if (rc > 0) {
@@ -3413,11 +3413,11 @@ static noinline int smb2_set_stream_name_xattr(const struct path *path,
 	fp->stream.name = xattr_stream_name;
 	fp->stream.size = xattr_stream_size;
 
-	/* Check if there is stream prefix in xattr space */
+	/* Keep the existing xattr's case for subsequent writes and removal. */
 	rc = ksmbd_vfs_casexattr_len(idmap,
 				     path->dentry,
 				     xattr_stream_name,
-				     xattr_stream_size);
+				     xattr_stream_size, xattr_stream_name);
 	if (rc >= 0)
 		return 0;
 
@@ -3469,7 +3469,7 @@ static loff_t ksmbd_stream_eof(struct ksmbd_file *fp)
 	ssize_t slen = ksmbd_vfs_casexattr_len(file_mnt_idmap(fp->filp),
 					       fp->filp->f_path.dentry,
 					       fp->stream.name,
-					       fp->stream.size);
+					       fp->stream.size, NULL);
 	return slen < 0 ? 0 : (loff_t)slen;
 }
 
diff --git a/fs/smb/server/vfs.c b/fs/smb/server/vfs.c
index ae9f9a693..7020b7de3 100644
--- a/fs/smb/server/vfs.c
+++ b/fs/smb/server/vfs.c
@@ -1946,7 +1946,7 @@ int ksmbd_vfs_fill_dentry_attrs(struct ksmbd_work *work,
 
 ssize_t ksmbd_vfs_casexattr_len(struct mnt_idmap *idmap,
 				struct dentry *dentry, char *attr_name,
-				int attr_name_len)
+				int attr_name_len, char *actual_name)
 {
 	char *name, *xattr_list = NULL;
 	ssize_t value_len = -ENOENT, xattr_list_len;
@@ -1960,8 +1960,13 @@ ssize_t ksmbd_vfs_casexattr_len(struct mnt_idmap *idmap,
 		ksmbd_debug(VFS, "%s, len %zd\n", name, strlen(name));
 		if (strncasecmp(attr_name, name, attr_name_len))
 			continue;
+		if (actual_name && strlen(name) + 1 != attr_name_len)
+			continue;
 
 		value_len = ksmbd_vfs_xattr_len(idmap, dentry, name);
+		/* The caller provides attr_name_len bytes for the actual name. */
+		if (value_len >= 0 && actual_name)
+			memcpy(actual_name, name, attr_name_len);
 		break;
 	}
 
@@ -2116,7 +2121,7 @@ int ksmbd_vfs_copy_file_ranges(struct ksmbd_work *work,
 		src_file_size = ksmbd_vfs_casexattr_len(
 				file_mnt_idmap(src_fp->filp),
 				src_fp->filp->f_path.dentry,
-				src_fp->stream.name, src_fp->stream.size);
+				src_fp->stream.name, src_fp->stream.size, NULL);
 		revert_creds(saved_cred);
 		if (src_file_size < 0)
 			return src_file_size;
diff --git a/fs/smb/server/vfs.h b/fs/smb/server/vfs.h
index ef3ab3f18..dedb10331 100644
--- a/fs/smb/server/vfs.h
+++ b/fs/smb/server/vfs.h
@@ -116,7 +116,7 @@ ssize_t ksmbd_vfs_getcasexattr(struct mnt_idmap *idmap,
 			       int attr_name_len, char **attr_value);
 ssize_t ksmbd_vfs_casexattr_len(struct mnt_idmap *idmap,
 				struct dentry *dentry, char *attr_name,
-				int attr_name_len);
+				int attr_name_len, char *actual_name);
 int ksmbd_vfs_setxattr(struct mnt_idmap *idmap,
 		       const struct path *path, const char *attr_name,
 		       void *attr_value, size_t attr_size, int flags,
-- 
2.43.0

