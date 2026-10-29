Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793254033;
	b=3AFGiO1A2JZxPadE3o9yugsfc/hl6UBAhbdxEbfo6jL7v+EDwnXSnTOUZm9JKQ5/6Czd
	 9tCizSdABFIEbZMbwRW3zp0wfE78/VIbUBnFxk1j7tylKT1ztFsC5u6saQgy8dekBhL8e
	 fom+VCGBv3grIjPHSzYA0Thua/BwIyPjMXjiNhh02ZaPFU8wB+nrrNbArmR/tUtj5xsBc
	 zyYuPYlA1odfFyPQDz6fyja9eiwlAt7U7fDfvhe/f/mMg5e4pftjhhmA3b8WK/NyE9fjj
	 Av2u7xnO71Iz6m/0SGbOEDD6GFTK0UL/y3GWRbQs++fkdBnkX5Ux10xS+Emmu6cqZFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793254033;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:User-Agent;
	bh=UNSxvxACDv6rV+hh5v7KUi83+vs01nWTUXRQ2PYQNxU=;
	b=BPzrO1wgTqZ4CCrQTqbMnheYBzmkPJfRk8e57hgQEVoG7qE/6cK067Y3QSSW1VHl3fWX
	 NYzXlRM4Ej6U9jJXfHQVCVycLkJ1HPdsWmSwbU3N30RQLDt2smLdNiKjz7MLiGyEA2a3F
	 5aLk6snoWXe8LC3nMy1o9VasRQXfuDyPa69neids8G9zQPPZOEll66s9gGUKwBzFpKOso
	 5/7TwD2dOzvetwTWfjQIzxgoDbVPqhP1cZjzIpNnZepwJN9xLIPUcup5FhqDv2QEbYBt8
	 Q7ua7z7xguiSaJ41L3Mq88rDdxKVC0ACoPU9IhaPMvYfgO9o7IeXKSsSWXzipTTp85g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b="ho8P/1C5";
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D60606A320
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:07:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62D60606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=ho8P/1C5
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e5fb79ce82so10998175ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 23:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793254032; x=1793858832; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UNSxvxACDv6rV+hh5v7KUi83+vs01nWTUXRQ2PYQNxU=;
        b=ho8P/1C58VDquswjb3GmuApdin+fY+YgGO7SBCZ/wPMbXdQrudpzDuUrJH4S6ZUrvR
         T+OrvnuItCtqAf9/RUcf12PyjpkM12hnNS1Uv8BrIkA1VkPRwhFjpCW1PEJNrcsRQyCj
         2zfDeWx/VJ8ci2CjCPmBrruNDmJ1NV5pvIeRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793254032; x=1793858832;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UNSxvxACDv6rV+hh5v7KUi83+vs01nWTUXRQ2PYQNxU=;
        b=0DGcjSjrnMgaLzEtpJA5FhKauXElMIq9hQdmgTPBq4gLySRjTANr+gHwOAHewxlKp9
         Kgrtep/TVgpiWzNfawtWtMr5BtHGzvdlmMbWA8VFNThPAo2wk1vMAO85f9U1hjKVRYtO
         cSx0N49kh6V6hydPjZ7Hlf9XAGZsGyItummoVxyvBej13F/DcJtLNmHItQ9FZStZtys5
         nDuwR30AS9AtFnQ0Uxr5rVdfnmwa9Bcad+hAEJ3Zenne3YNPOiwVRW5b2TkY2kNpgIPu
         ds8CdfhZ1bWiu2pTmyMuouUaSXW9/q+/ILlFMCDK9xvpj8CH5aBeQlQUQbUYTbo2QB0u
         P8kw==
X-Forwarded-Encrypted: i=1; AKwUvBxbXYmN/KmsfSm+ht9i6whkvaqA09YlELE7MCjGKw9efUzf3nbgYDSVrQF3UsIDZci6MOBnYSF+YWW9KMI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXwG6L0/YYkYLUqkiU1ZLLLEfnH0B34e0FMI8QirEcIXVZeoWV
	OoT220ie//MQX+RZ+uVhIrptRRI7d73vrV52hLIW6ALibo6a5I0+4V7c09aeGCS6XXU=
