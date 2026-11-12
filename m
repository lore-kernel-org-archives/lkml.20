Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794503536;
	b=xDPaHgRCU+NZN7zVcAQ5GnQB8bMi6MYXy2Y/4Y59UNsnQAcE6UQM/PLijDXT+hV+ThhW
	 7OdyZf6zaFjGZc0YEqb3ZRXqsHVGZ/UtJKQe/nTZPpb2vjeO/pYqC5uRwZGI1sWFgZ3XX
	 KGlEaaA76X17ulOcqSjH38T74uHGrG/SMHU52GfVEcBsdbSEaHmOr9JsDRsz+K7gnSiO/
	 lXjUVdD0KBpjU/kLduEw/kzEsdjL5er26T4Y82ufpUdA38RwMA/7gHY6c1U49ClaFePF6
	 C8fCyv5ElFMnM/h22K1P2jz3QE7sdedWFljNmz+eQ0y0MqKb4irqW+wJKMocc4gAWgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794503536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZQNtd1ogtUf073Hn9VbhfcKkxE1DWp6VlKt/Boo33zg=;
	b=qgtCGFbvJb2KJHhc9Dk6t9ccfaUt8WeLXHgcLgHwXZxV3Ks6/UoTgMM3ghsPJBiyfG/n
	 J4NPfyXzNjeOEy5OJ0oQRAVHqRgLDVsnwGvXxJkYVMZXqQE/5HwLgtqM1Z2wEtmm+Ovwf
	 cvGqB1hNTSQZaabJLNpEsMTKanEvmBYLGI1fA5QwXy7eyV1Upm+PhaOXb/BDuzla7FqQS
	 9oC7ApFI5HdRIBdGt4jB0jbz7Klj5STcXRBbtjQD7QP7edliql6MyDF+fPcsPzOYR4yiG
	 3yrYT5GVIyJjSSKG50BkRIuhGHflCKNVFBn0dDJ0pIDDL9X2pNpaWdRfnZnjqVOE8jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=furiosa.ai;
	spf=none smtp.mailfrom=furiosa.ai;
	dkim=pass header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b="JmT/knbt";
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B53E606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:12:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B53E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=JmT/knbt
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc751eddf25so46356a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1794503535; x=1795108335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZQNtd1ogtUf073Hn9VbhfcKkxE1DWp6VlKt/Boo33zg=;
        b=JmT/knbtVs4zufKToj3YLkgoL/gYsPFCn3ruKI8fQWhDWXIXrQBmQTaMTChxTTd42d
         I/a8W8XbUCZ7HvXUMMNPb24Kbk6qqkOcwBD7tibW2JSd+rSks5ah91GF7KN6hMUAeRUj
         HyNE7nCfDMO3346vsyPi5MPGY8npeFmrJutts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794503535; x=1795108335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZQNtd1ogtUf073Hn9VbhfcKkxE1DWp6VlKt/Boo33zg=;
        b=eVqYfkhIMbpWT1Xk9atwRpRlkpBppV2jFMh078X8Ef0toYDkjFup4XpWQlKCbVzdvF
         yDEfU7AYFiKkzDeFip1fG7+UzVxKVvcMdkBpq5WBluZamFE/U/MuEwcYoOQCTwG7FDZd
         8ySWNeJrwlkd8pINgm3sszjRSZRb6vcXh/ynlZPXcRST+B8MkXD00yZuSW15Euh8WcPy
         pVt6l/w1EOIgUP5H0NkaaEIMISsj3SFfdzOc57s9BQY+3O2c0+YC5o0mhaV3auwhVz+5
         059Ex0MCwmiahOrC+AycptplSI2kBsuMNtEEvlIS/mHswZ+iq8B4bVJXiXxkJ1NDR1Gx
         xI9A==
X-Forwarded-Encrypted: i=1; AL+hErEvB1kCe1BHa6YoEK+eKCY0/UIp8h+X1Oid3xZgopm5LhKlmlGE9O337AduOXD6xBwOkwBH7yI4z8DGHwA=@vger.kernel.org
X-Gm-Message-State: APuU4Z940eLfXxuTtAOWVirBnlkTySiScRzi4Y2JSQH7WSEEF27gCpPF
	4wNMCfQXicTKG7X3J5zW8mU743qrvLeC7PMGc3b4R/F29VkYiJ8BkuP/252+CLI7pDM=
