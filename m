Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6693B71DA
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 01:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790214750; cv=none; b=c3d3g6Wf/6w28ICP+sDrenfk6UDAIhdazlBYz+Uosgj3zXtQ7+wmhq9IVs70pv5LE5jrDlXDzn41MBf952rGjsblmkzviBpTZrl+Nh86QRxO8U8kgHLJGiMls1wSfuBBAL/dL+63Ib1/9e2GzjkO1Lcog0cUNgQioUiJqEOBKzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790214750; c=relaxed/simple;
	bh=GeDgxcAAxWRswXI0bO4TJ+ASumLxQqwI+egxlfWdMac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LCgUxU6vVXNgvTeaAx+4y1nSbzkrWPCVxsVkblVkLYPwln9PqiOotBN11IfioVA4saPwW+UXgIUxHHuIYopzJ9IJHt16mZGZ7mz5YOlFezchZrvab5K8m7ElbXW2UFMbVbv9T8m10+bloh3XmvILWgqN6MEs5CXEoa6JQnoX0jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pxu3Mhcr; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pxu3Mhcr"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-4678d3e490bso335120fac.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 18:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790214748; x=1790819548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1cN5CmufZWfppAn2JUAeeUtUy9gg/Lw5nvjqwMTeguM=;
        b=Pxu3MhcrFOM4FmLBFLHQZzDwsZ06cznT9HutdU9PpyBIwURqu3QlQ6Jzm1j+A6BdtD
         cUTwkabchRec+PVymZLVnadUCQ0mgIQ9TQf7DNxyWDOxgK9w+5rfK5c0QtKbmUjIpsmi
         YLRFYbD8U5AUPrH2qY9hyeYceZpPHJFFZAvzuMaKs+b8BlWDfHqDIFuXM9vUS1dxLZKy
         yMwUZLmexyT+bugSNyOn28nQ2xkUjFpn6ZMMwvD3eNgt5daHYgW3YTOmr0/s0N9My/lE
         vwElVgbLBSohXULeCzh/qY3z11kNUzyKSeSO6Y/OL3hD2fjixANr5GDMPvizte/Pmqyw
         mQ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790214748; x=1790819548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1cN5CmufZWfppAn2JUAeeUtUy9gg/Lw5nvjqwMTeguM=;
        b=Kne0XRGc/l3WcZUV8fLfsjrp8vzOaiHd6gHZQmrfIyZeXWUAjm+iaFjVv3E0d4k6AZ
         PTsqAbOaKRS+EwUpRojJm/cimBL4+ZuH6/pewTJ6207ZNPd1RgIOJ1yqfDk16JY76JBh
         m8w1tAM0fSf66P5nPQ2FdJbmVRSu9pWycsL0kM/AiJsVTX6ikqfAt3hN+PW+FCVxy7vg
         wKIn+8B8dubTr6vzkfUJgt4IaDIAtadWXSPNShHXbmvVVDRV1RWR41cXFI8P8FiFrEX4
         /KBP/D0NJcRpwbnRHatCZ3XZAR21XYCsc3LNL3vU45x7l0aAylxysVrCweblrdJkMlOE
         dIcA==
X-Forwarded-Encrypted: i=1; AKwUvBypFyqggqGbZrUgL1T+shk63gsiN3f6UY/+T6BVxZD5HMdodH6PPdDlQNImVyC04irKtY45LLhbGFKBdag=@vger.kernel.org
X-Gm-Message-State: AFuF++ktsbh8+BrA4bU1yHr3yBO1zF4NRdJVLZOxgYNpqiQU4M1KYAJI
	gsyQBVal+wFkUMbei6KkWQhobiQWTAv5ldOKDoYkACbn8nL0pSbzS3pI
