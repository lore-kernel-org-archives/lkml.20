Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792951345;
	b=vw56G2UdP/tXKUwrhhjxSFu/X8YUv8ppABM+BjhVohokTyawKSgyaTkC8FgPP3ng5SkT
	 lf/JhWsKA0ew0V2yLttcm1JYzrvbNreF9Y3Cx+PqWZG/L3CV6HgP2bDqzpcs0oq3WVYz5
	 QRwcjZZpnvJKyU3XaMpU+KpqKpo/nRoGtpjbl7H6oot+oz4oc9ECt/skObsvIemGcX4fv
	 +diov8Q61rtNWhWWWMSAmzU8oquwAfz0YmWRyzaiawExK79dGEtzn2lFZhdK0/WeWvsdr
	 V+oRfP7g9I0fQ+Mct6lx9kSwut/nklmnKxgkop9d+ra8P1RhWO8mmG9fZDbc0cJKLAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792951345;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=khTvN3xc7ITOTbWXYLQA7dLPyGE8iHwlLNDqLgj2tM8=;
	b=GQPg/qPJKX2hHngNZv77BW5IZygI4ChvW/PXczcleYFFuXr2STpu7ZWqiGCwilK77TE0
	 gI691jAj2iXZiqwsOd1l9kyra9gJSuiYyu8Azfi4Di7gVaOa5KRzr4oUlGdJ1cMKRkntS
	 w+tRjiDBTE3TbJ0WZi5usY3Y99VKdT7d59X96KfhpKu72GnOJF5/FWXouo0cdzU4wyCBv
	 YnsJY1+vQ08tS6K3YQzq46tbLz/ZGEaYzlXmz9vAJJ9i11kLLsZFwAcCh2uDAK5k8JOwC
	 Gxi7JLAQiW3pXB+mJddtU8QIqKpths1pDOlyD7kkWvRCNfcFw5tMSbozbGo6BQKOhHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Bg8GHXqk;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E457F606A320
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 18:02:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E457F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Bg8GHXqk
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-181516de561so1487240c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 11:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792951344; x=1793556144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=khTvN3xc7ITOTbWXYLQA7dLPyGE8iHwlLNDqLgj2tM8=;
        b=Bg8GHXqkwFdikSI6Dx2zdQzlPoJEtVlVMnxElKXJWD85hAZRRl6vatZ6tgcVTxXHf/
         0jietNyMyDRxmlGhJ0TeCNwSCUg+hR6zd9BBTElO5CsHE0gXhAixGzS7I0wo8o0yHGsV
         NQ4oUoyn+OOfQEi3ydD6q6UVzx4kGa48SZCIfOBcC/TBgj02xfkE1ugM5hzCujfEeTFQ
         cGwtQZ8RXttHcOjgXIJGO9m5MIoRX9PQXvkPbsTwtWjb8I5w55/Wk+ijxryocZv7VvgN
         rwX3ZCmOWz2Hixxz12TK03kEtGarq+7ZOellTQc8gVCbUMtKGjmdrE0BvwsmbvqKFJA+
         QIzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792951344; x=1793556144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=khTvN3xc7ITOTbWXYLQA7dLPyGE8iHwlLNDqLgj2tM8=;
        b=084MNVd5+XxYJ8fXNgzZyFT/zBe+0TzNr5Ucn/9Hb3LtRola3S+alWci5U3tVCqsPH
         jIGYW/yPI1GFj71W2SsyxB+axb6YYrIkjVLW87U1qkIJNSjOjqtW7+qTSOGtYGXMypHk
         3Ij+lWzRoLejFD42R6a1Omg76zueK1cx7/OUpr2SzRh1MJ58esvLmxFpbUg8+5kbVP64
         3/Rt9EAL/QgDsOyV6J9Us+I8dde+YdoVdLIIR59x+iMGaiRP4PBnjcN5XuL6pD3tB+ut
         3nHignYDiLufZ0kmZNx+c82LfBevnHhQ7USnk6i3zcIrz8DP+WjUZMBRrqxoyz32/uH1
         ZMBQ==
