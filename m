Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793764104;
	b=HjP5jUoHjysCX82a0I5mHEjhYpEaFP6w5LLNzxS217IkSdcx22PbgRaeq4F0BXAa9YEe
	 axwESWtLgZWxClD22XrblR3snezCq5Zv2bbxMWx5nNhhXIc7E/ZcAIokszKOzUgWi5yW7
	 tGvIKfJuXLhc1NgwsKWNhGrXvMs4XpDaIqtnfZjXl3LpDuv2QosBxfOhsFk3AKDabj44Z
	 soXd8TxAQJ/+mIgYx9tH0KHoAdaFDGg94ZumD3XpL52h3fUWLIme2yG8bD4aTw+QCE/PH
	 TxY8AF8/Q7gZWU/1msnw8KQqSDQfcHi+gd4jAyVQZGmfpl2yjxRXwuhQFhmfsQQi7mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793764104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zgT7bUtyHPWasmCZmDkpecrIY3qUpLy/3lFoHoAwrQg=;
	b=QR+SX1zSY4f6i12K7PX6/sHxi6Eo2XEW7Z5OHDsbCNl5LmKDGu5rQeuyj82iy9OusbXv
	 8hzz5Gr11wO6phxslnexafZXh4jHxylpWxC3815zmeM/8CeUd64LP+waEuwmg+JIqtd0k
	 dz1OmlzoLILudA0tBPAArQpDS+XAfVuJIPafjmCaeiEkGA74ctz+AlyRnfXEt6W3qA0Q8
	 tpxDDra4H4CIuqbBSv7zGUsQn2BieI6QdU4nbzDN6Byg2LyTpPBsh6LL9mP8PP5Q0CNx1
	 SoMMC1RUu3y3F9BrLcYxpRwXJl+lCZWkQ6KiD5MEyK8XwkSfqadSUwuzQZh9T6yltaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VgUuajXE;
	arc=none smtp.remote-ip=74.125.227.133
Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A38606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 03:48:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2A38606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VgUuajXE
Received: by mail-pj2-f5.google.com with SMTP id 98e67ed59e1d1-3ae7c6a2d07so111595a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 19:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793764103; x=1794368903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zgT7bUtyHPWasmCZmDkpecrIY3qUpLy/3lFoHoAwrQg=;
        b=VgUuajXE3fSQNacAxk3tEj3LnGJEDe8eO4Xmi74v6UY6fHz6tM3wa7S4tUAUWkHaBM
         59ho7QGCRoW/e1+9Kfw/D3fuzzPaViTo9tlaMuoP7axIzYO2nEO17qpALd9cEOTLymK6
         UYFvxKM6X9SUGVxJowCEQrtOBdJW/HWvUoAZoEvn5ATujp/55l/zYq78izLTyuuLUSpe
         wSrm7vgT2wQcq1AB79XHUT0+BU5jNvnwTpab77YKTc5ImYJFdywHCga0pB49jTwNEAOn
         YENRyBabanJlUxoJqV4t6/vIXVCXdMjYrbJ26/qhFsUqDm1o4E5sTJf1sc34JPYx5bsJ
         /9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793764103; x=1794368903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zgT7bUtyHPWasmCZmDkpecrIY3qUpLy/3lFoHoAwrQg=;
        b=daXybbij7EY6ExUiN/4eHRFRYAFMQoFF5HiFGK5kp1gUStzSw9eWjSYxEzx9YKa60v
         Ah9Hc1XPabkLJCMxxjzY51/tCDqWXZ1bixSU4MJbY6xqf26dwBAqNQ1FlpTfsNfhArrZ
         KMAX0oKHV6h2bRp8NE/Q43/u44ESegea24nogaT7JiEFLST7UJnn2TBXtlJSDfYgfvbA
         dKQ0VtyF9tTa/LcN4yIRPgZXtp/yyRPukGD/pE1suIa34FC3uCmgMRc2ywBSYf0vVNTx
         9o+PNoEw5wqG5+IAo7oC3xKLdxb5wfazhx1zTTz5Q/loONyakVZsan8Vuo4DUDACLzfh
         ejMw==
X-Forwarded-Encrypted: i=1; AKwUvBxFUXMiZdtJeGhhWC2tweqfPkfj6Rl2kqapyqPbRsXRcTzaT4XCKg0ZFcElQ3n7nMOUAjKZpAUlPAAhfPo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8N9y4XZOecHjb1BFsMHII9Sg12VquMaRtG8YvuDXQYt0dQ1R6c
	shdDm/XzkPMr5RbzCV3xTiN/NppF5ADWsBsp4AYFToxfh0Yf5sTEddi2
