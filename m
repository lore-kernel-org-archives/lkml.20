Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B2B2BEC4E
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 04:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790915706; cv=none; b=Ernpw+KhIMre3gELrqgmimZlC9gZOIwmSpHVOX4RBvnjXhzRknH0iWRKlG3tiTQAWQkxC9gRJ73/zu0yiBF00NtHHp5S5+D+K52uPpfApNQBCvpxA1l2g4XNa6OVECFaV7+CjMgOyeXG9t4VpDDbo2kRG1Cm6yqubzt2E08spxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790915706; c=relaxed/simple;
	bh=2e2ewE55nFNffXiMvgPSdZOW+I2BZ3pUVfDPP1mxhA8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CdhJXXb+Z/8QM7Xi++GYHfrbN1UzB5SH9IWy4t2KjN8ChiGNDNMW1WZ6fH49eKGf8akywzudDVWUmnWw5g13cZwJeRRR80b4XRCWlfFnUgZd/RSdnap6oVEF3w8l0w1GOh66eD0dS01K4bvIhMAPhn7oFZ63a6h239xiBm8zVUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f8sYVKyO; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f8sYVKyO"
Received: by mail-pz2-f39.google.com with SMTP id 41be03b00d2f7-cc794a06e5fso4219564a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 21:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790915705; x=1791520505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jDBf+2qnn5uR69+p18LQWYci7uKNqgSq+C3LtYBfIyc=;
        b=f8sYVKyOfH18OfXV4N5lLHs80XeNIHqq01dQTWSbq7qa1qFl7Zi/eqnILAcLCkVXJc
         NO3vLoAxNwfQBfDHfjQLGpyn8SnzUJzfLycfaYjokN4/HjUtWvCdxu2AXxFPBmg4RJ5l
         Mzc1Nq05Z9yU9AZw3r5oVFQeP/ua9lvud6zYH42JKf+HiB2QqO4RPo5ttAOcGtBA5q0I
         tfZECJPOksrRYe9xCk+oXEemgohi5dbXoW0ObHAgaVHnFbEEWl4kMi9YBy3GLZiC4nip
         ejkebWgcIXLvArsVwGpp/hCAe0Yn25xpowf6iUHN2Wc1DmFkroY/mDA6oOQvBXBb0The
         t+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790915705; x=1791520505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jDBf+2qnn5uR69+p18LQWYci7uKNqgSq+C3LtYBfIyc=;
        b=gchCOc0D/x2MTmw1MrxfP4MTkINArh+7VVn1gAPKWWlWsAIFiROmv2A/i9P8DhYFDz
         ikBW4VgdsLdz0zlhWE1CrHoW1XytmEZ1Eo3u9mHQ79W2PixyULKbcZK1tklsXzbxVomy
         e2s4ZdrAUIctcqdbagOG7a7Mn2l0A0a+f3o8GMZt9A5FTRj52IjaoHKoC3MXGwvejGMO
         rHFlOYDyAD35XlqAIBQO3jcIsOhnEpDmVIQmzj+31cN5f/IHVVRLDjSzc/8PQlajlIe6
         gF/f7UOjMDfp+ThJny0nEfv3F5q2GLsZrMxHjY4Ki+Rl7U4oEp2J5hnDTDJAyxwbt+ao
         p1tg==
X-Forwarded-Encrypted: i=1; AKwUvBwdDvlBvCksgk2pN+DK1xoflPLewFbJxpVwPMAjyZa1sgOfFTSTfezdxDK+WzB6XSRrjf7bvtn7p9/gPFc=@vger.kernel.org
X-Gm-Message-State: AFuF++njne6YDwOrlHXQWW0zOKBqulO77qyWtpCXpTXu1fjZUjJ+XNOe
	BtVwYKzu83PExU6d1dNOFUE4MMJt1of9PEEkx+hTDy24lr6Z25iL025O
