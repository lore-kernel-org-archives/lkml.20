Received: from mail-wm2-f7.google.com (mail-wm2-f7.google.com [74.125.225.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4FC4AC14D
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790002650; cv=none; b=SX2gntyNB/aD37C5zgkoLsjcRG7JlzpEeGo+Oxfw8S+MLZ/jlj/tA766jECYdbHEW5bGjzAnPk0+ivjRMzQRGeSbVOARCCZkgAhIE78DpXI8MqPFS/79gpJrE18ADhXWKLr9bPay2XG0ZYEi1fexLSoFG7GJCHcu39XbEoGYMsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790002650; c=relaxed/simple;
	bh=OK1hcbfhrRYnS7Fji50QexykkRH0sRg4CUWkyRdbGGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jh1o/dcb+Jw5gv8PC8uXZiNJK8lep+4hIA37uILqgrPyJExPta9l26pA+TNTRixlYFLU8xgXVGKba+ExwDPD4WBxoscdGu+gFGin0D5m+GPs3y9tvrGIy8Ph7i+RGCZXmmGIsmnSbdr14ChqPmzhO+lOWtQdKjsTHk6WvUrE8wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.225.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm2-f7.google.com with SMTP id 5b1f17b1804b1-49e8361492fso12427225e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:57:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790002643; x=1790607443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JPeqxpJkKYTQM9xCANZhikKMsVz4xTfivxM0gs/My1U=;
        b=Kss6xwSBVY1oGu8dKD1kFsU8GYHEJRVqPsEf/aTeu+aBHbn14sn95ZaJHjYkA7oCBd
         OsCVIdkpyrOm39UGK3H2ZLUVh34HxXKIAOFY8MJEH+Kmg85m7pKGK/E2oEGlcE+lWUV5
         i91z+RqJ8yQI7gbT2Oqd3v6GommhHR/65yrSyKn6jHyFGi7AZ/jxpeMNBHA0ICIf+gQ7
         4j3a1iolwe63l5/fqvZagCLubKeaCtzNqeGGYBTdjZdsfqA0S9FjYbXzORGL/m5e1AA9
         MYoacswfNqNI2r37VjNKUACqhWwCOb5Y/2RqZ1lx0cgtQUfoG0wpbRebJ+MTRe3ZafK7
         bW1g==
X-Forwarded-Encrypted: i=1; AKwUvBzLSpSItEbZjkXmWQsxYunhK09QsCiJUJSimaArOWLGqeLkStPTHYlcg6NsE3NCBgfMGfsBopsY8TzSmKg=@vger.kernel.org
X-Gm-Message-State: AFuF++mVgs9QdliJEvLECoXA5wG2Uo3VBbEya5N2LTGMrCP7LcbwV+h7
	t1b7OYJIThQdioMiVyvtKn5N38k9yPWqnOz3hSdX/PJFSrCcG9JzvF3a
X-Gm-Gg: AYBFou0GHnq1XnXxO5mXh2cH612kUFzccpqSm0uLZCqSqh1DS9YAqDOheyJ29il4VNk
	Gz7Jk90+04NLy8uZMcLR/KlN5tQEkgF9Nzjao/yXhQT1OOC36WrKe8nCd6Gi4CzmfcF7ip8X96z
	ZHJjIB0rhKWaZRFtKEv/hYij2nac9HLoUp5H5bW8fvSASOmdE8ED2CnlSfHvcFd4PbhyAB5gt49
	erFxt7kF2mnr3HrhY4T/G2Ig/zTnNBkGxiXzrvt00qMo4dHGT/mrV18JYewbTVo7oo2Oq33pGgV
	Gn3lFYnH9ZHnGCGU4hKGIqk5xf00gzGaf8vJHKcM0EiOZfqpdCINqEG+n6WXUcmzDlvdVFM3+YO
	h7q4PmzngnUDfQ7BlVWoxy/EXYwQp6tnJ/BHBelJqABUo/tDJKNPG1N+l/NWyjwy3oIp9OEygMm
	NJo53PoyVPq5ap78Q4uvSF4h36Mr8EI3SjNFHh7MEmQRuScaGd+r9keq5t1p87MZWbiUKBsIfp2
	Z56SciUPoYbmeXeK0otRaM8wVPWIcjiNLrW0MQ33oBH1IjZKopY
X-Received: by 2002:a05:600c:138b:b0:49c:f89b:f82 with SMTP id 5b1f17b1804b1-49fc568f8dcmr139432395e9.12.1790002642660;
        Mon, 21 Sep 2026 07:57:22 -0700 (PDT)
Received: from im-t490s.redhat.corp (78-80-107-225.customers.tmcz.cz. [78.80.107.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd0eabfcsm243153905e9.3.2026.09.21.07.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 07:57:22 -0700 (PDT)
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
Subject: [PATCH net 4/6] net/sched: act_ct: avoid modifying shared unconfirmed ct entry
Date: Mon, 21 Sep 2026 16:55:46 +0200
Message-ID: <20260921145655.3167436-5-i.maximets@ovn.org>
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

In a case where skb with an unconfirmed ct entry gets cloned, we may
end up processing both again but with different sets of extensions.

The series of events:

 1. The first clone wants to commit and runs the helpers wiring up
    the extension pointer into the expectation list.
 2. Then it looses the confirmation keeping the entry unconfirmed.
 3. Second clone now wants to commit labels or run NAT and adds the
    new extension for that breaking the pointer in the expectation
    list causing UAF on the destruction path later.

While this is possible to trigger, there should be no practical
network pipeline where we need to process both clones without
modifications in the same zone.  So, let's just reset the entry in
case for some reason we got an skb with a shared one.  This doesn't
affect any known use cases, but avoids any potential problems with
sharing and modification of the unconfirmed ct entry.

Unlike openvswitch module, act_ct allows for NAT without commit.
Changing that would be a uAPI break.  So, act_ct needs to reset on NAT
regardless of the commit flag to avoid reallocation of the extension
space.  This, however, doesn't really change the picture for sensible
networking cases as there should be no need to run the same packet
twice (before and after the clone) through conntrack without packet
header or zone changes and without commit.

The fixes tag points to the introduction of helpers, since that's the
main UAF trigger for the sharing.

Fixes: a21b06e73191 ("net: sched: add helper support in act_ct")
Cc: stable@vger.kernel.org
Reported-by: Axel Mierczuk <axel.mierczuk@1password.com>
Signed-off-by: Ilya Maximets <i.maximets@ovn.org>
---
 net/sched/act_ct.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/net/sched/act_ct.c b/net/sched/act_ct.c
index 55f3521edb4c9..e72143d36b119 100644
--- a/net/sched/act_ct.c
+++ b/net/sched/act_ct.c
@@ -979,11 +979,11 @@ TC_INDIRECT_SCOPE int tcf_ct_act(struct sk_buff *skb, const struct tc_action *a,
 				 struct tcf_result *res)
 {
 	struct net *net = dev_net(skb->dev);
+	bool cached, commit, clear, nat;
 	enum ip_conntrack_info ctinfo;
 	struct tcf_ct *c = to_ct(a);
 	struct nf_conn *tmpl = NULL;
 	struct nf_hook_state state;
-	bool cached, commit, clear;
 	int nh_ofs, err, retval;
 	struct tcf_ct_params *p;
 	bool add_helper = false;
@@ -998,6 +998,7 @@ TC_INDIRECT_SCOPE int tcf_ct_act(struct sk_buff *skb, const struct tc_action *a,
 	retval = p->action;
 	commit = p->ct_action & TCA_CT_ACT_COMMIT;
 	clear = p->ct_action & TCA_CT_ACT_CLEAR;
+	nat = p->ct_action & TCA_CT_ACT_NAT;
 	tmpl = p->tmpl;
 
 	tcf_lastuse_update(&c->tcf_tm);
@@ -1046,6 +1047,19 @@ TC_INDIRECT_SCOPE int tcf_ct_act(struct sk_buff *skb, const struct tc_action *a,
 	 * different zone.
 	 */
 	cached = tcf_ct_skb_nfct_cached(net, skb, p);
+
+	/* If the ct entry is not confirmed and shared with some other skb,
+	 * e.g., a cloned one, we can't just modify it with a commit or nat
+	 * as we must not modify the extension set.  Reset.
+	 */
+	if (cached && (commit || nat)) {
+		ct = nf_ct_get(skb, &ctinfo);
+		if (ct && !nf_ct_is_confirmed(ct) && nf_ct_shared(ct)) {
+			nf_reset_ct(skb);
+			cached = false;
+		}
+	}
+
 	if (!cached) {
 		if (tcf_ct_flow_table_lookup(p, skb, family)) {
 			skip_add = true;
@@ -1083,7 +1097,7 @@ TC_INDIRECT_SCOPE int tcf_ct_act(struct sk_buff *skb, const struct tc_action *a,
 		if (err)
 			goto drop;
 		add_helper = true;
-		if (p->ct_action & TCA_CT_ACT_NAT && !nfct_seqadj(ct)) {
+		if (nat && !nfct_seqadj(ct)) {
 			if (!nfct_seqadj_ext_add(ct))
 				goto drop;
 		}
-- 
2.55.0

