Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8E825F98A
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 05:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791695957; cv=none; b=rUwhLBYuNMMOZrGGAJ1lYgObCx3DiY+iRwqlQ1CWuNj+oFydGtCizFV7U1qzL5eWoZ+RA2+u2qcMqGLsxrDWU03o1Ufqcx8UlJTjJLwSeXHpLCiTyCkb/cXoOnZUWYSd8KwDGGt5IU+w9erZ4gMp3lt04Rfr3fvyHauHbkfycX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791695957; c=relaxed/simple;
	bh=HvNmhkVDvrgbn7qUxofRW7SwFcOvKCzi3f5X/xRClVU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hatAcF7Itho1L1wIfa3+HErlMtC6glRWL3VYM7DAXf40NxY4CpPZoKXWksLVAHrze6+DPoaL9y5TkC1P2Bl53wSL1apsEifUbeaOmjlXq9hyXMknOVjOvZ3uLjOBJxV9CylCxN1rLQwcg38Y3HbOjhR8ucdGB+Cca0xnVEX8jvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CvXqJd85; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CvXqJd85"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-351767ef18cso3400103eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 22:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791695954; x=1792300754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z3f/o3Gj46IoB/K1eXbjM9yD+rl1ZhRg4Q8Vl0iFlb0=;
        b=CvXqJd85rGAym+I79mdQD2GVyuMWRuS2e6mWQrcALLfKA5RMseuca8dP+Is/24Q3ns
         MDtUhIvzA9KmPn7jg+0Vad0++uMD++rgZIUA/p3YojeatSRrVDxHU3OPqn8pooY1k5Vr
         DZHEDNmNNM0jN+sf4rBecmKSGgMYni7+46etua7u9SO8WSZEeTmK0bp2yBmxCe67+u8z
         hIzYem7/EzJleg2DXMXUpSK0bS/qgPMQXm0mSd20effWHwvHKUjP7U7MBrT3oRah7l3d
         PXMytGGi1QXP0mUvmzcrwxNsMd7wjqPWTKuKV2L6FMUR5RPvXVNswokq2YRgx+WvJu94
         185g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791695954; x=1792300754;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z3f/o3Gj46IoB/K1eXbjM9yD+rl1ZhRg4Q8Vl0iFlb0=;
        b=qQcG3F5e3GXOOzi8733o4L3HyQ96pZCXhPQQDCZ5Rck/wgLDhgi/FACH/Vox3OaJ/t
         cQ7rO66FkDTAnlhiNiyn/feHraGmwhNxXLemkM/lJysqz3Q5xsr8DrYicHf04mtO4t1F
         zOPhr7PyK6UrLq55OogqpsT3J1JrEf/pEZ6Oo0snieh+ZiaOM0j65a/sDFcKWkw47neQ
         BvvP0AKLwaf/IB0nJFdpiix8ti5Wak9ALIFT1XYmQxukzG748xycVpbxeOzx/QMQlEzj
         zHiQRJvWQdrInTRI3NNgehU59rDvOI5n2CIrFGFfApzlm54hLER9rAcaBKJHbmtLKEZF
         Mzqg==
X-Forwarded-Encrypted: i=1; AKwUvBw7VWEf+cR7zA7jIyoT3HfFdNdy8//WNTjhw2r4PLofPwdG7k460mSsHzZ5/yK4Wz7zPthJn5RDe9Yuya4=@vger.kernel.org
X-Gm-Message-State: AFq9FYILzG0IigO4ksTbGaHQvEdTOwdUr/BEDkxr4yUWOxt17EC2WuPf
	xY0ozDxR8UnlYC3ZPlsFqZU2zk4isWe/gqKLmm/ee1LIuU+/HzUdVkPI
