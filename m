Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794773978;
	b=n0DQzjy3UQwQ8zYgfuq1aDsMa1lYdNyQC3DdKidpn6UiFv4dKT4llvEO9p+a7KFcWtIC
	 nIPmMRHNUVvg5EYUWBLqHk0iPICgKSu/hT7X/kEg1d90x6B6v73ujBaSfOUWErfEjEILK
	 zNjtF86En9/rdi893VbyGEgDnsFN1fS6d9F5lH5HP/ksW2X20qTB9R6MYTjzIPiP3dI7R
	 r09yhhV3a9u0mf3MCrP5faoAq7TNtNiyoyIIhwm4P0mWEZgRlud52Vm/xZ14IFDEs7RHG
	 UqNrmhB1i6TiCbpPyqayoXoIJWTtO0G9mCSvN315xe67/VFrySqsAjf1u3ugnXeLcZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794773978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=1ttIPRSTmhdwRKjQoziE86dYbp7Iv15D27TyVE9rIns=;
	b=AKpp1hHzQ41n72wTYjKUzVlVWPPu+uOVDlXHnmcR9ADL2EeMtP7PD95MjW3eTBIr92e+
	 5RSiKGhjAu5hU9pwePe8IijnFlpsNYdFbp2xTk8HdB8ojdVG7TdmQSt53BGERO9kE1kvO
	 PS+j+CrDTytKRjNsNI9JiDJIRVSxE9pLN8ocysaPob8tWCLFMi1vwZgE6kLCy/bnyIw0B
	 EZ6QtbdQM/8BOL3TqztIh3jV2YKYWfHhwcA3kmivciiLzjf4RWknVmOeCLMXUFZKJ9q2U
	 4hzR6l+k1NjplsVng8pYBiTjUb5KWxgE9QUO/DEiTVNn73K9n5nX1oTU1WfAiD+dPig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eWbol+Ky;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB76760A2629
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 20:19:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB76760A2629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eWbol+Ky
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cdb75699c7cso1007214a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 12:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794773977; x=1795378777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1ttIPRSTmhdwRKjQoziE86dYbp7Iv15D27TyVE9rIns=;
        b=eWbol+KyOeJhtXM+Yv3onD5I8G5ULY/Xlc6o3FyzJboVY8HJfshY68v/KVGcW4tzMW
         kvY59Q7XhdCUBSdZkha3X6xdCgkgaG9prS9IWTb8yWY26DgyM8crSlIymRNGPnAdLUbr
         EJx4GZsp2jvwPv8SwLp1JHfv2RRc75Vny7SgviRSP/IHkq4Xnw482hTsdCJ95k3sPEbG
         rxq+0i3pmEXGMq+WQP+mN3Um2F1kocFtH6cPKOc0Ap1Ra4gcXbvhL7d4G6Fig5RD3ABu
         Sfukg8Q1BJu8e7NLfsys+RSEAP8uhQe33EcvhTpNuLZNmVq41nuT4rK+u6ibaEuWouB6
         Ae0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794773977; x=1795378777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ttIPRSTmhdwRKjQoziE86dYbp7Iv15D27TyVE9rIns=;
        b=t8+WgXJfTTgqHI6q94Ck16ohW+BVfarJK0dwwfuyGnpz1NTXUFh9sXVMJQhyUDOiOC
         Evx7lTxC9aDtzSMipNanB5DKMAMo6itNQc1+qpbCTQ3lWG74EVvzzeoKeu2AJbyfNdfX
         KkUp/ZK7s9IQEqvAQGoPcNyWONbkYXyPoUfI2HrfQX4RWx51EZVsU+/0c0yy2HD2DSWn
         3LFxtnD4PC3pIvvhUTjdR7nGSWsrVITy5zTd+yyuZwC8J+jrQ/v+FmwRsMwOvuDkGfga
         MGT8dImtUNihNKqxY2hwB2UONmktWc/JTLSCdocm2QDli7GFpnwnc5R9abS8cgoIhh2/
         lWhw==
X-Gm-Message-State: APuU4Z/rHKmxqqwgz9i+Xvqm4P1h4MW6YEVI+fS3XMdoJOWRDGZnZrr4
	teznAnO4lN2xi5yFARnSNu2ifBvxUkCfg2jI3dUaAkMh60qIMNZrD+vS6TiGrapx9hE=
