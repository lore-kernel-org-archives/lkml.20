Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794436010;
	b=33EokKpmVhRkiWB4DuQVzxlgnsdzi9hzrjP4sBETpCT642Y/E4x/gaRpwLGVSvHYXVky
	 ybB4mk5XkqhHRsC7T4actM2v023CR+zVqCnQFxoFJIp2mzT7j9II6p/5sGVJyLQenluYW
	 h5m9HSAT+2iiRYRFv2XezrB1NkpSxbqAUCEaBYxK9qOV80bljAwEwGRngZQ0AxrhfCL+u
	 dOXjiXNv873FIKpx9MiNOlMUgGNkE4Ea6/nUWTxgJugSIDTUmFnjp0MbrNBGS3Zde5Lij
	 ClRCt60TjJqU6dFCRtaeDd2DGsTBZ7++JftoVEQfwq0p+951KpBVyHZOhdbH8+iZzmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794436010;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ga7jzUYmGDL77fNJVq4eVL8ok2xCIWbQIcFmq+e+3Uk=;
	b=hRehdMcyJVs+UWNRJN3fQcVYbJOREIMsgilEnEcn4q9ouVvLfNu78pK3YkVrL5F3WPB2
	 1uHICfhLNAyeJs3FZZx/s/K0ZNUVK1XeROtfyKEz0O0ZeBZNrqHz8pfLa6W04DKFUelQX
	 oNrNYjwDMT9lzrRRnU8sEZUC6SzWASCkgmu8Y+uojAVs5m0TsmwIUe/RT3Iib7Ny4+4X4
	 TQCEFRWNiLKBDjiiE4RBd7x+/PKVf9O8T5aNSvQWH40+CtvrIZUn7r4DV0Y2hMMRfQ6O3
	 SxGhzxdAg5yjhtIoWRLkAkqG6kIKLPpfXWBAgBmddzgrzE8xjQuv/63UCcSWcG2LOHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bywUqgPe;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC5A606A327
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:26:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBC5A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bywUqgPe
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so36689545e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794436008; x=1795040808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ga7jzUYmGDL77fNJVq4eVL8ok2xCIWbQIcFmq+e+3Uk=;
        b=bywUqgPejZ8cEXqsOHexBd+3E7SGspGOsYd22CFk2rtk+C/DQDZhxK3obhUp9ZXIyd
         hHYgXckMvEeSdS7s0EvVOOQObe33dIA1inOgEGP78GhpWETBG9gNmyNqXKx7kjnKHMAy
         b2Tz1/AFs90lFd0zfJ7t6Ymd4n37pJEkM26gx+irGgH8iTwNOaZPB04XgZnvW+Z6C1g7
         XQVzhdu8CgVXUMleJwAJ8YGZ3kPv2vY/i/c601BR+pw/xwIbYcQDgTcxMXPDBp40pZDr
         zNJsxTcDTBJzhrJ+BtjQrJWvN09SXwiueeVLakL4bkR6Sk3teIrwzMk7BOKUn7PcLQhu
         V08g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794436008; x=1795040808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ga7jzUYmGDL77fNJVq4eVL8ok2xCIWbQIcFmq+e+3Uk=;
        b=m2fSxSb8L8M3fnr8YHtvmZLQQIiwqk+XG1p/5X5p4JCfTTDRMq0poYz23xo1UTGTRf
         /oWUcByy4rKS0T/Xv4rc1/Ldm+9s0HezugmZ+/V5YvmKAYmuwEgFDbAM8sBEoda2o5OE
         RZXYz6XBvf9KHbrkdZ1UZNqG63GYjZ0warfcsKeX6aa0HsfEtnhOrYEQZaLpIOXdofbY
         qjRBJkSNhyVw+s8GyOhw4NqsHKoevvO+I4UrUd/FBadXvxzJ2kNoFkigCP1VopwIMoUm
         8kvvBVKGnwQE+XbyNAjEkhDZFx55Teugiq8hX45gHkYIOG0pXEPnSPU60fEXd6IeuOd1
         KM1g==
