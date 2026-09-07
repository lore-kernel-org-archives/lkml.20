Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABC15221E9
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799277; cv=none; b=DAnMO9/Qq7wz4x/zrw71yjDZNcScX0Nllh+f0MR7nOkjLLJX9DtKGcbY68mutSS0yguz49HcVo6Sy8sYrIZA0uG9Fpyr9zO4QnscngEJ2ixzexSB4Stp02Y/qq5KruUFQVpsiVN2mlE1rNL9DT1Lv1g9oN9Jc3z2ddiQ8WladA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799277; c=relaxed/simple;
	bh=FXk4Y6n0MApbau7HM+JsM6nsUK9vl07kcs2O3VY89uw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qDERnOaG/kCIm5eDae/IBsNBb2G5apJ67GiKDB/vObqHH8J/9gNW8gZXknKPemKguneftzTDfhyb8yQxsFwmvR3iW00zysFUf5wmm0+P5lJz1HSP1p9EhDgYAryqmaQL7LFF95uOEy0vHl6Wtk/v/wy2DCZAYTJcVOqpGBpbMRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ks4cUze2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ks4cUze2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1905A1F00A3A;
	Mon,  7 Sep 2026 16:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799275;
	bh=l1KlFUrFQByY5HMeuJRtMe8QamhdpHtavT/1/TB6eNY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ks4cUze2H8K/HkyakRaX2J/XJEk4oNPa0foT0KVPO870JyklkD4Fkepd0rVYr5erv
	 bN1hQ7DGY3rRb508vdki6oZIUyHNU6T9CHyWOa3zN0tMhSPx+aJnsLlV+NvKsCOe72
	 NH7fmblAs/qhx5wOmpf6bXdNMNx8mHDG6A3AfMFQF/GboxoT99sZ6g1FLiokIksELx
	 gbBtceCZpvXhVbhgdECaWNTXqxtpvL0PRQRHFBQ0v+GB+Vl7iaYVIJFfw7pHB7is0x
	 MGw/v4Qhrr/DMYZEMuehtuyEeMygp1ksSBTOAPMx1jV1sKrMXXfS3VqgtUtHril+xu
	 YYKPqPifTqAJQ==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH 14/19] firmware/psci: Cache PSCI v0.2+ version number to avoid redundant SMCs
Date: Mon,  7 Sep 2026 17:40:17 +0100
Message-ID: <20260907164024.17164-15-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907164024.17164-1-will@kernel.org>
References: <20260907164024.17164-1-will@kernel.org>
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
2.55.0.979.g7e5102b832-goog