X-Forwarded-Encrypted: i=1; AKwUvBw9WkyDyIYRpPR52uV8OXwQYWudK5vGGd6g4jXHkwJpuxAeYFQfjuaYvpKEsLruKOu91Imos/hDKmw7PEM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYtAa2i+HXCQxEnmMzcU7Pabmb+OFRYs1PR6aSL0tGtQ4XrSuF
	YufOSW3GS3gTZI0CUHvGrx8GZ/FQ9adQhObinYmjQxFp5DnD7Izt2J394QzZZSoonI0=
X-Gm-Gg: AYBFou25igeJcOmCm1/T4HF4cmWc8Fxcok/Ao329EGH8oYUCfOfZpV/v9riilPO1YpW
	Gp5ZCjkMpAFC6OK32ljRVj5gooScatyZTXIS6jsIz4G1GKXsZb2K52MQdQIw8i/dp7QV6Qlg0Kv
	L6NexOiGbkc9VfaunUCcWz23j6WplFRD7Eib9pFu6hY2MxY7C71Lp01sU5ZMltve1gd0Qvv4vyp
	+l5Zwy6EF3xYNFeiFvbPp7Mii/G2V3Gygf7D0cZ665+fgCIi5cLQHad0AVH/5Kq4pbrGXMEdNcD
	lLTFuK7zsl5FQW52j2kdKJGoMUIIj2hE80PltFTV/LED9Z0Dxz+rU0iJIDwg0j4b1yINatRpH3T
	9sLuAt1mcM7FJOmdxz8x51eIT+qyN97ZRTP6JVtMsoK/kwZALxh9EoJ9zhfFUNc2bEtjwT+RWqP
	+6oQP43HTxyCAffrSzpvGAmp9c7dkY5RtP2xafwtRLTQlLShhM66I6m6+bb71b0HO61zm07AcsU
	rAo2M0cgmDH3zmwsl8Io7gqI5NyiSWvxYpOE/+BwQP/jLQV5hkKSXwlVeVbSJGBPm/dilBZNo0Y
	teqbNI/MPj+cUfp1HZ5v4EywD4mBGyVf+lgMyylX
X-Received: by 2002:a05:7022:d41:b0:17a:a3d4:8b17 with SMTP id a92af1059eb24-1994e81a865mr6545141c88.12.1792951343776;
        Sun, 25 Oct 2026 11:02:23 -0700 (PDT)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2a5a515sm16099227c88.19.2026.10.25.11.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 11:02:23 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Cheng Yongkang <teel4res@gmail.com>
Subject: [PATCH 1/3] f2fs: reject non-directory parent inode during dentry recovery
Date: Sun, 25 Oct 2026 11:02:05 -0700
Message-Id: <20261025180207.348498-2-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261025180207.348498-1-teel4res@gmail.com>
References: <20261025180207.348498-1-teel4res@gmail.com>
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

recover_dentry() takes i_pino from the on-disk inode and uses the
resulting inode as the directory for __f2fs_find_entry() and
f2fs_add_dentry().  A crafted image can set i_pino to a regular or
special inode; the recovery code does not check S_ISDIR() and then
writes a dentry into a non-directory inode, extending its i_size and
changing its directory-only metadata.

Reject the record with -EFSCORRUPTED and mark the filesystem for fsck:

  F2FS-fs (loop0): recover_dentry: ino 4 is not a directory
  F2FS-fs (loop0): Cannot recover all fsync data errno=-117

This was reproduced 3/3 times with a crafted image and the patched
kernel leaves the target regular file unmodified in 3/3 runs.

Assisted-by: LLM
Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
---
 fs/f2fs/recovery.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index aaa5227..e40f66f 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -209,6 +209,13 @@ static int recover_dentry(struct inode *inode, struct folio *ifolio,
 	}
 
 	dir = entry->inode;
+	if (!S_ISDIR(dir->i_mode)) {
+		f2fs_err(F2FS_I_SB(inode),
+			 "%s: ino %u is not a directory", __func__, pino);
+		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
+		err = -EFSCORRUPTED;
+		goto out;
+	}
 	err = init_recovered_filename(dir, inode, raw_inode, &fname, &usr_fname);
 	if (err)
 		goto out;
-- 
2.34.1

