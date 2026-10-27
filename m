Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793086523;
	b=T3vTeMWKaHTRwpjrU3iITEnM7j5w8ysf+FmpYaJ22M87RifYFAT9NmSlFcv9I2/7VKqc
	 nzYSX84CpIsMn7mrwqECgYpXpDJ1MwlksblZJdhGOAezfj0pXHRhSjnVnRQHNNB2+5k85
	 xw3M9nxmBSR7fM7SIzQOkHcorYCoJfl5gVrFQlUQu6cFvlJ1NP/d+UGwdX2W8LSyp00Kn
	 g80KhHnWzYgaDt0SQPGnHLmFtKaufjMsdAEcaxsEm+vFZndb3uFkpK9ApPl3zWJHuqF71
	 B/zcy98+q8DD0IsH9BHIULByaExQGOrvvRsbEWOyp6kKtlpALWLr/Oyl5Ol+MBgRuDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793086523;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:User-Agent;
	bh=/YRCUcykH2kxr7zY9j/CVMJiW+kRaXQLZ0+Ryrw32iA=;
	b=YKzSs1j5Y1CwOYFehAhgo3BRRpPERaommVtmK7R019MLMBIIJwqcVsAho+dJqIFJ87qG
	 WFo5816MjvDMFj3ffXjNZjQqT3no8FHu9ljCcT4aA+EB8a9S2iyeJur6CnL2PE2bYGJZ/
	 4AtcKK27da0pY8u+UT2tjHSYA+C+qqLoXFrdmmWQAUWxZzLjAoy2NWKbcVtQu9wode246
	 7Aki3q08xyzlQKDDr2lHe07Os/0Dt5hTjbL/87yYFcmplVbSTi8XLivoaq+wSgLGWafIO
	 3bD5Pk+4PGIIEwa2BD1BAYpGnqssdoObj5XTpbILIRYiz0AlQ8JGJ9fnnEqp7yAVyyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=FPRs6kHO;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0260D606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:35:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0260D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=FPRs6kHO
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc147d86bebso417428a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 00:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793086521; x=1793691321; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/YRCUcykH2kxr7zY9j/CVMJiW+kRaXQLZ0+Ryrw32iA=;
        b=FPRs6kHOEm4ATNDQSENGfPMNU0+hN+7ms5V6cCbZEJwXHuPDQk5xzoiVVGUXRe5oxt
         Y/iutnamuouYLVf4n+S4ll6RkcDyad8jjYmzDyNNWy6Pf61YESx4nxH0QJWpvVZ3cvQg
         Lfs6Ee0ex4u4AEd3DGOOX7KpSQ+l2tRoH4XEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793086521; x=1793691321;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/YRCUcykH2kxr7zY9j/CVMJiW+kRaXQLZ0+Ryrw32iA=;
        b=WOvoUN8IbasxwQylTU7xuW0Vo3Dk3cOo+euAfqS3tUSR68q4y4QU8vOGDV4cKXTdcC
         bGTSfryOXTCylkSyuCOrF5VdJvymdm29HF2V/7eWeqN2D5kZ+TrxOQw8iIx6bU6+VCR+
         E/exE/VyUz9oUM22uqgDOQYnG27KNa95xymUJIpgzJEFxFi69Sa3gBI77PMz5ypYaEkN
         8GQtlQsvupjbyoE97ajESLWtW35rgH9sl0ZGXW/72gO0Dux6uaBVlraY+oU8XGle7SVN
         CYEmV6/gfDif4wtWvgH3hvkCckyXwok4SWr6Nuh1+SVStD2W3sioe9x1JnxqxVBDefYh
         hfsA==
X-Forwarded-Encrypted: i=1; AKwUvBwvbhMLTJYZATc69B9vbeGxkfLnnGSs4CIapHOL7WSdqWaGuPyLfCrP0m7NIWjbYlwNhkpscOMxwr6B5+s=@vger.kernel.org
X-Gm-Message-State: AFq9FYIpMNh3IagGduqRxr92C2twuvlu67+EISGeOxCYDgZXmznoVo+m
	kjak/quWQpbtop5vaqiChFMOJ0aYgYblG60DpbvrAiFaGxDebYXcd3/8rxfnSftTn4g=
