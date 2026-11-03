Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793677801;
	b=N407DWGFJw9OKHa/xOJYKZ/GFGe0/7bMNdlDLz/XmxlyMLnr2lkAs1tsft2/yAvOAfvS
	 CHoAgAkKQrH0/EefaJLZeLn7SQvoTboVPOMXW/brkaUYKYHG7/EBjBvnBlzZFzzRc2fuK
	 l15vslX22pzPbe6+7mbYex4o41kH4ufcKIjfSwFRucLZAYoCNF185qodyUfR7l43MSmia
	 70nfuEQADN20Pd6FUZ2RQfoGLohOh5DzlNWs3pFwDc/3g+nfWCyDYwi1XkKNskGy8P5rN
	 vQ7H/idPkOXlXNnO1oZfAZZlCKJwn8E+ryV4EPs0o2pTjYTcV8EukVW2ZxNXcTbF9Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793677801;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WwN7oTt+Frc9xSRiyvCe82KmUH+lH7uYQeHbdcghhHk=;
	b=qJ0nZxkLEz2jD/dQ9STqNwBQ+xOU/nVEA1a1AmxV81M23Umn5SfExxA2Ptr71smLZOVH
	 TJ5QaqI9WM8/kF7yNm/Qoc8S3iQtR6/Ps8K+U9GNuxcG6nCltfXwQuoC25Pz9yGhb+Xq7
	 0xpEWIoPiBJ5lJx8ZebaPndWwTf4W9LzBVxBdhcyT9zw5lyB1kROdYSxmEWAQ8WArFuOx
	 aCpRuwVY5JPZ2yJk50auE0EkbiZ0ckjCLdvG+DDwF/2DlMm2RxCB/C6VMHWoM+5XPUHWU
	 keVxfKd1kN/Pznl9NRH9g+qY4tqT73pueQR3fu6CcwpDs+uPITLXanA1zMwhBoAeIgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asu.edu;
	spf=pass smtp.mailfrom=asu.edu;
	dkim=pass header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=WFxQXFZM;
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960BE606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 03:50:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 960BE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=WFxQXFZM
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-536717a4d83so35752151cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 19:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1793677799; x=1794282599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WwN7oTt+Frc9xSRiyvCe82KmUH+lH7uYQeHbdcghhHk=;
        b=WFxQXFZMKejQcVbsQryiZ28kiEli4eCrQ2u8YBLUucNRK9b7sacW0xbIhYsk/ToK8m
         /Bkl6rtQHDzhNvWGUOHh8UQ5TrAR6LZFcqNVKA83w9v1fimnE+RkHTvNAgGlinG+TaWh
         ko8FGmDrTF8fVKn3wgXaKXslzt5+XLPhl/1NFeRDPg5uc/xucCGpk0QmZvYk9/RnGXlu
         wA2IYmMmJZQdQBkKp9MXpaOAzqs7thKrZ6U3GzYxVituhWbMaqcTqCEFjhCC1aOqcmEu
         4BQYkeFgzoZQQD6sFXKNZKqdG2NVPmOgoarGgQHdbcj+PLbIRFMZTuSjPwYSoPTlC3no
         UDhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793677799; x=1794282599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WwN7oTt+Frc9xSRiyvCe82KmUH+lH7uYQeHbdcghhHk=;
        b=LaYqEaze2bWZwQ/agWUceGwxbGMiAvKU1/TA0tphpms8hGwBjSoma3U9ymM1AUBC40
         A2NV5jaIkRmpnLbg+z8H+RZUCom0V3FCGxz6ts5j2+PWJu60aeHvaoBvyUPnVf2LuHQh
         ww4Re4BJLUndhcieBdBD5QRSsf0Rvv4/fykvabHlMGKJrlMeX03K34FbptM84YEhTV1V
         oEgqrdUHX2I67dKxms1pTEGS3TcXCxXaHQeNFqKw2H4zC3z22EkaU7S/f2jod9bktAl4
         c9T5wG34/Cvf2em7Uvqus++Bs69sHQqeoJUCldVJ5OV2lsnj7s51nEX/PTaGFL4aMpsH
         GhrQ==
X-Forwarded-Encrypted: i=1; AKwUvByxUFTLFH/zZMAs5vAZhUJlFBn8WbAHf/HsCJ0FpKuAp/uIRj44uus3n7Q5T7+2J2ZIHfU35iVMeRT7YxU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGzAI8uO6Cb6WgViO7Qn6vUBrrb0/VhLsHMHEItzHvp+Auf57k
	a+KV8DnMixVI0MvkcHImBvqK4P2na2EDO0jnZvxNRqztTKGY/4+qaNJMwASeMi8Lz4nlMhPGKvE
	WYOL0MDdR
