Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794777004;
	b=NDSXMC/Jabl7YYL7vgWX+zypCIz7LShzbNlqV5ntcpFo+GwphMfE5zk+FBq14T8Izvmo
	 zvOHixbbw5ddiUS1jYfPcrS5Swg4jW5+Y9utiwJBhZypBY+Pu/EXqF+DTj/Vz7uTLKvJR
	 ups/yt+6y4d010KLILugD4d5ZLB426vbJP+SEu5t9kseco2USRqheWjNYl9hcN+qi8iyq
	 F6Sdoc9lYYIQoBbfYSFaDZLVhwc5aNRzaJ/RUllkj7sgUIsOZL7WCIDEia6YHIlWUZRkA
	 RdCAHR9P/5vxSXxBVJnzS3ngELY4WIzNDRdYZprqUPUCUx/Wx2ME4B8vtWVfjO3BCQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794777004;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+9JW7J5HjIZOKB44W/FdWPu4us9PkTChnS047FJOEoI=;
	b=1xqlChRsaNi9QbkFNAzBkHxNXBJdm5Jx+ArwmTZwKBW291Kf1TXYlPFZjSZWsh/RtucD
	 wVJr/m7k8je/w2281K0CznqfLvpAEKJR2Xtc4ZFxBQfFs4FJ2pbsx7TpUVYEazbBpHPXF
	 z5sj8TlXCP2NMOHqMDiAkbY/CdB8AXxp7FDpgXNHTJAHDtry2NEnFLwAcstKzCv96LbU7
	 hbP+NYK8b/p2tYqI029F11Dns1oocLb+r0/2o8QdRQtHPu1ghYvTsfDuOMUNj8UCUvMg6
	 3Fmk/4TMoGC9ggueiQA+pSXt0jm1mj6Z04aTh64DqFAGyReoH731pWRi8rMz03DynrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FwJPOjjH;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3CF606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:10:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E3CF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FwJPOjjH
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-89d6bd67045so1228198b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794777003; x=1795381803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+9JW7J5HjIZOKB44W/FdWPu4us9PkTChnS047FJOEoI=;
        b=FwJPOjjHvrLaPG6Baz9Fuotuorj/J8ft0QxQAijmzxYs9d8Jwk4+cFB1Q5vhcQYEKM
         O44N8cyMLQPPkcyOVhLnv6jTxGvrJt9Pdki9LTFvmV68PCsVjNbHxM/swxSklM/FiYym
         4PUrX0wKqG7sX+ZTlyiugh4bgxTF8rh0YeRGGWs1+CfcDuYIpUqWmoNvp9WV7uc/Afnb
         Lv4qFrhptW4pw6W48q+jdfX+lVzwubXcsi4VwJmHkJQbWct/P/ijvONiJu8WUGIbrwQV
         ejwv8mEQiK8W49qICSUoseiqTnTWCaCxFHsXFbugdIN/EXtDLNK1hmkGreZGZdCeKC6H
         BciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794777003; x=1795381803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+9JW7J5HjIZOKB44W/FdWPu4us9PkTChnS047FJOEoI=;
        b=BoIC4duAgo+A7gMbtvApobyFkE7C6haUM6rM5gF45AD+JlfC2roZvBLv8n+yKCiLSH
         IpGnljxoHu/PuFtwhvpYh22hiTR7TREXBjaNyky/Lbw55CbGEnGyDmRXipL+j7Ajaxtx
         f0pzwP1Q78mxj4ujOOhfM6qLqTVnAfDrnBi4VN48/qB4jOoeZSTW0hr1lEc0MricW/CH
         D6RVWZQtpfUBtop9bgNc0jO1eR6FqisY3I9/zFHH0Q4ntXVAGj4c3mpYhC1BUIpdG42w
         gR6R3okdwo4vabBpC1OowF8sk+XON1yvm5DIcWGBHIN7/UByb008wgXTs5rj5cozKkXu
         caig==
X-Forwarded-Encrypted: i=1; AL+hErEDTluXy9/pVVGVEh7dtp6X80wLD72++WwnSTVUoG3z/45tvmWS8zmYncxWMESGpfR6/B9M8YFJdYH0f/Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9a8/A56FunG8wD0s+MkJC2LCGVuhQu7Z3ZOAV02vMLnysD93n
	KpuVXn6nEhUiZrv2/HvQOFubMBLo+BYzcuZJ7HO1qQ4TkJzGiX+owh0p
