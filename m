Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793384266;
	b=QXk6zqBsU8m2uoY6RX9KmJIpk5raSHSbpBpUtz3ixubiDG5RkkjOt9iZ+z84bYLBbVH8
	 hAKt9w8/0ooS5n0ub4dX6oIke95RuMRNdwarziKCRABQFiRcdV4HB3FUsMnMArKR/yRSe
	 IQTj7PRyTnqczLbs/kVdOAxlBzG3wnnsWODXXoNtzN7w6F/czrAgEPHrUKwuk4JOl4feM
	 e4G1w2BprPmVTfz5n1op62Hy8j3VMtAEBZgAJWlMpUFNNcIREyiZT+0pIdqZV+Ot+r/Pr
	 kZJQZ4z9kaLd1O5Unl9Bl8nT2sH8kvIegXMwPsEz8jvkFIxINhTq2UqLmQNKCriRirQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793384266;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4Ccy6/ccBlrGrIhW2xqzP5senj2nJ8dZiTgtmFDaR5Q=;
	b=Lh+c2coT27IyCcGAfKCeaJQi9zsq8dLMbFrMdJrK35FWxGqnrPTNT7WyoYs1j45F+Clv
	 GxhMNE5e4S7A5zS8f070PEe8weuRnttBZ+jUxFz76cATQ8ivSTLKGkLhSSJfVStOH4Ajc
	 EFUCuteChsXQbFnJkYBuKuCJ4IH1etmXA3mcSEQ3YB++MEJL5ZWnRXsLaz2MIT9OJy+NM
	 I5atlA26s54r9cBPwVDmbaH75bHKYtjCbgItAdezxJ8GX1/bx9tA3tIJgJKHmSEdoJE7U
	 r/NpgLBR9I/gy/A4Zz9cKg4DWeTqoGf3FRLG38tfuMxbs+bN9LV8YezQPJvSn+TTvTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iZ7LLgxU;
	arc=none smtp.remote-ip=209.85.219.45
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4A0606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:17:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A4A0606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iZ7LLgxU
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-91b54d1e9cdso8842166d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793384265; x=1793989065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4Ccy6/ccBlrGrIhW2xqzP5senj2nJ8dZiTgtmFDaR5Q=;
        b=iZ7LLgxUmLeXQNNLhi8kuxZkkh9yvnyz6xI69DZcfx2lmT6yJpVbw00Ahn6RQn1BSY
         58PkaL20o8AI84pMqnr8xGjpGAmD3ZcqnPECDVcr9rr9HCz37nhruR6o0uby7sRg3U9P
         b7WYG64CN4RjYRFj/LFg6YBw1ukBOH3tauHWUR9coLK9WkkdcDVDhOggTaLJ8oPMNJ07
         SYhEc0cDkXmX5UB1Ybi5HPgeYkO9M7jnVMq7UbUrXbcs5ALHNDQ+NQDR9tFf/vdt/Hc6
         dsfQ9le9n6fxB0gXyvphVPw0L5YY+D0f2yoYCHTofVHRgpDF7l/IhwPicxomj+70xY/p
         hJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793384265; x=1793989065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Ccy6/ccBlrGrIhW2xqzP5senj2nJ8dZiTgtmFDaR5Q=;
        b=E+fOGkCAgIkIO+EApB0B2KdGsfk0kSDyNC8sMDMWMrbYoate9Vb3IhjvN6fPO/zVTB
         StFA2/Wwpc/f8y7ZzNZQTPbWaPIrWtlsZ51aSkNoDxP2J9KLDhEoJBYTQiGVCRiXQZIk
         PXKbCTWzjc3JqvABEVKcuUDKravQScPUgNztBFEetMhoW8p6hbIUk9VYZCmPJSLd9NtO
         oMUEUu20ou+YMHbhBmK/paswwRucftqLoR/3JnkAgk+GrjnwDAxPBiqegWFgQ98g/MVB
         FEEmp3bniR+VrjtAFwQa/oq2zi3v0z8z9/leFd5eVrnFayuhj+lucoQhCaJTI6OUtu4p
         F12w==
X-Forwarded-Encrypted: i=1; AKwUvByvIARnIfX/R4vYwJ3C0ydFoOqggOCm+6Bs8oVijO9q2FgQr7ejpg+tUI5qph1cHjg43h9Y1a/IVluk67c=@vger.kernel.org
X-Gm-Message-State: AFq9FYKeaJsKgJGUlict2i4geRvVaVmhILEeYWwmTcqv2WlT46C/miev
	hhe7lj2nrVUs51KgSyi1/kJQNlp+vn0YVxzn2MHj1aIK4UISJxAZtZBf