X-Gm-Gg: AYBFou3bsPBU3VlQkdQ0Op7rnuYfPUhhh0r5JlHc19iZDFqlvU/4WjJ24TjbTrU9h9u
	adtf/6AfCeJa559Y/W83ba+HrYKyXEFHdV86ra2LNMbhpx7Oqa/Csw60bks65//3DYNwqsHZsbU
	N2vHrw2km1XFoOfGYhJzQJmxAbjpwUPNf36A0aovZN2RklTlsz89lSuRmguXnE4QngKMsERTxlP
	oAkYKghaWLanJ0H5DYlaSMRKEsxZkA8vgWJDQdT+aHeMHW+qx+AyzmPJpj+bCd4L2MSTUBQMCWh
	ot1465Lnw6IwH9qWikkCedMqkB0vXsuvRTyNV4kl4wIsc9SNbI6RxdMZohR+4W2qW4qQC93ZdZM
	sEaWtphShOHEc9X7up7R8KyVqtDD/cR1lw1heM/Gngq3vHALuf8lR+Acg2s+lzGHPJ6o+KK5drI
	zL7tuUCfgvMvWlK78YT/IfYv2r1tXw9KAdzxRkMtYGDQlSctiOznYpeD2tJlzc1Ft7Ya3gyCVYE
	91hCqWJqNbZPsoAP4AWTcgeH1xehdeGE4YPg+qQkP5tYfYGuHeQPCELfKCR3FvlhYxq8kZcfrQa
	Hs7k4EDmVYHIBIwOJRIxVZGOdfX67TwLl1qJ3vwQtjM6r904N3YGWbbgnrQ0tJlsAzos0MaT8Yc
	rRYl0BjQQvX9MmlUdhD2v4J1XrE5lFpo6XpHfQZxgaZxUxg==
X-Received: by 2002:a17:90b:35c4:b0:3ad:7f4d:2839 with SMTP id 98e67ed59e1d1-3ae402840cbmr752308a91.14.1793086521251;
        Tue, 27 Oct 2026 00:35:21 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae404429a8sm2527473a91.8.2026.10.27.00.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:35:20 -0700 (PDT)
Date: Tue, 27 Oct 2026 15:35:16 +0800
From: Chris Down <chris@chrisdown.name>
To: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Kees Cook <kees@kernel.org>, Marco Elver <elver@google.com>,
	GONG Ruiqi <gongruiqi@huaweicloud.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: [PATCH 0/8] mm/slab: Support selecting slab hardening features at
 boot
Message-ID: <cover.1793086056.git.chris@chrisdown.name>
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
separate kernel images. Let's allow those hosts to use one image and
select each policy at boot instead.

This series adds four new boot parameters that default to their values
from CONFIG_*:

  slab_freelist_hardened=
  slab_freelist_random=
  slab_buckets=
  kmalloc_partition=

These mostly act at cache initialisation time. For free list hardening we
use a static key settled before the first free pointer is written.

Chris Down (8):
  mm/slub: Support disabling freelist hardening at boot
  slub_kunit: Add a test for slab_freelist_hardened=
  mm/slub: Support disabling freelist randomisation at boot
  slub_kunit: Add a test for slab_freelist_random=
  mm/slab: Support disabling SLAB_BUCKETS at boot
  slub_kunit: Add a test for the slab_buckets boot parameter
  mm/slab: Support disabling KMALLOC_PARTITION_CACHES at boot
  slub_kunit: Add a test for the kmalloc_partition boot parameter

 .../admin-guide/kernel-parameters.txt         |  29 +++
 lib/tests/slub_kunit.c                        | 186 ++++++++++++++++++
 mm/Kconfig                                    |  15 ++
 mm/slab.h                                     |  24 +++
 mm/slab_common.c                              |  48 ++++-
 mm/slub.c                                     |  68 ++++++-
 scripts/gdb/linux/slab.py                     |   8 +-
 7 files changed, 361 insertions(+), 17 deletions(-)


base-commit: d15d7703166daf7bd62c844a3cb1b3a6279adb4c
-- 
2.54.0

