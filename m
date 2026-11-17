Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794907294;
	b=37Mm4TcxclclyHd/G/wHqSyoy4otqtsXojc4A+WhT6ejWS5F+MBlFgnp/1nNLwftijX4
	 msX4ImKOmylLWR3giQZaMD0GkGPQA8G2qyu6OUymyub+UOTs0fDv1IxAxJrhz+raQkX2x
	 g5Mvx7q/xcNWFtFZwbx1xzCDQAa06Y83rZron3Q1EIviFGgsVysad51blq2kdH1x900sZ
	 jd0k7w7evD29j/3MfNpR0H6RDkDA0R6JmbCkOd9AeYQS/WG99BqEYh5furv4Myud/jlCB
	 h2JABLs3ZNJgKl5WaQ6y1odt6ym2uoy4cLTvKjmYJy8jIm30U/8aikI/mPbYvsoR6NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907294;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=V5C32j7KQtTkw2KKwIqJ7ZKWPh3APBzMNv1Aof2IOsg=;
	b=Z57YXHv0oU2oEdeC3WQZ1clIPSmIfdm76Hu17CmHUFXq6QzzIEybKnIaQ2kQpFbTISjY
	 8pcYSv5qDwK8hm+ZiNAemLk1wHgYFJlXlmnpNP7fXhczvUiIySC/E+wyme0FaBZ6oQ1li
	 coOnvtwjJL1swo7U4VzLfC7s2ljG6BGGmooQaFEKUU0yFk6jycF9ljDJ3aPDzHynsOpkX
	 TS3V6pcOEqAY/UhgBaVaW7O8mrIr9y2hT++m3r/3A8tMi6+xck90Yesh1FzPmMHysEFKD
	 YovtvDh3nfMoOxjhNoF70ccmlRKFvOpoEyq64aLIUq2/r31u3H/FymTjr6jhDb8lF1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vKpSprbp;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56BF606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:21:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E56BF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vKpSprbp
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8b5c3288e6cso1984801b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794907293; x=1795512093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V5C32j7KQtTkw2KKwIqJ7ZKWPh3APBzMNv1Aof2IOsg=;
        b=vKpSprbpMiiYi8HmgBFAbSBdNJ+AKqjeniNUkcJfH1FyyPtXU36hapcigKFt4FSxsJ
         a5xJvHlVBPf7HLm78iCJYfTrYmg8sPB3uZNMmJylFU/0DjU7t4QMFYfFgq0XEu03J/lm
         lGR9iTukqLor8F70voAbVdYI2g60oa06Nl81CVdl0+lJ7HVpbaeoPkOQWYJzU5sJqeUH
         SFWrG7bzBn4LUBj5tgXTSuMOCuqvykGyjLwsEqRgO5DqlNqTqFKR/yK1sP4k9AArzGSh
         BN9smaww8aZdSW4tVNn9e/Ist7olhPoQMep3kuYDYO5YRv0q45HemtlkDU3jEr42faw9
         0eBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794907293; x=1795512093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V5C32j7KQtTkw2KKwIqJ7ZKWPh3APBzMNv1Aof2IOsg=;
        b=IRVEjngo4zPY3IGYLFds0RekJyxB3HEzKsN8Ny6iVV736XrA9qPhnsuGZ8qPGm4/hY
         4rkgFKVSylJqb2dJrjMpiOfmf42AkcOXOjpsM/p1Xh1ZTi4GNpi3qf5ar8PKGukddkjB
         grZ6NGwRV3Ou3L0QMkLmdBvixlutRk4M08XkMrA0oek1VNi0QF16DjuZOTGkNXRfDBuK
         Qph1JOHr83j+bbDZXVpm3wxf34++l/ae0ljci/MjeLh9E7p8VwN5BanNMi1E0yHH0HL7
         sHXMTFycOomKV9uRP6bE8oTJ0LZIzZGdC1pG3YmrqoULifNTMULzativouwV2FllmFpS
         undA==
X-Forwarded-Encrypted: i=1; AL+hErFjYCKsCQtV9xsAUoeexhV5JMTUYPwf7JXSwRt09eKX2IcdMIKO87dfOe4YQIWShjfVdXI5gnNc/6AhCOM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VUNeiwoY+D4of+idv2/wbvDZgeQVmAJp6TOK0+JfZemL09pdh
	W5IgOAWkxQ1k0iuPCxI6pFIupB5yEd0eRWEu6BVqPevmE5P3XwBIt+bP
X-Gm-Gg: AYBFou0zV/ZWuZaFVurlmwwPFb1jXVj7Zvw/BxW3RtcF+VivwTU0/zj9dpJbttVKLYI
	CMAYennsT2TJ+WxaaFLRRWzqPFQdinYouBzpYbvbEJANYI0a12dqiHVZThprpDLz4Bbq8IucCx2
	ZKotb1MkYdKSpASbtuvM4oyMOAO2esTzgJ1ZW+urwbTWQjRLCmYqwYw/VxOQ+8sFi9Lzv/kDMgK
	twyjCeiY9HwlchYrXiK1ANbjDucTpK01kpiQVyCUi5G30QK/MJAhIab46x2O2PfBsCoMq3swYLv
	2A5E/YhxgV0qAUALQtkSiI1oZOHuY6Dc5vbUJ5Xa26f8rwMsckMuy3KvpbnQup5nDY7r1phBvBe
	L0AX6tFiQFhF8N+xORsyHPCOuPE+iX5t9ojltEXq/H/BiFx5tdgwnPCPJsSOQaUP6XSVNhLL9t3
	nxC/RXUWGrG65b29hDY4Ut8HxO+FiTrKMUUetvE7k9hd9mf7vc9tU05aPwvehADdnHuZQu3OqD7
	LeGUy1Wr6jae3iOnr8ZTAUXwAxDRQPmgFoZbcN9g1O7A7Nre7cY+UOJaAf7DM34wraVXCDJ2MDv
	HbWZl7Qm+WbAGnXVmLg6X7/j/QTbx12ey9ryoUk=
