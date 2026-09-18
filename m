Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B63D3BB12C
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789699747; cv=none; b=hyWWFMy9tcwdiXH9G9MPDvYzjkPla4rjYUJlPuYWnYvCNMCRzAV2C4tnDoklugaOAoMhfyPRu8dONi/kUuDaWik6dm85ursebxUxlnSbgVvS829xcEmcVsZgkbO3FIz7xcEFHEEPwaJ3q60XOwfbE112dVPX+fsxLqjZMpFLinw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789699747; c=relaxed/simple;
	bh=gc/XI5HxEC4PKxsI5/WSreIkFC8b7uoh9stcxnuKnN4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oRp4N9p+hyfwEPTaLxlhlWmLy2CEPvhISG0nHvVVmN05FL2D6xULhsJN62eH6roz8Bg5c0i72BYzoMG+XcjjgP6/J8m36Oa9oQouDPNCn4Z/hcGI2F9MwAxEVj9MaimjPUSM9JJrgWkkxpYr6FaFQFYFB+12U1naWwPS5AAZkf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PVMYQA2S; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PVMYQA2S"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-398a384b5f7so174146a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789699738; x=1790304538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XPm43STPG/fDQDyOfj6yzMa2YKT8zVqw0iMraAd7aOE=;
        b=PVMYQA2SjI2PA3tDMrhmFbvRVwwy6fSs3TC4aAGiWQ1VIR0zI5W3AGNMF/miisvfTv
         2YzYvgKBqAM/6h3tmaTFemQSwv2ucThf+syMWtaf5fsvaQST6A11dycyVz9yBw/RpjcV
         oaDhSb03ww4rGccuZ2bB14G9HeuqR21+AyhwQrKm5KQdAcgQbsWPD7hmVGq6fa6qU5xF
         +IVtA9/F54LERdWaMtCNkDyyLg4lTojJJGqJhT4cStwA31gDKKiLVDKKgOlHTCNWRDQR
         EfhsbOZtsgrZ9XdQXxZI8xKCYgxqgfCIBZE068bOzcf9W5E/X9tkN6FVP679moW5FQHw
         piLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789699738; x=1790304538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XPm43STPG/fDQDyOfj6yzMa2YKT8zVqw0iMraAd7aOE=;
        b=zgqoeHeannPBRLt5bSCmLPNb7kA9vl1mSBylg/Tr6h5HvfXcZHl/D+9/I7e2Deszf4
         efSe4bYI7QAlGMi6W0F6Z0tjlGBDNBJV8lIxBMTaTHQ/ulvLGrGqxqlO+wp4MeMIJmBs
         sUlEjaD2pnnzi7OAVBwsu/vaiWyOy2Jy6ANN0H6REjAppzbI/92Jwoc6hBXUFkr9Qnfd
         2ZVteckPHXI5udkiToDlkoG6kilqm3PQ9v/IrBdGC9z0mEoENHbNZl1Xxx9PDnK4RNEW
         hqo5aSRrv9IjpUT4hYg+5iAsX7EBGwjFtPpK8bbV80oIe6RXdvz51nRCEPaaq15Zso5M
         Qcrw==
X-Forwarded-Encrypted: i=1; AKwUvBxGcW+ku6MntxyppysC8ndBTf1SNjbzjtt23nohvWT4l1IBMRmlJYq/78c5BCr7oG6NFRxItXo12UkCRTM=@vger.kernel.org
X-Gm-Message-State: AFuF++ntqE5i26rKVEgxoQPlEB22AQhpn6XQcwqRm1PiyJH4pxhMcRCE
	eVQtzAoG8cPoU2+iDRkTDCYcedHFotfG2bkV+2JHb9fbq8lmDbhPEk4G
X-Gm-Gg: AYBFou2FDW55NEQ8x3ik8PA8goWStqUi6VkU7RPjpyfJHOfGZjxxX01jdYk9dBwOYY2
	K+P/xq+fvGB7Jaw7waDQBvgmZkKphJA62SKacYtwZgLHl7F/e/Q5FvEe16eu9h9P8kPR7o4kal0
	8bRYo1ArFbnUWT6zBfSh0DfT+G9Lc+88fBbD9k6hl4cXwQLgEtY4tGfLqD/8cw1u+qrw7Mz+tIy
	bF3/8x2Yu+0PNAMcrOxp6nBB/6BF/XkGAf/xgELcV9l3R0c6K4laFDNAl0T37pQOabrmSllg8yb
	QVSgQPsF8np91nW+1bRIbWe7ZBAT8EyAv5udBG4wKXhd24hiwlfWoCcka1mW9uz6b6K96+3H++v
	dHlEo0Scr4oRZRfTZMsPYFBmkIKf17XBo31Yet9NY5CDDrIgZ50Y03277zhMYkUv/D0TBb88WFx
	Xwa0Zt/uT+P230E+5IXykrWWMDEUU4GOHj+w2tXswz8HOUBdqgixglICbCjK4tCj28By7LCTCLv
	IYQw+vrYMgHXv4SIThdZpcuOVS4wvP6VM2i0+asU9MSrQsR
