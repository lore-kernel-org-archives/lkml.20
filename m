Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B063C4825A0
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 21:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790890700; cv=none; b=SSIR7aH0PoJM+JDx9XPZF8VTTGbYOcmRo4Bsa+UAJIliLOC4UPrFcilV5fuKSoECYWNulR7l2QanlNKTf2bseK9kysTDl2IJiVGpwIrTBoXwUOjopEc/1TsfcsGtiKVAL11I8KR6MXGUDOb8SsWwD2YL//RdVSFGVo6f5caKvIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790890700; c=relaxed/simple;
	bh=AspwvTERhCa/5SyVWGjRHHTsaV7FE1ndt+3lzpHQ+go=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eraW0SH5IdH0qz9zoIuLMt7TvTZO5hKQuwYneeLj2e2G9BLkwImc7vQqY4NJ1wtnAf3yZ+uNmN5njAvmgPtKg0q/x214y99D+4561WvEed227wHnkHHJqgdLAwP1e5UyiPLUTo86mT/kbs4xogZkSAD6NhUwDFmKB8zcCH5tftU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=noroxi.com; spf=pass smtp.mailfrom=noroxi.com; dkim=pass (2048-bit key) header.d=noroxi.com header.i=@noroxi.com header.b=nF7zpyng; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=noroxi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=noroxi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=noroxi.com header.i=@noroxi.com header.b="nF7zpyng"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5ba379d8804so3107638e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 14:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=noroxi.com; s=google; t=1790890697; x=1791495497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fgjFQHRzOc9aDDIMHQL4Oa7S8OApJyx2CogFTCRqEAQ=;
        b=nF7zpyngmFd+ML31Nt78Io2+erTKGxVvwUEsqy/qsGN5RbaoeekdN6iBOZ5jOKUCGd
         qwBvJTriOKOtyVfxAYZxpNAKG4n4+sxk+q/JVqW2JaT8dRcCtJkBK9vBuDxkWI401q8h
         zySFMnjJuzda+xXxbDpMpjFpv1RsZHZ2/aJ/otWbD11HEm8iIb+t3pT6nIj2V3C25b9E
         LsdyJeckYi2KJmixtsJmXe/UQBnknn5mTjiLFMqnc7bQhY6xZIWUFlAkyXwcFCvLP/M6
         bXVSBE9Niq6YnI+6NH89cKW9jFJgGqkKYKbZZ3Etty5wwMNAx5482xltZg9EoH/BsstD
         pX/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790890697; x=1791495497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fgjFQHRzOc9aDDIMHQL4Oa7S8OApJyx2CogFTCRqEAQ=;
        b=psTKuDcc6fgkR9iYARBvZcuyjsf8Wb20CPGu9Js15Rp7qGdzltEUeRsC/N/oY/MK6e
         hD1Eh+lduBRdsrLmflhIQrupOXQJckYj7nqyup/fU0PnJK8wMXt7MmubcWXBoeEtf87D
         NO/VHrZTMxSnXmrFbD45pZ2vmnffqeWe37TYOSF/HeSL3AywlMBxPwTqgF6iOx1KYcfx
         mIN6Lp6gH91Xt2ZdZTQET4wo5WUktK3tkU9dy5L0DBFPloqxo4SLN7jkB3axJPwidnlu
         HM5gLRwBU6HqBgEnqBXCiTIH/aeHogFQrVgDhieOZBL4dKM8X0L+b/IFsAly7XctkypY
         F+BQ==
X-Forwarded-Encrypted: i=1; AKwUvBzR+HbZCK1cAk7jwLLYk8q6UG+/eATTfrkOwH+vC2o5HYormdVeWoh8zEzzbTKV1265D/0DlcC+oFplze0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJiuMw4Z/8bWhy0Z2mW7AlQFddkjCavz+PPouQCmSrgd09HYWY7
	zL//tsOekcvXqBykDk0QlSDTqXluWLIhdWYjPY40q1Gh5c8xkxlhIqrnTnvoLtlvEwHA
