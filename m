Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794194045;
	b=fWK2vn7NHmrjthl8a6D5ZpPkC04+a47Otij3fIE7Ubgd2jatc6BeqLzaw6ab2VtitRBi
	 q3M74q4CmYa1oDH4FWkLejv2u8U5oBXDsc64jLcFWAgNxw+bp8n7gw/GrjFqIEsdDb2m3
	 t7vf4NPBtgeXjJPBLifwhSFqsgTh7o55PUXvADAJAxjx3BzroMhzvnL4HINj2/po6cvVA
	 Qd0Rlt4SjmqNW5AnBH1xJjPTBSso6FlGBmq3X+huv337hed0NUICqK6txOpsao1P44PD9
	 V5ayOPpsc91WFrIe0SbsKdroO7rzrH650V4xxgh7kX5hl1yAOQZKXq1aCuJhH1ZJmTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794194045;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=VUE9fszBcw5f0gncUDA39x4AdiHZ6gQeZTe6Ek+H6bc=;
	b=pqGSaUnfz3L3unRmlPVd8k7Gwh//EkrxU7efkWkBcgJrS0YJ4fLizImigRzoVFhTM4KJ
	 X7iJliVTsrRR+oYr52B0M6QoNOJswrEOhKztxrCCw4I2Bi2UdNXnpHwJpvHPHQDP9A6Li
	 iDiPsKM5Lh6B1RYccwP1q3uyqwujZD95EIb8NR1bMryOHb25E7ez8MR2rvwfGkf3Qvj8M
	 A1yJFnkVHG59gDEp8ImTTO6Vn7lc38bhPfNr7UBQPO5R+4LRxW4oxQY02nDxrIGgl64Ok
	 CtAqhZaeaOaylXsHPAoRYr0rh2mO7U7qgcFUMJBUVpvFVPUb97IyCou6pgkgl+pLt3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ii8UOlHk;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B92D606A320
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 03:14:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B92D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ii8UOlHk
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cd6a7b62ce8so94249a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 19:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794194044; x=1794798844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VUE9fszBcw5f0gncUDA39x4AdiHZ6gQeZTe6Ek+H6bc=;
        b=ii8UOlHkddhZET9fGcc6EWux8CG0Boen0c/1JgTXitY7GW8Ln513czEzaOXjM6+xQ0
         Dm7tLrYYvqGG0+txWXuYUSf5gByma5Ofn6ZofSd9NPP2gpH7OORvXtVeFQnYuHpQvzzW
         84eYLNq2fbvN7zG9PEEezzcEXYq1Yq0+aIZoWtjcCdC0U0hlXvUpJ7UHYd457TjYoS3d
         szlq7VBduD5xyp7gXBbTQ7DTyEvrlCNDlqBBG91NJljY2KfFEraW0AR3KaWa3KfJo27/
         j+fSbn8Z703kg/cMNwwNIB7UQqXI1yE6V4Ip2qZfDCGOMQG3vfv+G3NYDnigmY1WkABI
         iFsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794194044; x=1794798844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VUE9fszBcw5f0gncUDA39x4AdiHZ6gQeZTe6Ek+H6bc=;
        b=zo3lqDBrBFpCygIwVEf9azYn0Pk2JhHkPWFqVtAwckjwznOuKHFjnvjj3674Xgn94a
         30m5RJ5VZPCzGKXmpyX8EUjMvHdnERILefsg8cTNgmtWaILM8+/ZNVSuUEwxYcNBfgeQ
         xsacATWJPQ/uNrCMu0Bxj2CAlvsFLQ4fcreuXs6e30BjERDCSVfjj/nhCOgfuhljo+OW
         PXvoFJ4F3spyE1+suctRGR6EoNRzskHVZwrZ3o15w2AjeoRfdM0PF2Xo7XDRaoOa6upI
         H/f23JQElF+UqVUTaTyJguxEp+hFf+DYnPas56WVgpineJF4Grj0SgAOpZTzhSFeyUnV
         trkA==
X-Gm-Message-State: APuU4Z92XSGO6jAkuEIB9QqDMxLUVlTxXzA1FxV/ZFMeVqjg1rexs0ax
	EtGGtYA+nNAc+EmC/B0yfQEM74osfG8SD7gdQQdbIIUMulcUyIG19Y90
X-Gm-Gg: AYBFou2TbWdU1ZFzBqv+4a0QNcE0DG6Gr0E5jdPy/FPrYeU52tP/Xs3iesvNHVpnINt
	RYXwuFrhHSL8YBJS8AAUb7QyQ5l3VveF0RB8yjNFxZLEAFkJEMkfowfu6Xj3NwSNc5whZueQdRY
	5jZV+Lgokph3GwXS10afUb7gQbkuqzoPYFC7L5Mqg3q9m83jEu9IJHKNWXAfBQcD0KD2EP7u/Za
	LEQiwMm64uyiKOBTh2X+MYiM4JacUzNGmo9GhYSSnKKFyl49N7Qboh6IWlCdw5krlB7qaY4OnxV
	r5AekAto98arL3MXJ6VC3GJx0wVGkYcTPvDA6WftVY4UmHS+TCz1vdFEYEH/9H6gjnMgwhc3dd9
	AVVlpCznCJi01u16AfknQ1Lc5AC6a6HqBWJX2yLtFwyyA0MqGbdYaHfRl9eFgIhzcGc0IZLJggn
	NQG3SycX6SMh2bflW1IghW9F9Qzw/27hZc1dTfGUKvRHvghYEkwPoQCcy4+dT0XpAyjMy1kxr9M
	yzNsRVGEF2H2TvHHr2UyoMnjO4wEO1FGyh3bPXUuUV4rxTBD85CK9T4xM/0ZmutbpgPgLLGcyBt
	3kybvn2P1eubY39ZG43iH4S0R7CV1PLVJ2CLrp54O7oINsNADL0NmSoxMrTNtokxK3xFLkuomZh
	8AFrKwioWkrM=
X-Received: by 2002:a17:90b:380a:b0:3a7:9045:fe29 with SMTP id 98e67ed59e1d1-3b12d0e72eemr3053129a91.4.1794194044360;
        Sun, 08 Nov 2026 19:14:04 -0800 (PST)
Received: from localhost.localdomain ([180.101.244.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b127912d62sm5000590a91.11.2026.11.08.19.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 19:14:04 -0800 (PST)
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
Subject: [PATCH v3] ext4: fix soft lockup while shrinking the extent status cache
Date: Mon,  9 Nov 2026 11:13:56 +0800
Message-ID: <20261109031356.10659-1-frankljpliu@gmail.com>
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

Signed-off-by: Jianping Liu <frankjpliu@tencent.com>
Reviewed-by: Jan Kara <jack@suse.cz>
---
Changes in v3:
- Put change log below diffstat, and add Reviewed-by.

Changes in v2:
- Delete time out logic.
- Change "cond_resched" to "cond_resched_tasks_rcu_qs".
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

