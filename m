Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922AA3164C7
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 22:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894463; cv=none; b=ANXAS6u0CwUmOz6ycWD2vipeJp12bedFD37sE/kYu1gXJLjXvjLoqldG8mHnXd+g2KpNq0obTM5yW0K9zWl9rQcdwXiGmA6mkReVEKHnkJtr9TSfk8Uc2y66cYmf9D/KcV+zKxSFvjjHjTYalfkBRQtX31XhccHKc1XQG2Tn4Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894463; c=relaxed/simple;
	bh=fjDLJXf1aBRrmidaC6jhH7WSJg2DvCL/+cPSF0ggzWc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=LrVsNk6lLNm8jdJLJQ+8ulkTVJ25KhOCS1H9B8BTRKFuCsimT+6TR33mb/YWBKQgZrorHwN/QCUo0mMA76RK7w/37bWpfbCGjYcswDt0nAYcS+g59VNDNSGxbXi2BLPuf3bbrHAF2sgXv5n+eCoiv3g7Q8cX6JPPvBossnVYBcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kaifengw.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WtVw6cwf; arc=none smtp.client-ip=74.125.82.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kaifengw.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WtVw6cwf"
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso5464180eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 15:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790894460; x=1791499260; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9IdYN9g8a9lzzHIhtoJFBJ2axTedpkyHbETAT+gfXfQ=;
        b=WtVw6cwfE/NJY0c742R84MAG/+OZxR0GVUPV9BIEUTfLtdT4jZHV7Ai5+3I+BNKcAe
         CpCLWLNG8369PsoUfDap5C2N0tQu6Za/WvM+itMioycF2y6Pf7H5nO43YzVPQdJmVwYD
         Ycf7YCsKAMjqc9f/rOuRoJfrrz/LBOJ7bgjNHUOXDmj7gS+2c4wIweR+XjazUFKWyS/Z
         qrKswlcMOeG+RbgnwdCyKqg8W0j5FRg+i4fFmIB2a3iqRf4s9ZzmubxMpsSvUYT1t6kv
         /7Ev5Dcmq0KN/wWG7muMVHsSFGnzZTbhTAS4HqgbRECYM/bqok9QG8g7oLn8uxiGVcIA
         619g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790894460; x=1791499260;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9IdYN9g8a9lzzHIhtoJFBJ2axTedpkyHbETAT+gfXfQ=;
        b=A2A8sGkXKxGWXxG7teJQkaDprxY329CL8vCjVvSzt1kE31eBz15rHoZ/mHO/npx1Hi
         ab3qQQ91jVevJz9jxdIOPt5x9zpyDEEDhr/gNoYhWjq3p/X6vDm0jfr2bHnjdbM5ewxD
         c93XCXB+4qeH6Q4ZJwmXPF2iHsUKKn/zLjmEsihmOSLxrP2X5uM5kTx6URiyuVfhwuNH
         Yg4wgaoO+EjoTv7TEOpYn2eqEm/pHQhPyD+9nnqw0rQ12ZGMZaYR9A4VCQZqXV0INAjW
         DtGdcS5VdyNXW252qy4rnu4jTp5QRq63uV8ITPxGEce9fIfad332wbd7ov138yVPAXAh
         7JsA==
X-Forwarded-Encrypted: i=1; AKwUvBztb8IVUpGj7NqezAI4x+h7Bz0CxiJcdtqDhSEcteuzl1FJKHvw0y8+nfE1C1ybkPwc3L5Ax2JejriBAjI=@vger.kernel.org
X-Gm-Message-State: AFuF++lmpM8vPVVlsIIBvOgFZyd8MsVkYk+lqdGp8aP6OBrPWEk2pMaR
	1LnslchxFIlFx2FlMPgFDCewv4ZSdqThoknnyQomnpCfwp9LsM7ne9WY69q4IWKOSCO9cfglgaK
	j9aJGckjI3BdY8Q==
