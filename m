Received: from mail-dy2-f18.google.com (mail-dy2-f18.google.com [74.125.229.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0FE3C873B
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 18:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790879378; cv=none; b=R6so4XtQnPoh2u1BbOD7ojwz4ZrzL/lVs0u/Aowrb4L/S9L974F4l5BpUV/ko2GD12ypPlgMP4Hvz6U3ed72WO98DgR8G8iRKMKJ4ucBkonr1u2X4BINeI9GiOyxc8VBVWWkHSdjlHXF4NoqyoH2DhGHzGq2MA1WaSqr+DdndpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790879378; c=relaxed/simple;
	bh=i39JXqmYvD+XNNv0Kh8aPCXHi6VrE/TIaE02ID95wWA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=boc8t+P8ae6xyo6D8kgW2FnLKlXYwl3DWm/65s8PDrJiubHOpjMwcOSUsKmxcaqgeDsfTvQMiVave+x/ihlhxSufDBasXiVc81NQAX1GXbhAr8yMwqgg85UaGawU4edml7LOr70cwXjZJgMlOZpLvoKtVelUwnCKstx/nLt+yAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YeNBTDpF; arc=none smtp.client-ip=74.125.229.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YeNBTDpF"
Received: by mail-dy2-f18.google.com with SMTP id 5a478bee46e88-34ef63eda66so40575eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 11:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790879376; x=1791484176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lyCdVKYeqbUD2FjDh2ZaOn3IuqAWBAvX9Y8VJFP48H8=;
        b=YeNBTDpFoHjZBpskPgjztw0WomC6uAqInB3e6tzoeUcBshBtrjz9tygbja4KF5iR/B
         lFsuqjFkDTkR3vTARBkLb0mzG8gc3xfgHsNkyms04GKByQUIOR0nJjPSLb4DIsZViq4X
         TB95aGFv0DP5iVl3xqAeWe/yB/CyLXtGHL7XdaI5/0d2/zUdpzv9qaVKacPSoEc/2rzA
         WEd0wJPqnQcXEagF4Hx/68caO1ePicicTg8jvuWcNfGjQfDX0ro0rRFMi+U3WZd1vL6j
         jBv/8935ROe5BIK8LyzVvEfOFgoiqlJ3q+LdiRS4J9PLOZmMKf5FKobL9CZ/qAEmd4rp
         0C+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790879376; x=1791484176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lyCdVKYeqbUD2FjDh2ZaOn3IuqAWBAvX9Y8VJFP48H8=;
        b=sh+lDJWBpgjy+U4ZDrk1O4tQMJDS7C+VbBWZOuEbHKdETdBRm8XkytWIkQm14hyJ7O
         sEvlbx10TANk01h5JZS18MUVfiUU1iBlkq1Sc52tg13fVp5vj0SjGBUHPu+7hYl+JKkL
         8/LkbtMlNXLtGrHNpwok7eZ9AybDc3S+PNHpKoM+rwwbtdQSlDFkAAbC9sVtJzXMOl6F
         NUDlAMzJ2xM5M7+bMk0RLNQSQD7b3UflOvcnb56i0ocnbGLrbD/AyerZCUD54H/DD7/F
         gQ2Z9AYDurb4nLkDiWFwyy1mABIGsdGy17s2Zx13porqh3gFUTK0dAHuYldVRGN6Y6Bm
         qgWw==
X-Forwarded-Encrypted: i=1; AKwUvBxli+eL2WoYZJEy7C4fla3P9rJQyY7Of/jdTl7DEnn0jmq9Q/toY+NQdqvYBQmyovmflAoopIwb/5U0IBM=@vger.kernel.org
X-Gm-Message-State: AFuF++mYAy7aQ2nS73ZouYfG7sp2YGf8UTPmfG7qIygTL2ujHNzG3qcC
	4dm9kGXr2bhvtLC1HU8VGeoFIZn52RTugogDEtzKYJzxI81Vj/Cf8KOaADPCOcWc4ynBbQ==
X-Gm-Gg: AYBFou27dtj+ISl50sPOdijc1MS8ELLeBlglLyHPCuKl5A8VNoizaWwumDDFUbv43Fx
	XsjtuKukAl0lBiUXv1aY5E6E4W51uF1xlazjQ/Ek0KE7l2cVXSZ5bFJTmvfJ066Hp1aNfgi5z7b
	HuAIzkkOkpmyhtwYyzEYOlKA6JYQENaQcS4d1Y9UYhKyVZCxZlysjmYjZdDR3Cg16ljV4PnLBwP
	96eW87NXd4Mn5rAfb4Hid1MMnPJxg2p2kLBe3a9AH9Px4OFSaTWspLmVeGlBYIyjfOd/+OI3qtz
	mLit7lJd2yP3CoFyGyAb06nLr3EwK1el/TwdDk+Uoj++bMfhPr+mkr3QpBg8o+ROpteGKpa1c2V
	x6E7+Dn0Z2wmG85Fn3/v7nsaZzDlPNDXLIkaQ9I952FiSJYzd+sJ6g7t4I77Cguau0dmj8C+sgO
	p2eh7PoOz88UdsIjmJbYB+c/HmwUhfUdZ8R3ZKwFfTI6cqv/lo2FOJ665+ygqL2BgGXXDl2BEVQ
	Gh2qyx5WkVpPcg1D2Wb3KaiBT6f9s7jsMs0A6glrR61rQq+tJ+w44z7vmJbdHp/jiGCbg==
X-Received: by 2002:a05:693c:8858:b0:33e:8552:6e06 with SMTP id 5a478bee46e88-34f06674f4fmr266687eec.0.1790879375908;
        Thu, 01 Oct 2026 11:29:35 -0700 (PDT)
Received: from localhost.localdomain (95.169.12.199.16clouds.com. [95.169.12.199])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f43eba13bsm390711c88.2.2026.10.01.11.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 11:29:35 -0700 (PDT)
From: Chengfeng Ye <nicoyip.dev@gmail.com>
To: Jon Maloy <jmaloy@redhat.com>,
	Tung Quang Nguyen <tung.quang.nguyen@est.tech>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chengfeng Ye <nicoyip.dev@gmail.com>
Subject: [PATCH net v2 0/2] tipc: fix publication lifetime races
Date: Fri,  2 Oct 2026 02:29:22 +0800
Message-ID: <20261001182924.3928331-1-nicoyip.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927180806.1315902-1-nicoyip.dev@gmail.com>
References: <20260927180806.1315902-1-nicoyip.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two races can leave the publication lists referring to objects with an
invalid lifetime.

First, tipc_node_unsubscribe() looks up the publishing node before
unlinking a publication. If the node has already been removed from the
hash, the lookup fails and the caller frees the publication while its
binding_node remains linked.

Second, tipc_publ_notify() retains the next publication from a failed
node's list across an unlocked interval. A concurrent withdrawal can
unlink and schedule that publication for freeing before the purge
iterator advances to it.

Patch 1 unlinks successfully removed remote publications directly under
nametbl_lock. Patch 2 moves the failed node's publications to a private
list and selects each publication under the same lock, so no publication
pointer is retained across an unlocked interval.

Changes in v2:
- Split the original fix into two patches.
- Add patch 1/2 to address the unlink-before-free issue reported by
  Sashiko and remove the now-unused tipc_node_unsubscribe() helper.
- Add the decoded causal call trace requested by Tung Quang Nguyen.
- Explain the ordering of name-table updates around the node-down
  publication snapshot.

v1:
https://lore.kernel.org/netdev/20260927180806.1315902-1-nicoyip.dev@gmail.com/

Chengfeng Ye (2):
  tipc: unlink publications without a node lookup
  tipc: serialize publication purging with name table updates

 net/tipc/name_distr.c | 36 ++++++++++++++++++++++++------------
 net/tipc/name_distr.h |  2 +-
 net/tipc/node.c       | 20 +-------------------
 net/tipc/node.h       |  1 -
 4 files changed, 26 insertions(+), 33 deletions(-)

-- 
2.43.0