X-Received: by 2002:a17:90b:2d87:b0:39d:e54c:8658 with SMTP id 98e67ed59e1d1-39e54d8ecdemr4317714a91.5.1789699738525;
        Thu, 17 Sep 2026 19:48:58 -0700 (PDT)
Received: from localhost.localdomain ([38.60.126.44])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c287b023bsm388217eec.23.2026.09.17.19.48.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 19:48:58 -0700 (PDT)
From: Haobin Wu <853555@gmail.com>
To: ericvh@kernel.org,
	lucho@ionkov.net,
	asmadeus@codewreck.org,
	v9fs@lists.linux.dev
Cc: linux_oss@crudebyte.com,
	jack@suse.cz,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	aneesh.kumar@linux.vnet.ibm.com,
	willy@infradead.org,
	dhowells@redhat.com,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org
Subject: [PATCH v3 0/3] 9p: handle long directory entry names in readdir
Date: Fri, 18 Sep 2026 10:48:48 +0800
Message-ID: <20260918024851.51229-1-853555@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A host directory entry whose name is longer than 255 bytes currently
makes 9p's readdir fail with -EIO and hides every entry after it, which
is how this was noticed on WSL (Plan 9 shares of Windows drives).

Patch 1 drops the copy into the fixed 256-byte p9_dirent::d_name and
uses the string p9pdu_vreadf() already allocated, so the listing no
longer aborts.

Patch 2 then skips entries whose name is longer than NAME_MAX in the
9p2000.L readdir instead of returning them to userspace, as discussed
with Dominique and Jan on v1: the VFS only enforces PATH_MAX in
verify_dirent_name(), and nothing can operate on such a name afterwards
anyway.

Patch 3 applies the same limit to the legacy 9p2000/9p2000.u readdir.
It is a separate commit because it changes behaviour there: such names
used to be listed.

On patch 3, to be explicit about why this is a behaviour change: the
256-byte limit lives in p9dirent_read(), whose only caller is the
9p2000.L path. v9fs_dir_readdir() parses with p9stat_read(), where
p9_wstat::name comes from the 's' conversion (kmalloc(len + 1), no
NAME_MAX check), so legacy really did emit over-long names.

Changes since v2:
- Patch 2: say why the entry is skipped in the debug message and log it
  at P9_DEBUG_ERROR, the level of the strscpy() message it replaces
  (Christian, Dominique).
- New patch 3: same NAME_MAX limit in v9fs_dir_readdir() for legacy
  9p2000(.u), as its own commit (Christian, Dominique).
- Dropped the Assisted-by: trailers.

Changes since v1:
- Use my real name in From/Signed-off-by (Dominique).
- Split into two patches (Dominique).
- Reworded the subject and commit message of patch 1 to describe the
  existing readdir path and clarify that no allocation is added
  (Dominique).
- New patch 2 skipping entries longer than NAME_MAX (Dominique, Jan).
- Dropped the bouncing sripathik@in.ibm.com address from Cc.

v2: https://lore.kernel.org/all/20260916135403.15789-1-853555@gmail.com/
v1: https://lore.kernel.org/all/20260826064819.52523-1-853555@gmail.com/

Haobin Wu (3):
  9p: skip intermediate directory entry name copy in p9dirent_read()
  9p: skip directory entries with names longer than NAME_MAX
  9p: skip over-long directory entry names for legacy 9p2000 too

 fs/9p/vfs_dir.c         | 31 +++++++++++++++++++++++++------
 include/net/9p/client.h |  2 +-
 net/9p/protocol.c       | 12 ++----------
 3 files changed, 28 insertions(+), 17 deletions(-)


base-commit: 028ef9c96e96197026887c0f092424679298aae8
-- 
2.54.0 (Apple Git-157)

