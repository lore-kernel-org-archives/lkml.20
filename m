Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793334179;
	b=s9QvaE3S50xnNsfaviYFQQWRhEIMwY2/7/SlYLT0B+XHs2DTbN/SA6skTkDfhpZuOEhy
	 jjrxQeOsJUHOS9hOVQTXW3bv4akIMF8eUHJK2YeW50GOJDAz0l60VPkk15D7MvlFoKO0e
	 ToU6feO1ggDKnWnhEuzleeYkL2arPyj2r8vxWu1kiMXNuifOPqo6MkpAwH33iXGSv6i9d
	 oqP3KQIQX7tFAuaJ6iUyCQUfEIWxx8tSk9Vq9EmHT/LShSRlniyzT2NLhwg4Nf/ytC50X
	 AV5BrWcocp5fHrhntIy84q8cP834ma/PnmtepINxfPsvjmrBuCj45IJJtuNUWk5feWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793334179;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GJHR2hSEQjDA7JEPW4kRvNrUrFju1iQ8fE/qcrxDnx4=;
	b=ifAzxE9dDFLHzWVetsjgj1UTgBukLDA4E4airW57Ma3LU++DpRH8CM/kV8NMHqB7tOYv
	 sfhgFsk5PIAR4cRErE6oZSMNOkx++zlkG2SNlO85EuXTfAkIBvd3xpnZuWnVTLSdwFx3y
	 KtIf418CWSVe+ARBOUVOOaZgXEZGNC094YxHTdXPtoi6EMCRBAHH03v5LUibRlPtqTBle
	 CD/SprwLJVfK2TbwfX6++ie7nVtgDuZlyUoFevR3XmQAukhfjOLt5clpsAUP89wFZ48iL
	 BWDclqZApVxBM80O2X/9ZjtKIgL3CvtbgJ63QNKl/hy7v2tEOf7cpEuejQWr1nUIZBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openai.com;
	spf=pass smtp.mailfrom=openai.com;
	dkim=pass header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=bbdaf1Oz;
	arc=none smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F4E606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:22:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82F4E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=bbdaf1Oz
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6ddef424972so209204eaf.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1793334177; x=1793938977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GJHR2hSEQjDA7JEPW4kRvNrUrFju1iQ8fE/qcrxDnx4=;
        b=bbdaf1OzyfVIjziEcBKDEx0mtzA7kv0ty2w3AElpjlhAtv9H+B8D9hvQ5IpEb03FUF
         vENlSRLccwoAnqBpQ0ladWXi1X9pUyWpAKXru2rUskhWdMqnF6ZYogH+3x5BYmpH1G9A
         F9tPV/yJyNkbbToD+sX18Gtl/KplDDFziD7/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793334177; x=1793938977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GJHR2hSEQjDA7JEPW4kRvNrUrFju1iQ8fE/qcrxDnx4=;
        b=pAR/m9p2imfc1NzoDkHQlEpcd16l3exnqmH16glKGvVei1pnXm2/VRk+PGFm/jJjn4
         QUnyDqdSZohAhyYIGDGI+QXeG8+Q18R5EusI26lspl0bGAvMtYLcpEfJh+7m7+TQpdco
         efZAgdyuVDvXuwYmGScRLciLgVTpjbZCj80Jb8iMNDkFU1Ytg4MpvjmC9jR18qYqxQ+r
         +PA9uOc2v+tXY1AGsZ1MGnVsWDEgbBJb1sSuDipA5fE4zsxt8G3SN6kRX5DyeDQNX2Fm
         9CDZzBzX2h+xzA+eMgqzx3y4uUdDwFXvltLqZ0GvORRnuQ3esAD4JaQPp/vjrmMW4CQC
         EXdw==
X-Forwarded-Encrypted: i=1; AKwUvBxRsEYFSA2PUjNhSc9hpT2PoB7cXvcag25ZR7bISK3kbdSTz1v5lGKpQEpqxDPvA0fm/d7ILxRgE+lH9YM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRbf7yLipG7mLYTnHTGaHou67Cb8qzKIhyQ4qE4FP3pgpw7ZnY
	CwDjj3tisO+DNirbnkTooojRG95mZxFH5CPncqnMjhRQCPPTjYjsMoxGNlCySoWhijA=
