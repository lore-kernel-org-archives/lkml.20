Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0DA3FE35A
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 17:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791134171; cv=none; b=DlW3Lu0ApFAgn8sHjjk9h6mKjv9E8rodAc45BTyQtsjEzGTh71BX9993/bqke2g8nM0oXl4+qlaFOxbpmUW4Zq2chP0/j402ZCY/S+KA8iPJ0xkPqEPoq/240rdGTH3bOzMHzqVhmhDpcyApgueIclKqhAPraL77jhXgZGDkLkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791134171; c=relaxed/simple;
	bh=rBHJvSFHLogmhqc8qfoepEplPJGPX9ErzSBr3vdnmXw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r8X80eFo9A7YvXq/G0HxIecrBQZ7ypweWW/O+00pk/NB4mWSDm3OXY2QxGolLLKTZbbzall2IOwnMffgiIaRapfWvqmisDzWXiUm2E8nHJ24Q7osQFJcKRsMswwRjK/6UqiB4OI1q6WP231Pl15VvT57VB5dXagnDaBIw3J4Q6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=c5LQ0Ngn; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="c5LQ0Ngn"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c2e2db5e8e4so190944666b.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 10:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1791134167; x=1791738967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pYMVFKoytfLOZjDdNYvHmJsPemFRuNKvWdr0rA6Xpv0=;
        b=c5LQ0NgnxmgzgAX9APuwJeLA2LhejR+NZRo8avB1iEDHndr0IP9ah87SWkXn3UEIc4
         EZFpsIJhByekL7Ry4oalElnDHW2Bn8KXRbsEe6d4E/AGd/MLCGZcjac977RyLymzAp0C
         K+S5L+0LUvwiJVVFz5KjVU4GOyKWQiijuvkvmulkv1cnny1OWZGPKMNUb5Z2jtR/gn4r
         jv7N0Xshq316EC4o6u8UMvvGkBLN0ytqd9dw0j0WjO4n7K4M3GE+RGAPZKW+hnVUoqNf
         OEb5kmTZBWmdHUWDagr37MxGFQ0ZPQx9KbCkXp56dKNkZenLr2HRJRFaDe+Cy7ZpYV/D
         HeYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791134167; x=1791738967;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pYMVFKoytfLOZjDdNYvHmJsPemFRuNKvWdr0rA6Xpv0=;
        b=tIRwYOnMBakKQBb/O5ya+/3kShD902XDymsWb4z9HZxRo6BhVJQVDecikdqbg/OGqu
         4BisVEgKUVJOECU/l1nuJl755HrYM2+Ln37MWtl17EADJaeQhE4Ch+nVGl6ELZgyna3v
         PrrsaF/7I5U/mYDhEhT166dJSrw0nv+srQn6UaGh9x7ryWYSe3uMW45blEh07BmhNQGw
         GXiT6EEiZ3oTq9KACp5Xx7IR0s66tAdU7HsbZryuXjicF2yGgl9NBXnL03ytEpwygbhJ
         vhO0kUV7n0swNuFwZyaXbqfbUk2q5h3tHsqRW1YOnufPI0Otbu2pJ9n2swOCQYfgExMY
         /xow==
X-Forwarded-Encrypted: i=1; AKwUvBy9GsxJCA5o46UOFzhn0tuUfk0zemOIK4W/LvnWsW0+Yuk8/MNtyS7TlTqjoM2gxg6gYBEL7QS0rGRPL5A=@vger.kernel.org
X-Gm-Message-State: AFuF++l/3jQKDhN86tIaI/Te7relDbupcSrVx8fgcLg1Hq8bfTx2NhDO
	KC/99kQSh9BsJrRnpI7aPvq0u4t1mLvMzRhK0PwVCF3rwEMM/F+6M1CJpkvJw/DP3g==
