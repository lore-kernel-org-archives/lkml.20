Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569C236EAB2
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787817607; cv=none; b=GSrXiWtwwL3eHVLbBIHt6FPHd4t5yB8d2nnoGmJfd5/s+QErg2rrXiyai8tgmbT5Se3+Q0V4VsJVwWKd7+fedWELcDaf+C6oMT7/hvTWUizfbFiCGIhiG8IHCDugCvk/WX+3o+2ahKAQNwaXdlG+xfgpe/zfAQloRWgml/7ftcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787817607; c=relaxed/simple;
	bh=5nRAf9v7X/AN+mvMm/2alr2Z8jGICfCcxCsJPFg9MZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VE3SG5vLPgWFxywnbiJBGu0I0Z1X9lMKjFTojfOUrU704f0Mo+GSBa25K5eKg2fO4Upl9ELmYkNodtWPzn9GfdHlDyqVCEy+nMaK1peboVKnytlhVN4yZR9pqpCE9HD+pFjO6SNofoFTKVzt7aPg5IjLooJt/rWBCHVguAQSN8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AoHCE76S; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AoHCE76S"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38e58034d05so436669a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 01:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787817605; x=1788422405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xtynvZadmT9n7iXGBfDWjegw1818rbUL1ZR1absKuqg=;
        b=AoHCE76SIa6+8g/g9+4CR23q0UkwQe0ejL+7QzkOJiWLncytD/qecqv38MGWTQlROR
         utMuiSWQ/w0mznqa3Efe2+z0LdzWjhFksQH8P1LUU64N2BVlBB8431GR+Qw6B59zgqQa
         bUNMDpduatDjWp3dC98osouamA7Vy2/p901IWEOHX0xWoS/6VV8iCyeUqetqk3aOtIPz
         0swhsPA5wnVjLPWRPYSXvd6vgqARjibij3lX32Xpaj5eAqk2dZvVkb9dCczCVnvsO5Kw
         UZTQDkTjTLlgwyvXh4fLb2TuCSqty1T8ZAkkEKLPAXzIFkzjidoy/U/u5obGt+jh7XuI
         U8vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787817605; x=1788422405;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xtynvZadmT9n7iXGBfDWjegw1818rbUL1ZR1absKuqg=;
        b=syBQGyIehc0zuUF96piIpRJ3y4FqIhlcWyM4gatORX2JOuQ13BU47+K/DfIfmJeFOu
         d6QLAlcdIPt2ShvDBwazyq5mPWv+N6mOkspo5XnwFmc06gyROgrjd0bVfn3csVHp84bc
         3HZzx3xxZYwiYnIvUFOm3/Cjx0SKk8mzInxs01a8YVIsvpcDUOP9q14ADucp4rXzi/zW
         29c7pZzbIX3wbBQ3pjiqb+iYCDTJPqd9glGGUQ47/pnWfMsnuLVPQ5l6YudgyCsWRfCi
         nD1ZerxaKfvqF/cfyDIfFWBFj/EVEuTxwu6ZU4sOP1ZvzXS7NPtjKfzFiY1sRqqRrYrv
         mZFw==
X-Forwarded-Encrypted: i=1; AHgh+RrdwjFn4nJahe7PudbXXChHOir24FPTPaXKsGwJ66/Ig5DulV40Gxdn+NKBWUaYHLfpjc4AoI4j5fHb1Ic=@vger.kernel.org
X-Gm-Message-State: AFuF++nSycjXaWjS7b4KACoNoiFruemAcC/ZX8q45AyuBF+MoL9zbjtC
	qE0pmH16e49YrnNoINm2zI6+Q3M3DFrrX4nQSOE6gKnZJG0twMTebiIE
X-Gm-Gg: AR+sD13/aEo95CNG170Xz7OL9DdMHUFZo6zNEPpH2+12e1QzEdD45+B6ba+k1EYHk7v
	rNfihom3ONFMdLpR1tgbmZWAoV0rxMWcnJ6F8ZalOGkwRBDyQ1i6Qd/DHmGMbVHo1glROrRLI13
	jgF7zcujnFZ8CLqzuC0uE/C5zDlVk9LeimSYT8lg8H0oncpUOHHAnU1ZvJgEk6IN7SKov1oihfR
	hsotc5yov79YECLzZOU86kI7X/0D915gIevAJFpxxlXAbaFIkR2x1PunBtPm0HqhMDgmVLtjgiL
	IbLelyHrOsz+/ergPuPTzdF5148U7zThrzmqrPVyG91BImFpowipGq1p7TkKFsrNg537/zu/n4x
	s2fcuorOUpGFXQAn314J/rO8ucOx1lca2l8O8s+5gIBYJtrOua95yBLOdD9KbchaRmyJS9Qja7x
	xQPMpYAxgJ9ikSMwN/zLB06e070Rr41h/ffkjjftNw/tICh9eEKN6lxvaW9UAY0IQRt646xXE59
	zIBFjTUM8jqGlqRg90GnNYkkS2gUEcoYuCkhzRh5rkR9XP2TK2JZj00EQm+erZu+aGU6+ERR88+
	ErajtRiJujHJcELD/3qMt7Es
X-Received: by 2002:a17:90b:3890:b0:395:bbfe:fc6f with SMTP id 98e67ed59e1d1-3966d401db6mr25766414a91.3.1787817605188;
        Thu, 27 Aug 2026 01:00:05 -0700 (PDT)
Received: from myserver ([14.51.250.42])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fd9085sm1678619a91.12.2026.08.27.01.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 01:00:04 -0700 (PDT)
From: Seokgyu Choi <tjrrb0313@gmail.com>
To: Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>
Cc: linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	syzbot+f613f9f010ec98eb9d86@syzkaller.appspotmail.com,
	Seokgyu Choi <tjrrb0313@gmail.com>
Subject: [PATCH] nvmet: reject namespace enable without device path
Date: Thu, 27 Aug 2026 07:52:21 +0000
Message-ID: <20260827075221.312935-1-tjrrb0313@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A newly allocated namespace has a NULL device_path until userspace
configures the device_path attribute.

If buffered_io is enabled before device_path is configured,
nvmet_bdev_ns_enable() returns -ENOTBLK and nvmet_ns_enable() falls
back to nvmet_file_ns_enable(). The latter passes the NULL
device_path to filp_open(), causing a NULL pointer dereference in
getname_kernel().

Reject namespace enable when device_path has not been configured.

Reported-by: syzbot+f613f9f010ec98eb9d86@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=f613f9f010ec98eb9d86
Signed-off-by: Seokgyu Choi <tjrrb0313@gmail.com>
---
 drivers/nvme/target/core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/nvme/target/core.c b/drivers/nvme/target/core.c
index d74c01c98f19..336013139ef6 100644
--- a/drivers/nvme/target/core.c
+++ b/drivers/nvme/target/core.c
@@ -591,6 +591,11 @@ int nvmet_ns_enable(struct nvmet_ns *ns)
 	if (ns->enabled)
 		goto out_unlock;
 
+	if (!ns->device_path) {
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
 	ret = nvmet_bdev_ns_enable(ns);
 	if (ret == -ENOTBLK)
 		ret = nvmet_file_ns_enable(ns);
-- 
2.53.0

