Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518484C8C49
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070771; cv=none; b=rsQfa6tggkhzcRoT+UwckX4aqi9fHuRYL7n/S044KJI5IZWtzZQn+0jlnsrflhNn/qO/7mkAaEbkG7WRSWDEULHp/CcMr1kZEgPFmB5FfKGp3YuTWyZaLy0sSqaDF9e9yJKJR9QCh8RaM1M0JIs4oSvVsBTlR4DPoDr6ZIotJGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070771; c=relaxed/simple;
	bh=oW5fjXkU1LjFKqoyF7Qy3vvc5V+m/IzJ7Oa3bKJcpYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d/WAWkXgzKIT6PYjqw6WIv7t3r/UW9HmRz7fcv+PUa2LmKIHcqaV9Nn5GuTxwA6Gw7kC0Mvj07nESA1RS6y4aujRbPgqjT5fUmsFXTrwT27lxWI+/ih5usmzxp52Gwy4KOooCBzi+lv3oCYd3FFZY7w6bRWA3iX2f+fvhFHovnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=rIZb1s8/; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="rIZb1s8/"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so3420519a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1790070769; x=1790675569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UnrR1m0kZk2/oAOYVJ8Ilr0rQHlguOaTVy++aK2OkWM=;
        b=rIZb1s8/XeYrPs2dr+9tO7v/sM09EMTZJb6a6gP//sqvoJNfxvjsVGQ+YcDXVMUpkX
         AmJfvM3W2DQrg+jF1lqa7/2YSDd4G58yzF5reFSUQgPi3WVLDYclpMAW5SmvzZkKmDSu
         acQ1Dnjm7QFljTSrw3JDONafkcN1bnT78K0OIf50raXWAMPeKZUs6f3FILz707dmGdYn
         En1z4fdGlc96OIKShQFo+YCAYLsrvH+WC26s5F3hDoJXHOQt20oWEkCN2g6E92B3NZhN
         SBmJQs+/zQGtdns8LdRWY6Jd1oU0UFiX990PMmy3VFjhCtI+0JyoqbiFlKrNnqD1sSzF
         akfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790070769; x=1790675569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UnrR1m0kZk2/oAOYVJ8Ilr0rQHlguOaTVy++aK2OkWM=;
        b=TJj4Wvdvlob0ej6nT5r16YvjkMRsMQLVP9o8swaeQ3n3e3S5ycWHDcn+9tdeZrV8le
         JTrpTE0F76UcyMyUQ5IIOCXIPcHHKJtDS9wANHTiwRqR+rx7WAehrCgGzdGQpid/tYkL
         YE7HFxC3cHceN4MfG4/AQm7ss35IxPQH/qTnnqBHY4FIrp2/QdMSDU69R6kO1P76h9tQ
         kam0FUkGu2rnJX3N9KWNCqAIPQDAZdLb1VDfa0LZorZT5HWh/YiSgExovs+vKYUefZSk
         WFj+VA5/XGVElpO12ahnCiDoqxmQLge9NOVlYI3WEdWkrOiKEcS4+CdL6T80nlGK7Vu2
         pkNw==
X-Forwarded-Encrypted: i=1; AKwUvBx9Coff8vdH1qqGpo3cCnbTk34NWt4iD4GJW66BRNohnXS4rTbcobiIuCLnXS+vBr68KgsSbqkwixaijaA=@vger.kernel.org
X-Gm-Message-State: AFuF++kIffGlNm98Kd8uaLdNfXSnabXTSFPv0L7iHChmWgSC8N3VWO7q
	Z4UqWxLfGy50mziswIiA+4dDJo3DHGZosSEHnpcU9Sturkahc2p8irswijXx9NdaXNTb
X-Gm-Gg: AYBFou14a+gqErPqBm6ezlRO0DTDIQEsJpm7fIgK/TQwKYaS8yJts2T5vkvlO7hH4g/
	lZvbND4EkIM/FE30DTL9V88vOeoP3BMKbcDHDmfnfQXwo8u+tmJsnz4zQpjpGy29YvwqGZQ1/r6
	pI4DNdkFujqzbGnMbziL9pr2vXudipPCE4EeThKbvxx3Wa2/kWLz5zwsIen0V2naKc7gvt+LtUz
	IhmOcPILWGcQ1+iprwwfp1nEu7Cpenm4ZZeFFvOWrxzO3eVG0f+pLt71LJiKe7/lggke2caplqW
	Qm1snw7AXez7FSilF1t4saj6F7fa/oYa+N3dPUjK74Jui1eizUzbcMHIvLF5LAVAzZXAZxT0/ZP
	0HIShvQnEHZBPzlC5m8hjQU2XE/+Dua2kHmLLMO2UFCDlozUfLU9YayHFi93oJpLAkGSPJqzQvE
	X60OdteiGWdJpzGGbmBUk0XvMhqPAR9TqxVylX6FsAIAScM7KaasKI2Wi8yromWpc3pG2/E29rv
	uWtiapP3UEo/3OvPNbWTlRiLsajF/c=
