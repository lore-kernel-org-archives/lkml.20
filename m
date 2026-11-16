Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794824626;
	b=r6hGSF524xsYK+IcjNWpjT+WWVc6tkD7n1YnqMRCX2nuWcz9wF9HCXv8Ss/ifQZUXO2V
	 Amv66Hrm7CHhNcwoHKqWp2f+3qXND2kX7vNfqdcWtyO8z8xWJUOrdGbFsLvOhVffQZ+B6
	 ZP+mdfd0PUCS6HkrBMpz0an5PRhEf8bvfo/7jRaTpAWApuhXlgDSzLzkkoYBtLO2F4kbR
	 h7QNmO3pDIVxr57KpJxpVycMPhQLQaN2pGv1z2vWYOKxBC9CAfTtfnK4guiz+V2egykb9
	 gYQ/f9isHEHr1va9N88q7j4K+QZH7eoL1S98/qEu+1WvxtfxreqrwNb44RsUf3lwkfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9q/zYfokBxKaBTPYcerPDmA3MfY1ZL37DCfWtL2KbVM=;
	b=jepwO0vhrgsmfrXLxn5MYFto3DYHpsQWiKKQ8K1AQ7Ut25BLFHclo3TQ75TT2uiZnfNj
	 TutYFVlGUDYqgUejMVPNtHnw6Gh2BtyRIp1dZrxx+S1pEFOGjhnYNxgQ7teqLpZWNFaQT
	 IvTml8Ut0RVy1LvIBoVyNMnyNAPN6hakqSBLKsvbhUojnGTlAqelYqFJcW0TP0MQzZlCi
	 vTUKyRrnN76bB4rQmShe4BquyqwrnWwK7fc/iVhyAlbr5QEWeeA7QNbwWh1UTy69fSpul
	 skOazhxKu6q9xNFq7Yl92RWCOC+ksZdfAus0KFXx7NUrHkqZjxoUmlGLmyGVythk4IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nlwp1ta5;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4A1606A88E
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:23:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B4A1606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nlwp1ta5
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a210470b49so26204455e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794824623; x=1795429423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9q/zYfokBxKaBTPYcerPDmA3MfY1ZL37DCfWtL2KbVM=;
        b=nlwp1ta5SDEnakttiqWxdmNJS38raYe5iE7G79agIpBYLhpLANEdpEp8DcRTIZeMpN
         bogWAayszJMdKU+SePBWmx4W7Tnq4dL2QSzWiWxe8dpAmxr30RWcECUKJLlRxt8sAJa/
         UxLI4DvIYigUXepwY+2uiEgOm5qNI+oCd9imaotrC8l3HIShcGnk7nvECW7V+8ITcWC2
         SqKu4siD3nUV85hlP3i6bvYohTFXXq7NT9gWUsDGVgrgO0+d8gsDj/camLCiUAhpAf+J
         zWFG9ycTDvA9iLwAgrU3LldqLMCRf00pO4bMzSjTthvzT1bNxIEXda3oWAJHaRYo0tv6
         1MUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794824623; x=1795429423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9q/zYfokBxKaBTPYcerPDmA3MfY1ZL37DCfWtL2KbVM=;
        b=KpYKerqioLjQY13kUbiieo82m4R26JDHD8hZIEb7WV8Tkl2C7w08bQpV0TsyDnk66b
         1UNyuK+ObR/dEY4UwFp+j1wk7FcCPQ3hiZj0dCQ+aQHd4/gJ8snJJ9JY0cv+lYRNxdfU
         2ZbLHXozJJuEjAynPZdurd6GRzH4vDJtRxuOHcWi6ruyc9wZf+uqIHeluK3DpvkxdShr
         rgWofD8v9+l7xIChjMli6pfmURS2S3tkhWpyxL+lyDGrB/Pq0EhOGP8NQ6hk2MkgpRE4
         XRbeivXauxYfd9C9M0VgxtG3lVbj9SgcNxVzhyApKMdORhhSg8DhXg+KYPkw/a5Q1gnx
         HWsQ==
X-Forwarded-Encrypted: i=1; AL+hErGt2QxnWGt4ErdAL2Z9ndVMRsnqp9F3dQrKS0H5mILS5sf8dfC1L9C+e2kaWvnVEvhGnFEuXuDrveZueSg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/QCK5rQov60Od7fo/IH7E1MNqB38+PuSjBafKR5v8I/PZWgII
	Dobs97YlMxzArGh2jzHSWVStiDtHk+SbNFyA0eLQ8DAOZaBze5dHfrsk
X-Gm-Gg: AYBFou1qA3iWNjxFQDiKssG58iMa2F4hhv1Tcfzc5YEEr+LSdlQfSKMoQVlCuWMu+WV
	pcGd8WRxMSh/PtlbLzezJH5cwhKTkTgw0JH1ePEiDGZgEx5ykh1c9q6Uxw3szX0UP+Ny4vqb8Fr
	X2PZ1Bb+tdvzNHFMFdJ64SSPIz6JqtAWZq7QIpKm810U8VM2Dc2dZcHJjJdklg0Lv8/HXWbtPu9
	PZnnTeJFMPZsyYrxl8F0NHXSg20yaN1/oX6fyEMfibb/MkY0Q9vaYNHJGPmMBBS0ZUu40I+KH3d
	ZVORKyIYQ0eMvvnvxsYcBxMcSES+rgjYUSrx84MD1bof397SuPwq6/Yvpq0i+Ue6IthV8jpkzxv
	pD4lnVWWJ6YrI2M3mHulvDcwPujrRKGqEmjeKzcL3mgtmrvyzet6V81FlDRFkIc5Rp0rO3vGX18
	HfUoCZXRV10l4kZoCamLEvHEtLYO5uyanqP66jt5WkS0PnoO8UmV0v5c1Efh4qZC6aGw8fB91aF
	+FTEfrAWCXiVM/EPHQI+qFlQEcoWhDfwvYSDxokGW3nC2cCi/KHerogBDBLbA6LdVhdgkRpYxuy
	Hl5eDBL20I+hVgRaJ4Jt
X-Received: by 2002:a05:600c:5395:b0:4ab:e27d:e241 with SMTP id 5b1f17b1804b1-4bb55a95d09mr204699015e9.15.1794824622940;
        Mon, 16 Nov 2026 02:23:42 -0800 (PST)
Received: from fedora ([5.131.7.59])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571f6a40sm108149375e9.2.2026.11.16.02.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 02:23:42 -0800 (PST)
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
Subject: [PATCH 5.15] fs/stat.c: avoid harmless garbage value problem in vfs_statx()
Date: Mon, 16 Nov 2026 17:23:23 +0700
Message-ID: <20261116102324.81107-1-petrvaganoff@gmail.com>
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
index 246d138ec066..43c4a60b773f 100644
--- a/fs/stat.c
+++ b/fs/stat.c
@@ -223,11 +223,14 @@ static int vfs_statx(int dfd, const char __user *filename, int flags,
 		goto out;
 
 	error = vfs_getattr(&path, stat, request_mask, flags);
+	if (error)
+		goto out_path;
 	stat->mnt_id = real_mount(path.mnt)->mnt_id;
 	stat->result_mask |= STATX_MNT_ID;
 	if (path.mnt->mnt_root == path.dentry)
 		stat->attributes |= STATX_ATTR_MOUNT_ROOT;
 	stat->attributes_mask |= STATX_ATTR_MOUNT_ROOT;
+out_path:
 	path_put(&path);
 	if (retry_estale(error, lookup_flags)) {
 		lookup_flags |= LOOKUP_REVAL;
-- 
2.55.0

