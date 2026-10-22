Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660130;
	b=4nEFNzr8oS5fvfaxJ24xeLE1XG++k3DhEPmUE/8G6eAwAAH0pWA0o6BFCiMOo+zT9Xo7
	 hn2q3zpqQx4sFOqrMpLtp8gtWt6GDEgjfiJA9xit+Ulz1anN9tog08puJs9L++xwbjzPI
	 vQgr1JUs3o4pG9Qs4DledrlqxgSgw40vnzjK8drW2VwVdhEKRgPBeEYabcokonYm6D8wT
	 zEUIuzdETw3jPmHwqINfMMbX7iDJJXCAacxNfUeYNRXsMxpsWK9on7oLKG+Y1BAVorpPW
	 /uGi5Pn/xyWRA6e/NSxnnN1o9BDS0WPjYWp0TEB0lmxe1yK/5wgPVQeLPpIuNQVCDnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660130;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RLwjd0wA/MWjFh1zhTci1SLIdCeLzV5/hu4CPoq8FCY=;
	b=I9BV2taxbvz+PS8VHXSbM+m1Xs7lGTA3hmNCvHk7zTkvgkesEQ8+/aVHaKaUtTvR+hd+
	 dsF0uOiHjWBRbrSmSC3Qxg9YZ0tQi7phyDS8Y1ND5j/JdJpheYiSZWTYdxv/0C+v5D7EJ
	 dBqzPQZWum1LC7mhVKzrekbAsQNpCx+wElQcIydeGByra3qVtm2Sf7Of5gB7bNYXEMAaO
	 rmwB4yeFyueBBFt3dwMa8nnxwvH9czPIXIy7SztM64eAvpBdaqjQiWJghifXZCnEHHVVW
	 B9BFI4kAk6VLlyk01V87ax2hk5bYu+DgdSKVny4erDD48HddwVngayKWUWSchgY0enA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CY3l8Psn;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA759606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:08:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA759606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CY3l8Psn
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3acb512a7a0so932933a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792660129; x=1793264929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RLwjd0wA/MWjFh1zhTci1SLIdCeLzV5/hu4CPoq8FCY=;
        b=CY3l8PsndLAVHacYhXCYhzOUrOOdrTi1or1qcqw+YzmZNgjKYUWAcAcNGmqU5LYEmU
         ZcH1+K1aBDcpmAjpDG3BXowoh/Q9edg+xXhyGguR0BgETvAc86KrAC0zXKXWeNy66ZlF
         NCbwoFw0R4bBMiVqHXPj9ZlwQ9rhVdxiLy6qhqdwlQmOaxbjmwxw/PnBI+jqX2GH1gZZ
         Yh9MDtGxxr2iOP3yQsRqOI59TWfkePZ5MIti1xjENP9+HADypTubFicjA/DsaxZgBdAL
         Zy0o4O4PQobkISfVHa3X/puDHf9RndgeeddQzsfS5bcAb+r2FspTEKWKicE+eAuivIdz
         eD0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660129; x=1793264929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RLwjd0wA/MWjFh1zhTci1SLIdCeLzV5/hu4CPoq8FCY=;
        b=mRXO0v+7KPZ8u3sWb1DG2FUEWU4o9TWQUKn8qGuCtyhARtNRl4XcSnfn7YgCIXNZNH
         RCrrEPBf35kSNDDgO0cfHTDCtdhQb7tfx6/KxDoFrujZ55xnMzFMFIjOsZCtgAXTiEkb
         cN+PsIyRv7onrGtmRVtCaatjtbhrY3ynblSlspXXvlnViF77Ui3kGMZdIjBqJ4ZHotBu
         5U48qugMN/VNsCl/FwYiLeTUvUlH0UKwbTsKZWnXH9b29ZNNUok8Ys7M3WnhKg9VKTCs
         XczgFVgGEzUMwbR5p2RPXrKzdJHA/tkvnWwRqKRmPAE27BSsGx7Iwdc/LHAMWVw+UiWV
         Jy0A==
X-Forwarded-Encrypted: i=1; AKwUvBx4Y+/kobiQ0nt4LNE5H4VIAu1Jj1Z6Jo3Vm0+CaGZog8hAjG19/+j9U2G934LFGJ/A4ReDRRAW5Sf6tdo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJY5AB3Kj3UtS2ZijJiBP6Jqf81gJG/NnzIUkKR4ihMr0C5qoz+
	xXZbfi/GHM+kBO/u/uoe7dI3h7YTZYRb9XLqgJEOFrqxWQ5Ib3+vuCex
