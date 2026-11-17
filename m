Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794899237;
	b=julVxsYjzq4Zhd3TS72CfYx1fzccjzrHVCSYS+NsDeQuC3Y8lHQX7+5qg6yXUqvbMBlc
	 mTRkCcKWEtDzAB+qwph+ItSs2iSRD/Pp0nBXYrykvwq2JiVU1fuJO6XcRw7o9ZJC28lum
	 2DLl4uVt3lyg4LvUuktMw0nWoh3tp8E3yZyXOfAr6Gi0jlE/aabzj8FNSnLWVJXc9jfFy
	 EaBVERJcTEyd2dNUFc7rjYA5rRZ87KTpYiERvii60Fv+k0m2k9VtuldmFqOiVIIfEnrn2
	 NjDUJiusVn4sZ85jUZgTnauelBPN8f8XKM3AQxRvS1udqgTJ+N4ZTkHQl5mdmlKNyVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899237;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=037BP7LSN4gD0zQjrB6FwBIbxukPEEKzDg+C42Jifdw=;
	b=UbFvtgscW/CSs+ywfNwDxBPPo9prr6v49HMMD4V08MWM4+BWVplqtTfBiBINZXV72M9o
	 SyRTv4OE3Uln3ahxgSqZXy5lvrJ5OgqQCkca7JBJd5GC0H5zdd9LoEF+hJ2x/uM7layFi
	 Gy6mF6XV9s1gp2AKfCXMHfVwT3InLEq0cBJ78Y+7vv+WZo5UqyWNdhOhjfkdBrsaURnmc
	 KZR1HtnP5SAyEzJFsV9mos+kKlmiqxJ/EAizLNvatq9RRz6A+RZyN4rwS/0Et1/4O/JQI
	 uihmPCXljJwLZT+0dw6rIraZBMDzDF+AIRnjwAcmyKqnFiEWRNTdIhWZzN7zhHYvCbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=OpuGfhe6;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A78E2606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:07:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A78E2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=OpuGfhe6
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3CF431688;
	Mon, 16 Nov 2026 23:07:13 -0800 (PST)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 72E9E3F763;
	Mon, 16 Nov 2026 23:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794899236; bh=ubPPA2iriBEKz9Li34H1P6Gjby7HXyDV/7vIdwZFjPA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OpuGfhe6W9DIBiXUJhTBR04nun2AmUPAaokxv/1jyVMXPblNPmYtiBM179AACGujk
	 ol3M2Fi/dsuNQqbHzFc4TU6C26fgzcv6r2SySrTx9kjrj02VP3QKNRpKe4++jPsBA7
	 7tjkGgaefzBrzBWuJmNQ+srM3RKLPzoJCegI45ag=
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH V3 14/14] arm64/configs: Add d128.config
Date: Tue, 17 Nov 2026 12:36:13 +0530
Message-ID: <20261117070613.1183243-15-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117070613.1183243-1-anshuman.khandual@arm.com>
References: <20261117070613.1183243-1-anshuman.khandual@arm.com>
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

Provide a slimline configuration intended to be booted with ARM64_D128.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/configs/d128.config | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 arch/arm64/configs/d128.config

diff --git a/arch/arm64/configs/d128.config b/arch/arm64/configs/d128.config
new file mode 100644
index 0000000000000..e0a2d7bd8f204
--- /dev/null
+++ b/arch/arm64/configs/d128.config
@@ -0,0 +1,6 @@
+# ARM64_D128-specific configuration
+
+# CONFIG_UNMAP_KERNEL_AT_EL0 is not set
+# CONFIG_VIRTUALIZATION is not set
+CONFIG_EXPERT=y
+CONFIG_ARM64_D128=y
-- 
2.43.0

