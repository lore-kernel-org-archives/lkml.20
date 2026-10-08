Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C568E1F2B8D
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 01:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791422048; cv=none; b=o6NTZ4YW8Z0iDQYQRdbDC2hQjO79hLd7R3GlY6F/1eIRW0p4jqhhGdB6/KU0lVXFBOuJt05/DCz/D+IwQ3nS4K1rhjjVT/s7D6UR7rw1OE7t58Aj0IWLlb5MWcy3zSB7qqRdx5oMrC1mOUlhU0YrpEN+Kbz4e2Ez+URs1fBGlWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791422048; c=relaxed/simple;
	bh=bextlbdLEL1x7OK1WA/qkO4fVbrMdsVFqmmkNDgwT10=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EBcrdBT4QJmAQ7+71ih/Tc76I/eLOOZQasjVXVG1kZpK+UEfq2s58NoALzQRrGT11mKnBSzMvqgLy5D9c7BpEuhn5ec8sL3L52QzmuLtfwW1enTPewPLTvrungVMn4s6dgAbLxaj4SYiGkfwonDE8b1KS1U78J9STNnWo3Vq8Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=YnJbNBJn; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="YnJbNBJn"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7f48c750afcso3191559a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 18:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1791422045; x=1792026845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K7dN6q1DVq+JBc4NWV9L91mIrstCqQxMk6a5w1N4MMM=;
        b=YnJbNBJnymd8pDJP+zkyB1YSMU1DYLba+9QgtaIP8kEBqY0FJNHjPA3/g8bHVoUtzv
         0f/mrHZjLVcE4+3+aV1+6OUdNeL9FZpEV4VZdmrtA+8S6CKMuQptdkka3BmvuNQ2P0jZ
         NiDaXXsPwoMp2iHA97FZEIjoPOOhs4yX6Qm64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791422045; x=1792026845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K7dN6q1DVq+JBc4NWV9L91mIrstCqQxMk6a5w1N4MMM=;
        b=2cS4I1uFpxWIQeYz1VQJpIVuFSGRyr/WPtC0F0YdCJj2cYreY/IMUWgeAfss/Iav76
         PyAuDdZytRDa2Yg0ikVsvcw96FE8ddftZkEVMDsyNruYdzJHem+anyPJAbffW6kWPBam
         edAcuQpEm1gngJA3EaFy11JUFycU4wbrS/yZcwufK/Y1dvDW7kdPZsSNk1+gGKORVB0k
         aas3mQddxXBzfTo3GU0KfkwRDCC8Z/K0mRQagMRA6irV181BUGXHTSufvAmOij7tFPUr
         RXSb9rueK/3BsbFX418lL29/bNOxB2Y4whkSPPgs+eZnN7OLgGEiowUYCA2TG96Wgg3l
         uSpQ==
X-Gm-Message-State: AFuF++nYcxVC5igqTKOxMOdM/sCFAqGcilecf9WI5Uu07wWJNvL1GKC9
	8JkiB+SpJJZwdQqN7f5/4fvcpEWT/hl7XPVnwPm9lBlkqAPC3YtiSYk5oucFLLXqQNA=
X-Gm-Gg: AYBFou3hHx7jAe1wGgsdE5JAB3CKqMaJzliC4DbyX64FcH5TEHlCZdxjrcvyxWdLcin
	y9VPxXMcvqCVa7vlSpcjZda3qIvvGCX/qsAIJdhd02uMSsICfQPi1o/ywx/+oCav7Q/1YLh0DmI
	bMBYUw+ZMcbwT9gEesYDCRFrytZtXXZ9K138Lg+R//0o7Z/11R8EP4RApFzJovoM8etaHHMyvrz
	P8vR3+DAG1bixsqtYlQY0Cy0BE/DFZvM149clDEutyR01vvmpTiXB5oSmAg8FzaCQPnc63BOkc/
	oD9GkSwaXxGD/Te43skBWrza8icRj25HZnjWX7vJwgv2m4dPx6YHaxpvZoPVVJi7s/8F7+3CerT
	VenYRGZ572oTj/FQFKkhHu1T0v4MwPzuFadJ+KJ2Qb9Haz+Lw2KEbmb+eqSBDBErYniprTw0lUN
	Ng+ei1z7wyJ1z8SDXsETd8Pytb2c+jv4yady2BPRD7TJB09gqN56NJbPv7hhxwHml8xjwJsrWeX
	M8s4CR7f+37jEPy3Bx1gOJapo2r5WnPkPeLR+GD0Jt978dO+hNs4klbevZ9BpEInvWuXLNpipF7
	lqk1zYKQGA==
