Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E6C514768
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748085; cv=none; b=I0BPYdsJurOOVOlj3iJUOFYmBjin79G2gXksEstIr44pc0liCoM+EmrGYWoGtRlwPm9alcrljDEiTj/B5dcc5w/BkTQUr1fh721LYmGUh+8kNGYrLuPQI0gBiWur1KGiYzR4laxoBrxGquoOzCmdCZegKJUCF/4yFy4PQ9pmR90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748085; c=relaxed/simple;
	bh=3sRKcASsIcsNqAQEzNR/dM3ekLNXwXnihrjiprdTOjU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qiLo2tvkIQ5tt379GduGO4khaIzpRJulvgjFsJyXCFI1eGTLH50jJw28iLXuAd9wAhtTiVFDwBp55LoK6i0jES6lEPDc7XsZet5jF/MFAG4m2+Rn1wabO2O7YHm3re797t6T90AIeTmKk8JgGRXtMbfeZavO/VErocqoww8I2Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZTfdxI/T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZTfdxI/T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E22DF1F000FF;
	Fri, 18 Sep 2026 16:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789748083;
	bh=mq6/KTZTkKh5H1ZNq8kaadqg9w0eqgaS+tnd4DM5ipU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZTfdxI/T41330h7hOs9oLlabWGQj6ipTXbgPriHVmHvk71Wlp7PeCePz04WCyZaP8
	 wyvskyGxz9QMIB0KsVPPzIuFF/1J+Ublo2aWOy9uXnJJY2WS7+0eKMh4sMQGYonxyx
	 D3gM6BLQ8PxWakQ6wbZrW2JcxXBPYT9EVJVF9NrSdNvZU8MAegdiXxrbnt29AyrAtB
	 nkDPDvbSKtoQXwOgyKmxMRKQqw6YqhiOpxly/XUuu0ptIFrnRoIyChWkDRfwamGf75
	 8sfLH+hPb8jKn+pDtKsp7G0lTrmGueKzpK3MawloUhVZZfpoLPHmhn/yCBfC9t+Vcj
	 hD9t6H8/MiD/w==
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
Subject: [PATCH v2 08/21] scripts/gdb: arm64: Use TPIDRRO_EL0 instead of SP_EL0 for 'current'
Date: Fri, 18 Sep 2026 17:13:52 +0100
Message-ID: <20260918161407.2300-9-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918161407.2300-1-will@kernel.org>
References: <20260918161407.2300-1-will@kernel.org>
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
2.55.0.1082.g2b9226bbc0-goog

