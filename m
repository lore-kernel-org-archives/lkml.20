Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7884F3939
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790616194; cv=none; b=Rg+SVUUL+EoXDQ+5iKk4u6bpMAbH9LcS77McbBNHCfhKn0VOOROV8dLmPWRlq1jLLdttH0zm3i5i+CDs4GkdlduaXt1txcB4ObyQ/8+AzEu1EgPPvcSBBXSyj4qxW4boZTVr8uScvCkS4Yp10W/wLhPteBWAa1pvoD+PylF1mpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790616194; c=relaxed/simple;
	bh=lCXyHm+iaIL3bQ9txdLtXflEDH1wllb3V7pgxbd6W7w=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=mV3KQvO/eFAmZmB5M1U5OdxFpP/9UDXLbBun//oWOMIv6RUMOa0Dw8z0rRMB0BfCoiIsQM26s+bVEuG2qQgBWGMJ/yQ4zwseEN0i6jR8GoeXQCm7NHYqBMTP2vBcL9Zpz7OKArOWJFW4HODgYMx61e2nbp01N0p0m9wOzPjNOho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=doyensec.com; spf=pass smtp.mailfrom=doyensec.com; dkim=pass (2048-bit key) header.d=doyensec.com header.i=@doyensec.com header.b=AFNlRC61; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=doyensec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=doyensec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=doyensec.com header.i=@doyensec.com header.b="AFNlRC61"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c2940ef15d3so408594966b.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=doyensec.com; s=google; t=1790616171; x=1791220971; darn=vger.kernel.org;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:content-type:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sx2gaek3RzQGvXZj14sm8lya8hmYE5akZiXZO8UHtHc=;
        b=AFNlRC61IYKycta3I/AyUv0om1YYDS91qiWzotFvEyvlidIshv6Fb/1BBglFvxfCp6
         CZp2dtlPV1AJU/gdh/HFbaE8XDhMvF46Z4YjANHxMZ1BgfMXeIgMP1hJDOPQgMmO9jKZ
         vcXk9+4t78x1fYuRfSa8VXzacmk9h10JMX98IDtx044VCZET9+49ooyNGBBjay80Kn1e
         +rPaKFJwdyk6KfyatvMaNL5OjMe/05rBxW9ncAzKEcuiVOAPXLQIM0PvqGnNIXTrQxom
         xoREPlR9Tyk4G+2xto0XEUdkb5HUJ9EYhL99uFBponUA+b5IDkd8j0rthaANTye3SqkL
         c4Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790616171; x=1791220971;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:content-type:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sx2gaek3RzQGvXZj14sm8lya8hmYE5akZiXZO8UHtHc=;
        b=lf6X39T795rgaf3e5Od71pugkMhSsYEKVob0oXdkKRHW6XbbNAiUBRo6yuH47cDM96
         H5geFDdwDIawSsx05lc5pEv2ZlIczWdCy/0AYfYmNLVc/v/HWjzokMayr8ObEr5u3th9
         67tnqjQZa/7X1CgLSz0vG9GqD6XQY7EenbXiWb3Vpfwyx+bc/5dHtMLX6LNT0/verLZ6
         qK+n7ymwNuYE+CKIraJTLf6qtODFg5tYAUxrcaPkI9BB2jA4+rGYR813hIngj2PRa23G
         2d+AU44SjKBmI6BvgaScinZOOIF19HyAgHMlShSJhhWsn1ESqDM4ra6Txera/rOCI9z8
         mZqg==
X-Forwarded-Encrypted: i=1; AKwUvBx4rCSCBLb5Vao2X/fSHj80ufdYbUWB6dJna++C9lj9grZnRDbKm5wGhtYRJgBYFRzTihB/G+FzVDdJ0Os=@vger.kernel.org
X-Gm-Message-State: AFuF++nj98FG8E/2TOLovkLO/iPAAjFgZjVOkw20jdI35Brt2dlPMRYD
	3WZW5bsqUG3nMSTfICSPSC2rJilZjuSxzmj2qhCqlm+E99YAhVBezU0qlC4HqIyEH2Q=
X-Gm-Gg: AYBFou2MTSV/Udd0X6UiJnpYpAbdwIdZDVK7VcoValGsCHf5j5o+vdcXrnoMZ1jK/8i
	yWSZCZFFLHlb2ChX1qkyyVucU53lqoxLlkxVo3tamB9qa1JdWfk47mFkLN1nM2y4X4jPN0hZd0h
	Sa+MFApY4nahuxbkscVDiGBC9nf+mBlN5RU7BrWobCjDDl+ic6rslo0zjLlz1tk8VDTroxdoqxg
	hJzr8JMXScFaeSISCsF3/lt15voLvOmrLz9Ey88fpH2mYFp+vf/Tn1H03Dfh6lTW+xODRZv1MK3
	2oBD/CNGB7WQbv8p57207Yp8Bl7UK4gfUxNjXO7a76fxTRFPTqfaDGweSU+XTObtoEsQPl6jJrz
	gafWFMhhPatLMRcNFajvguHLjcrShhqPYq/XTMMNRZCpaOKSiTrhaZjPRY36LuI5Md/2JcwVm65
	0FnKqVmksfqv5Zv4xYR5PUJFARCVq7tkgfpriB0nnODzinXlroyelIXENoHlm6xyK6YQbkF4Z1S
	aGrPmm7IaZhjTw9AXycG0db5jEalaVb6UpLNodZm6gvkVdA30dT4Z9iQ/LL9w==
