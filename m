Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792951350;
	b=l8FO8CVnME8xpN6+wcAaAt7kExmqHdDxtKSw9x9ApveaiNg/B8HoQISNzBtD62EqnHLV
	 M4EhEib1buDFoNzQP3/o6SBV/mDpwbIgJkTHqVBZE+G8WehM1JKzlMgS518Ie+S/O3USY
	 OWrEbIDYnHVbZ6kG7cDFsn8Jizau5XHPR+NpeHiJWvopaAvSFXSF/XUUPGabnysladxVM
	 2oT/pK9MPbSkDvcsGCWKScmCcAmS/YyB78x2oakjA5NLOpDm7NpIMfHyWUzxef2JAsPpx
	 NKgREJtxuE8dlT5YgRrlufmSvv875RhNPycJqoM7rrro7R+N8FQTrvjQ1TyZBQBprTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792951350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rgV7roqEK0hJNAZ4WkNhuBhtFoAn+fipk0Qu5uolb/o=;
	b=1iel3i4d46rWP4FC4sVVWKiiHVvNK5P9Q8yW7C/f1elhZSCq97auul7bSOhlAKkOH5pP
	 CrDNHXqoZPLiKukCn1YmGNLd+QQmGgfTvxXOToyMXNPzUPlJkbf4FN+2LkibSzrPMl5bF
	 FpJmGStS1k22MyE7wuh6yTo/P6ZNV2DbsKW0BrtU6XLP9PG5EnC2KcmVwiZ3d+beDSWxJ
	 dWm9maMdjx3Mg/GdEPMbdI9/nLyxxxBC11WKOyhZJsvYN9VYrDspLwt8tYJsFEUJNdaog
	 YXCoKcyaB7dWvfCnMAHnFQOX4sawrZW+VGe9ZjaId2eO8hSjNtTZmyPqCYM6N434MlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VlX5ZKKN;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0225606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 18:02:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0225606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VlX5ZKKN
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1931ff67a29so5164712c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 11:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792951349; x=1793556149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rgV7roqEK0hJNAZ4WkNhuBhtFoAn+fipk0Qu5uolb/o=;
        b=VlX5ZKKNytiya15OMckeCCqM+c6EtLc/G8XheXqBWZtqkQu4ialV0WYfc3qMdV30eJ
         vedPvylRRH/yPgIV23FF/CejrUkZZB7vEpLHXFJqsWVqc3WSV3zmHiVxH029muHkKZaN
         Hx3yL3gJaUqRSRXkILz98kD4uudf9D+tLtUUUrhrgI5jX0EXkf13DCVdYtzWbCMtqvgz
         6x6aKsCZGmL8RGh6KSDgxJavk+iUR6dXZzBOWZvpIQ2fs2HkWitXeN1uu2WChIwQ/98H
         8E8WrwQmAA6FZn8r65KFYVdOmxMDRY1s/vqycAzqP1NIENfKU+KG9RabPGubPqMnjexC
         E61Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792951349; x=1793556149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rgV7roqEK0hJNAZ4WkNhuBhtFoAn+fipk0Qu5uolb/o=;
        b=gspiy1NxJ5itb6GnMb2O/SfJnLngYQjdb6tXRZ84EfBIaRWn6Ef4ObKT5aVR8zEltr
         dvjGGpdZuhlqqPioniX9ozbGgCBLF8pNzXeuaOiGuQuOzJEqRCnHrTf+i5MhwgQRTNXW
         3BC3kUHMcKJUM8wzxtKHToqWRhiibgrESrvDoFGbeLGkKdgBqr3dE2NXbvJZ5A0CBW53
         FNmcCVOZU4Gu6Ejm+9nnPuqhx+rCtsC8sP7pbXValn1S2+LZW7IzvB8Ms50/758QIwhn
         eeKF84J21i24qYN37zf7Z3HC/60loG0T5vA4CtgA67bvdBVkdrLatK9FnmIyYoKeWT91
         k6Fg==