X-Received: by 2002:a05:6830:82be:b0:81b:8032:716d with SMTP id 46e09a7af769-82acf9ac9c4mr5132412a34.20.1791422045501;
        Wed, 07 Oct 2026 18:14:05 -0700 (PDT)
Received: from com-75606.corp.openai.org ([199.47.143.7])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82adbdf42f1sm5179099a34.8.2026.10.07.18.14.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 07 Oct 2026 18:14:05 -0700 (PDT)
From: Kyle Zeng <kylebot@openai.com>
To: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	outbounddisclosures@openai.com,
	Kyle Zeng <kylebot@openai.com>
Subject: [PATCH net v2] netlink: avoid hashing the network namespace pointer
Date: Wed,  7 Oct 2026 18:14:00 -0700
Message-ID: <20261008011359.63727-2-kylebot@openai.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The netlink rhashtable key includes a raw struct net pointer and a
user-controlled port ID. Both /proc/net/netlink and socket diagnostics
expose the table's bucket order. By binding and rebinding chosen
NETLINK_USERSOCK port IDs, an unprivileged reader can distinguish equal
buckets and recover the low bits of the Jenkins hash. Its 32-bit seed
and the limited set of kernel-image slides can then be searched offline
to recover the address of init_net.

Use the namespace's unique, non-address net_cookie in the comparison
key instead. It is assigned before the per-net initializers run and
remains unchanged for the namespace's lifetime. The lookup key and
object hash are still built by netlink_compare_arg_init(), keeping
lookup, insertion, removal and rehashing consistent while preserving
namespace separation. Neither public table walker needs to change.

Reading the socket's namespace cookie in netlink_compare() is safe
under RCU, including during namespace teardown. netlink_release()
removes the socket from the hash table and defers its final put with
call_rcu(). cleanup_net() runs the per-net exit methods and waits for
outstanding RCU callbacks with rcu_barrier() before freeing namespace
storage.

Unlike ns.ns_id, net_cookie is also available and initialized during
setup_net() in older stable kernels, making the change straightforward
to backport to v5.15 and later.

Fixes: c428ecd1a21f ("netlink: Move namespace into hash key")
Assisted-by: LLM
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---

Changes in v2:
- Use net_cookie for compatibility with older stable kernels.
- Name the key field net_cookie to avoid confusion with netns IDs.
- Explain the RCU lifetime of the socket and network namespace.

 net/netlink/af_netlink.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/netlink/af_netlink.c b/net/netlink/af_netlink.c
index 9fdf964224ab..39db078c925c 100644
--- a/net/netlink/af_netlink.c
+++ b/net/netlink/af_netlink.c
@@ -464,7 +464,7 @@ netlink_unlock_table(void)
 
 struct netlink_compare_arg
 {
-	possible_net_t pnet;
+	u64 net_cookie;
 	u32 portid;
 };
 
@@ -479,14 +479,14 @@ static inline int netlink_compare(struct rhashtable_compare_arg *arg,
 	const struct netlink_sock *nlk = ptr;
 
 	return nlk->portid != x->portid ||
-	       !net_eq(sock_net(&nlk->sk), read_pnet(&x->pnet));
+	       sock_net(&nlk->sk)->net_cookie != x->net_cookie;
 }
 
 static void netlink_compare_arg_init(struct netlink_compare_arg *arg,
 				     struct net *net, u32 portid)
 {
 	memset(arg, 0, sizeof(*arg));
-	write_pnet(&arg->pnet, net);
+	arg->net_cookie = net->net_cookie;
 	arg->portid = portid;
 }
 

base-commit: 602042bf29f6efde39cfb5fdd9289bf4854bc0c5
