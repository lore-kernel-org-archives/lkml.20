Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793718336;
	b=wcfyqMWrH2+ZSfGGf/L9UiFsEBalgXIGnOjkwKWM4wVhJj6+0BNAGQc05hHPlUzRP4mb
	 Kr0Rrz2M//5TLJC2ildoUcEpMLBmjtpG9X5HAuQncwBt5SEaVWPbyBcbWUNm2oAjag+ko
	 MsT45pv6sUbKGtoQzANWIIpojC8PETN4CJb0cxLFK5BvGDiuJY79Lb/d3DuWWWiv9BV2Q
	 NLx77GzSNe9DjES4sG8kvkcFfr/2NfJ6REtgFeB4/64DErdhi5rNSYdGGLxBeHBauEFV4
	 1WcC4qANxYlW5wNALBR8IUaJvBy7bY7l+76eYDxYAqxf9Aab2DqBgBnmkVaAzdtHSow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=CAcBNNgtM+ZvWYSpLVQ97i1PIWmRHPAQ5ZZNdGofiV8=;
	b=i5UMO4a+D25fMr16d7wRbxPbTnOpsWysidJeUi+zjJ01+pVRy74hgChSEVUiBZFT+9Zv
	 7lxXzMckd6fHfbjoRgh7pqfF5YEUHm5hRZnmTK2cWRDDUfJjLlsKcdRsxwW9Sbk/FZiYf
	 +of/srVPkHvrJwuSJhqVDy/QFzZCs8zCFLKBdlZGxwOrft6cR7MjB7ZVIYLA4w3GKanAk
	 Tgcc6U5iUNRGFyIZCAdvXi/TaN0ovPQQ16/FTDB3a/UAvL93YWtogQa6uORUE65/xFfk4
	 WocQBZMC+emiSR5Km9PQRQVrT7UwzSs50T8LGBBlJqgXNuv+f9vUypvWS3fw8jonzlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=Njrm1HjP;
	arc=none smtp.remote-ip=209.85.160.42
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1D2606A33F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:05:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB1D2606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=Njrm1HjP
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-499f20c7054so2365740fac.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793718335; x=1794323135; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CAcBNNgtM+ZvWYSpLVQ97i1PIWmRHPAQ5ZZNdGofiV8=;
        b=Njrm1HjPUTcNgAw03tqAI/HECLjGLvEaKlDNPg7QY8qXqj2NqRlLs6JW3z+MM5Y+H9
         bEevl7SMVamQjPNGz4jNzvK8wOeT2s9YiRiIAQvFWebSznRH7i45SHxK82aMzWt7q7XQ
         AJwxn02fcuJdNKnAO0tunrff8wXoEqtTPqvahYpFvvD7F+KdEbLsTpoml0fJrvkoCmIU
         AI4kIJ+MQkWbYVPwwJCqlJstndAweGD4/0pQRSj3Jf64/Lh8jSmOGqVRJSklECU3CuZQ
         +/je9xDNp6EhIFWCAiE1p7e9/1puFemv6SSKfU/tj6mmHhWq8j7OrzgtPIB7SGQDomZz
         2T1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793718335; x=1794323135;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CAcBNNgtM+ZvWYSpLVQ97i1PIWmRHPAQ5ZZNdGofiV8=;
        b=TaQ6IBkDYguJdX2I6vanW/GZGhqZ3I4jSzpbMVOj6Z9AJFXL+gVWFk0wYvUPo/zH4H
         fb2TACtWHEaO7FBkd2e2I/EzZ6mRXF1GVDSGcvbzJZLX5+vpm9YuBEgN99jCgdsqPDOc
         6rRp1mrZQT/IaNQvIsxOVsRBsi2n1QQQusBjy2DZlWhUUBucnmOqOAOs0oRPnx3/37Aa
         gSr6LqFpGi/Pm6J/FiSndGlSqsX3ZbeFcq7H789X2yDkW/WTnZonNJP8xwCa9PDr8Szf
         e1P7PS4m20mJShl9VCqHZAx1O+8SMgLaDLu6p0Ac1pwNIOXGc7YxyAXxrMyrnW2e4Q9A
         kupw==