X-Gm-Gg: AYBFou14YfhygeKeWPm693HHXDGWAZr9iSUqJ0d1B6LN8DHYs1T+X4SUrpvGK7T/Yi3
	yZ5tfhbFAmUjGV4j0YtKl8zU3g7pObxFsammyU4Rv5XmGjF1YsF1/i9uQNUtp17yidnwkpGPctq
	jocPgtzMFH+t5kmD2KOn6LxD8WoFHN2ROE5p18Ww9/450/04jFncBHAtjDtbznemSXK78mQB/+x
	/vv3pK2GfpK3Gu4NHcXVRcbp6oIXBsuvrg6gr88heKC77qTH64Dl8SlzTV9W0G/iekMi5pvi3+I
	V9UQJEc5IPOicysJBkKhB9gXIzvOGq5H5JLj+em0HaLEa4dWAt9B8DrmzFjAmPnal0uwfB59p6e
	S0yCUw5xpz3DSuplcFq2Tp5BNg7fSv1Zm8htEvoWy9ZoVWM6yzVeyZjYhcNZhBp9dh8CagyRCuE
	xTVf2FWfCmlLKQUw/WVb6rSTjIWxnJAlZfTjlA7Cb13CCOrXmGoq7B0mhaC3i6AEVzocz8WpREy
	Sg52vXPWag1qZgYtURaH1htbuhMN1PjzlfMwae+gnf593Q2j/u65L9bSOZ9UMDtErDu0IF2lYbl
	RwbbR7D31hr2bGaqPvf3Ti3HxSjuNAKF0N5jygp5ptI5XXt0jnnV
X-Received: by 2002:a05:6214:33c4:b0:91c:7fb5:12fb with SMTP id 6a1803df08f44-91ca4baa7bemr49965426d6.58.1793384265093;
        Fri, 30 Oct 2026 11:17:45 -0700 (PDT)
Received: from zambezi.front.sepia.ceph.com ([2a02:8308:b10e:9400:faf:460b:2f23:8f6f])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca7f47fd3sm21552986d6.23.2026.10.30.11.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 11:17:44 -0700 (PDT)
From: Ilya Dryomov <idryomov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: ceph-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] Ceph updates for 7.4-rc1
Date: Fri, 30 Oct 2026 19:17:28 +0100
Message-ID: <20261030181734.3806816-1-idryomov@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Hi Linus,

The following changes since commit c03c1a14507dfaf8b856c2608f9ac216021fc222:

  Linux 7.3 (2026-10-18 13:14:58 -1000)

are available in the Git repository at:

  https://github.com/ceph/ceph-client.git tags/ceph-for-7.4-rc1

for you to fetch changes up to 823d21c78453fcdf58dbd8ecefbb41f4f3eb6540:

  ceph: fix uninitialized err in ceph_netfs_issue_read() (2026-10-26 14:15:48 +0100)

There is a trivial conflict with "ceph: replace PagePrivate() with
page_private()" patch that went through the akpm tree.  Tal's change
switches that code to folios, so the resolution is to take this side.
I pushed it to for-linus-merged just in case.

----------------------------------------------------------------
The two things of note here are the disablement of inline data support
and a new lazyio mount option to enable LAZYIO behavior globally
(instead of via an ioctl on a per-file basis), both from Xiubo.
Despite being over a decade old, the inline data feature never lost its
experimental status -- it has always been off by default and required
passing --yes-i-really-mean-it flag to be turned on.  It was officially
deprecated in 2020 and is now in the process of being removed on the
MDS side.  For now it's still possible to re-enable it in Kconfig, but
the code will eventually be dropped from the kernel client entirely.

Outside of that we have a number of bug fixes, a series from Tal to
help phase out older page APIs, some cleanups from Max and a large pile
of LLM-based hardening patches.

Xiubo is also back in a maintainer role, replacing Slava.

----------------------------------------------------------------
Alex Markuze (2):
      ceph: fix page vector leak on encrypted netfs read EIO path
      ceph: fix uninitialized err in ceph_netfs_issue_read()

Darong Lu (1):
      libceph: initialize CRUSH choose argument weights

Felix Hoffmann (1):
      libceph: reject mismatched CRUSH weight-set sizes

Guanglei Zhu (2):
      ceph: clamp the inline data length in ceph_fill_inline_data()
      ceph: fix out-of-bounds read in ceph_netfs_issue_op_inline()

Jiangshan Yi (1):
      ceph: fix longname buffer overflow in ceph_fname_to_usr()

Jeremy Jean (2):
      ceph: fix 32-bit overflow in readdir reply count check
      libceph: fix out-of-bounds reads from repeated CRUSH bucket entries

Max Kellermann (10):
      ceph: remove unused field `i_cap_migration_resv`
      ceph: convert ceph_inode_xattr fields to `bool`
      ceph: convert ceph_cap_snap.writing fields to `bool`
      ceph: consistently use `u32` for `time_warp_seq`
      ceph: add `const` to helpers
      ceph: add helper ceph_in_snap()
      ceph: use ceph_vino() etc. instead of accessing i_vino directly
      ceph: remove redundant inode number from ceph_inode_info
      ceph: __{dir,dentry}_lease_check() returns an enum
      ceph: avoid pending truncate during nonblocking cap acquire

