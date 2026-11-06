Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793969165;
	b=oV4KfyYLAuhd5ZBRbMu2fnTzVvOI1/EAY3iyLpnHYC6mqmd1zpxhqqIxM0Q7+K98JDwn
	 6eJFLy1/mPZFwdLgPJFlAOxFvxlgoPkp2T/DOQ8T1xsbdXh/ipBYKF+iGnLnbbt8ky74E
	 5PyiyilrOArS1oIXgju//q7iOFKvHwVQPfLrvz7LIrFlmuototAQo5C6SS09HrxhtjFl5
	 i0S3XeQtDR8OfykR7dHGwp/7Kp7vw7tEJg6kRSY17KbaucbYK3rVEGpDBWJSHos2E6EAm
	 0Jnq17GhIlBrcM571tEPW2h+T0ZROtAmLN3goBWHeu8RBorFaDuviUN8930OltAaqDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793969165;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5lZ1X9OvYujo7R37IHLIlb8OsfThW1dgQ21ejL+gEBc=;
	b=Z8/lYzr4BjtaisKPPmEJE1C+G6C3miDSs2u6C4O5L9DY+uhDKOQSu/Ws4tF5r7OlKdS5
	 w2niKloaTubaB0dpk1n5SlERojmp4KC7AwbOJ15gpwyST2AyFxsUgL2P9JKvLZIsdj9hi
	 Ilu55uQUuGuoxMwXYE+CpwCKC/sFwruLNqHipYg5X8WMRB/VGaJSB7SWp7muEQTYBi9cx
	 IaXw++QmyOE/KskzmDV4WExSGxcKMijNUiNuTZX4CddXpBdW2E0//JFAmHRYXZM8FX40k
	 aLIDfKP4m55g1xlPc89CoAA3DIs+6nZGHKWTKhuEGyLOAX+1Uf6Up6q1+eO2RrM2xlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J0EVpDk5;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC35606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 12:46:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FC35606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J0EVpDk5
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso836532eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 04:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793969163; x=1794573963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5lZ1X9OvYujo7R37IHLIlb8OsfThW1dgQ21ejL+gEBc=;
        b=J0EVpDk534xXmZlhJmIUi9XA9qotEUu15atz2gyPmWLJFyPapECP0OJsL4AlqB4XSh
         Egm65cYGOfDobgBFJDvbnaaO4SUHJnXExolEW7fETfOsH55o5ppeZdVj1w2sL71z0z1z
         B9wC/nQrI/H3wrO5cQCWME/2t5WfXdci09sl4ZxenZ5AFP8JOepG+0/8k1XRAmUF44B5
         N9DwqTaPnjZ2oo3jJ3pfR355upUI5EezGI3/VIxiM5oxomCB1kYh8ACJBDA5iTWEivr2
         VGJdENqiBmCehsdmtOiYMNefTTFLpQWkY0jNw6ILdqPJwbh1oRUci63l3W0gspSv5S4J
         p3/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793969163; x=1794573963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5lZ1X9OvYujo7R37IHLIlb8OsfThW1dgQ21ejL+gEBc=;
        b=DHAGxk/MdHcvq0QMMysNvYnESYDStAxTArbBRfVN9NO1Hpgk8aQN+DeprgEcFaka67
         ikjU6WGAH3SqMctUkNAMlDHEg6PB1lm0YIyniGseny69Yw0wKQmnYTaOuo5guQU9LUv5
         D440HR+rD93uU4/kDeqFYXw2AxfFEL0IEdFVY6dgj2jp24tG6vRcxouSwBb51WBS92F5
         tlSGjIbY9fpTY02ek7eOs7QVAMqye8uy+uXYHuN0fFgmF5HQ4dXoYexLxSqohhC5+wTe
         l3qzT1cNOMhj1SDtNqY5pyUjwoKX9Sl4SHwWRvLbWGASaxy2VGYbyTYbBczOehCGzSOu
         8++Q==
X-Forwarded-Encrypted: i=1; AL+hErFGwlEAvcRZiqf1Q8tielaNg4jNcTG/kmqCv/U8DkKBsBd0AJ776XGBcBEwcde68rniiHYDknvTHIcEWFY=@vger.kernel.org
X-Gm-Message-State: APuU4Z92CSH8lwxIvjeE78bSu6DdJL2S/ZBepXAoQIuIcxQ/CET+HvhU
	t/VXsHrwyN+xdGBlDgAkcQy8GnzSOnvNrKveU1ehKm2Eu7iQX+UmOVGF
