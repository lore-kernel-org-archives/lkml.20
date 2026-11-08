Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794124451;
	b=24yHmYcrMPyji3gCUi2cFUEw3RF9qHoMQIyl2DLpfLnKUt4nbXkmCPw96cU0+dU6mYuW
	 AOD02Hs9j31lPIbUdU4Am7OttELSV9fwnnvJoOH6yBzzyhZbjXrNV05QK3wAJnORSE4W5
	 UmQVMX99k4WbtyNtPydWgQXT00hieCvUQgQBkt0uBd/1ZXE/GwQ9mxr6Gs1h/tzsCTyQO
	 /1pC4eTFSNwspMNUgBGjF52mT5JT/esnDYBsZ/CnoI39QTtmNYLsetFoYqxYaFE8J8ycE
	 THfg2jirqC2dhR6lNrktxY0lVYQMkigCx8MQMu4v7/HhjlKRvzbt6+cTqPws4J1OJ4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794124451;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8tBhA04OZW48u2CYSoRKHfkBmCLrM00ptAagGQEc3QE=;
	b=sZfxM5gciFTRlhp/+T0iLnrs2O2CRYeLi3UwlR4d+kvE7+WTtAajvBlbG73X1UnH16Ld
	 cFgsae9qHF+E7dXC3tighvGCbmtIXe2NpqXViaXLL8HUqKJrTKlBiqzilGvippuw7AUOT
	 oPdUppzYO9ysZkIJ+SBc/4nCDz+YPETsSY7mbM0pxk1SSOvaiNVGzXjBjwz9fINmV9WF3
	 51thC0WSNySMOpBR6HXb2Qud3JhH0EsewkM97K/099Pn6WwxDpzHmZXwy6VfD6FLHtsiz
	 UrPBahzOzVHF2Zl/jozgxL7O2oXQr1Vc5AlhKwqoNs0NxL67BabGX52QP0Z/ktO+e7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="i/sDtTbG";
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0469606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 07:54:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0469606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i/sDtTbG
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-33e5ae86ff2so154584eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 23:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794124450; x=1794729250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8tBhA04OZW48u2CYSoRKHfkBmCLrM00ptAagGQEc3QE=;
        b=i/sDtTbGL+2267Y5l+x2Jgvf9uKniNyUYqBo43wRpqI3BXpR1Ra+ZRe7IqNSsw23Pn
         dy2dUwo+DSlR5UW0iVtSNG7nt/Ougwc6CSiG5OeSL4iqro8c8ugcOC0jhGPufJXB0SU1
         QkNT2nQQzxmUYpHpgqhDw04LjQMrKUGa6yPMwJ4NgATZNSMTeIFs88qeAiVl0/Nc+TkT
         hetzFTlcfzUZy9w4I8kO7nds1GScD/nMADpqlO3kjXqx7FFXqR8PG54ZqUxz/Cm3oNyy
         0iMidBDAJ+e/9lV5X1H5SSHUm9EMshuiBeXJFDwW6V998U++m8hVPGRmzz6hQOGMeUbb
         zrNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794124450; x=1794729250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8tBhA04OZW48u2CYSoRKHfkBmCLrM00ptAagGQEc3QE=;
        b=XrrJuVeC7r8Pzt2SeMNWDLTHHwMDhqkaAPeqVzcbShAi8ebDvTAx6b16/onR3yw3Mo
         NESMP9DCuF3AX+18RZoy/8jw69S5S1F0hCaV2WkePPQAP/9gN5iLekyebM9rswQlcwMi
         fo+LoUkaeEGLJLlipBh6/ZzCoTILO8isHaufQi5hcD7rS6XBy9xuQ+hvIfyiAZCMdUeo
         v9XO6LgkGDa9j/WT+S4TiUzDgDBtDvD4ReB1uJQP+9OcYOPvhvz6RB74c5zojBBICS3d
         JuOFiYWYVc1sfPsKZbmTASS+6s4e3xMDqnkGkXmazudDlMWXY2tMN3rw/NUh1ampP4fr
         X7oA==
