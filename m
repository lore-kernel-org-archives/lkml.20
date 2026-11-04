Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793763351;
	b=sbtdr2FBiPPmnHVtude331DWlsMNh71DWseTKUhzWoOszOsk2JaUnKYEWdmsbdcuUUPt
	 Rta8PUgTgyzYfwbYjmoqZe4QblXEoJ0HXo9Nu8AF1IQKG6wHloswYShOSlpfQJOnZWgsl
	 MbK7WTYRFxVF7kjDLj+3HTv26WGjI77KltakfsPyR3ZTBc4OytXrMmS+xCNVSmBTaC1w/
	 4K9MK233u5qeneKNCF8r2tfFz++xV3frbnk8jLymFJCdpbh62T+V/HSd1eKe145Mfhf8U
	 jcgt+T81j2VhWkovgZyI83ccoWknfueArO+UgmlB4H03F8N8sMhxaLivLZvhv3otDYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793763351;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=hAHLejY9oB/8f/CfT1Y6ivnfaaSpI9Ek0JXQqjTj05U=;
	b=YbM2pqxrI31WCWWTQxEE+rXKc9wIdSO028h6ldjk35ZpyxVh5rhVJHDMavqPPMxbO9cM
	 qgIVKEFCseD43rPjRsO/EghGb+79lUTjV6r571WaixCgBtLMXG4Qtlz03WpNTqbgjlPf4
	 5XcuYvz/wSiQAW6Twi2O18A4UK2ht6nvfEj6M3Wx/scV1ZV8AunmYGDufPfdqKqGBfX40
	 kSUJhuT+vErYLf4HqoGPi02IglAbY0GsIiYMDF1ycfY/ccjcJUMS6kRe3ZFcVQ++NyO+W
	 30mipyoF2nx/AdlPDpKFdLX2VHNAGQoBCapGGHKbTj4rEOm6zDp5QR9p5YWuygUMYBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HLoyn5F0;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01F2606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 03:35:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E01F2606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HLoyn5F0
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e8b20a899fso1273095ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 19:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793763350; x=1794368150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hAHLejY9oB/8f/CfT1Y6ivnfaaSpI9Ek0JXQqjTj05U=;
        b=HLoyn5F0DxNrsAHS8+TfkRmfUbGr6VxTYbCCG9BptYSU79sXh3ZQeB7WHhp/zkC1BP
         MEZ+rLSLw2ugKprYH8WjTD5pF+7Z8Hz8Gv5fZ621EIF5PM2cLAEwwxLX64HFuJLccRBI
         dxVePSPgZQPJeTqxTG3UUMjVeROgPoBR65+UD9UOj1/f4wE7/8X/Dn2LnN5pwmLUGopY
         DuXckwzgYGKHgPvgPu9UQFQ6P8/2nW+DzR40cvf/Da7QGFLwnXEkNku+XfwYFv/Cn3Do
         BfHZNn92rijfyVqnq3L4TZyTEPStUwvlAakzjtXd4GvoxZ7OYMwcbtxdI9flcSLIq2IJ
         KFxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793763350; x=1794368150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hAHLejY9oB/8f/CfT1Y6ivnfaaSpI9Ek0JXQqjTj05U=;
        b=iiylT7qWG6OtPt+mg6J45gDGSV+k6v4nPuc34owt7zjPkfv6Z3Z96ikzFiT8UAJ6ZZ
         /z1Qf3nwfyCJLpMO2h2eqE7jm2dCzJ7VjRI4VQv97lAezC9VIXOsNv3ihxr4vuH63SUX
         qsN0ncyVIItRSlYphZ+USd46YUQ6IM0EOTpJFINlC1SYDwqm+ZoknS7eHoqX3z4lj8Ux
         6KrNcKEwSfx1jo+a4urWvbCuYSb5Ik+82PPBtbhUB1xAsmyBn8+DfW7F07p6bbqJAI6W
         yyJp7esZb0C9NNtc4IlorS166qyQv69DdrkCOHWnf8FbsUmYrOfe4ZJeeICPaT5u2MTB
         LC5g==
X-Gm-Message-State: APuU4Z/zFrsJ4LiQahy1i7Zt2N41wzbOoze+WX+suHcKA/W88ckEf2AQ
	j65pXQ6n+A8Didn2TkZtrGp0uF2fqSyjzpvz6c3BjLzV6u2Ub5JM9jD+8+rKWFC7TC8=
