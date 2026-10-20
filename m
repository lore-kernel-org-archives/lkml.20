Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792507645;
	b=DZjrrwi6X1k/wWpl3BenRyX26nnbq2x1prBXTE+ziOghEkn1NTzeUgCEXorerUkg4OJl
	 WRtrPaKTst+QEJHdnIipUgG/kgS+z9jRAFgkGt/FFbhH2CSwqy3PqzAxIEGRqFhxgBnhC
	 29es/VI7wM3tF7uwvnAyDM6lMDNvvTF7IAE1sEnOx0GFXYEZLGgxVPBxU+Ch/ftiSyJ18
	 OdO9I8N9p+pCV6f+6CTnwv51ekgdMk2DRrhXNIWe75OSteDKY/buKoaiWJbJgSOQedTH5
	 fCXXFYqwENx5HtgHYBrfjEPct+rdmajLXb0PHD7fNATSBUi7N1+1pOFCtkqS3kUVcnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792507645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mML0rlUQf2leT75dFk0AVhURG3XCgO5T9MI2E8M1gKk=;
	b=bVnKYxj3TWQG0jte3GO2o4NhYXSqJqOh2Sc1RHJh6J6t91Uergejrq/opn5bSTWLTVFx
	 ZbYVMEu9IeZHqr/0IhvdK+QB/2o7rvtWOGQSHJdirDKPWzPboI94NvncdZX0FgKyg5+UZ
	 cEfIXjqW3XEk154nbadT6jG75FRvVzol+Ph6TJ4CiB1ARvK5adBB9P4nqYdNKGkjN0Vfh
	 c7gfzn4wqFloEhG/t+rMwRTJG3tslGEmqfWb9jeRIx3gu3NluLU20AgFw4y8PyngbpQOk
	 zZNA5tdlrX5fWKyvrdbQjL26g8PRBL7Qn0rNiacSrtPV0UXNvxH4stdjqYoFmfRDwrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=JLw9Ve2n;
	arc=none smtp.remote-ip=209.85.221.179
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C24606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:47:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0C24606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=JLw9Ve2n
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5eaa1b5b84aso708835e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792507643; x=1793112443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mML0rlUQf2leT75dFk0AVhURG3XCgO5T9MI2E8M1gKk=;
        b=JLw9Ve2nd6OfWvxG65xg2MVU2rKv5+TPevMJy+St78VqfCSDLsDR0ZMmXCWQVDCt4z
         4X7SuEfP/eOYVkT2WlQAxBn7oPePhKX4T4Oks4X8Z1/UH85qwYrZ49Ugt75mz4vW4vOE
         5tE6yz1zZ3zBF5vYB9SyHPBkoznuHLqbemggwt3qBV3q68pShx2LmlsWZwuHW0VPLgsx
         gw1NgI46R2kv9ofC96ehogelRjsrVn+88yfGOM+mdA6FNJxjmWMh9oLMCGnGhzOMCsP6
         wJZhwj2niZiv3FK2I8ns95OCdCQVSY7cqTpAfxb7TK9VooMPBhpQGef+/rWSDHY7f37c
         fDCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792507643; x=1793112443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mML0rlUQf2leT75dFk0AVhURG3XCgO5T9MI2E8M1gKk=;
        b=m5B0ChftwDKW8yH8hyqWd6dwnLq8wWn8KckEXjIJv+GN1avDEeFg57poSjKhspdVkL
         zJHr72aSDfOueakOTVksovxTGO8lqsoSOTygVDajvArHV7Ck+2nb4FgNGmd39jfoa0mC
         W2cjNVbt3gP54f4SrWyyy5u5TT7S+kh2YRj3g24F2WvqzQSvdwXZw9nW5tW1hlAg5aZ9
         sbp8aLHFJ76mvLMUy4+SzLqnEHqpkUOLXAYJPrH/CmNLFDO21wPrvGNkZlHQ4BLuPJIR
         axNlvv54OA1SnGtaE7OJlmWWcemPUMWXEnJUORLVpLmoRYTzZsA+0QXq/ftGjngqYyco
         hbbQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFKzlZUFA5FM449xmIvW3gvEgLb0tUMBqEcekn44yZIkkzeQ7A47iRzeLbvpMplSVjA4+JY4GMz2zqIoc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKlvrf/kZ3o2GJkBHG+T21j8iYQw51/jqP//7ar/AlqeH/N8d6X
	qggHU+CsZmLIcfebRupNQT/OKQukxDKE2080w7exi107HZVRq+KP2RHbnts8UVbEZGw=
X-Gm-Gg: AYBFou1Xga5KA/rc/siB4uknKDE9y5y1QcO8hr3itWhnxEtEgRA3kDV6scxQz9TGj7r
	dN1tadM1eprOsjh6jG53uFxksLiYPFF4ZJ5gjYQ78E5OwFp0mSDvDHgjdF6wE28yUvvwq/yIt5S
	xjBLEOCKGy4m9U5R5yVdhWhk8fFSVrL+cusgA6IpEn3UGC8ejmLWGnsEK3oW6V576uhICrAa3yb
	qd06NgVT6rUIBkWJIw1YtWDMDXgOz6CxiTCBOickyb9BlI8Wj6OpMILowKz685iy39bgznzUqnX
	MuZYaSj2bukF02sITh16VMlJ0VioGNqrORayiMkTQVH4SxzeNNixEaOFAxepZJnWXLop3VnTj7r
	HJfpeB4C6bASXcvjRA8qoTdXhy4Q8OLbhD0otDYNoGluoF0OrpnDK8itBpR1pCc8khCPFDO/Gdo
	0tjEyUhLtSqBAqayM23Mizj/a9AL3LwMlv3u07owEY+lpBqfA31MB/kFuQ5ZvQDsUXrRtoM1BCv
	ll7nlcvbI2rNqi0YHlY5Pk+8osMOng96e7e5sHxMOmvx5cIFdL9ge9yx8KtMc1wC9Jv4uThtC/F
	cN5cpMV0IVJb81imICc7jqBxwSCKiq3AL1rlcccD9zJeWzPcWYMN/WK1/up5l4uzKOEfCI0F9mO
	w
X-Received: by 2002:a05:6122:1790:b0:5e9:5e79:aa5 with SMTP id 71dfb90a1353d-5eadcb1713cmr603117e0c.7.1792507643385;
        Tue, 20 Oct 2026 07:47:23 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b536ccdsm12920421e0c.13.2026.10.20.07.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:47:20 -0700 (PDT)
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
Subject: [PATCH v2 0/2] liveupdate: Add LIVEUPDATE_SESSION_FREEZE ioctl
Date: Tue, 20 Oct 2026 10:47:02 -0400
Message-ID: <20261020144710.4154339-1-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
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
 kernel/liveupdate/luo_file.c                  | 73 ++++++++---------
 kernel/liveupdate/luo_internal.h              |  9 +-
 kernel/liveupdate/luo_session.c               | 82 +++++++++++++++----
 mm/memfd_luo.c                                |  5 +-
 .../liveupdate/lib/include/libliveupdate.h    |  1 +
 .../selftests/liveupdate/lib/lu_utils.c       | 10 +++
 .../testing/selftests/liveupdate/liveupdate.c | 49 +++++++++++
 .../selftests/liveupdate/luo_kexec_simple.c   |  8 ++
 10 files changed, 202 insertions(+), 63 deletions(-)


base-commit: 27be83a12b246b6b3783e7d3ac5c378ff7520f25
-- 
2.56.0.212.g129ede20d9-goog

