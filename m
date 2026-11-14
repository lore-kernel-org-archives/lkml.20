Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794694549;
	b=C2O4mb3KHTwBrsxl4o/OldvGJn0T0Qn3s+ocDoo9Igb+70+va0y458k+aDlWweS+af/b
	 pl3qBnBzR05wC7KcI7V4fPuCPixCMDg22NSC8641LQx7oA9nng4vJ+qu5vw5Xb7Xd526r
	 /MHzPBcKM53lxbDMZA0+oiqzFsd+KUsrLsekNUH4InhZwMdK1jzKlK3HRRHGmdXU2Aqvw
	 eW8QB0ghPCH9EwkWeOKvEqk2hJASBT0utvcVyNxGnGOP86J+pulMw4fGgLsqANvBW2v21
	 pOjoNu1+5ws5If34I9OL9DGNfSoezuAii1ZXkaVlOqASz84SAvqDKH7HYwX3Xx9j07w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794694549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QqHs6HEOhDu5aRvOORUyDd00kdCJ9afZEREichHXXFs=;
	b=eKJOhI5GoHIF6yLX6cLI79z5WRm+3ezajFKzMpO+2WAPytSYH/9F8WmAg22b1bhMSQcM
	 BubnWMxhXX+CeYxQIdsrZRM+S2I9ddXaYM2lOedbQjwH2YlDDHbkhh0uHHHCIAAo0RNgu
	 wDUb07ei3z9yFaCV10XFe37sm8vHvKQpr+hGdtUZBWZOKHrAiGKGClPXfmNflB7eyD4kZ
	 SOXMIZ1aAICmnnh9SCfJYXeywdXHUTnmxsaGdEKFrkBgCCquaTePbWNeRKVPB90CBV3Hw
	 R906TxsQTlJWafVZdPi8XV+VCuUwTaTUQoEmh5UlOtWst+Sj9Qof7qEhn4sctSwhc0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nq61C60D;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CDA606A88F
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 22:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67CDA606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nq61C60D
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4918c2d727fso1125240f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794694548; x=1795299348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QqHs6HEOhDu5aRvOORUyDd00kdCJ9afZEREichHXXFs=;
        b=Nq61C60D4mAlZNO7ooeTvcHOc/hrz4DLr1qK456QcqOP2E5oy2bN7gRIeRmqfxTlkp
         6WwmlNVrooFnYXmkqAHp5T9laK6sCm1Blqg94QEWVjSCHFjFHzl/uoSuN/ldL137aSNo
         KwxpJC3yffXA91aJIszp64IYhtM3OEphSw/fnd4nOGLV3wjWT9xXUzasjMDOSnfsKZuc
         XE0AohHW5LRLDSRjj6MH3tkWTcL8CJQ9lEUb37p013sxFjkDRnuQwQljyp8L5lMVtrq4
         T/sqL1nzbf8e5Z5DWsyD9flInuhUU/i04ZErlAarvKQ98BHTyS4Tmofw73T5eMGrodT1
         nSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794694548; x=1795299348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QqHs6HEOhDu5aRvOORUyDd00kdCJ9afZEREichHXXFs=;
        b=aFwzOC8S5i2/PCCqm7ayQ78e17hgSAR7zU9GG68wGZsbV4cBq+h/JuPx0JXJXepRVv
         shwc2tpzO0THSmxcEW0zuta7r+ObPofboQlWk4djBZ1TKp3/8KKdzDFA+I2RYNvupO73
         doVSPo/8n5r2rvDCuZzZnV6bugwcZQsQUIC1ogk32PtnJcLgdYjQG7nYiFuiO0EFdNf2
         0Pp/VVQ/GJKGGrV8If5+LaGP+cxD2tlI+nKlI9gxAEGDxO6cCXYiaLQ66XFJ106OiOUE
         uBoCZPHKB2od5A8XVt4RfkPa5s9VHM2yERp5howueL3Wiat+tKJOrVdwCmIGye6P+RC2
         59fw==
X-Forwarded-Encrypted: i=1; AL+hErGBA8YKe1Kt/lNJ3B9Qjpo3A7RV2crsYtLIx9/gWFTp2rHZ4+EZQCLdx+u3mVb+UKQqqnhLyQKGSS1MgsY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/srl75cpYGWBAhBa0Kw8B8RdOqH7hQzHZWGRCU1JROt1WBh1bk
	VqUJSlllU+I2RwWuqNEE/ageMkqi/e/YHP4OUtHirA+uO4W0v2qOHaGhAhkHU1pRDvw=
