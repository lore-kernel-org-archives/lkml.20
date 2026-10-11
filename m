Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0933DBD49
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 06:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791700153; cv=none; b=ig8vEatF4BkHNp17egUK/w9Jc5UEFplYW2iyRs1KyjV7UY5jZq8hn+uynWXq6ICKh6ZmUw3lBdxSVBhfJPC8s7EnzyPvfrU68frO/f8oqwfmFAd9P9N4gVD3gHaCC+7OvQdNwmewFZxZfedvcntEVtDUWtUNZLh4NKdYwAPLeGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791700153; c=relaxed/simple;
	bh=o4gGH5tyhBW0yVZv3CFpWcbdWHQRb+igsQyior7IF+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dw41gz91btSM/QMtN/VoqJAk4jjIBvh/1vijohOTGsTME0M7B2CBG1lILxYfGQZRvzgONi9U6iWbvgr4KrJxz629xrntl4WrKc8osBo2S3SFG1um/1Hg50F396jPiABu9qmjwz1F3trUsd2Lz3BDg5PvWBeCHfFn1YJZnQGNMxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZtcEtsBI; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZtcEtsBI"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so7840845e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 23:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791700150; x=1792304950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kBtQan1uSc108PxGt8KEILazDPgl7luxnl4pqbr4mVs=;
        b=ZtcEtsBI9ys3BitPo5Ei3dIl7XW+BHOnZ/enX2hYZYAY+yD4y2xhtqdyLJVk7U7jZB
         ik3IZSGheX4fGjH3Q/z1ZeZNAlJmzG+y9BoSs76RTpZ7A1/Q5VKY/k8sPEd6uvMi856E
         PjQnuMKPRXEQw9RJZcVvLeT13lKyvVO5LxpP24avoRIIbQU2IRzhyMFsbnrMOmRfWeEV
         oYWKISZCQME2oTE/C2SAtXjRXPP34SeJYxZy6diQNzJp990tQGY4Kq4GpdirXrvXRCHt
         GF8Df8L3kKlJgvfUqUnFNw0T/zR4NA6fg0DkQFflDY0hWunI0+XawBfgOxsM1JSBTuyW
         Iq3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791700150; x=1792304950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kBtQan1uSc108PxGt8KEILazDPgl7luxnl4pqbr4mVs=;
        b=rg2kh5plY5+k5YyucreHOL3oWraPtuDNVOJQ699G6rFaIsWNzuLTz77uYptQ8aXD8y
         sbISE2CXuyXKVNsOJdGF/ZWOsjfqPg3xcBHkYBPaOCZyayfZ2rDWRF2LIwNYC4FVRVk+
         EOM4NwmEuscOaR5f+lYnoB7/KowAxk0IdIW/69pWK4ebntU8eE+a1PrwoYGX/5W5dXRn
         8YE0tuiWqSCPWXQ9HEmNH0cEf4zLHVd/6uX5bR6vc+imObjwOqLn7uHjnniQ49RnRiwD
         iKdUknoz/0flOfr/q6mhibvHQDjh+vVxqW/csE2PDRQPHFozLeoka49oH7IZoIkG3Fyd
         lrpw==
X-Forwarded-Encrypted: i=1; AKwUvBywNKLM/rkGaQmyw6G1f7Sed2GvCVZZd0Hs+mEzSgkZ/QAlwLCBIC6fqLUWPAkqAbdiF18kL5frE/rKFoM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhWLvG1sRyaDlILJbHfodGI7y5a0eYIKLqyp7oY232tlRq3h89
	6UxL/qjuu5M+MZ5h5WgLzJpzzmHEnnYji11WZL4iIRL0HUKcVwAuVHKW
X-Gm-Gg: AYBFou3+pyEiTgJIqwUG4bvM1Q/3kVu/HWKCiQ50gvHDf2/Qk5u017luzx1P6OMDuiK
	pZuwjZyJmiTmFzn+Ma1Kw7Id2AOtJF3fiLtLJf+M7VbIvbPhsaCWJYIJZTKvG5v0rFyFBYUnvEC
	I9AV7B1pux+GBJOLr5SSyVjcd+XgHUmEBdM78wIaJ44VM1h2GxjulRrAIfk5CG8lUZVpMRkkiz9
	1hAPGFCTt4ZbCLycL2qqMTsLM+9or5X+1NFOAiLm2xWWX6bZCp08Cgz1w2jaYqxrvT9kWB0yrH8
	dB3mT5QfJLj1G8QXC7Na81zjovTQB86na2gN6um5bIQKNF7y6QOIqX+v4o0EHKD4OetnjV5POMD
	cmO9sV9ghYxAZMqx9HGz+IMF5lObrcPT828QYnepQWIdlkioznFVuh3qtoyHuGmw+s9fS0SmPhm
	/6hFhdQVhfMqNyy4RGP1JXgxCi4I7wjpSRBdxMm2DrWz5PG37dAb28hWnGbVTmArzYBIkQAT7By
	nfqsRq7hLVe8iPVqez2HTFckvbPle79JNpg5+nHW5mHR2Ty0Oq7N16KhYpea18Kqsakiyk7+2zs
	1CWn7f6MINH2jgpI
X-Received: by 2002:a05:600c:609b:b0:49f:ce78:356d with SMTP id 5b1f17b1804b1-4a18e4c9944mr106707295e9.30.1791700149633;
        Sat, 10 Oct 2026 23:29:09 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18f3b43efsm222579135e9.1.2026.10.10.23.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 23:29:09 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tsbogend@alpha.franken.de
