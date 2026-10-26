Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793011853;
	b=v4FIhVpRZt3dQiyffTfcQxTTXv51EMoN8sVLAPEiMT91IQ2SSfFL/TJ0CNFwAJ0M2VCC
	 39U0/K46conbSYeVjDfHZVgRzaXtgA+qrwF/w4uBBCRYzXsyjNtLgy2s2PuZ35qNxjnOD
	 +2qEBgP3r6VJby/zjxbJQCBQBi9ptZuBXeEI5d/6Ux1Qh0lhfeFsVl3XvQd1Dq2sPytHz
	 j4tUDvzYTiFzxO3MFHz5Dk/Z1OAuP2NHtYTAPYWZ8/pU5oaOlOYxPDH7jZ2agCOyz1dTm
	 CBQbUCb7Ux1cTcjx8Y6lMLOvdCEoTlHX1N/lQfMdjIz0dq//CauEg3Y8kiPYkNCfB/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793011853;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dyIOxsTmkVspFMyxvRPipvvAUXx4yxejy3ONSysLtPo=;
	b=z+LkGo0b7m7KDQPO53i0CmUEWOixCDixiH16ngBgIO4YoRe4JCC7zu9UTbNAabLglQKU
	 GzQ8SLvTBvc9aDjDP0uHJiRXKRc8vMB9Mdvrcx++/d5MoYvGhbrS5/awkjpmfRreaKFjO
	 1NZewHewcZNXk/ht2XA16bct3yOWYAOZvrQIUNQsaOT7HU6jRvm+I1bzzE+k7IwtD1bZg
	 ZHdXHtwy2jXWguK1/VltX4Kh3afqvSLZS1sJ7yNO4hW62IZFVmDctJNh3wEM2B/z+30T+
	 qls6YnhpCsQlVE8uCeUUCGmN9Ld3ADYTy6QSI/62peW1Yv2YcYJGCQg/njxXtE2fwGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RRfS7Q8O;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9AA606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:50:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F9AA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RRfS7Q8O
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1a2761c69fbso353728c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793011852; x=1793616652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dyIOxsTmkVspFMyxvRPipvvAUXx4yxejy3ONSysLtPo=;
        b=RRfS7Q8OPPYtJbHt0dGwO+5W8hsvH0JAbXLtkhOccVHZw3MtoFz2og4+VrGzVWn6ph
         65lOhe37KnOeYyQDPPPfZ6FN8bp/mBZFG/dWnP2vofcWlND77h8OqqIOboUfmRBX1387
         TazPaVrjjwk+Hj6UO8gW/BWmBkPTKiY9oS62XGltasL0axnLairab6B/K0PSJrUsO4Ke
         p1FbkkkAy19bTs2TzE6U+NEDs3delOQ6TBG/RMvDyvVN8HsRwyANDHvLgpTOnYLcWTwg
         J+p4NuVfQsRBDta1pmjWxF5r7ldHHAMOHVcOgZzlAUQ7KFMtW5U0Nc76r6vYWeOxB+NM
         NDYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793011852; x=1793616652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dyIOxsTmkVspFMyxvRPipvvAUXx4yxejy3ONSysLtPo=;
        b=yBNw9H3RsBfFkhIiZjvabeImAI4TCN4faQThXk5xK1tIUsPomVWW5nPjl9+ljQdymA
         DXSiJhB+0QTVyoy7oHUPlhwlooL11THbO6Mx3AnSvY1GQkrS1aIWe/M7pNDXAePBIQvP
         28WcL+0zCfXEjXX7keLj9+x4w4IMBJ8uU4QxdpLMYSbUoNzezA7GQUmkuvFci+9k9pic
         99mGIP4NPVW21uhh7eDgRAzvUBz5SPEADOUeR8tr7FVMoxh69EeKJsD9A0Yk65GoQuX7
         3IwXbYTC+kmg3uI01/pr3tp6rgjxs9HhBcXgvlh27NaIIIw7N3dRnlJMwsmEaZsfxQIX
         N9Og==