X-Gm-Gg: AYBFou3Qt0b1aHRapRlAVsgDkyJrd7cMuuJyUgaDSk+3FKsW/uWsZmaf5eJLtU7o4Lx
	xyA+AbPN5Zq+yB71S/8d8XjhjpJwkpk6yDaFzCDvA7toVKNqs5bXklN8YjBFxsCov5hqX65m6er
	z4LvyC1avH1ywHWB0W4TynXS7aqZa6EIfnWG+t+1nNpNW4eowN24Pd3OwTfP3t3c7L2MHKoumMz
	bTvJEQ9w6KfY5y7vWcLuKrjwAimWzsYAHyLxzGMWXiCy7RfA/yQ5yt0FnG7CTFYlcXyRuAAdB73
	x0Zr4lM551iWLtgRIYFS/n2JA01NEUBnpnzjFAYRQ9mE1j2fk0SwNkOWYeIAVk44+KVH1IfqlkQ
	roNw58Dxrdm2s2UPBszTrm3Zla6Wd9gK5RMUW8BQ1YnzzIvgxiXM4AqbBfnGuhn6mskWgWljw8R
	QTJ/bXmsJVt/9S9dRIIMcYjNiN1RjOe0FI4mXaohhNWM7dsxPTwjimV0cMw6z8CaP89n36vnHt+
	tBZpYSA5iuqOGS7C7u5eddy/65v20FhY7JcHOTvWzkpdzVn1RpGnb6GPIHeIkAFMuLRuvnXeF4Y
	xdoiVAzFGV0KUAxPsqHmMZh6LvvMhlGw8TkOsLYrgVoLh7cyin0rl2A8K+kieRu3qfx2gLniG5Q
	vrUkLat3sBFWvzGPJPgQ1zG7tIlTA63BiPjsNKME7RK92tHmVHD1kRdw=
X-Received: by 2002:a05:7300:2216:b0:351:28d9:4908 with SMTP id 5a478bee46e88-3537db99e8amr11984121eec.0.1791695953335;
        Sat, 10 Oct 2026 22:19:13 -0700 (PDT)
Received: from FT6N242TWK ([223.181.119.248])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35978efac1asm4979129eec.19.2026.10.10.22.19.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 10 Oct 2026 22:19:12 -0700 (PDT)
From: Shashank Mohan Jain <jain.sm@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	Damien Le Moal <dlemoal@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	Hannes Reinecke <hare@suse.de>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	"Martin K. Petersen" <mkp@kernel.org>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] block: two fixes for the zone report ioctls
Date: Sun, 11 Oct 2026 10:49:04 +0530
Message-ID: <20261011051906.60397-1-jain.sm@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two problems in the zone report code added in v6.19:

 - BLKREPORTZONEV2 does not look at BLK_ZONE_REP_CACHED and returns the
   cached report also when the flag is not set (patch 1).

 - blkdev_get_zone_info() gives a smaller last zone the length of a
   full zone, so the cached report describes a zone that ends behind
   the end of the device (patch 2).

Both were found by reading the code and then confirmed with zoned
null_blk devices in qemu (x86_64). The test program opens one zone
explicitly, writes to a second zone and closes it, and compares the
reports of BLKREPORTZONE, BLKREPORTZONEV2 with flags 0 and
BLKREPORTZONEV2 with BLK_ZONE_REP_CACHED. On mainline it finds both
problems. With patch 1 only the length of the last zone in the cached
report is left, and with both patches there is no difference apart
from the zone conditions and the write pointer of conventional zones
in the cached report, which are as documented.

For patch 1 there is a choice between the code and the documentation.
The changelog of b30ffcdc0c15 and the comments in the uapi header both
say that without BLK_ZONE_REP_CACHED the report comes from the device,
and BLKREPORTZONE is marked as deprecated in favour of the new ioctl,
so I changed the code. If the cached report is meant to be the only
mode of BLKREPORTZONEV2, the header needs to say so instead.

The series is based on mainline (a5ebb76233b7, v7.3-rc6+). Patch 1
applies to next-20261009 as is. Patch 2 needs its context adjusted
there, because blkdev_get_zone_info() tests the zone type instead of
the zone condition in for-7.4/block.

Shashank Mohan Jain (2):
  block: only use the cached zone report if BLK_ZONE_REP_CACHED is set
  block: fix the length of a smaller last zone in blkdev_get_zone_info()

 block/blk-zoned.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)


base-commit: a5ebb76233b79db01e82e061173cb73c6d2b5c6b
-- 
2.43.0

