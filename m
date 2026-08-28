Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA9635C6B9
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787919915; cv=none; b=XnHglMEPSYAMTDGUlXvJN3VCMzovlC/ENO9+Kz6Pa4OwZdAec65CZhZWJw8PU5H0eCOMBivtrdljCDJsye8/6pC191DIyN54BCjbQ2a2McVmMgPFfTyhInfJUP1wgCqaoQyIYOTuU2tffSWvccOcypeiuvQCKSwTfkIBWhzEy+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787919915; c=relaxed/simple;
	bh=pWoBE0Ap013VoeV2vp85NB4S53A3uBMfxaaPmtJIfxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ez29aXWVCkRnhrCUygWvf5kIpGR7LvhYdkhiX0ZtePolI5uKbJgWspdG/Xmmz6gbSWewqXLrYSisktPKoARkaNIJqMY82vTvwvFraZJrRP6U7r24HdWZVkmHhbXM9hVYo+CH5G1VRyZPjt7c2OrfwVKsuYnplmfFhURugzy658I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FNSVbBat; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FNSVbBat"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cace91f112so6981765ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787919900; x=1788524700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ghL++ZvF6V2+SKQri2NFYRwIeM8mcziADY1V3awfvk0=;
        b=FNSVbBatkQeZNEeKJGramg+chWGwQfHIyvV95kioQRtt79F83HLA/07KFs4Be2nHQs
         1YCkqjLplZDNUhN8XK+CLsPGSoJ2uK3R9C7OLfCd9TWc1LORtR2RWw44FqgJvfixTfbk
         5gIy1Lpn1FiJnGCbeoePoKceET/pkkTrl9Nz/Olt9nO09IFJ8IPnQ/vRh3VpEKGp5IFJ
         Ptatx2FssVk44TfCab2xlauTFIZz/9Nn7T48vEl9Qrebzs0ytzb7j/G3f2kZhY/ATsq3
         ajpDgq+VcJkqExKYbdgx+PbNmlV/iDs5WVNst6usgnHG2kY+oHjkBGQ5Wspkl2urh1me
         agEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787919900; x=1788524700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ghL++ZvF6V2+SKQri2NFYRwIeM8mcziADY1V3awfvk0=;
        b=B/YU0CurbENxqdrA0UDOGZMibHmEUJqJ4X+1072+5Nra9y7l0Or7MjWFpelY7KMWWS
         DGyRK1IGdgGVdC8uQfOEP9/Zczrrokc/5wKN3nMkaQzl2FjbUrEcUcH7G7pc4Oc/G8fp
         LnMjnHcLvCqtLO9xjmGegAnN/QgrynZ7YyLpkvMbwM76y+Pj8inN/vH1gRUuF3wsYqh6
         E5mUfSsj3L9M6u6IwuhueAsJ7+UEMSmykdHbIUZ07LXMgvoRTt8b4pEHXI7tV1/ML2h0
         +rr7whRoLVBmOFDCUksjGyHYzC4TfDIcLmzPCMkA1ZUcf88QcP7ty7P5DeNvpTL4nTC1
         aW1g==
X-Forwarded-Encrypted: i=1; AHgh+RqydBOa3IRlbSYQsQZlbBxYa3zqiLMRAFWyFeetxREDh/9vJE9uapc+PdjQMTLWsFIzJLpNQXYmGQdxsNs=@vger.kernel.org
X-Gm-Message-State: AFuF++n3fGPUAuDbTVVFootGmdm9gy3nWXqGJ9tWl83lAkCdd6Czne5t
	Y0C2HNrFyMtnBg4wOYNKDOZQBGL38rFIneFAcWxavxHcG53gNItoGgmG
