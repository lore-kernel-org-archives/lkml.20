Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585574EF15F
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 16:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790957789; cv=none; b=Erq24tNYgbp1kHNMswGMIVK0E6yJGVOm8JEw7A2P2+fHzOEyzFMwyS0s8OsSyO1QNb1gOKvNIVvLg31d8QkHgiyHZ2vnPeg7Sxq0+1oPbw1hsuEhbcn9QH9icnH+ZKDN8SAwuIB1BC+Dd1FcFBQFTmhEtu4TxAwOkHGThiCTbds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790957789; c=relaxed/simple;
	bh=9F9PqYLol8RYefMryvIE9X8WcFhHN+25KlDi07fHopY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xuafx/isC6TepGsYQIbXVTC30TECkZEtyyI3bhAAYbRR+tzfJl9CEVfb73+kZ1UXPbnpRIF3ZC89ib3guR8De3l8BuS/ta8XmGyHzxRjuub43DIbs4c+qWjGlH1QK/NP3IJUFVrYdO1PdQ7X0VAstJD1QWYdsYdiZZjAhXrL9UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DSvlT0Jq; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DSvlT0Jq"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2e1b09e0c7so8175066b.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 09:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790957786; x=1791562586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ey4LJMK8RV+MV7vSZrPUmikamurNbFQxbI2le0bK+bM=;
        b=DSvlT0Jq08crkzAseZCIfwxExC4fHktx3wkMEscgVtz49+TXFD4Q03kJ7UoAVSYxck
         5YC5wZu4llfsRlGmsgbdgKqta7LIYFMEeH7vt1LPLWIPWDUM5qqfjUuurvl4aTczy5Kz
         m9Hu/GbS3ebEewEDbhtvOELj1QrlBi800Kj7+c9XuMZEWrr6x0N3P+VcgEMjmuE3oCk8
         /75FCLEUO2B7gDQJcF699X8S4qRTZk9DgSKK2W6Du2oduK+/VwsVpbNhT1mJP6w3Grbi
         6lMRXlK1VV8wTu8qJmzU+2H6Sck8g3lfQ28jyVlNC6i+1P19RJ+/pMlWUjbW1XCD4o4r
         vBgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790957786; x=1791562586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ey4LJMK8RV+MV7vSZrPUmikamurNbFQxbI2le0bK+bM=;
        b=ABSN3/Nd5hgIZaHuDhvK9y0Muo/0+2zl/qPQmza7/vwCltcZIHrIguPZENKerqo2Cc
         8WhG7Q7DZ+XFkDYD+L2pjvsWLl+8+Xvo2ZkjtvMbh0it7T6F2RpcUsFBjqPhQJFuW9hr
         ocx6jgCfAS10PmFbMx6YAWikVkQZY7OasB5Dagwxwd35NYYPTTpYFoDsZlImZ67jRk9u
         eYvFBSCr8cTZ48SVQ8UYRHXO1d1TY/jl7++huwE8g4N68OjOQP2Z2Om8npYNmQv4cIsK
         bO0pGeWpc4CH49BrAn32dtlf5MSI8xHJBYjRwrJFshfgV9cnGI6YBA7NR1RhPcqnegil
         W+iw==
X-Gm-Message-State: AFuF++nizNuq3tllDK2iR2VCxnQCaq/m0ELtg2eL3aD+yoM23ruHBUM4
	lS9ZG6mOReuGRzIeeCP9xtWIiXjL8jSPqGtdlSyWnqd4hkABejPY2wW1
X-Gm-Gg: AYBFou2uiSo1OoLsPJeqq6VpuPR903R+6tz+H6qnuyXASz7BGqPGTygQhz77fAE1+1k
	fAabXr0WyyEtpX5MJH2PkbdYbfh7OM4sBaof0neXmy1NQMM4wPe0cTgJheQWLhG79jmlplEPNCg
	GQAborJhe29A0gnpnGyT8pDdUgObwInVwbjOrrrza6PGDBom1xOgSkEKi42bGGnHTuBR3V+TWh/
	6YFLa4ie28GbwkmLKJ65leULU94Dbz5hHiNrPLzroOctJuREZ9dxWnwQn0cUXkFLyaxcA0Q55f3
	zua71fkMaF5tG+Gr83+a7Q2/pfXFvPTLBruKhwzXaDgx3ixxvlBnjnwBZEqDQEuIGMIXwHXy3hv
	tcKmFdmEqonltVPOW4Vor915r/Ga18xOqMp+3IAnTI8iP9Se2D2AeWycXzLOaYIHCANhnE8a5Bl
	1/gVPK/KM9e+2UfQwg5dc0sQICQN6GdF6keFls+4v2RAwOAL4nC+Q8BJmJ3sG0qMbT6hMRvyh2K
	h+ubs6ST0f6Qk4plgdLybM5wUIms32KQgQY/R5M
X-Received: by 2002:a17:907:7282:b0:c2d:fc0b:551c with SMTP id a640c23a62f3a-c2e4ad7caa6mr250891266b.16.1790957786532;
        Fri, 02 Oct 2026 09:16:26 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cf5f4e4sm106437166b.42.2026.10.02.09.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 09:16:25 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: sparclinux@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>
Cc: linux-kernel@vger.kernel.org,
	Magnus Lindholm <linmag7@gmail.com>,
	stable@vger.kernel.org,
	Bob Picco <bob.picco@oracle.com>
Subject: [PATCH 3/7] sparc64: avoid huge kernel PUD mappings on sun4u
Date: Fri,  2 Oct 2026 18:14:25 +0200
Message-ID: <20261002161515.932316-4-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002161515.932316-1-linmag7@gmail.com>
References: <20261002161515.932316-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel PUD refill path merges virtual address bits 32:28 into a
TTE, requiring a hardware page size of at least 256MB. On sun4u,
kern_linear_pte_xor[2] and [3] instead select the 4MB fallback TTE.
Consequently address bits 27:22 are lost when refilling a huge PUD.

Keep the kernel linear mapping at PMD granularity on sun4u. Its refill
path preserves bit 22, as required by the 4MB TTE. Leave the sun4v
mapping selection unchanged.

Fixes: 0dd5b7b09e13 ("sparc64: Fix physical memory management regressions with large max_phys_bits.")
Cc: stable@vger.kernel.org

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/sparc/mm/init_64.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
index 103db4683b16..0ae97e616435 100644
--- a/arch/sparc/mm/init_64.c
+++ b/arch/sparc/mm/init_64.c
@@ -1696,6 +1696,14 @@ static unsigned long __ref kernel_map_hugepud(unsigned long vstart,
 static bool kernel_can_map_hugepud(unsigned long vstart, unsigned long vend,
 				   bool guard)
 {
+	/*
+	 * The PUD miss path propagates VA bits 32:28, assuming at least
+	 * 256MB hardware pages. Sun4u uses 4MB pages here: retain PMD
+	 * mappings so bits 27:22 are not lost during TLB refill.
+	 */
+	if (tlb_type != hypervisor)
+		return false;
+
 	if (guard && !(vstart & ~PUD_MASK) && (vend - vstart) >= PUD_SIZE)
 		return true;
 
-- 
2.43.0

