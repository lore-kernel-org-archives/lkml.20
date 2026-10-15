Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3344CC27F
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792052263; cv=none; b=m1uIrF7d8qCZW8uFSu2JxnvYJK9bOIZRx1Oz12vCxt+qHwQblAlbJrI41rpVViuPm8CGEO8ABbXhmyVRJ6GxIOLuMGCBdgydOOXBCsxQ+83w8qOxzjMMD9Ot1XLLZk0FvcY0zwkx1mMcQjLgkygOZA9rfYvI/44/P9xG0Ih8xXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792052263; c=relaxed/simple;
	bh=/HnoRr6jTN7lhWQJjX7agqNJaK5Mj2EZ7UCIBTgv/SA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j7C56XZdoiE60Rnf63Dp4PIQ1X8XoQOfiTE1mJhLeaZHvUZILDj8PjESZPXTrOEokzLRihmYvMU4lbwkdgkP4zeRIQV+lmMzKpa2WHr/CxHZpCFNHlxq8+57I5jDWhs4ON3cE9cMLs+ly90sPAs/qYWVV0siBVcT5SvhlpZM2gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e++FoW80; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e++FoW80"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49d05d51553so11588745e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792052253; x=1792657053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1wKZanZE44fFdmkSv3uEQgs6bQ7hBbf+Whca0W3g7zo=;
        b=e++FoW80yrrKTpIUOVXRJksmP/Rz4CMOF+4us3VnOgQbFzr8aYizm9GIn5FnI7oEgr
         ELFqMrzysgT6TCRbOSYrSX5WYIaaqX8AhuakaMqnrzYePxceQO7S4RFn+jau0epVrwRz
         q510/y8ZeV8EBUO3d9ZbrCh6tuXOnlRWWGx3KjuNyflrxuM9KpEt758up6TauiET+NvF
         SXogO2LLRQQCrStH0nq/I4Em2az0J9mqHYU/5ukJsy2NDW07rAQOiEMCIMltvpN4PRIq
         k9ZGJqRUdgO4xxusBBvViw4oxgKtNzrn9tij6lSIkl7l9yE8R1iYN4uf1/tHSNzdel64
         YZAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792052253; x=1792657053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1wKZanZE44fFdmkSv3uEQgs6bQ7hBbf+Whca0W3g7zo=;
        b=SygKvgALoiC+G08FQxCT7Zm2whHEZsxyX51EEvfsWyVEY+6IYNrqLvKJ99qvNLLkqD
         p4CxtZkyRnHpGaMDy/fMOJVIfMg3cB57owfWb0AdVijFTjoYvWGh5Ry38fCUWzIgFsgz
         xlpwPO76JcLUIWdoMk/j67kRP5p4rnPbnMf0BCkXaHgPkYWNT7Oqj2Uq0ls1y6cwwoh3
         9vMUUKirm0GUSpwBlrkxunjjP2DVoUuED5JyDoGutYn/BDzloYSe1cSa3klanv79UUP7
         2FZOOzerKfd6FaMmird1X0AjQ33ZgZ/IFaUviF2U0Iz+0Vp/71ysxNi7jjU09k1TAV6u
         RQhw==
X-Forwarded-Encrypted: i=1; AKwUvBzxOJoleQIcwBL6zY+woLy/Ow4vnb1l7lUo7hDz1OSPzpXPTVBj9Ej3ixKMy5o28tSDBxg4xK3+9Ztv1yU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgpdajG/uiTRZdtUhc01E6ZbGWgQdBCBkx43tm5dJYbB1Ac5m6
	vcp947jp/VNdy8KFwKOfvIrPaOM2Rjm6oKFE7cCvL/KpOSON6LBLKpgU