X-Gm-Gg: AYBFou0Zbvw8bIVmbE9sxQx9yo9fAmFxLyGbQySteld/Y/Z4nq1drYgw7sWPpOB/1eH
	mYBdckhSRk4ORSdVDTsr3ghoqDjE1zx5L0yihysesDVm1YtsahamkRNjFXOi5HIFj+difo/iq3D
	ihx098CSFiBAv6d2HOtC+k6BvR9ZAcj5ux/dIVqHp6ZdBz7gyMGmEd4fBHgnN/+ie64e3PY0Mvb
	rAIpiSlC4+gDN+4dOJ36zUd6xTSu69m/hE/Hjwa07uVToG8AspYpjmYQsspCoaN0IkxEVSkHnwk
	+bWmhGcDG76bqtuLO2sYyHiD/lhM/f9j+Jorijb+nxaBqvlt+ouXPCUuUuGQqNw3tozr5T9liws
	t8XQ1kA+DU00zgTFi7W2ANPsul1fQrtVm7KmJ4xUnzMjhf+8I2e2cr7LmtQBeEUkBV5OmN5Uxkh
	3qYpNWhv7/HUu9wuds9pXilG8r5xILv7vEi6LpbcNspxVcOjp/CgJLkTE3svVrYqsvwLYfEBU7B
	tz1yy/uCYlO4lWAnz9QbQDBcMAHyasli8KrerH8scoBZ60MXKLgpyz6d+uCdpuanAFnXogNNd8V
	wVm1yz16IR7rjo5iG6+OfjTYb5c0F/d5NwPtZXacd3zs
X-Received: by 2002:a5d:59c3:0:b0:48c:72fc:363e with SMTP id ffacd0b85a97d-49c9487049dmr15265032f8f.44.1794694547772;
        Sat, 14 Nov 2026 14:15:47 -0800 (PST)