X-Gm-Gg: AYBFou370b88zpmrly+4ZtoMelecck9dL+YS/0ETqfKbinEn+S5o1jCljMMC9f85mZ6
	W8kcc0iKb9XogqfVC1mVc5CC+WdFrows8tHXlYuCCq1r05OcZpvFVZk3ZA8f27+nygSIxLgZX3i
	sa78+5tK7/In8/ZTFfe1vPW/6qNg7bvB9yPicbDUt/RPf87MqYh2VuaQ28MQjeCAHdGEo/zhEl/
	NIs/IcA1tR13T9/cWrCLtpPqNDgOh5szNJzmeI5yLkd4Ndu5XM5jD3o3iOuF9M1hsfQzuQ5H4bP
	1tJZyDEAPhrGIjaq6ZoiWz1nkEzqA2ehoGhueMovD3F+dSOyud3iZAAhrQJsPC8G8+ZvrvR+YF7
	BI/OecH7J5352JJvIDMBAJAOi5TxRKAsZ44YXtIHjo43e9DGVc3sDFF2IRY4nHZmqz+hUAK/tPe
	L7zKtuV0BCvf89/iYaKdH+2xtjl7zljQqM29091JDcWmN+7pIEQ9OmI7BY6J02zyageMMV6yugB
	Q/UEKCeULII8wGhOYxnZCW2+9Uc262qv8dRKKiSTTFfiLMFHX5DGQV2IWSbtth5cqtLDO5/8wCJ
	cspOV5FnyYoWSfndR3XiSEE1t69W0VDl/j0UrfpFZ9T1DbxO09FZYvvkxmZC9YFpYjwVJKXyYfR
	d2eIWJuG8BCyI/u/kxRj9paKBXIWhROTh+6ysLNuOFt62w+LaRhHiXmvJ8Ostz97nIgZFfA9r2A
	==
X-Received: by 2002:a17:902:fc87:b0:2e2:b7b8:abc5 with SMTP id d9443c01a7336-2eb0038e312mr41423305ad.32.1793254032255;
        Wed, 28 Oct 2026 23:07:12 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae64549dfsm29271725ad.4.2026.10.28.23.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 23:07:11 -0700 (PDT)
Date: Thu, 29 Oct 2026 14:07:06 +0800
From: Chris Down <chris@chrisdown.name>
To: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Kees Cook <kees@kernel.org>, Marco Elver <elver@google.com>,
	GONG Ruiqi <gongruiqi@huaweicloud.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: [PATCH v2 0/6] mm/slab: Support selecting slab hardening features at
 boot
Message-ID: <cover.1793253633.git.chris@chrisdown.name>
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
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Slab hardening settings are currently all build time choices. This means
that, unfortunately, hosts with different requirements end up needing
separate kernel images. At Meta, for example, some hosts are built with
these options and the rest of the fleet isn't, and that's one of the
things that keeps those kernels apart.

Following the discussion on v1, this series now does two things:

- SLAB_FREELIST_HARDENED and SLAB_FREELIST_RANDOM are cheap enough with
  sheaves that it makes more sense to just enable them by default than
  to make them switchable. With both on, system level benchmarks didn't
  change measurably, only slowpath heavy microbenchmarks did [1].

- SLAB_BUCKETS and KMALLOC_PARTITION_CACHES cost memory (Harry measured
  about 1 MiB and 18 MiB respectively after boot on a 64 CPU VM [2]), so
  they get slab_buckets= and kmalloc_partition= boot parameters, which
  default to on when the option is built in.

Changes in v2:
- Make SLAB_FREELIST_HARDENED and SLAB_FREELIST_RANDOM default y instead
  of adding boot parameters for them (Vlastimil).
- Skip the memdup_user() part of the slab_buckets test on !MMU
  (Sashiko).
- Keep slab_buckets= and kmalloc_partition= separate for now. We can
  discuss whether to merge them into slab_hardening= or similar, as
  Harry suggested.

v1: https://lore.kernel.org/r/cover.1793086056.git.chris@chrisdown.name

[1] https://lore.kernel.org/r/auITixAJMfLtfa7i@chrisdown.name
[2] https://lore.kernel.org/r/179312451613.474906.1475329637924619088@kernel.org

Chris Down (6):
  mm/slab: Enable SLAB_FREELIST_HARDENED by default
  mm/slab: Enable SLAB_FREELIST_RANDOM by default
  mm/slab: Support disabling SLAB_BUCKETS at boot
  slub_kunit: Add a test for the slab_buckets boot parameter
  mm/slab: Support disabling KMALLOC_PARTITION_CACHES at boot
  slub_kunit: Add a test for the kmalloc_partition boot parameter

 .../admin-guide/kernel-parameters.txt         | 15 ++++
 lib/tests/slub_kunit.c                        | 87 +++++++++++++++++++
 mm/Kconfig                                    | 11 +++
 mm/slab.h                                     |  8 ++
 mm/slab_common.c                              | 48 ++++++++--
 5 files changed, 163 insertions(+), 6 deletions(-)


base-commit: d15d7703166daf7bd62c844a3cb1b3a6279adb4c
-- 
2.54.0