X-Gm-Gg: AYBFou1RfWIafO6IVmU1i8mDCPyW4rDDiBcAh6dPdxVjtFuqXGZTXdQ/H27/5xm6oRM
	iD9+7JvrY90EzDdimpoKQVlv0DpfRGqBVvV3SwzazyzO/aDC+hs3hxrZ1kIWi8kvI1zvP18CO0h
	gXnmFFBNC7HZTz5mFgLUZos/60iwuHbYYdehyI8P82pAX+SHh6huVL9V0x31jOS7Moau/RkVMGJ
	0ZyyRYw48LQ58WSBzAELWT5Q3BScTb+ur/VHY2YG3YEu57rVCqiTbEKmfdj1l3+5VBdMY9yHoIM
	Rottb3ysVEKSauM0C1WbsOktauzTGby6FPZ8mbyonPbuBd3FK3tqR3cBe+xX46aijHsWs+4Zvpv
	3MQOGYPLcB14wavI7FyQeT7K0m9ISeLAdhjXsKYvmsKC/LWESj5oYHmWrZUyhuaM4lCn2WYuGCK
	tvKBtqI3HMemEY1+zfy/3gP5nR+cEUAPN7RdoLLAA/caZjdeZ27grjL9JJJ+KAoCoGuD4ivOlR1
	Y5tV8pJ5AqNRXYLXX0qgCMw2WbxakQVHTR+FLLdK40NQgJsgNk=
X-Received: by 2002:a17:90b:1b0e:b0:3ac:a993:5b5c with SMTP id 98e67ed59e1d1-3ad86afc038mr4100221a91.6.1792660129150;
        Thu, 22 Oct 2026 02:08:49 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada490c096sm3325111a91.7.2026.10.22.02.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:08:48 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: mark@fasheh.com,
	jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com
Cc: heming.zhao@suse.com,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v4 0/2] ocfs2: stabilize dentry names in file and setattr traces
Date: Thu, 22 Oct 2026 17:08:40 +0800
Message-Id: <pm-ocfs2-objects-candidate-0088-v7-6324344256f0c3b1c3d8-0@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Snapshot names at all six users of ocfs2__file_ops and at the separate
setattr event. Patch 1 handles the five ordinary file-operation callers
and setattr. Patch 2 handles release separately to preserve its locked
open-count sample and take the snapshot outside that critical section.

The release explanation distinguishes its existing RCU lifetime coverage
from name/length consistency. It does not claim that the ordinary
callers' external-name UAF interleaving crosses the held inode spinlock.
The release source change is unchanged from v3.

Patch 1 also removes the read callback's redundant NULL-inode check.
The two patches apply independently and leave trace formats unchanged.

Cen Zhang (2):
  ocfs2: snapshot dentry names in file and setattr traces
  ocfs2: snapshot the dentry name while tracing file release

 fs/ocfs2/file.c | 118 +++++++++++++++++++++++++++++++-----------------
 1 file changed, 77 insertions(+), 41 deletions(-)

---
Changes in v4:
- Add a name snapshot to the separate setattr event, including the
  same-directory source-directory rename case missed in v3.
- Remove the redundant NULL-inode check from ocfs2_file_read_iter().
- Clarify that release can select external names but its held spinlock
  already delays their RCU reclamation; retain the inline-name/name-length
  consistency rationale and the unchanged release source fix.

Changes in v3:
- Cover all six ocfs2__file_ops call sites with two patches, grouping open,
  fsync, read, write and splice-read and handling release separately.
- For release, keep the trace and open-count sample under oi->ip_lock while
  taking and releasing the snapshot outside that lock; cache the
  event-enabled check.

Changes in v2:
- Replace d_lock around the tracepoint with a dentry name snapshot so trace
  callbacks run without the caller holding the dentry lock.
- Pass both the name and its length from the snapshot; keep the event
  enabled check and release the snapshot after the trace call.

Link to v1: https://lore.kernel.org/r/pm-ocfs2-objects-candidate-0088-v3-d628f98bfcb6784a0bfb@gmail.com
Link to v2: https://lore.kernel.org/r/pm-ocfs2-objects-candidate-0088-v4-a9a0df898afb4fc65fa0@gmail.com
Link to v3: https://lore.kernel.org/r/pm-ocfs2-objects-candidate-0088-v6-d3056754af7e660155d9-0@gmail.com
