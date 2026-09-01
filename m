Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6533321DE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 06:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788245944; cv=none; b=h/OOf9rJIJcXrb3o5ynxXeCYpYA/JpKMV0X0dNmAkJ+8nQeWG/w4qoh9PFyQsXUM/TZI9R8L/k+GDDo3hYFvEkXMUFD2j3Vc2BjK4ucNeLYcU8w4/2KSNaeZzoZ6k05vX7/tc2uuVzcCyYgNmvJKD2BLv7bA7CY6SU9iIQISV7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788245944; c=relaxed/simple;
	bh=p1ecGBLAUPlq0PWhqjYuX07pIOBgZZpehoElKPBJu40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=diUO30VsFK5RM7U8YQlLeLONH1l/jmUuHQW43aVoW4FSFp6L9vaiJYo0e+g4FaERsoJPTfpFxnmBum+G7fOuq/2Gxvd0pc9eHi8KfFreOrNxSnbVHPR8BIyNapHu4s46L6Eo5NP3Vbuw9g94w6nbpIkDrE1WFIwfZg+oMibB0N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X19+9BI0; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X19+9BI0"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8568e3ecfc3so2729583b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 23:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788245942; x=1788850742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=agpKfLahOgIlbtuVqPJI+pV+aaacYEptBf9ONahRpL4=;
        b=X19+9BI0c7wRbzaAw+SpofusamymEmR+QsWg5K2KjPLSpU/o1zKbQHngTs+aJWVaEh
         RHAz8AeCk0uRU2muDvr2skx1P2KZ5viOg9lXzU/fY+aemyOPeoVwZ5wJvGOd/TVWcqzj
         3Jk673NUsIaev9s0pJ75HojpiTqWpP9gE5TpoL2vZO7JODhLexhgpz55TVcFW3onTM2R
         Sfg8cDuOz2s5m4KdUrp5XMhn8kJcHztgyvhc+bsEKcufctvgwmZtANPisOml9Qdb8TUq
         //1KrYZr9aO3Haw/xOJOHd59ZeRczwtejZdbwjnhEXDpuns9hVPdmOj+ElT0M1b96BBQ
         MoXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788245942; x=1788850742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=agpKfLahOgIlbtuVqPJI+pV+aaacYEptBf9ONahRpL4=;
        b=k6JeLjDRT3DOOxQKP/SX7NRgArSPROjFLHmou/WIt7sPQpbQY+IrNiJ5ntQu8xgmOo
         DXrxXp9X0uOjKIZnKL89O+D4WUMOIKvKZokaFubUvqccN6LLU7keZMjRh4fO0n+9EsXk
         OzMsncSrtFHsbhYqYAT1uQ2Iop84ytC1bN4UyXbQAiMnh9T9YCHg31BOejuOwEGwMX2i
         eI6nGrt9Wtp+scTzsbtmIrQbYYAIbYDTsqs0hYW9j3sl3ZCaWQj7PrVVwuQgzjkIuFH/
         020bNFwEXDtB9Dyk/GgFMpgN+M7/ZubOSuV09TuG7GKmMxiUlguecfvDyqOQ5LQ6aCzR
         +w1g==
X-Forwarded-Encrypted: i=1; AHgh+RqvJpkaMuraf5XZ1VcTdWLhHcZsGiN9XEfMDh4lCJ/9H8tutsvdNjXwqKXeM6kNEPbON5n1f6E6qL86kqI=@vger.kernel.org
X-Gm-Message-State: AFuF++knLgW1rsSjBZfCUxzwIYX05q5MG2n8AoI/jSFcBZwQhbvBKEt/
	0CUv7i+Cst3NfuCaFl5J95yo06d3AeBrPoWWUbquoqg3Tlsv2W4ACZ5O
