Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793168574;
	b=BoPt/JgEC/4M7p/axUU/trV9XRgxxkmhz8/gvi2vLnBpgVW3HsrcrU03onqLXU2AOT/N
	 Hc7A/BWH+MBVsn1U/mITbWTeQ0HZEu+OXZdPFIM2NsvT761Eq7KHRSs4vfUCViGS5NMdD
	 zCGXk4nJI+XoGKK8Sfeucf0+EefBDDHXaRYG4np16wpO2h+1f8qJKu2o18dBfJYt59on8
	 fJ6td7A9+6l3SRjdFPR69Hse68+6Il9UBDZwe2rWPyV5XWfpRWGf+Bzjx6zbXJKdG8j3L
	 bWi56qmNtfMLURII1KaLrYi0vBTf8JxpDrD5EEUWrRHwxCLdvqkEsDETgf1W4p2Nu9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793168574;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:X-Mailer;
	bh=SulABahkU3rLao+I7j5g0Ph09Yg6H2vGeWdscwhFpIs=;
	b=QA3qYy1u2h0CXt4q/dlWZrc+waPOLECGwWnDMQZEpDQMmoS0Zf9TH0q+VXq9GlkRY6i4
	 M9sNaBnJiZpHJ0jxTs/DMWGKCPhZc5TLMcC1r3aSKT4PuO45RYuSAJmrpSAf8aYp9ecPx
	 kns9ABrx6WkuMlDb163J0n1e+hyPq5MExtjXor4PAmix/fC7TAjr+5Yz3N/Y+eN3koIuW
	 jvDsckB8zFBRm0h5FmobDR8zanYMZQjhZphoEnFXxRSx0HYcbiwVB/cp9n2DTyAzcUKj6
	 rjGd9SEZ6YRJzTv0eAmW6J4yCS2s4WH/ZylyZF1LF6HNKcGVonTJESaNvhT0brJQfWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bk++MV6k;
	arc=none smtp.remote-ip=74.125.228.8
