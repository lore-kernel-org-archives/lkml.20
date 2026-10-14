Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D90751EDEE
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791995071; cv=none; b=gzdcoON63RAbcgOZm44VAH3RH6I8oIvG9NcsNdmaQAzkajK623A21DEWMETg5QctLRHMxv3xjNSYtM47aS+z4qap/9yJzvlhTI6t/abmb1nDI0RRDxhA+UJXpCZvDLVyzMwqX0TyS3Qq1giNwFIHPq7VnV26kV0MYGN4LnpzD20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791995071; c=relaxed/simple;
	bh=8n4C8mBosLA48FlF6AMIfimvRE0ynBaCkwx0/o7tJAE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=guu0NdDyKoriFNCobhZ91JiclH08IhqpZJE4AEQU83aVOeTbS884n9OBA/n6863eUSpDmPgKFcRsFBZ5CGzghwis8t2Ih0W8jhvxksrTr28YPj0dkqKxyXVNTWKyZRH8QF6S6pEICFYSp6nyTx2J0V/EQCs/0TteSJoky+93jJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=Im0Z+n0a; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="Im0Z+n0a"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1419d3416ceso2001246c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791995066; x=1792599866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7fArNqMcPnfGqJ3AJ98+N2PF0HJ2l/WUFDVFpep1nyk=;
        b=Im0Z+n0ak4tnR3BZtPFUowZT13dL1VkVYpxHrRYVKFugh34SKhLtBf8NJVB3mAt8UE
         4Hz10fmTIwXnznM0Tv9wCpaDvV5dR8TAcizQtCFhygc++eq22J0pEwcPBxc3LmtMSV5w
         pP9JAg0SIDW35nvilHzjcbDMxcImhgj2fR2ws8yZrScxbLE5n8oVV5j5WzhuXbO2qLUj
         T+HJ2E+OfWbucF+bJrzif2LhS4l8UQFm6Fa8CU+VN7SFJBFfz65dVjPMS9hPwpKmenlp
         axlF+NX8f13UV/qOQtyVrqtzbW/svdMi+EVOyonJKZNBbNKMf102/jh7jQgzPLuz9sd6
         /9Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791995066; x=1792599866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7fArNqMcPnfGqJ3AJ98+N2PF0HJ2l/WUFDVFpep1nyk=;
        b=VEq9KONzRpmpx8ySmHfCoWqlPcROUiffP1Z3mf5NqkwW7x0S19nk/YUZ1VY/AARdtc
         y+Bi3J2hHESaMG/OlOBfaEuNfFv5gWuJE3MkPyVyXjTa9CRH4s0hIE2ke83dKvYYvbs+
         EkcxvE9bKZhmvUwnYzLuZQi4nbUtZJkt7X/6/dCA52oAsQWnq/zU0uY9Orkfw7mt7b8L
         3uA3mEcWSGRY9U0Oq2SWuphjFuxD2m9Nh49u+gWQB375NuoGTM/F7wgGbYIf+01WUFfJ
         UVmno88Ls9sENurk6l5h6YmITdkObBL5Av1oyY2xLIzrp07PKYHHWyQmQHX26GJt/Z89
         uDVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwiAxAgjHwWh4Ritt7NCLGU34AEk3xzC1VQoLYLU7Qd+bQC5AjfZxGUDLLLYV57zbUhXD5JHE1ndeLc3rg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYzEGGbfswysLx3jFUDqg80Azbqkaq4OK1c9RlgW+i9WBwADBv
	kw8Rr6rg1iI6fbL4NwLAWjXPc/06XjTF8Cjzbo4s9ifIpoBUl7zFMyniM7gPkinR/OQ=
X-Gm-Gg: AYBFou0qDElqFQzgZ4gqGlyA7JzqVoA2To6DNH8PJdbBK1F3t5/wTc4HlHy2hGWwTeg
	JpkknxubfxyWdc1kIXScggNKYPFV0ZOkbGJ0QKdK5X6YI7kvQUwziE0BnI9suCUWuIEXNJ5nlsx
	9TVUq/Er8sEEODx/2945TDFN1qanL8i7E1Zk+KqNWvgPdJxWsbgmXAtGcvt7Yo+Ia8s+UE5cL9K
	zQbfG8ROrjxcBerX/9H81VbnXJEPuwPqfrAe+HclE5rWU8v/mj03FsEui1RjDq/ITjGuCqN5M/m
	i50QzmlEqlMiw2QuhW41SeUQ34YIWT7QqDHvcRVo18bgavslw6i6oPEiqS0bApQVuJulLP19jRQ
	MVPy6AIN4rLpuCRu4KSnmQvgEJN0cZ9t1/NrWKaxtDOCKON+vnVzkxIMnwa1tkVQ3AtEk4+b1vV
	Bc+MnNd8aTyDVjNV3RkkED5qit+JtL0Sj/ZGmL4oL44p67y8Ffvx1Mkz81ARxc4aquYyra3pLOs
	NF8bG+TgRFTTe9zNLmV
