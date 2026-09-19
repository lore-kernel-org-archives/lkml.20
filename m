Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05785393DC0
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789854763; cv=none; b=i8L0NivQ94wSbL1LzFa8nlLLarsG6G2+8i1pJwUJInw/x2e6y3vcWpBIlHaOWqKN3EUSrXpiO4gQuBg50iDnguIUCM4Uy7UkX/QnKPfnwc2xA27dMmbh1QU1Vjv1+CrprlflDkj/O/Vh5M0miS6urdoYUzS8S5lAyExRcTd0eSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789854763; c=relaxed/simple;
	bh=4xTEqjENj8W0AbFeRvCf4WTp2q0CqRG4Z36EfYgUrtw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NEDZNuNed+GrsB17VBmNhPajW8DT33ORIMxRGwGB3OPePnpzAtMWXP4GRRg7ybK+YnfFgrDmVPwtOUJLlMy4FINMsDQGf9N8ZtWQC79VkVsFPWbtbRldALtME/kMdpO3aVCCAi69H+g5HC2BAP+Z7UKM9iqyYKrpfNFLUVdy7zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SitnLXH7; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SitnLXH7"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b350c69b4so1640060a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789854756; x=1790459556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=964xTJiqd48XXXm2a84vCQd27k8HJCQdSNXcIUxtnYc=;
        b=SitnLXH7Ct76/pDoXWbVLauz0Evy4s6I3nvUnQZZfNV1BRWmjYLjM5HU40crPwME63
         iimqiMi0XxkEElcVSoz/d7/WyWIkeO3j+iq8q3yFp2U5+K2r6EtyqjBxPU+0U3fSuY+k
         frNoi43ood7y6dR1BfEQtNhMFxTnuU0bHrJOwRZrGL02jTTu9DArquKM6IWbhEJr/umo
         5Sh3kmD7yXU0raEMn4zKD4ayLvaruzr/+ONOf1dL0nHspCt+YT0y2uwz2VBWFppoQvGi
         Gr4BM/ykaVREDIfjD8j6kkUTGFDF6RO//WrOoAQtBr8BBcy4V3FWsBmUO7izmwmdeBlT
         Uc4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789854756; x=1790459556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=964xTJiqd48XXXm2a84vCQd27k8HJCQdSNXcIUxtnYc=;
        b=Bx/7c1HLOB2/A0SEksDwz/rlwESeJdccx4cmTfc4cVeTR3pfeLJ0s5W9G3W3Hox3CW
         JDlvC6oqJRdopUcV3Y6jDNmbGxhKGJRKbswkLgMylD6/GUchvij0nT2HU1unx+zaKojj
         GkKtIdjHY/686xegv1kTqljc536LTWyKJDxOM0AEu30mRX8NiTLs4+bitgN8ILiKt6Tb
         9VZ/LY6x9F0bcnJMYJ2+uqKTJhC9UsVymyhF1qRvyDZWEkgpnpu6GwRPuUYEQiHTNTOj
         Jv1tX2jxqp6lZ6Qh+3tH5AJNcfExfIIF9yGQ1EuyP3GwLKvdofgJALN7yS6YcNNVkSvQ
         hiXw==
X-Forwarded-Encrypted: i=1; AKwUvBzPodaTCT8GB/W6Px55jA/zai1WVZl7L0a4IfaRtuNbWdgm3AmUy3tSp+/HD5Pb+/OUeaoMFIvo4Sn5dp0=@vger.kernel.org
X-Gm-Message-State: AFuF++naTkNWiJ8DSZzY/JXphVjhb8TPW+SL8NNnpZtIj7vxvN7p0J9G
	1Z+DKhd+gG3xf2H/8dqpn6FGvM2gkbzHSLwUlTiqe0xoUgQAPwa6vwm7
