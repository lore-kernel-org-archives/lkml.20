Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793369142;
	b=wQUJnchZb+Y+Cuk3ztMy3q5b3YlS6hC33jaobpDCWSac/2qTmBwZv8SvNEY8cvOy39dZ
	 Op7HTKL2gp5zKrB2WCw6uN55DPLlVhjAuNIyD62qakig9k0rvR6hsJj2ciYdJGX940sIS
	 m9MjTUnkyRfQHyQaxDujNckhBbSY6Ehzlkh1UtpjaMbvr3bXnG9eM4VFV6TI6H5IkNN3T
	 R2HarxtG3pwCT+th8Qc9GsH8xmAOqkS5R7pH0ky6BGHFOAXb6delpq2so6rWn0VEdOB+w
	 bta7OFFoOiLao94kXLCydVdIkJaRkqvzJoUFXL6/CopfA9HbkmkWBgCIHINv0GpEoGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793369142;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cdf5a45DsUT+aVbheVkNi6IQvBcX9d5cZx42oKeutnA=;
	b=JJx7GHoMqU7ze8/AxcvBJ3PTTJHnADudPunPRi1yC4mCi2OAHUpFlHcSOspi9IB5svhk
	 eUbaGGJPPiw0JD8olgIAq172tS8OxH+wqSoEDM56HPBxxZNaROM5o4exRd2xiOsjFC3pR
	 m9YlCQs6ZEvkBkI2xX8RJD5ju8dIiithW4METjFB+UCjvmb49ij1sU/bBhCAmwzICCrmV
	 CV49TjUvrnWCWQQx1Cc8VGlpdyVV0Bvrs3pjxWZUkY5qY52wShUpbotiqno1RCWNB+ryE
	 DXZBml3Q0BxqTIFUUbeKtcp+D4pECanpelgt490dfSyECKFKHI1FoNgshKwLOrjcHvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=abwbTBcl;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1220A606A322
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:05:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1220A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=abwbTBcl
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a06b436dffso176355b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793369141; x=1793973941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cdf5a45DsUT+aVbheVkNi6IQvBcX9d5cZx42oKeutnA=;
        b=abwbTBcl8wxM617YZt9K4Ye/DNAt8cQAuQTm3YvsKlNJKXGLMU5DxxVyp8oBlB3N+T
         V7+yKDca0Bek6cWoHxlveOD45vpwdJVYhv40HxHQEkzq8YiiaQGei71vSTTklL4XeXdl
         1d4HOUQiqbrbJNfTg0GIKqmGfHsGczn1T7ShDCWqaqvZH3E3XaaSkpN7dWB2JUu74wF6
         ThGXFtw68oKmh3lQzdaaGH2InTwzHnozQB+sFrYmv4WBc+T79MnXAV/12inWEfjnHox6
         o3ltqqAVOqFzlzlI7QisBC6hJfGnb0ok9HidP9I99zAiaEJhIt8n/aZ1swf7JNUGtnU4
         ugIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793369141; x=1793973941;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cdf5a45DsUT+aVbheVkNi6IQvBcX9d5cZx42oKeutnA=;
        b=2nEwRse6LKAr6YnCH90OqDrXkIW89X/Z5QgK0jfj9er5hJWvgMuMoSrjA1S0HkBfY0
         MKhQqrsW++fYzsDqPhdHaACqzxnxV7fZU3XnaSsXpxkbCTr6iJJ/iZoQCiGvy0JxWNPl
         C9Gh8+/Jv4DdjJl+tdQ5JfZ/DlBi0q26qn4NUxR/ErD2mpOKQFwc02bkmPjPcHGgk1cB
         9puqoitWE5fNFYAwnOIeH34cbubdHcU87EeRM+93ElyQMEGUSzwxPdv6OOWKW8fAe0rz
         drioatwhkJUfUwARGwrud7meIT2HuRRalL5GqLHkQdK0rn5S7/uDTgyNps2hlUYJ5+ae
         IRNA==