X-Gm-Gg: AYBFou2GukOjK4nAkP8ZVcysZxeeW04UPiKMCSRBSFQdzrSZdPaJjtp676p7DjxQbVM
	xpEa603bnDffaSga4cHVXbAv2or01iuOseZwEvbIuyKriRK6bxb9ICLbhWTiDzbyLXn5wjIp07G
	rSbiTtmX0Ui1mQLvq/2yhgd4YufqAZ/lqVcenlgmi6czJQgvgt6ThhkJ/5VrJuzb5Ou2c8T2WDm
	OYd5nAYwiYDnqDnWPcxWK34mrJad8zwjw5i4lUg+VaPkV7yRqxsvsjc5A3xF3KPJ7M46bJndMWB
	saC9/wytE195B6zGSCl4PcyOq3TDC0KjLvokjTUm3uiJ5wxlvIVlKvfB9fYHaINT+6R+sbbTE7m
	SbImai2BwcCfuni+ug+Sv+tlJ88rvGumkYjDd1Cpgnp3qeRRsengcfoHHK/6ltZOO7usaTCBORp
	BGRNlPMpb4eWMvgmlYUq9pESF+Z1s7SJ7tMQvF3vr1GG1d+uiHospaBNnynvkt/UFUPIV9sIU21
	bdUWRaPM53nm/lAXHRl828EkEALnFAj2ahKSkot8EGWI18pIeNQl8khD/mWRyKSTvcMDgVyTUrd
	8IDkIb5Bj+zLRRjkymKXCYzcSDUI1+g1Bfml1nHPo8+gEPb8TpMOGXNs0nk=
X-Received: by 2002:a05:6a21:a344:b0:3c3:6f6c:aa21 with SMTP id adf61e73a8af0-3e0bceba7d1mr1718503637.11.1790915704636;
        Thu, 01 Oct 2026 21:35:04 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc9f7370db1sm436432a12.17.2026.10.01.21.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 21:35:03 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: Baolin Liu <liubaolin@kylinos.cn>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] ntfs: fix the undo path of $MFT data extension
Date: Fri,  2 Oct 2026 12:34:56 +0800
Message-ID: <20261002043459.1695429-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These fix two bugs in the undo path of
ntfs_mft_data_extend_allocation_nolock(): patch 1 fixes a use-after-free
of a pointer into the runlist across the truncation, and patch 3 makes
its $MFT runlist locking consistent.  Patch 2 adds the runlist merge
that patch 3 uses to keep the runlist of the new clusters for the undo.

The undo path only runs when something fails while $MFT grows, so I
tested it in QEMU by forcing each failure once with a debug patch, and
tested patch 2 in userspace against the merge code it changes.  The
debug patch, the test scripts, the volume images and the userspace test
are at
https://github.com/matthiasgoergens/linux/tree/reproducer/2026-10-02-ntfs-mft-extend-undo-v3

Changes in v3:
- Patch 3 frees the clusters from the runlist that ntfs_cluster_alloc()
  returned, using the merge from patch 2, which leaves that runlist
  intact, instead of copying the new runs with ntfs_mft_copy_tail() in
  undo_alloc (Hyunchul Lee).  The undo path no longer allocates.
- Patch 1 (patch 2 in v2) is unchanged and keeps Baolin Liu's
  Reviewed-by.  It now comes first, as it can be applied on its own.
- Rebased onto current ntfs-next.

v2: https://lore.kernel.org/all/20260930033556.169300-1-matthias.goergens@gmail.com/
v1: https://lore.kernel.org/all/20260927105706.3111333-1-matthias.goergens@gmail.com/

Thanks,
Matthias

Matthias Goergens (3):
  ntfs: do not use a stale runlist pointer when undoing $MFT extension
  ntfs: add a runlist merge that leaves the source runlist to the caller
  ntfs: balance the $MFT runlist lock in data extension error paths

 fs/ntfs/mft.c     | 59 +++++++++++++++++++---------
 fs/ntfs/runlist.c | 98 ++++++++++++++++++++++++++++++++++++++---------
 fs/ntfs/runlist.h |  3 ++
 3 files changed, 123 insertions(+), 37 deletions(-)


base-commit: 708f9d56cacae21aeee98d16bcdd50a66edc04a0
-- 
2.56.0