Received: from kali ([169.224.126.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm13514941f8f.8.2026.11.14.14.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 14:15:47 -0800 (PST)
From: Ali Firas <alishmery18@gmail.com>
To: netdev@vger.kernel.org,
	idosch@nvidia.com
Cc: kuba@kernel.org,
	pabeni@redhat.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	razor@blackwall.org,
	roopa@nvidia.com,
	kuniyu@google.com,
	petrm@nvidia.com,
	aroulin@nvidia.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ali Firas <alishmery18@gmail.com>
Subject: [PATCH net-next v5 5/8] vxlan: leave FDB state and flags unchanged when an update fails
Date: Sun, 15 Nov 2026 01:14:09 +0300
Message-ID: <20261114221412.255825-6-alishmery18@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261114221412.255825-1-alishmery18@gmail.com>
References: <20261114221412.255825-1-alishmery18@gmail.com>
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

vxlan_fdb_update_existing() writes the requested state and flags into
the entry before the steps that can still fail: under NLM_F_REPLACE the
nexthop update and the check that refuses non-unicast entries, under
NLM_F_APPEND the allocation of the new remote, and the switchdev
notification. Each of them returns an error with the new state and
flags left in place, and no RTM_NEWNEIGH is sent for them, so the entry
changes while the request reports failure and nothing tells userspace.
For example, an RTM_NEWNEIGH asking to replace the permanent all-zeros
entry with a dynamic one is refused with -EOPNOTSUPP, yet leaves the
entry dynamic, and the ageing timer then deletes it.

Write the state and flags only after the nexthop update, the non-unicast
check and the allocation of the new remote, so that a request any of
them refuses never changes the entry, not even briefly. The switchdev
notification reports the new state, so it still follows the write; save
both fields on entry and put them back if a switchdev driver vetoes it.
A successful update ends in the same state and sends the same
notification as before. The ageing timer reads the state and flags
without the hash lock (see commit 7308ef8b4a67 ("vxlan: Stop rejecting
dynamic FDB entries with a nexthop ID")), so it can still age out an
entry that a concurrent successful update makes static; that race
predates this patch and is not addressed here.

The patch "vxlan: vnifilter: account the default FDB entry to memcg"
later in this series makes the NLM_F_APPEND allocation fail routinely
at a memory cgroup limit, on the path that changes a vnifilter VNI's
default entry; this is ordered before it so that failure leaves the
entry as it was. Like the rest of the series it targets net-next.

Found in the automated review of v4 of this series; the other error
exits were found by auditing the rest of the function. Each exit was
triggered in QEMU on net-next. The refused replace and the failed
nexthop update need only netlink requests; the failed append was
injected with the kernel's fail-nth fault injection, and the switchdev
veto was triggered with a test-only module that vetoes the notification,
as no switchdev hardware was available. In a production build (4 vCPU,
ageing 1 s), 356,026,806 refused requests in 1200 s, in equal parts
replaces of the permanent all-zeros entry refused with -EOPNOTSUPP,
appends to it failing on an injected -ENOMEM, and nexthop replaces of
another entry refused with -EINVAL, let the ageing timer delete the
all-zeros entry 1,193 times; the test re-added it after each deletion.

Tested in QEMU with the same requests: each exit now leaves the state
and flags as they were, and the loop above deleted the entry 0 times in
341,241,414 requests. test_vxlan_vnifiltering.sh, which gains a case
for the refused replace later in this series, passes with and without
KASAN and lockdep, and fib_nexthops.sh passes.

Fixes: 6681712d67ee ("vxlan: generalize forwarding tables")
Fixes: 906dc186e020 ("vxlan fdb replace an existing entry")
Fixes: 61f46fe8c646 ("vxlan: Allow vetoing of FDB notifications")
Fixes: 1274e1cc4226 ("vxlan: ecmp support for mac fdb entries")
Signed-off-by: Ali Firas <alishmery18@gmail.com>
---
v5: new patch (review of v4 6/7); says how the gap was found and what it
did in QEMU (sinfo bot); writes the state and flags after the steps that
can fail instead of writing and then reverting them, so a request those
steps refuse never changes them, not even briefly; a switchdev veto
still writes them and puts them back (local review and KCSAN runs).

 drivers/net/vxlan/vxlan_core.c | 40 ++++++++++++++++++++--------------
 1 file changed, 24 insertions(+), 16 deletions(-)

diff --git a/drivers/net/vxlan/vxlan_core.c b/drivers/net/vxlan/vxlan_core.c
index d11028b37472..2303d652d396 100644
--- a/drivers/net/vxlan/vxlan_core.c
+++ b/drivers/net/vxlan/vxlan_core.c
@@ -987,6 +987,8 @@ static int vxlan_fdb_update_existing(struct vxlan_dev *vxlan,
 				     struct netlink_ext_ack *extack)
 {
 	__u16 fdb_flags = (ndm_flags & ~NTF_USE);
+	__u16 old_flags = f->flags;
+	__u16 old_state = f->state;
 	struct vxlan_rdst *rd = NULL;
 	struct vxlan_rdst oldrd;
 	int notify = 0;
@@ -1005,21 +1007,6 @@ static int vxlan_fdb_update_existing(struct vxlan_dev *vxlan,
 		return -EOPNOTSUPP;
 	}
 
-	/* Do not allow an externally learned entry to take over an entry added
-	 * by the user.
-	 */
-	if (!(fdb_flags & NTF_EXT_LEARNED) ||
-	    !(f->flags & NTF_VXLAN_ADDED_BY_USER)) {
-		if (f->state != state) {
-			f->state = state;
-			notify = 1;
-		}
-		if (f->flags != fdb_flags) {
-			f->flags = fdb_flags;
-			notify = 1;
-		}
-	}
-
 	if ((flags & NLM_F_REPLACE)) {
 		/* Only change unicasts */
 		if (!(is_multicast_ether_addr(f->key.eth_addr) ||
@@ -1048,6 +1035,23 @@ static int vxlan_fdb_update_existing(struct vxlan_dev *vxlan,
 		notify |= rc;
 	}
 
+	/* Do not allow an externally learned entry to take over an entry added
+	 * by the user. The state and flags are written only after the steps
+	 * above that can fail, so that a request they refuse never changes
+	 * them, not even briefly: the ageing timer reads them without the lock.
+	 */
+	if (!(fdb_flags & NTF_EXT_LEARNED) ||
+	    !(f->flags & NTF_VXLAN_ADDED_BY_USER)) {
+		if (f->state != state) {
+			f->state = state;
+			notify = 1;
+		}
+		if (f->flags != fdb_flags) {
+			f->flags = fdb_flags;
+			notify = 1;
+		}
+	}
+
 	if (ndm_flags & NTF_USE)
 		WRITE_ONCE(f->updated, jiffies);
 
@@ -1066,13 +1070,17 @@ static int vxlan_fdb_update_existing(struct vxlan_dev *vxlan,
 
 err_notify:
 	if (nhid)
-		return err;
+		goto err_restore;
 	if ((flags & NLM_F_REPLACE) && rc)
 		*rd = oldrd;
 	else if ((flags & NLM_F_APPEND) && rc) {
 		list_del_rcu(&rd->list);
 		call_rcu(&rd->rcu, vxlan_dst_free);
 	}
+err_restore:
+	/* The notification was vetoed: put back the state and flags. */
+	f->state = old_state;
+	f->flags = old_flags;
 	return err;
 }
 
-- 
2.53.0

