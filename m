Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E39D4BA9EF
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792022194; cv=none; b=f8qZlV/aqdJP4/8YJ9HCUIgiD006h2uVTv9oXuJOgPFO2m8ncktLf0Jr6qdSdIUBrxvlm2hGG26BmmrvPreDC+6sn47xpYfS4Fdi41x6VIgGJ1DYjrvUygrRWqfvJaqNgUXe62S/8as5SUKXqZmzHAVj8T/JPphweJK4blK2MN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792022194; c=relaxed/simple;
	bh=nLu9+jS/Cn6oFT3DAy2pgKLYerUk78AHPFMk+9gkrY0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a2HqA0GZbcPgN1GQOYUR8MloJSswPKKCUuo+q9Qfpj0skB8CzCnrtLEbjwmR68Y4qr5NT0NUNPOaJIiseXb6pugFREHkXYWIhLo91yHGzj3QBlXQ90mSH4af4rh4kVE9NO7fQ1TZrD03udzreJvhKxjXW7qEsSiZbAtOIRlUKn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=bJCCdWS3; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="bJCCdWS3"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c247f6687dcso716318066b.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792022191; x=1792626991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ujWOXhajkBZtlCmsZmCoVumMM+X/QUn/djLaiVsONPE=;
        b=bJCCdWS3SAPVptxJycLn5yScFOncCfpXu+inchndA6M1vZCtSnwKPoxvEnuEhrLLHr
         F86HqEXS5wP1bKUC+C+MffUT9VA7+fLrXZDZibZz5Tf61HlVHt1Jh10Mx8WjykwBvVHx
         PWXTNj4DHwTNfgz+9nx+32yGY4Q/BCQGmsC4zK0EWkIocoTkU+QppCGu41JHJqoEKDFo
         ctpDdkJ8TO0L22nPejk4mF94+ND9ukR8xzhM9Qt6FTYQ2A+oNHIWmhwOUYx956uW3oS5
         wmLPx36n6syhNVOIFA+khBnb0lRUS9tKMbfr9/33VgB4P8oopaeBmMyrSaNE6iMN1r/a
         /FpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792022191; x=1792626991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ujWOXhajkBZtlCmsZmCoVumMM+X/QUn/djLaiVsONPE=;
        b=QVtMEnzsiE1sK5xMq9DYSKOW6YmcbeAWhDbarnRAWnpM+Xcch68sj6VD2LQwCRl7s3
         ZRxORYn6rvtn7r/X5qgqYj1cuvPObvwRPcBf1WcvMZul0vayQE4Ys5RbvQW767MQicEX
         Xiw7ejlVoElgssMQXRLGBRb9PWb42mx3qlu/KHCW1ifYBGf/Q9XTJN7D8S59gi5YReDl
         6j7YTTt5qX4kb3LxPx3Oy9LZqCfzIjQO6VLUrgRFp4xXyM7KDkvk67DQxcRKCff9ZAfi
         TJPb88iaxDUr8/tWCZvWIaCj6Rcrby8s/w3rn3qYvGzzpVNWa5/GQjDjnSa/Mygo6t/1
         Dojw==
X-Forwarded-Encrypted: i=1; AKwUvByBL1Kc0qGbPv2+bNrGQLYpIZafpz7zD7avad747B8SWs4ZxXhOBPYz9FLtgsGTYSG74lEc9Xt1j6Ttqwo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIm0mQ22yETXGGIs/xd+8jP6Y/ts2gIgcPF9XubfFzVPODJswkl
	DZz6EfPgoZgJhW/wIrlkYy4it0RDIYpHp5ngxi8XwGD31SqSD6JUZQGaXwGevLROpQ==