X-Gm-Gg: AYBFou1U+rYl2Ov+yV3BVyteE9Qpv7claumEMjeo6YmMn0Jo2ZmbT+KMnv2F69yd25T
	/GkIsUGLDVOMYtpgI5ajazmUCyZdN/bzyNa7gg9KcSvx47is4yUXEFHfqSoiXCKWSP4dGb86ENu
	wJiki4EdzqftzUI/HebDNpwSja/A6bQqussBqzQkwGR+uRGu6LyE9C8OzFNl8RPnSyROvGEzyXT
	NwA+LiOKJ1Rejk+sJiXX3YwBDdPneyVaVHN8i+vE+U3Q2UwhTHQ2b06gnEg3SkZtA1fcvwEZd+2
	goriujubkCk7k0E3M20JgYo5ETlhqjSVe8hi3eRmlWcUENlaMXNEe0rvp+xyujGpNm+hZyehWfF
	vRqYnVqmh/tpTo41K+eQnlFGL84m1OUdmNyI8SQcEplaEMkDIBmyvuhohXs2YKTMrtXOiCMRflB
	m/+qzEFabAYse/KvJAzgLROq0Zib4EmDqXLYTuDkmpM56OtnFfLSczBd+ThjXjDdPeRWlgi2rMo
	iTOHwne3ZPkxeC41ielN1tz5DvDy9lXYqio5wjC1sn+fTIrZAuJ+Dv+ZDLjhu+RNVjYNZo1p9FF
	OwSIiACAfvaNNDOM08hRcLNMKRzsGu13P0Hc1z7lL4qmvvdQ/MpjLfOGmVc6WIOvvA==
X-Received: by 2002:a05:7301:1601:b0:36e:dd5:fb08 with SMTP id 5a478bee46e88-36f773f7c7fmr3004408eec.40.1793969163232;
        Fri, 06 Nov 2026 04:46:03 -0800 (PST)
Received: from anon-laptop ([103.187.196.159])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa651eccdsm6802331eec.1.2026.11.06.04.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 04:46:02 -0800 (PST)
From: Wahid Khan <wahidzk0091@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wahid Khan <wahidzk0091@gmail.com>
Subject: [PATCH v2 0/3] ntfs: three fixes for crafted images, found by fuzzing
Date: Fri,  6 Nov 2026 18:15:50 +0530
Message-ID: <20261106124553.2617026-1-wahidzk0091@gmail.com>
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

I fuzz the new fs/ntfs driver with mutated images: an image from mkntfs
populated with ntfs-3g, a few bytes changed, then mount, walk the tree
and write, under KASAN. These three problems are still present in
ntfs-next (e62b384ca). Each patch has its trace and reproduction steps.

1. ntfs: do not read an index block outside $INDEX_ALLOCATION
   A directory without a usable $INDEX_ALLOCATION hangs on its first
   lookup. The task waits for an mft record lock that it already holds.
2. ntfs: open the index allocation before reading or writing an index block
   NULL pointer dereference in ntfs_ib_write() on link().
3. ntfs: do not convert a named $DATA stream when making room in a record
   WARN_ON() in ntfs_attr_make_non_resident(); no damaged volume needed.

All three need an image to be mounted, so a crafted image, not a remote
attacker.

Changes in v2, after an automated review of v1 that I checked by hand:
- 2/3: ntfs_ia_open() also succeeds for a directory without
  $INDEX_ALLOCATION and returns an empty resident inode. Reject an index
  inode that is not non-resident, as 1/3 already does.
- 3/3: v1 opened the named stream and converted it. That would lock the
  stream's folio under the mft record lock, the reverse of the read
  path (ntfs_read_iomap_begin_resident()). v2 skips named streams in
  that loop instead.
- 1/3: unchanged.

v1: https://lore.kernel.org/all/20261106091420.2461683-1-wahidzk0091@gmail.com/


Wahid Khan (3):
  ntfs: do not read an index block outside $INDEX_ALLOCATION
  ntfs: open the index allocation before reading or writing an index
    block
  ntfs: do not convert a named $DATA stream when making room in a record

 fs/ntfs/attrib.c |  6 ++++++
 fs/ntfs/dir.c    | 14 ++++++++++++++
 fs/ntfs/index.c  | 22 ++++++++++++++++++++++
 3 files changed, 42 insertions(+)

-- 
2.53.0