X-Gm-Gg: AR+sD10XDwEHN1LaYB29Wy/UYoo2OELqnzKMuz6XhT/eZQvYQQVvd1Zlj2jD3tJtMa/
	iho6VxXZ4sSDs5eCWyO325iRdYt2xPu/MsAi/HZ7rZK7TuB/lAHF5rHj0IcMJWWakvfrsq/Nz8a
	4ywi5AEyf/Pec/gLqXkq9lae2ORM0+wr3L9bFjSp8ae77XxmW83MYhXVlCuUAMjh/9dPaNcb1gq
	6FuLaGIthAWXFxwXNE7HZs+KS9PB/3WhR25ibCfsDxgaVICp+9eThQi4Yg88yoedyKz7qHVrIiO
	6h+VToeOEyRrkxuWi1LUtSZAr1V9xJ8umuf2tkYhSubgpwEWKnWy8GskKd4egfeysYrKz8b2vdp
	QyKt6ugHH5BP8xQwWZYLnAaqpm5iiVU9qdhS3YcCsbSvOjlpGpceoL17RJSAiA8fHtM/Ji4dqyc
	b65AOthjTHy5OOvYbF/2di+cWklYQroPcQJothCgOUSWi54RENZ9XNmCuG39raJ6mE7xmvfyEdd
	IrdZclPyTaUhHUoteAUM3JC
X-Received: by 2002:a17:903:22d0:b0:2d6:ccc5:a3dd with SMTP id d9443c01a7336-2d74dc2ff23mr111979445ad.4.1787919900181;
        Fri, 28 Aug 2026 05:25:00 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d7594fb48dsm4969115ad.14.2026.08.28.05.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 05:24:59 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	stable@kernel.org,
	daehojeong@google.com,
	qiwenjie@xiaomi.com,
	qwjhust@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v2] f2fs: sync pending discards before reserving device alias
Date: Fri, 28 Aug 2026 20:24:51 +0800
Message-ID: <20260828122451.1154128-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A released device-alias range can accumulate pending discard
commands. The reserve path later makes the same range valid again
through f2fs_reserve_device_alias().

If pending discards in that range are not synchronized first, the
discard thread can still submit them and hit __check_sit_bitmap().

Handle the synchronization under sit_i->sentry_lock by moving the
range wait into f2fs_reserve_device_alias().

Fixes: eae3faf210bd ("f2fs: support dynamic reserve/release for device aliasing")
Cc: stable@vger.kernel.org
Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
v2:
- move the discard wait under sit_i->sentry_lock in
  f2fs_reserve_device_alias()

  kernel BUG at fs/f2fs/segment.c:1228!
  Oops: invalid opcode: 0000 [#1] SMP DEBUG_PAGEALLOC KASAN PTI
  CPU: 1 UID: 0 PID: 79 Comm: f2fs_discard-25
  RIP: 0010:__check_sit_bitmap+0x2e1/0x4e0
  Call Trace:
   __submit_discard_cmd+0x921/0x1140
   __issue_discard_cmd+0x524/0x12f0
   issue_discard_thread+0x686/0xe20

 fs/f2fs/segment.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 1e7e745be71..50d49ba3e11 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1916,6 +1916,15 @@ static void f2fs_wait_discard_bio(struct f2fs_sb_info *sbi, block_t blkaddr)
 		__wait_one_discard_bio(sbi, dc);
 }
 
+static void f2fs_wait_discard_bios(struct f2fs_sb_info *sbi, block_t blkaddr,
+				   unsigned int len)
+{
+	block_t end = blkaddr + len;
+
+	while (blkaddr < end)
+		f2fs_wait_discard_bio(sbi, blkaddr++);
+}
+
 void f2fs_stop_discard_thread(struct f2fs_sb_info *sbi)
 {
 	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
@@ -2684,6 +2693,7 @@ void f2fs_reserve_device_alias(struct f2fs_sb_info *sbi, block_t addr,
 	seg_num = GET_SEGNO(sbi, addr_end) - segno + 1;
 
 	down_write(&sit_i->sentry_lock);
+	f2fs_wait_discard_bios(sbi, addr, len);
 
 	if (seg_num == 1)
 		cnt = len;
-- 
2.43.0
