Received: from mail-wm2-f10.google.com (mail-wm2-f10.google.com [74.125.225.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14FE4AD4D5
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790002653; cv=none; b=YUHKor26uQ0pb1SQrWP6TZAV2Uzq4cOfaw4K4qxfd+Z1BAZn8fRSoqyVFKyYkm4JuamXoEOKCMepoaTfujEYLa+trfoDbIsxD9LDcSSCs07ZGI8+bcfFIH9vbbuMYuWmd3+BDE2tVS7PAPBqQq8rNn8aZsdHuaU74vFnn8FIiDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790002653; c=relaxed/simple;
	bh=O84UlgIt22qVXOTeLEKlJ+J21Nne9exAai0M6IVznd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qDujWzBCjB9/tMfUZU3Tq1sXK6cOT9RDGIbW9qecDKtGMTVHchGeOXI3F5urKD7dME1QAshS/hCE9oeCAOLtJ8i9Arv/HnqGeR9nLuJ1AXUQlSUbrF4pHKaNhQyKtYkkA6Oc/FhD89A5/MLDn/ew2SogWDHkugvi1xPD250DYno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.225.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm2-f10.google.com with SMTP id 5b1f17b1804b1-49b963f51f6so13081635e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:57:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790002648; x=1790607448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D5yxLi0HeeDyCNaoa/cXH7lPCvNUM8Mh94Wvp96R2LI=;
        b=MP1c9CzXiYHJ770APFAlK5pdk8ckTF68azi4aXS1xYxtdEaG7guqWWjVjRJgF8AsjV
         IIHscM9SZETl64v2xRMSfVoHPHq46NAjUHxR00AKUJFSqEjT4F/CNoNS7OR1r5EkIiTS
         fsfBBrPC2JGzCjSuEfFuw9BODGkPWWoOONl8oH8zA+9s1PTSu7F7tSs5j5So5k6zrU3y
         dJgZSf5RPr+0ZyAGY8ozd4noZbOOI77polyWjCCK1+mvcw8+/HlJTY3r00gEdM5PpM5n
         uNRxdwmj2FMoaGl0gB/a07Q0ZhXGlocRLflOQoPaYiXqfarj+ELl+sRXVehR3it2MiZj
         biCA==
X-Forwarded-Encrypted: i=1; AKwUvByvUpyDM973C1xrD/wXXtVvoMjePHXbsphPdE0+D3DAe+kEniklms/jFzGG3WEcIGIy616YuG2dndu7oMc=@vger.kernel.org
X-Gm-Message-State: AFuF++mN/1hJ0CNq4WY6scJEPR/FwM7JC7TlYgZs024DBBUV9186kVkQ
	oiEz8Fj333AqbiA8prHh/LA15FXE813GaGXKbKL7+aNc82Q/Zix+FIw0
X-Gm-Gg: AYBFou2AHoAz6GoVFzu8iCJ5J/zoJqFhWqUa7MQkh+wAtlK2UhF0ZRMJuWQGLitzf6w
	EJYcR1dDqtjwytbgfjRwQJ0oy9O8J9YWUJjKQ5uWUwYQ7NEeM1fpgJkYTjsaQUCPy3zsXgapQGj
	Npg1KP952ux1QCwHjdNQvAQQ51aYNw8u6PrrlMUDzXTs+7Oh/kLSPeECthiY69EGC36LXpx4qs3
	vg6r148CP898pnXGmxvzyLC60AuiGadpVw0ZXTqPZ3emYTfZLhEQNLCRl3x5COXrEMkk4z9x+up
	UGOty0c3QH4lPKUPmd1V1Dund7B2qBL801qheMdS2w0ywJfjZ3bzthgg2gm0nc5YQmKgqeAKY8z
	e9DPQjnlRng5d423YD6P+bwBoLNDR5GFIBvPGnEe/2h1ii1wBYuayMutgcDBw7AcJdWJAQN4ml3
	kRD6hsbn5pcxGliWNoq6hDMBJBv59fq5Q/vFx6zJIQ2pAs1ozBKA8NYvY8+thBkcJMeIHLdwOAA
	1XYd+RX8IwGhzilIOYC/+Ma17uob72YWZhlY/Y5h/EPO4OH5P0u3ZM=
X-Received: by 2002:a05:600c:34c3:b0:49c:fa21:e74a with SMTP id 5b1f17b1804b1-49fc5757f73mr156995365e9.32.1790002647731;
        Mon, 21 Sep 2026 07:57:27 -0700 (PDT)
Received: from im-t490s.redhat.corp (78-80-107-225.customers.tmcz.cz. [78.80.107.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd0eabfcsm243153905e9.3.2026.09.21.07.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 07:57:27 -0700 (PDT)
From: Ilya Maximets <i.maximets@ovn.org>
To: netdev@vger.kernel.org
Cc: Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Aaron Conole <aconole@redhat.com>,
	Eelco Chaudron <echaudro@redhat.com>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Xin Long <lucien.xin@gmail.com>,
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	linux-kernel@vger.kernel.org,
	dev@openvswitch.org,
	Ilya Maximets <i.maximets@ovn.org>,
	stable@vger.kernel.org,
	Axel Mierczuk <axel.mierczuk@1password.com>
Subject: [PATCH net 6/6] net/sched: act_ct: fix helper UAF due to extensions realloc
Date: Mon, 21 Sep 2026 16:55:48 +0200
Message-ID: <20260921145655.3167436-7-i.maximets@ovn.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921145655.3167436-1-i.maximets@ovn.org>
References: <20260921145655.3167436-1-i.maximets@ovn.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While calling the helpers, a raw pointer to the extensions area is
wired into expectations list:

  -> nf_ct_helper()
   -> helper->help()
    -> nf_ct_expect_related_report()
     -> nf_ct_expect_insert()
      -> hlist_add_head_rcu(&exp->lnode, &master_help->expectations)

In case the connection is not confirmed yet, more extensions can be
added afterwards with *_ext_add() calls reallocating the extension
space and leaving the now invalid pointer in the expectations list
that is later accessed while removing the expectation.

Make sure that helpers are called at the end after all the other
extensions are already added.

Note that the helper rejection now leaves the mark and labels set,
but that's not different from how the NAT was handled before or how
the mark and the labels were handled on confirmation failure.  And
there are no atomicity guarantees provided by the API anyway.

Fixes: a21b06e73191 ("net: sched: add helper support in act_ct")
Cc: stable@vger.kernel.org
Reported-by: Axel Mierczuk <axel.mierczuk@1password.com>
Signed-off-by: Ilya Maximets <i.maximets@ovn.org>
---
 net/sched/act_ct.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/net/sched/act_ct.c b/net/sched/act_ct.c
index f62051ec9d57d..411e3dd92d072 100644
--- a/net/sched/act_ct.c
+++ b/net/sched/act_ct.c
@@ -1102,19 +1102,25 @@ TC_INDIRECT_SCOPE int tcf_ct_act(struct sk_buff *skb, const struct tc_action *a,
 		}
 	}
 
-	if (nf_ct_is_confirmed(ct) ? (!cached && !skip_add) : commit) {
-		err = nf_ct_helper(skb, ct, ctinfo, family);
-		if (err != NF_ACCEPT)
-			goto nf_error;
-	}
-
 	if (commit) {
 		tcf_ct_act_set_mark(ct, p->mark, p->mark_mask);
 		tcf_ct_act_set_labels(ct, p->labels, p->labels_mask);
 
 		if (!nf_ct_is_confirmed(ct))
 			nf_conn_act_ct_ext_add(skb, ct, ctinfo);
+	}
 
+	/* Run helpers for the connection if nf_conntrack_in() was executed
+	 * or if we're about to commit.  This has to be done after all the
+	 * extensions are already added.
+	 */
+	if (nf_ct_is_confirmed(ct) ? (!cached && !skip_add) : commit) {
+		err = nf_ct_helper(skb, ct, ctinfo, family);
+		if (err != NF_ACCEPT)
+			goto nf_error;
+	}
+
+	if (commit) {
 		/* This will take care of sending queued events
 		 * even if the connection is already confirmed.
 		 */
-- 
2.55.0