X-Gm-Gg: AYBFou0SCoQx7flVemA7QZqV4x4zBbiq6sVF9SZZRElH7Ix1CM2eOizw0lBzregl0F0
	VJdQ4WcSL++Qh0K6tSIZ144KFGqAL9nHLGHCrgAMj2feP4AXAhzp6X/imzrWSHd65ZmnyZCTD8U
	qQO9n+NpAJAUDPp1OjkujK092jA4FensJSZ+zePG+9GVvSWv9Nx5bYQqSo0hsjqbLVEQjvC9H6O
	+Jm72R79TnIULpUGZRkLJXiBBQBjgo9bUdalwYHykJTvAGy3SRCm0l04ehrIl5urbT9Zv6fjE9Z
	TFkU6PKPGgAMOhKvQOYoaPTd16/LqwFfX8IVbiO8ePgqnZR9urT9SvBLDUNen4rdJh2YC6K+7Dx
	8Z7a1bbYs0WU7bI/VLmovbTO0edROCCzTJE1TChxIX/fC5efbLsZ0rTr8X6Nz/cXXCnM1hrxyrw
	neaQ5ae3Id5cFQZPevwkvipeS8CokKBv4j640nEY8jpJjAPksRwhiX3v1DdJjimQh3RpJNSs6EN
	vmWmZTrCB72b+sfhV3s1B+vq1QzaW8+VfT5umIsPQ5eyC0qRLgCXCdqmApXQ2vfSvoiD4UlyCGh
	C2QXu28CjLNHjq/CZoqmqMTkwc6KSKUXGlmv4jFrbj7rs3GJZg==
X-Received: by 2002:aa7:888a:0:b0:888:cf3:e4b6 with SMTP id d2e1a72fcca58-8beb7f0b151mr5424463b3a.30.1794777002725;
        Sun, 15 Nov 2026 13:10:02 -0800 (PST)
Received: from localhost.localdomain ([112.170.44.210])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed1a6e7f5sm2892615b3a.25.2026.11.15.13.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 13:10:00 -0800 (PST)
From: Junyoung Jang <graypanda.inzag@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>,
	Jan Kara <jack@suse.cz>
Cc: Junyoung Jang <graypanda.inzag@gmail.com>,
	Amir Goldstein <amir73il@gmail.com>,
	Matt Bobrowski <matt@bobrowski.net>,
	Gwanhyun Lee <gwanhyunlee@gmail.com>,
	fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] fuse, fsnotify: handle embedded NUL names safely
Date: Mon, 16 Nov 2026 06:09:47 +0900
Message-ID: <20261115210952.2140036-1-graypanda.inzag@gmail.com>
X-Mailer: git-send-email 2.43.0
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

FUSE readdir and readdirplus parse dirent->namelen without checking for
embedded NUL bytes. Through READDIRPLUS (fuse_direntplus_link()), such a
name can instantiate or alias a dentry in dcache whose qstr length
extends past the first NUL.

When fsnotify records that dentry name, both inotify and fanotify size
the event buffer from qstr->len and copy that full length to userspace,
but populate the buffer with strscpy(). Because strscpy() stops at the
embedded NUL, the trailing heap bytes remain uninitialized.

Patch 1 rejects dirent names containing embedded NULs in FUSE.
Patch 2 zero-pads inotify event names through their recorded length.
Patch 3 zero-pads fanotify event names through their recorded lengths.

Each patch applies and builds independently on mainline commit
23c62304dde2, so the FUSE and fsnotify changes can go through their
respective trees separately.

Testing on x86_64 QEMU:
  - 1/3: Crafted FUSE READDIR and READDIRPLUS entries with embedded NUL
         names were accepted before the patch and rejected with -EIO
         afterward.
  - 2/3: With Patch 1 omitted, FUSE READDIRPLUS + inotify leaked stale
         slab bytes past the embedded NUL to userspace before the patch,
         and returned zeroes afterward.
  - 3/3: Default FUSE mounts report a zero fsid, so fanotify_mark() with
         FAN_REPORT_DFID_NAME returns -ENODEV on the FUSE setup;
         regression-tested FAN_REPORT_DFID_NAME create and FAN_RENAME
         events on tmpfs.

A custom LLM agent assisted with initial discovery and reproducer
setup; all root-cause analysis, patches, and runtime tests were
manually reviewed and verified by the authors.

Junyoung Jang (3):
  fuse: reject embedded NULs in readdir entry names
  inotify: zero-pad event names after an embedded NUL
  fanotify: zero-pad copied event names after an embedded NUL

 fs/fuse/readdir.c                    | 12 +++++++++---
 fs/notify/fanotify/fanotify.h        |  4 ++--
 fs/notify/inotify/inotify_fsnotify.c |  2 +-
 3 files changed, 12 insertions(+), 6 deletions(-)
