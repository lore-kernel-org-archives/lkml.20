Received: from mail-wm2-f9.google.com (mail-wm2-f9.google.com [74.125.225.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC564A64F0
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790002645; cv=none; b=SyCPTXqRQrkWkESgsJA9UBU2txTyNyoKqcgePUH3vtCmcstAon9FUjru8q4W8SYK3/Ehyvqg+ewjxV0o3IfctNH4ULvb8+UFQDF8xX2nwLYZYP+9k3H0b1g9Za1c0luvKJoI5y6GcqN7QAzy9IdwnqhufcP9e2vZkQ/F9DdJPT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790002645; c=relaxed/simple;
	bh=GewYnmEL4DmNXoNcMZj/SIhw9+Nkv+8Qj+/vw7RBrBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eQ+1hM5Ie3Fxl4PIJoZ0NcO0F+5TOm4rkAwcVimg7c48nyI9us9TlzSIbdHOck0kRyfKUTKrvjmnrhhTLIRqQFksMZks0jw2ET5UILeyHd1KlwVnVls2SHeAto8YwJ0bZMo6cgQuPfPChmwsxAGLIPitE6ptkJrNaPtTcZ20OvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.225.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm2-f9.google.com with SMTP id 5b1f17b1804b1-49e6e43b9d8so11352075e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:57:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790002634; x=1790607434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pQTMqBWHnIAoQBjOra2YMizNpxK4ySQgVrZe7YnTaiY=;
        b=N70MJj8MYXHe74CEXLmLnToGyJHQxCtqv7VEUAkRA3Ci/keIBUvECKL8SMcPCagf1x
         9dnpDvP94XteziNir90zJDG6jnoaBpoesLP8m1Lx9jaYw35IgWHczL2I9MknqKIFQ0Cx
         c6siF7bLM2EaoitHamXzVfOgIiesSjGv3nNuptjdTjtrIa57wZtP2NKFP9MRsKa0/91t
         G0bEmA2rfe+oThLhhHdSMiUpqb1TQlEg55UJ7Fncyci1cZ50SQw3yg7pmbLRmfi1ZX3y
         ltoZKs1783OMOISoyKHjhOSfw5HjiDSvf0wj0HaOUm2dXy43gr9bTWn/LNsmFQjXaaFY
         9vrw==
X-Forwarded-Encrypted: i=1; AKwUvBxo4X1YQK45KbT3J6W3lPl1qjA2UWebgRoc7DuV3d8mP2kod/pEon6Z282YoYMMKPgQyZExR2B8oaDuyDM=@vger.kernel.org
X-Gm-Message-State: AFuF++msUt9UENe4LKaNMXg5NEECSSi8c/VwbBbVRrottRRyikTZ4qoN
	yXXRgBxirXwatSNbUVDUi4g+NnFkMtDZ/qTGR52hnWjLTBPKcoienT3A
X-Gm-Gg: AYBFou0f90KIbmrD8+z0QIKq2NzlxWi1YLsLj94eXkemMAoVp8wX/Ij2OqH1oLCm0JI
	o9JgASRuYVNfbBxJyFpbkj27aMwNj+fKZI4O2+SQ/5zfwKZPhqLUKjtvFDE/xuTljiG1JYm9QJ6
	YChyYlwHemNU5fjNeHFkJ6namYDOYnqOd4/glWkEsVhYSJzgWNqbwWSZuVC50C6c9NVQTxPh6g5
	3Ymjg3IbH/dK4aSwcVnMI8yvFQ9LCyeavBEolasPJGZ/gDORDWyZOh4dfpLEHCv/hSYd//moOKT
	kXfHq2zt37dMaUnJoj1MnICim9soqLtPiAjET+X8ibnz9zFCt035SF32Js8dGQ8zq4UIZmwJXMc
	Jda+SbVRe73SllarITLd7CzWCW2PvapNnxjINFCsQ5y2RqM9mAKWgF8lImYRo+ASD4wtlGAD2Nd
	YdacK0g3ifhxSlW1aLTApd4Q3xx79xaGq4dPr+lZvlFiZQLOkXCwkHpKsJ9CvMQK1JsTgIZw56n
	GGe9/BpmGDV0fOBoSboZrkZgJ90o+npHZjpdLj91yxNzJOWJG8t
X-Received: by 2002:a05:600c:4e86:b0:49c:d52e:d0ea with SMTP id 5b1f17b1804b1-49fc566e6efmr144949645e9.4.1790002634076;
        Mon, 21 Sep 2026 07:57:14 -0700 (PDT)
Received: from im-t490s.redhat.corp (78-80-107-225.customers.tmcz.cz. [78.80.107.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd0eabfcsm243153905e9.3.2026.09.21.07.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 07:57:13 -0700 (PDT)
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
Subject: [PATCH net 1/6] net: openvswitch: conntrack: avoid modifying shared unconfirmed ct entry
Date: Mon, 21 Sep 2026 16:55:43 +0200
Message-ID: <20260921145655.3167436-2-i.maximets@ovn.org>
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
end up committing both but with different sets of extensions.

The series of events:

 1. The first clone wants to commit and runs the helpers wiring up
    the extension pointer into the expectation list.
 2. Then it looses the confirmation keeping the entry unconfirmed.
 3. Second clone now wants to commit labels and adds the new extension
    for that breaking the pointer in the expectation list causing
    UAF on the destruction path later.

While this is possible to trigger, there should be no practical
network pipeline where committing both clones without modifications
into the same zone is needed.  So, let's just reset the entry in case
for some reason we got an skb with a shared one during commit.  This
doesn't affect any known use cases, but avoids any potential problems
with sharing and modification of the unconfirmed ct entry.

The fixes tag points to the introduction of helpers, since that's the
main UAF trigger for the sharing.

Fixes: cae3a2627520 ("openvswitch: Allow attaching helpers to ct action")
Cc: stable@vger.kernel.org
Reported-by: Axel Mierczuk <axel.mierczuk@1password.com>
Signed-off-by: Ilya Maximets <i.maximets@ovn.org>
---
 include/net/netfilter/nf_conntrack.h |  5 +++++
 net/openvswitch/conntrack.c          | 12 ++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/include/net/netfilter/nf_conntrack.h b/include/net/netfilter/nf_conntrack.h
index bc42dd0e10e65..c39425e54d87d 100644
--- a/include/net/netfilter/nf_conntrack.h
+++ b/include/net/netfilter/nf_conntrack.h
@@ -185,6 +185,11 @@ static inline void nf_ct_put(struct nf_conn *ct)
 		nf_ct_destroy(&ct->ct_general);
 }
 
+static inline bool nf_ct_shared(const struct nf_conn *ct)
+{
+	return refcount_read(&ct->ct_general.use) > 1;
+}
+
 /* load module; enable/disable conntrack in this namespace */
 int nf_ct_netns_get(struct net *net, u8 nfproto);
 void nf_ct_netns_put(struct net *net, u8 nfproto);
diff --git a/net/openvswitch/conntrack.c b/net/openvswitch/conntrack.c
index 0f433688e17b9..a733029c28dd0 100644
--- a/net/openvswitch/conntrack.c
+++ b/net/openvswitch/conntrack.c
@@ -734,6 +734,18 @@ static int __ovs_ct_lookup(struct net *net, struct sw_flow_key *key,
 	enum ip_conntrack_info ctinfo;
 	struct nf_conn *ct;
 
+	/* If the ct entry is not confirmed and shared with some other skb,
+	 * e.g., a cloned one, we can't just modify it with the commit as we
+	 * must not modify the extension set.  Reset.
+	 */
+	if (cached && info->commit) {
+		ct = nf_ct_get(skb, &ctinfo);
+		if (ct && !nf_ct_is_confirmed(ct) && nf_ct_shared(ct)) {
+			nf_reset_ct(skb);
+			cached = false;
+		}
+	}
+
 	if (!cached) {
 		struct nf_hook_state state = {
 			.hook = NF_INET_PRE_ROUTING,
-- 
2.55.0