X-Gm-Gg: AYBFou1dEKBrZLBPgfJQRKTYRRgXkchZXG23ZBTLkynAW1BDFHCtLBEMZwgjzSUXnkS
	39hV8U2Qwde7pkz4r13zrQjTyxRgCuHu+f8GlKIH1r4kT2XTQ/DLPwUO7eTKPHGaK5VjAJqHcD7
	fHOj61btDyUO58Q1seC8Bct1aZ2go4kzzPRyDoHUOOgiw2dogrgH3TFHJGUEnd54dPBuOv3BpHX
	XgaB8xYaLkce5lVpTLl5vO3hINSmCo8xB0ooYc0eUm3l035QKnVOiIIldnlnWRrpjJ4Sf1j+Uyh
	TylR6ilGwrRbkdkINPpi+bSeMYMW9xMQWHFzWyOFkqzt9LEjhHq3CezpRhwYT5eHBaAzB7xZIUk
	YkKnmCRdDYJy28BhnJeD/eo2QyMPpZCghUnQvCocT4aGL8EAG4UlXMjFfm8OBoy4I9HVjELJdWk
	LCzhFiY0Mf/BCChptoxrV2sres+k+gR6SF9T1iAzS6IeVQcITbUv1jNLzfiv7Q2MZLk3I0s9e2E
	1v4IQKrLLMVuNFgJ6+prGiLu6Bm4PzB91QUyGj1dty8wbiuBzrJ2a9j96bNkq5tEjzCQtycJFqM
	8gLWUjEzPoFOH/eBOgseQ7mZraIuQQiBTaXiJKSaHHv1ogq9GaYdRv+kdqxe0rQr21sG0GuSVoL
	QvzH/7016ztT1NxdyO997UkAfCyqvVckIz49dRUk9XSlHuLppk4F5b3RwwOZJ77c30CheSiJGUv
	WPuLVedJg+yukGmDtau/e441qGV+eNptAj9g==
X-Received: by 2002:a17:907:a648:b0:c26:19de:9138 with SMTP id a640c23a62f3a-c2e6ee5ffa4mr444266466b.43.1791134167223;
        Sun, 04 Oct 2026 10:16:07 -0700 (PDT)
Received: from Desktop (pd9513667.dip0.t-ipconnect.de. [217.81.54.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e878b0e05sm82284366b.5.2026.10.04.10.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 10:16:06 -0700 (PDT)
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
	ericwouds@gmail.com,
	dqfext@gmail.com,
	netdev@vger.kernel.org,
	coreteam@netfilter.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH nf-next v6 0/2] netfilter: flowtable: tear down bridged flows on layer 2 roaming
Date: Sun,  4 Oct 2026 19:16:03 +0200
Message-ID: <20261004171605.3544792-1-julius@bairaktaris.de>
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
Wi-Fi station roaming between access points. Patch 1 makes the flowtable
gc tear such a flow down. Patch 2 adds selftest cases.

v5 tore flows down on the switchdev fdb delete notification, which the
bridge does not send for every move and not at all without
CONFIG_NET_SWITCHDEV. v6 checks the path in the gc, as for a stale dst,
after Florian's review of v4. Eric Woudstra wrote v1 to v4.

Tested on an ipq807x router (OpenWrt, 6.18 backport, out-of-tree PPE
driver), three runs: without patch 1 a roaming station's download did
not resume within the 29 s observed; with it the longest gap was 1.1 s.
Without patch 1 the four selftest cases where the host moves fail; all
six pass with it, also with CONFIG_NET_SWITCHDEV=n.

Changes in v6:
- check the path in the gc instead of using switchdev notifications
- leave the flow alone when its fdb entry ages out
- drop the v5 patch that stored the bridge vid; nothing reads it
- selftest: more cases, including fdb ageing and IPv6

v5: https://lore.kernel.org/netfilter-devel/20260914072541.897040-1-julius@bairaktaris.de/
v4: https://lore.kernel.org/netfilter-devel/20250925182623.114045-1-ericwouds@gmail.com/

Julius Bairaktaris (2):
  netfilter: flowtable: tear down direct xmit flows when the fdb entry
    moves
  selftests: netfilter: nft_flowtable.sh: roam a host between two bridge
    ports

 include/net/netfilter/nf_flow_table.h         |   4 +
 net/netfilter/nf_flow_table_core.c            |  44 ++++
 net/netfilter/nf_flow_table_path.c            |   7 +
 .../selftests/net/netfilter/nft_flowtable.sh  | 201 ++++++++++++++++++
 4 files changed, 256 insertions(+)


base-commit: 87b80c2f6b05cad9f0ff9136709c62a0f59923e3
-- 
2.53.0