X-Gm-Gg: AYBFou0JfcmJqq0JSQhndKbaNUtzbGoxpJ1Aqk7MJsoyLhAOCXiUPS3y0D9nDSOpqQE
	FVC0ba6J2/1Ueo6gmKi+LkC+vsnHYtZdMS2quvK8FCXsZT3MLlm+4YKJWz7N5nxVK9pHy7QgH/a
	lC5TR2Js4SxFvxgvJ0/hndyUOAzDit5OfeoXwNtmPULOu8lHvlyx0s26hc3GHdHN/8w3T6RNga2
	yh0y5EtDNzPsJdZLCnFO+rnXpESx1DA5n6nD0Kqh2qnUqELtjh6HcxiTaBWYy8GXEBzwjmjzraq
	yzGBN1uzN5oPznY06TYNDAZpMrbIGQ7PCjyldH65nz2n26iKEQCWYvWj+kufDaFODFbrIdMTMMt
	kbIUfnapMf8vnSAR/66W4vRfPSHFCZOLju2hbf1dnS6PrgYYdWxhutIR01sD/BiPfaAVi070ER7
	NjfZj62tUetXZ03d0J9bivENXyOIdbF3X3ZaS+IPlP8xAR1vh7aXPG4YuIEQ5RTmq5Kb69qXqOQ
	pXjKCgi7ZLTKf920Z56DhruGErRy2gxmrRF1Ap6A3L/8ET/YacwPjgDTsbccIjxLjnfpze5SVgp
	w+knfZQH1eBfuk1JY+dVhjMRKbig1BvzilxQvLh7faEDP59mP10jBBBAXDmcL/NFU/i+mKMr2KG
	RcYVveufGby6sBwPzCQa4gwP0SmNgMg==
X-Received: by 2002:a05:6820:55d7:10b0:70a:598b:127c with SMTP id 006d021491bc7-714f29e7222mr536195eaf.45.1793334177541;
        Thu, 29 Oct 2026 21:22:57 -0700 (PDT)
Received: from com-75606.corp.openai.org ([199.47.143.5])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f2a818b9sm1094944eaf.1.2026.10.29.21.22.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 21:22:57 -0700 (PDT)
From: Kyle Zeng <kylebot@openai.com>
To: mptcp@lists.linux.dev
Cc: Matthieu Baerts <matttbe@kernel.org>,
	Mat Martineau <martineau@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	outbounddisclosures@openai.com
Subject: [PATCH] mptcp: pm: kernel: use RCU to free endpoint listeners
Date: Thu, 29 Oct 2026 21:22:55 -0700
Message-ID: <20261030042255.74216-1-kylebot@openai.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mptcp_pm_nl_create_listen_socket() starts the TCP listener directly
instead of going through mptcp_listen(). It consequently misses setting
SOCK_RCU_FREE on the parent MPTCP socket.

tcp_child_process() can invoke the listener's subflow_data_ready()
callback without holding the MPTCP parent lock or a reference to the
parent. An authenticated MP_JOIN racing with endpoint teardown can
therefore access the parent after its last reference has been dropped.
The ADD_ADDR error path can also close an already published listener.

Set SOCK_RCU_FREE before __inet_listen_sk() publishes the TCP listener,
matching mptcp_listen(). This protects the parent on every subsequent
close path, including a failed endpoint addition.

Fixes: 1729cf186d8a ("mptcp: create the listening socket for new port")
Cc: stable@vger.kernel.org
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
I have a reproducer for this issue and can share via DM

 net/mptcp/pm_kernel.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/mptcp/pm_kernel.c b/net/mptcp/pm_kernel.c
index 1a7750813235..f7396628490e 100644
--- a/net/mptcp/pm_kernel.c
+++ b/net/mptcp/pm_kernel.c
@@ -906,6 +906,7 @@ static int mptcp_pm_nl_create_listen_socket(struct sock *sk,
 	 * old status is known (TCP_CLOSE).
 	 */
 	inet_sk_state_store(newsk, TCP_LISTEN);
+	sock_set_flag(newsk, SOCK_RCU_FREE);
 	lock_sock(ssk);
 	WRITE_ONCE(mptcp_subflow_ctx(ssk)->pm_listener, true);
 	err = __inet_listen_sk(ssk, backlog);

base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
-- 
2.56.0
