Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DD730ACE6
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790123828; cv=none; b=aiIwOKBo3lA5TqGb2ZhdFyt5EgLR3ORhc9saOjr7Q0Mmq6JESoZhfOA+oQDWIxnRf0GFe+0dUWNJmUE+8xA6MrNsc/ukwqBKc6HA6YQBJeDkNlYuWeNM9VWAxObHlaH7KUhl4ijBdpxznYIqlW4wIgXOa15RV95x+ui5Hh/CGiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790123828; c=relaxed/simple;
	bh=4GmpNfU3LQJSJpqQsR6/KFUehJWyBgCDEINSJI93IoU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F3Q5lvYhkHcEWAEMkliBmNiA2QpqfjPHi/iBjq4ygJ1FgiMjA3aZGxnJYlSwziH1T+4pRZeQuVk9XO1byE9cgvsW8DXfiV82L4yOtpHCnIjEJt8YJ7DP3J9epCHAYKVOvQ7J8Uz1GKhG+4hMxggmJ8TNYu+fIGA894Pquzxo9oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJveOrB0; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJveOrB0"
Received: by mail-pz2-f40.google.com with SMTP id d2e1a72fcca58-8748f34b1f2so272897b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 17:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790123826; x=1790728626; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hr/q+PFpOYwfdPGF3n4BjUmiJpuCV+tZ3wvtyOR+SaI=;
        b=aJveOrB0Mra2DE7rRtm4jSoFHGhSRfwfiHF6IAzvI2+qiUMe2/TqHK1wzPcnGROmDN
         Yjm4CnDbH9yxAfX87R/bjReLg3lEr09B4M8P7xXt84uGQPvBfAh0CCN+ipdRc5ZPLLIq
         ahzs0Y69rFMW9b8QpF0GmLKCbhoXoxkkUHZD6J45ncLHYO/rN2Rn5F41pRu4ShJJri9u
         EafLif2Czzfa4/5OacdWbZMmvrweSQqYazisfeoNVPNcHKK03PfQ4YWBxaFB4OrULJdX
         Dz0Q8w8MvzRfWNdPMumLqrWaWtfSR4F8ZcA/1RlHAZa/EF2xSly7i2GPbpvAPZIt166n
         bsNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790123826; x=1790728626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hr/q+PFpOYwfdPGF3n4BjUmiJpuCV+tZ3wvtyOR+SaI=;
        b=lxTO/1/FQtPVKTajrQVmyPPlCG2zF9GgHiGSumqIvKGkG2I2vIXA+njBo+K7GIk68G
         Pxi+rIaX0h/eU4EhjzSoQA05kbwMSKczP7aLBLZDKZwo7v2C6eFKaUHwHdKyxBEH4rP8
         1KBiS1BCG2pEssqdFpd3Lm1jag4x7Y11IZ1kKOehJ/GA5Q/FseqtAUumRDZEZY/DWNCb
         /vAe8BSZbmBDIPKNPxJUt5A5WTIEd8zHu8JocOnDFFpx5ZkmTmI1M+bWRHOC018ssRC7
         NTA5xxyfNsO745nyPI8Icpy1Fh0lCdeJA2D6bHx1nXfIGuetgPadEyE2zWnzsRUaB4Ci
         ZVvw==
X-Forwarded-Encrypted: i=1; AKwUvBxKI/HHrk+ySPZT1/ziJAhAJ0Y7eidhW9StibhqV9kMjPmOt3lOZtbDXYsmRB4lfXd74ZNZQZwWo95bY0I=@vger.kernel.org
X-Gm-Message-State: AFuF++n/ZGHCZLR9gG3nbd68Fr2F+7fNKd1J44C8mMPJJvjaWJGdkLHR
	xZr+c/646HJPiEBKbJ55QgKNIDzt42zBC4jYgWZy8j+GZXAhraC6ltnO
X-Gm-Gg: AYBFou0U0BbN/Pw8U+oV3NksY5kQqDrQDalWidXJ7dCt8WKbvEKhQWzWGVlxFmR6fo4
	eqeKMt4IQsR1Ecp3RlATTUw+y3XPbviCBXrUrDTOArw5za0YtbrN+C1fj4MDsvivGZdZ2j6qu8v
	s2mE5xFbPZpUg1/6n82NaRoa9PSXQc1NtZOaPfwWWNXsm/+BXea7n/uG+5f3nV4urzMcvxXVP9f
	dNNn+yD0pI3iwQYDQidqM84aQaZ2TP1GOEqg65iPKmahiw19YOGjKpdlb4yddQWwZfAc3hL0KET
	R/jNqpg+hQj6WWYxWvYuesEI4orSFJl3vaaDV8hGFk9tvSfziA5sPnXLOwcLpIZIWs+AJSiMzmq
	YbGKNCjDQyvsnBG7wY49tq/K8M1ocY5izgDmMBWFVOj2RmguNhdctMj+BgPVWD1llZ7Yg1252HT
	gOrRRHLXeb/9aW4gR8MUcY/l9UN4LbTNXKNnKfMMlzMTSAPpIQfrxNedshNis+C+i4mto2+dD2n
	dSG8SeM0w==