X-Gm-Gg: AR+sD11+bp3U3ewVbeMA/5/+NfvMphZTTv/G9xGVErsn1PiUpk7TUtsa9n2U18zlXcs
	W5CYIM3muXzKp8tbXtosHKmkRnhmuSBsOdKFlP9FBUj0NRecH1aZYt4WqNIenTQU709H6F8bpkr
	hEDOxd2qWqOp4pcvv/NfHYoWLBB09eEWycyFBFxlkIESMqTpQ0eq3O+UedIMKRfyMFYVAWAL96j
	4DZPeA5dUnproRvTU6g+j67eXm7ovHbSwAOMK6AUrxVbrzKKspCUmbS6eVHo3U/s9whwAeOrsXg
	nL8+wg7oxfOi3LZkA0+Tm82J1aQIYqUqLvpxK9+0NajuW75Dw8I9E2WR1MeVYT4C9T8OrkqvCbU
	+FxZa+Er8NYBwFdUEjEjZpv3/n5RyRFP8fwMFDIr4WicTrS1hZyRqn3X1jUh8MpTM+E/11razsT
	DM6aTSO7yqSYxZhjayxTPemEogpAlObSIzIowWw/PcNoMXNColq+1rBEUsdpFIZGdDR3L3vuT3c
	zrZRQOoLso9hyBJfHsVAOX172cULbgxM0vlWn0=
X-Received: by 2002:a05:6a00:a01:b0:845:ce5f:c926 with SMTP id d2e1a72fcca58-85b59593e6dmr8525461b3a.1.1788245942189;
        Mon, 31 Aug 2026 23:59:02 -0700 (PDT)
Received: from localhost.localdomain (vmi2317720.contaboserver.net. [84.247.152.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85be5ca747csm604072b3a.5.2026.08.31.23.58.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 31 Aug 2026 23:59:01 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Asier Gutierrez <gutierrez.asier@huawei-partners.com>,
	damon@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v4 1/3] mm/damon: Introduce DAMOS_QUOTA_HUGEPAGE auto tuning
Date: Tue,  1 Sep 2026 14:58:35 +0800
Message-ID: <20260901065847.42869-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831144732.80910-2-sj@kernel.org>
References: <20260831144732.80910-1-sj@kernel.org> <20260831144732.80910-2-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi SJ and Asier,

Thanks for working on this and for providing the server results.  I have two
questions about what hugepage_mem_bp is intended to represent.

> Introduce DAMOS_QUOTA_HUGEPAGE_MEM_BP auto tuning. Add a new DAMOS quota
> goal metric to measure the amount of huge page consumption to total
> memory consumption ratio.

First, NR_ANON_THPS tracks anonymous PMD mappings, while NR_SHMEM_THPS and
NR_FILE_THPS track PMD-mappable page-cache folios.  Therefore, splitting only
an anonymous PMD mapping can change hugepage_mem_bp without physically
splitting the folio.  Is the intended metric PMD-mapped memory or physical
large-folio memory?  Clarifying this and adding a mapping-only test may help.

Second, the metric is global while a DAMOS scheme can target one process.
THPs from other processes or NUMA nodes can satisfy the target or dilute the
monitored process's changes.  Is this intentional?  If so, documenting the
scope and testing a background THP workload may be useful.

The temporal results approach the 10% and 25% targets, while the consistent
results overshoot the 10% target to about 20% and 45%.  I would describe this
as control-response data.  TPS, latency, TLB, fragmentation and collapse CPU
data could further show the workload benefit and cost.

If I have misunderstood any of this, please feel free to ignore these
comments and correct me.

The enum, quota-goal wiring and sysfs exposure otherwise look consistent with
the existing DAMOS autotuning framework.  I consider the points above
follow-up questions about semantics and evaluation, rather than blockers for
this series.

For the series:

Reviewed-by: Lian Wang <lianux.mm@gmail.com>

Please feel free to Cc me on related follow-up patches.  I am happy to help
review the code.  Besides my own DAMON work, I have recently been reviewing
and learning from other DAMON and MM work, and I would be glad to continue.

Thanks,
Lian

Sent using hkml (https://github.com/sjp38/hackermail)
