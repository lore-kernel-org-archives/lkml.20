Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com [74.125.229.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB98171BB
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 08:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790412016; cv=none; b=Ne7gqHtZNPigFM2Kxct5pHOBhpL2dzNvYiGcShxypPeogu/+rcb1R6JUa/0NR8OA/IpOhoQ+unzw3k/ADvLAg43sYXT9bNzzjvk0BnVCamLDotFsgWcNHdFwrPDISwA6yzaL4B0CtcP3UBvn1GnyME2juqfVVa3szYUlYZhxIDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790412016; c=relaxed/simple;
	bh=KD+eY6dK9vZV4HJuH1usyae1U74elfdQ2Pdz04BwUyo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iPBT+8s1oD3eZTVohdEb0CYg+zOpiZ/ItsvKlgSevMWnChmUlQ2mAe0B/j94CEuOpZN/lvXHo4g83GYeEK+x6Lo6UMd+/2sbv/jK5ZVCCUsCjcKOnnlMMOqzDCdDhr5W6kIC1iOHd/TpcsD/VKflrvDpSbawkxRvWiwR3PbKG24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d8vXmUsT; arc=none smtp.client-ip=74.125.229.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d8vXmUsT"
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-142dd025d06so1048646c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 01:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790412014; x=1791016814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rW8cFDq/XM211Gv3CA+1i+N4Sbl2j4STP1v6kSNU3m8=;
        b=d8vXmUsTtETQKLD8rXh+Lx9rdNd5iwC86m+teomIg6HBkJDuPAEIXz6FFZUoHEiI02
         CN2TjWON3kKdYsV1giY1eLivdvxGXa6DELqePMdw07fSpeR+9kQeIHUiZwF4fGbCtQb7
         3w6wfOcA1aglRdercBjHqKIm7zzRuENptqs15AM0HanJSdQ1LVKv+r4s/QFQqOH4J/jZ
         CfTXtNrFFo/lMZmb2dS9qo71urwZV5NuaVxzGxK6Y2TOmwA3cyste+JdyY8EV/1rWFQQ
         JxDIxvSDp0JHdUJqD2ulRefQbGe838MyMQYccUxoHZih/M4iYE/MGT6lRQ55NRLJKwq5
         ihYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790412014; x=1791016814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rW8cFDq/XM211Gv3CA+1i+N4Sbl2j4STP1v6kSNU3m8=;
        b=BxfLzmpoRe1fHc0fDOpU/YrFR3lxgl+4fXFUd7RIGflgiX2J7BNPildXIoFRPigKZd
         EQRnwQplQj044/kr2qrHvmjO65M2X+vJmqv3S5lm9EhmH65t0LftCaYd8Rth5ka/Iyvw
         3hktz+HxT/btUjLfdSrcbcOoSFB9LyplJdG0n/cCMMQ/LO209PUKqLKZoo3dlmZOE9/L
         dgCCBr6fbtxbFkGvqAv/wRvstu1toT8aBcLczd532zsiBQVtVfSEkajTAe8nnGy6tWyS
         MLVb62nlSkU4fQeiD2LUr/cgRTUJ99PTssTal4qr0YvAbShEg/Iu5G9xNCfUuV1XVxEp
         HmNg==
X-Forwarded-Encrypted: i=1; AKwUvBz6JL33WmrcKb/gToiKjDYvfLvPQpDD0e3NkVm/W1K/KRpiuBeNig58blcmMj/rzVjHgpGibpsl9DZp9eQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nG8eMDaXsfglJudw1UQsLkXRED9ylQ+8fybKuJ+3Ro0ILA2Mwm
	vH+tQ0AK//9CEhKh2Tix8nxmMQZScaf8z+e46ULRD9wX2GsDWUjzT1Ps
X-Gm-Gg: AYBFou0KMBHr2ZoHXae/bgHNe8NyNWuNqCosmqxeK69i4IYlFMFWwW7YbtYQ2vOYXVF
	PiHA+1epwNg66jJOYdEaftO7WH/ZCm5yjWfZsdATdxsELEljNBeID2wZKso2D7FUlqsfUi9pZnb
	mGfHiX5kkXnACDBIe9Uz2ib2vSdck9vw3GWKSWt99ERb//5zOlQ/EWI20TFTbDL7ulgJhxipLKS
	QTUaxchwu8dv4IQMdOaM2Cdl7wFzXnGQDnXS1JPIA8rETugxSFrQCkedDcxK0Ywff2F+FKU1WpV
	UZ8Q16Q79fsuyEg6cPJiCv43xJBTGYiP6PB1Ts/KfxusOwpbkfZG1OznL3VCr4Aktb0QrRPNpKT
	FVaWKvOXy1JlVYqc8DGuNFnd2f2TCJBIzZWlYPhw7Yql7qhhMBZRgbtRbE9xYaR+Rlxh8NmwiJA
	F5ffdU0t+X3B6dDntFa+x5zR4IeR06IEdeqQmeJb5oGF4zv0NFzux3jbKax/btizqrJcwdU8Nsg
	pmPXsiEvhV23Inr9dAEaEbZSx7vjU1NdBSWhqIezdioCyNOu1JZnPqgunIZ82uIX8w5q9SIFcxC
	qISHl2iCV26JafaNaKZIDxoKPhJXqqcC8yZwTa0P0rXMHt2tNt5NyIQL58A5mEOaqVmRpg==
X-Received: by 2002:a05:701b:4509:20b0:143:5722:55be with SMTP id a92af1059eb24-146cfdd2918mr2198164c88.30.1790412014376;
        Sat, 26 Sep 2026 01:40:14 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145a7318afcsm10487044c88.0.2026.09.26.01.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 01:40:13 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Viacheslav Dubeyko <slava@dubeyko.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Yangtao Li <frank.li@vivo.com>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] hfs, hfsplus: bound the partition-table and wrapper hops
Date: Sat, 26 Sep 2026 16:40:08 +0800
Message-ID: <20260926084010.569552-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hfs_mdb_get() and hfsplus_read_wrapper() follow a partition table, and
hfsplus also an HFS wrapper, back to the volume header with no bound on
how often.  A partition entry or wrapper descriptor with a zero offset
sends the loop back to the header it has just read, and a crafted image
hangs the mount.

These patches allow each kind of hop at most once: one partition-table
hop, before any wrapper hop, and one wrapper hop.  TN1150 requires a
wrapper's embedded volume to be HFS Plus, so a second wrapper is never
valid.  Apple documents no nested partition maps, and neither macOS nor
the boot ROM reads one.  With both limits, plain, wrapped, partitioned
and partitioned-then-wrapped volumes still mount under QEMU.

If you would rather not rely on that, the alternative is to reject only
a hop that does not advance part_start.  Both hops add unsigned offsets,
so the loop then always ends, but a crafted chain of one-sector hops
can cost a synchronous read per sector of the device before it does,
which on slow media such as a CD adds up.  I can send that instead.

Matthias Goergens (2):
  hfs: bound the partition-table hop in hfs_mdb_get()
  hfsplus: bound the wrapper and partition-table hops in
    hfsplus_read_wrapper()

 fs/hfs/mdb.c         | 10 +++++++++-
 fs/hfsplus/wrapper.c | 15 +++++++++++++++
 2 files changed, 24 insertions(+), 1 deletion(-)

-- 
2.55.0