X-Gm-Gg: AYBFou3bEFmqu2NDoEBZ0ldsqHcekzmp/DrRwg5+Spuep2hXLYywYLyOyQGCtss6xXO
	s4bTRvXorIWLJK1/s2L/rvXfDAh6JX3ZY/ZpXP8zTeAyU/OTmm0Yd3SMI/E11MD2T7y1ISDl92O
	ruU9ISNCKMbr0qZmlBJtWK9YKZioXKNaaG8J1LSwoV77NzbsZfOmI+1XlU4EQX63SAu/OxNnUsh
	uZguHiKgVoPnYWxd8FVpvS547WhwppTdHVmF7gxKF5E76GySufQkFnNIyiu5/gDfFoxqqsICSZ6
	Kc/qmorTJsP6py+MqRH3XjgUEOrUEu/1fX3B7GwHJHUNnrgN/Q2LZXjsce9kyxIXN3fKlCaoQuV
	mWYopkGyhMqCRxEBTB5iKJe3yVVAivZyS8oGlwdHUuS4YU46dGVe4UTuaIcvqw7/0hPfUvc5XcE
	+m/j30vpAVkvHiBdK91Z6NuKvTx5rA179tg6HU3nKb58OFOS+w3URT6L2RJJ9qcSb9sL3N9u+YH
	vkedwjsY3aWkVs1cC8w3QXmQZncn5/ZYik4AhmdvTdGVR68ZwS/hG8qLVCIa/l9yVeGhosrsUlq
	jvI4oWDkdyExSCF+x3UIasEdyIfYUFXluHTxvvGXFEAegLzje0A+D0rtMlXwTb5TX+Vy
X-Received: by 2002:a17:90a:ec90:b0:3ac:9c37:942e with SMTP id 98e67ed59e1d1-3ae89831a14mr12516860a91.49.1793764103123;
        Tue, 03 Nov 2026 19:48:23 -0800 (PST)
Received: from localhost.localdomain ([240e:46e:1a00:3fd3:e1be:ed6b:40ce:8dab])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0944a0ff7sm1705472a91.10.2026.11.03.19.48.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 19:48:22 -0800 (PST)
From: Rongzheng Wang <testwrzwrz@gmail.com>
To: netdev@vger.kernel.org
Cc: Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Magnus Karlsson <magnus.karlsson@intel.com>,
	Jason Xing <kerneljasonxing@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	stable@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rongzheng Wang <testwrzwrz@gmail.com>
Subject: [PATCH net v5 0/2] xsk: fix multi-buffer TX software checksum
Date: Wed,  4 Nov 2026 11:48:07 +0800
Message-Id: <20261104034809.24545-1-testwrzwrz@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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

This is v5 of the AF_XDP multi-buffer TX software checksum fix.

I found this while testing multi-buffer TX with XDP_UMEM_TX_SW_CSUM: a
two-descriptor packet had a bad wire checksum, while a single descriptor
was correct. There was no production or syzbot report.

Patch 1 moves the software checksum calculation from xsk_skb_metadata() to
the point where the last descriptor has been added to the skb.  The old
code calculated the checksum after the first descriptor, so multi-buffer
packets only included the first fragment in the checksum.

Patch 2 sends the packet using every descriptor count from 1 through
MAX_SKB_FRAGS + 1, and runs the existing metadata and checksum verification
for each case.  The last case is the copy-mode frame limit documented in
af_xdp.rst.

The updated selftest passes in a local QEMU run.

v5:
- remove the unnecessary else branch after the multi-buffer check
- carry all review tags received on v3 and v4

v4: https://lore.kernel.org/all/20261030023248.78802-1-testwrzwrz@gmail.com/
v3: https://lore.kernel.org/all/20261028025026.11401-1-testwrzwrz@gmail.com/
v2: https://lore.kernel.org/all/20261024141157.59301-1-testwrzwrz@gmail.com/
v1: https://lore.kernel.org/all/20261024091256.17918-1-testwrzwrz@gmail.com/

Rongzheng Wang (2):
  xsk: defer software checksum until the skb is complete
  selftests/bpf: cover AF_XDP multi-buffer TX software checksum

 net/xdp/xsk.c                                 |  23 ++-
 .../selftests/bpf/prog_tests/xdp_metadata.c   | 147 +++++++++++-------
 2 files changed, 107 insertions(+), 63 deletions(-)

-- 
2.39.5 (Apple Git-154)