X-Forwarded-Encrypted: i=1; AKwUvBwY63Mjk13NlPCk3+07S1fDmAXxzg5oyLhtwXEsNbMlTpp44qftJRaGKAjtOx57BsFUz865RTLaou4GqNI=@vger.kernel.org
X-Gm-Message-State: APuU4Z93L3ZPR08hRMLxbNq8y9WkhSAIymapTJ/g904692ToLhNo5mY8
	1GGmCtxokjlg7l5ul07wqhhltU/yGdOhlSdHpp3A9TSDDk7FbpSt3fvJCV6ZLsNG9xxrV347MDE
	tpy3oXrQ=
X-Gm-Gg: AYBFou3JezM3FNYmi7/2Yr8Xs7FcUo1lZcL6kvG4ACNCfGBPAWQiVNr+ROhskx6QQSB
	kNom7Ng9fzrC2NSbsQ3B1i4QJwJmWQCOJH/eMUlL5mMBAMFEiyMTImvX1z0FCUmTFkFxU4uhjB4
	9h2V/uDJw+taM55I2qkGrwitSlyAxQHN0lhLlVfHfIs12uRDyUP71tn4kVB/4C0/CIJOgCiWQeY
	Ha217iVq5FTOlXj9X/XgxmpkGNQgy9wmVyUdqw4SMWnB56AnUIp2GnX6PmtRb7elfzLHi4k/y8j
	rzgIZittxq2uvH6Gi4mqmMX+hFUc7Jy4as/bDuAl/+pd9kRpJX5nWf3PTPaznJQNpNLlIfYgrMS
	Kdg2VGl721mBg3bXVpMOnmk8ltEa5883zP2ig1go6UtIoF0SAZJC5XMntdmJFTzjwE//+c9Dpwv
	z3T1T1w8CuTVpmqregveOJvqTPB7r//7hoU+IMme7KiHUOqZt3qhbJv0YJ16Dis0H+UKu/6hv07
	Sxt0/2IeiqX3nOxzxfO9oHYf3sQsu2pbrP0HUY7O2cvaVlxr6gKUscJnE9AAOv7M60o2zmso5Ik
	jCvZXof0NLGablaDkA7ZIS45U+bxx7krWvTLkqsK9r3o
X-Received: by 2002:a05:6871:384e:b0:4a7:41a2:c208 with SMTP id 586e51a60fabf-4a9072d3f12mr8058700fac.8.1793718334420;
        Tue, 03 Nov 2026 07:05:34 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.245])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a92196578fsm9899101fac.7.2026.11.03.07.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:05:32 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Subject: [PATCH v2 0/5] btrfs: data integrity fixes
Date: Tue, 03 Nov 2026 15:05:15 +0000
Message-Id: <20261103-b4-btrfs-data-integrity-v2-0-577dc2690061@toxicpanda.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACz46WoC/3WOQQ6CMBBFr2K6drQtCMGV9zAs2jKFMdqSthKM4
 e5SdOvyTf68vDeLGAgjO+/eLOBEkbxbQe53zAzK9QjUrcwkl5XgsgFdgk7BRuhUUkAuYR8ovQB
 1fSr0qS44t2z9HgNamjfztf1yfOobmpR1eaFVRNBBOTPk0308buKj9QEczilvBorJh9eWN4ns+
 pUU/G/JJICDLbtSNFVdCKwuyc9kRuU6dTD+wdplWT4Nbzu2+QAAAA==
