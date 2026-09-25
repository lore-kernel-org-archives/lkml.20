Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1C749A3A6
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 11:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790334995; cv=none; b=UcrY6xRXzyU7KTXAZx3i9IAJTRRcj306uBwkB302pwtjSCybQzMNC5BmtA50+YruxFlEOzC83ZdAj4J2U6GxIIXrVHdORlkL4A7CO0+Jn7iKOu3mikQYhGq44EUeYeSQQlGWkfVTsGUQfqv1VP/CKOJeITSnGdhncDKIVs+SFIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790334995; c=relaxed/simple;
	bh=U1jbHaueY7MC/HxzyFNnEOFEzHSMOSsXPYHrHaf6/ZM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YMpylr0pt0+qFk6rHbQLmvo9I86wRVLVhfcZHUwdTpoWMVp6UC68eGJFDbZLPHWnV43KSCyQEsVIaNo0ZjAJAJkkVaqaGdNf3DGJhkBbP+JRBSIjLPeP6ldp3BVUFhMieJo1oeU4bB1KTAfAWp0ouU8syQqsSB+yVbjH1e/hw/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io; spf=pass smtp.mailfrom=bynar.io; dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b=mTOJu6AX; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bynar.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b="mTOJu6AX"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so5760565e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 04:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bynar.io; s=google; t=1790334991; x=1790939791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ik+WyQO23IiOEtGjTwj6K1Ip96ewUvjpBHAq+J58URE=;
        b=mTOJu6AXAbErpC6CGz46a/NG7BzAMIANTKPqHafmCIEXgEhPhD9BOiortObrdjItxA
         xeNr56PCe6VGsxH2oUbLxp9zt+X6v4zq7/sRvzuA/yK17JCUVFl/VmQLRNybyt54yNrr
         UKt79tPYpmXm/aETFD4ePbdJzfLrtdtx933m2TRMB+7VWqM7fG7rTIQwyDM7pR9gzixc
         kl8ppYLx+WddAx4oVT/oIt1A+S5fIBBWGtDgqOJooIz9ijjeimSBZTwB9Jg8oIfOGWMI
         I25cP8KuuvkuMjnoIczsWNzQv2fiEnH0v+zEL8VxQPIfJYOZ84Ei0ejxvZXIJ+vB+nPw
         FsZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790334991; x=1790939791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ik+WyQO23IiOEtGjTwj6K1Ip96ewUvjpBHAq+J58URE=;
        b=o2cZCSzvo/afoVGi7sk+9icSB/aJ4Xo5StI2J7ZaHjnKSe1FrqeZzsssq4m1/jNNbV
         hY7rX6Ho96Wi0n9zjAKd2TldwKBASdWQ4i3a0/ecUtzD/ynp6gxLtREVMJNKsTMgQVAd
         AuSkuPPoTxSJSfUMxLgKQPjxcXWrmI1ZmrWp8DPFFPne8pxg2xLuUfV7usx/Y1cDFqJF
         lBf52JFgKSPc514lMM2dnkep5WI/dsEdNg8g8RfKQgAvxZ22BxC0b006QCiRhG6+VXnt
         4gdwrT0vdi71LhUQdp7b/sqfLnDk5vOZjK0mariSSVd9PHPHPG8CpmKtICqfzadKNEsQ
         nrQw==
X-Forwarded-Encrypted: i=1; AKwUvBxcaWUc8FOAjW/aLCmIr0M+mUfXpzLTPAqhX0/wa5ZlJWNXvr30Y7UEhzD7sG0ClUxn8Kwgu+CSGXkr1ic=@vger.kernel.org
X-Gm-Message-State: AFuF++m6+942HsJF8hhvqx3dbQ5f7vgDAmXSY5tnvbnstBmT1funy6KD
	wQZ1zgZJy31Tgl4JX5TD657KA/9i3OTr0vrU/pFDi1/7d61pVs0N7xddspzTrKoRWzSX
X-Gm-Gg: AYBFou3JO9knS14ohofdCLicto9IirnkUCdKyRvl4uz5tFVTGZjrRIM15jvM7lJns56
	+5jrEMtejF32nJKHEEM7EZwL1hROzzsqPkwRyi04M2wbRtKYklhWNy8gDf+bG2Ug4Z8da0JY87D
	XEKQZnj1hBhMg3b1gDnzmOH82uFUavPob2DjjKgkyupnnDkcJJL5+24EbgTuhHibkfHqGsTPvCL
	KCfv6iMrkGkLNm8xo7MkIabwDu2Ed4rBp2ddejAhP5wAL9WZ821QWHKNU9hYF1w4FDZrJmxaJS8
	YQYkCMS/qPR6Zr4W8hcMdndGlqY0v2lwt2jpmBN0cXJ4muSxdguRJ+hI3YTCYpF2jhojBHNDsie
	kR4v+9BoU8lZD1rpcKVORl6y0/2hCMrwS9ISVPwW/5VJUjAKHADwzK2WZfLjOoR9pJRkPlTI/4Q
	/AS5hb4U64dOmR8vcgTLmlm4m53GIg9z2aMT+BwU2KibtxshY6UA==
X-Received: by 2002:a05:600c:4e86:b0:49e:6ac4:b76e with SMTP id 5b1f17b1804b1-49fe66f720bmr97531355e9.30.1790334990763;
        Fri, 25 Sep 2026 04:16:30 -0700 (PDT)
Received: from cachyos ([151.36.34.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff06cbd2dsm50237695e9.12.2026.09.25.04.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 04:16:30 -0700 (PDT)
From: Giulia Aloia <giulia@bynar.io>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] fs/ntfs3: fix log replay payload overreads
Date: Fri, 25 Sep 2026 13:16:12 +0200
Message-ID: <20260925111619.68345-1-giulia@bynar.io>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes two journal replay paths that can read past crafted
redo or undo payloads while mounting a dirty NTFS volume.

Patch 1 validates that redo and undo payload ranges stay within the log
record before replay uses them, while preserving the compensation-log
record undo exception used by Windows. It also validates the fixed-size
OpenNonresidentAttribute redo entry and optional undo name before the
analysis pass copies them.

Patch 2 validates the minimum payload length for SetNewAttributeSizes,
which always reads alloc_size, valid_size and data_size but previously
only checked whether the optional total_size field was present.

The two checks are complementary. Patch 1 makes sure the selected
payload range is inside the log record when that range is expected to be
present. Patch 2 makes sure that the selected range is large enough for
the SetNewAttributeSizes operation that interprets it.

Both issues are reachable while mounting crafted images. Each patch
contains the KASAN report observed before the fix. With these patches,
the same images are rejected during mount without sanitizer reports.

Giulia Aloia (2):
  fs/ntfs3: fix out-of-bounds read of redo/undo data during log replay
  fs/ntfs3: validate SetNewAttributeSizes payload length

 fs/ntfs3/fslog.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

-- 
2.55.0
