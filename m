Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794494306;
	b=inAq2ZYCSn6d/5Ghjbo+2553Ts7dPPWG728Akn3LDulmXurmlbY6Dd/fFpWvMH1RZUPD
	 +adC1T7qKGaZGFjrEPEeTRANulV2viY63AlmzvWC7lnhxBeIIjWiQJqhG+1WuZqsbNASy
	 0F6yvhxEKCTlWxJ46KOr5C+SG+XNGmTbpjCs9p3bOp/SAc3d1Vr+ajoH9SHzNxb5p/FDJ
	 AbRKNOFvHhSbLSJqbVLZA4YKPx3braIWAaFqYW7d8HDUHXpqG8om6RiAwba+HYTAqekJD
	 /9uk8Ok+/iOBHAENkV3xNyBirjjVhMuZYDpRpgGwqEytJYIVBcyHUbqv5QdhdLpMpuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794494306;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=HeUccQNkRQfEx+dOXAstHVvN1uagPZa0GlfKzv8IIqA=;
	b=DEYsHdkLE6INzpzuVlK0pIKVLk3UwGiNpKdKaFQ8xW00/IZ1cHfFlWYdgbu0exP8vRgr
	 xKNRzooQeJceAY20s3arCJtj6eIiy8n2JUwFx1yR0O2JXFFijadKU751MwDj3ookw4Ntr
	 7TgUZuQzpxnhABLN2Y+bGCyN9eHyi3mzkABbYg7Zid28QfrkON4E3GDuKJkbU42uUbw/g
	 wIQg2hYOttrx8xvCScQanASmFrveKxEjHlXBIH0gNdhhOBVeSRJjE1rMmVyhMy75GezcG
	 jYd9JEGMYbqwoc2/k+mF5vSSSPeA/M5L7gYuGF2g0PPgL13VgQ0OEN1JhHB5QcFZYnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jprusakowski.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WRgXSULq;
	arc=none smtp.remote-ip=209.85.218.69
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE2F606A335
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:38:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AE2F606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jprusakowski.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WRgXSULq
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c429d9d05f0so478883166b.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794494304; x=1795099104; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HeUccQNkRQfEx+dOXAstHVvN1uagPZa0GlfKzv8IIqA=;
        b=WRgXSULqzk3sDbIbcYBwNuaTcY+4Md1VtvGAxGOVTUQ+Z6lzM840ZhTxIil1bqq3dI
         vWWY+326fCWCrgJu4dZbgaZcUOcuoBlULYg1gF+1U4ogMCc5xKlDsm/jnpVrRarSQqZu
         7FvyeeGaHwUPYsKpPVWK9VAt5xOlZLFq6JaddC0riE7mmii/Kztc03iBBJnouvMasaRq
         Kj7Eaei7aM3YenAj0HzhE0Kn8TzlQuKd4yoAwN78GIT2bvH8t3OJ77Xes6EYnHsnzkel
         FZvYuO0k/cS/9C9TUoJrM5KtxWwEFhFAHbZGO8VrTBq3sUGf9BAPu3eOts3189x/9KSz
         xtzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794494304; x=1795099104;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HeUccQNkRQfEx+dOXAstHVvN1uagPZa0GlfKzv8IIqA=;
        b=2N8eD+NvtEpoMX3H2fNv72CSvcSGsN8tLPzrW8i7Mc5EifMG0WjSkmCOW/2052PtqM
         FOk3krwy49moslWHDIHtmBKuEZNWTzO+FxXa2RtZCGLcAOwxFqM6xXM9BrL8VHjtpefE
         iHk9EUueYLcB/JCBhPOlAUhVXtWgMe+yk3fknFd7ovBad6Q6/VLMZ0dDDng7Kvk1qT/g
         g1S07++TWsf/8hMwnWmJFjyX2oAJPV2QE7WSmP5sWtwtSlvPAJujQAd+VeFvvTx9PIny
         ysuR1aH13mhCDzFVV3vRHfNhsEppXHuKkx0gLArlFQVl9bWoaI/ubzyfI7mdp2IkJ+1O
         nEcg==
X-Forwarded-Encrypted: i=1; AL+hErE4DAcYg5bYZMkAUHNbtXFzdPtFiqdHOj02li7KOZHNLDAf4N3+GvpK0uDdt0jhblgLQoQYLYYszq7jm/Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sEsbCnZ6U2MCrknEuaGpJjg8Y2VMBb7LIDESeV/5vlUn5z2vj
	fA9tNaOqp6NnA6PyO4UIsv139CK01Tqa4RD7Oc6BTUTvuly1GtRstdM7WqigV0zKPeu9kMXiJhX
	9HOz70u9z3/SwlhvYOVy2w52neWOOAQ==
