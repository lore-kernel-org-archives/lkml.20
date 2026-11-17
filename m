Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794934084;
	b=xQ5NoKd0bTMwk4gFlx5qWZkIarpL69YROa4jDitHCMF4n3IwFkP/nKhNjqXyEzQ+n2BY
	 21wKJ28J/rg5oI3Xu6mROh+HQirm/+loEMGS+LjPxX9qJFC6voUK+BsofNMoaOT8yXO8G
	 /Zb3fyrYf+5IGhMdoIZTTptzb1mwr8YvefDNi/iS9XpTvoSbsz/nLjtphzvUOYcKtM/mR
	 3J0v0cjPIdOvpyLlE0mixJxCmhnOEnH8ghZDUmw20194eVa3LUhQhJptlTXhB9W4IGIu+
	 KU+0qYeGGG8Soi7g92opXtO9O1uoI2baSFAienqtm2Qw7JELYq1e2ZS/LfiYKDoWeTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794934084;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ypdQxqNZeuAR8d72dGF4LGjrdC+bZ7mm7BusGxjOzZg=;
	b=AzbOP8prKyprCnVGcIqcKtVtoE0RlMFKrEVNi5gWtkitoms1NeMfWLlRhUS+npUTnxBh
	 MCA7ia3L4CipHwFs3aOH//HTaMd4aNB1HQULiMz33eD7yFreLmjquu0+sndzK9EkNRSp2
	 GQ7i1QjZxWlpjzUiw4FBCYQ84LBA0WdNsTDpaXW0b7L1JmoecwSIk2MS75vm74xY54J2o
	 DaOTHWagQ/rwRh8uH8nJTL/F5b9PTBY7RKy7lCpRposWvEUY+B3j9C9a/yoxIOLntqiPl
	 LZarydK1SBO7rxqPvrBTBsbnztgZYsTVI3U93HYvgresvvr6ot0lvNh2xDO9m3sUU4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xu3A1GJl;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22876606A333
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:48:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22876606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xu3A1GJl
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1a2af4c8d00so56730c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794934083; x=1795538883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ypdQxqNZeuAR8d72dGF4LGjrdC+bZ7mm7BusGxjOzZg=;
        b=Xu3A1GJl8kozVTJFThjjXwIfrGDfI1536lRTU4RwWvLVpDAwzWzTumzfly5npajYci
         Yefv42bXR7jAWZ8Yedn3w12tlImAMsxHOhg+Y1ExRWhF8efD3WpSSKaKFaJqOYc6EMYC
         oYrUTGoHAQFVVO5qOiywoaNvC/yzO5GTjgV+RprLh9QNhShftBK5DowVp5eFI5yn5iL7
         +5qFmff3+LmBHbCqo56u8KWmQNd2RnsrZIFjW1YAdFBKRBEvIwFOUUKKPM8K6Y3FKUD3
         pb9Ya1yn1swzGGnl7hbAntMxpaeGYrrqKbcfFhzAfkGcnUeDJAOMxFFjGyQ3XXpgsrdg
         Vmhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794934083; x=1795538883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ypdQxqNZeuAR8d72dGF4LGjrdC+bZ7mm7BusGxjOzZg=;
        b=DuunDU8WB7uQuHSJyPDtTDqD1+FmeyLMXKWh0apRQFyhPCuj4rBmofiknMGQGCmfaF
         C9a8Bx4GOl0RuTFY1h66PfusVcJUbw3c0CeVoZ4W5rDu3MBSZ8SJp3CDCapeaF+oqwFs
         l1BwWAxFiLDOFGlg9hKRUsISYTbLUzk1kHGdEii4cah5fzdssG4cBt7tEbBGbPW9HNsv
         sGcSPvWzf5GPplATQtJJ+3WHlf+UpyJLzJ7umegd4XsgpuExdzI62rQvwVbfvLdzTnjf
         LdnzGk5v6Ntklia4XznnnXJHFgND0L4TIKUiBes7jAaajxy++UsBcQL7UJnPaP0utGNi
         xvsg==
X-Forwarded-Encrypted: i=1; AL+hErHxtG+DprJn1yAwzx3EWM/W35tAHsE09C5+MXy0LoFJ97aKG2TplzmbpL/v1HEOr3D8VGi23MTqTEFJhEI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8erqYx8N+FUY5aI5tDEWw/ulaiMSNukszE5YA/4sR5hU5dm6y3
	edDY6u6jrxQZNIBMe68Q0GyKxGeFJGV/mS1/ujXdNZJ073q3rvVFdMM5