X-Forwarded-Encrypted: i=1; AKwUvBxBrtU6i0wfe7gdPIUlEkvIL+oo44BRbtffsNrs5NRdNy76VN/9sOXwbiddZWVKZNQEqzXIX1hN1vGV42A=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2CXvSphbiEuSgAIHGywUAmhfe09deD9yHdnP6L3iLSa0J1beh
	/jky5VOF2E50iTmdGieV21WwkKLmDGt54RTrFY4j+AvrVz7CKWpl0XWz
X-Gm-Gg: AYBFou3L6T+Yq2ynoG9gRjCuk9YWZIIxe9tSR4oPeTc8KiNVDjJZcfokLINrGOMpg1u
	1SHrzSYHBKryDpRI8gfVk0ZVpY75pAe0GIXfm21wWmyVhovukHs6LmmfjXKIFLmINh8Lq4LfeTc
	Bn8zD6d0eOcwMxjTxC7mbIzT6EMliGZL4WRuCgDwTKmvkG3lIrpsvuKe6wEiZfz/DfSHRsr9Rag
	rHrRb1hjZH1HooOdyxYpW1bwMNC8CqR9qkWW/UqFZpVBsusU0En7+0kkzwV57GkverMxLA7uNdR
	z0woAKRXV8mnDXGxy4tTv+NOnHmRzjGdJDKNwuOeolzWunZUSRvVyRPFrfHkK05az9qLYv1es/y
	6hoJHFSoqebTmdprti8k/HhrpVQH/nM7OOqkyUAZz5T/dvoGW2gY4CKSsIq9mV60boTJ/Vxn8sx
	gAQr3VytAhYRiQohaQHmMSMSI6YIFpcEn4//U2D8rhOoCdYrbCYGr00abwThIwh7clRBBIK6LzI
	ol1UMsIYpLGkefNedAlCCdop+irsOj5j9mrohq/2exAjmSzfgrvpOejMMVhKiv8u5JpgcgJ5SYW
	+ve851MYcDd+qfckWV4=
X-Received: by 2002:a05:701b:2405:b0:18c:e014:6f1d with SMTP id a92af1059eb24-19929a9e465mr6481076c88.1.1792951348538;
        Sun, 25 Oct 2026 11:02:28 -0700 (PDT)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2a5a515sm16099227c88.19.2026.10.25.11.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 11:02:28 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Cheng Yongkang <teel4res@gmail.com>
Subject: [PATCH 3/3] f2fs: refresh superblock CRC after MAIN_AREA alignment fix
Date: Sun, 25 Oct 2026 11:02:07 -0700
Message-Id: <20261025180207.348498-4-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261025180207.348498-1-teel4res@gmail.com>
References: <20261025180207.348498-1-teel4res@gmail.com>
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

sanity_check_area_boundary() fixes the on-disk segment_count through
__f2fs_commit_super(..., false), which does not refresh the superblock
checksum.  segment_count is covered by the checksum, so the next mount
fails with -EFSCORRUPTED after the alignment fix.

Recompute the CRC over the modified superblock before writing it.  Use the
raw superblock's feature bit: sanity_check_area_boundary() runs from
read_raw_super_block(), before sbi->raw_super is assigned.

The stale-CRC trigger was reproduced 3/3 times; with this fix both
superblock copies end with segment_count=9 and a matching CRC, and the
next mount no longer reports an invalid checksum.

Assisted-by: LLM
Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
---
 fs/f2fs/super.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index b90831e..7dcf15e 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4023,6 +4023,13 @@ static inline bool sanity_check_area_boundary(struct f2fs_sb_info *sbi,
 		raw_super->segment_count = cpu_to_le32((main_end_blkaddr -
 				segment0_blkaddr) >> log_blocks_per_seg);
 
+		if (__F2FS_HAS_FEATURE(raw_super, F2FS_FEATURE_SB_CHKSUM)) {
+			u32 crc;
+
+			crc = f2fs_crc32(raw_super, offsetof(struct f2fs_super_block, crc));
+			raw_super->crc = cpu_to_le32(crc);
+		}
+
 		if (f2fs_readonly(sb) || f2fs_hw_is_readonly(sbi)) {
 			set_sbi_flag(sbi, SBI_NEED_SB_WRITE);
 			res = "internally";
-- 
2.34.1

