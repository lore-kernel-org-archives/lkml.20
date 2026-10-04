Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9331837207F
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 10:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791109028; cv=none; b=TQJT8VgLlrWp4wiJRRrWH6Gq73tJLJQKpWOEYnr2uHVsHlrpWtLcjAhljN0pXs6b6V2pPGRvuNpCVCKEAv7kJm0QuAqyPQzj2Q5pnoKGlZrbEqUckqP6Gadd7HKhLWyGv751edMoCCDJNXgFsH9VTc4ojXIZCu0yz91zTVfLwFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791109028; c=relaxed/simple;
	bh=TqOTmq/yqt4X48ByT3CHpiQMcfSnIr6FZTijTvhLnCw=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=DTXMSWjt0i0593LSTB6isAsBl8Nb9oHkK+ZylAAXadPLs/v+QgRirlAXiuasQcljq9QnFFn3+Si+g16AZgE5vuz1hpm4PnI4uT+I9YszPTSHSIvQwQ3o+Y1GXp4EqeYi3NjWbbj6EQooyIVt2d84dpT+LIfZ2IjW1qMIgkOSD0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WhGhCdk1; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WhGhCdk1"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6baf77afso405725e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 03:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791109025; x=1791713825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OW15eEn6Sigou5G6oIcfaDItgZ8Hirf/PtUeQhnIzDY=;
        b=WhGhCdk1Bse4HMDh1yqDpzXVcAt5oolGHxv3LXshhYbdUzd7rxCBEzjcxV54Ts1mFa
         kbZywKPHd4HJu4yZlNy8EyGiAp1wTRstR64iPA7HUon8VamEYbehVfk31wzWoX44gPyy
         /aBddSTAkFoMYw6GnLppCqZn/Mzc7pELI7+ECi5XPHMWOZRmDCO+IC29XNgDzk5NzNus
         wFIyBwOu7ayxP50TTsY15XNtoXhb8JHl1SORXsJYikz6APV+GUG+EIm8CC0DJWgQFuXe
         sCcEh81CDSYJt1SvP2r1aGf4chJ3B5cm5sESs013uPR1OFt8b+7KaUXB0mITBo86MB6Y
         vo1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791109025; x=1791713825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OW15eEn6Sigou5G6oIcfaDItgZ8Hirf/PtUeQhnIzDY=;
        b=jkNseSeP51mzZsZiFqaTl3Sb3Qzl7R1NsW7tkvubWZ3VWLBzDwBMo9pWFwQ3/8JoTt
         AbcZzE91/cY6e2eCtfRiHXTvJKnpmn6AAJX55OXVZGsmPTge8VMrf9WRx7uvbM7LRbO6
         Sw8ms+bsWuuLfPkRjtUSdWmb+C4YsVBdNZ1hCzev6/1gKz/3G8ccMVXsnOLJh53wkdP5
         B9GcbrG5NQzMS0DUWScoplzvUqGuK4BTuhQzEn+qx5P0NsaE8Br3dm0M0N7jl0KJGF8z
         NqhtkIZm++s/Xxpou2+whKVrXrTDQC0NSZGRn7vfIAWY5KucMMONstPl8otEeAlPKfq0
         zO2A==
X-Forwarded-Encrypted: i=1; AKwUvBwn85maqDJ63M3EOUT4CdIrGYAEnw9bONL2hthznpw6a9nN0lDFyy0kg8rxEHSY4jvNkJipdzj5/r5ohmI=@vger.kernel.org
X-Gm-Message-State: AFuF++ljE8Ufwk7dwF6VofCgPNXdVljgyeuYw6ZlSRHb1A69a+61WmcT
	D1IdfqoNHZXkSNxvd+Mh7X5x6EsT+XoCJkm/qZ/2dmRda0agJMiTDWRN