X-Received: from ejxn14.prod.google.com ([2002:a17:906:840e:b0:c35:d623:cdf0])
 (user=jprusakowski job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:7955:b0:c2e:5efe:f1cb with SMTP id a640c23a62f3a-c5066abac50mr522369166b.8.1794494303817;
 Thu, 12 Nov 2026 06:38:23 -0800 (PST)
Date: Thu, 12 Nov 2026 14:33:46 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261112143355.2923939-1-jprusakowski@google.com>
Subject: [PATCH RESEND 0/9] f2fs: fix stale data exposure on failed O_DIRECT writes
From: Jan Prusakowski <jprusakowski@google.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	Jan Prusakowski <jprusakowski@google.com>, Eric Biggers <ebiggers@google.com>, 
	Yonggil Song <yonggil.song@samsung.com>, Hans Holmberg <hans.holmberg@wdc.com>
Content-Type: text/plain; charset="UTF-8"

Resending to include Jaegeuk Kim and the mailing lists
(linux-f2fs-devel and linux-kernel), which were accidentally omitted
from the initial submission. No changes to the patches.

When an O_DIRECT write fails with an I/O error, f2fs can leave the file
pointing to blocks that were never written, so reads return whatever the
disk contained before, possibly data of a deleted file. xfstests
generic/250 and generic/252 check this for direct writes to fallocated
blocks under dm-error, and both fail on f2fs. This series fixes them,
along with several error handling issues found on the way.

Patches 1-2 fix issues in compressed file paths hit by these tests:
sleeping in atomic context when reporting a decompression error, and a
read error in prepare_compress_overwrite() stopping the checkpoint
instead of failing the write.

Patch 3 keeps the old block address in the dnode when the block
allocation of an out-of-place write fails, instead of replacing it with
NULL_ADDR.

Patch 4 makes the buffered fallback of O_DIRECT writes return errors,
following direct_write_fallback(); generic/299 hits one of them.

Patch 5 truncates blocks allocated past EOF by a failed direct write.

Patch 6 tracks out-of-place block updates while an O_DIRECT write falls
back to buffered I/O, and rolls back those whose write failed, restoring
the old blocks or resetting the blocks to NEW_ADDR.

Patch 7 records blocks allocated during a native direct write (for holes,
preallocated NEW_ADDR ranges, and out-of-place overwrites in LFS mode)
per kiocb, and rolls back any unwritten blocks if the direct write fails
or stops short. Overlapping reads and writes wait for the in-flight
allocating direct write to complete, while non-overlapping async direct
writes proceed in parallel. This fixes generic/250 and generic/252
without falling back to buffered I/O.

Patches 8-9 fix compressed files (where O_DIRECT writes fall back to
buffered I/O): patch 8 cleans up when a compressed cluster write fails
to be submitted, and patch 9 extends the buffered fallback rollback to
compressed cluster writes.

Tested with full xfstests (-g auto) across default, compress and encrypt
configurations with CONFIG_PROVE_LOCKING and CONFIG_DEBUG_KMEMLEAK
enabled.

Assisted-by: LLM

Jan Prusakowski (9):
  f2fs: compress: avoid sleeping in atomic context in
    f2fs_decompress_cluster()
  f2fs: compress: abort on read error in prepare_compress_overwrite()
  f2fs: keep old block address when out-of-place write fails to allocate
  f2fs: propagate errors from buffered fallback of O_DIRECT writes
  f2fs: truncate blocks allocated past EOF by a failed direct write
  f2fs: roll back failed block updates of O_DIRECT buffered fallback
  f2fs: roll back failed block updates of direct writes
  f2fs: compress: fix cleanup when a cluster write fails to be submitted
  f2fs: compress: roll back failed cluster writes of O_DIRECT buffered
    fallback

 fs/f2fs/compress.c | 179 ++++++++++-
 fs/f2fs/data.c     | 185 ++++++++++-
 fs/f2fs/f2fs.h     |  99 ++++++
 fs/f2fs/file.c     | 745 +++++++++++++++++++++++++++++++++++++++++++--
 fs/f2fs/segment.c  |  49 ++-
 fs/f2fs/super.c    |  11 +
 6 files changed, 1217 insertions(+), 51 deletions(-)


base-commit: 9b12299b437e0cc3ebf402e7b36a89cc69151238
-- 
2.56.0.567.gdb80ae8cd5-goog