X-Gm-Gg: AYBFou2BGcBtrv5bfDQmKTWarhfNHV0ddyIRokdw0ZOuXqYsuTGqZ7YdLbc6xLv6Em0
	RQPycFGJ/sbIrlhUVNdwum8MzauszupmJI6NFK2I0zBjvhOif8ATWzqu5lm6oDQ//COmmL65Jzs
	J/2sY3aTvEv61hFzj6mwwkLhkOvpCZyZ0DOWj/wpAycw+l6oK95FoY7iq8HhlfweTiMRxAaR01I
	Brc2mQkoCQjMbCgfYosEsjuZeLPwd47YaleFiCvxRQcFQ7J25v0lAbfoXVS2FSpoFy5Z1yWR3Wp
	gvM6K2Q/BY5L8BYiHPRihdM76d1eAH5sA6/pFZipimKqzptYZxeHwknpgUjCNzA+IPdwAlTTrM8
	SpVCmRgfiDE2ehjMNHIfsyVm6AzFVhyfhDLShRqy57U69MuSArm0YsHaoig3gJfmD1IEZ41xRx8
	VV61bEIaZQ/J62kPT/Z07P+KHdI1r7r+01Z6HTPBhrGXsALMEuX6d6FyDN4ohDyEK1OZTVPc44E
	+B5qQFfctNInD11WmQvkFriVapuC5Z2v2SGDlLPjkPYMoSPiItsQ94j+DjLraRohK9+s8Ni1gWn
	LyET+LLGYA3tJ3oVTDTHCR8BRPfPN6VXUEXM3faNvw/QMPtzJX4/nivgxj1TQ/07bdknRjQx5Gu
	sgC7cCjZzO/6EWwW/Fulu+WUnlXRTvvnpHucb9hSPf6JCyimUwDetK1zs+IdUcyS7FT0oXQNQlH
	2exJZgrqsT1cZZnyGcTgAJNVRcQ1RPH8JCwTHD5aV8zx+3Z86mqgsbL9vJ9TFDYATTRx36TvWH7
	B4A6dj/nf0FM2s=
X-Received: by 2002:a05:7022:294:20b0:1b5:2dce:1b6d with SMTP id a92af1059eb24-1b543cffc70mr134285c88.17.1794934083141;
        Tue, 17 Nov 2026 08:48:03 -0800 (PST)
Received: from FT6N242TWK ([223.181.112.111])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031918c7sm60883753c88.9.2026.11.17.08.47.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 08:48:02 -0800 (PST)
From: Shashank Mohan Jain <jain.sm@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: "Darrick J. Wong" <djwong@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Brian Foster <bfoster@redhat.com>,
	Christoph Hellwig <hch@lst.de>,
	Carlos Maiolino <cem@kernel.org>,
	linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] iomap: fix offset truncation in iomap_fill_dirty_folios() on 32-bit
Date: Tue, 17 Nov 2026 22:17:56 +0530
Message-ID: <20261117164756.97065-1-jain.sm@gmail.com>
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

iomap_fill_dirty_folios() turns the page index at which the dirty
folio lookup ended into the file offset it returns to the caller:

	*start = (pstart << PAGE_SHIFT);

pstart is a pgoff_t. On a 32-bit kernel the shift is done in 32 bits
and the upper bits are lost for every offset at or above 4 GiB.

XFS uses the returned offset in xfs_buffered_write_iomap_begin() to
trim an unwritten mapping to the range covered by the lookup. With the
truncated offset the end of that range is below its start and
xfs_trim_extent() leaves a mapping of zero length. iomap_iter_done()
warns about it,

  WARNING: fs/iomap/iter.c:38 at iomap_iter+0x33c/0x36c
  WARNING: fs/iomap/iter.c:39 at iomap_iter+0x34c/0x36c

and iomap_zero_range() does not terminate: a mapping of zero length is
what the iterator takes for the start of an iteration, so it asks for
the next mapping again and again without checking how much of the
range is left.

On i386 with XFS (4k blocks) this is enough to trigger it:

	fd = open("f", O_RDWR | O_CREAT, 0644);
	fallocate(fd, 0, 5ULL << 30, 1 << 20);
	ftruncate(fd, (5ULL << 30) + 1000);

ftruncate() never returns. The task spins in iomap_zero_range() with
the inode locked and does not react to SIGKILL. A write behind an
unaligned EOF which is in an unwritten block above 4 GiB fails with
EFSCORRUPTED instead, after "XFS (vda): Access to block zero in inode
132 start_block: 0 start_off: 140002 blkcnt: 0 extent-state: 0":

	fallocate(fd, 0, 5ULL << 30, 1000);
	pwrite(fd, buf, 100, (5ULL << 30) + 8192);

The same calls work below 4 GiB, and v6.19 behaves like v7.3-rc6.

Cast the page index to loff_t before the shift.

Tested with an i386 kernel in qemu and XFS on a virtio disk: the two
sequences above hang and fail without this change and succeed with
it.

Fixes: 395ed1ef0012 ("iomap: optional zero range dirty folio processing")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
---
Prepared with Claude Code (Anthropic), model Claude Opus 5.5
(claude-opus-5-5).

First sent privately to security@kernel.org on 11 October; Matthew
Wilcox asked for it to be posted as a normal patch. Sorry for the delay.
The code is unchanged in mainline, so this is the same fix, rebased on
666539eecdf4.

 fs/iomap/buffered-io.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 6d843b1..846f87a 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -1735,7 +1735,7 @@ iomap_fill_dirty_folios(
 	}
 
 	count = filemap_get_folios_dirty(mapping, &pstart, pend, iter->fbatch);
-	*start = (pstart << PAGE_SHIFT);
+	*start = (loff_t)pstart << PAGE_SHIFT;
 	*iomap_flags |= IOMAP_F_FOLIO_BATCH;
 	return count;
 }

base-commit: 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
-- 
2.43.0

