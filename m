Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DD640FD9B
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 11:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791458646; cv=none; b=gGHxzGAQ/BSYVZ18c1tyAqCgtcJTGBsijmRos9PlcLNaWy2hoQfQJ8ohqHb2k3l9n0SH1Z4cxNvC9TtW07LQQFWrUaReLhYt+gx0lYfURmuCEaUL1DPyNdPNFsC7xFpBPuOBiacMTE7XVEoGw5bM7NEiKXUbMwn3nv0vNExRet8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791458646; c=relaxed/simple;
	bh=VIsLR6MnQ2cCtF2zNSWuryXqb0+AoC1v+XRTD9qa3PM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DeNX+BSORvLg1TRCOaZffAtYR7XId/OZzT/Wz1sxVtVOVqFdiJ2AYY24ItRXCoyX9XdVBhxV0lt98oJC8MMqDiaBWAaaajZuXkfZW5XUGDc3deD/W6/Ds/MHWTtCbLt0ILWzyltUhf5W/9JEDMqHvAVItsSqTcTolPToqezL2r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nQBLIVXp; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nQBLIVXp"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3a7cfe8f761so358168a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 04:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791458644; x=1792063444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GK/NzQ7B7TCPuEAkNeYo7IlMKawycpDaCj1cdyO7pWY=;
        b=nQBLIVXpxdscORzFo/W8vzco38ugt7bsGtKVYYiE8vBkPISpG4D9IE810w3J5a9qbm
         AI0LO9J2yTvDsyi04OGHzsGcchNF6vQwKSuscdQQ2ya0FwDTENsGTvVkGf1xHqO2H2F6
         nA/KriDnZmuxmEnqaLp/NNLfZPcIf8XNXV3xA7C0H6ARqI5Q0ShmgOssHE/Z9lkpKYu7
         THrx/WckA3ZZcaxo/9hbw4zxds8d1AXOHuQZJ9uisDoAR6XDvKptAM7EiOs0M49M4N2q
         aJsZoLQ6Koe6FMj+pXR7YwnRRQeSnaorIploK+4D5iLGXEOQaug/1U/3aX1hcAMx/zQ6
         Kvyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791458644; x=1792063444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GK/NzQ7B7TCPuEAkNeYo7IlMKawycpDaCj1cdyO7pWY=;
        b=ZvrvaE9VoQU1HiJsfK7hbBob6J455GPA+aKsA/njgvG6UcIbQCOZHu8r7zfHYAjklP
         kL9nFY7kijdo4dHuE9fmCtKe8NUZdFjIlwmCaKtF3WquiJ8i2UBrAHwEWs1V+pqtkUoB
         Zpwpw3apoGi7oIsMSHI8Eh24xhX2+ivS0DC9e7MkABQSf1CUr/5Qf41/lxSEMnkQrPga
         4b97EYBNy6CVvWUopl4B8/V14Gr4BMe8EwN9yp/RFBREZpkiN672t2WkHgtZMrRKweZ9
         YVpBXCyF0GoRNg1DrpK3y7wEZbXB6NxmdvlzQKACvmpIfNXp+0UrrY+d6TUIADt+Ck0j
         n5gQ==
X-Gm-Message-State: AFq9FYLYaLdptSocrg4943a4/yYvya6fcTs8sUM74R1qZ5NF5MZkix45
	9z6rXJRdlRmtUzATnaWt1IIbFbYU3LtCJ1UVrquSwBwSwUT8T8qF7VsvHr/uHPVN
X-Gm-Gg: AYBFou24GWfwxT59LbIDJYTjHbSmDiHczajGSfRYV0/wzxmyKRnqz1ehO1+zKNboK9G
	thCUSE8O+n18aJreVEhqCtUmftwUXm/lC9w24MJIsPebW8JR9oGrAuaM0QwaC6q6jMqwJF4sZls
	Nna11uUm8jnBrJzGQ5Bx40v3tp850ydggCOosmcJnq+I09MFAyQdMaU/ipCnXu+K8Q//8BxE14d
	hq+yfL+3ng7Dl055oxX62RnSkcfGviY4e75HttiRGlgpONMEaGb5W3tx7YGtlNaiJ4TrrEtJECy
	itpmwabFLItllKr5TFUrHP0X9Px6TgkNJ6qCoAyqAuOXcwhEwG3Yg3hrkd0aytKDjKVHWsTd1nC
	ecL8W7NtxRQsaTuFEiz5fwPYKB9e6RMY1rjriH/YBnc9s/yAg2hQmdw0W7Zw+CdYiRPN1ReBfXx
	Ax5ZYjowBZLwO5wdCp37bhQzD0R+jGyFy/BcH2QoiPVK5oa/mq8LsSXvSry9bydNG14OctPFHJN
	JtW8D/UPlAxxm9tt0D8yDuJWns=
X-Received: by 2002:a17:90a:141:b0:3ab:1a5:cd2 with SMTP id 98e67ed59e1d1-3ab01a5236emr464701a91.35.1791458644295;
        Thu, 08 Oct 2026 04:24:04 -0700 (PDT)
Received: from obadmin-Precision-3680.atlascopco.group ([167.103.3.1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a89d718333sm4330053a91.1.2026.10.08.04.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 04:24:03 -0700 (PDT)
From: Sahaj Chaudhari <sahaj123.sc@gmail.com>
To: linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	kees@kernel.org,
	syzbot+6a0633f11d3fb88860bf@syzkaller.appspotmail.com
Subject: [PATCH] fs/qnx6: reject zero block size in MMI superblock
Date: Thu,  8 Oct 2026 16:54:41 +0530
Message-ID: <20261008112441.3957200-1-sahaj123.sc@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A malformed MMI superblock may specify a zero block size.
qnx6_mmi_fill_super() divides by this value while calculating the
second superblock offset, before sb_set_blocksize() rejects invalid
sizes. Reject zero before the division so mounting the malformed
image fails through the existing cleanup path.

Reported-by: syzbot+6a0633f11d3fb88860bf@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=6a0633f11d3fb88860bf
Signed-off-by: Sahaj Chaudhari <sahaj123.sc@gmail.com>
---
 fs/qnx6/super_mmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/qnx6/super_mmi.c b/fs/qnx6/super_mmi.c
index b8afb6f388b29..960ca68207d61 100644
--- a/fs/qnx6/super_mmi.c
+++ b/fs/qnx6/super_mmi.c
@@ -65,6 +65,10 @@ struct qnx6_super_block *qnx6_mmi_fill_super(struct super_block *s, int silent)
 	}
 
 	/* calculate second superblock blocknumber */
+	if (!fs32_to_cpu(sbi, sb1->sb_blocksize)) {
+		pr_err("invalid blocksize\n");
+		goto out;
+	}
 	offset = fs32_to_cpu(sbi, sb1->sb_num_blocks) + QNX6_SUPERBLOCK_AREA /
 					fs32_to_cpu(sbi, sb1->sb_blocksize);
 
-- 
2.43.0

