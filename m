Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793935910;
	b=tLReah9TTsy5hoXkmwxlZ+9ENBB6u5++eIYuS0nAaHdmpJ0JWp//SZZEV6rl9j09vmJC
	 qu80Chc6exD++DAoUTsy2eJmK0ELDHm6xxs7TQ+S/KD5gEKFU0xkZPw3Xna9NcEbW+vly
	 8wO+rH+FOLOOwsxv4FDeWz74HFUfQVA7uX/uz0KIjXEA7Cv0gGuKwdOEhRiIKdgWNKcdw
	 7ZEr1YkS24vIHSwhvYc5Egme3qNzPDB44UzjdcnFerCuiK7KDnn+z6M4P13ly3XHGm8oS
	 cEoYR4FY1hSx7oRDsUDE64KkrDzBkJZSrmPvahErGRoZqWOGe1CUWT9HcBUkXJDm2Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793935910;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ac+FbFNWk1nqhg8Ij/ZKtiTVGqbMyhCel/9hHECenKU=;
	b=41bVBoLjntNEn8lA2wFxqOAkbt0T24NBkSloC4I+r3LJZGWIOAvbem3gbiJo+6n03xZ6
	 +vRoLC+mzFgGH9SwJ5UTo2vi2lmOvdmD5D7i63DsXw0mtlEk+nVn6fTg9xsqNFPx2Bhlo
	 k1NoHCJU9Vduf4siEcR3YfRqc/D4EmMZYPoKFnowTJfT45F5pRW8dJbMnbMQxTxasgToW
	 9cflE9BiJQFm5ycrB65f1ZoanOWv/x1HztFT8DAwfxRN6tcz8N1sSpqoXfax2fNQYQDn/
	 REatvQ+LL0URCoaM6PaJu/Zsuet9yLI2RCIQaZ04OifkDG9P/nj3aMqZYbzR2eoflJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FMsvOSDz;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BD3606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 03:31:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14BD3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FMsvOSDz
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so135475a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 19:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793935908; x=1794540708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ac+FbFNWk1nqhg8Ij/ZKtiTVGqbMyhCel/9hHECenKU=;
        b=FMsvOSDzwM2v7+5eDgZB9sDPglRg4HR5NrFAPKms9VvxZn+H2InHvKUOP0fcot4vKH
         PB0+F6nej3ehuhv5g+Tb/Dm8tfx26r2Sl1rR5Og12UI4K1zji0KEvbmC7KOhJtc2VN1g
         gd8BuOqcEeeLhit/JNx0dNfB1INAlZvpm14SE+PZ6juGL/QNQwl/hp3VUMtlcoeRWU8l
         3TsTuvINl6yG2crjyKJW/m6Tu7KAgG5AymPqwkp6PMu19FaNOPfSn1T7Enh7yuadCHda
         pBw9cEkPSRPPQPGTiDmp0uPOckAxW7wBJxlPa8uDKBMznTqHS1Z9sh6Hxs7sPTFdWYZm
         LHnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793935908; x=1794540708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ac+FbFNWk1nqhg8Ij/ZKtiTVGqbMyhCel/9hHECenKU=;
        b=zZAP2zFMbUax1xj7QcaAW0dm/MNyA6Ea1ZFfNZakd/gKSbI013MY+XgMpv5TUSG4Y7
         fJ1Nld+bH4mGARN6uTw0SnP5j8zKSeon5nUwUZxOJ249Em4qyAS0drXKn1mAC/sVgxg3
         bQCwaOx51m5OjfuvNk5l5x3st5zx+5E/wvuYN1QuVztWbc1j4pozKOG1WAPMbTvHDFHI
         Mc7PAcnfdRYJPiM4b0JQTnppedZS+XcwAlb6yRN4E5YppvZ9GqpL690cGfIoHa+zC5a4
         aCk5DEoB6FAR9pgp89XD6sVndYhGIEzoes9KUb34320uM0ygwRhnV3fbMILnE4Hsd8PI
         TPBQ==
X-Gm-Message-State: APuU4Z+ctfaLQFqm6GoRsrivj2gPyOmDZ3wHFZxI4SAJ4Hd/56T30DuP
	bzYY9aUwJbiHlIPSOtO2uDfVGjOW78811nukC8TOyDB35G8hKJm69TC2
X-Gm-Gg: AYBFou2rO35FivMhfV03W2NtNSLP/R5Yh30TY+CcJeIDMFyMsFiN3klAiwqcTZHuzqD
	r0kWVUcb+o6AAy09tzjDb+f4Zbgw7iPx+CICDhDQUu2N36nhpfQ0+ohQ6q5U7Ah52fFVLpxiTp1
	2PjSsKmFb/f+6KI6N/DVce5geqr7XPaqdaes0Y9kfIGX4n59JUjfAFaTGCdYEQykKLjYQqJ0Y19
	0PJeEAeXoLWMJx7oWiqpCrTA1ydTLVVkdECrHuR3P/YceLG+7aZuq42VXE254DFi4YfLRSJzDuy
	t2ypmEadHTPPqhNHo79OahCmvAiH9TKWzHparKtYsTmviAO+Gova2uWcbTeOkRkUItDGhDQu5dM
	YKhUU9DkExw59nkGCQ3w1Inu2PaccRlDtxPEXBy3R4bAMRFdCAfV0bPUjnVROEa0YFqGosFWfV5
	f99Kzvjn81ZYcJGrVyEsoDF9IRmB1Vjh+hzqWJ66RWxKnm8f0sQcdZOcQCAdJV7omGqvysKR1z3
	fGygl5KHj3/KgmkV8hN09torCsi9yD21C2awuSTkDONxisSH5hlj4sR5EuMkM1goS5t6KN0MT9a
	QSw6AIO0f68fyJco9Qhw6QIK1g3VKWK6TPo6Oe9+teBXKlZmugq3hzZRCuaaROTd
X-Received: by 2002:a17:90b:3804:b0:3ad:b7d1:8631 with SMTP id 98e67ed59e1d1-3b0db6bb484mr1239958a91.17.1793935908218;
        Thu, 05 Nov 2026 19:31:48 -0800 (PST)
Received: from localhost.localdomain ([14.22.11.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323cd3csm5899802a91.3.2026.11.05.19.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 19:31:47 -0800 (PST)
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
Date: Fri,  6 Nov 2026 11:31:41 +0800
Message-ID: <20261106033141.1509656-1-frankljpliu@gmail.com>
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

---
Changes from v1:
- Delete time out logic.
- Change "cond_resched" to "cond_resched_tasks_rcu_qs".
---
====================

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

