Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B823C8C7D
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 22:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326533; cv=none; b=Wf5qc15oCPu3GoRHlcOn9HIldID76H6ONFFuVDzobTsbQPS6O2JRxMf9ES5xSBO54omw1budIP4Evxq1lFVcPSwrnPA+HRgI2lkUDifrIWAgHlSazd+KgnlcPV5cjkiPbZEp/Yih0c1TyshtXNJo1zW4RUafO22a0MQIrOrxolQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326533; c=relaxed/simple;
	bh=tF6woHDg7ileDh3Mif219tJ3RB98MgJB4BX/8WlRgJI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a2cI3nMttrNJZCOKY95ivfUDs8Q6mhpPdO1uEcZHzrxnF+hKV5Ef3U6Oo5oOSbYOPj0w4KU6mtVdb20O3CuGm0TfdjW6KfVzvcRGyzmIWA2kj0cdgiWLX0TFKONSGbWoa+LYCeFbpl05VUoEnCaVRPGxx85kgKGn4l0Wa4PEZHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=a94SS9gz; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="a94SS9gz"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4f6d98ff6c7so2096827b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 15:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1791326513; x=1791931313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q6XYGdL3I+tAtmV9WIKjy0bqKE9rScVO4aiYLXZi1NI=;
        b=a94SS9gzY5MYPsrD2UoBiJhZ0ceVEJliSgTQkMo1XdQO4M0EgwDG5XnNjQ896pZiBr
         a/zjE9liTxI8Ttsj16f0N6XuLzfvSVM6M1ladfFmJd6oj0rEGoY5MdOhLIAb70dsj22U
         ZM8jZULE1IXK57J/wD6l1+z4OXm0A3u8qUst0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326513; x=1791931313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q6XYGdL3I+tAtmV9WIKjy0bqKE9rScVO4aiYLXZi1NI=;
        b=TN5dK9ZY9q6n+OsA88c2w2/KkIIqlIQFSKy1UIuUOPjT+SBoNlUJfooJZF9kAg6zym
         QiXFnPai+1yX3JocS/x+BHvGnhwHHROOsBw38BSweFN1Y6pTWT9BsnO7/s2ef9TppUm2
         qQJ1EYODUY4tOX4OjxVXc+T6pNWAHbvRdEKJGiW4fJtSSdLlFUs/NROu9PHinSQmcjyI
         l3b/sDTVYVA9ykLwIlS+T2Zyyx1rBv7a2tVk3jFBwSu3qLDTYlXGKsZ+yq9NR0dnB/2F
         0tcXImb0vRKxWcGcy/yFDmRGN/miiQALbbFUU30PQt7q7dJBzE9Rfa86NXVliVK3i2DV
         pEVw==
X-Gm-Message-State: AFuF++mwhSDk8AT+j7NrcIRkmc3qguad5TgCMX3C5sj6vkYmyDWI1e+2
	pTwbtg0TLAG6AsGvk0T3gwNtZ6jMsG/HecXqv6i6eOYulfQrTBGuab5UrNM+9MsjmFY=
X-Gm-Gg: AYBFou2ei2i/fBGLgzhDn/vx5VQV4JFFsO4aoA0t83v+yzapCY3ExikQy1uAqGDuV0f
	GYy9ZXlPVJLpzNVx0f8ppoX4D81jX2HzSOcHgIK1pPjOKhJkIvap+lJnbx2YaKZ+dbf+xC41Nsg
	fl8Eua5g1/q1aunYdXE1W1i7oEuExIOezJdwmJdRCc1QUW7fohHTHcU29Wd+Jkk/tZb3uyAylZm
	z7k+qixastvfERPM2f6bswnID4vPgdWzOx5p4EtaHTVDx4vDWe5R1kd9f34N/+RTFKgA/WCRjRC
	KghCnCWHvCDywqXxky4KYL4jPOyf399hlqTSpKfaexqr1AxRHpxIlB1ZNw1rAmrQ+HrJA4L9xP8
	7IqgZbJlPaIsTlQYbxIRL/RmaWPTxkckL3dx280ikWm/3wGVV/LtYo8tSXs41LhTsuC1gbM6ytj
	KiUe0HpDcckFpyK8CJhu66edQvgP556ETYlMdGYgXXNtGdU0AEFrZoBcwGB1/9jOSyNylGxibMr
	+qmRDUcgELN8I3tJh+TIVCi0IFHTm12qiYvpuU9uWRtQAL1EHxbkuEifcRkcu6s9+X0xISR5eM=
X-Received: by 2002:a05:6808:16a1:b0:4f1:c824:fd06 with SMTP id 5614622812f47-4fc46984c21mr760312b6e.14.1791326513041;
        Tue, 06 Oct 2026 15:41:53 -0700 (PDT)
Received: from com-75606.corp.openai.org ([199.47.143.7])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4fc49656fbfsm655946b6e.15.2026.10.06.15.41.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 06 Oct 2026 15:41:52 -0700 (PDT)
From: Kyle Zeng <kylebot@openai.com>
To: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	outbounddisclosures@openai.com,
	Kyle Zeng <kylebot@openai.com>
Subject: [PATCH net] netlink: avoid hashing the network namespace pointer
Date: Tue,  6 Oct 2026 15:41:49 -0700
Message-ID: <20261006224149.50498-1-kylebot@openai.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The netlink rhashtable key includes a raw struct net pointer and a
user-controlled port ID.  Both /proc/net/netlink and socket diagnostics
expose the table's bucket order.  By binding and rebinding chosen
NETLINK_USERSOCK port IDs, an unprivileged reader can distinguish equal
buckets and recover the low bits of the Jenkins hash.  Its 32-bit seed
and the limited set of kernel-image slides can then be searched offline
to recover the address of init_net.

Use the namespace's unique, non-address ID in the comparison key
instead.  This ID is assigned before the per-net initializers run and
remains unchanged for the namespace's lifetime.  The lookup key and
object hash are still built by netlink_compare_arg_init(), keeping
lookup, insertion, removal and rehashing consistent while preserving
namespace separation.  Neither public table walker needs to change.

Fixes: c428ecd1a21f ("netlink: Move namespace into hash key")
Assisted-by: Codex:gpt-6-astra
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
 net/netlink/af_netlink.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/netlink/af_netlink.c b/net/netlink/af_netlink.c
index 9fdf964224ab..e62bb67b78b0 100644
--- a/net/netlink/af_netlink.c
+++ b/net/netlink/af_netlink.c
@@ -464,7 +464,7 @@ netlink_unlock_table(void)
 
 struct netlink_compare_arg
 {
-	possible_net_t pnet;
+	u64 netns_id;
 	u32 portid;
 };
 
@@ -479,14 +479,14 @@ static inline int netlink_compare(struct rhashtable_compare_arg *arg,
 	const struct netlink_sock *nlk = ptr;
 
 	return nlk->portid != x->portid ||
-	       !net_eq(sock_net(&nlk->sk), read_pnet(&x->pnet));
+	       sock_net(&nlk->sk)->ns.ns_id != x->netns_id;
 }
 
 static void netlink_compare_arg_init(struct netlink_compare_arg *arg,
 				     struct net *net, u32 portid)
 {
 	memset(arg, 0, sizeof(*arg));
-	write_pnet(&arg->pnet, net);
+	arg->netns_id = net->ns.ns_id;
 	arg->portid = portid;
 }
 

base-commit: fd179f8a05be3ccae366b9b96e176b51fbe54aab