X-Forwarded-Encrypted: i=1; AKwUvBw0n4DcIDJRjnaPETRr420t/tK3kHZ+QyclmOYmNeqZsbcADR3MjvpNNQMS+1iqKI2zXy5i8rbVJV+f+E0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKFoIXutPs8xHJ5MqtF24Ij+b0uYVD8mRkT33cQ4A1GCe0f8cm
	DTfNt1sh/hgSc8MFiT3xbXNcLS1148BSCQNv5kAIfF1MICNS6s6RQUcD
X-Gm-Gg: AYBFou1jkMjl66y2I/+KrNaaqkVTevFA8sTa0VyNiF61IJME1CdKIUXDqTwWgmPCeCV
	0KdwaXXQ6eSF5omNNqNXKN8+9q7FwposwOoJSOqveGw/JvQmIqKw33sanPd2TiDMGBKEmgpE0ql
	oqG7WMKTA0n0IxY2dE5g8qhqB73yaqAP1/Z6ufWhOF3ybQKiK9LjFyPwUMp43+WX3OGzS2tiLsq
	DwOFOwBQYlAwEJ3RzoVceXt6UdhNK2UrYAWUaq91k89Mna3HmiDrzAtEpiQjwXGAVybin5u26ER
	WAD3ksCkypwaxIO2gS8f5uIKtl6yNBZWjfA7/PqWSd+1+NYt8yDKGfOPxnwzNT2+GcXJDeltA3I
	0sYschyP5zXFrBidn0SVz4oApCtnHQ/E6iMX8pDIErCizvNk7ybThcmpSQtMZI39K7ggBeh92Zc
	M2h5iSnlaHbYuovMjZYrmLBGzwoJzBap0jiDIQCOLN4wqeN4EDSdfjabc5iVIxKIFagwYnzZay8
	WXMEjxm/Ml1cfu22uw0a9pJOEGw3SVt6gSDk3k/FmZBXLQBUal/dznpXcroaM0Ifh7dcveXSzdn
	V0YVH6KI3yK5tTt7IxvuWAKuQUshJBCBJVuS2cOUN8JrHUNT6PKeJ3oQjBXk5dnuB2gYv6S74Rx
	RJhK44bG28aDiRe9TSLqz6VBLHQNWuktjnxcZkgcGeJmMZllBNkM5pUTr+kzMedv1d3rKlc1mXr
	1saTPsPnk0m8bEZUI=
X-Received: by 2002:a05:6a00:2e10:b0:89f:600b:610d with SMTP id d2e1a72fcca58-8a9bf3371bemr2208854b3a.31.1793369141255;
        Fri, 30 Oct 2026 07:05:41 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad77fd956sm26043b3a.3.2026.10.30.07.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:05:40 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Jan Kara <jack@suse.com>
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+799a0e744ac47f928024@syzkaller.appspotmail.com,
	syzbot+43fc5ba6dcb33e3261ca@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH v2 0/4] udf: fix double allocation from the unallocated space table
Date: Fri, 30 Oct 2026 22:05:33 +0800
Message-ID: <cover.1793349907.git.matthias.goergens@gmail.com>
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

Hi Honza,

Patch 3 now fixes udf_discard_prealloc() the way you suggested, and
udf_next_aext() is left alone.  Its Fixes: tag now names the commit that
added the peek into eloc and elen there.  The two other users that v1
covered through udf_next_aext(), both walks of the unallocated space
table, are fixed directly in patch 4.  The code in patch 1 is unchanged,
and patch 2 only rewords one code comment.  The messages now make the
mount and stable-backport consequences explicit.

A filesystem made with "mkudffs --space=unalloctable" hands out blocks
that are still in use.

Patch 1: udf_table_new_block() keeps the extent type in the length
word, so an exhausted type-1 table extent (the type mkudffs writes)
survives as a zero-length extent pointing at an in-use block, and the
next allocation from it underflows into about a gigabyte of "free"
space.  Filling a fresh 1 MiB image with empty files is enough to
overwrite the reserve VDS and the backup anchor.  This is the double
allocation behind the two syzbot reports linked in the patch.