X-Received: by 2002:a05:701b:2914:b0:174:7d98:fe9b with SMTP id a92af1059eb24-1747d99019bmr11401780c88.22.1791995065997;
        Wed, 14 Oct 2026 09:24:25 -0700 (PDT)
Received: from localhost.localdomain ([2406:5900:1044:110c:1c49:61ee:8c8:3f4c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1dd57d0sm48816685c88.8.2026.10.14.09.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 09:24:25 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v6 0/5] scsi: mvumi: bound the values the firmware supplies
Date: Thu, 15 Oct 2026 01:24:08 +0900
Message-ID: <20261014162413.3649841-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This supersedes

  [PATCH v5 0/6] scsi: mvumi: bound the values the firmware supplies
  <20261014151914.3632701-1-yhlee@isslab.korea.ac.kr>

which can be dropped, and with it the two threads v5 already replaced:

  [PATCH v2 0/2] scsi: mvumi: bound two firmware-supplied lengths
  <20261013173145.3412863-1-yhlee@isslab.korea.ac.kr>

  [PATCH v4] scsi: mvumi: reject handshake sizes that overflow the list
  allocations
  <20261014134104.3528958-1-yhlee@isslab.korea.ac.kr>

Five patches instead of six: the widening of the mvumi_flush_cache() loop
counter is gone, replaced by a bound on the device count in the handshake
patch, and I owe a correction on v5 4/6 (below).

Everything the firmware writes reaches the driver either through the
handshake page, through the event buffer, or through a response frame in
the outbound list.  The patches follow that split:

 1  event buffer: param_count and sense_data_length index fixed arrays in
    mvumi_show_event().
 2  handshake page: frame_length drives the checksum walk, whose counter is
    an unsigned char, so 256 or more never terminates.
 3  event buffer: the hotplug bitmap size drives two find_next_zero_bit()
    scans with nothing holding it inside what the firmware was asked for.
 4  handshake page: the entry sizes and max_io size three allocations, the
    list depth drives the ring index, the device count has to fit the byte
    mvumi_build_frame() gives it, and a reset reports all of them again
    without reallocating anything.
 5  response frame: the tag indexes tag_cmd[], and the value that is
    checked and the value that is used are separate fetches of
    firmware-writable memory.

I have no mvumi hardware, so none of this is tested on a controller.  Each
patch's reasoning is from the source, and I modelled the arithmetic, the
loop bounds and the index ranges of every case in userspace, including the
values that should still be accepted.

A correction on v5 4/6: its commit message said it rejected an entry size
too small to hold the frames the driver puts in the entry.  The code did
not -- I lost that hunk before posting and did not catch it.  Patch 4 here
carries both the check and that wording.

v6:
- 4/6 "widen the flush cache loop counter" is dropped.  Patch 4 instead
  rejects a device count above 255, which is what mvumi_build_frame() can
  address: it packs the target id into the low byte of device_id and the
  LUN into the high byte, so a target of 256 or more aliases another
  device's LUN.  The same bound is what keeps the unsigned char counter in
  mvumi_flush_cache() terminating, so that loop needs no change.  This
  replaces what I wrote in reply to the v4 review, that rejecting such a
  count would turn away a working configuration -- it would not, the frame
  layout cannot address those targets at all.
- patch 4 regains the entry-size minimum described above.
- patch 3 bounds the bitmap by sizeof(struct mvumi_event_req), the length
  the driver puts in data_transfer_length, instead of by the 512-byte
  buffer.  dma_alloc_coherent() returns zeroed memory and a zero bit means
  a device is present, so the bytes past what the firmware wrote would be
  read as devices that do not exist.
- patch 5 uses READ_ONCE() for the tag and request_id it takes out of the
  outbound list, and patch 4 does the same for the three shift counts it
  takes out of the handshake page, matching patches 2 and 3.  Checking one
  fetch of a shift count and shifting by another is how a device gets past
  the bound those checks exist for.
- patches 1 and 2 are unchanged.

Yehyeong Lee (5):
  scsi: mvumi: bound the per-event parameter and sense dumps
  scsi: mvumi: reject an out-of-range handshake frame length
  scsi: mvumi: bound the hotplug event bitmap
  scsi: mvumi: reject handshake sizes that overflow the list allocations
  scsi: mvumi: validate the response frame tag before using it

 drivers/scsi/mvumi.c | 187 ++++++++++++++++++++++++++++++++++++-------
 drivers/scsi/mvumi.h |   9 +++
 2 files changed, 168 insertions(+), 28 deletions(-)


base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.43.0

