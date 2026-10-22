Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792634329;
	b=hekgRrrjc+28DpFlZZOvUmFjz3Q0DUuvQNAVrVGQJHi/QR/h4alW3csiXhvjAwELKCWd
	 fkwIx+ZQGCmLKSmpzKLybwq2jqPNP/KwsD/FIYtjhz++YQarbJkCJb2hBCLxyKXgVEI82
	 sK7YSDtf6YaI+S523CRMelEKTE19xNTaoofepgULCs79CYBnty6k7mOFetoPsq8cWnKWS
	 94GZOAeiOrffpePzVB5wqCSgV8VCAK3pWZMyF2/exp38XNJk6m2w8m56NgPRDT5rxjT9E
	 uLIldAFTJyiXvg2JodDvga9R2xz7yNYj2qOVsGc9HULqgwaueIJPosdY10PIXcVQQ3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792634329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HijCuOpDuAK6PXX4hhiO509M0K5rwPq4Jmik4wLwBWg=;
	b=ymcU3dRuC87ylNz7ssQGndZ5Ii91DFiONtdKZdA87zlkIhaW/uGTu8UShQq0iQWRwKt5
	 wRng55rz3F3vgn6YPCEH33wYt3SJoB+I5bqvC5b9PkuUfFRZ4882BesQY2Gm5Tg9fU+Cd
	 QG03euh8w94zthpg21GhAE9pL8Nm/OdhbBFWZ+j3ITAiYyGIchx3ObFrth5ES8WdCOHKQ
	 USwsct9IFq8fwhFLmyxiHCyFw96dtIn36eC0NgvO+LCw81snJa6XSHtS8qL1XpmiGhNzH
	 M2Boh3svdLd/Wz0C51+R2s+lafObIhekycjXCad9P9kHzuOsQQr75TYU913MVwpUX6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=ILYd2YrI;
	arc=none smtp.remote-ip=209.85.222.175
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22946606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:58:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22946606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=ILYd2YrI
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-93cb1c0e851so95908785a.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 18:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792634328; x=1793239128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HijCuOpDuAK6PXX4hhiO509M0K5rwPq4Jmik4wLwBWg=;
        b=ILYd2YrI9qIwIWCdoSXQ/yf8+4firDkwcRlIzKEP39SUfiLAhJkv4itz8By0QiL+Kd
         rD8RDzoD7hOIvbGKLfiDKMnDRkJNFl+xoHiiOk/Ruy2tYO9zDjDlyFs8ePUZkhGKuDuX
         CCbm6QhGx9uKUsVYqhWZSDE8kdmv6lBl6sHgOSUXC3Ur2EBXvtU+HcdcvTrcVG1DlkRU
         SJOLLRni9yGQ3JkmvKLXKCUD924DivrYXhXhJro6ZhKqjRR55XZ9WnCvmEkQ0F5tpm4o
         91zWN3hElWnI4Pr2ttxEyEf7b6m3mHwFQLcOrNX7g4k1iutCDDDshQP2L0Kbx4wbKhMr
         25pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792634328; x=1793239128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HijCuOpDuAK6PXX4hhiO509M0K5rwPq4Jmik4wLwBWg=;
        b=kbyf4m7m6M4beqh/Fq6KAoL++OZ+VdXEIkZ7b+n9AtRprBiJA/b2XyB133JYPAU7IA
         dbhA8oEoNNY5Ur9fPEGAnEyzei2JLtuajj17DxR29Nrdsy0li17kwK1JeGu00ymksU/0
         b1J+OdkGxZfNOcCUTKnahwq9QUiiCfr8qC/977FMmRyBb71pNPFimcoahZTl3M0v9LQd
         M47T0fth4EtzAx+haIn3EXK+HduojBaWDcqYnaPob9LBkCMbwUN7ZQYKBGOwJFQhRGXb
         JYyaeugNLV7ySuOPrcmRr/ZxXNKoyRUgHSYxyTovqkb55qhcOo/FzQI4ZYMrZkdQ6GYa
         0Hxg==
X-Forwarded-Encrypted: i=1; AKwUvBx9NoGr/BmMo0GJMlC8CLKdhG1atOj6VGXSTyG0eiXCiUmbdeRaxcSDx+AMn4XaD7hX9qzGcSbcMfgD53E=@vger.kernel.org
X-Gm-Message-State: AFq9FYIFEHa2hqcMuBUCyPFlL35fpAaAmf7S7jw+Z7bRhznQgq/NHJi3
	JPEKAhbgzXQLF+sNnJekHUcr+0NtkKTaOK/U1xSiFPjeWTM9Exhb5UCu6t58W2yPeL8=