X-Gm-Gg: AYBFou0ahG3DEt4DeYWIsylFwq1Vreu3AhzLt8wo0GDgSUTvD1ukc9CWD5o4T7q9YaU
	zUGmgtEKiihLZmowJF4/Lz+mGi5JBlneWgep5uMXtdJRH8jyFgAU0RYjDFG4GtvCZELXFVDl/qM
	Qaf7HVCkJjwTK6sewQ/somAA5Qo0X5ZUs9/UjtW2BY30DedbKWFClfXPIPpThVqkR9PItPKCcMN
	c/p+I2epT/yE9HK5gmM5R89WQyPRkfGslx67iQg6A86D/rMKse8y4SYPXLThSUhrabGUbM5pWuv
	QL6gTqqavyhAeB3l9VtmuBziCJhYClQxm+5Tm7qHkKa1DTsArrtF/S+3cC45fLkrx7EeXe49D+j
	DDBM9B55mLi2GPQjQAJ/jiLpOXmNks8zzx6gHiT0JWBg/dMo9e8DtVahvNNw1EJJhgUPiQ9HQ8L
	Cfxw91pg6TKhYcWGvIw9GpLq/jWQ32S/7JDOHavO08Qjc/1Jr8aW6C+6HcUwz6JGO5+LZDelb99
	pqq2FAQk1BfYQci5tFjejSnU1SSas9wpsYWPXRw9qyujwqL+CH1k5pVi6nMO8nkQhUqkTn63CPl
	qAFrBkfhccX6eIOUIwgucz1JFNlz4Tl+WOR0
X-Received: by 2002:a05:622a:a15:b0:536:3463:88d2 with SMTP id d75a77b69052e-542b6a72b11mr198323311cf.22.1793677799065;
        Mon, 02 Nov 2026 19:49:59 -0800 (PST)
Received: from localhost.localdomain ([206.206.222.26])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca7e2342asm105461276d6.5.2026.11.02.19.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 19:49:58 -0800 (PST)
From: Siddharth Mishra <smish149@asu.edu>
To: David Sterba <dsterba@suse.com>
Cc: Qu Wenruo <wqu@suse.com>,
	Boris Burkov <boris@bur.io>,
	Chris Mason <mason@kernel.org>,
	linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Siddharth Mishra <smish149@asu.edu>
Subject: [PATCH 0/2] btrfs: tree-checker: reject simple quota metadata without SIMPLE_QUOTA
Date: Mon,  2 Nov 2026 20:49:30 -0700
Message-ID: <20261103034932.1790235-1-smish149@asu.edu>
X-Mailer: git-send-email 2.54.0
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

Simple quotas put two types of metadata on the disk : the status item
with SIMPLE_MODE, and the owner ref in an extent item.  These two types
are correct only when the super block has the SIMPLE_QUOTA bit.  Several
functions ASSERT() this rule.  The tree-checker does not enforce it :

- The tree-checker does not examine the status item.  A status item
  with SIMPLE_MODE and no SIMPLE_QUOTA bit causes a BUG at mount, in
  qgroup_read_enable_gen().  Patch 1 adds a check.

- For an owner ref without the SIMPLE_QUOTA bit, check_extent_item()
  gives a WARN_ON() and accepts the leaf.  When btrfs frees the extent,
  btrfs_get_extent_inline_ref_type() causes a BUG.  Patch 2 rejects the
  leaf.  syzbot found both symptoms in 2024, without a reproducer.

Two sources can put these states on a disk : a damaged or crafted
image, and a power failure just after simple quotas were enabled on a
kernel without commit f2363e6fcc79 ("btrfs: fix transaction atomicity
bug when enabling simple quotas").

I reproduced both problems with crafted images on for-next.  With the
patches, the tree-checker rejects the bad leaf.  With patch 1, btrfs
then mounts the filesystem without quotas.  With patch 2, the mount
fails.  A clean simple quota filesystem still mounts, writes data, frees
extents and mounts again.

Siddharth Mishra (2):
  btrfs: tree-checker: validate qgroup status item
  btrfs: tree-checker: reject extent owner ref without simple quota

 fs/btrfs/tree-checker.c | 41 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)


base-commit: d6f76ca0a70d0c814731394a625ff0dc1feb390e
-- 
2.54.0