X-Gm-Gg: AYBFou0WkR5HXkK7ap6YqpI6XvOPH65WNLPxt/iCoAn/A0X7TNavhn0M/nudoudUItm
	RFjezi76dBb2sM2tMSZ1WxKKnjIOBaThlYlYBRdTkgKaZmuWMn3BeVA8Ffvov94TjhpoBszbtRg
	LPeRPrwRlKSo73mdctbwrrtnrdjFI7ht1h+zHLXL4ge0pyGZZh9tA0ct8dzRmuBB40hLJKDJG2L
	YR6gkf1x5CfFaudVblz/EJcy98urYlonZaqx7KPtPFKZWE3vFasAeKLPIgE+mrn+xwv7aGbUo1F
	EmxuYK5fTIlcYX+F8+i5wTKeK88CLoEhaPyb+LlbtZJzHx2MBPlmgCVl6rW7cSk+qguZRHUrmQ4
	5MQ3d1TBFXxx4KMf7fYYJkJe7gT9EbzCm2xsVdjf5hh2oEFMDAH4a8UDIr+PWvMtMhp/NJ1gKPz
	TSEjX0Rc3kR9ve4RUm9WzFnhCrvmxql15G16E4LKaFLNolai5v0JR62eqFab6ZXFChX7nMe1NuW
	kC2xg6dOQqG0q4fXiwZqwzui0tg26Pj9Fa9L857i7aZw+CaI7rANBqSKcFEX952NbjIAJw7xFew
	dkArfF74kwiGx7tbZyKlzNGvKHYPyijFbAwVeQ3eAjSpmd/XU7Hce8H+EhozT1JT3JCahfu9Oac
	tuS1hyi/R139z
X-Received: by 2002:a17:90b:1c01:b0:3b0:9a2e:b491 with SMTP id 98e67ed59e1d1-3b182f8c3e4mr5361131a91.66.1794503535321;
        Thu, 12 Nov 2026 09:12:15 -0800 (PST)
Received: from rock-5b-plus ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1ae981c55sm263682a91.1.2026.11.12.09.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:12:14 -0800 (PST)
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Philipp Stanner <phasta@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Matthew Brost <matthew.brost@intel.com>,
	ckoenig.leichtzumerken@gmail.com
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
	mcanal@igalia.com,
	Heiko Stuebner <heiko@sntech.de>,
	Gyeyoung Baek <gye976@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sidong Yang <sidong.yang@furiosa.ai>
Subject: [PATCH v5 0/2] accel/rocket: Report NPU usage through fdinfo
Date: Fri, 13 Nov 2026 02:11:42 +0900
Message-ID: <20261112171144.3151554-1-sidong.yang@furiosa.ai>
X-Mailer: git-send-email 2.53.0
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

Report how much of the NPU each client uses through fdinfo. Patch 1
exports the runtime the scheduler already accounts per entity, and patch
2 uses it for rocket's drm-engine-npu key.

v5: Use the entity runtime from the new drm_sched_entity_get_runtime()
    instead of a counter in rocket (Tvrtko Ursulin). Reviewed-by tags
    are not carried as the accounting changed. Based on drm-misc-next.
v4: Single drm-engine-npu key with drm-engine-capacity-npu, and
    documentation (Tomeu Vizoso).
v3: Add a rocket_engine_usage_create() helper (Gyeyoung Baek).
v2: Size the per-core counters by rdev->max_cores.

Link to v4: https://lore.kernel.org/all/20261103155338.1949294-1-sidong.yang@furiosa.ai/
Link to v3: https://lore.kernel.org/all/20261103104804.1887489-1-sidong.yang@furiosa.ai/
Link to v2: https://lore.kernel.org/all/20261101152723.1430312-1-sidong.yang@furiosa.ai/
Link to v1: https://lore.kernel.org/all/20261031083642.1076356-1-sidong.yang@furiosa.ai/

Sidong Yang (2):
  drm/sched: Add drm_sched_entity_get_runtime()
  accel/rocket: Report NPU usage through fdinfo

 Documentation/accel/rocket/index.rst     | 28 ++++++++++++++++++++++++
 Documentation/gpu/drm-usage-stats.rst    |  1 +
 drivers/accel/rocket/rocket_drv.c        | 21 +++++++++++++++++-
 drivers/gpu/drm/scheduler/sched_entity.c | 25 +++++++++++++++++++++
 include/drm/gpu_scheduler.h              |  1 +
 5 files changed, 75 insertions(+), 1 deletion(-)


base-commit: 7678b7f2d38b5575981b1a7c09139a4660b66826
-- 
2.53.0

