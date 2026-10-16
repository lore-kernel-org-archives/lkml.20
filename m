Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA061C862F
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792129459; cv=none; b=qSfjV9whIE99ySG2TAHlm3A03Lfb0BGqR3IdKsdI9TNySZsypNqvHLwaxfwgCU/42Yg+67xgT1X2ijkJhEc9FwWLhhFMCq5ytQL4SbUiZPdsT1OxIs6xa7oBt9sfQ2ZVnV0/cR6v5y/Hx9XYbbQhZE1mszsQqM1YLv1frLwTvWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792129459; c=relaxed/simple;
	bh=fKJD6yt0VtxjR8Qs7aUsGy9CTSw7+gIiWlhz3pbgjlY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fNDIUoeIw68h2KXp+mvXGktVjOzjK/8irrO+RTsckqqrBVt7dGUiagOOeRDmlVRd52E1ijPZh63b7o6qBABK1g/O1vIawZBUC084H3ILhMNfK0jchOx/O62xFfUpbFcBdIBEgJf/JwADtoBxxCH9j7dL2kIOlQ2KGG72aRd/6MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g4F7NI5b; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g4F7NI5b"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3514b90bb89so5098409eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 22:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792129457; x=1792734257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X/HZc3zEH3FMgTce9H4OKnvH8oJPDGjZDpCmpbazH/g=;
        b=g4F7NI5bN9mdBlnmk6M6M/sHKFcuzNA/YmCt0wtI7T7v/4qpL0L1n+RDmmiQwESQ6V
         2NFi/OVVN3KhA4YYQ9jPi1gI2nDIVEYaM3DVaG7xs8vYbF1cqCh8HFvqrPEvb1Qj24s1
         PaxDQE0wPPVjk6IKsA981mYF/sMv0n71OFXXKG9soqyRw/sgNsiPujBqVzFEQKASTTzJ
         D9RqAxC19xItLP+D644G+AYxIexQUgRGPfBtQkLqYh5johmJBhK0GB8qQ6Zch5TOAISz
         aQK79AVoXJkudGwypgMqnSR1OpFSCSdUu8BbF+kH3IaXX5rsfa9IW/f+2CQgBQMcVN+D
         LBjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792129457; x=1792734257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X/HZc3zEH3FMgTce9H4OKnvH8oJPDGjZDpCmpbazH/g=;
        b=kzqx6NtBVoZr3ERNPjIoaCuTUdAo12F5wcYlF8DXOTFTu5LWxs8lvs04dXPuVkS2BP
         qJhVH/O0lIFlJ0kw3uWHdIX9Zw3gM1Vv8PGj8If5PXimgHKlMkm2nl7sEXDh6pSyrb9D
         7X/DwU/BvXIyjBGZmCjq7NM8qTXvPHViuIYKZHs2ffnHGrZBcVmMT41dRfxuf44tnMvG
         AtUiwGR7v7ARNmocjPkp35m9Fe9crp5LPKQ57LsC6NTLu1M3QYBfwd0rGKslwZtYW+Rj
         4gjZJedViMvOS4kIiAtNU+QZIdDk0cTkSn3Aq72MeI7Y9y2wR10NoQXO/knkMbt3x/zV
         YCOw==
X-Forwarded-Encrypted: i=1; AKwUvBwvwGZPHO9aJThfl8Aoc/J6+d2UKkOtSI2wq+4pEefYrpMPNxUSfjHPlKOL4ei8ec3d5sJRlJWQEen46WE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+2hsPSVc0ZTXUgHQlBGtzFVMZRTBD7aC2PooOY6gyBl6pUKeR
	N9VGs1LMV0Zrt5SpLDYdxTSbGnTmMUc6rhOW5NCtlPRsNWX+lJcCzdWg
X-Gm-Gg: AYBFou3TP7p8z9wLgzWJ1UK6quxq8ILsPAbmLvEnC1pe0eB83FFJPUEm25XuGteUEW8
	GIgRY47zRne899lPVzlu2rFnNq0Hh+qibKaVtiEbDOesA6sPUNUKbgktWa+WeNZ0ouU6+4Jm+jQ
	Po8H4LE20RZCUrvi6OwIJvvgv6xd2ZAjCPHXrR3Xdk/l1uhJenYWOT++yYplwYQuoMgB8iPQeiC
	TplgPvFgnzZSU8+2t5T2fzVnWVyhesoVBZksm+uCOuOdNalmxSaSN5V8/IK79qQsJiz+TQr01C8
	KtJcqViAdT0vyMUTTVLECkPGDgwuerxMq/JRNLH4vq7eeoRu2LlFiQAVY5wld9NbJNI4DOubTzB
	Y4sTC/BursPu/mHyCwitZZeXNgt5BZ2eFKxpPrZ/y73sV2V1Z/2I9b+Xv5/f1DiasKyVxHDm1pZ
	sNYRfdLqWkb7S736oQQCyY4HHDScH/m38dMYmn/Y+G+u7OL7YsA+PUxT6WmrCKiF1kxVpJ66r1/
	vu18sWFhZxW+Tv5RlzK8gAlvbci1F5AECU=
X-Received: by 2002:a05:701b:2412:b0:137:fa50:a242 with SMTP id a92af1059eb24-16a586a3183mr26627294c88.1.1792129456966;
        Thu, 15 Oct 2026 22:44:16 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831919fdfesm2642428c88.7.2026.10.15.22.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 22:44:16 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: daeho43@gmail.com,
	daehojeong@google.com,
	sunqiuyang@huawei.com,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	qiwenjie@xiaomi.com,
	qwjhust@gmail.com
Subject: [PATCH v4 1/2] f2fs: flush SIT journal during filesystem resize
Date: Fri, 16 Oct 2026 13:44:05 +0800
Message-ID: <7884c62cae6e4b1ad516a9ac351c2604e57d5cc5.1792116883.git.qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792116883.git.qiwenjie@xiaomi.com>
References: <cover.1792116883.git.qiwenjie@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During a filesystem resize, SBI_IS_RESIZEFS prevents new SIT entries
from being added to the journal and forces existing entries to the SIT
area. However, f2fs_flush_sit_entries() returns early when there are no
new dirty sentries, leaving existing journal entries behind.

After the main area shrinks, a later checkpoint can access a journal
entry whose segment number is outside the new geometry and trigger
f2fs_bug_on().

Only take the zero-dirty fast path when entries may be written back to
the journal. This lets resize drain existing entries through
remove_sits_in_journal() even when there are no new dirty sentries.

Fixes: 04f0b2eaa3b3 ("f2fs: ioctl for removing a range from F2FS")
Reviewed-by: Daeho Jeong <daehojeong@google.com>
Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
 fs/f2fs/segment.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 25785b7626bb9..bf8d07fcce331 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4893,7 +4893,7 @@ void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 
 	down_write(&sit_i->sentry_lock);
 
-	if (!sit_i->dirty_sentries)
+	if (!sit_i->dirty_sentries && to_journal)
 		goto out;
 
 	/*
-- 
2.43.0

