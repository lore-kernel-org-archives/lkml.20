Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794824554;
	b=NEjuT/JY9IJ27w6YUUlwPIAKwiQySwU3ntf/sl2cJl+wnYgchQKHpbJS1UCM1ZQULUFf
	 dAJBxpxmbgkAbiI0GdCn4horPrgKH0+162hbSehH+jBM+nNmZF1+6N5ZYdcuCOcXFJz3v
	 DuWj6h8BBWpoI/wLCQg8IJ561O0bAdIWqI0x3fSjOyGxeLAJ/utkDO88QnnoNOFhfoZaQ
	 JoTFQcOU7jtHAEr2Nv98CZvUCSpeld1EPUVySNgtuyeq2M81Z1jv4VBp6FJPFkqd6J7nd
	 sJIt7gtxMTyLoJDfxY5WYGK4FVraTqFb6IuY6/UfWtKy405ECY3Me46GiqE3oCWZwFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=e4Et5WMZaz3LvBfh2jlwetoJpjp7/FMRj/wZQ24Y5ac=;
	b=tcRVpmiFOc7/r7B5JdLfBjSZ2VlfYKBzjS5Wpi19H56YYmWeFGf+wQXKQskxk5FFzYC6
	 LuPNgQgaZKxBDQ1uzEsWa1UkgN3IN2HvX2GqBPzBCbTWCSmVaWyu00hEEFHYDvkt3bFMn
	 SvoX5BsGC2X4ZlEZdg34bbXynzqkAzVnk9YreF2RYUnnn3TyZb+GHqo9UymO/n4ki8oTk
	 9p/bHo7lQNzSHscD4FrA1ixXK5l6eqPeunf4r7FarqeqUkP1RgeQlMJMtumo1yt1RQ5EN
	 LI+rWB/pKBBiQjRweH0f1gsjZNZojTpXkolE+3/LCSk1Swkx9EKyKAPkbLzU6C7PyNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="s/kR0OQn";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBED606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:22:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EBED606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s/kR0OQn
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so19417305e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794824552; x=1795429352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e4Et5WMZaz3LvBfh2jlwetoJpjp7/FMRj/wZQ24Y5ac=;
        b=s/kR0OQnus/ELVQiXFewd4uRT1KvhI1DQz+VqaFQGfniIyQMOR1o5uLW2K8BMtcALB
         ZIL1cVqva+DwH+G3fXeg+CDR2u7QUVRzeG0ru8KZ4WBQhUdvVT46fHws81P+V+cEQ8pa
         Z3UvjQpJ180F0y26nlY8U5/nab+Hnq/c77dCza1EnXDbyNirk3maJ/xV3uIRZrOFPlA4
         xcE6rBIYl1v8qEqEhwY7mSuE/q8oOzQWXB3N9xgO5KQ8Kn6+q2RRIiemb3Y1haPJLFuQ
         ZRRtjb+oETeTgM7wFR66EYF9YSfRzphGrW/bDPwsibAAYPq9tbZeiG1tB08/MJeQpv4X
         DIOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794824552; x=1795429352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e4Et5WMZaz3LvBfh2jlwetoJpjp7/FMRj/wZQ24Y5ac=;
        b=R+QYzHvSRXdR8mluJljnbxfUq/blrvwJD0R6IDqbjOW8uPR+nT5KmSBiXaj48IXP+j
         2NmxEO9MAHKZX55lYoZi+n+nk88TJCpFKIx8UcHvkz9DGN2Kh3GAziP5nP5ib2zlhN9F
         S2adSAhPr0HZ/vFHaz8o1RVhZRcbPNV2li3Dl4A2LzW3kw6G9Ms37FKkiZBynt1RhG6m
         bce75bdbOoWJFIuLm4etwJp1Qby3X1x00Bpv56qm5IoHvDk4Gy+sz/bFdJfM6vGb6DKe
         bzHIx1KiuLL+Z98ZU7kwlVOIDs8N3CfBkzQl7cnJ06RSMmL/OqSThZQ4985iurp/KnZS
         70vQ==
X-Forwarded-Encrypted: i=1; AL+hErFQrwRZqlGhI37M5laDhlIq1IVV4JGAGLhdRfWQHBaDdANUupTUZV8nsiVtHGceFKcghUEUBtEfv5jrAWs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gewDxmRo4r30R/XXpgKp7IecenV6Mb2O08zwMjpje0pJtgzb3
	1vECCBP97B2SLdnX4yoMRBgxTBUOlYeQlSPB+EGP1y3Iwmp390JV/LW/
