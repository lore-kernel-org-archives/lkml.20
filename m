Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437CB38DC70
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789851983; cv=none; b=SCEJ5YC8p9qaIdUNCmi+S32loulCg9ahS9yhRC+eX9qTB/nkf3aBzy5oKiIPE3TnCeFRbEnYDASzLgg1bJReGQpFoD7KUTqDYoItTXDM/gboGxu+fgyIUmL5tJrkeQSC13bC/8zDuEf+M2EGKl5mAcQ65Hy1aogenkxvzZX27A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789851983; c=relaxed/simple;
	bh=bQt71qds/ETlV3MaQhtxMntNA5mIVvUT56qHS7ozc4E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aTDudYUWHJUOZgfomZUBybb/ysuQM3rMN0EFeRuJhk8o5AfEbsIIm7/jkdlDJRLcXtddF7AC+DNs3esWaLhhn3RgvbunelvkefpJz4eS8waTiiFj5j1ZiE/68QfK9wfrthsd8nVpeQLjRfc/E2KkvQgy8LFadO4bv7iqpaS2BKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kbZYXtqB; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kbZYXtqB"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb752so1534787a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789851982; x=1790456782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hrS1SeqIDZottndBkhcKc+LUT4GTeQPPCofsIBFZYoI=;
        b=kbZYXtqBwcOYQ0iTEGDPhJcc8ez9rJ8N7VDHxw9SToDNGgyYo2UG6+czD8XTIZrWh6
         qW9jxu1xCHyx55SbqzBOUb8xFP1pWMtcem8W7a2zOo1VBzZj2P5hoybdWc5K2ENRL8uD
         A+nmvTJUabyIy9CpawrCaH5A/UGK6nZs0Jm7L0xNCXyvCFodZlTEPlibE5Nied3aOOCm
         lamQNTor2ZK9KCyCx4mwW7G5NMUILpmgkf9oFZUu9gpvLogXqF/Eqo5/aWQ19McsN5s8
         kDT4b+ktIrFE1D6htAfjwjUlhqCSnWvz/ub9x8czhpF/LoXgWBE146cnrSCBssoM6zjL
         aZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789851982; x=1790456782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hrS1SeqIDZottndBkhcKc+LUT4GTeQPPCofsIBFZYoI=;
        b=A1kzfzPDgLaaid0EKE7A2FW9pOs8TWRbGBp+YEh0jVViWIDn0M6HSIJeewPnRF5wyN
         8BjKmPNLn3EgW+WiO63kkKsVrOegwDuOjcOGUzVGpG7j7Zfly17URZqF2VhioqI5N0qR
         U0OTU0iPWVA6TrLiFiwrM3RP8xj79UewAKhwG/TRZWhx5ZimV13owlSTxMYQrahZimTD
         Tl590TUrYTcJgi+7GznqE2/n+NhsgqyeofxXyb4EMeJyS3/VCLv7h1Pt9o8+9YysY04+
         l852JSokS+lzue8Ny7deX/UlpPMoIbFuC8MX6bt7GzWGijZcARRpjbgVZcjCS/ja4flk
         W/6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzsoUkPQtZa22yMCk0gnArPKlCslI/jQ6PaCSZHk2XywtO4s6Ds5Oo6o9xClpdfWN5cCKXc4vEsYRM0wmM=@vger.kernel.org
X-Gm-Message-State: AFuF++kO2mZ7WSWKMb0HRfdvjeKscGgLB5cMLRqGbE09Sw5ppgD2e3iC
	GLBlhQjf2jpwYyKpSFiYlT8srd7gy/iloyG7oBao1BndihQC6jysPF4q
