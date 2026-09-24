Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19AF224AFA
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 01:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790214748; cv=none; b=e0kBY3V/97s3YXGWBI8p9POazHD1DgXUx12JOFipLtNvcflUnsS9l3KU6ffIO66quq4OfpspUvnSXuO48GIhBkVGVQcx1VAdmo+jHsJJgfAj/XX8G/zEsf9VLgph7g0L5eyinKbuSeg85XNw+l92XT74ThE4e7nutDSFfqgp0uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790214748; c=relaxed/simple;
	bh=2AN5JDexXR0M5Ug219+5M3aW0kSIne4l8lhwTAqdt58=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jZZqbhVc4tot2dG0F4786e19mDndVBg9pMFVzrwh2ReI2CSPZvJOHqsNKkOROGq6zwv+UZC9mCdNUXa115N85qhqt2bp+vMXx8SVB9z0tJ004YyqKSaR1DOxsfoxLqLAy9dZG1RaBHAYXWTv4Yg38MLSU6TmsrWXYn7cBTXILvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FKJkSc4p; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FKJkSc4p"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-469fdb78b1cso883597fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 18:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790214745; x=1790819545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t12Cm9dzTRFqVp9C1qDd5ZGEFH0SLV6oC9VZTij9C0k=;
        b=FKJkSc4pf2h9W646Wn4nJIa1ZNJUnAs/RtmGaWSQmd3D6wdGiGXQxA/fF9v4z8RL6N
         q6E3h4qrcbKsk/W20sJw0Od6cncOpaXBZh2DFZtv2js/0zvobPDXn9hg0uT43wdegWjE
         sinyWFjGHsQ8lhl4mUI/ICtFXPiUyg7hDvBudBfyVKyGq/U3TKbYb/Zb6xCs04Wx2dz3
         QNKWOIh7ciP9lz+B/HC9QlFz27vz83Tfv0ID45YjrMr8BYE84sPwa0AcE6+iGk2YK1rq
         x+v/8G1fwsGUMRk/oNoyv1cfVYHOkZQK8ptEJFrxSIt2EB7K13XSQYjGbH6cWThfo08t
         sONg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790214745; x=1790819545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t12Cm9dzTRFqVp9C1qDd5ZGEFH0SLV6oC9VZTij9C0k=;
        b=eXgu2Q7k7hRHO+kiWIP2WfNaA/Xd6a0fvN8zJMM6Y7iQCoglZ1+7SLWNTr5gUmVo3x
         +cXsJOpPNpLDC71nRFTgUwzjCtDwfaJGLiKTyz7m+5SGmIxLn0pDGUNzVKYBMcKIIUAj
         oz8Tav1VoPOCDxxsxldMCBbff35Mj1HHnn6ERfEXb3HWA7Mj8o44mwt5VQruNli6W5zn
         cubw3AYOJc7ITjgo19BRXaL33M+HxhiiOW8PqeJL2CcklCEkS28CO37SJC86geRuwWYD
         69TIWO3fs3g2F1TYZZiq4yMCW6zghIuPMAl1EaD2g3nlY2oM23KZqPbxNMTjyifkoN9o
         nabA==
X-Forwarded-Encrypted: i=1; AKwUvByTvJ9FksBNNZhfJA7tPj9T3h7maGSG7n0GYjUTOZOJ2gVlJHvmYHkAHH5Y9VNJ70OFTb+QfopJxjkHYUA=@vger.kernel.org
X-Gm-Message-State: AFuF++lSqlZF870HiDbDMN1wXSPa+9MGRvQAYqmhbaedqfWjfJC/FyaJ
	648j2bNTwBpYaaCkk/oxk37jYMXlKphhBe7MmN6YgUCmawqM8pSKFcXf
