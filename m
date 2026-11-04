Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801214;
	b=vqfEkFhgjRpbEAIICS2nmx9PLk2H9ER4blEWuX+0ttAbpKSMELMCW/d7JnYz18Ths4pZ
	 B9CSaiwSHDp+nTmDBJy+c5wlYEBejLauyX0z+whSQb0zQiwlzzbwA1iltemRcPANg+8xY
	 ORjBa2MIxLgQ0cpbqrErPHDYDTd92TKTy3TwfVqy9By/YpRTJQFMqQrflX41EEN0tAiDe
	 PCGYJqRj+2oa7h92ehojv1biatX6TDbKG3FSulH6GdSoR3Vbg9QdIKX0iR8KnWBZiK9Gi
	 TGRq8BJSK5X+6ba0Kqu9sTtaKLDtDNiVmOBr4LFUV/IeOlodTZEbjLrJqjuRYh+Jh3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801214;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=89dq3IDlIOzn8djResfo9bjk5NhtKhFtGgw4OwKNXuU=;
	b=MPzHbD2M8LUAb1G0d/2LnK3Os8eDCLgePxZG/yfWv8VU+KIGVFSyYD99nSjIxXvGQ9d4
	 J4VPEXzsdrvGIQegIy8zzFp9qgjMBQ8U078yaR4RPmj5ULL70k9nCG5MbGRtNRuHazRSI
	 UbHILySQo4fLoKqK9Ls18tMPn9LWeDCUVlL5dzxDUobh2hVoNNLWqNMoHo2CSNlPHozrf
	 NK3e9rsjrMfOGeLo1m8NRJWxp/DjpAoyWxyOLpg+1GWKvgEmsJ/20luavnn8Ye+d5qYSe
	 Fy6MzI1WjtPzrJnahq9pF81b3U8xPjs8UuOEMzMneKyP37sjJeB6dHkxMhHC6OZJTcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crusoe.ai;
	spf=pass smtp.mailfrom=crusoe.ai;
	dkim=pass header.d=crusoe.ai header.i=@crusoe.ai header.a=rsa-sha256 header.s=google header.b=SA5biTah;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8262F606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:06:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8262F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=crusoe.ai header.i=@crusoe.ai header.a=rsa-sha256 header.s=google header.b=SA5biTah
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1a8cc11ac42so927804c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1793801212; x=1794406012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=89dq3IDlIOzn8djResfo9bjk5NhtKhFtGgw4OwKNXuU=;
        b=SA5biTahYymNXA/4aEmzwpQ//BHc1oGPa2zz3KBaZORDVhemgrPFMvKRjrEDxAxlxj
         +OHoelf8mhFQa3SAtZZ+bKZdLnAVXbX5or2/304+ohqs6JYx+9Xn/jhFQb2W7muI4fYg
         XrJT+RnjF3S0QQaLDGV9KNmfk/jF2BHmVPlq1y3ExGC0QoohC2UmzvrZ2KxxMs2nn+qN
         uPpIJWzv4yJ0DxYyxpPd0O9rOl7uNYT+gufMJsF160FqVGBF65Q7i8DmfMaEbOavHbsl
         pE5pQrkEykkQKs8+o/GYvzvVmQljYm/YmxJ2/rNI5pAmVog566MJFGbT+dDVziNL7OaO
         jgrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801212; x=1794406012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=89dq3IDlIOzn8djResfo9bjk5NhtKhFtGgw4OwKNXuU=;
        b=TBqsMuQtm2OlvJygWJQu1xa9+QXzp+13oUUWuaC7+yuX54BQ8sbkksLyHrM7M0+hys
         GeGdGLlgV/x4PZIkmVhjum8vWvsI/3tpbzJJZnWk/J9NuG7VE9qECfIP2Ih+pxxLLA7r
         9Nob0VEq/G0Kr9bos8w8ho3xsmz0I1g33KdoMukPkM/xBaw1RGezRhA89Ux3d2HlCJq8
         mqMIIf6oEhDPAzI0q3ikYg/kKb3obiNL3j7Bb2cnUsWMsAa8lJgyduxpUevbSWzadsj4
         E94+tOj4+tv126WZvWPX/3Mtn+E3BTGYLXWsO/bUIwCRCXQXWTnXvCBAgX4V5sNvBsTw
         Xh/A==
X-Forwarded-Encrypted: i=1; AKwUvBz3HaTtmBUCywZGhkKiNrAvP3Qx0iT7Ts4OwM98US131iBS5j2UW4lWsktis4HYeigHiNNAvblmwp3LLFI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Px2ts9w/q1jimCEp7ImIA/giCZ194I/RfQ74TGC5nGsqOWoZf
	+00rZFpxfoJ/VnAqAqlkRMlDeWtzlmvvT1WM8meUR4vovrphimeO6j4r9AQfP0k325k=