Cc: linux-mtd@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linusw@kernel.org,
	kaloz@openwrt.org,
	ulli.kroll@googlemail.com,
	john@phrozen.org,
	nico@fluxnic.net,
	dwmw2@infradead.org,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 0/3] mtd: point() for cfi_cmdset_0002, on simple maps only
Date: Sun, 11 Oct 2026 06:29:05 +0000
Message-ID: <20261011062908.2365879-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261010172142.2138956-1-orgads@gmail.com>
References: <20261010172142.2138956-1-orgads@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

jffs2 scans a flash in place through mtd_point() when the chip driver
offers it, and copies every used eraseblock through mtd_read()
otherwise. cfi_cmdset_0002 never had point(), so every jffs2 mount on
an AMD-style NOR copies the whole used area. On an Octeon CN6635 board
with a 100 MB jffs2 partition on an 8-bit M29EW that takes 15-30 s at
every boot.

1/3 tightens the existing gate first. map_is_linear() only checks for
a physical address, so cfi_cmdset_0001 already points at maps whose
own accessors swap bytes (IXP4xx), switch pins (Gemini) or lock the
bus (lantiq). The new map_is_simple() also requires the simple
accessors.

2/3 adds point()/unpoint() to cfi_cmdset_0002 behind the same gate,
modeled on cfi_cmdset_0001, and lists it in the cramfs documentation.

3/3 lets the Octeon flash map use the simple accessors when no eMMC
host shares its boot bus. Without it, 2/3 changes nothing on Octeon.
It builds without 1/3 and 2/3 but only pays off once they are in, so
taking all three through mtd with an ack from Thomas seems simplest.

Tested on that board with 7.2.9: the mount drops to 0.6-0.8 s. The
md5s of the images on the jffs2 partition held across reboots and
across ten 8 MB write/delete rounds. The series applies to v7.3-rc4
and to mtd/next.

Separately, for the MTD maintainers to judge: the write-buffer count
truncation that cfc5ebc9540e ("mtd: cfi_cmdset_0002: cap the
write-buffer chunk at 256 bytes on an x8 device") fixed in
cfi_cmdset_0002 has two siblings. do_write_buffer() in cfi_cmdset_0001
writes CMD(words) and the one in cfi_cmdset_0020 writes
CMD(len / map_bankwidth(map) - 1). On an x8 device CMD() keeps only
the low 8 bits of the count in each device lane, so a write buffer
larger than 256 bytes per device would be programmed with a truncated
count. I have no x8 Intel or ST part to test on, so I have not touched
either; I do not know whether such a part exists.

Changes in v3, from sashiko's review of v2:
- 2/3: an XIP erase (FL_XIP_WHILE_ERASING) no longer lets a point
  through either; v2 only covered FL_ERASING.
- 2/3: the changelog now states the cost of that rule: jffs2 points at
  a data node the first time it checks its CRC, so a read that meets a
  garbage-collection erase waits for that sector erase instead of
  suspending it. It also names what really blocks behind a cramfs
  point: jffs2's umount calls mtd_sync(); sync(2) does not reach the
  chip driver.
- Assisted-by in the form Documentation/process/coding-assistants.rst
  now asks for.
- Not changed: sashiko notes that 3/3 keeps the static flash_map,
  which a second probe overwrites, and leaks the mapping when
  do_map_probe() fails. Both are as in mainline today; v2 removed the
  iounmap() v1 added because, with the shared instance, it could unmap
  a registered device's window. Making the map per device would fix
  both, and I can send that separately if wanted.

Changes in v2, all from sashiko's review of v1:
- 2/3: a point no longer suspends an erase in progress. cramfs holds its
  point for the whole mount, so the erase - and the task waiting on it,
  and the reboot reset - would stay suspended until umount.
- 3/3: the bank width is checked before ioremap(), and the iounmap()
  calls v1 added are gone; flash_map is a single static instance, so
  on a second probe they could unmap what the first one registered.
- Not changed: sashiko also asked about writers sleeping
  uninterruptibly behind a long-held point. That is how
  cfi_cmdset_0001 has always behaved, and 2/3 describes the cramfs
  consequence: a cramfs mounted from /dev/mtdblockN on AMD flash
  today falls back to the block device, and after this series it
  takes the direct path, so writes to other partitions of the same
  chip wait until it is unmounted. If you would rather not change
  that, I can make point() in cfi_cmdset_0002 opt-in.

v2: https://lore.kernel.org/all/20261010180840.2152492-1-orgads@gmail.com/
v1: https://lore.kernel.org/all/20261010172142.2138956-1-orgads@gmail.com/

Orgad Shaneh (3):
  mtd: maps: only point() maps read through the simple accessors
  mtd: cfi_cmdset_0002: implement point() for simple linear maps
  MIPS: Octeon: flash: use the simple map accessors without a shared
    eMMC

 Documentation/filesystems/cramfs.rst  |  11 +-
 arch/mips/cavium-octeon/flash_setup.c |  36 +++++-
 drivers/mtd/chips/cfi_cmdset_0001.c   |   2 +-
 drivers/mtd/chips/cfi_cmdset_0002.c   | 167 +++++++++++++++++++++++++-
 drivers/mtd/maps/map_funcs.c          |  12 ++
 include/linux/mtd/map.h               |   2 +
 6 files changed, 214 insertions(+), 16 deletions(-)

-- 
2.53.0