X-Forwarded-Encrypted: i=1; AKwUvBzFeMYbKKugM/I869JqrR7mt3P33KyQjPO5PeBHHy5/ltqgsR5DfPEdd96ewno0X6ht/UZWYIbogxNVaGI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGpaFI3oZnwst+bNBr/x+rJzyi2hA2O3LJWXL4AoSMJwfq3PlD
	ZSDTbrr2f3yK2tpjDjUJwVjifsSaVIAn+lT6eIFj3jZTa7yKNWTeaaBj
X-Gm-Gg: AYBFou0sFEN4D1+G0R1T5f40Emt+JYyrWoOf9hS9UimX4XjbQ2jtFyKzCQIW1C4uC8q
	z3wbliOOAnlTWwBkyunj4bDuZqlTzXr3bwH2zxbtbA4wDB86VZfipRMlsYRBhKz105ZxcjRn7zK
	bJHLVI8X2tEOvEfprtQOCf5CYgnE7pI8Z/ThdCtXO/iM9sVPzs4+lbOcPooCd1ujhyQ++/iyIJ1
	QecXURMalgTuPPfOLICWhHnttAgB4dtiRfEx8/BRu+JjaGuCr1MqGr5rLPBadho29541WzfzwH+
	i+/6WN1hgoRC/7ZyR7tPUB1ZWtVCq9aTBUWu7JmeLrtYsiVRPsRNSI75UvG+RtPC2hQZ7oF3Qvu
	JCI05tW4BRI40NbrHqkFsNgvztLMNe59NSWN8bjHVUuDkKiv/zlfj0XCtIBisHAyaM1WJYrX98z
	R5Cd5ZSwn3kVoN1QzKAt2wONN/8+MJDp4vFut0a4+l2VaKXuzfwmU/JDeBAMxeS0rOZuOZKb9go
	setwFajIqwb7THuU2mbAbk2MgqHu2tMJC7L+QSLio9g/b4/oTsK3Ld2UoHo+nfF/NcukqowHKa8
	e+/XosmWOr840opKN/w=
X-Received: by 2002:a05:7022:f502:b0:15a:9834:73f2 with SMTP id a92af1059eb24-1a243f18c54mr1365627c88.38.1793011851969;
        Mon, 26 Oct 2026 03:50:51 -0700 (PDT)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a020df20sm27897863c88.6.2026.10.26.03.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:50:51 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] f2fs: fix dentry recovery and MAIN_AREA validation
Date: Mon, 26 Oct 2026 03:50:38 -0700
Message-Id: <20261026105042.1148554-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
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

v3:
- Add the missing Fixes trailers to 1/3 and 3/3; 2/3 already carried its
  Fixes tag in v2.
- Add Cc: stable@vger.kernel.org to each fix.  No code change from v2.

v2:
- Rebase patch 1/3 onto current f2fs dev.  recover_dentry() now takes a
  struct f2fs_cached_block and sets dir from fsync_entry->inode; the
  S_ISDIR() check is unchanged.
- Patches 2/3 and 3/3 are unchanged.

This series fixes three independent issues found while validating crafted
f2fs images:

1. reject a non-directory i_pino during dentry recovery;
2. reject MAIN_AREA boundary underflow in the alignment fix;
3. refresh the superblock CRC after that alignment fix.

Each patch is a single logical change and compiles on its own.  All three
were validated in QEMU on the KASAN kernel: baseline trigger, patched
no-trigger or clean rejection, and a normal filesystem mount/write/fsck
regression.  The baseline source and build were restored and
hash-verified after each run.  The series applies cleanly to f2fs dev
(fd106ada4dee).

Cheng Yongkang (3):
  f2fs: reject non-directory parent inode during dentry recovery
  f2fs: reject MAIN_AREA boundary underflow
  f2fs: refresh superblock CRC after MAIN_AREA alignment fix

 fs/f2fs/recovery.c |  7 +++++++
 fs/f2fs/super.c    | 13 +++++++++++++
 2 files changed, 20 insertions(+)

--
2.34.1
