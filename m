Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DE82E06EF
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 21:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788039188; cv=none; b=J/QVjSqa+bxtFT1SODooAIP45PYJfcR59aoWGodaLL3Iou5mvbJqQmrNkHz/66L3wo2y0niGMkuQvFOUW76FnG/g75OEn0QEZxRhag8Z2tf54YPDW4nOhGU6fEkyM+8rrXPd4Xt2s+dN6rxPjLFDX0Yov+hNdyVD4bOOUxYZ9vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788039188; c=relaxed/simple;
	bh=Zt6xM5ByKMqjss0Ju9Pq8lrUfSmBQl0+BHJmcT0gcU4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NlcEKjesz1lPHgovttwlr2tcR5qDpX0Lf3mivH+CVJsWlUSHKGO/QpID6WNpQlkiZeW3CzzjISU+8V1JNe/OEZQUNyJk9cDiOq4UCi3wPSqs4qQNqVK10I87G8/nAzusr0vLi/YNwsiKbY6S4/gw0ezC90eQxVLhFYo/mOpBhOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A1pRPMGO; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A1pRPMGO"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-482e067e908so1534329f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 14:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788039185; x=1788643985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ucnD2vvZKQodkVcezxvV4KyyS73dxyfqz8xpesSWdQI=;
        b=A1pRPMGONSvtnDEQSeM88hjsR4UhzcAQhj0khTIC7Kcg4ylw7Hs2Pp1ze0Wzml5xEY
         vuEw+SVSZ/VOCZzx44S2OhfeEa97fyg++wvqcJ+h7khmMFjcxME3guYCom6RXQU2XX3v
         TScKUqTfBJVT4IgbmJfe9G5pEfClUwmBXHlXLZTwtgnRhmGsgirYEHf6khLFQR1JnU3g
         9X8Rtk5up1uqY+KmUDI1pXc7QLqp0I+sTCALkRSD3QZPa8kiXhJ3yffXwH06sl93+gcU
         QnU57sOzivcNJ8juYFAMciOxBoJlyzZlFGKYTIrbMvpoq22mHXzt8bYXuIKTF4Zrmqgm
         YgwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788039185; x=1788643985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ucnD2vvZKQodkVcezxvV4KyyS73dxyfqz8xpesSWdQI=;
        b=H2qnBrl5yaIm9Z6OuaFdaWPTC+4Qzz9IcbIgRhA8scGMhhHXtbHxbrnza55dEFXBpr
         3GjBLCnoPAl8+wreFSkA2BWG7LlRoCH6HG6TRz4HHgX/0Twfx8Yp2SiEN/scZXfKOK8y
         4hk/OJ0J0YbvcTPbciVJJGpCx2jsEC9QwxyQ12ZCjcC9vMy3ZnY0Avpr8PxhE1EFMlun
         xsgFjAKKM2sMrinTrhO6xFlZSuObIVS3oFjjAAwgnvme82gHLO4YrIl2KRmNPGzqjQxD
         zGebseQuG0QgS5vje9F5eosy7uX7oog7DRkfsWBmSyBOjbcTZWjDRmZ83nQTcg4BpaYQ
         J2pQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4/GGYXNDpFNyrwokNqpcclc6b+cEYwwcJFcrh3m/azl1IUlqztiNL6eiJV/U68WXD9rQ7QH13sd/rEzM=@vger.kernel.org
X-Gm-Message-State: AFuF++mkLiF90fuhZIJTiK3G4T/jqcjLlm3yMCj0Sqkty+3UPf3Kd9XC
	37fmSOEfvAJY8iBB9TintT5TdFKZUzyOH/CoDQ17cPvZE1aGu1uTQCzY