X-Gm-Gg: AYBFou0yjKJFv+2ATzabUeo7ZPEHyi1zk0Pyb3EVKdG6cGxMiNhUyeCXfGikne6YFTL
	BeUtQnoSQOpHwzLF5KxLC63WV9i8T6NJZ1mwZl4fQcip9kOSgG3UPbBeDZmufTCjGrt66BCf2vv
	OSSR/EBGFfDMOG5J3oeDKtYWB7MjUQG53Jcd5Wu1wh6QczxKctMMbg9VZ1DjNVklrhA24OO0wwS
	XqKBcnpJPPVhqVpmWZlgO7MNcyPIPc9dQSYOp0OYsOPZSAyN4+bJ2FRLIl1Xgapl+uWeoDcUzna
	ss216SIbuLfN9O/X6ZlhSe1vYxFr9Q/V60CU3FyG+TlA/945n+O48pxCukvkZikskUhGhn8Cvwn
	UkPFrwfhM/DKmELy2P31pTnexSV8SBJnhcMxDj+zDSbaDyYNid9ERCMT+7PyOBlvIakPPHV096O
	Kz67A5J57Ewa+Cv4xipOORctpdI4BACkCNWRZvLRr+b9fzlguHwpRpA9apLLAdYkiC0MwRYJZnt
	mjf0Iteh7WcOdvgCe4=
X-Received: by 2002:a05:600c:601:b0:4a0:73b:a222 with SMTP id 5b1f17b1804b1-4a02744cc57mr88146065e9.0.1791109024484;
        Sun, 04 Oct 2026 03:17:04 -0700 (PDT)