X-Received: by 2002:a17:90b:2ccb:b0:39e:6c68:c77a with SMTP id 98e67ed59e1d1-3a07323d479mr709033a91.48.1790070768485;
        Tue, 22 Sep 2026 02:52:48 -0700 (PDT)
Received: from 954df21a5119.. ([122.51.212.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06dfd6705sm2679525a91.0.2026.09.22.02.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 02:52:47 -0700 (PDT)
From: Zihan Xi <zihanx@nebusec.ai>
To: netfilter-devel@vger.kernel.org
Cc: zihanx@nebusec.ai,
	pablo@netfilter.org,
	fw@strlen.de,
	phil@nwl.cc,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Vega <vega@nebusec.ai>,
	Luxing Yin <root@tr0jan.top>
Subject: [PATCH nf v3 1/1] netfilter: nf_dup: disable duplication in user namespaces
Date: Tue, 22 Sep 2026 09:52:31 +0000
Message-ID: <b9e860571e049e0830d3b08626e28ca571e1ecc0.1790042930.git.zihanx@nebusec.ai>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790042930.git.zihanx@nebusec.ai>
References: <cover.1790042930.git.zihanx@nebusec.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nf_dup_ipv4() and nf_dup_ipv6() send a cloned packet through
ip_local_out() or ip6_local_out(), so the clone can traverse netfilter
hooks again. A network namespace owned by a non-initial user namespace
can combine NFQUEUE with TEE or nftables dup and retain the clone until
a later verdict resumes it. The transient in_nf_duplicate task guard
has already been cleared by then, so the resumed clone can be
duplicated again and generate packets without bound.

There is no sensible use case for packet duplication in a user
namespace. Skip IPv4 and IPv6 duplication when the network namespace
is not owned by the initial user namespace. Keep the existing TEE/dup
behavior in the initial user namespace.

Fixes: cd58bcd9787e ("netfilter: xt_TEE: have cloned packet travel through Xtables too")
Cc: stable@vger.kernel.org
Reported-by: Vega <vega@nebusec.ai>
Assisted-by: LLM
Co-developed-by: Luxing Yin <root@tr0jan.top>
Signed-off-by: Luxing Yin <root@tr0jan.top>
Signed-off-by: Zihan Xi <zihanx@nebusec.ai>
---
changes in v3:
  - rerolled the unchanged fix against the latest nf.git main
    after no follow-up was received on v2
  - add the required Co-developed-by trailer and matching
    Signed-off-by
  - v2 Link: https://lore.kernel.org/all/cover.1788425393.git.zihanx@nebusec.ai/
changes in v2:
  - drop the persistent struct sk_buff::nf_duplicated field and nf_copy()
    change from v1
  - disable IPv4/IPv6 duplication in network namespaces owned by a
    non-initial user namespace, as preferred on review
  - v1 Link: https://lore.kernel.org/all/cover.1787903722.git.zihanx@nebusec.ai/

 net/ipv4/netfilter/nf_dup_ipv4.c | 3 +++
 net/ipv6/netfilter/nf_dup_ipv6.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/net/ipv4/netfilter/nf_dup_ipv4.c b/net/ipv4/netfilter/nf_dup_ipv4.c
index 9a773502f10ac..c33dae248c477 100644
--- a/net/ipv4/netfilter/nf_dup_ipv4.c
+++ b/net/ipv4/netfilter/nf_dup_ipv4.c
@@ -53,6 +53,9 @@ void nf_dup_ipv4(struct net *net, struct sk_buff *skb, unsigned int hooknum,
 {
 	struct iphdr *iph;
 
+	if (net->user_ns != &init_user_ns)
+		return;
+
 	local_bh_disable();
 	if (current->in_nf_duplicate)
 		goto out;
diff --git a/net/ipv6/netfilter/nf_dup_ipv6.c b/net/ipv6/netfilter/nf_dup_ipv6.c
index 6da3102b7c1b3..a5f6f074a7e91 100644
--- a/net/ipv6/netfilter/nf_dup_ipv6.c
+++ b/net/ipv6/netfilter/nf_dup_ipv6.c
@@ -47,6 +47,9 @@ static bool nf_dup_ipv6_route(struct net *net, struct sk_buff *skb,
 void nf_dup_ipv6(struct net *net, struct sk_buff *skb, unsigned int hooknum,
 		 const struct in6_addr *gw, int oif)
 {
+	if (net->user_ns != &init_user_ns)
+		return;
+
 	local_bh_disable();
 	if (current->in_nf_duplicate)
 		goto out;
-- 
2.43.0