X-Gm-Gg: AYBFou1DnG5/SnndZq6NM1BJKl4oaN6UbKaa78VigNzIaKV2uib7WjAVSDYtheewO49
	6GVePU2Z7nibjHCuVU5Pz9mYFTtbZrzv0w1XeLJXb3ABhi5zHYvBrqJ1Qx3RokVLDpbwZp4BjmP
	R9HMezVKttHfsRTZdXnhWJ9ANQQSRvGfrCBlWbLFFF+0QEI+uF80pfhd64pEZd+V3DYK+M8dsha
	T8CPiqXZfG2NS7BU/XaT+GlCmKSl7l8+GPPlo03p98wOjJ2Mo06xVjreI86FFI8VrKnoZB1Vb1Y
	JQVzOXGttRFJ+1uViIJebBq2ThF2NWCBKJuENT+s4fwl+bOZci0AWJcJy3IBcxr7qqg+SbEUyL8
	2oBcdpVDHpXH/HfIXzzx0xxRef+tGv/SsxwfhAp3fjlSorQ7iSBlWJGMvQyceSavkzEmhJWoayl
	D/1jQDoE4lsg5JxraRiWgRvEdXWM1eB53VSIIYdQjoYtpPAlPnpv7sgXOKXMNKeVzOceW1GD+Lx
	MWaUJxgnUcawjekLFa5EBHliFS/rbIlYH3p2BXQ7je8N28CBg7rZGd4r68uBsBaKud89WX4zdq5
	pYGhY4CV0Oamz7l6D8yuWjCcXely7m2ifvZQ6wjINlxXCAuS0uaLq4tOb6Q/NbGBTuZ9s1tIA34
	dx+Yzyb7h4ek2C2w+hVvOvGuXh4bktg==
X-Received: by 2002:a17:90b:530b:b0:3b0:968f:fdee with SMTP id 98e67ed59e1d1-3b1b0b63d0emr8985522a91.55.1794773976905;
        Sun, 15 Nov 2026 12:19:36 -0800 (PST)
Received: from localhost.localdomain ([2401:f40:1397:c:7f10:a86c:c753:9418])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aeb17042sm13382005a91.6.2026.11.15.12.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 12:19:35 -0800 (PST)
From: Zeshan Ahmed Nobin <zeshanahmednobin@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ping-Ke Shih <pkshih@realtek.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Kalle Valo <kvalo@kernel.org>
Subject: [PATCH rtw-next v3 0/2] wifi: rtw88: 8822c: fix cck_pd_set when the chip stops responding
Date: Mon, 16 Nov 2026 02:18:24 +0600
Message-ID: <20261115201826.181662-1-zeshanahmednobin@gmail.com>
X-Mailer: git-send-email 2.43.0
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

rtw8822c_phy_cck_pd_set() indexes its tables with two values read from
the chip, bw and nrx. When the chip stops responding, both can be
invalid; on PCIe, register reads then return all ones, so both are 3.

Patch 1 takes bw from rtwdev->hal.current_band_width instead, as Luka
Gejak suggested, which fixes the out-of-bounds access. Patch 2 makes the
function ignore nrx values without CCK PD registers, which Luka found
while reviewing v1.

The two belong together. With patch 1 alone, bw is always valid, so on
PCIe a chip that stops responding gets past the WARN_ON() in
rtw8822c_phy_cck_pd_set_reg() and reaches the zero-mask register access
that patch 2 prevents. Patch 2 indexes rtw8822c_cck_pd_reg[] with bw, so
it needs patch 1 first. Both are marked for stable.

v3:
- Patch 1: take bw from hal instead of reading it from the chip, and
  drop the check (Luka)
- Patch 1: replace the forced-bw test, which no longer applies, with
  real chip failures (Luka); add a check of hal against the register
- Patch 2: update the message and notes for the change in patch 1
  (Luka)
- Patch 2: add Cc: stable, since with patch 1 a chip that stops
  responding on PCIe reaches the zero-mask access
- Patch 2: add Luka's Reviewed-by; the code is unchanged
- Keep the order, and say here that the two belong together (Luka)

v2: https://lore.kernel.org/all/20261108182837.682661-1-zeshanahmednobin@gmail.com/
v1: https://lore.kernel.org/linux-wireless/20261105113415.73184-1-zeshanahmednobin@gmail.com/

AI assistance: I asked an AI coding assistant to help find out why the
RTL8822CE in my laptop keeps failing. It analyzed the kernel logs and
found the bw bug (Luka found the nrx one and suggested the approach in
patch 1), wrote the code, the debug-only changes used for testing, and
the messages. I reviewed everything and ran the tests described in each
patch before sending.

Zeshan Ahmed Nobin (2):
  wifi: rtw88: 8822c: fix out-of-bounds access in cck_pd_set
  wifi: rtw88: 8822c: ignore nrx values without CCK PD registers

 drivers/net/wireless/realtek/rtw88/rtw8822c.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)


base-commit: 04c9984187228904f222681661c50db3f0c50b71
-- 
2.43.0