Received: from L-P-ITAIH2-L-RF.rf.local ([193.169.70.108])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1698f7910sm73030505e9.3.2026.10.04.03.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 03:17:04 -0700 (PDT)
From: Itai Handler <itai.handler@gmail.com>
To: Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Benjamin Marzinski <bmarzins@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	dm-devel@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Milan Broz <gmazyland@gmail.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v3 0/1] dm-crypt: allow encryption sector size up to PAGE_SIZE
Date: Sun,  4 Oct 2026 13:16:21 +0300
Message-Id: <20261004101622.2184287-1-itai.handler@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dm-crypt caps the "sector_size:" option at 4096 bytes.  Commit
8f0009a22517 ("dm crypt: optionally support larger encryption sector
size") gives the reason: the sector has to fit the page limit, so the
cap was set to the smallest page size any architecture has.  This
resolves that same rule against the kernel being built instead, so a
kernel with larger pages is not held to another architecture's limit.

v2: https://lore.kernel.org/dm-devel/20260922120330.127262-1-itai.handler@gmail.com/
v1: https://lore.kernel.org/dm-devel/CAFpOueRBb9y_Fgb3-c6_eFTKZR9DoAXZmxqqx0UH1Yb2rbV0RQ@mail.gmail.com/

Changes since v2
----------------

- Dropped the dm-verity comparison.  Milan pointed out that dm-verity is
  read-only, so its PAGE_SIZE bound says nothing about a writable
  target.  It was never load-bearing; it is just gone.

- Dropped qce as the motivation.  Eric was right that it is slower than
  the CPU cipher and marked BROKEN, so numbers from it argue for
  nothing.  The commit message now works from the reason the limit was
  given when it was introduced, and mentions DMA offload only as a
  possibility that depends on the driver.

- Documented in dm-crypt.rst that a sector larger than the device's
  atomic write unit can be torn by a power failure, and what that costs
  in each cipher mode, AEAD included.

- Used MIN_T() rather than min_t() for the bound, so it stays usable as
  a constant expression; min_t() expands to a statement expression.

- Dropped the claim that the documented range tops out at 65536.  It
  does not: without transparent hugepages BLK_MAX_BLOCK_SIZE is
  PAGE_SIZE, so on a 256K-page configuration the bound is PAGE_SIZE.
  The documentation now states the rule rather than a number.

On refusing other cipher modes
------------------------------

Mikulas asked for sector sizes above 4096 to be refused for modes other
than XTS and ECB.  This version does not do that.  Since the decision is
his rather than mine, the patch for it is written and tested and will go
out on request.

What gives me pause is only this:

- An allow-list of two mode names has to be revisited whenever a mode is
  added, by someone who remembers why it is there.

- It gives 4096 a safety meaning that the block layer declines to give
  it.  nvme_configure_atomic_write() trusts only NAWUPF and otherwise
  falls back to a single logical block, and nvme_update_disk_info() caps
  physical_block_size by atomic_bs precisely so nothing above it assumes
  a physical block is written atomically.  A drive advertising no atomic
  write unit, which is the common case, can already tear a 4096-byte
  sector.

- Selecting on tear-tolerance alone admits ecb(), which nobody should
  use for disk encryption, while refusing cbc().

Against that, his point that the modes differ in how badly a tear hurts
is right, and v3 writes it down per mode in dm-crypt.rst - which is the
part I should have done in v2 instead of only arguing.

On a 64K-page kernel the restriction refuses aes-cbc-essiv:sha256 at
65536 while leaving XTS and ECB working, including ESSIV-wrapped XTS,
and changes nothing at or below 4096.  Either form works - patch 2/2 of
a v4, or a standalone follow-up - whichever is preferred.

Answering Milan on NVMe
-----------------------

"Which NVMe supports 64K sectors?" - none, and none has to.  The
encryption sector is dm-crypt's own chunking unit, not something the
backing device has to support.  bdev_logical_block_size() appears once
in the whole target, inside a max() that aligns the I/O size.  The
mapped device announces the larger block upward through
dm_stack_bs_limits(); the device underneath keeps its own.  In the
testing below the backing device is /dev/ram0 with a 512-byte logical
block, carrying a 65536-byte encryption sector.

Testing
-------

Built for x86_64 and for arm64 with 4K and with 64K pages; no new
warnings.  A temporary static_assert confirmed the bound is 4096 on
x86_64 and on arm64/4K - so the patch is a no-op on both - and 65536 on
arm64 with 64K pages.

Booted under qemu-system-aarch64, loading crypt tables over /dev/ram0
with dmsetup and reading back what the kernel recorded:

  sector_size   v1.29.0        v1.30.0, 4K   v1.30.0, 64K
       512      ok             ok            ok
      1024      ok             ok            ok
      4096      ok             ok            ok
     65536      EINVAL         EINVAL        ok, lbs 65536
     69632      ok, 4096 (!)   EINVAL        EINVAL
    131072      EINVAL         EINVAL        EINVAL
         0      EINVAL         EINVAL        EINVAL

Every row was run with aes-xts-plain64, aes-cbc-essiv:sha256 and
aes-ecb, and the result was the same for all three: this version refuses
nothing on the basis of the cipher.

The 69632 row is the truncation the patch fixes.  It wraps to 4096
today, the table loads, and the device announces a 4096-byte logical
block.  logical_block_size in sysfs followed the recorded sector size in
every accepted case.

Also exercised at 65536 on 64K pages: aes-xts-essiv:sha256, the capi:
form of xts(aes), and iv_large_sectors, which is where sector_shift
reaches 7.  256 KiB round-tripped through the mapped device
byte-identical at sector_size 65536 and 4096, with the ciphertext on
/dev/ram0 confirmed to differ from the plaintext.

Not covered: dm-integrity caps its block_size at 4096, so the AEAD and
integrity-tag paths cannot be driven above that today and were tested
only at 4096 and below.

Userspace
---------

Nothing is needed for this patch.  cryptsetup caps the sector size at
4096 on every path that writes a LUKS header, so no LUKS device gains a
larger sector however new the kernel is; on-disk format policy stays in
userspace, which was Milan's point in v2 and is why no LUKS2 change is
proposed here.  The LUKS2 header-validation patch posted alongside v2
was withdrawn - Ondrej was right that the missing bound is deliberate.

Itai Handler (1):
  dm-crypt: allow encryption sector size up to PAGE_SIZE

 .../admin-guide/device-mapper/dm-crypt.rst    | 20 ++++++++++++-
 drivers/md/dm-crypt.c                         | 30 +++++++++++++++----
 2 files changed, 43 insertions(+), 7 deletions(-)


base-commit: c0df022cb0fa2bbee74bd9b90c66790bcd4e3050
-- 
2.34.1

