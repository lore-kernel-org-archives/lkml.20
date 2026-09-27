Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95763C0624
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 10:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790506645; cv=none; b=RXuj8Nx+m0EZ62XdLNQyK4/RR4MzZsrrwvD7MnePzdH+xCF99q55nnbBg3etKzf6vsSol4afC82t3hhghsZCLQdvlpTuevDodP3B2Qnxd0bdxK2yYexbv3VuwhlffFQha2K0JWMMxL9jngKWtVXVRH13Ly1QHbDBhELTIHPJ3IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790506645; c=relaxed/simple;
	bh=DsQkDRygvNose/dVmRGPOcE9DsBWB+hc9M+JrQpVR8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BtKUeTqma7bbn6mjrGDDDE8ftdycu+auSfj7gI3KGBctZ5clE/pQoat2EhVc3il7ikezKiOTEqANEK4kueCRIyQUG7AG26fU6aLhZEmYEu9Fzr8vbayrKad5CKBxjmz3E7TKvV3pABgTRjA9z2DvmWBxjW1Hg9uOdEIwkLjxvT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KhNXFNGG; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KhNXFNGG"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4bdf8abaaso1375204a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 03:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790506638; x=1791111438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/hdn6ZIYyqC193Cf5yEWH5VZfboJGstvpfi9see9V8c=;
        b=KhNXFNGG5JEuNGcsw8OkL9qyNvp8hbgRxWjU0ciNbYhOKUZ+DGzYJQTRhrPJE73zyl
         VSVZzdkz3g5tHSZ/RWgLdW9IiTogbdpDn5Db7lZT3xNL2Qc1vhJtUVumArsEb4yxoZ7E
         guhWnqG57Nlxc8rsPuaIlx5VE3VTllIcirdHoKEMfRUK+bM5pGGy6o9p70KcJ9f6KZSO
         Nv8Vf0bz9MgLUtEwKbNXw1UDVo4WEA5X0iSVTZit/SQdNAKp7BFFa/VDGn/5phTRAQNW
         mmNNmwNUDqNaLMhv5hZpoVBVgioQEg06IPbIO5YzPSQpftWYHn1DyULBD/rWxEDNLgY1
         GpCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790506638; x=1791111438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/hdn6ZIYyqC193Cf5yEWH5VZfboJGstvpfi9see9V8c=;
        b=L8Hd0cVCtRWCazMH+q64uuWNCPd3yt7TGtAl3JLb1R7oyuOl/bOYzjUJ6vfzVfNxE0
         v9HTPa+qHhWDQ45HXG2zDL5gVlIhCLYosTjEK1PCr6rrHQBOB8H9zkZVNKuxXFRNwoJT
         jRIk8UrfA5O4RfXsPoIMe17xCvZUvivBFdvpq9rj/knTIOmcRVfQmxqMf0xxy7oTXfhK
         +FV4OFYTjgVnMJJv8zlDewyC0W2Q0oADrxwRpc8TKyRgN3PDqMyKjDa1FfV2/D5+OzN/
         WPfKa1WHk7iovx/RGUrzr50vYnUouU0H7lnHA00AZ4BcTh+JG04TijQfQz3Q5REjBZ1A
         Wexg==
X-Forwarded-Encrypted: i=1; AKwUvBzo4jYZ+KpQfbmSXVgE91NtmyyPDYVY/IINZGqlB0gmb9+JYdaZ6u3BUSopIwyvR7I+zOq16ow51bm+hzo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzUMfs2huMp0XX/JVmdHmU/FpzVBvIqhevS1nI/vQin23KnYjy
	tZNOuUMZNloGnIwchTqm/oVEeo02LDsEf1Hvsoea9KWVEbXl+DjEJ1GB
X-Gm-Gg: AYBFou3De5lt5l3YLcpRWBJ2qDwf3bIt0jAgLakQFiBaqTsfsC1XEJC2Dfdrs5I81OF
	tXimdK1gm63Sbjsip80ZgYe9YwjhhPsdFiw442Nbtoc6WWDDSv5PsJVhU5MMzZ+DztzG9ea34iK
	3KRw/KW2rK2fGhHX+lb/M2C+Q4NIprQiOQEA8YLbEvAKvYJwiagK8e6ZlTwkiaVWL764QZPgy8J
	F9FcrNQIKLA5guvQvGEsY1F5r9gJ4JEhU213fLrwjd/vnCjbJ0/wWRln5rQzL+qGcwHmHBZhqFK
	9MJ4k9jetgHoGHS2BSVNoTXW95zgsnNqMzTwKr3Sm/6HyJyx3RCVEbWKPvhApD4YDGCvAoR3Li6
	RwTR5aiBmG0YNZJPfPjSbk5ZeH/fQvmJiw091aBfWpwU/66DPK447rF2MsPEcYwx1kgLYVdHZiI
	4Omw7o52/12qI94WlI3y86C60uSopAoO5oeulNReXp5tjwNQPbpC3+RmZeto5XYvd1b3k8YiP7L
	KTrhHKU7Y0OPtnWy4ssemebPpNxhA7Ae6sneG6QrwhMye1AStthLyifHQOV6cJRS4l9ii50jQVu
	vU9ygtTqSp1c6kVgkMHJGxWUD42pEijyX3KM7cvqKATth96H7nqBQm/uUIw=
X-Received: by 2002:a17:90b:4acf:b0:3a0:f2c8:9ad6 with SMTP id 98e67ed59e1d1-3a0f2c89d98mr2256325a91.64.1790506637645;
        Sun, 27 Sep 2026 03:57:17 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b99e5220sm14419192a91.16.2026.09.27.03.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:57:17 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] ntfs: fix spurious EIO and ENOSPC on nearly full volumes
Date: Sun, 27 Sep 2026 18:57:11 +0800
Message-ID: <cover.1790503811.git.matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These fix three errors returned while free space is left.  Patch 1
fixes file creation failing with EIO on a nearly full volume; it now
goes on until the volume is full and then fails with ENOSPC.  Patch 2
fixes the cluster allocator missing free clusters when its start hint
lies at or past the end of the volume, which empties the MFT zone, and
patch 3 removes the fallocate() check that then fails every later call.
Together the two bugs make fallocate() refuse space that is free until
the next mount.  Reproducers, run with KASAN and lockdep:
https://github.com/matthiasgoergens/linux/tree/reproducer/2026-09-27-ntfs-nearfull

Matthias Goergens (3):
  ntfs: set the attribute list size before reserving space for it
  ntfs: restart the zone search when the allocation hint fails
  ntfs: do not refuse fallocate() when the MFT zone is empty

 fs/ntfs/attrlist.c |  5 +++--
 fs/ntfs/file.c     |  3 ---
 fs/ntfs/lcnalloc.c | 18 +++++++++++++++---
 3 files changed, 18 insertions(+), 8 deletions(-)

base-commit: 259abb551e2944998cad4214c201954ab1ac5c8d

-- 
2.55.0