Received: from mail-pz2-f8.google.com (mail-pz2-f8.google.com [74.125.228.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EBE606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:22:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8EBE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bk++MV6k
Received: by mail-pz2-f8.google.com with SMTP id 41be03b00d2f7-cd3da0e82daso132426a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793168573; x=1793773373; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SulABahkU3rLao+I7j5g0Ph09Yg6H2vGeWdscwhFpIs=;
        b=Bk++MV6kwfBaTPsFQ9sPW6xVdQXu8QHBLNBmXn+4O5/4UZqCRMXj2JVrOkA0O73ASK
         UjmfdxIzc591iBllQHPYUS8Ru4hTCYR2k7f5FbUeYKYAjjWddLDzfKFvfFG/tE/iWG7G
         kdIkEkNgFScyzvf90nJziUXX66iSajGdCM9mpd1XJS5P5JjZVERSO9upDyUKUGCpPLP2
         l+BaJE36fU2n6FPqKPUz+fXH1HGgGhfJnC4i6Crg0DJFPEcI9WG6MYtV7KFaBPtMBx4t
         kcnIOMBDqZr88IhosTjC1ODmw/JZP7bnUSLnYqZJEQovxNIYaDtF8V7sVJ5vOpLE1xCB
         MJIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793168573; x=1793773373;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SulABahkU3rLao+I7j5g0Ph09Yg6H2vGeWdscwhFpIs=;
        b=yh1juCYBzaze0Uc3iX75vox0ZAUSiLpIFq9a1gLkxAt01HupK0nK7Xf8OlkoQrxRgX
         lQoS7UETPR6jhQixpMfytaVpc7lfJdqcq4vwlPjdlPPzsoPsG0mcFmnlCh7qkw5pUP71
         mkmtT4l2fsYopuHl+fsHsKbWMEvWhv2FETdros6Yq96zBmEUv5pTTaQMu+nNfFUtSM1r
         cLPKSMGTHH9ehloAjR3Z5jDJ/Qru2tWZwKD9CLGSEpWosoVAWAtKVOaDVuvVGO9nSrDT
         BUfEKdYvG4Us/ftD1oSvzIn0pTndtzB9spI5nke4JH8OTQJbUIsGoRDMafFpYnWDZdHF
         hJuA==
X-Forwarded-Encrypted: i=1; AKwUvBxnuzaxesm0ruZrggG49NbL8BU18Gl8d3YQ4ETfNPYQSZfYlZRl/brr8RwTMkEl5EGLkiQdQXAvpTQonPE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLOc+MYqtHsUVnGCGDfVgfxchuTdpRiTa673IX0+03uGm+rEwM+
	o+tACuYZRO8Fobsdg3RQyrYkTyW4udMr98CS5VSvRb+eqtnoT+NbcfrfoQNy89Z+FDI=
X-Gm-Gg: AYBFou2q/iDgRv5QDFyNBet+M/Zp3p59f5mjmpbA8pFN4f+KPjIBYGKs98oBVrvhdME
	6ZcHgPRqMgtWaD7uvAVnYlyZ104QGYyArkTvR4xwf4F2jcjehO1gL3pLsWf8bnivnz2YF/f9H2U
	eAVu4XdkQrb5MFdCJPH+k9+lcllDxgECjupaVJxIq8qd2PAnPgYeazTCOA2XwBHomglIRSAkkqN
	NMhDTyquQO+Yaj6PmUt9d00IZB/nTWF0J1j168EaUrdthWjYOIxTll4UUxiuFmUD8scXMZ0aGFn
	cPezBisU+uXObHj+fLSdhRw8t3i9585/fYgDphMoMlTLAb38c/5pGV3xF6oO2LT8CuCeVwkeuPS
	g3sA3iaE0J/jjUx8057L31aRTAoNX2zWf5C6mCRCq95Gm+q8v+q4+n+FApVF60jkCKsfkvYgn6f
	UysEx536gKMIhfBRoDCDFhixNWCrUYXQWQTkqbtYUPczXgKrcDcxMTg2pRXWFEssVxa3Dnd1uvr
	H5guVYLwOjRbKi16u0j0dRbkTINdaUo5MMzfp7xd+DCLRk1vsBuG78Os1qcpwyFP7VdBUPr5W9a
	r9y3ij/acX2qXune8M3w
X-Received: by 2002:a17:90b:55ce:b0:3ac:9d83:8861 with SMTP id 98e67ed59e1d1-3ae5832af4dmr1018817a91.67.1793168573088;
        Tue, 27 Oct 2026 23:22:53 -0700 (PDT)
Received: from hhost ([120.231.212.153])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a27f7c7sm1558410a91.2.2026.10.27.23.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 23:22:52 -0700 (PDT)
Date: Wed, 28 Oct 2026 14:22:42 +0800
From: Xingyuan Mo <hdthky0@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	"open list:NETFILTER" <netfilter-devel@vger.kernel.org>,
	"open list:NETFILTER" <coreteam@netfilter.org>,
	"open list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Cc: Xingyuan Mo <hdthky0@gmail.com>
Subject: [PATCH nf] netfilter: nf_tables: fix flow rule leak in nft_delrule()
 error path
Message-ID: <20261028062204.1079089-1-hdthky0@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.43.0

On the nf_tables_delrule_deactivate() failure path, nft_trans_destroy()
frees the transaction but not the attached HW offload flow rule. Destroy
the flow after the transaction to avoid memory leak.

Fixes: 63b48c73ff56 ("netfilter: nf_tables_offload: undo updates if transaction fails")
Assisted-by: opencode:deepseek-v4
Signed-off-by: Xingyuan Mo <hdthky0@gmail.com>
---
 net/netfilter/nf_tables_api.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/netfilter/nf_tables_api.c b/net/netfilter/nf_tables_api.c
index 59ac623e6805..ec56ea8c8436 100644
--- a/net/netfilter/nf_tables_api.c
+++ b/net/netfilter/nf_tables_api.c
@@ -752,7 +752,7 @@ static struct nft_trans *nft_trans_rule_add(struct nft_ctx *ctx, int msg_type,
 
 static int nft_delrule(struct nft_ctx *ctx, struct nft_rule *rule)
 {
-	struct nft_flow_rule *flow;
+	struct nft_flow_rule *flow = NULL;
 	struct nft_trans *trans;
 	int err;
 
@@ -773,6 +773,8 @@ static int nft_delrule(struct nft_ctx *ctx, struct nft_rule *rule)
 	err = nf_tables_delrule_deactivate(ctx, rule);
 	if (err < 0) {
 		nft_trans_destroy(trans);
+		if (flow)
+			nft_flow_rule_destroy(flow);
 		return err;
 	}
 	nft_rule_expr_deactivate(ctx, rule, NFT_TRANS_PREPARE);
-- 
2.43.0

