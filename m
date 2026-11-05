Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793855659;
	b=VyZ/owa0aORKzQ7Xl+ZfbAavzPokJ+rczFELDBimmB+OvDkxz+8U1dQOtk05yUXN3mGd
	 bO2nMA9cwSnohn2DRgB2uHQs/guAUvNL9jSvx2O2ZthJ/84Ru2CA9zvZVl94dZNCy3Tto
	 eKOd4lvsthzL8NatRwNy9bTLWWQUbxl6mc79KahNIfEDBhUSYvNmKN+ecN9TSKXMGavOL
	 iXVfLpLLwF3omLKRd/3T0Tr6pv04H39EHgDby+1FladGYemzY3xFJCQNpkUWI34lqCDxt
	 YKxEyOHspKKteJ8SnQL9Vjw/MFasO6gnC1/65qIU6iV/N2Xdij5nVKRCv2pw2AH25vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793855659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=l1eSX+6egLtOu1lrQcTgUdiF++U+c2v1MrLX8sa3W1M=;
	b=RkBIPEI46AmWiy2cjFRWq+4vQ0Pt+eGi11zG8UOzpsw7MuKuwRmwCAc+p56pIcWEDUo9
	 vO7tMopQxyykpimobhMSVFS/jaNDVVHYUuq1+AQfLhKAxvrP0KGGe7ovmw3vkDAekuQrI
	 U4dwpCYYjk94x6ZJn8sq4qmnx5mRPtIZ1QuP5ga+9ViH0LvgyqQQJYB67QzQRkz2ze7Lc
	 zWX5fscmcrnHsC1Pst1gsUY1TpVAfQFxmU3TuBuS4AuNhjgit7f2h5ppLwtQhXSMhZjTF
	 q6PVMfiuH0Ic+n7rDWY/ul+TpAMrBURo+O8rX+ptmpAwSUMF+jHUGi44JrHV9ISI9Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o+unyceh;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AE9606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 05:14:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2AE9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o+unyceh
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-36caa19b0ffso865311eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 21:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793855658; x=1794460458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l1eSX+6egLtOu1lrQcTgUdiF++U+c2v1MrLX8sa3W1M=;
        b=o+unycehWeryTcRSxGc+h2Dc3fEnOliQuiQCdnsHRKUgGjU1AG+VdIjBDc5OJ68/MX
         Fpe/yCBi7FY+2rtIwDbdjpnvg/yefTvvXMgaRYbde75/NERLRS3xGmbER4QvbM/B5oY2
         1+9E0MDBPf48Xeld8f53td+67l3AHv/uaG3r3xbs2idFxelZ9CXTtNwyVtXG70aiK5y/
         ZW8T70W06hrYtvnuE/2WPgATmwaDKoafZjd1AT5DtdEmhZr80Nhf+dct+uOAQLwSkb8A
         g+ujz4/HpokjJTelStEbPwQ2duF7qjhwnyiUs2anNDhl3GIxwMkWB/Fgn894ykyOMDsR
         7Jag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793855658; x=1794460458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l1eSX+6egLtOu1lrQcTgUdiF++U+c2v1MrLX8sa3W1M=;
        b=vViRHq/Jq68+Owst6j14q7jbq8rhJEdte6IjSsgEQBYAzkwq9Za9VUKrR8hc9PUqUh
         ITPzAS9LOUdMjsL1fvLO4xgefAEgRZsOuwcB4GdX+bzcy6d3mcSUHaR/AahoH39dC1cI
         jz6Gv5NtcSbXpo5c+bkUjQ4eKrILtvQzMC75XTkitJsA4CH3I5T+ObOajoaTg5obzdf6
         m+nnHMHjRFmFR/S6E2IF5/osfGtzLEyYc9vvzau2n8hPeuEdN1txfheMmngak/4dC8le
         1PaIeOPyiwxGVKTXVz2fvSpePIyFa17BaxUdbIbGsKpB9vSl2jOLh2nvCV2pI6pKQFL/
         PL0A==
X-Forwarded-Encrypted: i=1; AKwUvBwBqeoH1zNi8FSADdFS7b0A9yvTymAPycEHiPt9VrBJCWDINXtmrSFKmdtrCg+uCs2bin+N24GDKJkoQBM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YlPll76ZLo3h8va0ko7I17+6UOs20VSB3IKUGl/otLma9rM5s
	e2FAUbomUOy91PzKwDJNoMq3ZFzjjAxdgIx6U1dFLaEUP0dhQ7v5ZHLo