X-Received: by 2002:a05:6a21:8209:b0:3cd:61d5:f342 with SMTP id adf61e73a8af0-3ddf7caaa23mr1367384637.9.1790123825606;
        Tue, 22 Sep 2026 17:37:05 -0700 (PDT)
Received: from [163.43.103.131] ([163.43.103.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1dff9778sm427895b3a.49.2026.09.22.17.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 17:37:05 -0700 (PDT)
From: Yuya Kusakabe <yuya.kusakabe@gmail.com>
Date: Wed, 23 Sep 2026 09:36:56 +0900
Subject: [PATCH net 1/4] net: lwtunnel: accept RTA_ENCAP without
 NLA_F_NESTED
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-lwt-encap-noflag-v1-1-8de7ab6c86e9@gmail.com>
References: <20260923-lwt-encap-noflag-v1-0-8de7ab6c86e9@gmail.com>
In-Reply-To: <20260923-lwt-encap-noflag-v1-0-8de7ab6c86e9@gmail.com>
To: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Justin Iurman <justin.iurman@gmail.com>, 
 Alexander Aring <alex.aring@gmail.com>, 
 Steffen Klassert <steffen.klassert@secunet.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Nikolay Aleksandrov <razor@blackwall.org>, 
 Eyal Birger <eyal.birger@gmail.com>, 
 Nicolas Dichtel <nicolas.dichtel@6wind.com>, 
 Xin Long <lucien.xin@gmail.com>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Yuya Kusakabe <yuya.kusakabe@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4481;
 i=yuya.kusakabe@gmail.com; h=from:subject:message-id;
 bh=4GmpNfU3LQJSJpqQsR6/KFUehJWyBgCDEINSJI93IoU=;
 b=owEBbQKS/ZANAwAIASrX0XUqXRtNAcsmYgBqsx8pyJmi0jAqYRMcjxJXjhNdLthCsldl2TNYY
 eoZwTVjneuJAjMEAAEIAB0WIQTaB7usAfxNKMeqa6Yq19F1Kl0bTQUCarMfKQAKCRAq19F1Kl0b
 TblhEACVx9cyL9CTQZ3/LW7LeTj/pABjToLaFkHgZfuwSHVlBzTS3yu2+krdGau9EL0CJLVq188
 r59Ar1A4fN6ev/mtkMZTb9m4UFSvhfuQrsbbQ9Zd0LGFxxkkWuJ170XfUk55jGj9oRDhwwSBp7a
 iuLADGLOepwwxQK8MKiJrvr7lGnEq6Q9C0dia8k8T+eKEhaPKiQsUnXsCZY9MJq3pLZjNhcdNw5
 10rk+G6Hl4EHEYcBhJxVyntwoGR2ef6ADM5ih30/hCbD85BnpUkawKwFUgHkwkgy9JHYHQBQRNJ
 STemUUjI372w6gVbvk3c4sjuxyGn0rOujU09KGmhYa7wJVctO8SX4Ry0lmeXH687Un/dzUdu0Q+
 438+cRsJ3+IPhbkdFjdx0bJuig9BFP75GU0naBgDbpPbi1vCJL9OKz6yGUJN2M6YXnrOQiuyqll
 eAYAsp5rr9u4yEQmWMbCLjiA0rs6awRsRbGu0jpM04Dvz2grecEaGjWpba3JliD0QFjXzOwexGr
 v0L3BDfh1TPlLJh1E9aghLCjpGZzg4Hk1N6y5VDou+ZyJeWhwuirNZwA/bI/I7FOqRErShqf+OP
 4xIHAxSaMT1DqeWZxWWnvi4HR8Zy5sW2vGYbOZ7SikZV6jM2OeAAXF1KHdZPnOqwH8JLWhp1SoQ
 ETkdu7NZ992w6Zw==
X-Developer-Key: i=yuya.kusakabe@gmail.com; a=openpgp;
 fpr=DA07BBAC01FC4D28C7AA6BA62AD7D1752A5D1B4D

lwtunnel_fill_encap() dumps RTA_ENCAP without NLA_F_NESTED, and
"ip route restore" sends the routes saved by "ip route save" back to
the kernel unchanged.  rpl and ioam6 break on the same path:
lwtunnel_build_state() hands the restored RTA_ENCAP to their
build_state callbacks, which parse it with nla_parse_nested() and so
require the flag.  Restoring an rpl route fails as below, and an ioam6
route fails with the same error:

  # ip -6 route add 2001:db8:1::/64 encap rpl segs 2001:db8::2 dev dummy0
  # ip -6 route save 2001:db8:1::/64 > route.bin
  # ip -6 route del 2001:db8:1::/64
  # ip -6 route restore < route.bin
  Error: NLA_F_NESTED is missing.

Setting the flag in the dump is not an option: userspace that does not
mask it off the attribute type, such as parse_rtattr() in iproute2,
would no longer find RTA_ENCAP.

Add lwtunnel_nla_parse(), which validates the nested attributes
strictly but does not require the flag on RTA_ENCAP itself, and use it
in rpl and ioam6.  Switching them to nla_parse_nested_deprecated()
instead would also make them accept unknown attributes, which they have
rejected since they were added.

Fixes: a7a29f9c361f ("net: ipv6: add rpl sr tunnel")
Fixes: 3edede08ff37 ("ipv6: ioam: Support for IOAM injection with lwtunnels")
Assisted-by: LLM
Signed-off-by: Yuya Kusakabe <yuya.kusakabe@gmail.com>
---
 include/net/lwtunnel.h    | 27 +++++++++++++++++++++++++++
 net/ipv6/ioam6_iptunnel.c |  4 ++--
 net/ipv6/rpl_iptunnel.c   |  4 ++--
 3 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/include/net/lwtunnel.h b/include/net/lwtunnel.h
index 26232f603e33..046978d6224c 100644
--- a/include/net/lwtunnel.h
+++ b/include/net/lwtunnel.h
@@ -6,6 +6,7 @@
 #include <linux/netdevice.h>
 #include <linux/skbuff.h>
 #include <linux/types.h>
+#include <net/netlink.h>
 #include <net/route.h>
 
 #define LWTUNNEL_HASH_BITS   7
@@ -37,6 +38,7 @@ struct lwtunnel_state {
 };
 
 struct lwtunnel_encap_ops {
+	/* encap may lack NLA_F_NESTED, parse it with lwtunnel_nla_parse() */
 	int (*build_state)(struct net *net, struct nlattr *encap,
 			   unsigned int family, const void *cfg,
 			   struct lwtunnel_state **ts,
@@ -53,6 +55,31 @@ struct lwtunnel_encap_ops {
 	struct module *owner;
 };
 
+/**
+ * lwtunnel_nla_parse - parse the attributes nested in an lwtunnel encap
+ * @tb: destination array with maxtype+1 elements
+ * @maxtype: maximum attribute type to be expected
+ * @nla: encap attribute passed to &lwtunnel_encap_ops.build_state, or an
+ *	attribute nested in it
+ * @policy: validation policy
+ * @extack: extended ACK report struct
+ *
+ * The encap attribute, and some of the attributes nested in it, have always
+ * been dumped without NLA_F_NESTED, and userspace such as "ip route restore"
+ * sends a dump back unchanged, so the flag cannot be required on @nla.
+ * The attributes nested in @nla are still validated strictly.
+ *
+ * Return: 0 on success or a negative error code.
+ */
+static inline int lwtunnel_nla_parse(struct nlattr *tb[], int maxtype,
+				     const struct nlattr *nla,
+				     const struct nla_policy *policy,
+				     struct netlink_ext_ack *extack)
+{
+	return nla_parse(tb, maxtype, nla_data(nla), nla_len(nla), policy,
+			 extack);
+}
+
 #ifdef CONFIG_LWTUNNEL
 
 DECLARE_STATIC_KEY_FALSE(nf_hooks_lwtunnel_enabled);
diff --git a/net/ipv6/ioam6_iptunnel.c b/net/ipv6/ioam6_iptunnel.c
index cfb2c41634a0..946c360ff214 100644
--- a/net/ipv6/ioam6_iptunnel.c
+++ b/net/ipv6/ioam6_iptunnel.c
@@ -113,8 +113,8 @@ static int ioam6_build_state(struct net *net, struct nlattr *nla,
 	if (family != AF_INET6)
 		return -EINVAL;
 
-	err = nla_parse_nested(tb, IOAM6_IPTUNNEL_MAX, nla,
-			       ioam6_iptunnel_policy, extack);
+	err = lwtunnel_nla_parse(tb, IOAM6_IPTUNNEL_MAX, nla,
+				 ioam6_iptunnel_policy, extack);
 	if (err < 0)
 		return err;
 
diff --git a/net/ipv6/rpl_iptunnel.c b/net/ipv6/rpl_iptunnel.c
index 4e10adcd70e8..1861af408bbc 100644
--- a/net/ipv6/rpl_iptunnel.c
+++ b/net/ipv6/rpl_iptunnel.c
@@ -78,8 +78,8 @@ static int rpl_build_state(struct net *net, struct nlattr *nla,
 	if (family != AF_INET6)
 		return -EINVAL;
 
-	err = nla_parse_nested(tb, RPL_IPTUNNEL_MAX, nla,
-			       rpl_iptunnel_policy, extack);
+	err = lwtunnel_nla_parse(tb, RPL_IPTUNNEL_MAX, nla,
+				 rpl_iptunnel_policy, extack);
 	if (err < 0)
 		return err;
 

-- 
2.50.1