X-Forwarded-Encrypted: i=1; AL+hErFNn/L7U9rx2wgiNpIfr1kRhCWMBd7fxMRArkaNQy9Io795COHv0rOIzM8F588k4s2HY3qlbatd2+nG2C4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9o8kd0wqpB/q4RYwqcW0gZV5KYUMc4iLjaTH0slPYgBb1Zfdlx
	M3TqayqXDJO81vDChzmcSJbb8T3UVRHXjpRT3ERruW4ADbVCuUbNzBo9
X-Gm-Gg: AYBFou3CLQWFXUT2UGZBtG5hdri40aeRprvFZqDc1RNo+iplDxQCV1KyS42Bm8fmk/W
	iwfsCYmS/T23Fvr5G/VY2EdwwmrxL9DVTY3e+ARx4wWD96Rt4/hmTpd8gAiVaBpyrCVhc1fQSbs
	sTaWBHYQCa2CHQ4G5ROLLNNGtaa8piEt589cSvuzc6E67PNtVZv61DwlJ1qsXmtjzF+CGSVBSR5
	+nJBU6BzP+wVkPHHM/fKGkQ3zjClkCsrJqGAA//HteP/ra28h+2n/EmeupMs9IFhJm8szmk2DZP
	sSO82KkkyYJ4XLQ1tCNfICDQbId+hJVw/0k4EIcqIDhg3U0iQ5TTGenlIoVvbordaYCIX+/CfCi
	/z1+RJ0YGoVUsg9mdu+Tzfp1gNu4bRZFiiA8Y+90MZSfigo406CpSKBnRZVtXK6CXnadqisYBev
	m8Gc8z/sKgvh63aIHVaXBhvb6q8KNwmTNDH0Nxy3xGhoZiSTjFjQ6conwvhYMWP5EgNI9t7WV15
	tsv6pY1rJjaYF8trwz09mgigJQHWrCCMegQq7uxcawYEoJLaA52Gg8R8bv1zT8reWN1vGjw8fXB
	CaCKvgBy1pvvSjmlEVhUfo+JIg==
X-Received: by 2002:a05:600c:4f84:b0:4a1:e92b:ae4a with SMTP id 5b1f17b1804b1-4ba093b9a3cmr64193365e9.21.1794436007944;
        Wed, 11 Nov 2026 14:26:47 -0800 (PST)
Received: from infinity ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e251491sm20204945e9.2.2026.11.11.14.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:26:47 -0800 (PST)
From: koraynilay <koray.fra@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Tom Talpey <tom@talpey.com>,
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
	Hyunchul Lee <hyc.lee@gmail.com>,
	Ronnie Sahlberg <lsahlber@redhat.com>,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	koraynilay <koray.fra@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] ksmbd: fix timestamp corruption on special values
Date: Wed, 11 Nov 2026 23:25:34 +0100
Message-ID: <20261111222534.839117-1-koray.fra@gmail.com>
X-Mailer: git-send-email 2.56.0
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

When a timestamp is being sent with "-1" or "-2" as its value because it
should be ignored, as specified in MS-FSCC 2.4.7 FileBasicInformation,
ksmbd would clobber it in both the xattr and on-disk value by setting it
to -1.

simple reproducer:

echo test > file.txt
smbclient //127.0.0.1/test -U user%pass -c "put file.txt repro.txt"
smbclient //127.0.0.1/test -U user%pass -c "allinfo repro.txt"
smbclient //127.0.0.1/test -U user%pass -c "setmode repro.txt +h"
stat repro.txt # the actual file on disk behind smb
smbclient //127.0.0.1/test -U user%pass -c "allinfo repro.txt"

which would show, respectively:

altname: REPRO~MQ.TXT
create_time:    Wed Nov 11 21:23:16 2026 UTC
access_time:    Wed Nov 11 21:23:16 2026 UTC
write_time:     Wed Nov 11 21:23:16 2026 UTC
change_time:    Wed Nov 11 21:23:16 2026 UTC
attributes: A (20)

  File: /tmp/repro.txt
