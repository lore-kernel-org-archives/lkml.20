Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931825221E8
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799408; cv=none; b=dOX2VNSO/tdxEhwPPnDXfoufJGCiBnTdzP/BO9GYp9dcAeyGyZUzFIiY5JdOC+aCBdYdO0YgBc2uOXnesFKCoDVXERkXBI9jUygEo7eFdwNp9SAq+jbgCCAkE+LmbKJBXleFY8gPRcH2cX03WaoSBj5UJ2tXON8EtdhFbUOx7iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799408; c=relaxed/simple;
	bh=CSw3oherBfoV6W/nK/rpDbfPplnba3UrQpfy3y7fThA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m82ZMLW7il9tUgW6ImIlVGROgo06FiEI2SbG1Vfdci7qknTVDHKA8eYDVpKX17xU1tG7yVfMY7hRtFy4fVggZl175YQ5s7wrupdn2YtfuHMoWlRocxfSMhRc5sXv1jdfUO5Fm7/IrG29pc8cJZBXPSsYE0loLQEBHQzIwRHYFjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RO8n0Y94; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RO8n0Y94"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1AAA1F00A3D;
	Mon,  7 Sep 2026 16:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799407;
	bh=vkIZsSq4vjx3hJ16+mmGyusQF/k3JkgwGVYvd4qklvs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RO8n0Y94Ybb/79WvENaLl9DQghw0X1NiY4ybTH8xat+u53ITYCRK0dbpkSmamMk8q
	 RPGb9I1jub/Dv3IBGoZyCBVG+rh8cy5d0Wt27h25JsVN/Q5bM6InhzUFGB22Xfb+bL
	 9GfCG6YEXce16WUVp2ExiRt7S5mSbi6aswPjCBYHkfesRCDRvj75T9DYJrgQAIfvch
	 OaYeUfZvcjP1twNG/jTB+p/SPVtKrnUAEbKIQg1zGr9HjWfjh+QAlSq/yBuhZ5QBzL
	 HaGWk2IZl0DWAnH12JypO6GmsuzJaaNZzdmLdTHV/bosVKV9pEak2tqg1LOqm/dsVW
	 MquJ6tAVTqg1A==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mostafa Saleh <smostafa@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH 08/21] scripts/gdb: arm64: Use TPIDRRO_EL0 instead of SP_EL0 for 'current'
Date: Mon,  7 Sep 2026 17:42:33 +0100
Message-ID: <20260907164247.17223-9-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907164247.17223-1-will@kernel.org>
References: <20260907164247.17223-1-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current task pointer now lives in TPIDRRO_EL0 instead of SP_EL0, so
update the gdb 'cpus.py' helper script with the new register allocation.

Cc: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 scripts/gdb/linux/cpus.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/gdb/linux/cpus.py b/scripts/gdb/linux/cpus.py
index 6edf4ef61636..547a623280ae 100644
--- a/scripts/gdb/linux/cpus.py
+++ b/scripts/gdb/linux/cpus.py
@@ -185,7 +185,7 @@ def get_current_task(cpu):
             var_ptr = gdb.parse_and_eval("&current_task")
             return per_cpu(var_ptr, cpu).dereference()
     elif utils.is_target_arch("aarch64"):
-        current_task_addr = gdb.parse_and_eval("(unsigned long)$SP_EL0")
+        current_task_addr = gdb.parse_and_eval("(unsigned long)$TPIDRRO_EL0")
         if (current_task_addr >> 63) != 0:
             current_task = current_task_addr.cast(task_ptr_type)
             return current_task.dereference()
-- 
2.55.0.979.g7e5102b832-goog

