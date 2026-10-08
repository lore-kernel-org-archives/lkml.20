Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7123F3CB574
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 19:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487275; cv=none; b=troedDL/evkgnMWKR1stln0qDbhNmcix/S8WyAyQybLDZot2Gl7v4ofxHA9c0TkY5L0CIu37H469ISF9HzFT81VwlpGJl2wIbgjEm7/GwtDyrCvg9lLyi1O+Y1lazQD9k40TBeLMh9dGsuiLBMUfuN7IZT4W+4UonHj0OELk7B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487275; c=relaxed/simple;
	bh=VxmSFzIxYys9Dm1293JQJmz3MIscVEUKeKEhzEOVOCg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mdCyH78fE6BehPVPRCEydSYE311bWC48AzzGDGQf0B1rFEn2HTGeTU5jwWgNN6+debFoddb8TViDLAnbBdeVBGD9mjqlOuC1bjM7bnEEdJdEfzLG0HTDgsUi5eALqUC/EMtlnjm86gFK4T7scDGBHkZDp7++kjPGguqs+Q/C5sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kCoKgQky; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kCoKgQky"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e4af975346so32582505ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 12:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791487274; x=1792092074; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Qs5VklPvlwa8l6/efMoovQycx5WH3qUl2t0CUPqJwk0=;
        b=kCoKgQkyba0+LCJI+a0xSLdr8s4CBnaoRbn1vPL9qKWqpdVn8oECRZH/uvDovjWT+U
         vzcDl8dg2ncHWXd3xwniJWC60ObvTPcJsrdShGfU/YrVzOwM5Fwr/v3+7ztr4bJnvt6F
         72w4BeEiKcRYoizXOuYW/vdN2A8vt2h1il8/9wCg6e2Ii1eLdI8YceUXxxmf7o8V+gtj
         RZophagkEp1+H2u0IchSNPMKtWP7OAwvS1kZg0J2G1y44ThVVOqhMJqj63tS0AY6mRSB
         0wYwf+eHbvZKTEdTgHadZrecuAe6bFOVsSoKSbZ2KuXC+/Rewyev3R1oN78kxSbRFt9i
         vUyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791487274; x=1792092074;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Qs5VklPvlwa8l6/efMoovQycx5WH3qUl2t0CUPqJwk0=;
        b=T03PvP+MsEo/r8lAd/1xBJW/pKTU9SvbpjMebsW8gH8a/3KMKCEotZePwhH0yVqcIV
         eUu65ljDnb0cMBM6+9fsJSTVpkFoxMbrMy7NrSdysf/oX8uEjk+3U9wf8jdaEIG5jGow
         jbmpDq+Ox40PYyi14MAXyJ7jeprYXxnp5Dzmdy9moDwJIfN+aGSmPg0+5QE09PZiecH4
         +b7a4vK3nhrf5DOe/7hIA0DK/Tl7P3JkPTXTMoadIWGD4/0G4yyzM8QsjpKCWzGm7nKn
         Z2ISANfgSKJvNA7x3Xnpwhij69+j2X8MgHlf07PmuSuRzkCu1RLLPVARmMHrmHY9x0WE
         VTkg==
X-Forwarded-Encrypted: i=1; AKwUvBy484XDtkeTqycepZ83oi7CJZc90LZwA12KqPWsRt1/B8aJQy03L60+7RtdcVuyPxR6a5TlVYrDm6xJsMc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPK+yVqrr77iJuvGi6l21ptZipAPet3cHhemw8Xbh/l24au2dc
	8aLKzcqT3OyZpHlwYNhwGitdpceBud6mQZlp94ZB3OYZuusYdqDy7lhD
X-Gm-Gg: AYBFou03oHaTsJZSUje767XoKVcUaDGMf85mnF01D1N+xfmDtJCb85LKqaYpkkRwqjL
	SzRahXrcfF6SzKYGSKayNHofrkZRGWlYRSf2JY1Rd027WF58pVfNXfLaFisJoBV9KJzkDyrEGdy
	30WpMNLnvvmC4eg/emiCEXxWSSHdmZUKjcOOUTBJJ4JeZy7WxE+RalqZbjk/ARDs0aw0EROXiTx
	0Heavf6cwMSqO1jGPQEewTHJMbLtWVJFhk6M0qAyAuppzCVYfS3MrwiMKl3vMe1an921a7QhhnW
	gc6nrH9OZuNGN4Z6hena1txf/GYr4nk7bmd3J0YbtTVfC2nuva62PG/l8ue42ggh4hrQo0e0cM2
	tTag0A1XE4Mjr07xzHmROXKvyPPLprg8s37j4eaSnVqs4i4i2rPE0Idg0xLBUsX2vOFaL6GA6ej
	pajmq1Oea1I9LiN/eTG/37PJdtnTvX2ASel0l2XHVGswg8xnwjoB9Qpcru3njOorypllxemGFWv
	oWH8g==
X-Received: by 2002:a17:902:ccd0:b0:2e2:dc50:16a8 with SMTP id d9443c01a7336-2e60024ae90mr58909075ad.27.1791487273549;
        Thu, 08 Oct 2026 12:21:13 -0700 (PDT)
Received: from [192.168.0.160] ([76.135.114.51])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e83cd9757fsm811965ad.63.2026.10.08.12.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 12:21:12 -0700 (PDT)
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
Subject: [PATCH v3 0/2] fuse: support per-inode open and release
 suppression
