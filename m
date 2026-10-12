Received: from mail-oi2-f6.google.com (mail-oi2-f6.google.com [74.125.231.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7BA330B3F
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819252; cv=none; b=L70WTblh5Ix3K9+GjgR/MyVI6GbYLlXuHcIR7aWd4Jx6pQewUvmF5A0SpsN+O7AL7KZSWNcZeklbw31AI+3YODmKZrQFO687P/zT8E/mpGvX5+yvnBQff5+XlhXkZQTC7CJFEFzefEEGkHvlWPDz6kJmbbm4bRZtSOlmud4hoT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819252; c=relaxed/simple;
	bh=nAu3ZVRMYQC2AoGQ3nSWEl3h3H5j+54En4gscuWuZbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pyBacZYIKF6+niTVLZFbo4vRJJUFmBxU/+2taE0H3yjhRhGSjM4a9DFJ3kbYCGoZS+EnYelV98AMlSZACApsvJ7NrmhWcJMvKJAwSlBZH1b4F8dxq+1tgdb5isQiGaLtE2/rZgjWMN0vMNoy10tM+GPYdicFSZz8LM63qSvt8a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QNOthILa; arc=none smtp.client-ip=74.125.231.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QNOthILa"
Received: by mail-oi2-f6.google.com with SMTP id 5614622812f47-4b374c2cf2cso236868b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791819249; x=1792424049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lSBqC/hD/Ly2AYbmjcrAztV3m8h2DttoWUWYtWCfyss=;
        b=QNOthILauayXohnPwGj5vbx67/Czhn2tTG5Qwd88GtRQOH6gtySETKpkttIk8oNexd
         /q2+dJczkhoi0RQOMogYdFDlywj1XRgZsCnvTQfiNvJRNzMqffmpQjrqXK+ZSrWJHwKU
         JlWtke0rjjXle4hOMwXdqIrs5tampqltkFKMwEJBxcx3U1ioO1NdNFO6B7dhRChBtQdu
         cXMjbijnik7E2ssiWdF+hIEaKGuVlhQ0Tl8g/1quMEVYbxNHmrVE48rcIwsowGm9I5Zg
         Moh5f+KYlntmVPDpnS3crm5RDS7SNLZf8c2liVraquQDxda0Bbqk/m8h8Cs4boWiBbqu
         FIYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791819249; x=1792424049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lSBqC/hD/Ly2AYbmjcrAztV3m8h2DttoWUWYtWCfyss=;
        b=1U/bS7bt/GWl2nPPDoUqbY099rnYvSz3YhZipxiNFUjTUzfOQVfWtEZ1P24EyuipL/
         nDhZrbkid20WVcKicT+fJkM85a0yPB6cLLzexyV5AN9aydZSR/KaiF2ps6dOS8UvLJLF
         H8r5fngRdXXaBB98t5FD7uxtC40Q8arePKEOMgr//c/ooVMCp7fv6G5s+l8aP+or4kiw
         8fzag/5N+wQ3Rzgtu0DP4Zq076etLYnjR9XKQWLB55tdKyGo/UT8m4HIIC8jHCplTGCB
         UMhj9TUQm1zv0nMjWahGW9S/Jqq2rI53KgWbWAHjsuWHpTESIuMTctVlc4RDVRI36hf3
         w5qA==
X-Forwarded-Encrypted: i=1; AKwUvBxwL6BsvQgS9Tp+uBZBa+RyaHBAqYX83DlsssfnD5+Xp91LmsQ1dBq1W+vGx7yhKEpdiMjOr1+Kugk0y7w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqyZr53MDz5aszKAOS8HLmpSILI990DgVCzenE1Gz6bTfIyen8
	nh/1ImNBMa/K6NRsKBXks+LmlUB3qswNQqP86TtVEtyWe5rf8qJHf5W/
X-Gm-Gg: AYBFou0yAPFD09Yg37uxfijDPx/MMc16kJNUKCOnYQoO4czyr9AVJ9WgX8Cr6gavWqA
	tu914CdCG+Gmkj1LpyBKjmi07MGNIe+omJJy/vz2eT+aYjst/4I24mt/apQqST1amH2soujDQro
	ZfmpbiHYB3OLPnQSo3vztfoHhkAnNIXfAkbMOZ6sDiu3tVIe0wg2QxRnGrLkKThx+BKHHYta6XA
	cHZeydakNy7cWT4oOOheLPoc2qLdz6qz9oUa04s1t3FK8Et+eOAs7D6HQdYSKM7Ezs6uOZRgukl
	0tNDi0kdAC4gJnePaRRkYTpaYrXnPTTi8Rrv5Z1GNsjAP1YP4lvQCom4mdWsbUwVoFW67VzACwD
	jAFAhsIUy3XEo6u9R285802+gJiRF0eqRmmTypjfGmZ7lZ0k74ti9aCztgTv36/cX6KHwosEcgT
	bE7Tzjw7SHcpmXAl0clp6hB7JJ28aE4T5tOjbfVCSxTH5C97RhWAW9FQVLimg61HvTwAJj5R32W
	rZ36pnHrU9VdATy4CFZF/LzpDmkcc5QkBnA
X-Received: by 2002:a05:6808:138e:b0:4fb:ac9b:b076 with SMTP id 5614622812f47-50c5b473884mr8343784b6e.67.1791819249230;
        Mon, 12 Oct 2026 08:34:09 -0700 (PDT)
Received: from localhost.localdomain ([14.22.11.163])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a2a85edf81sm9920375fac.15.2026.10.12.08.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 08:34:08 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: Tung Quang Nguyen <tung.quang.nguyen@est.tech>,
	Jon Maloy <jmaloy@redhat.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Ying Xue <ying.xue@windriver.com>
Cc: netdev@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net v2] tipc: fix broadcast sender hang on last acker departure
Date: Mon, 12 Oct 2026 23:33:57 +0800
Message-ID: <20261012153357.1863316-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <AM7P189MB113731FB3655F88C6079EF1CC69F2@AM7P189MB1137.EURP189.PROD.OUTLOOK.COM>
References: <AM7P189MB113731FB3655F88C6079EF1CC69F2@AM7P189MB1137.EURP189.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TIPC group broadcast senders are blocked while a replicast still has
outstanding member acks: poll(EPOLLOUT) only fires when
tsk->group_is_open, and writers keep re-sleeping on every unrelated
data-ready wakeup because tipc_group_bc_cong() keeps seeing
*grp->open == false (the default sk_sndtimeo is MAX_SCHEDULE_TIMEOUT,
so there is no bounded send timeout either).

When the last outstanding acker departs before acking,
tipc_group_delete_member() decrements grp->bc_ackers but never
restores *grp->open, and the blocked senders are never woken.
Commit 99cc2a62e07a ("tipc: reject invalid and unexpected
GRP_ACK_MSG to prevent bc_ackers underflow") already calls this out
in its changelog as a pre-existing issue.

Reproduced on a two-node TIPC group cluster (v7.3-rc5, two QEMU
guests over a UDP bearer): with one member's ack outstanding and
that member then departing, poll(POLLOUT) on the sender never
fired and a blocking sendmsg() never returned; with the fix
applied both are released when the leave event is delivered (log
below the fold).

Restore the open state exactly on the 1->0 transition in the delete
path, mirroring the GRP_ACK_MSG completion path, and invoke
sk->sk_write_space() from tipc_sk_filter_rcv() when the group just
became writable again.

While at it, make the accounting precise: the delete path used to
test less(m->bc_acked, grp->bc_snd_nxt - 1), which also matches
members that were never counted for the current replicast
(JOINING/LEAVING members keep a stale bc_acked).  Zeroing
bc_ackers on such a member could silently void a still-outstanding
ack from a real acker.  Track whether a member owes an ack for the
current replicast in a new per-member bc_pending flag, set when the
member is counted and cleared when its ack arrives, and test that
in the delete path instead.  Suggested by Tung Quang Nguyen.

This issue was discovered by Tencent CodeBuddy Security.

Cc: stable@vger.kernel.org
Fixes: 2f487712b893 ("tipc: guarantee that group broadcast doesn't bypass group unicast")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---

v2: Subject no longer claims a leak; describe the actual wakeup
    mechanics and add the reproduction; the delete path now
    discriminates members that were actually counted for the
    current replicast via a new per-member bc_pending flag instead
    of comparing a possibly stale bc_acked (Tung Quang Nguyen).

Reproduction (two QEMU guests, TIPC over UDP bearer; the acking
peer withheld GRP_ACK_MSG via a test-only knob to emulate the
lossy peer, the sender's kernel ran unmodified TIPC):

    UNPATCHED (#88/#90, fix absent):
      sender:  NO POLLOUT for 30s after member departed -> STALL
      sender2: R2 NEVER returned in 32s (blocked writer not woken)
    PATCHED (#89, this patch):
      sender:  POLLOUT at t=18.5s, when the leave event was delivered
      sender2: R2 returned at t=18.6s, EHOSTUNREACH on now-empty group

 net/tipc/group.c  | 13 ++++++++++---
 net/tipc/socket.c | 12 +++++++++++-
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/net/tipc/group.c b/net/tipc/group.c
index 74f6d3dac0784..e9c77f12c9819 100644
--- a/net/tipc/group.c
+++ b/net/tipc/group.c
@@ -75,6 +75,7 @@ struct tipc_member {
 	u16 bc_rcv_nxt;
 	u16 bc_syncpt;
 	u16 bc_acked;
+	bool bc_pending;
 };
 
 struct tipc_group {
@@ -340,9 +341,12 @@ static void tipc_group_delete_member(struct tipc_group *grp,
 	rb_erase(&m->tree_node, &grp->members);
 	grp->member_cnt--;
 
-	/* Check if we were waiting for replicast ack from this member */
-	if (grp->bc_ackers && less(m->bc_acked, grp->bc_snd_nxt - 1))
-		grp->bc_ackers--;
+	/* If this member owed an ack for the current replicast and it
+	 * was the last one, restore the open state so blocked broadcast
+	 * senders can proceed.
+	 */
+	if (grp->bc_ackers && m->bc_pending && !--grp->bc_ackers)
+		*grp->open = true;
 
 	list_del_init(&m->list);
 	list_del_init(&m->small_win);
@@ -406,6 +410,8 @@ void tipc_group_update_bc_members(struct tipc_group *grp, int len, bool ack)
 			m->bc_acked = prev;
 			ackers++;
 		}
+		if (ack)
+			m->bc_pending = tipc_group_is_receiver(m);
 	}
 
 	/* Mark number of acknowledges to expect, if any */
@@ -803,6 +809,7 @@ void tipc_group_proto_rcv(struct tipc_group *grp, bool *usr_wakeup,
 		if (acked != grp->bc_snd_nxt || m->bc_acked == acked)
 			return;
 		m->bc_acked = acked;
+		m->bc_pending = false;
 		if (--grp->bc_ackers)
 			return;
 		list_del_init(&m->small_win);
diff --git a/net/tipc/socket.c b/net/tipc/socket.c
index d5d70eb230b56..65cc0c4964b31 100644
--- a/net/tipc/socket.c
+++ b/net/tipc/socket.c
@@ -2356,8 +2356,18 @@ static void tipc_sk_filter_rcv(struct sock *sk, struct sk_buff *skb,
 	if (unlikely(!msg_isdata(hdr)))
 		tipc_sk_proto_rcv(sk, &inputq, xmitq);
 
-	if (unlikely(grp))
+	if (unlikely(grp)) {
+		bool was_open = tsk->group_is_open;
+
 		tipc_group_filter_msg(grp, &inputq, xmitq);
+		/* A departing member may have held the last outstanding
+		 * replicast ack, which can restore the open state inside
+		 * tipc_group_filter_msg(); wake up senders blocked in
+		 * poll()/write() if the group just became writable.
+		 */
+		if (!was_open && tsk->group_is_open)
+			sk->sk_write_space(sk);
+	}
 
 	if (unlikely(!grp) && mtyp == TIPC_MCAST_MSG)
 		tipc_mcast_filter_msg(net, &tsk->mc_method.deferredq, &inputq);
-- 
2.43.7