X-Forwarded-Encrypted: i=1; AL+hErFrD5Aco7+gzTo9eOdwxVIeAz3JwttKhvcBvRAvLJg7OnKNowG9vjA58IW6i4sZzpJl0dMlazA+g4znpp8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9k8Xhbmwnsr2UpU2cqry7kWdul5bTonNaL2pRbYAY5xnsSA4P3
	8c2qn7Okz7PjAjfG+/FuLztce4ZxYE2V5ym1uBUfrQcUl8l3USJQBQD14K3xi4rut9Y=
X-Gm-Gg: AYBFou2Z9fSCUp1/ajexsPI8GQYmohTrwe3nuunETXT3eggwGmYB/+8Jcy8e9pDBc56
	FDiHnCheaevuWtCA/CKTVjiKE55/fF2JYcifa22SirSwt64jp5jrArXgR71IwmjyPbWueIjMNu8
	vSfwKQnGciRmibtwnZqnHeFZt22bPDUaCnOmdtPpRpnpOD+YXtPqnw3XGfxaORK5uBVARi519ua
	cGfS613J+b+SjWy9ivVN4tb23brcwPnuFtDu5Gg4txVjxAU8hKHEJjeLAXnilhfGHOT+iSfLOZt
	6ALJ1+tsZ9UIwQmyW21vpWUS4cQbpYYpN6XlLBS32Yy8m0WOYKE3sJIj1cZP46UOv71aiZAeanj
	e57MgF9QMfI25rU6fl9npJjLoQnZt+L5O42ZjlO35KTGbvrnjvQHAXbW1hCYd10w7KoCnLRuZzu
	+tynIjGDuK+ssPpxeyhk0D5hhMi8WhuSEes0FRQ8wZY8U0xuQbtNFVZWc7T5aGjXAkYYAf/W4Dk
	KC00Fm+6/uuIT3qgADMqzeSz3aF2A2WBAAsDYje2fZbLavZke1E2PdS825PPKQPnH9vZivWVG6P
	eIVmxJNhCirF/HTTIuWnGvIAp/TGu8mtBiO6LX38lSRktpfInmHMUiKuPHVCD4haGSdPUmOXLqh
	UMU7w1MAe9C78z9yGe25DhZT7JBxckkIyi7SrWg==
X-Received: by 2002:a05:7301:d80e:10b0:36a:50ec:db3f with SMTP id 5a478bee46e88-372575c557amr2132822eec.7.1794124449668;
        Sat, 07 Nov 2026 23:54:09 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265ff3415sm3310760eec.18.2026.11.07.23.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 23:54:09 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH] f2fs: require CAP_SYS_ADMIN for fallocate on pinned files
Date: Sun,  8 Nov 2026 07:53:57 +0000
Message-ID: <20261108075357.43331-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

fallocate() on a pinned file allocates blocks without zeroing them, so
reading the file returns whatever the blocks held before.
Documentation/filesystems/f2fs.rst describes this as "zero or random
data". Commit cad3836f9eb2 ("f2fs: allocate blocks for pinned file")
added this while F2FS_IOC_SET_PIN_FILE required CAP_SYS_ADMIN, but
commit b13bdf03bb80 ("f2fs: allow all the users to pin a file") then let
any user pin a file. Since then any user can create a file, pin it,
fallocate() it and read back data of files that other users have
deleted.

Require CAP_SYS_ADMIN for fallocate() on a pinned file. The documented
use of these blocks needs write access to the block device anyway, and
Android's gsid, which creates pinned image files through libfiemap, has
CAP_SYS_ADMIN. Users without CAP_SYS_ADMIN can still pin files, but can
no longer preallocate blocks for them. fallocate() on files that are not
pinned is not affected.

Fixes: b13bdf03bb80 ("f2fs: allow all the users to pin a file")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/f2fs/file.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index e2c0f5083313..d1b52b41a1eb 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1973,6 +1973,9 @@ static int f2fs_expand_inode_data(struct inode *inode, loff_t offset,
 	block_t expanded = 0;
 	int err;
 
+	if (f2fs_is_pinned_file(inode) && !capable(CAP_SYS_ADMIN))
+		return -EPERM;
+
 	err = inode_newsize_ok(inode, (len + offset));
 	if (err)
 		return err;
-- 
2.43.0

