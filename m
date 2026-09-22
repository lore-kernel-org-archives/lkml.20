Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D3A4E36F7
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790061028; cv=none; b=t7qb7Cz8rt359PCqRsEuBSvbJu1N4sKSGY5IGucjU/f2UupL3iQzsb6MsZZyZUvBg+9QBgUF6AxePnLrYQkZxQyxjDzng7gQlrE5XdTSHTSyb9GPnW0NDeLUWrhfuShlPlY9xd08PstYhOw4eB1k2EeDN4j1XTDEFsYjoVVR/zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790061028; c=relaxed/simple;
	bh=Z5Gkdx2wsDeiiFNXcQT9qA1i2avBskmfCcp53LcmQc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nAjzTGCXcanXfWz+0cyzod4656DrLbRXSUokG7OfPsa64rMUrE/3yfZiGXMRAWEZLe0v/NSQIQrrnGRo3YufSRSRhTNz1Gt1qxHCUDENexOfB4D9HK2DrhLk1osfdSrr3JOdJAeR1xr5xi86J0A++Fy4LMWpYTFlqn+CqMfbYA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NzzOmESi; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NzzOmESi"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb751so3214618a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 00:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790061025; x=1790665825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AVuEObhXGSApyrXTtBablhdwNNS63ZjQVW0XfLpFgyY=;
        b=NzzOmESibYOv9tLC6NXFE5gdg3UrV7JUTRLp3KLr8c8SwcQgV134oeeMAxgxvbD+hy
         0B+aiuba3bFt28hAZN22Z+B17Jp5rUyNv1ISpw/OnhLWZPEQKedMgHMvOM2Nvi8bGexX
         cO2mDzs42bkpFX95Ymvnw3zAhlDGTL03ac9xAbVwNt+ZjkaC+Wm9C0bxeAFdye0grSp6
         SZdTz26ox6rZw+SJK2uB8kItsTKMCYy1GOT/4lw1sGyOdLw+WzytPAjmpUxsSTbvvrmO
         giC2/QzZDnv50XuR9riLxvyOpDVwQo5s2laaLFEVL7valJZHRZofs/SLUq5q2fZkCzCD
         PHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790061025; x=1790665825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AVuEObhXGSApyrXTtBablhdwNNS63ZjQVW0XfLpFgyY=;
        b=deHov/RRPBve3R+/JHfjJrVh/bpwBHofjw/riNJ8SuF66Rwfxr8VlawEi0fhrOkn12
         fLjz6/JjWxO87ysTxB4Bx6W5giotMFZiRhmIrzlplhfdSE3zMVMDxblMS5o6ln3o5ckb
         /Z6yswG4RPPcYNXsU3zCJ7ypVolpIi5wUQAm87javPZdZD68Wgzrx0TbzX5wGYqwPbEP
         2BlHK7ddjSfQwKUY69ZNxUT+07hiz4s62ugOI8zi8B19OoUKx+VP6WLYzsTmllRF1wJk
         VILcRxgfmdc0EVJUn/bscRFITE2i5zJL/F8SKw2BU29Hry6MU4Dj8bqeN9x8igf6iO5E
         PsuA==
X-Forwarded-Encrypted: i=1; AKwUvByJKy/UuD8o0JPCNBv6Ea3+QJ+duswOq5XnwP1LS/7LcJyZndeapUnaH8jAqsbIO3d5I6dNB9zqZgmFTKI=@vger.kernel.org
X-Gm-Message-State: AFuF++mNFZ+CXo1IWIbcn2JnXE7FVDVxtEkwbz7+7C9Jl9Swpmh6+38D
	0FZIWJXRRiB96vxQp3B8asNuOmqaIlbXep33D1siypobWzR6d831vPse
X-Gm-Gg: AYBFou1ByuS5Cm/Mtg4Kz6T2cA8UPK2yPp4TOxan9xrihTu2EllYWG4CDCd/3EvlyhB
	IN7E4YWPIybX6/SHNODKJfeGP9FtgYp60wNgtmGbdzunYsBRRKGIzJpLAokAscu6MCBOGp8g+JB
	CyvYBQllvy7ahR9C7f9GJBqk2ReqsQTvgAqQbo0P3f9e4rijjMwuMnQ7Pcgv4JbRwIbXFVrrnn0
	37hCoWy2xKR1Vq2lUTEntKbXH8syoiiV1ADwMbaVqMaZ7Vbi6/kc8AHsL80/NpKmD97PAwSx6sD
	ElEatULQ/b0lNh1mS8f0J8f2OY2r67fhtjeDRBSRTUNpLG53sUbn3WPejy1mWprR5JEwiR2JTzP
	lpNscpC2qcXHlJLNC4j4pMQ5sxuQyN2J+j2m/12x8i71CB+pc2rGjkq3KB54gdTLcqmaXfoQvrf
	aVSUCZejFDsjhdxtRV7OL5sXuDIAQt9rhb3N91Ulq6Yzg3drmklwXnqrjN9yvNeCTIw5kXB1y/W
	uf8QXRqr67Nga7mSw==
