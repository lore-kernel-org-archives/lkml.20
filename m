Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768745;
	b=m4j8mILYlcWHL0yi25isKCJVFxqNrh/I1qJ9x6+pyWZC1KvmDMjR5sjLMaY9DIR6baKw
	 gMlHkr1DD4xPiFAAYhEghR/ZLGXa8my0QilVkv8xSFcV1fXBh/ZSQRJrnzxN7OkSuurOr
	 OLGmyYgdaFZr0HJCr3uzTY6U4xpS+fWmhehveIIdegLwbq+HBxXXy16oTiDU3gxnJeKVV
	 Cal4J3ld+Gf7bSG0/CPBRgaLYAx68Mh/f49w18KRINwwgLSQ5KA1FrGUPYT8pM96ESvZu
	 rdkj5YalgmfovOIGikb6WanZAJmTMZW+C0fWWK54xI6pwA1CvgrwQKkoGzZ5Y6uCXzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=r5fNrV91FJf9Qmtk1w/48jj0AR/BtrB4UlrPJW4rMRE=;
	b=FuhnTRqgNw9dVNMdNKdQqRqH3F8b3V8vMMJudLnTeottCQGEUBIAvQT0nJ6z1CmXgPCu
	 IggEf+dSpeElXlgbq7xNyENmshCFXe/dy7qS/BSc9cfEWq3gYKti8wTGKYlImMZ5zaoRE
	 bbCFjboeZHW9Mork8Uiw6xHFEvXj3bBfRF3yfaNkcaclo/DTRc+nBvKjdbflanvUJN/kR
	 wuEVXkV7WTuV5fZ6DONLzjvHBW0biLmLHTt+VlJ16ZepdoQINykkLm3N9jMwzLure9w1r
	 Hty8dY7I5r1dYHEKgQ06SN3oO4oJtGHGh4x+wGqa/OCeifMft5szR7m8uXnsdEV5imw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XkeWrjBq;
	arc=none smtp.remote-ip=209.85.222.50
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDE7606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:19:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EDE7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XkeWrjBq
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-98febe968deso733577241.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792768744; x=1793373544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r5fNrV91FJf9Qmtk1w/48jj0AR/BtrB4UlrPJW4rMRE=;
        b=XkeWrjBq/oeQte8WoGdsjzOJKt05yIYRZpR/ymVWmhKRVT/vAokSRL6gefGK6SbH30
         wPON8Yfiu9pi7Z0XTGlwYvnao59S/7UjK8+MOuhwT4S7HnuHh6X+JCYI7RNLQLJOwpO6
         yjtV/aQEAniws9EZAreu+MSxONgDqkorlvxwYd6ifCxPw/4sZv0uK9jX7pOU9pEKoQDZ
         aIUulY/GW6KxtxAZ29KzTa+NMNhix2yrHHKPDnFTX0Z1Fme8MO3y3RU24v1zS92uheo6
         DXtG3avjs7Jv8Iik4DRdbjEacMolpNx2X8vc3q3rUncbkuD9mdBnGiUoOA4niad5vUPW
         R89A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768744; x=1793373544;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r5fNrV91FJf9Qmtk1w/48jj0AR/BtrB4UlrPJW4rMRE=;
        b=ri/X6JSXFJGtT4/Es+4Mrz8IuUw7ME93oIt0dgeiNEczv1IMO4N2f3sLebosZ9qhAD
         vtxCD6a4OjdLOfkpPk0kpl4ldEbdqpcV0AaXaoaXS3ld1cbJiX9M/fAdrC4D/B7nOpUc
         /sjeqfu5uu7HWXOG2uYDA0Jn2c5hr9ZoVwrFsIZOkm3ETiZFjuqRHvKrYl/GUslzcr8x
         ciKamNuec5zHfc7V5afOxQRQIVWk77yqrir4wvB4Hh4eRN4+AjSTXBuI1zt8J01+vVtU
         bJ81hqmwoe4xc0+NqeoXXbOiOxCdCGJ2lLX/HmFtpSum3MNKxWwh+d40VPpfWDKylY3F
         9uow==
X-Forwarded-Encrypted: i=1; AKwUvBxv0bV6zNOE+9sV7D7zTuDAmw8z2Q/8N+v9N0DWU/tBhEexcTBj43OuYKP1SjCLCI7ff0AEm2rASbFEQxY=@vger.kernel.org
X-Gm-Message-State: AFq9FYImNLDDEqYdFtL+8NzvfGkB6nXDvaq9WtzwOn4RW6mOFjEZrq1t
	ngKNLlKtmLgTF7md1TjYE633lRGhKl2V3dyRUV18g/Gr7dr5qFPeAjlxUkwUWMN0