X-Gm-Gg: AYBFou3QTnNN5QqxH0ybXvZiJ5sHK04BhtSxzKjALlDeDPbvCZNwrrWiTGjaHp6/isD
	kEWRGXqO46Ij9/pPUpAIJzWlmbyU+lqRlC4KC7584IOhl0dYoAhnNLXihtmKfYWRL/5yZr8a/8c
	Vx01NsbrbFmPdJbXMQNRDz9ZIDtzHjTOOJKpC9BsM1ozgg1B+7oa00sGLQpwUZXNFGfpcVRgKEC
	N/UnSgpxT8ZXQ/gHsykV18MOxHh7smsuDquwP8NHioRLJHzw45uEtpi4g359/D9RKUrp+8CkhU0
	s5hDRvFnIoCQyqYCzgeLXEv77mfp8xIifkug/46zmOAn0LoGw0UTDjDSudYScS+cyBFh38bG3vJ
	yeZ3qSDD6ETfemhMZKZs9U4WK++WMcqxVvbcAqzrfOWFgh3JaxyhjCVfqmoH2Z5yPL/ATZw+rBS
	gm/AXFqXjPJHxwTUyqgg2hM6PH9wxOm7bF2s269TBbWlc+Arci5T0qInGB4Mtf1+/f94C2iR9az
	8/IaSNOvnlP9PtqsIqTtYeBJwHQgYWqM0bI4Vx3RrhTOo+PR94XgUTNgKk1TAle+ZhJb4BhDEaK
	hNMgCHvJbSdXTuihaS3/aIFEU7uBSEAQMjEa2UT9T0IzYW2Oee9qyOPkjplFg5ydBpZzdg2Omg=
	=
X-Received: by 2002:a05:7022:120c:b0:15a:4155:3d9a with SMTP id a92af1059eb24-1ac609808c6mr21925883c88.47.1793801212374;
        Wed, 04 Nov 2026 06:06:52 -0800 (PST)
Received: from MBP-Saravanan-D.civet-hops.ts.net ([71.202.170.54])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c748eesm7938399c88.23.2026.11.04.06.06.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 06:06:51 -0800 (PST)
From: Saravanan D <saravanand@crusoe.ai>
To: linux-nvme@lists.infradead.org
Cc: kbusch@kernel.org,
	hch@lst.de,
	sagi@grimberg.me,
	axboe@kernel.dk,
	nilay@linux.ibm.com,
	dwagner@suse.de,
	sgogte@purestorage.com,
	hare@kernel.org,
	hare@suse.de,
	linux-kernel@vger.kernel.org,
	iyamahata@crusoe.ai,
	kiyer@crusoe.ai,
	ganbalagane@crusoe.ai,
	sjpark@crusoe.ai,
	bchen@crusoe.ai,
	Saravanan D <saravanand@crusoe.ai>
Subject: [PATCH v7 0/2] nvme-tcp: allow setting per-queue io_cpu through sysfs
Date: Wed,  4 Nov 2026 06:06:28 -0800
Message-ID: <cover.1793800758.git.saravanand@crusoe.ai>
X-Mailer: git-send-email 2.56.0
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

On hosts that partition their CPUs after connect time, the connect
time io_cpu selection can place a queue's socket work on CPUs owned by
another workload. This series lets a control plane set each queue's
io_cpu through /sys/class/nvme/nvmeX/queues/<qid>/. Patch 1 adds the
core helpers, patch 2 the nvme-tcp attributes.

Changes since v6 [1]:
- nvme-core now owns the queues directory. A transport lists its queue
  attributes in the new queue_attr_groups member of struct
  nvme_ctrl_ops, nvme_add_ctrl() creates the directory for it, and
  nvme_uninit_ctrl() removes it through the new
  nvme_queue_dir_destroy() helper (Nilay).
- Rebased onto the current nvme-7.4.

A blktests patch, nvme/077, covers the interface and follows in this
thread.

[1] https://lore.kernel.org/linux-nvme/20261023230426.6425-1-saravanand@crusoe.ai/

Saravanan D (2):
  nvme: add per-queue sysfs directories
  nvme-tcp: allow setting per-queue io_cpu through sysfs

 Documentation/ABI/stable/sysfs-nvme |  31 ++++++
 drivers/nvme/host/core.c            |  12 ++
 drivers/nvme/host/nvme.h            |  25 +++++
 drivers/nvme/host/sysfs.c           |  88 +++++++++++++++
 drivers/nvme/host/tcp.c             | 167 ++++++++++++++++++++++++----
 5 files changed, 303 insertions(+), 20 deletions(-)


base-commit: ca7e6a9a693240f059a0b47726f64a3f0573011a
-- 
2.56.0

