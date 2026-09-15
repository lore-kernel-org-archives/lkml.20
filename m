Received: from mta0.migadu.com (out-242.mta0.migadu.com [91.218.175.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB98B2405EB
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 00:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.242
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789432666; cv=none; b=Q8dUEmu6/26dK0IxZOMFNqUH5JFgLm0DQ052Fs+cgvfZGYkO5W6YnqQ2+l7e1YBbA9TK5SscZ+Bq4E7dkHv37dqs4Fi174wkyVrrfI3wLOEXoWSFD/pOuMhX5Cx2Enj6rUH8mOYXMnu6gSzYu7B9AEewfvOkVLGEhWrCuRqQiX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789432666; c=relaxed/simple;
	bh=NVj9c5KfMVbzl9XTE7+p3TmQIeowOBJBTPoyqaia5JE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=P4Q9fBICjLR0VKUJNUYmW4JNAlw7WxkHrJ14JTfiP6qVLTCCAuAYr3BB+1HrLeTmQjEelu9ghdlMLLE+UvTzBQEcFioI8nAuwn7iwnrjqRMHpRPskgEnbj4/23vZpH0QS31B6D+WL+TEVPm6zJpdKbIUYL/z7FLfTPDSYIiPqUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cressey.dev; spf=pass smtp.mailfrom=cressey.dev; dkim=pass (2048-bit key) header.d=cressey.dev header.i=@cressey.dev header.b=TCF9OMgr; arc=none smtp.client-ip=91.218.175.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cressey.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cressey.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cressey.dev header.i=@cressey.dev header.b="TCF9OMgr"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=NVj9c5KfMVbzl9XTE7+p3TmQIeowOBJBTPoyqaia5JE=;
 c=simple/simple; d=cressey.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789432660; v=1; x=1790037460;
 b=TCF9OMgrrQU4xPga/Ip5QTgQsG2LzEd7mZQCTkFz51sekpS/ILm+cdn6CXv2MHzS5LTMQOEv
 y3xcT8CMNJg4/m0tbR4dVIlzORIRTrbky2jfb+BdQLdsMf/Rd3GElwyGY2F7x6+q6I7lrqW738f
 /K770Lqx7P/VC3sP2rkyrT0+M89bmvVwXjMW5+7tc+3/iahQV+9Lc2ZaT1SvKerd2qBNIjSAAIP
 5WuAVJK7fKkSKSZDEhf3Vb0P1g8rkvhL3uDLAlwShhu9ztq59WJEavZu4kM1bHVNvBTNRIX9nRW
 hM1SHl2+xDP4zS70r4IDsh4JsepsDjixn4DwiZe1z7k2Q==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d0abbf3a478eacdc;
	Tue, 15 Sep 2026 00:37:40 +0000
X-Mizu-Trace-ID: d0abbf3a478eacdc
X-Migadu-Flow: FLOW_OUT
From: Ben Cressey <ben@cressey.dev>
Date: Tue, 15 Sep 2026 00:37:35 +0000
Subject: [PATCH] dm-integrity: fix buffer overflow in inline mode with
 large tag size
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-dm-integrity-inline-tag-v1-1-3076b1b27454@cressey.dev>
X-B4-Tracking: v=1; b=H4sIAE+TqGoC/3WNSQ7CMAxFr1J5TdRBTSFcBbFIU5MaSlI5YVLVu
 5OUNTs//+/nBQIyYYBjsQDjkwJ5l6DeFWBG7SwKGhJDUzVdpWophrsgF9EyxU+aJnIooraiayX
 W+0OrlJSQrmfGC7038+n84/Dor2hi1uVGrwOKnrUzY15Nc2n8y/MNudyiP59gXb/5ZCiHtgAAA
 A==
X-Change-ID: 20260915-dm-integrity-inline-tag-645e17849955
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
 Mikulas Patocka <mpatocka@redhat.com>, 
 Benjamin Marzinski <bmarzins@redhat.com>
Cc: dm-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Ben Cressey <ben@cressey.dev>
X-Mailer: b4 0.15.2

In inline mode, dm_integrity_check and dm_integrity_inline_recheck
compute the checksum of each block into an on-stack buffer of
HASH_MAX_DIGESTSIZE bytes. integrity_sector_checksum pads its result
with zeroes up to the tag size, so if the tag size is larger than
HASH_MAX_DIGESTSIZE, the padding runs past the end of the buffer. With
CONFIG_STACKPROTECTOR the kernel panics in dm_integrity_check on the
first read.

Enlarge both buffers to hold MAX_TAG_SIZE bytes, as commit b93b6643e9b5
("dm integrity: fix a crash with unusually large tag size") did for
integrity_metadata.

Fixes: fb0987682c62 ("dm-integrity: introduce the Inline mode")
Cc: stable@vger.kernel.org
Signed-off-by: Ben Cressey <ben@cressey.dev>
Assisted-by: LLM
---
To reproduce: QEMU nvme-ns with ms=128 and 4096-byte blocks, table
"0 8192 integrity /dev/nvme0n1 0 100 I 3
internal_hash:hmac(sha256):<key> fix_hmac block_size:4096", then read
the device.

For stable: before commit 5076d4599ce1 ("dm-integrity: enable
asynchronous hash interface") in 6.18, the dm_integrity_check buffer
was in dm_integrity_end_io.
---
 drivers/md/dm-integrity.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/md/dm-integrity.c b/drivers/md/dm-integrity.c
index 92970e12267ab..0862f31b8498d 100644
--- a/drivers/md/dm-integrity.c
+++ b/drivers/md/dm-integrity.c
@@ -2721,7 +2721,7 @@ static void dm_integrity_inline_recheck(struct work_struct *w)
 	outgoing_data = dio->integrity_payload + PAGE_SIZE;
 
 	while (dio->bio_details.bi_iter.bi_size) {
-		char digest[HASH_MAX_DIGESTSIZE];
+		char digest[MAX_T(size_t, HASH_MAX_DIGESTSIZE, MAX_TAG_SIZE)];
 		int r;
 		struct bio_integrity_payload *bip;
 		struct bio_vec bv;
@@ -2788,7 +2788,7 @@ static inline bool dm_integrity_check(struct dm_integrity_c *ic, struct dm_integ
 	unsigned pos = 0;
 
 	while (dio->bio_details.bi_iter.bi_size) {
-		char digest[HASH_MAX_DIGESTSIZE];
+		char digest[MAX_T(size_t, HASH_MAX_DIGESTSIZE, MAX_TAG_SIZE)];
 		struct bio_vec bv = bio_iter_iovec(bio, dio->bio_details.bi_iter);
 		char *mem = integrity_kmap(ic, bv.bv_page);
 		integrity_sector_checksum(ic, &dio->ahash_req, dio->bio_details.bi_iter.bi_sector, mem, bv.bv_offset, digest);

---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260915-dm-integrity-inline-tag-645e17849955