X-Gm-Gg: AYBFou2CmJmNrv+2knbsBB9E1d47MFtiVBfb8d5SXFLKV9dxJP1GiYmCnrkqE6NUkiu
	d5F0qp+wt//6RqxjtysZ4/0wftLykVjrkkhPKDx+67ldCX1/TaO48DcVOZ+uJl59IEMMHIsUnad
	kq+8aduKa4kC+v1XaJUCMEpG1cDlmT1GS7+WFVmZziXJc49Ev32VANIP6hzIBrmsqG1r7VPlAuk
	hK4G4KGis4Pp1XY3F6XEKk/cMwCsfAFMeAqwKgDq0/rE2ArluZeUiVlbUvi+9ZBHUo6wotpk+MA
	GkKX+ACLtpn2Xa+FRQDQlG6UGkZjFxBRPhKh/0pxuIgIMHPbL299umWXcyud3XMFIkqsPH8Ufwp
	22/qrFoXHS9ZjO2bdpPTzAmc1i+5Ymof7bqMyRpU3/YNX/wJGIzCQQT4Z/kWt1F0gbF/jAnzhBi
	Y4CUH5N80vFAyHeocjjw4GA65qnzuxg+hKvvB+M3MEzbXUx3JOSZDQ1iQvCNFubcUTiooKMm7AG
	Vee6OVvPAIeBwZ7GcsG+mcsrUGVpbPwg881h0q9hnEj7yGFCmA52Mfgpz87PtlyDM+tu9QMASkm
	GATMPJjvEpzuGZ6Q0NTkMm16k+9VNoiptpMjteseCcax
X-Received: by 2002:a05:6102:1487:b0:7be:25d4:7ff0 with SMTP id ada2fe7eead31-7ccc308886dmr1098358137.4.1792768744042;
        Fri, 23 Oct 2026 08:19:04 -0700 (PDT)
Received: from Biostar-A520MT ([187.94.15.233])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9910c006d21sm601040241.7.2026.10.23.08.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:19:03 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Breno Rodrigues Alves <breno3011alves@gmail.com>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH 0/1] fs: remove hpfs filesystem
Date: Fri, 23 Oct 2026 12:18:47 -0300
Message-ID: <20261023151850.96475-1-breno3011alves@gmail.com>
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


The HPFS filesystem driver has been orphaned and unmaintained for a
long time.  An RFC on linux-fsdevel stated that HPFS is about to be
removed as it has no remaining users and is no longer supported on
SMP or PREEMPT kernels.  Recent vulnerabilities (e.g.,
CVE-2026-97486) further highlight the lack of maintenance.

This patch removes the driver along with its Kconfig entry,
documentation, and CREDITS entries.  The HPFS_SUPER_MAGIC value in
include/uapi/linux/magic.h is kept for userspace ABI compatibility,
and defconfig cleanups will be sent separately to the respective
architecture maintainers.

Breno Rodrigues Alves (1):
  fs: remove hpfs filesystem

 CREDITS                             |    2 -
 Documentation/filesystems/hpfs.rst  |  353 ---------
 Documentation/filesystems/index.rst |    1 -
 MAINTAINERS                         |    6 -
 fs/Kconfig                          |    1 -
 fs/Makefile                         |    1 -
 fs/hpfs/Kconfig                     |   17 -
 fs/hpfs/Makefile                    |    9 -
 fs/hpfs/alloc.c                     |  582 --------------
 fs/hpfs/anode.c                     |  498 ------------
 fs/hpfs/buffer.c                    |  232 ------
 fs/hpfs/dentry.c                    |   62 --
 fs/hpfs/dir.c                       |  331 --------
 fs/hpfs/dnode.c                     | 1095 ---------------------------
 fs/hpfs/ea.c                        |  368 ---------
 fs/hpfs/file.c                      |  276 -------
 fs/hpfs/hpfs.h                      |  579 --------------
 fs/hpfs/hpfs_fn.h                   |  379 ---------
 fs/hpfs/inode.c                     |  318 --------
 fs/hpfs/map.c                       |  335 --------
 fs/hpfs/name.c                      |  114 ---
 fs/hpfs/namei.c                     |  621 ---------------
 fs/hpfs/super.c                     |  789 -------------------
 23 files changed, 6969 deletions(-)
 delete mode 100644 Documentation/filesystems/hpfs.rst
 delete mode 100644 fs/hpfs/Kconfig
 delete mode 100644 fs/hpfs/Makefile
 delete mode 100644 fs/hpfs/alloc.c
 delete mode 100644 fs/hpfs/anode.c
 delete mode 100644 fs/hpfs/buffer.c
 delete mode 100644 fs/hpfs/dentry.c
 delete mode 100644 fs/hpfs/dir.c
 delete mode 100644 fs/hpfs/dnode.c
 delete mode 100644 fs/hpfs/ea.c
 delete mode 100644 fs/hpfs/file.c
 delete mode 100644 fs/hpfs/hpfs.h
 delete mode 100644 fs/hpfs/hpfs_fn.h
 delete mode 100644 fs/hpfs/inode.c
 delete mode 100644 fs/hpfs/map.c
 delete mode 100644 fs/hpfs/name.c
 delete mode 100644 fs/hpfs/namei.c
 delete mode 100644 fs/hpfs/super.c

-- 
2.56.0