Patch 2 checks the table once at mount and refuses read-write access
if it is damaged, for example by the bug in patch 1.

Patches 1 and 2 should be taken together.  Patch 1 prevents the
allocator from creating new empty extents.  Patch 2 rejects an empty
entry left by an old kernel before it can be consumed again.  It also
rejects extents outside the partition.  It cannot detect every possible
overlap in a table that is already damaged.

Patch 3: when a file's extent list ends in an empty allocation extent,
udf_discard_prealloc() frees that allocation extent's block a second
time instead of the preallocated blocks.  On a table the block is then
handed out twice, and fsx, as run by generic/091 and generic/263,
reads back bad data, with or without patches 1 and 2.  On a bitmap the
preallocated blocks leak.

Patch 4: udf_table_prealloc_blocks() can hand out the block of an
empty allocation extent at the end of the table.  With patch 3 alone,
the reproducer below patch 3 passes, but generic/091 or 263 failed in
8 of 34 runs on the 2 October base.  udf_table_free_blocks() can
write a partition reference it never set; that one I have not
reproduced.

One more user is left as it is: udf_fiiter_add_entry() takes the last
extent of a directory from iter->eloc and iter->elen after inode_bmap()
has returned 0 in udf_fiiter_init().  That goes wrong only if the
directory's extent list ends in an empty allocation extent.  The kernel
does not create one for a directory: udf_bread() passes
UDF_MAP_NOPREALLOC when it allocates directory blocks.  Normal updates
to a live directory do not shrink its extent list.

On the 2 October base (4ad934e7a85e), with the whole series, one run of
fstests -g quick per allocation type (2 GiB images made with
--space=unalloctable or --space=unallocbitmap; KASAN, UBSAN and lockdep
enabled) passed generic/091 and generic/263 on a table.  The remaining
failures (generic/131, 360, 563, 634 and 777, and a hang in generic/346)
also appeared without the series and on a bitmap, where the series
changed no result in those runs.  The reproducers are below the --- of
patches 1 and 3, and the runs behind patch 4 below its own.

Thanks,
Matthias


---
v1:
https://lore.kernel.org/r/20261002042627.1677228-1-matthias.goergens@gmail.com/

For stable: patches 2, 3 and 4 build on the int return of udf_next_aext()
(b405c1e58b73, v6.12, also backported to 6.6.y) and apply as they are
to 6.6.y and later.  Patches 1 and 2 should be backported together.

Refreshed onto jack/linux-fs for_next as of 30 October.  The four code
diffs are unchanged; the messages include the clarifications above.

I repeated the inline fsx reproducer on this base and the whole series,
with KASAN, UBSAN and lockdep enabled.  On a table, both fresh base
VMs read back bad data at operation 9852; both fixed VMs completed all
10000 operations.  On a bitmap, one fresh VM with each kernel completed
all operations.  In one fresh-image generic/091 and generic/263 group
per kernel, both tests read back bad data on base and both passed with
the series.  No kernel report appeared in these runs.

On the 30 September base, the unchanged patch 2 code also rejected a
crafted looping allocation-extent chain, forced read-only fallback when
the table location held a file entry, and let SIGKILL interrupt the walk
when a test-only knob disabled cycle detection.  Those malformed-image
checks were not repeated on the 30 October base.


Matthias Goergens (4):
  udf: don't let the extent type hide an exhausted free-space table
    extent
  udf: check the unallocated space table when it is loaded
  udf: fix preallocation discarding before an empty allocation extent
  udf: don't use eloc after the end of the unallocated space table

 fs/udf/balloc.c   | 11 ++++---
 fs/udf/super.c    | 80 ++++++++++++++++++++++++++++++++++++++++++++++-
 fs/udf/truncate.c |  7 +++--
 3 files changed, 90 insertions(+), 8 deletions(-)


base-commit: a344542d9f26d44a5ebf597220ccac84c536467e
-- 
2.56.0