X-Gm-Gg: AYBFou00tquBad6g0fd27O4+50MC6RyEIzlMuefRQrH99yc7PBBoy9NJIbqbfm68D7o
	ThwJ2fbgyPvwH52rO8huwx3WU8djc+Q7zim4+NKCDegLlfdGj3ziXvzb7rgosgLhsIu/ZGE75z+
	vRazBALOZOdQcCF9ypfCCNhTwgUZ+IU4wiAsdr15lFe87sPKVzribmM4BZUwqw6ud4vga+eeKuA
	9I/r5qcCT14gyawgU27GZZyqF36BVzpKnqS2oCPp/cPUsSWbygaQFyqHg7hDHV4TMBsQ8qcyUTA
	uwPoVlo9mCcoG7CG/pXqEST6wikMvdmsDsDlyqFiwntaCuSI9MQgW6BVX6igBB4ZGZMRBsqdTPn
	NY+4iFv7/ckV5H3eAMzRun47HWVLMBqjfCgvDT1i5TLo99MZy5ymC1Tz7HxECeALqOSwPqzdNxe
	sIXISb2MIgCcbpMddTXJqNaWWg82Cr6Wj1+f4gKDNcsx+IKCg2YdHoCPoUYWzLtsh6hE000Iw91
	2zVjVXkWYgLZJd2GvPzzaBmYtJZZdU+sQu/p2km8kuPgc8ze6k7MA6H5ufPssHfSn4twPhBK+i+
	97jxU7+pxIdL65bk9DXv3USumMdYBcMGYg9vbkvbJDTfxC5gdzqDVHmjZpUZOzpvSzkbGivZvJh
	X
X-Received: by 2002:a05:620a:2989:b0:93e:e4d1:797b with SMTP id af79cd13be357-93f57fac2a1mr783266085a.56.1792634327158;
        Wed, 21 Oct 2026 18:58:47 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56e247ffsm397383285a.39.2026.10.21.18.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 18:58:46 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	vipinsh@google.com,
	linux-kernel@vger.kernel.org,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	graf@amazon.com
Subject: [PATCH v3 0/2] liveupdate: Add LIVEUPDATE_SESSION_FREEZE ioctl
Date: Wed, 21 Oct 2026 21:58:38 -0400
Message-ID: <20261022015844.2795816-1-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
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

Currently, LUO sessions are frozen automatically only inside the
reboot(LINUX_REBOOT_CMD_KEXEC) path, where luo_session_serialize()
iterates through all outgoing sessions under global write locks and
freezes them serially during shutdown.

This series introduces the LIVEUPDATE_SESSION_FREEZE ioctl on session
file descriptors so userspace can freeze a session as soon as it is done
with it, rather than delaying until auto-freeze at kexec time. Because
luo_session_freeze() only acquires the per-session mutex, userspace can
also freeze multiple sessions concurrently in advance, reducing kexec
blackout time.

Once frozen, no further files can be preserved in the session and
subsequent freeze attempts return -EBUSY (or -EINVAL on incoming
sessions). During kexec, already-frozen sessions skip the late
auto-freeze step; if an early-frozen session is closed before kexec, its
files are rolled back via .unfreeze() before being unpreserved.

This series is based on liveupdate/next commit 27be83a12b24 ("Merge
branch 'lu-pci-preservation' into next").

Changelog:
v3:
- Renamed session->frozen to session->user_frozen, - Pratyush
- Added Reviewed-by's
v2:
- Rebased onto liveupdate/next (commit 27be83a12b24 ("Merge branch
  'lu-pci-preservation' into next")) and split out early session freeze
  into a standalone series (tmpfs preservation and its per-file user
  argument plumbing were spun out into a separate series).
- Patch 1:
  - Drop struct luo_file_set_ser * from luo_file_freeze() and
    luo_file_unfreeze(), and rename the session helpers to
    luo_session_serialize_one() / luo_session_unserialize_one() so all
    of struct luo_session_ser is populated and cleared in one place
    (Suggested by Pratyush Yadav).
  - Unfreeze the session's files if luo_ucmd_respond() fails in
    luo_session_freeze().
  - Update remaining reboot-only wording in luo_file.c kernel-doc
    comments.
- Patch 2:
  - Add checks verifying that non-zero reserved bits and freezing an
    incoming post-kexec session fail with -EINVAL.
Link: https://lore.kernel.org/all/20261015093816.2438942-1-pasha.tatashin@soleen.com/ # v1

Pasha Tatashin (2):
  liveupdate: Add LIVEUPDATE_SESSION_FREEZE ioctl to freeze sessions
    early
  selftests: liveupdate: Add tests for LIVEUPDATE_SESSION_FREEZE

 include/linux/liveupdate.h                    |  3 +-
 include/uapi/linux/liveupdate.h               | 25 ++++++
 kernel/liveupdate/luo_file.c                  | 73 +++++++---------
 kernel/liveupdate/luo_internal.h              |  9 +-
 kernel/liveupdate/luo_session.c               | 87 +++++++++++++++----
 mm/memfd_luo.c                                |  5 +-
 .../liveupdate/lib/include/libliveupdate.h    |  1 +
 .../selftests/liveupdate/lib/lu_utils.c       | 10 +++
 .../testing/selftests/liveupdate/liveupdate.c | 49 +++++++++++
 .../selftests/liveupdate/luo_kexec_simple.c   |  8 ++
 10 files changed, 207 insertions(+), 63 deletions(-)

-- 
2.56.0.218.g1ec904b173-goog