X-Received: by 2002:a05:6a00:1a92:b0:886:d769:615 with SMTP id d2e1a72fcca58-8beb1fd9e52mr12502977b3a.1.1794907293239;
        Tue, 17 Nov 2026 01:21:33 -0800 (PST)
Received: from TheRealOne ([2409:40e1:499:722a:52aa:d755:8f06:9251])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed204f7d6sm5014996b3a.35.2026.11.17.01.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 01:21:32 -0800 (PST)
From: Chandradhar Kumar <chandradhar.2003@gmail.com>
To: song@kernel.org,
	yukuai@fygo.io
Cc: xiao@kernel.org,
	magiclinan@didiglobal.com,
	linux-raid@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+9e3014263a35700ab49b@syzkaller.appspotmail.com,
	Chandradhar Kumar <chandradhar.2003@gmail.com>
Subject: [PATCH v5 3/3] md: enforce max_disks and MD_SB_DISKS in raid_disks and slot sysfs stores
Date: Tue, 17 Nov 2026 14:50:53 +0530
Message-ID: <20261117092053.10884-4-chandradhar.2003@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261117092053.10884-1-chandradhar.2003@gmail.com>
References: <20261117092053.10884-1-chandradhar.2003@gmail.com>
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

Userspace can configure a persistent v0.90 array via sysfs with
mddev->raid_disks > MD_SB_DISKS or rdev->raid_disk >= MD_SB_DISKS when
mddev->max_disks is not yet populated or when writing to the inactive
or reshape sysfs paths.

Enforce the disk and slot bounds in raid_disks_store() and slot_store()
so invalid configurations are rejected upfront with -EINVAL or -ENOSPC:

1. In raid_disks_store(), reject values exceeding INT_MAX to prevent
   signed overflow when assigning to mddev->raid_disks, and check
   mddev->max_disks and MD_SB_DISKS (for persistent v0.90 arrays)
   before branching into active, reshape, or inactive configuration.
2. In slot_store(), reject slot >= mddev->max_disks or slot >=
   MD_SB_DISKS (for persistent v0.90 arrays) in both the active
   hot-add and inactive configuration branches.

Fixes: 1a33a379e678 ("md: reject v0.90 arrays with too many devices")
Signed-off-by: Chandradhar Kumar <chandradhar.2003@gmail.com>
---
 drivers/md/md.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/md/md.c b/drivers/md/md.c
index b09553078353..9fac810edc26 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -3387,6 +3387,12 @@ slot_store(struct md_rdev *rdev, const char *buf, size_t len)
 		if (slot >= rdev->mddev->raid_disks &&
 		    slot >= rdev->mddev->raid_disks + rdev->mddev->delta_disks)
 			return -ENOSPC;
+		if ((rdev->mddev->max_disks &&
+		     slot >= rdev->mddev->max_disks) ||
+		    (rdev->mddev->persistent &&
+		     rdev->mddev->major_version == 0 &&
+		     slot >= MD_SB_DISKS))
+			return -ENOSPC;
 
 		rdev->raid_disk = slot;
 		if (test_bit(In_sync, &rdev->flags))
@@ -3408,6 +3414,12 @@ slot_store(struct md_rdev *rdev, const char *buf, size_t len)
 		if (slot >= rdev->mddev->raid_disks &&
 		    slot >= rdev->mddev->raid_disks + rdev->mddev->delta_disks)
 			return -ENOSPC;
+		if ((rdev->mddev->max_disks &&
+		     slot >= rdev->mddev->max_disks) ||
+		    (rdev->mddev->persistent &&
+		     rdev->mddev->major_version == 0 &&
+		     slot >= MD_SB_DISKS))
+			return -ENOSPC;
 		rdev->raid_disk = slot;
 		/* assume it is working */
 		clear_bit(Faulty, &rdev->flags);
@@ -4471,11 +4483,20 @@ raid_disks_store(struct mddev *mddev, const char *buf, size_t len)
 	err = kstrtouint(buf, 10, &n);
 	if (err < 0)
 		return err;
+	if (n > INT_MAX)
+		return -EINVAL;
 
 	err = mddev_suspend_and_lock(mddev);
 	if (err)
 		return err;
 	noio_flags = memalloc_noio_save();
+	if ((mddev->max_disks && n > mddev->max_disks) ||
+	    (mddev->persistent && mddev->major_version == 0 &&
+	     n > MD_SB_DISKS)) {
+		err = -EINVAL;
+		goto out_unlock;
+	}
+
 	if (mddev->pers) {
 		if (n != mddev->raid_disks)
 			err = update_raid_disks(mddev, n);
-- 
2.56.1