X-Gm-Gg: AYBFou0wmGPWIIYd+Qd+hQQLxVlHZDc7aYrjpFJD3s3IzgnGyqzq0Fp4SweWJVR3wrh
	0bZV8i0od8Zlz/kJ6t5dC22p6R/JipSscZfH/tV50fKAhj8636u7VjC8/dAFr1L4ps00B46xzdr
	JuJser5vlxwGVQRmtACwQP+OOR18eR0P1LiWWrc0iCBrsizu1EA1BVw2Z/hAw5PJIWtpx1xbSGT
	uErPbN4G1nrRja+dNsvBR6ReD4NLQuYXwGVWRc2Hc1RANHYG617NDcQvsBKjodfjxNVCKiWO3Ka
	lSKhw1AQ5ERHSSDtiuWqAgf2C/jbV/sfvp0faU/PAC/LMQ78W0RE3XmiMSq0tNUhTt2CVjt5DFO
	Kb3X9ONhRx3F/GTYNql5gvqrZIim74Om9A5Tu9cXA9kIfAEBFD4Yg077xYpV7vS/tqZ+xvSsEM4
	3nqbi1H/lz/oVFho4pg7zAHC5mLRv/mqcf2tjicgT+YAQVxUBkAqrIyNqMNMgIdMs33oJ8bZbig
	alU8a3m6NsB
X-Received: by 2002:a05:6512:8345:b0:5b8:b2f0:b5b0 with SMTP id 2adb3069b0e04-5bb9bb260e8mr124544e87.46.1790890695967;
        Thu, 01 Oct 2026 14:38:15 -0700 (PDT)
Received: from lab01.. ([2a01:4f9:1a:a462::2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e333cf3sm2294361fa.39.2026.10.01.14.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 14:38:15 -0700 (PDT)
From: Mahmut Emin Kurhan <guvenlik@noroxi.com>
To: linux-fsdevel@vger.kernel.org
Cc: slava@dubeyko.com,
	glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com,
	linux-kernel@vger.kernel.org,
	Mahmut Emin Kurhan <guvenlik@noroxi.com>
Subject: [PATCH v3 0/2] hfsplus, hfs: fix B-tree node leak on hfs_btree_open() error path
Date: Thu,  1 Oct 2026 23:38:05 +0200
Message-ID: <20261001213807.1519745-1-guvenlik@noroxi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <0de056179e3e0a7c4ef525cdb143647b7493dc71.camel@dubeyko.com>
References: <0de056179e3e0a7c4ef525cdb143647b7493dc71.camel@dubeyko.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is v3 of the hfsplus/hfs B-tree node leak fix, rebased onto the
for-next branch of the HFS/HFS+ tree as requested.

The leak is unchanged: hfs_btree_open() can fail after the head node has
been inserted into tree->node_hash, and the error path does a bare
kfree(tree) without freeing the hashed nodes. The fix factors the
node-hash freeing out of hfs_btree_close() into hfs_bnode_hash_free() and
calls it from both hfs_btree_close() and the hfs_btree_open() error path.

Changes since v2:
 - rebased on for-next; the extracted helper now wraps the hash_lock
   serialized close loop introduced by commit dce0e0248205 ("hfs/hfsplus:
   serialize B-tree close against folio release") (Slava Dubeyko)
 - on the open error path the tree is not published yet, so the lock is
   uncontended but kept for consistency
 - no functional change to the leak fix itself

v2: https://lore.kernel.org/linux-fsdevel/20260930232312.1405042-1-guvenlik@noroxi.com

Mahmut Emin Kurhan (2):
  hfsplus: free cached B-tree nodes on hfs_btree_open() error path
  hfs: free cached B-tree nodes on hfs_btree_open() error path

 fs/hfs/btree.c     | 40 +++++++++++++++++++++++-----------------
 fs/hfsplus/btree.c | 41 +++++++++++++++++++++++------------------
 2 files changed, 46 insertions(+), 35 deletions(-)

-- 
2.43.0

