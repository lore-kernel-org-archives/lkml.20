Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A04483825
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790257088; cv=none; b=ut6gBHyEFktdoTWRHd/j5bubJLK+7C00dcf3bM+usnLmlQ3ehWIFNdwIC4DiGbbJD/2naDt8qvx3qzKBLP7RBh3MsHFgmEGRiKjF+rXvW0X+xIqN5siYqpVEM0uiu0GPCp5oYw8sHsInICfZVfIpX9XjeBDEGUuy7H8+atObWCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790257088; c=relaxed/simple;
	bh=DW0RaEM8QlMWcBagrLSGUEQ2XGP/uCyKVGPiORf8YYg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XRngFVCPF77K9r0Cr1Tg38BDUHYBfIpedz6pyZXREdGEYNv7iiaTBxXc70/F/jC4D4Sh966VICH1OBjxJgGahRD10EqlTnTie/d28pzaFa0uD4Te+2jNt6cZ3nMURuQPZ2tLmgWUopb6jrJapmkK56gkjW6XxNPgB9sGjRYmgz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hZFoPD8f; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hZFoPD8f"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912e2406so10344205e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790257072; x=1790861872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3gTj4dxjCy6zhrK/mNMo01nqIzFYfn+n6Nf0sCRFv4c=;
        b=hZFoPD8fvahyA8OpFJZdJza5/O8xvXLTwwv1sehDxHi777N+uBzVqNTgBB3rex0BYC
         VkAo89z16Ez2cJZ6eTHSzY7sNVKV+daC3mLBHjKCV240ZrODZ7ObzeeSyTjzFcRUf16O
         EnHGrLCxkfWMkhxuQzwaMOLUJjVHX29lcJjOcdmmdc8V08VRrlLzcLTP81TtpSg5ahm/
         D8Dlz9Y5AYtfNURYVNlHb25+TslPXLlZX5bG9sW0Gpk+kxB9Tf4TNFPKFG9MRw1JzytQ
         2SBy7izCdFFQUpt5TBs1m+pvGq8I8+YXYVSAPSYwP16xrCDdx1h+ywKvia/aXtgYhYhy
         OdSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790257072; x=1790861872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3gTj4dxjCy6zhrK/mNMo01nqIzFYfn+n6Nf0sCRFv4c=;
        b=RSe6fQEXrd/+G0dREbt927+tUp+5nPwGnkI85BczpV7Zey5GwYKWAAgyF2QfVTPm8P
         9hSGgfZ2pqnNSYCXSVBatLhtm/UaJ+gd10WWSf27VneGyEBtm2qnrMb1o6dRKh8yqWY0
         aF54CAyqBddR5sJmNKm2itQ9ZnIgSEmJLvigtQX7Xg7dHw7xxdqZ2FyJCzkMBwuieEwV
         f+wCvdJpyxlPVF2qTu0WfQ63+BE70sZJmB5LcGQ/8Al1JZ3tCjQLw2SlQj6ya1U4oQOU
         VNJUFGnZrqHKbBO8xghg08ZXdx9/tMWeIBN84v81F1HADexkVIdsrfpuaIdH7UeQ71bU
         FaWA==
X-Forwarded-Encrypted: i=1; AKwUvBw/N8uSgNNmTPyHe9ahMrIxwdLCjG6P2YG1DPDhIJ4PyjRbAiBIvtLCznnRewACgBaIluHHc/A4gNKQhF4=@vger.kernel.org
X-Gm-Message-State: AFuF++lwGtZbHGevZOUCn/owSRyqXg0aD2IAorRPBjB9EMo7Jvji26nJ
	fud4D/y4A/hCCoE87lns0Em/8ZwXL/673sSTfcLJTzDiz581pUZpoR93JJ30RRp5
X-Gm-Gg: AYBFou3lwzLpwZr79Zc0LVQscBsPwyUAx96gaaN0NvIN9yPssa6Wvo0anB1bFTUim0d
	nfOuZAglmNVpJKLpmiH1h7Ckoy7mO5b5MDUw//T6dqCzviRnCiatdzvjgk5Nw2uA/W9Zsb4QDdA
	bo/iwoiTsLWXfH4ofmffkbIM2s1nqm0wKKysvyT9f2v1PiTCPK2V3m549Zau8rSG28/+fiu2eXm
	lxfKj7vgRfUWZemTqb1cWfSutEH/B3Sk7LFNxLdRgdyYlEdRiDpY1U6Ut/HxP4MKWopDOWomiPM
	b+AyB35KyiEV8vL5TPjPZrlaam41kwyxhIcQKRmDEv5lW0BFjG5yynFbnaT7tU3A/AYE50CRsY9
	ecRe8bE4n9w0VMY7j6gzmZ1ygr74GXITJtDne3xTa7PeeJ1EXDYIL6MATOzgWEnolXIdaLuMexI
	CeFIfbtvuYh1t55Ijdxf0/UpCOQCkAa5U48VeFLMJI5y+STW1WfSLcgzjAZUpXa31vk0M9/OMwf
	xLzOoeDXcjXXcS+
X-Received: by 2002:a05:600c:3513:b0:49e:6836:5386 with SMTP id 5b1f17b1804b1-49fe66ca6f5mr47506875e9.0.1790257072144;
        Thu, 24 Sep 2026 06:37:52 -0700 (PDT)
Received: from localhost.localdomain ([94.240.182.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5b9f253sm77377825e9.1.2026.09.24.06.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 06:37:51 -0700 (PDT)
From: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Svyatoslav Nikolenko <nsvatoslav515@gmail.com>,
	syzbot+dfcbc1741488709db4b2@syzkaller.appspotmail.com
Subject: [PATCH] f2fs: check log_blocksize bounds in __f2fs_commit_super
Date: Thu, 24 Sep 2026 16:37:25 +0300
Message-ID: <20260924133726.2250-1-nsvatoslav515@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Syzbot reported a shift-out-of-bounds panic in SECTOR_FROM_BLOCK() during
superblock writeback via __f2fs_commit_super().

When mounting a corrupted filesystem image where log_blocksize is set to 0,
f2fs attempts to perform recovery or commit the superblock status.
SECTOR_FROM_BLOCK() relies on F2FS_LOG_SECTORS_PER_BLOCK(sbi), which evaluates
to (sbi->log_blocksize - 9). When log_blocksize is 0, this calculates 0 - 9 = -9,
causing an unsigned underflow (4294967287) and triggering a UBSAN shift
out-of-bounds error when shifting sector addresses.

Fix this by validating sbi->log_blocksize at the top of __f2fs_commit_super()
and returning -EFSCORRUPTED if it is less than 9 (the minimum valid sector shift exponent).

Reported-by: syzbot+dfcbc1741488709db4b2@syzkaller.appspotmail.com
Tested-by: syzbot+dfcbc1741488709db4b2@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=dfcbc1741488709db4b2
Signed-off-by: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
---
 fs/f2fs/super.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 6a2f09c61dcd..b6b32bcbc126 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3934,6 +3934,9 @@ static int __f2fs_commit_super(struct f2fs_sb_info *sbi, struct folio *folio,
 	blk_opf_t opf = REQ_OP_WRITE | REQ_SYNC | REQ_PREFLUSH | REQ_FUA;
 	int ret;
 
+	if (unlikely(sbi->log_blocksize < 9))
+		return -EFSCORRUPTED;
+
 	folio_lock(folio);
 	folio_wait_writeback(folio);
 	if (update)
-- 
2.47.3