X-Gm-Gg: AYBFou0zp3JBIyj3OrVrmZ3spiw6LGELMQVt77QSOfFrLsRnY5nWM5BDAIOtdJGuAWa
	GV9ywdi1c+V4LvL//WVeGZNoGeLn7NZ+T1Ar2Y0nhyylTSHe/KSQc4JoSx3+Y0sCoTXablnYFDB
	pxX+zwYW3RTnXAbUbdQsOpL6b0pKitIufkHVP4r2g0yNYVY8hZ4aa9H6u2tEQK4NjcpyQHNj0c+
	qjX+213HDeOiLoBKXcJR5yu+QQEtaejfQ9RaYZNr9BvrvtHjCBWP65aU2V7szMpTbs0vjpUam+U
	kMPtL6VICKbYECv1PZIfP9zwKN6z278B4qb7VAKxmbdP1KsWJKTnMQVx3Vsv8tuCG5Da80s4t5i
	Jic0S0Dh3cGmKIHlKkolaZl28bqkHbLfAgLoWOJVIAqHpMBsqpv8H/10EE37l3/HK69yFcomwap
	mgyRluiUGJVFHZxsXDbpEqxIs+o1RPDVwJwLD6cYaPFpeSwz2kDEYSg13qwQ+dONZyvn0IDGuhQ
	cvYC2r/AGSTCKT/imkcrqoB5KxGpxn1+PyLz3V4KFwv701S/FVVw4VtyS+0K4ofAnSnfLBt+/HR
	//93oFFe84KyXx0wovzPUnlQRphXAzop/Yeec02wjy4fVQPaDJ/SpvJhHDFEYn+PgI5ucVuMJXn
	rY6Dz0jY+ERAHDKIz212xjUmNAJRcGKPo/vCgxw==
X-Received: by 2002:a05:693c:6087:b0:369:f420:8679 with SMTP id 5a478bee46e88-36a42440304mr29748490eec.38.1793855657614;
        Wed, 04 Nov 2026 21:14:17 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36db94376b1sm6079160eec.10.2026.11.04.21.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 21:14:17 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: jaharkes@cs.cmu.edu
Cc: coda@cs.cmu.edu,
	codalist@coda.cs.cmu.edu,
	viro@zeniv.linux.org.uk,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v2] coda: honor the append state of each write
Date: Thu,  5 Nov 2026 05:14:06 +0000
Message-ID: <20261105051406.52442-1-dennylin0707@gmail.com>
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

coda_open() adds O_APPEND to the container file's f_flags after it has
been opened, without updating its cached f_iocb_flags. An O_APPEND write
can therefore overwrite existing data instead of appending. For example,
writing "Z" to a file containing "abc" produces "Zbc" rather than "abcZ".

Pass RWF_APPEND or RWF_NOAPPEND to vfs_iter_write() according to the
incoming IOCB_APPEND state. This also honors changes made with F_SETFL
and per-write append overrides instead of relying on the container's
open-time flags.

Fixes: 164f4064ca81 ("keep iocb_flags() result cached in struct file")
Cc: stable@vger.kernel.org # 6.9+
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
Changes in v2:
- Keep cfi->cfi_container as the vfs_iter_write() argument.

 fs/coda/file.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/coda/file.c b/fs/coda/file.c
index 6ca8bfcb58f2..c9fba41f7cea 100644
--- a/fs/coda/file.c
+++ b/fs/coda/file.c
@@ -71,6 +71,7 @@ coda_file_write_iter(struct kiocb *iocb, struct iov_iter *to)
 	struct file *host_file = cfi->cfi_container;
 	loff_t ki_pos = iocb->ki_pos;
 	size_t count = iov_iter_count(to);
+	rwf_t flags = (iocb->ki_flags & IOCB_APPEND) ? RWF_APPEND : RWF_NOAPPEND;
 	ssize_t ret;
 
 	ret = venus_access_intent(coda_inode->i_sb, coda_i2f(coda_inode),
@@ -80,7 +81,7 @@ coda_file_write_iter(struct kiocb *iocb, struct iov_iter *to)
 		goto finish_write;
 
 	inode_lock(coda_inode);
-	ret = vfs_iter_write(cfi->cfi_container, to, &iocb->ki_pos, 0);
+	ret = vfs_iter_write(cfi->cfi_container, to, &iocb->ki_pos, flags);
 	coda_inode->i_size = file_inode(host_file)->i_size;
 	coda_inode->i_blocks = (coda_inode->i_size + 511) >> 9;
 	inode_set_mtime_to_ts(coda_inode, inode_set_ctime_current(coda_inode));

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