X-Gm-Gg: AYBFou38UrKHRz7bNW2tfa2rOpLeC1wTHlwKV0KLomWdKc9yPwU0xo+5DcvJ4G1NFTq
	dXvkAffc/blQc+cTAKWzBAtb+GzKT9UcARgkRZk8zVEZvHpe964SNqtlL6EUzZoKtlWBBnn5o3S
	ykOF9gipXz5HZzt/FRxoUKQAvpriUaOUM9fjL0GATpTXYUgg2yfiz8uOQtRtjzSH9uY2fLLIWU7
	ka68MYsVW0aMbitOQTuELBn1wQ+ns+P5CM0VEc1MW07Ot7SPiU8l/tNJo4L8Mt7GT3Lz3Xt8oGi
	m8yrrK3vn/nL7d1jvu58AGdYofRJZd2TY/2Hl5kDOFRswcJDTIKy83giDov9Lo2z4AHc27lVses
	C78kACBBUFARP4lz3WJmYSZLlOwdU+laOD9yHIFhFjGiwN8CZ7gskxZbS4YejVjbg/Eut18UeWc
	kEKWo5p0oh2/Dq1sYQfAPWfEXq9inUcYo1qYmmA/LFYHTBVSJiw4sqZlERo8mFptG4Tm6QWwicM
	VeDJ9NsuOzsNP90Ej/6WluZYZFxsjVDohcpCdDUDOs35IRC5RVe3v7LhaTsaqjqddNGolGkeM9K
	c37CMJ4/XQ==
X-Received: by 2002:a17:902:dac2:b0:2dd:c100:7cc6 with SMTP id d9443c01a7336-2ddc1007e7fmr52950545ad.66.1789851981674;
        Sat, 19 Sep 2026 14:06:21 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc16b67b5sm13013095ad.4.2026.09.19.14.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 14:06:21 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: dsahern@kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: horms@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ipv6: fix payload_len inflation in ip6_xmit() when IPV6_RTHDRDSTOPTS is set without IPV6_RTHDR
Date: Sat, 19 Sep 2026 21:06:20 +0000
Message-ID: <20260919210620.3029622-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When ipv6_fixup_options() was introduced to ignore destination options
before a routing header (opt->dst0opt) unless a routing header
(opt->srcrt) is also present, rawv6_sendmsg(), udpv6_sendmsg(), and
inet6_csk_xmit() were updated to normalize `opt` via
ipv6_fixup_options(), while other callers pass `np->opt` directly into
ip6_xmit() (such as tcp_v6_send_response(), sctp_v6_xmit(), and
l2tp_ip6_xmit()).

In ip6_xmit(), ipv6_push_nfrag_opts() only pushes opt->dst0opt into the
packet if opt->srcrt is non-NULL. However, ip6_xmit() unconditionally
adds opt->opt_nflen (which still includes ipv6_optlen(opt->dst0opt) if
__ipv6_fixup_options() was not called by the caller) to `seg_len` and
writes `hdr->payload_len = htons(seg_len)`. This causes the transmitted
IPv6 header's payload_len to exceed the actual packet payload by
ipv6_optlen(opt->dst0opt), causing receivers to drop the packet as
truncated.

Normalize `opt` with `__ipv6_fixup_options(&opt_space, opt)` at the
start of ip6_xmit() when `opt` is non-NULL.

Fixes: df9890c31a1a ("[IPV6]: Fix sending extension headers before and including routing header.")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>

---
 net/ipv6/ip6_output.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/ipv6/ip6_output.c b/net/ipv6/ip6_output.c
index 550965058991..17d6add40864 100644
--- a/net/ipv6/ip6_output.c
+++ b/net/ipv6/ip6_output.c
@@ -295,6 +295,7 @@ int ip6_xmit(const struct sock *sk, struct sk_buff *skb, struct flowi6 *fl6,
 	struct in6_addr *first_hop = &fl6->daddr;
 	struct dst_entry *dst = skb_dst(skb);
 	struct inet6_dev *idev = ip6_dst_idev(dst);
+	struct ipv6_txoptions opt_space;
 	struct net *net = sock_net(sk);
 	unsigned int head_room;
 	struct net_device *dev;
@@ -304,6 +305,9 @@ int ip6_xmit(const struct sock *sk, struct sk_buff *skb, struct flowi6 *fl6,
 	int ret, hlimit = -1;
 	u32 mtu;
 
+	if (unlikely(opt))
+		opt = __ipv6_fixup_options(&opt_space, opt);
+
 	rcu_read_lock();
 
 	dev = dst_dev_rcu(dst);
-- 
2.55.0.1082.g2b9226bbc0-goog