X-Gm-Gg: AYBFou1hQrqIJUUE5iZvUMPMzIA22pWYKUBaI30DGmlV17BT5pepzycyaz2VcqGWnQ3
	WKcUJP5/s/Qwh4W90/lEF2ei4mM6DmIbue2Soauh+aRIzDj3enj2KWTk/my5XdlpjSwJ9JabQk7
	fbuoafMsblIDM1cShvwsD1XtdM9ExP6Qz7sm/YgJi3UtfSNsz5NgpvIARkmiAUcYiVJrom27rJg
	6zfopPCLzU9O7MxJmh8TwTzT0ueqjzMVx4QZ95AIeTBnavMNTol9eUid7UDrOF2DxHtmuXKRkHv
	0axQHS41dgbb9Z3X4TiC0scTaEQVrBnfFYn+lqpIe5y6w5kHq1U61p/iM/hNumNrbyBp/AYXzK6
	kCuDivetO8SslXvet3NkqBo3ZxZ827vQvthBSlD+tcqjC3B1iLSkPWfW5XH8JyWD3yxiXE753NV
	eucL985t86vDZbSln1ixso3Hq9DZhA2fpt/XQnT/xaCEvflARTBDu7jEl4BZwOP+qv5QfbfK2cw
	x7INN9q+vspYFnRTtTogA1AqwjxJyWNULhe5duTctaNYstS+vZWEBCnGfGEbAqA7ZD20z6lTkIa
	FxBSlupwsA==
X-Received: by 2002:a17:90a:602:b0:39e:6c6a:657f with SMTP id 98e67ed59e1d1-39e6c6a67edmr3341928a91.66.1789854755924;
        Sat, 19 Sep 2026 14:52:35 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0320b6ad5sm621499a91.0.2026.09.19.14.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 14:52:35 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: edumazet@google.com,
	ncardwell@google.com,
	kuniyu@google.com,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ipv6: tcp: restore ipv6_specific icsk_af_ops when reconnecting IPv6 after v4-mapped
Date: Sat, 19 Sep 2026 21:52:34 +0000
Message-ID: <20260919215234.3470646-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When an AF_INET6 TCP socket connects to an IPv4-mapped IPv6 address
(::ffff:a.b.c.d), tcp_v6_connect() switches icsk->icsk_af_ops to
&ipv6_mapped, sk->sk_backlog_rcv to tcp_v4_do_rcv, and tp->af_specific to
&tcp_sock_ipv4_specific. If the connection fails or is disconnected with
AF_UNSPEC and the socket subsequently connects to a native IPv6 address,
tcp_v6_connect() leaves icsk_af_ops set to &ipv6_mapped, causing IPv4
operations (such as ip_queue_xmit() and IPv4 setsockopt handlers) to run on
an IPv6 flow and corrupt the socket/routing state.

Restore icsk_af_ops to &ipv6_specific, sk_backlog_rcv to tcp_v6_do_rcv,
tp->af_specific to &tcp_sock_ipv6_specific, and notify MPTCP when
tcp_v6_connect() connects to a native IPv6 destination after ipv6_mapped.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Fixes: 31484d56ca95 ("mptcp: Fix undefined mptcp_handle_ipv6_mapped for modular IPV6")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/net/ipv6/tcp_ipv6.c b/net/ipv6/tcp_ipv6.c
index 7fa4ed2fd4f1..49a6f89481cb 100644
--- a/net/ipv6/tcp_ipv6.c
+++ b/net/ipv6/tcp_ipv6.c
@@ -255,6 +255,17 @@ static int tcp_v6_connect(struct sock *sk, struct sockaddr_unsized *uaddr,
 		return err;
 	}
 
+	if (icsk->icsk_af_ops == &ipv6_mapped) {
+		/* Paired with READ_ONCE() in tcp_(get|set)sockopt() */
+		WRITE_ONCE(icsk->icsk_af_ops, &ipv6_specific);
+		if (sk_is_mptcp(sk))
+			mptcpv6_handle_mapped(sk, false);
+		sk->sk_backlog_rcv = tcp_v6_do_rcv;
+#if defined(CONFIG_TCP_MD5SIG) || defined(CONFIG_TCP_AO)
+		tp->af_specific = &tcp_sock_ipv6_specific;
+#endif
+	}
+
 	if (!ipv6_addr_any(&sk->sk_v6_rcv_saddr))
 		saddr = &sk->sk_v6_rcv_saddr;
 
