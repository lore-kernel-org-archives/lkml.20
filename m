Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102073ACEEC
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 10:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540537; cv=none; b=ZO4WbjLsvF9F/ZQRrS81Tk7UPqBtQdI1VNtvbEH5160ZpkyRJP4EZ/qk12r+a5t3fBz3c2ijYpE5cLd23AFjcb7khZOjLPYx47sTybcU2Ec33U3JlQxgfRqnXSJYzgyZxLLbGYMcvRrVWTWggwcGup09DjGkGDd+Ugt+pAUjAAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540537; c=relaxed/simple;
	bh=OIg+LuBKVY/S/XkE96w/BonIPv/mBlpZ+Ib+elS0nIM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Eo4fSpgY+u5PKU6035l/B0lSLI9TEyjhuYpiXY3VbRPHKYclF1SZ90rjDjDAYOEe/QrUQJQvi8+ex1oJBc9/hH7qNFMmZDnB4XtlK1tiOOoBRgyIv+2UY7myjoJ+pH5/xOlel0b+Ck8qxBnugHBcEeU2lcdJrnEAEcS/7QmW+fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gdCh8m9d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gdCh8m9d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 720EE1F00898;
	Fri,  9 Oct 2026 10:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540535;
	bh=XhKjlNMbTO0uP/eZkxb7YfCPIOitUMHa55FaD0BoXhE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gdCh8m9dXXKFl/gO4wrhxz4vNsUAqUmoCWwjnjYu9K8XGVuUelgKUV3dLbfiveiZx
	 ANzgLmDl6kCcxta8WMdcdt6fC8LWeaN1lbmyXTXLgWkFtP1TKpW2gwI2kNWb0VajIY
	 n+OrbsjNSvT6ABUVRLsjsUqOKMLVEnYDpfWiLMM7cInG5joTF90rkYQ2eUWbZRaVjR
	 cqtE0SKdSP8QrZnfyNdwjXY1EEv4LMItJA5Pbnb+qJKR2nrRvbyt2YAgB7i5OclHYa
	 bxmIM3M56MXnGel7KCXgyWOfoHyxZ1FukuEyb0PTPYcj6+ByYXtw6OhDdikA63VSEH
	 AxEtlP0mKF/dg==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	=?UTF-8?q?=C8=98tefania=20Ion?= <stefion@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Tarun Sahu <tarunsahu@google.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v2 18/23] firmware/psci: Cache PSCI v0.2+ version number to avoid redundant SMCs
Date: Fri,  9 Oct 2026 11:07:29 +0100
Message-ID: <20261009100738.31288-19-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261009100738.31288-1-will@kernel.org>
References: <20261009100738.31288-1-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Secure monitor calls to EL3 aren't necessarily cheap, so cache the
PSCI version number in memory to avoid asking firmware the same question
over and over again.

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 drivers/firmware/psci/psci.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index e73bae6cb23a..8bb3f7c37678 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -155,7 +155,12 @@ static u32 psci_0_1_get_version(void)
 
 static u32 psci_0_2_get_version(void)
 {
-	return invoke_psci_fn(PSCI_0_2_FN_PSCI_VERSION, 0, 0, 0);
+	static u32 version;
+
+	if (unlikely(!version))
+		version = invoke_psci_fn(PSCI_0_2_FN_PSCI_VERSION, 0, 0, 0);
+
+	return version;
 }
 
 int psci_set_osi_mode(bool enable)
-- 
2.56.0.385.gd3acb90ef8-goog