X-Gm-Gg: AYBFou2PP9It4VCNmgFNRECQEJhYqO0G6rVXlxBF6ZCWPavvjA8rKUKU9CJMjLj62+j
	mfCdBwX7OnTYuXJTs6/0gGoXXmDZ5KIRGoWphNJYMoQATZxUOGe2L9IYwKIFnT8w6xIfK83el/Y
	VEbwRrVXcr6uVJi6prMaukBGt9RvoT/S1DSbUaQfrv7RoFhZ0zeNYGjtJwLvOVk3nKekc8k2MZr
	aO+dnC38BVprg8UkjCo2eV4VE8xHSCoGqOEa+M1Md+UcJg/AfeGCuKntOrPFlVja/6WAcZvzA33
	HnE4q0wMIfW0LujhGO6UwiKogXEwRBkbnPM275kKLHKrSIP+uRU2ydoqFe5YZ9FKYzR67fN+Fn5
	KJ/B65d1f2q3A84NliS0UTl+n/9FSrhgnoMWIUUPYsvpQVPtNtXm5ssvxbTcziRHBxlwaepmvW9
	CTa3vSxi25HkgXH8hraUE/ktF6+WaGGGv3qEKXrRXqjcks1sl6p1+arUo1/vB+gc6aMII7pEV9e
	lZZAAXC6g5H+6kXwmvrsLGcdls7j/mzeBzAIO6MlLSUFR7nHwRYs2NB1lJwgeALD1IAHD5bVIzj
	kot+gPmMu444tL4S6t1js3JUgoekr5XMLYBi7qApQYCe6f8bT4ZFShoPUB4H2oJ7
X-Received: by 2002:a17:902:c405:b0:2df:8733:f229 with SMTP id d9443c01a7336-2eb3649ebc2mr145706335ad.24.1793763350157;
        Tue, 03 Nov 2026 19:35:50 -0800 (PST)
Received: from localhost.localdomain ([14.116.239.40])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed08bd50b5sm1555095ad.4.2026.11.03.19.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 19:35:49 -0800 (PST)
From: Jianping Liu <frankljpliu@gmail.com>
To: tytso@mit.edu,
	adilger.kernel@dilger.ca,
	libaokun@linux.alibaba.com,
	jack@suse.cz,
	ojaswin@linux.ibm.com,
	ritesh.list@gmail.com,
	yi.zhang@huawei.com,
	frankjpliu@tencent.com,
	linux-ext4@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2] ext4: fix soft lockup while shrinking the extent status cache
Date: Wed,  4 Nov 2026 11:35:39 +0800
Message-ID: <20261104033539.3031910-1-frankljpliu@gmail.com>
X-Mailer: git-send-email 2.43.7
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

From: Jianping Liu <frankjpliu@tencent.com>

__es_shrink() walks sbi->s_es_list and reclaims extents from each
inode. On a non-preemptible kernel that walk never gives up the CPU.

There is a soft lockup report on our company's machine. The machine
with millions of active inodes, 256 CPUs, and heavy memory pressure,
concurrent shrinkers run too long.

i_es_lock is dropped after es_reclaim_extents(), and s_es_lock is not
taken again until the next inode. When nr_to_scan remains, call
cond_resched_tasks_rcu_qs() before continuing the scan.

cond_resched() does not report the RCU quiescent state needed here.
It is compiled out when CONFIG_PREEMPTION=y. Otherwise it schedules
through preempt_schedule(), and RCU records that switch as a
preemption. An RCU-tasks read-side section ends only at a voluntary
context switch, cond_resched_tasks_rcu_qs(), idle, or return to
userspace. The helper reports that voluntary quiescent state and still
lets a non-preemptible kernel reschedule.

Changes from v1:
- Delete time out logic.
- Change "cond_resched" to "cond_resched_tasks_rcu_qs".

Link: https://patchwork.ozlabs.org/project/linux-ext4/patch/20261028061628.1209508-1-frankljpliu@gmail.com/
Signed-off-by: Jianping Liu <frankjpliu@tencent.com>
---
 fs/ext4/extents_status.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/ext4/extents_status.c b/fs/ext4/extents_status.c
index 018b6146b9d8..62346eaf4350 100644
--- a/fs/ext4/extents_status.c
+++ b/fs/ext4/extents_status.c
@@ -1721,6 +1721,16 @@ static int __es_shrink(struct ext4_sb_info *sbi, int nr_to_scan,
 
 		if (nr_to_scan <= 0)
 			goto out;
+
+		/*
+		 * Report a voluntary RCU-tasks quiescent state before continuing.
+		 * cond_resched() is not enough: it is compiled out under
+		 * CONFIG_PREEMPTION, and otherwise switches via preemption, which
+		 * does not end an RCU-tasks read-side section.
+		 * This also lets a non-preemptible kernel reschedule.
+		 */
+		cond_resched_tasks_rcu_qs();
+
 		spin_lock(&sbi->s_es_lock);
 	}
 	spin_unlock(&sbi->s_es_lock);
-- 
2.43.7