X-Gm-Gg: AYBFou257y+/yNa27mNon/xF6kDz59xbxeXVW36TKwcfWMFJBFPj0gtsAYfSeqv5MBV
	DxRCyeIjUfiy8wBJjE3z9zFAhDBU35wXW+tw7E4v1ldjCtcBGMQ+I7wmzm2TkpDDdLueJMRJ3kj
	RrrybwdYoUCV64OsHJS9k5uOxDANqsnLh3LDICAWMK/YJm4KtCuz6ddmCkn1MF06FQq8WfRwwXn
	F/Z1ptdGM9xOCcEgN8waZGbp+vuNJNqlTOzFyI8/JIM4Jdo0XtNLqRSNYx2dlM4B5VuFG+KLTnS
	UWYnSwpnoQjy75Uj9e8VMJr3xP/AHJv+HOfOEqkL/Q/REZZDxhXNwflK/Db+gsmnz7eqL9kXgeX
	7qGVaCzBb7OshtJreBozfsI/HhqxQBXGTD3e2VGzwjF/cowSzT9mE9fX/M8foO1v3g3ikol2iTY
	DHukUqX8tx/ZGZzGlrUZmU9Qc75uvJRo/aVQAyhdV5H56wGBQeUjB0zmHxj7KrrBA3TYckR9ZIi
	vu9GsaDOUpd6AFS2xl3y3ovQ4Y6OVuVcMYVuYE2sfevOi0Pf7rnIyt3OSj37uzvnMRemiR5mxRW
	plHEdRqVw045gmvVht1vYmb94eYlTop2EUUpdDbP8CFAwgC89iOEZ672fnWR8riXfu/zLqIPhIZ
	tjP4LyutGp66lNpqWQew7GbVcn0gks7IrjqZ+VwwIPVoBY5GI/ynDdEAAx2LMAd2TxGVlNQX/PI
	oeJ7IgumCO8XjeWI61FNxfneA=
X-Received: by 2002:a17:907:3d52:b0:c26:1648:a076 with SMTP id a640c23a62f3a-c31aa0e93bdmr1626520966b.49.1792022191008;
        Wed, 14 Oct 2026 16:56:31 -0700 (PDT)
Received: from Desktop (p54affd5a.dip0.t-ipconnect.de. [84.175.253.90])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3edab12007sm46101666b.82.2026.10.14.16.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 16:56:30 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netfilter-devel@vger.kernel.org
Cc: pablo@netfilter.org,
	fw@strlen.de,
	kadlec@netfilter.org,
	phil@nwl.cc,
	horms@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	razor@blackwall.org,
	idosch@nvidia.com,
	ericwouds@gmail.com,
	dqfext@gmail.com,
	netdev@vger.kernel.org,
	coreteam@netfilter.org,
	linux-kselftest@vger.kernel.org,
	bridge@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH nf-next v7 0/2] netfilter: flowtable: tear down bridged flows on layer 2 roaming
Date: Thu, 15 Oct 2026 01:56:25 +0200
Message-ID: <20261014235628.197976-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A flowtable flow that transmits straight to a bridge port keeps sending
to the old port when the host moves to another port, for example a
Wi-Fi station roaming between access points.

Patch 1 makes the gc tear such a flow down, using the bridge fdb lookup
from Pablo's patch. Patch 2 adds selftest cases.

Tested on nf-next a5e7d8e446af in an x86 guest: nft_flowtable.sh passes,
including all seven roaming cases, and ftrace shows no
flow_offload_teardown during 10 s of steady traffic in any of them.
flow_offload grows by 16 bytes (296 to 312 on x86_64).

Changes in v7:
- look up the fdb entry through a bridge hook instead of walking the
  forward path again (from Pablo's patch)
- save the vid of the fdb lookup; the encap stack does not have it for
  untagged ports of a vlan_filtering bridge
- build br_nf_utils.o only with CONFIG_NF_FLOW_TABLE
- selftest: vlan_filtering case

v6: https://lore.kernel.org/netfilter-devel/20261004171605.3544792-1-julius@bairaktaris.de/
Pablo's patch: https://lore.kernel.org/netfilter-devel/20261014210256.1573072-1-pablo@netfilter.org/

Julius Bairaktaris (2):
  netfilter: flowtable: tear down direct xmit flows when the fdb entry
    moves
  selftests: netfilter: nft_flowtable.sh: roam a host between two bridge
    ports

 include/linux/netfilter.h                     |   8 +
 include/net/netfilter/nf_flow_table.h         |   4 +
 net/bridge/Makefile                           |   2 +
 net/bridge/br.c                               |   2 +
 net/bridge/br_nf_utils.c                      |  40 ++++
 net/bridge/br_private.h                       |  13 ++
 net/netfilter/core.c                          |   3 +
 net/netfilter/nf_flow_table_core.c            |  27 +++
 net/netfilter/nf_flow_table_path.c            |   9 +
 .../selftests/net/netfilter/nft_flowtable.sh  | 204 ++++++++++++++++++
 10 files changed, 312 insertions(+)
 create mode 100644 net/bridge/br_nf_utils.c


base-commit: a5e7d8e446af9803e37a3b6a4d416fb41178348f
-- 
2.53.0