Date: Thu, 08 Oct 2026 12:20:22 -0700
Message-Id: <20261008-fuse-per-inode-no-open-v3-0-99cfd3dbc06b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPbsx2oC/4XNTQ6CMBCG4auQrh1Thr/iynsYFy1MoYm0pNVGQ
 7i7hRUb4/L9knlmYYG8ocAu2cI8RROMsymKU8a6UdqBwPSpGXKsc84b0K9AMJMHY11PYB24mSz
 0JSdUpVRKSJaOZ0/avHf4dk89mvB0/rP/ifm2/iVjDhwUVYitJtHq6jpM0jzOnZvYRkY8MuIng
 4kp2q7mmtqmQXFk1nX9Alhu4TADAQAA
To: Miklos Szeredi <miklos@szeredi.hu>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>
Cc: Robert Byrnes <byrnes@wildpumpkin.net>, fuse-devel@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 Stanislav Kinsburskii <skinsburskii@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791487272; l=3691;
 i=skinsburskii@gmail.com; s=20260722; h=from:subject:message-id;
 bh=VxmSFzIxYys9Dm1293JQJmz3MIscVEUKeKEhzEOVOCg=;
 b=EbP2lDWkXPuvZpwXtmt2f67xqW1dt9F0VQ83jCAVS74HnVJzG7UBssuhzkMXYMpIKtqbanjqQ
 QrteFM1lkHeDE+/Fqq84AfTFvPOs5J5M/bjo3UPxmNDN9gBuctZStd0
X-Developer-Key: i=skinsburskii@gmail.com; a=ed25519;
 pk=bDpriHBYgeTdkIDweZDCemxsU93neJBOCn3YLIuJpnE=

For FUSE filesystems serving immutable data, warm-cache workloads can
still spend much of their time sending OPEN/OPENDIR and RELEASE/RELEASEDIR
requests. Data, attributes, lookups and directory entries may already be
cached, but opening each object still requires a userspace round trip.

The existing connection-wide no-open support cannot distinguish these
objects from control files that need the server's open and release
callbacks.

This series adds negotiated per-inode suppression. A server negotiates
FUSE_PER_INODE_NO_OPEN during INIT and marks eligible inodes with
FUSE_ATTR_NO_OPEN in their attribute replies. The kernel then handles
opens locally for those inodes, using a zero file handle and the existing
no-open cache defaults. Subsequent requests identify the object by nodeid.

Release suppression follows how each handle was opened, so changing the
inode's hint does not create an unmatched release or lose the release of
a server-opened handle. Atomic O_TRUNC still sends OPEN to the server,
and CREATE retains its existing open and release lifecycle.

The second patch adds a raw /dev/fuse selftest without requiring libfuse
support for the new protocol flags. It covers capability negotiation,
files and directories, LOOKUP and READDIRPLUS attributes, hint changes
through GETATTR, hint preservation across STATX, atomic truncation and
CREATE. The cases also run with writeback caching enabled.

Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
Changes in v3:
 
- Fix the title underline in the FUSE documentation.

- Make selftest cleanup idempotent and clarify harness teardown and assertion behavior.

- Skip STATX-specific tests on kernels without FUSE_STATX support.

- Return the mount owner’s UID/GID in attribute and STATX replies so mount-capable non-root users can run the tests.

- Link to v2: https://lore.kernel.org/r/20261008-fuse-per-inode-no-open-v2-0-39c60fe97728@gmail.com

Changes in v2:

- Preserve RELEASE after successful remote flock operations, including when
  OPEN was suppressed, to retain server-side lock cleanup.

- Document the flock exception and the requirement to accept RELEASE with
  a zero file handle and no preceding OPEN.

- Synchronize test-server requests before unmount to avoid racing with
  asynchronous RELEASE replies.

- Extend selftest coverage to 68 tests, including flock cleanup after
  SIGKILL, duplicated descriptors, hint updates, CREATE reopen, ioctl
  handles, and connection-wide ENOSYS precedence.

- Link to v1: https://lore.kernel.org/r/20261007-fuse-per-inode-no-open-v1-0-be5229fe89f5@gmail.com

---
Stanislav Kinsburskii (2):
      fuse: add negotiated per-inode open and release suppression
      selftests: fuse: test per-inode open suppression

 Documentation/filesystems/fuse/fuse-no-open.rst    |  49 ++
 Documentation/filesystems/fuse/index.rst           |   1 +
 fs/fuse/file.c                                     |  26 +-
 fs/fuse/fuse_i.h                                   |  17 +-
 fs/fuse/inode.c                                    |   9 +
 fs/fuse/ioctl.c                                    |   3 +-
 include/uapi/linux/fuse.h                          |  13 +-
 .../testing/selftests/filesystems/fuse/.gitignore  |   1 +
 tools/testing/selftests/filesystems/fuse/Makefile  |   2 +
 .../selftests/filesystems/fuse/no_open_test.c      | 886 +++++++++++++++++++++
 10 files changed, 999 insertions(+), 8 deletions(-)
---
base-commit: b018686719706a781c45a874ed51374a2dc4b767
change-id: 20261007-fuse-per-inode-no-open-d40e2b4abb8a

Best regards,
-- 
Stanislav Kinsburskii <skinsburskii@gmail.com>

