Received: from mail-wm2-f9.google.com (mail-wm2-f9.google.com [74.125.225.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CF14ABBCE
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790002650; cv=none; b=T/bM/CiTAELjUdpGJUuoTge6VWvmbRSk3jFvNjOlbqXKs85KjygmlIoZ5OomhAJ+QyHJE4M+yTJIYMxIY3GW2ux0NpjDfN/Cai6qS55zjrOpewX8PGvGYBDRbInLgvivfg9qgMlOckUt67SvvZ06K+vksEAGtWdq1VyXkHdNya4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790002650; c=relaxed/simple;
	bh=TzIqUe2bPr+rCrYGN26hULTVXKps5YUGqZ1r3naQPKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hSZyZtJptTpVzVN315JrXj1sUsKoSSR3qG6eR0X7++YmoNYwGlwOxjWw7bezEzjk8kL8iGX9eKxm8D7j8fNxnSt0QYUmwIKIHplFBAJTmj1g0SV2I3L7MnZdMzWMGhB6ZdqbqMgVaFn9Bt9+gwVe2OKovAJTYP0M6FpjZTJdsrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.225.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm2-f9.google.com with SMTP id 5b1f17b1804b1-49e6eb11e9cso14239985e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790002640; x=1790607440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r/iG3o43oIJZJaCYcUSYeC2n62gq4cdWVmWrUdZeO8U=;
        b=cFSakplkjI6i1P+HEGhcVypBZvG/TUDi6lp9SKiYolvtL0wdQiqSvjAIKTKuV3/hbn
         PjXLfvyJUJ+gROinRsoKf13caxVN8mo2QRnvhQtb7IbM1+w5SxBWfvkkNGhProk9fATG
         A1Pd3+IACaxeXIPlU1yAKlXyZ+Ehc7+Ul6K/282M+s56Udq5Eu3PXsKsNtZH85c7X6bp
         QWe0+1e/Iv7h3dRzTMC2SYb6Vl083YRu8lJRCSs33k3YDoDKAgirKKefRbLGD4xrOitU
         U/gG54bKmGNAnE3SPknRE9zvLxihmwyfZ0hyPiT424ctIh2SNAAIiwA/Ngnx1sNNflXe
         pKIg==
X-Forwarded-Encrypted: i=1; AKwUvBwuXtd2vRJ2d0Yj1FJe4TW6H6GyLw5/HaY8n9rAFjsZqzxVzBlE/hym4wXJC2RZNsCKIVj/rDMMW5z+zyk=@vger.kernel.org
X-Gm-Message-State: AFuF++nOm1LaQxHRmx/XDxNzVTCKwgLcv11UxcLg7qumBwQq/MfOrkYO
	xhymUSPSesOW9Y8zHXsquAM5HY+OwHLUMoqoR8OcApQ04+YE65J5IaCL
X-Gm-Gg: AYBFou0VJneFFjKvq4RvJzw9Geh9zYsqU2i85OnzcLhwFoZE8tnsBdlGQ+cKgLs7jW8
	ZivdE7bmDoi8yFRvM+z0aY58oqhCkQKiTHfcV6SLiJB+K6PtvuKz8yWh/TN+LgRCHu8sNebdwRB
	l3NJlAikmvvt2WmSw4p59cYbF5sIEDjQd+8tn+YpCV/BT21QuA0PI/mA4ZaxkMFgRFkxYDUQpV1
	bZSSoGOnwkGE1i61WEJveQAOsvV7gNrdMSz+QiGynm5vp05fiKJxfKx7wg3TcN56ZMhGr7Yr0GP
	IS1SZo/bzgnMr5OicKikpu1Egb9Q9B9IOt8umvdocg4VPZ4MZMbokepELYriGbUuMeYHyeUuEfP
	ZhJKD8QihjC8gbgwcvVhp5uaYQJBr9BpQoL0T724H2zJYkUyh8NlJJpkoOekex56lyc9jM2bBXq
	w2Qq6cyGzl0olCENwO5OIVZdUNYJD/hro/LEoQgzJj1bzO9Bbj+UHpTKZAVqyw5LuUGF8KMp/Wj
	pIfdnVwCqgvaPPX/FZ/AXUvqrfdhv77PR/vf1nkt1VXFlFTrmvIV0BFETvxovA=
X-Received: by 2002:a05:600c:4e86:b0:499:8b13:3a98 with SMTP id 5b1f17b1804b1-49fc56715d6mr143236515e9.4.1790002639706;
        Mon, 21 Sep 2026 07:57:19 -0700 (PDT)
Received: from im-t490s.redhat.corp (78-80-107-225.customers.tmcz.cz. [78.80.107.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd0eabfcsm243153905e9.3.2026.09.21.07.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 07:57:19 -0700 (PDT)
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
Subject: [PATCH net 3/6] net: openvswitch: conntrack: fix helper UAF due to extensions realloc
Date: Mon, 21 Sep 2026 16:55:45 +0200
Message-ID: <20260921145655.3167436-4-i.maximets@ovn.org>
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

Fixes: cae3a2627520 ("openvswitch: Allow attaching helpers to ct action")
Cc: stable@vger.kernel.org
Reported-by: Axel Mierczuk <axel.mierczuk@1password.com>
Signed-off-by: Ilya Maximets <i.maximets@ovn.org>
---
 net/openvswitch/conntrack.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/net/openvswitch/conntrack.c b/net/openvswitch/conntrack.c
index c20f096eef40e..d3326edcabf76 100644
--- a/net/openvswitch/conntrack.c
+++ b/net/openvswitch/conntrack.c
@@ -817,11 +817,14 @@ static int __ovs_ct_lookup(struct net *net, struct sw_flow_key *key,
 			}
 		}
 
-		/* Call the helper only if:
-		 * - nf_conntrack_in() was executed above ("!cached"), or
-		 * - When committing an unconfirmed connection.
+		/* Call the helper only if nf_conntrack_in() was executed
+		 * above ("!cached").
+		 *
+		 * For unconfirmed connections it will be called later during
+		 * commit as we need to have all the other extensions allocated
+		 * before the call.
 		 */
-		if ((nf_ct_is_confirmed(ct) ? !cached : info->commit)) {
+		if (nf_ct_is_confirmed(ct) && !cached) {
 			int err = nf_ct_helper(skb, ct, ctinfo, info->family);
 
 			err = verdict_to_errno(err);
@@ -1025,6 +1028,14 @@ static int ovs_ct_commit(struct net *net, struct sw_flow_key *key,
 			return err;
 
 		nf_conn_act_ct_ext_add(skb, ct, ctinfo);
+
+		/* Call the helpers now.  We couldn't do this before as
+		 * all the extensions must be allocated before the call.
+		 */
+		err = nf_ct_helper(skb, ct, ctinfo, info->family);
+		err = verdict_to_errno(err);
+		if (err)
+			return err;
 	} else if (IS_ENABLED(CONFIG_NF_CONNTRACK_LABELS) &&
 		   labels_nonzero(&info->labels.mask)) {
 		err = ovs_ct_set_labels(ct, key, &info->labels.value,
-- 
2.55.0