Nguyen Ngoc Thang (1):
      libceph: reject bad connect_seq in msgr1 READY reply

Raphael Zimmer (2):
      libceph: Fix unsafe decode in ceph_redirect_decode()
      libceph: Fix multiple unsafe decodes in ceph_oloc_decode()

Tal Zussman (20):
      ceph: use a folio in ceph_get_caps()
      ceph: use a folio in the inline read branch of ceph_filemap_fault()
      ceph: use a folio in the READ_INLINE path of ceph_read_iter()
      ceph: convert ceph_fill_inline_data() to take a folio
      ceph: convert r_locked_page to r_locked_folio
      ceph: fix error handling when the OSD client is stopping in ceph_submit_write()
      ceph: wait for pending fscache write in write_folio_nounlock()
      ceph: add ceph_folio_snap_context()
      ceph: convert ceph_wait_until_current_writes_complete() to folios
      ceph: convert get_writepages_data_length() to folios
      ceph: convert ceph_submit_write() to folios
      ceph: remove page remnants from write_folio_nounlock()
      ceph: convert page cleanup loop in writepages_finish() to folios
      ceph: remove ceph_fscrypt_pagecache_page() and ceph_fscrypt_page_offset()
      ceph: rename ceph_check_page_before_write() to ceph_check_folio_before_write()
      ceph: fix writeback_count leak when a bounce page allocation fails
      ceph: don't clear write_congested when collecting folios
      ceph: use iov_iter_extract_bvecs() for direct I/O
      libceph: use alloc_page() in ceph_alloc_page_vector()
      ceph: use alloc_page() in fill_fscrypt_truncate()

Venky Shankar (1):
      ceph: don't fail write_begin with -EAGAIN after flushing old snapc

Wentao Liang (2):
      ceph: Fix xattr buffer leak in __send_cap()
      ceph: Fix mds session leak in __open_export_target_session()

Xiang Mei (5):
      ceph: fix off-by-one NUL termination in decode_encrypted_symlink()
      ceph: reject mdsmaps that claim more than CEPH_MAX_MDS ranks
      ceph: require the dentry lease record to cover struct ceph_mds_reply_lease
      libceph: bound mon_command ack decode to front len
      ceph: fix integer overflow in the snap trace bounds check

Xiubo Li (8):
      ceph: disable inline data support
      ceph: mark the superblock active after mounting
      ceph: keep the inode, not the name, when a dentry lease expires
      ceph: wake up i_cap_wq waiters on inode shutdown
      ceph: add 'lazyio' mount option to kclient
      libceph: only set read_from_replica on read requests
      ceph: check the caps of a closed file after caps_wanted_delay_min
      MAINTAINERS: update ceph and libceph maintainers

Yogesh Gaur (2):
      libceph: reject an initial monmap with no monitors
      ceph: don't keep a mon_addr string that failed to parse

Yuanfu Xie (2):
      ceph: clamp MDS reply result code to the errno range
      ceph: fail readdir when the MDS reply carries no dirfrag

sung byeongchan (4):
      ceph: validate fscrypt auth blob length
      ceph: bound name skips in ceph_mdsmap_decode() by the message end
      ceph: validate MDS reply fragtree split array length
      ceph: validate encoded xattr name lengths

 MAINTAINERS                        |   6 +-
 fs/ceph/Kconfig                    |  13 ++
 fs/ceph/acl.c                      |   2 +-
 fs/ceph/addr.c                     | 427 ++++++++++++++++++++++++++-----------
 fs/ceph/cache.c                    |   4 +-
 fs/ceph/caps.c                     | 377 ++++++++++++++++++++++++++++----
 fs/ceph/crypto.c                   |  11 +
 fs/ceph/crypto.h                   |  12 +-
 fs/ceph/dir.c                      |  58 ++---
 fs/ceph/export.c                   |   8 +-
 fs/ceph/file.c                     | 160 +++++++-------
 fs/ceph/inode.c                    | 119 +++++++++--
 fs/ceph/mds_client.c               | 124 ++++++++---
 fs/ceph/mds_client.h               |   5 +-
 fs/ceph/mdsmap.c                   |  12 +-
 fs/ceph/quota.c                    |   6 +-
 fs/ceph/snap.c                     |  17 +-
 fs/ceph/super.c                    |  35 ++-
 fs/ceph/super.h                    | 153 ++++++++++---
 fs/ceph/util.c                     |   4 -
 fs/ceph/xattr.c                    |  18 +-
 include/linux/ceph/ceph_features.h |  14 +-
 include/linux/ceph/ceph_fs.h       |   6 +
 net/ceph/messenger_v1.c            |   8 +-
 net/ceph/mon_client.c              |   5 +-
 net/ceph/osd_client.c              |  13 +-
 net/ceph/osdmap.c                  |  18 +-
 net/ceph/pagevec.c                 |   2 +-
 28 files changed, 1246 insertions(+), 391 deletions(-)
