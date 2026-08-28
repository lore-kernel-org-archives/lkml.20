Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B8C3D669A
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787901635; cv=none; b=sXDDpvOPgCD4TVdoW9j9ZLrLqhv3LHiENEIHse3FrSQ+zuYpJyFfTa7+14jl+33W5q5ZOBGGXGl4gM6fTifU+ST/U4gZ1yMiy4hgWhXdpKYxUJeGB4oDHJnAW1W8oa8ybRza741xe24BFipwW7D9DlHzCuBfDA+3Eyq3eneHeIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787901635; c=relaxed/simple;
	bh=c9a3Rs+JcK15f2Ao6kns2VM1aDnooBIfad8L/a1jgf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oZLCf2qGa1UNiPH9Alh0uVpxwn0p4TbPyNYwxLGg+Yk+tsi//DdBeoH1UPtU+D2ieeqWPPMpInwBgpzMrtuDTwpnH5+VH+wbnbnpexKONn/K8tSUII+2bInoVyJT8cQWo+OfHNcD/+/l1u0O5Cq4V85LT8TE1TpB8ML4dlz0cQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uq2V0jM2; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uq2V0jM2"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc1c73645a1so566812a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 00:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787901633; x=1788506433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GzEDMkX4yTC4NY1QHzlw8SSeuXFcMhPqxibPy+lQxOY=;
        b=Uq2V0jM2fWZxAIOauHMRejOrD19lw5Ra0YDemS6O7v81lzcN3CNbYLq4C3XVOf8jsh
         FN0LVVFPw5GllZuMC7SJGzghdA2mwnpdFWvsSx5oQ3BizISvs9gf2kCtTL17QZp+pcFj
         ekyXKeGrCdoH/EGU4lYhAAE8Zci25XNUaIOeZSmB9Wl8mjfcZ8DedM7SRmPsUY4r/ZBl
         kBGYzYFDPcjwj2rsgH1LylAhpg2aaF4TuKCVjNm00xw3tDJQNLrHUC7icEqVthRlF+Ei
         z8YuLIE+03aOkycbuocyPBcWGI0EEu4gUAL1JuW+yvflP1nfLEZXP2gJYCD6rQGca1wG
         o1QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787901633; x=1788506433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GzEDMkX4yTC4NY1QHzlw8SSeuXFcMhPqxibPy+lQxOY=;
        b=L3dgOq6A1alDflix1Y+Oy6IRw6GvkluXTWGCZxTqZFsJByVNMd6NnRJQ4nh272iv2W
         u87PXzD+aQB5O/cp6t8P2hF/Eo68eKg/lrS93ANeGQ1RN2V/kgths0jf4MiXHXJr23qe
         kzJEJPZMXkGUhCrsTy/djS9MzoFjFxjF95daWJ82h1+1/Dh+er0Zef/V7qrCqqflau+L
         wAqGsptiH6mqYdv95nYDptuvROpAgwczfZNL1DpP0NDEAu8c9i4Z4ni5pYx+IlLHgD+T
         F6rSjeWwckieRRLZdLUpE/8oDrLdlJmLh5acqk7zKEQDe9stNsVSAK8QPePKtAunOof5
         0fsQ==
X-Forwarded-Encrypted: i=1; AHgh+RqWsUSi5NPTYj2Ht7hRyUNwcxJOgbX+kFUttGGmaNFHLquhr/Dv5nuDHzj+PS82ZzAAQE3Cj1g0XWOSPI0=@vger.kernel.org
X-Gm-Message-State: AFuF++mxsjmAzdhshXdGXWEEsGtVaMxL2gspvwpyrKTvjKlM130ARR6S
	evfvzX6SGa2Z/uIjb8O+b2uCIBQVSJwHWjojMqC1y17wX13fy4UCZ4Wy
X-Gm-Gg: AR+sD11dFVwYkVb4iZ58xjLBvhllxvXogUhBKhvvBsVmvUjqBCvx5HKikGuinKVeWHQ
	F9WEMUJtoWRIIr/XZ75Zom0Y63DowxpD0Bfz+dwkPGxEtWtX9MLviAX2FkriHIpa/i4suyMfFGl
	NKmMYUqKSauO3iQKA3IFmSkrZqffzJDXkNozMwMGLeMggch8IAXF3pK69dsgbI0UU+N8Pw56O53
	pw2xBfb1MsJ8Jv6D7O6e7SZeEe4hS1HZB0rWXhBdlSjeO7t+Rzdr14AkXS9FOYKOOf+ZgJ8STvQ
	O6aT8rq3LHAlXQQpJHa/+sfkTYIaqKoZbPFa2mHDPw6HdpxdIA/YU+3T1N2N0KglvvKvOh60QeZ
	LCqPWho4gtZ/aeVWSPcDgOWndmsbH5urjnpI7Q7I4QZmbGAxB8GD8+fIbKIrguxdYZ7Qizlu5ix
	zNKNqrz/sSrd3z9T5T9wMxM7rieDPj44Qt8Ri5wSNFkRdpBSeRCr1W7c7cciqkSW5GEYA=
X-Received: by 2002:a17:90b:17c3:b0:38f:240d:b857 with SMTP id 98e67ed59e1d1-396d0ea9ce7mr7311266a91.2.1787901632866;
        Fri, 28 Aug 2026 00:20:32 -0700 (PDT)
Received: from jeuk-MS-7D42.. ([211.226.54.223])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0ea7fa9sm6123731a91.4.2026.08.28.00.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 00:20:32 -0700 (PDT)
From: Jeuk Kim <jeuk20.kim@gmail.com>
X-Google-Original-From: Jeuk Kim <jeuk20.kim@samsung.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Yohan Joung <jyh429@gmail.com>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	j-young.choi@samsung.com,
	yunjae00.jo@samsung.com,
	keosung.park@samsung.com,
	Jeuk Kim <jeuk20.kim@samsung.com>
Subject: [PATCH 1/3] f2fs: set FI_UPDATE_WRITE for in-place direct writes to pinned files
Date: Fri, 28 Aug 2026 16:20:15 +0900
Message-ID: <20260828072017.44569-2-jeuk20.kim@samsung.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828072017.44569-1-jeuk20.kim@samsung.com>
References: <20260828072017.44569-1-jeuk20.kim@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

f2fs_dio_write_iter() does not set FI_UPDATE_WRITE when do_opu is true,
assuming that the write landed on a newly allocated block. That assumption
does not hold for pinned files. They are updated in place even in LFS mode.

Without FI_UPDATE_WRITE and with no appended data, fdatasync() can return
without issuing a device cache flush, leaving an in-place direct overwrite
in a volatile write cache.

Make do_opu false for pinned files so that FI_UPDATE_WRITE is set and the
flush takes place.

This can occur on zoned devices, which force LFS mode but allow direct I/O
to pinned files, and on conventional devices when a file is pinned before
the filesystem is remounted with mode=lfs.

Signed-off-by: Jeuk Kim <jeuk20.kim@samsung.com>
---
 fs/f2fs/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 089759366cdc..51518caee460 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -5166,7 +5166,7 @@ static ssize_t f2fs_dio_write_iter(struct kiocb *iocb, struct iov_iter *from,
 	struct inode *inode = file_inode(file);
 	struct f2fs_inode_info *fi = F2FS_I(inode);
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-	const bool do_opu = f2fs_lfs_mode(sbi);
+	const bool do_opu = f2fs_lfs_mode(sbi) && !f2fs_is_pinned_file(inode);
 	const loff_t pos = iocb->ki_pos;
 	const ssize_t count = iov_iter_count(from);
 	unsigned int dio_flags;
-- 
2.43.0