X-Received: from dlev27.prod.google.com ([2002:a05:701b:465b:b0:14f:4bfa:b7da])
 (user=kaifengw job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7023:88d:b0:144:e246:a0b2 with SMTP id a92af1059eb24-14f5d6b6427mr805233c88.44.1790894459517;
 Thu, 01 Oct 2026 15:40:59 -0700 (PDT)
Date: Thu,  1 Oct 2026 22:40:54 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001224054.1525365-1-kaifengw@google.com>
Subject: [PATCH net-next v2] net: devmem: use page_pool_put_netmem_bulk
From: Kaifeng Wang <kaifengw@google.com>
To: netdev@vger.kernel.org
Cc: almasrymina@google.com, edumazet@google.com, kuniyu@google.com, 
	pabeni@redhat.com, willemb@google.com, davem@davemloft.net, kuba@kernel.org, 
	horms@kernel.org, sdf@fomichev.me, linux-kernel@vger.kernel.org, 
	Kaifeng Wang <kaifengw@google.com>
Content-Type: text/plain; charset="UTF-8"

Instead of looping over napi_pp_put_page() and repeatedly acquiring the
page_pool producer lock in sock_devmem_dontneed(), use
page_pool_put_netmem_bulk() to return the netmem references in batches.

This reduces the number of lock acquisitions on the page pool ring
producer lock when releasing user tokens.

Reviewed-by: Mina Almasry <almasrymina@google.com>
Acked-by: Stanislav Fomichev <sdf@fomichev.me>
Signed-off-by: Kaifeng Wang <kaifengw@google.com>
---
v1 -> v2:
- Rebased on net-next after commit bdea4980182e ("net: page_pool: fix
  use-after-free in page_pool_recycle_ring_bulk()") was merged.
- Collected Acked-by: Stanislav Fomichev.

 net/core/sock.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/net/core/sock.c b/net/core/sock.c
index 972c72c5bcc6..157759e7e362 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -129,6 +129,7 @@
 #include <net/request_sock.h>
 #include <net/sock.h>
 #include <net/proto_memory.h>
+#include <net/page_pool/types.h>
 #include <linux/net_tstamp.h>
 #include <net/xfrm.h>
 #include <linux/ipsec.h>
@@ -1086,7 +1087,7 @@ static int sock_reserve_memory(struct sock *sk, int bytes)
 static noinline_for_stack int
 sock_devmem_dontneed(struct sock *sk, sockptr_t optval, unsigned int optlen)
 {
-	unsigned int num_tokens, i, j, k, netmem_num = 0;
+	unsigned int num_tokens, i, j, netmem_num = 0;
 	struct dmabuf_token *tokens;
 	int ret = 0, num_frags = 0;
 	netmem_ref netmems[16];
@@ -1123,8 +1124,7 @@ sock_devmem_dontneed(struct sock *sk, sockptr_t optval, unsigned int optlen)
 			netmems[netmem_num++] = netmem;
 			if (netmem_num == ARRAY_SIZE(netmems)) {
 				xa_unlock_bh(&sk->sk_user_frags);
-				for (k = 0; k < netmem_num; k++)
-					WARN_ON_ONCE(!napi_pp_put_page(netmems[k]));
+				page_pool_put_netmem_bulk(netmems, ARRAY_SIZE(netmems));
 				netmem_num = 0;
 				xa_lock_bh(&sk->sk_user_frags);
 			}
@@ -1134,8 +1134,7 @@ sock_devmem_dontneed(struct sock *sk, sockptr_t optval, unsigned int optlen)
 
 frag_limit_reached:
 	xa_unlock_bh(&sk->sk_user_frags);
-	for (k = 0; k < netmem_num; k++)
-		WARN_ON_ONCE(!napi_pp_put_page(netmems[k]));
+	page_pool_put_netmem_bulk(netmems, netmem_num);
 
 	kvfree(tokens);
 	return ret;
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