X-Change-ID: 20261029-b4-btrfs-data-integrity-eb753b57300f
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>, 
 Naohiro Aota <naohiro.aota@wdc.com>, 
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, Qu Wenruo <wqu@suse.com>, 
 Boris Burkov <boris@bur.io>, Filipe Manana <fdmanana@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Zygo Blaxell <ce3g8jdj@umail.furryterror.org>, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793718330; l=3538;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=XlDEGHFbM49KCz7ZH+2JAfrfaW5E0Kl2m6LDPE2cOv4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDBdeCJ5kN9b7GPhOgBvlbx7ZT05gucHigMMiLz1iq5s6z4hsdFt63nsVxU4P8awUt/3yLbztVQ
 bU8fipRM1SQk=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

v1: https://lore.kernel.org/all/20261030-b4-btrfs-data-integrity-v1-0-f4d4196731e6@toxicpanda.com/

v1->v2:
- Rework patch 3, now "btrfs: wait for ordered extent IO in fast fsync".
  BTRFS_INODE_COW_WRITE_ERROR is set after the end IO handler clears
  writeback, so a fast fsync could still miss it, for plain write errors
  as well.  Fast fsync now waits for BTRFS_ORDERED_IO_DONE on the ordered
  extents it collected and checks BTRFS_ORDERED_IOERR, and the inode flag
  is gone (Sashiko, Qu, Filipe).
- Patch 4: use DEBUG_WARN() instead of ASSERT() for the check that can no
  longer be true (Filipe).
- Collect tags.

--- Original email (v1) ---

Hello,

I've been doing some model checking of our trickier paths with Claude's
help, and these are the fixes for the bugs it turned up that actually
lose data, or tell userspace that something is safe when it isn't.
Every one of them was reproduced in a VM on an unpatched kernel and goes
away with the fix, though the fsync and log sync ones needed a delay
injected to hit the window.

The worst one is the fstrim one.  If you run fstrim while a device
replace is running we'll discard everything that has already been copied
to the target device, because the target's alloc_state is empty until
the replace finishes, so the whole device looks unallocated.  The
replace then finishes happily, the source device goes away, and you're
left with zeroes where your metadata used to be.  This has been around
since FITRIM learned to trim unallocated space back in 4.3.

The split bio one is similarly nasty.  If the last piece of a split bio
to complete is one of the split bios and it failed, we drop the error on
the floor, and a buffered read returns success with whatever was sitting
in the page.

The rest are in our error handling.  A delalloc failure in the middle of
a folio leaves blocks dirty that no longer have an ordered extent, a
fast fsync after an error that happened before we submitted the bio can
log extents that were never written (which log replay then happily puts
in place of the data that was there before), and btrfs_sync_log() can
return success for a log transaction that never got committed.

I have a cleanup series for btrfs_sync_log coming, as I had to spend a
lot of time grokking that fix, which is a good indication that the code
is too complicated.

They're all independent of each other and tagged for stable.  This is
against for-next, and it also applies cleanly on top of Qu's
extent-by-extent writeback series.  Thanks,

Josef

---
Changes in v2:
- Link to v1: https://patch.msgid.link/20261030-b4-btrfs-data-integrity-v1-0-f4d4196731e6@toxicpanda.com

---
Josef Bacik (5):
      btrfs: don't drop the error of the last split bio
      btrfs: clear dirty blocks after a delalloc failure
      btrfs: wait for ordered extent IO in fast fsync
      btrfs: don't report success for a skipped log sync
      btrfs: don't trim the target of a device replace

 fs/btrfs/bio.c          |  9 ++++++---
 fs/btrfs/btrfs_inode.h  | 10 ----------
 fs/btrfs/extent-tree.c  |  8 ++++++++
 fs/btrfs/extent_io.c    | 10 ++++++++++
 fs/btrfs/file.c         | 52 +++++++++++++++++++++++++++++++++++++++----------
 fs/btrfs/ordered-data.c | 31 -----------------------------
 fs/btrfs/tree-log.c     | 20 +++++++++++++++++--
 7 files changed, 84 insertions(+), 56 deletions(-)
---
base-commit: 2789b2c034d7c0c8687355921a38c5ac41a565fa
change-id: 20261029-b4-btrfs-data-integrity-eb753b57300f