X-Gm-Gg: AYBFou0e1g3XC2Zh3IPlh96o6bG8tXEfeu/mIL9PoHkWRRzxSiFV4MRaaRT1HWIzyIX
	9O8FRIOjJD9HmrnjxevWCZLF15LMqtFeNmB9rFcQkadBzrgIlm/oZriWbNfRbvF8d+5OwDoQ0jM
	Bz7jAVQfyiBcOqIJkSsKND+Mts67SXl2e/Fia/MhOUwjH02snVPlkWo4PU9vHe52zuYFM4m7E+J
	0I7xn/FYRYhl2aE0nf4tClkYNz6xqT3gKahYPVc+PzcY93B7AadVSXrRQ9mJ8WZR+D2ySjDjoOA
	caFcQjyZe7xyNX9PIHWpMfn7l2SaaMyfHvi/qax3BaOcCzwMtTmPCLCoqnw8Z2urzj9XPH1nXcw
	GwUxkUkwXoKx5rCV9Q/u61rMpJ7JndneWsFGsQ2rQ5psWCPAkEVJj1MMM69I+Cp/vZn1EwFyLP+
	jak/QqGf1XFAZ2YwSdskUqNLawUp7S9i7mZlNG2Qfr5mNTZ4YMHhaAUQeNkS7S7+E5S0LlKm0ZI
	ZrsGI1p1OfDDILMN406xRU8z1QZG3+iqvBZbPW7hXV3nQ==
X-Received: by 2002:a05:600c:524a:b0:4a1:8824:c9ba with SMTP id 5b1f17b1804b1-4a18e49234fmr374111135e9.18.1792052253328;
        Thu, 15 Oct 2026 01:17:33 -0700 (PDT)
Received: from andreayoga.wind3.hub ([31.189.109.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0967a0dsm16930322f8f.3.2026.10.15.01.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:17:32 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2] rtnetlink: comment the RCU waits in unregister paths
Date: Thu, 15 Oct 2026 10:17:16 +0200
Message-ID: <20261015081723.404990-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtnl_unregister_all() and rtnl_af_unregister() wait for RCU readers
before tearing down what those readers use, but do not say which
readers they are waiting for.

A missing wait is then easy to overlook: rtnl_link_unregister() lacked
its synchronize_rcu() until commit 3b70edea393d ("rtnetlink: wait for
RCU readers in rtnl_link_unregister()"). Add a comment to both waits,
naming the readers each one waits for.

Suggested-by: Eric Dumazet <edumazet@kernel.org>
Link: https://lore.kernel.org/CAL4WiioFMQN4troVjQjCmE6Z9kwwb95SnoEupjD=PPSK6Q5f6w@mail.gmail.com
Assisted-by: LLM
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
v2:
- Drop the comments on synchronize_srcu(), its argument already names
  the readers (Kuniyuki)
- Name rtnetlink_rcv_msg() and try_module_get() in the
  rtnl_unregister_all() comment (Kuniyuki)
- Mention the rtnl_af_ops walkers that do not take ops->srcu in the
  rtnl_af_unregister() comment

v1: https://lore.kernel.org/20261008124423.11543-1-parri.andrea@gmail.com

 net/core/rtnetlink.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/core/rtnetlink.c b/net/core/rtnetlink.c
index 15bffafbf0a9c..d73dbc2c8ba0d 100644
--- a/net/core/rtnetlink.c
+++ b/net/core/rtnetlink.c
@@ -526,6 +526,9 @@ void rtnl_unregister_all(int protocol)
 	}
 	rtnl_unlock();
 
+	/* Wait for rtnl_get_link() calls that rtnetlink_rcv_msg() makes
+	 * under RCU, before try_module_get().
+	 */
 	synchronize_net();
 
 	kfree(tab);
@@ -843,6 +846,9 @@ void rtnl_af_unregister(struct rtnl_af_ops *ops)
 	list_del_rcu(&ops->list);
 	spin_unlock(&rtnl_af_ops_lock);
 
+	/* Wait for rtnl_af_ops walkers that invoke callbacks without
+	 * ops->srcu, and for rtnl_af_lookup() readers not yet holding it.
+	 */
 	synchronize_rcu();
 	synchronize_srcu(&ops->srcu);
 	cleanup_srcu_struct(&ops->srcu);
-- 
2.53.0