X-Gm-Gg: AYBFou0zuaNLaEiu2hjBYKOUMa/o1dJOKR3tvFUFls3yvvP0e5qkDHN5D8IPFKh311A
	t+A1fmaikxRwtwTK8Hku5w1nhyX15/1vwDQ/gjtsvlBJ3oRBNx8dSBbT/PkMnSJYamJU5J/gttj
	sY2sW031cB8VaELpUdHFg1IDbrl4h/v4A58awtTXZatWYfa+uPtIdv3THIJFtVpp++MMoeGyMKu
	8csenrBpEyDGt/P2cjRYSiX83utF715u16CM2rhtKWSbGkGTJbmBDRc0tvHtiq2zjc7A/eYl8gh
	sgFcgNEKe7kD15hc2grXFVKsTGSf51ZkjxaAIQSxFBdEhGMhN4dDbSGWxYBqBZiUSZ/i2AaEvTl
	ifbrn6d71WvyJTuKcRWCalf+j8fokPf6a4tNepOsdnUv2Z+nAtz7nPzEexcp3ttD1yxOxdPAq6+
	8O0JgHEUjQKpOSk4C+5Q65unPMDsCNZonQX4E3+FAf41GAfGME1YCwIAUai4ULTDJDgXzY5ZeXR
	hJHkeM2xhwt+8LwhSHXk8D01C9yTzwoJvGMMbqf2bOCZymSQSCYXnXlXLGJ+rrbq5t3/tD5/UIN
	K6PhYnFBUIq+Y3TLRsJD
X-Received: by 2002:a05:600c:34d2:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4bb55ac6cabmr206158025e9.34.1794824551582;
        Mon, 16 Nov 2026 02:22:31 -0800 (PST)
Received: from fedora ([5.131.7.59])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2adf53sm388703845e9.15.2026.11.16.02.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 02:22:31 -0800 (PST)
From: Petr Vaganov <petrvaganoff@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Petr Vaganov <petrvaganoff@gmail.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Su Hui <suhui@nfschina.com>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH 6.6] fs/stat.c: avoid harmless garbage value problem in vfs_statx()
Date: Mon, 16 Nov 2026 17:21:58 +0700
Message-ID: <20261116102217.80740-1-petrvaganoff@gmail.com>
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

From: Su Hui <suhui@nfschina.com>

commit 0fac3ed473dd2955053be6671cdd747807f5e488 upstream.

Clang static checker(scan-build) warning:
fs/stat.c:287:21: warning: The left expression of the compound assignment is
an uninitialized value. The computed value will also be garbage.
  287 |                 stat->result_mask |= STATX_MNT_ID_UNIQUE;
      |                 ~~~~~~~~~~~~~~~~~ ^
fs/stat.c:290:21: warning: The left expression of the compound assignment is
an uninitialized value. The computed value will also be garbage.
  290 |                 stat->result_mask |= STATX_MNT_ID;

When vfs_getattr() failed because of security_inode_getattr(), 'stat' is
uninitialized. In this case, there is a harmless garbage problem in
vfs_statx_path(). It's better to return error directly when
vfs_getattr() failed, avoiding garbage value and more clearly.

Signed-off-by: Su Hui <suhui@nfschina.com>
Link: https://lore.kernel.org/r/20250119025946.1168957-1-suhui@nfschina.com
Signed-off-by: Christian Brauner <brauner@kernel.org>
[ Petr: There is no vfs_statx_path() in this tree. The fix is applied
  directly in vfs_statx() by jumping to path_put() via a new out_path
  label, preserving the reference drop and the ESTALE retry. ]
Fixes: fa2fcf4f1df1 ("statx: add mount ID")
Signed-off-by: Petr Vaganov <petrvaganoff@gmail.com>
---
 fs/stat.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/stat.c b/fs/stat.c
index 5375be5f97cc..9d3f1b276c86 100644
--- a/fs/stat.c
+++ b/fs/stat.c
@@ -246,6 +246,8 @@ static int vfs_statx(int dfd, struct filename *filename, int flags,
 		goto out;
 
 	error = vfs_getattr(&path, stat, request_mask, flags);
+	if (error)
+		goto out_path;
 
 	stat->mnt_id = real_mount(path.mnt)->mnt_id;
 	stat->result_mask |= STATX_MNT_ID;
@@ -262,6 +264,7 @@ static int vfs_statx(int dfd, struct filename *filename, int flags,
 			bdev_statx_dioalign(inode, stat);
 	}
 
+out_path:
 	path_put(&path);
 	if (retry_estale(error, lookup_flags)) {
 		lookup_flags |= LOOKUP_REVAL;
-- 
2.55.0