X-Gm-Gg: AYBFou2gLASqReO4d2kaRVOTqsEaafFiRGA1ZfFzE0gHXp99fvZPIMO9ufkPqBa+oF8
	NX/Q/jTLB/DUggXsJHOxgT2XYUIxKduPi6x3qBbH7ei+X2PVFf7UdYv6munisPZfWF3bxiHET0R
	ClV7uqLn1S1R9z8dNWSkujo3fCBAkN73INviQGFNGdxoj0BXVTxN1jHUbYQ2lmND0wEb669p/cd
	kQ+Qdt8t+4BtKzVPwBylRlH5QAZgwFgW+YLhRBf2AJDB/Tdt9VoPZHRc3KsRdWo0UObomq2Gnzz
	xi1VF4boGWAS/sT8AsQWTjnsfb0ieCW7v8EMjlLmB6rQW2lDZPog0ju11LU+7a6qYOZjKleiEUd
	GwHdkEvpi6sLGtH2McFJKl/eg9RDi3++izgrkgFAtMioVUJFZm4tZF8kU0Xjm1B3fpV3WNqEvU5
	1/abh92sb0JRYZl/jUmUd2f1YE0P0+0OGdXnyOPJIvZYE2cxfEQEqTTIsNBM+r7b2nXiYG4eoVr
	YOPFUHJBQWGhBr4VSNdwWeOwnvl7qzt6nZ0FTCS
X-Received: by 2002:a05:6870:ad0f:b0:491:47e1:6283 with SMTP id 586e51a60fabf-491e59d1afdmr1152781fac.27.1790214745549;
        Wed, 23 Sep 2026 18:52:25 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-491ed1ebc62sm1057379fac.3.2026.09.23.18.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 18:52:24 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Willy Tarreau <w@1wt.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Shuah Khan <shuah@kernel.org>,
	Sven Schnelle <svens@linux.ibm.com>,
	Benjamin Berg <benjamin.berg@intel.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH 0/3] tools/nolibc: fix readdir_r() and the FD_* macros on 64-bit
Date: Wed, 23 Sep 2026 20:52:19 -0500
Message-ID: <20260924015222.31693-1-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two bugs that only show up on 64-bit architectures:

- readdir_r() truncates the directory offset to an int. On ext4 it
  fails within the first few entries of almost every directory (since
  v6.19), or returns the next-to-last entry twice and never the last
  one (v6.15 to v6.18). Patch 1.

- FD_SET(), FD_CLR() and FD_ISSET() build their masks from an int, so
  they use the wrong bits for fds 31-63 of each 64-bit word, and
  select() on fd 40 fails with EBADF. Patch 2, with tests in patch 3.

There is no selftest for patch 1: it needs a directory with large
offsets, and nolibc-test only lists /proc/self, whose offsets are
small. I tested it with a small program that lists a directory with
readdir_r() instead.

The series applies to nolibc/for-next f2212892b6a0 and is independent
of my WIFSIGNALED() series [1]; the two merge cleanly.

Testing, with GCC 16.2, on x86_64 and i386 natively and on arm, arm64
and sparc64 under qemu-user:

- nolibc-test, all tests: no failures before or after the series. The
  only difference is the two new tests, which pass. They also pass
  against glibc (make libc-test).

- On x86_64 without patch 2, fd_set and select_high_fd fail (select()
  returns EBADF). With the default UBSan flags the run stops with
  SIGILL at fd_set instead.

- The readdir_r() program, on ext4, on x86_64, arm64 and sparc64:
  before, it fails on /etc after 4 of 213 entries, /usr/include after
  1 of 1454 and /usr/lib after 2 of 6186. After, it lists as many
  entries as glibc, and on x86_64 the same names. A native i386 build
  was already correct. The arm build failed too, but only because
  under qemu-user the kernel sees a 64-bit process and hands it
  64-bit offsets.

- Built for x86_64 against nolibc from before commit 4ada5679f18d, the
  same program lists a directory holding "..", "code" and "." as "..",
  "code", "code".

[1] https://lore.kernel.org/all/20260923205622.1123270-1-danishkhateeb03@gmail.com/

Danish Khateeb (3):
  tools/nolibc: fix readdir_r() with 64-bit directory offsets
  tools/nolibc: fix FD_SET(), FD_CLR() and FD_ISSET() on 64-bit
  selftests/nolibc: test the FD_* macros and select() on a high fd

 tools/include/nolibc/dirent.h                |  7 +--
 tools/include/nolibc/sys/select.h            |  6 +--
 tools/testing/selftests/nolibc/nolibc-test.c | 54 ++++++++++++++++++++
 3 files changed, 61 insertions(+), 6 deletions(-)


base-commit: f2212892b6a0c2adab438783e9fa8093c90786d7
-- 
2.55.0

