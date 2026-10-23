Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792737280;
	b=vUfkBEhzafzr3izz6aia6o8jem31K2NcrarHQwROkA0yi6Jmt0eoqV+SV+YVufEMbaLh
	 Re8wycU+o9XkP45BhsHu3mItqlMEMQtBigjHRORZ8I4YgZQhisTzFyB0M6NlI9PpYEVVz
	 2pEExHLyGzH/sb1ZjcJZeFaH8BFq/dO9JolPP5o7RgoFLpv1nFP3bXRx0QC42Hf8FJr44
	 5q5XvhfpK9Zn5d6Swo4IUgwoCaF7imGKmlt6sr4vYbhTOUACqSb/JOFIzQ68DoFLnwxQF
	 wUv+SDh94EYZHCHAuPC0BKSp6oqg3V5beRrq2bLtdd/mFiP9nJoCc0DgMq0ODuIKXxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792737280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=64tBqhaCstcvhuNkWvz0hImiXE9PsoHY46iN8B5GY0M=;
	b=aTXa8uvAVuqV0pXcCT9ISKVLy64TcKC43z/J0b+Hx+pWXAegfeDaR5Gm7Yxq+ytnfkhJ
	 WUl9mT2/GoIlUoFWE2ZfriTTGQrqmDluMNkF7EknDPF12+L8NS5aPmOyL2hNxG3b0hKm7
	 48k6/hfEzzpSyXZYSSDh6KKYAvj/1fiQxtBYoetnThdiVd/bjQysr3Wdhp8D4dhFlntXs
	 2JvHsITQDgAVJUjRjJ/SavJhaALNOO0Ya4hS2MEW12dGnN8B0BzDKsmI27XtrtlL8emji
	 OR4QAtMIvNCMSvU2k4eue4pJ1E51WsqUTZmrH+mVEyrgjf9HeiB2quPvS3bYqeC7OwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=jymKQrzP;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45872606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:34:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45872606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=jymKQrzP
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so488009a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 23:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1792737278; x=1793342078; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=64tBqhaCstcvhuNkWvz0hImiXE9PsoHY46iN8B5GY0M=;
        b=jymKQrzPywf9AwIdUcu9xWn5+Plesj1/1uiO1QH6xhWF+2NYMpzwPHLq3AhtENWNdL
         b3ZRGH2G916YD8WfuurKVlhwIZZ6DYy9QJssKKLWkgq71yODslvXKjRlOckhnsZfWhkF
         QF3Je3NHebV4iDLay0cM1aPUpwIZbcpusRdBOcbWhhOgQ1dT8NpN6XPlwAE32oLQZLsD
         byDX7ZfuZGokp+vq7Djplbd60BKB7jC8WPUgQ5JuydXGU5UWNItX7F/i2JYIZniWxzEF
         deod3ABMkxx+nZxdsnZP18p5hOyrW6xzAXl82EoDN8eBoITbzYk9LT5/2JV37h9Z+bS1
         abLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737278; x=1793342078;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=64tBqhaCstcvhuNkWvz0hImiXE9PsoHY46iN8B5GY0M=;
        b=Vcj7Ng+HwkgyniAx0Ax3WDeHjMCv02GN+f+6lDlqXkMX1KZmljRMFwKNREG4DUmmxm
         lDBgd9tHnDJ27LOAok4AC8d1oT0ymVEQAITr7JAqKvFq/rh/3hkVW8LOBuHudooUtHyE
         7sIr1NjH9VjcSAfjXoGOR4lgNuc0Uzn0ERT5VcCeJ5nAPn3iUHfzqPuu9IsqM6drMK1j
         3iZwX0ByhVkWEss/ZeHE+E7Je/j9Ty5e2Np7NwFoJMQMfuVKsEL0PZndUwztZS0p34nl
         Yv3fss57lZ7Lq5PerLKWZnyJHgzGOSC25A1RCfh4A/qEULAyzD01ZHuzdX2hvMClc1L+
         kTEQ==
X-Forwarded-Encrypted: i=1; AKwUvBydMCJfIUNU4GilepBS1VLXMgSl8kGlHOSqmrx91GL91g9vHEKvg5AVYmHVDK2YJeu2KWdfjWNKrVzu66g=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0SX1nhKfjIbrxptbuy9c7/ONICn6cJJT/KAG9w+Q7dX6iMoT3
	Fp85iVGGaVQf87RfScejx+cDcchxlHyJtfnAD+yRVqRtSmhSU3VbxSLYUy9CtYMTZe0=
