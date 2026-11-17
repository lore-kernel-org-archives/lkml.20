Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924027;
	b=PhFnXlEaDbo/6ooT0HnNiQtoD3ebJKt9TOcybbo6qDEEnXg+jfhxLPhkZ4c5iMOnnQUF
	 nHp0E+mmGJ4uiIw6dLPS5dgRVexb4z47t59yajNh6MYCOEVV9Q+SWX3rWk+k1R1ReqmvF
	 3N2fG3Ht4wYvMPrXwS7kT8JzW4ZS6zEFmrFnXm3BHlFMLzXoj1SAanRakJvl09YxbSHDm
	 Gba9q4KUp2oH8laHumV8sCETdsVoH2vT5orJpCndQkKnhOUaO6Y57+kyoQw1/YBk9RL2e
	 3LMCKRlrussH/+rzqnFngIjfKJng/1rFFdC0g3C2HkucWhhEgD4nHrLnpgNMTiPZ25w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924027;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=+zoXsUOZLc6Lxh6C7rK9vE6qS+E7WFN3jSnhKD9U1X4=;
	b=rBBkLoXMDupuqvgJgzhVc+1ddJUjSyv0gkQ4JvlUYRQ5fOb2Ul6x+UIE2VqIbBrfS5q3
	 XGdEPmZ72GdGWA4nad1SFisNv1jArUclsQROidUNgzOxVa4FWK1wTTwtRGokkufsp3Xzn
	 YBUq/LGfkw2lhidV5rtqHe+idnBfvNyvVW86jtOnYeyaUkqaru4lnIbhY45L9qvGAxuaZ
	 T6MwwkY7OZCdk9DgRBTR2v1bwFMxHBEqlWhi6wRUcFaym1uLKG+SAaEfSdGy8tOYeeiUj
	 vJWmfXgIKwFAv1VD291aWHKlZ3rFHIG8PYoyaCrN4RUDQsOcSfi61Dh/chVZz6FkvyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f0U1Y9fL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F541606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f0U1Y9fL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 104471F000C6;
	Tue, 17 Nov 2026 14:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794924026;
	bh=+zoXsUOZLc6Lxh6C7rK9vE6qS+E7WFN3jSnhKD9U1X4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=f0U1Y9fL4nBIJsnvtL0gvFQWf4QpKsjLKWYw8qFGjDPhK4GeJn8aaMf/x0pnsbCtd
	 gBQKsEyjNP0HH1YAogQulCKnxPcy0p4xcx4uOveZvu73S+ik2KLm4K0zBfA6Gc9UQz
	 3YWt5fbNZ246q/xVnaFPVILK6yURe+9CEx7dgj+lDe6jTUWjDuQI0wsuYIMioZDaIv
	 ypx1KLOFYSmM8G+j9NnJDvkA0vArOtDnefFZkql5McoNaOYSSS7EQ//AQW28LKcMmG
	 xLjo/agzDwiJqYtvCkof/l71VhAqesUuHggdze8FPZAB6GM0ftGVb03blcHZqKHtfk
	 aJpDkcBSEiCkw==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Tue, 17 Nov 2026 16:00:20 +0200
Subject: [PATCH v2 1/2] riscv: mm: do not make the linear map alias
 executable in set_memory_*()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-fixes-riscv-v2-1-5edc9bdc54fd@kernel.org>
References: <20261117-fixes-riscv-v2-0-5edc9bdc54fd@kernel.org>
In-Reply-To: <20261117-fixes-riscv-v2-0-5edc9bdc54fd@kernel.org>
To: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <pjw@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Jisheng Zhang <jszhang@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org
X-Mailer: b4 0.16.1-dev

set_memory_*() applies the requested change to the linear map alias of the
range. For set_memory_x() that makes the linear map alias of module text
and of BPF programs executable, although nothing should ever execute that
code through the linear map.

Keep _PAGE_EXEC out of the bits set_memory_*() sets on the linear map
alias.

Fixes: 311cd2f6e253 ("riscv: Fix set_memory_XX() and set_direct_map_XX() by splitting huge linear mappings")
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/riscv/mm/pageattr.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
index 5b3cf326455d..b13811375535 100644
--- a/arch/riscv/mm/pageattr.c
+++ b/arch/riscv/mm/pageattr.c
@@ -271,6 +271,10 @@ static int __set_memory(unsigned long addr, int numpages, pgprot_t set_mask,
 		.set_mask = set_mask,
 		.clear_mask = clear_mask
 	};
+	struct pageattr_masks __maybe_unused lm_masks = {
+		.set_mask = __pgprot(pgprot_val(set_mask) & ~_PAGE_EXEC),
+		.clear_mask = clear_mask
+	};
 
 	if (!numpages)
 		return 0;
@@ -300,7 +304,8 @@ static int __set_memory(unsigned long addr, int numpages, pgprot_t set_mask,
 				goto unlock;
 
 			ret = walk_kernel_page_table_range(lm_start, lm_end,
-						    &pageattr_ops, NULL, &masks);
+						    &pageattr_ops, NULL,
+						    &lm_masks);
 			if (ret)
 				goto unlock;
 		}
@@ -318,7 +323,7 @@ static int __set_memory(unsigned long addr, int numpages, pgprot_t set_mask,
 			goto unlock;
 
 		ret = walk_kernel_page_table_range(lm_start, lm_end,
-					    &pageattr_ops, NULL, &masks);
+					    &pageattr_ops, NULL, &lm_masks);
 		if (ret)
 			goto unlock;
 	}

-- 
2.53.0