X-Received: by 2002:a17:907:728d:b0:c29:f5d5:5a94 with SMTP id a640c23a62f3a-c2ac23ec0b2mr1066751466b.30.1790616170862;
        Mon, 28 Sep 2026 10:22:50 -0700 (PDT)
Received: from smtpclient.apple (80.49.145.194.ipv4.supernova.orange.pl. [80.49.145.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2dc8b71b4dsm275758466b.1.2026.09.28.10.22.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Sep 2026 10:22:50 -0700 (PDT)
From: Norbert Szetei <norbert@doyensec.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: [PATCH net] soreuseport: Fix use-after-free when a socket is added to
 socks[] twice
Message-Id: <6E4F8645-9453-45F1-B068-52E1B14E8B0C@doyensec.com>
Date: Mon, 28 Sep 2026 19:22:38 +0200
Cc: Eric Dumazet <edumazet@kernel.org>,
 Kuniyuki Iwashima <kuniyu@google.com>,
 Paolo Abeni <pabeni@redhat.com>,
 Willem de Bruijn <willemb@google.com>,
 "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 Daniel Borkmann <daniel@iogearbox.net>,
 linux-kernel@vger.kernel.org
To: netdev@vger.kernel.org
X-Mailer: Apple Mail (2.3864.700.51.1.1)

reuseport_stop_listen_sock() moves a shutdown()ed listener from the
listening section of reuse->socks[] to the closed section: it removes =
the
socket with __reuseport_detach_sock() and adds it back with
__reuseport_add_closed_sock(). The return value of the removal is
discarded and the add runs unconditionally.

The socket need not be in the listening section. inet_unhash() calls
reuseport_stop_listen_sock() for a listener whenever sk->sk_reuseport_cb
is set, but inet_hash() enters the reuseport path only when
sk->sk_reuseport is set, and SO_REUSEPORT can be cleared in any state.
Clearing it between shutdown() and listen() makes that listen() skip
reuseport_add_sock(), and with it reuseport_resurrect(), so the socket =
is
hashed as a listener while it is still in the closed section. On the =
next
shutdown() __reuseport_detach_sock() does not find it in the listening
section, returns false, and __reuseport_add_closed_sock() adds a second
copy of it to socks[].

sk_destruct() calls reuseport_detach_sock(), which removes one of the =
two
entries. reuseport_grow() then dereferences the other one, because its
loop runs over every slot up to reuse->max_socks:

  BUG: KASAN: slab-use-after-free in reuseport_grow =
(net/core/sock_reuseport.c:291)
  Write of size 8 at addr ffff888132359988 by task poc/621

   reuseport_grow (net/core/sock_reuseport.c:291)
   reuseport_add_sock (net/core/sock_reuseport.c:350)
   inet_hash (net/ipv4/inet_hashtables.c:810)
   inet_csk_listen_start (net/ipv4/inet_connection_sock.c:1359)
   __inet_listen_sk (net/ipv4/af_inet.c:225)
   inet_listen (net/ipv4/af_inet.c:247)
   __sys_listen (net/socket.c:2014)

  Allocated by task 621:
   sk_prot_alloc (net/core/sock.c:2246)
   sk_alloc (net/core/sock.c:2308)
   inet_create (net/ipv4/af_inet.c:333)

  Freed by task 0:
   slab_free_after_rcu_debug (mm/slub.c:6570)
   rcu_core (kernel/rcu/tree.c:2919)

  The buggy address is located 904 bytes inside of
   freed 2624-byte region [ffff888132359600, ffff88813235a040)

Only move the socket to the closed section when =
__reuseport_detach_sock()
reports that it was removed from the listening section.

Fixes: 333bb73f620e ("tcp: Keep TCP_CLOSE sockets in the reuseport =
group.")
Assisted-by: LLM
Signed-off-by: Norbert Szetei <norbert@doyensec.com>
---
 net/core/sock_reuseport.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/core/sock_reuseport.c b/net/core/sock_reuseport.c
index 29948cb44b7d..031b641be317 100644
--- a/net/core/sock_reuseport.c
+++ b/net/core/sock_reuseport.c
@@ -479,8 +479,8 @@ void reuseport_stop_listen_sock(struct sock *sk)
 			 */
 			bpf_sk_reuseport_detach(sk);
=20
-			__reuseport_detach_sock(sk, reuse);
-			__reuseport_add_closed_sock(sk, reuse);
+			if (__reuseport_detach_sock(sk, reuse))
+				__reuseport_add_closed_sock(sk, reuse);
=20
 			spin_unlock_bh(&reuseport_lock);
 			return;
--=20
2.55.0