[...]
Access: 1601-01-01 00:00:00.000000000 +0000
Modify: 2026-11-11 21:58:10.145349236 +0000
Change: 2026-11-11 21:58:10.206350216 +0000
 Birth: 2026-11-11 21:58:10.144349220 +0000

altname: REPRO~MQ.TXT
create_time:    Wed Dec 31 23:59:59 1969 UTC
access_time:    Mon Jan  1 00:00:04 1601 UTC
write_time:     Wed Nov 11 21:23:16 2026 UTC
change_time:    Wed Nov 11 21:23:16 2026 UTC
attributes: HA (22)

This patch also makes the smb2.timestamps.freeze-thaw test from
smbtorture pass.

Cc: stable@vger.kernel.org
Fixes: e2f34481b24d ("cifsd: add server-side procedures for SMB3")
Link: https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-fscc/16023025-8a78-492f-8b96-c873b042ac50
Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.5.3
Signed-off-by: koraynilay <koray.fra@gmail.com>
---
Another small-ish fix I found while implementing ptime[1].
(And probably won't be the last one :c)

Thanks.

[1]: https://lore.kernel.org/all/20261101015551.786044-1-koray.fra@gmail.com/T/#t

 fs/smb/server/smb2pdu.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/fs/smb/server/smb2pdu.c b/fs/smb/server/smb2pdu.c
index 92843d2944e4..5b046f10e2ce 100644
--- a/fs/smb/server/smb2pdu.c
+++ b/fs/smb/server/smb2pdu.c
@@ -8867,6 +8867,7 @@ static int set_file_basic_info(struct ksmbd_file *fp,
 	const struct mnt_idmap *idmap;
 	__le32 attrs_mask = FILE_ATTRIBUTE_DIRECTORY_LE |
 		FILE_ATTRIBUTE_COMPRESSED_LE;
+	s64 crtime, time;
 	int rc = 0;
 
 	if (!(fp->daccess & FILE_WRITE_ATTRIBUTES_LE))
@@ -8882,21 +8883,25 @@ static int set_file_basic_info(struct ksmbd_file *fp,
 	    (file_info->Attributes & FILE_ATTRIBUTE_TEMPORARY_LE))
 		return -EINVAL;
 
-	if (file_info->CreationTime)
-		fp->create_time = le64_to_cpu(file_info->CreationTime);
+	crtime = (s64)le64_to_cpu(file_info->CreationTime);
+	if (crtime > 0)
+		fp->create_time = crtime;
 
-	if (file_info->LastAccessTime) {
+	time = (s64)le64_to_cpu(file_info->LastAccessTime);
+	if (time > 0) {
 		attrs.ia_atime = ksmbd_NTtimeToUnix(file_info->LastAccessTime);
 		attrs.ia_valid |= (ATTR_ATIME | ATTR_ATIME_SET);
 	}
 
-	if (file_info->ChangeTime) {
-		fp->change_time = le64_to_cpu(file_info->ChangeTime);
+	time = (s64)le64_to_cpu(file_info->ChangeTime);
+	if (time > 0) {
+		fp->change_time = time;
 		inode_set_ctime_to_ts(inode,
 				ksmbd_NTtimeToUnix(file_info->ChangeTime));
 	}
 
-	if (file_info->LastWriteTime) {
+	time = (s64)le64_to_cpu(file_info->LastWriteTime);
+	if (time > 0) {
 		attrs.ia_mtime = ksmbd_NTtimeToUnix(file_info->LastWriteTime);
 		attrs.ia_valid |= (ATTR_MTIME | ATTR_MTIME_SET | ATTR_CTIME);
 	}
@@ -8915,7 +8920,7 @@ static int set_file_basic_info(struct ksmbd_file *fp,
 	}
 
 	if (test_share_config_flag(share, KSMBD_SHARE_FLAG_STORE_DOS_ATTRS) &&
-	    (file_info->CreationTime || file_info->Attributes)) {
+	    (crtime > 0 || file_info->Attributes)) {
 		struct xattr_dos_attrib da = {0};
 
 		da.version = 4;

base-commit: ffde0bdfc69a0f01a081d9c1a213e63d5719e625
-- 
2.56.0