X-Gm-Gg: AYBFou2ZWX05oUvzRJYzXpipnlgXejaHshSMicMtb/AiXZHXm9ZaPDf3OqflNakjPgV
	vW45pyatv9e8QDJnfhoGmGFP/LNT3OpRt9+Db88c1L5tXfxP6ad/Tk0WzxcE4C91OuUqB8TWPh8
	rwq6pALhtB59n3rwgQ5O6MO2GB+KYnTMIajUMOQvZMD+B/7nTyPP6bRk3yuFRtufoYXV064tiRt
	gx62Od4n1VjZyvyzeKJm1anCZlmtWLPOAemEg8YRjKm4wOjB+Lw3em3VnxOS722T79cyX+6cwrR
	xfXjQUMvmORYnTo+1SFUADiL/XMCzlqGkqBiKWVBYbZYgm69EOWPD0AQ9mcHwnzbl7p/f/A43VJ
	tSuaW0BIdRatgDwcEDK64myP5PrCU2JuC8fk7Wb0q1Da9V0G6qDq8oZmey3uVS9794aH1T9nE2y
	5ApyDPCfPQd3TZ+e+ZfMU84bnPSEpc6YFYyc0ykUUqMCh1RQ+fXawYeIqpizG7Zs03/RdzgobYV
	bbXepw+yr+eh2vQlRJruoSeOdU4ceBiSPQvhgnCsdotE1So3WNXJEPrMZ32XoGg8UECrRCBh1ot
	ow==
X-Received: by 2002:a17:90b:1c82:b0:3ac:a7ee:6770 with SMTP id 98e67ed59e1d1-3adce0ccd3dmr1138974a91.7.1792737278490;
        Thu, 22 Oct 2026 23:34:38 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.103])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3add246f308sm575202a91.0.2026.10.22.23.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:34:37 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Dave Hansen <dave.hansen@intel.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alistair Popple <apopple@nvidia.com>,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v3 0/4] mm: Fix page-table teardown during memory hot-remove
Date: Fri, 23 Oct 2026 14:34:24 +0800
Message-ID: <20261023063428.3658761-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Memory hot-remove can free page-table pages allocated through paths with
different constructor state. Some paths run the page-table constructor,
while generic sparse-vmemmap population may not. The x86, RISC-V, and
arm64 teardown paths did not handle that distinction consistently,
leaving constructor/destructor accounting unbalanced.

Make pagetable_free() handle any remaining constructor state before
freeing a page-table page. Callers that already ran pagetable_dtor()
have cleared that state, so the destructor is not run twice. The RISC-V
and arm64 fixes then use this common helper for their memory-hot-remove
paths.

The architecture fixes depend on the common MM change in patch 1, so
this remains a single series. I expect it to go through the MM tree,
with review or acks from the relevant architecture maintainers.

v3:
- Explain why pagetable_free() does not run the destructor twice.
- Add the x86 stable prerequisites noted by Jose A. Perez de Azpillaga.
- Collect Acked-by and Reviewed-by tags from reviewers.

v2: https://lore.kernel.org/20261010112457.49485-1-songmuchun@bytedance.com/
- Move the destructor decision from x86 into pagetable_free(), as
  suggested by David Hildenbrand.
- Use pagetable_free() for non-reserved RISC-V page-table pages and
  simplify reserved-page handling.
- Collect David Hildenbrand's Acked-by on the RISC-V PUD fix.
- Use pagetable_free() for arm64 intermediate page-table pages, as
  suggested by David Hildenbrand.
- Trim and update the commit messages, as requested by Dave Hansen.

v1: https://lore.kernel.org/20261008073021.2512665-1-songmuchun@bytedance.com/

Muchun Song (4):
  mm: fix missing page-table destructor in pagetable_free()
  riscv/mm: fix hotplug page-table destructor handling
  riscv/mm: fix missing destructor for hotplug PUD tables
  arm64/mm: fix destructor for unconstructed hotplug page tables

 arch/arm64/mm/mmu.c  |  3 +--
 arch/riscv/mm/init.c | 32 +++++++++++++-------------------
 include/linux/mm.h   | 37 ++++++++++++++++++++-----------------
 3 files changed, 34 insertions(+), 38 deletions(-)


base-commit: 26d7e34b4226709084461a07bf28d9066fa96d8c
-- 
2.54.0

