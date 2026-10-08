Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8DA4D17BF
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 18:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791482848; cv=none; b=iQ2yJaDw7TSHNWHMWwJphO+gN1DwJQL78WfjqeQeCzCDOiauPYOVYIIVp6ed/PdxdocTxjpcWhNFZF1i66ImHzstWlQyN3XP9XtsHkPvNwZpiOyoi7gJDy30VkGHRjgzxQS8vuaOe2V2H1rQL0cwC4OYSnDIWfhV4WSahPUjgjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791482848; c=relaxed/simple;
	bh=VRTrMnRCtIFbD2EyB6N5w6LrzMeEzaYWJ1e5rAtXRnk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XJwDZ7yklqStawuEysv50s6ru4mKQygg0I1WwlcD7G9U+gkRCx58L29GgYU9lZrQPnyiKCUM8o/ehyvmaBVZQIpLtOqiI6TL3UnOdLyOeVWU5QG+fcgoxjpLGt++tA4ZghyHR/DUCwfCkuY+4dCA2Sx4z3rjabVwe4WaSgQs6s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PYZzvBf2; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PYZzvBf2"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc4e9e56e9aso1829726a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 11:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791482843; x=1792087643; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vx1hsDBsieq23jav84qc39RHrlNeTK4K/qIOXf26Ahg=;
        b=PYZzvBf29MHLgDE7VSxoI1H+U/kczGOtiuSEIqBbnTFlUsiakEdJLEpD7lMSk4l7ad
         X4qwK6mqCGQgcjwFsh40xizPLxk4onropzLURQCsy6iiKwQe7sWLnqPQLqA67dG+F4ij
         HnpstnhUBZTez6xsaygbyIL2R88eKx5OyN3kZzeaKtQIEUME+sm2TMRj6XU8Fo91yhT4
         3FRSCdLPpjMxD11PUthED9Fn1blsbDAWHU1bitwx9sJZKvqwhblE1HvI9WjK2Pa1unld
         wtOUQ4an09pKPXUrreCbmmcO5nwc10NwO72gDLN85lGYLOiAgzPw+zFYyvlHAm9h7m81
         YgSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791482843; x=1792087643;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vx1hsDBsieq23jav84qc39RHrlNeTK4K/qIOXf26Ahg=;
        b=KgcNPyA4JYqfCmwzpI4DH86bAVO1/Fc6X15rwHR5DJWF4Gvfa7lYT8qjX670YuKyED
         yTSA3xJAgfX9+hY1OI4QgF1HYKLyhLVXyVTN0eONjm6rKEmVUwrTKoNhajtFAo82HFG/
         ispvuiotvgKpJ0go9qcNjdABccEFVAoOA1dT7M99AIwxDTiB6IR30qmvNvYVKPxWtyhw
         ExHSqOi68jlRLLOJNZ8wXwQFiWzaiJs+hGiGfPStLQ+WvTIkoivIaydBlIRXBxCtIyWp
         CxD80bnvC2NNMCqKP9IYOhS8SX5OFd0swSril3MepmkEaeCflOI7wL0xV4hl95tEiAmD
         qCdQ==
X-Forwarded-Encrypted: i=1; AKwUvBy7ScrzHrqEdFRBtH2ciDhXlnCzh/Xmf6W6JePdGLD363fWe3+jCxY1ZFaiMFI7hHsxkog21w9YPfeq9iU=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3ETqWT7LOmDC7tTzKdLehbaMQauQbsZlsND06BI3Up9hyXooq
	qQALEpNuSdhdPJLcnCOpq14ryej/cH0P4VJhlAuAmBxDPhKKr68kgBJ1
X-Gm-Gg: AYBFou3MZE2p6Mzh8HX26xYXTcIzmg0OGWW0vs7x7mWOFkRwiPKt3oTSMgec3nsx9p4
	BUokDBdTMZ9ZAQvXPZ1JfHpjaSlbH6GGrEH8CHD7C7lQMwrrY3ZJwm03mDvVDHLplKzbDBepu++
	cNaDINOsEMnE8scWvrHgkLltxThPhlFrfE5UW79bCtdbr3Vud8URmZOxdM2ltvp3F1tq6oqBvvP
	yfcrqIpwCHvrVqTfT/hyohzEvtvOpLnLOvaFPDceJ+3pC8gGojE+fek2XHm3lDkSfc/jNyQFQT2
	VsyMeb6RxTGgfPIsCNGZJ8iddLBUcuRID/iyI30DBTeZau0Q+5SiYdSdWmhBkn3SqBLd/7zWt5O
	YdT42hXQ3BBTETVrzl01BnCgCvddOwG4C4NJPBdAuxEP37Qews4nugnumT003U+YqtUdEq4e53o
	/gxF//vQzU+SuWTnwEYcxAFRZy2nJB5ifBxAZy88Ncy2FN2e7/1g12fbZ3zzh7Ay9U37SOz9h6M
	JsUOSWZH5IPveiO
X-Received: by 2002:a17:90b:2243:b0:39e:6c69:34da with SMTP id 98e67ed59e1d1-3a8a1cea2c5mr5582516a91.62.1791482842628;
        Thu, 08 Oct 2026 11:07:22 -0700 (PDT)
Received: from [192.168.0.160] ([76.135.114.51])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab31fccd1dsm268530a91.2.2026.10.08.11.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 11:07:21 -0700 (PDT)
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
Subject: [PATCH v2 0/2] fuse: support per-inode open and release
 suppression
Date: Thu, 08 Oct 2026 11:06:43 -0700
Message-Id: <20261008-fuse-per-inode-no-open-v2-0-39c60fe97728@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALPbx2oC/4WNQQ6CMBBFr0Jm7ZjSgIIr7mFYtHQKk0jbtEo0p
 He3cgGX7yX//R0SRaYEt2qHSBsn9q6APFUwLcrNhGwKgxTyUgtxRftKhIEisvOG0Hn0gRyaRpD
 UjdK6U1DGIZLl9xG+j4UXTk8fP8fPVv/s3+RWo0BNrZS9pa637TCvih/nya8w5py/lZaIQ7wAA
 AA=
To: Miklos Szeredi <miklos@szeredi.hu>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>
Cc: Robert Byrnes <byrnes@wildpumpkin.net>, fuse-devel@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 Stanislav Kinsburskii <skinsburskii@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791482840; l=3230;
 i=skinsburskii@gmail.com; s=20260722; h=from:subject:message-id;
 bh=VRTrMnRCtIFbD2EyB6N5w6LrzMeEzaYWJ1e5rAtXRnk=;
 b=4xlDZOqYR1DmUGgZwSQ7y/+HVBLKUTM/oO7OPIm1JRzOuAmiQzYTKCrh2oAARzLuSEoBW4sN4
 NuVzaOuGKGYBhcyA57F1mp4GqOnJ+RqxRAR03KPNMfZE4W2vhMcuESB
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
 .../selftests/filesystems/fuse/no_open_test.c      | 859 +++++++++++++++++++++
 10 files changed, 972 insertions(+), 8 deletions(-)
---
base-commit: b018686719706a781c45a874ed51374a2dc4b767
change-id: 20261007-fuse-per-inode-no-open-d40e2b4abb8a

Best regards,
-- 
Stanislav Kinsburskii <skinsburskii@gmail.com>