X-Gm-Gg: AYBFou3LavRLzw6ZSdD6A13WlN4FyqE7owjPz469//6actDSP69TC8LvmA4Iv6Tj8DA
	qS2EJJFzQElC6L3h+uoPQbqV99YYTztuBR2Nt52tiXna1odFPxCWWn0mx2zusl+ERpdrF18Lr+o
	neBdX073YFlqLXoSnzorlZwqOrOFbqlN5kwryj0L32jwZ6aGmkpt3YHsEdaxrjgtMLhsGl18vg3
	jidaLWZhYAkOajkFRKjLE7mMrZSJteCeXGJboD8cjTVNL7tZ+e9DaI438izxLbjYI79UuF2t4VE
	w+XtOS5yyLoUf8BqS24mjzLufBzQCCtlCdTVfHfaVYr5MAlOLES0xcrLeb+unTf7qqWbZwY6QeP
	mjdgZBd0yGhnzPp9TUTC6a6qG7eDPuMmVKWKLvJdQKxqZFgmRcfM1VVz0vJ5W/upGEdZ1XlnIlg
	IMc959YHiZI1IVrj7yZ3UHLs91ptRacPmYbwqUh8NXbDB6BJU8wqxAvml795t2DWQBavtNl9DWG
	DLtUZgw7Iaupzb4drJR8Z27BfaEDbjM7S+8/fEOMy4WSX7nd8CBScoynmkkoLVnR4YhqDjAXdd3
	VR3NF/AQcoiswiHFYWLiIb9nUcFZClXkNZruwZbPAfM/xp0o9zMWBV8NfE0PYAHr84OGZ6xlPO5
	0pw==
X-Received: by 2002:a05:6000:38f:b0:484:3315:1a38 with SMTP id ffacd0b85a97d-48433152785mr8141778f8f.28.1788039184984;
        Sat, 29 Aug 2026 14:33:04 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ae86-1b01-80e2-8851-4221-68d8.310.pool.telefonica.de. [2a02:3100:ae86:1b01:80e2:8851:4221:68d8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb33070sm12540616f8f.36.2026.08.29.14.33.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 29 Aug 2026 14:33:03 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: selinux@vger.kernel.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Paul Moore <paul@paul-moore.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Ondrej Mosnacek <omosnace@redhat.com>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Amir Goldstein <amir73il@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Baokun Li <libaokun@linux.alibaba.com>,
	linux-fsdevel@vger.kernel.org,
	linux-unionfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3 0/2] selinux: fix nested backing-file mprotect checks
Date: Sat, 29 Aug 2026 23:32:54 +0200
Message-Id: <20260829213256.51527-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch 1 preserves the top-level user file SID across nested backing files.
Patch 2 preserves and rechecks each intermediate path, mounter SID, and
file-description SID during mprotect(), including execmod checks.

The series is based on cf72cbb39da8, which contains
commit f2381b546e7e ("fs: fix user path of nested backing files"). Neither
patch needs that fix to apply or build, but without it the top-level check
still resolves to the intermediate inode. It is already marked for stable.

The intermediate list is allocated only for nested backing files. It is
captured at backing-file allocation time and remains immutable afterwards.
Capturing it in the mmap hook would require synchronization between
concurrent mappings of the same file.

Tested on arm64 QEMU with a small BusyBox initramfs, SELinux enforcing, and
two nested overlayfs mounts. The original SID propagation test passes.
Direct mmap(PROT_EXEC) and mmap(PROT_NONE) followed by mprotect(PROT_EXEC)
are both denied against the intermediate inode when that permission is
omitted. /proc/self/maps reports the top-level path.

Changes in v3:
- Add the intermediate-mounter fix as patch 2.
- Allocate intermediate state only for nested backing files.
- Rebase and retest on mainline containing f2381b546e7e.
- Document the BusyBox test environment.

Changes in v2:
- Add selinux_file_user_sid() instead of open-coding the lookup (Amir).

v2: https://lore.kernel.org/selinux/20260820175832.44512-1-kmehltretter@gmail.com/

Karl Mehltretter (2):
  selinux: preserve user SID across nested backing files
  selinux: recheck intermediate backing files on mprotect

 security/selinux/hooks.c          | 150 ++++++++++++++++++++++++++----
 security/selinux/include/objsec.h |  10 +-
 2 files changed, 142 insertions(+), 18 deletions(-)


base-commit: cf72cbb39da84b6f02f90c07f33b102fc10b16f0
-- 
2.53.0