X-Received: by 2002:a17:90b:4d8f:b0:39e:6a7f:eef1 with SMTP id 98e67ed59e1d1-3a0731ef87bmr231688a91.22.1790061025401;
        Tue, 22 Sep 2026 00:10:25 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.42])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a067409854sm3079414a91.7.2026.09.22.00.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 00:10:24 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	peterz@infradead.org,
	boqun@kernel.org,
	npiggin@gmail.com,
	dhowells@redhat.com,
	j.alglave@ucl.ac.uk,
	luc.maranget@inria.fr,
	paulmck@kernel.org,
	corbet@lwn.net,
	mingo@redhat.com,
	dave@stgolabs.net,
	josh@joshtriplett.org,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	urezki@gmail.com
Cc: akiyks@gmail.com,
	dlustig@nvidia.com,
	joelagnelf@nvidia.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	longman@redhat.com,
	rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	include@grrlz.net,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	lianux.mm@gmail.com
Subject: [RFC/WIP PATCH 2/4] locking/lockdep: use hazptr to wait for dynamic key lookups
Date: Tue, 22 Sep 2026 15:09:48 +0800
Message-ID: <20260922070950.4173245-3-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922070950.4173245-1-kunwu.chan@gmail.com>
References: <20260922070950.4173245-1-kunwu.chan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

lockdep_unregister_key() waits for is_dynamic_key() callers with
synchronize_rcu_expedited(), which sends IPIs to every online CPU.
Have is_dynamic_key() mark the hash bucket with a hazard pointer
and use hazptr_synchronize() to wait specifically for those
traversals.

The hash bucket address from keyhashentry() is stable, making it a
suitable hazptr synchronize target.  The rest of the key hashlist
lifetime (hlist_del_rcu/call_rcu) remains RCU-based.

This adapts the lockdep use case from Boqun Feng's hazard-pointer
series to the current hazptr API.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/locking/lockdep.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index c56a7f91d72e..f67d847f9abf 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -58,6 +58,7 @@
 #include <linux/context_tracking.h>
 #include <linux/console.h>
 #include <linux/kasan.h>
+#include <linux/hazptr.h>
 
 #include <asm/sections.h>
 
@@ -1280,14 +1281,24 @@ static bool is_dynamic_key(const struct lock_class_key *key)
 
 	hash_head = keyhashentry(key);
 
-	rcu_read_lock();
-	hlist_for_each_entry_rcu(k, hash_head, hash_entry) {
-		if (k == key) {
-			found = true;
-			break;
+	/*
+	 * The traversal is protected by a hazard pointer rather
+	 * than an RCU read-side critical section.
+	 */
+	{
+		struct hazptr_ctx ctx;
+		void *bucket = hash_head;
+		void *addr;
+
+		addr = hazptr_acquire(&ctx, &bucket);
+		hlist_for_each_entry_rcu(k, hash_head, hash_entry, 1) {
+			if (k == key) {
+				found = true;
+				break;
+			}
 		}
+		hazptr_release(&ctx, addr);
 	}
-	rcu_read_unlock();
 
 	return found;
 }
@@ -6683,11 +6694,10 @@ void lockdep_unregister_key(struct lock_class_key *key)
 	 *
 	 * Some operations like __qdisc_destroy() will call this in a debug
 	 * kernel, and the network traffic is disabled while waiting, hence
-	 * the delay of the wait matters in debugging cases. Currently use a
-	 * synchronize_rcu_expedited() to speed up the wait at the cost of
-	 * system IPIs. TODO: Replace RCU with hazptr for this.
+	 * the delay of the wait matters in debugging cases. Replace the
+	 * expedited RCU wait with hazptr_synchronize().
 	 */
-	synchronize_rcu_expedited();
+	hazptr_synchronize(keyhashentry(key));
 }
 EXPORT_SYMBOL_GPL(lockdep_unregister_key);
 
-- 
2.43.0