X-Gm-Gg: AYBFou0l6scuEBPIxPSgizENzQb+0CkxKAPQVJ7GQfe530HVnLElASD0uOYInscTodK
	LBWh8WdoLg5Pvc/RCwXdtEufjly96OZigJTVo/MmbBXLXzcp+PTVfaab30OOiLgMdVjAzAYfe0o
	hRuVxl+xYAGFVrVwdZXrvUiF0fj438DBN6Heo7LKwAImWIj2faWNGX1EWmI3KbxWpD4EIEw+GqN
	onoZa5QIkYeLdDJ+3rgAIbszMXZtnyv5TuCPeikK7D8XtNoSm8HZ8JKKPMgmckP04DQ1WR1Zjgr
	oxS8kZb5kHFRyAw9gtVH2q5Prv0iOxP0eZe5gQoR6YOzWu01f/SUdqZcbTr3rGcgoqEvmVJ8ica
	gzZquHG2tJGVmX8clBsb1rlxlgM3/MXIpkxmnK8yyNbjfX1I/809nk2pls2oNipD7Jyv2lxrD77
	Fse0pD4k6XQcQC509/y/dRqCw+7beds+AlF8Z8QRLGKj1f4uoPFJcsBPaSRXLxDasWwyL27zhOc
	riRf0F2oZwOspOaqCCuf/lPqdrIpuXz0yU7VEX0
X-Received: by 2002:a05:6871:3a28:b0:47b:e30b:893c with SMTP id 586e51a60fabf-491e9303f7fmr908800fac.6.1790214748117;
        Wed, 23 Sep 2026 18:52:28 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-491ed1ebc62sm1057379fac.3.2026.09.23.18.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 18:52:26 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Willy Tarreau <w@1wt.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Shuah Khan <shuah@kernel.org>,
	Sven Schnelle <svens@linux.ibm.com>,
	Benjamin Berg <benjamin.berg@intel.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/3] tools/nolibc: fix readdir_r() with 64-bit directory offsets
Date: Wed, 23 Sep 2026 20:52:20 -0500
Message-ID: <20260924015222.31693-2-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924015222.31693-1-danishkhateeb03@gmail.com>
References: <20260924015222.31693-1-danishkhateeb03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

readdir_r() stores the result of _sys_lseek() in an int. Directory
offsets are opaque cookies which can use all 64 bits: ext4, for
instance, gives 64-bit processes 63-bit hashes, and
0x7fffffffffffffff as the offset after the last entry. Truncated to an
int, such an offset is negative about half the time, and readdir_r()
takes it for an error.

Since commit 4ada5679f18d ("tools/nolibc/dirent: avoid errno in
readdir_r"), readdir_r() fails at the first entry whose offset has
bit 31 set, which on ext4 is usually one of the first few, and returns
the truncated offset as the error number. Before that, only -1 counted
as an error, which the last entry always hits: readdir_r() then
returned errno, usually 0, without filling in the entry, so the caller
got the previous entry a second time and never saw the last one.

32-bit processes get 31-bit hashes from ext4 and are not affected.

Keep the offset in an off_t.

Fixes: 665fa8dea90d ("tools/nolibc: add support for directory access")
Cc: stable@vger.kernel.org # v6.15+
Assisted-by: LLM
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---
 tools/include/nolibc/dirent.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/include/nolibc/dirent.h b/tools/include/nolibc/dirent.h
index 2dbf4052b85a..19857369de2a 100644
--- a/tools/include/nolibc/dirent.h
+++ b/tools/include/nolibc/dirent.h
@@ -81,6 +81,7 @@ int readdir_r(DIR *dirp, struct dirent *entry, struct dirent **result)
 	struct linux_dirent64 *ldir = (void *)buf;
 	intptr_t i = (intptr_t)dirp;
 	int fd, ret;
+	off_t off;
 
 	if (i >= 0)
 		return EBADF;
@@ -100,9 +101,9 @@ int readdir_r(DIR *dirp, struct dirent *entry, struct dirent **result)
 	 * readdir() can only return one entry at a time.
 	 * Make sure the non-returned ones are not skipped.
 	 */
-	ret = _sys_lseek(fd, ldir->d_off, SEEK_SET);
-	if (ret < 0)
-		return -ret;
+	off = _sys_lseek(fd, ldir->d_off, SEEK_SET);
+	if (off < 0)
+		return -off;
 
 	entry->d_ino = ldir->d_ino;
 	/* the destination should always be big enough */
-- 
2.55.0

