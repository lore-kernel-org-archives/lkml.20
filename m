Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469254A8FEB
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 22:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789684011; cv=none; b=PzNSuXI43KKqAYdMmvng3VIff95Npi4spTOgoR5yd+4ABitCIG5UF1ikpBwgRAFJIpQ5YJztbdmXF7cTLDER9a2pIRwE1eooDg75dB0zYWEA3Cw20DYeznLoN470ihv3pxQ5h9cYRUmhg8PK+qQz1VgP5zsReg+DxRWObI9VnuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789684011; c=relaxed/simple;
	bh=Gnbdq+EwHK5gDsmDyywDeSMQ86W5KukTK8TRjw5+Auo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OsA4ASo7aStm/swxfPHdCJXsb/s/sXWql0e30AzqdbCmkWUC7oKjy9t6ZA1N/gt+Nra22G3KlJA/IvFPwz4LXGLeGvLIK0fEkKHpdDy4QKA9gVKKK3F08QAA7Png7tWxcC6FzVA5yn308fOcpdmuAyFQjAbb452NE4S4ghoV5kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cIxul6kI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cIxul6kI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B54ED1F000FF;
	Thu, 17 Sep 2026 22:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789684008;
	bh=8OiiaJMr1gxE3GTPF3LYMjm+lNnJO0ChsA23POYx14w=;
	h=From:Subject:Date:To:Cc;
	b=cIxul6kIkwVeIWucm0exU69EPifblpugyTU8LZoEepFUWnalKurDP3/Abf1r7KZF+
	 suLEu2GzV11VTCzZc5PXGDm6RkiMirrOFxqectggEPI+SI0LM0Nk7QLjYHd7JMZWkD
	 hR8T8sNQqr/QDhCfSwfMOedfvIWTA6ZE5mZW5b6JDK5BqETeZyaRejTVh2TekIEdg3
	 QtSuHs28otTgQByViMATibTzz7Mf7gHh49AHADIkWQEAj00Tmd2r3MRmtbUkKtwwOM
	 svTQg7oQ5/ATNootA2XwbtUvvxKMKf8NvxZcEqLl2QdJK2DsCX9qElF3VCuAlpwNj7
	 fqFdhPo5MSHDg==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/2] arm64/gcs: Store the GCSCRE0_EL1 register value not
 userspace mode
Date: Thu, 17 Sep 2026 23:14:15 +0100
Message-Id: <20260917-arm64-gcs-store-gcscre0-v1-0-3c9fa9213bac@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADdmrGoC/02OwQ6CMBBEf4Xs2TWlQFV+xXCAOmBVrG6BmBD+X
 VAO3PYlM7NvpABxCJRHIwkGF5x/zhDvIrLX8tmA3WVm0kobdYpjLqU1KTc2cOi8YLmsQLFGAp0
 amPpQ0tx+CWr3+S2fiz+HvrrBdsvcmhC8+/ll949RVQaw9W3rujwaDvuExSa0VcmjVURtRB7e3
 hkvSMvKWBzrIzKdKSqm6Qu3FcoI4AAAAA==
X-Change-ID: 20260911-arm64-gcs-store-gcscre0-2e3e246e6f7a
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1308; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Gnbdq+EwHK5gDsmDyywDeSMQ86W5KukTK8TRjw5+Auo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqrGkjIv4gxLTMJA93dmZontk9V6cSjsM2j/Byz
 tendk+glIiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqxpIwAKCRAk1otyXVSH
 0EeJB/45C5Nu8dg4+1AC3eOowKnppaCS8pPjfa1WNO8R54/ZDwuhjnAdyEUE0nZFgWwDz79PNaQ
 cbjqOrsSyDM2I0UmW9pt5NoWJ32/eFJeigdne03UD9k6rbMxrHjLjRR6okKjUQkZJ2xygWJc22Y
 oM92zG0NI4HlKYF2Mh9LVMokZN3Xom2we22CrvQp4uHJeSuYjID4+Djd7xzbkvcob0gtY0uN7E6
 lfj2qE7rJBG/rlcolTbqNibODJRCjJM/zqliDWxbNoWL8zly2Q24Yi9J0tKCRDLV8Jw6mPF0Teb
 3y3fiZzRSfBNTUrbslxiK+tfON7myt70gLgRPiim0KfvfqG8
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

At present we store the userspace GCS mode for a task using the prctl()
value set by userspace rather than the mode configuration written to
GCSCRE0_EL1 which means the register value needs to be generated on each
task switch when the new task uses GCS.  Since the mapping between the
two is easily reversable switch things around and store the value that
we need in the context switch path.

Do a small refactoring to move code out of the header, then make the
switch.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Mark Brown (2):
      arm64/gcs: Move gcs_check_locked() out of the header
      arm64: gcs: Store GCSCRE0_EL1 values instead of userspace mode

 arch/arm64/include/asm/gcs.h       | 22 ++++-----------
 arch/arm64/include/asm/processor.h |  2 +-
 arch/arm64/kernel/process.c        | 11 ++++----
 arch/arm64/kernel/ptrace.c         |  4 +--
 arch/arm64/kernel/signal.c         |  8 +++---
 arch/arm64/mm/gcs.c                | 58 +++++++++++++++++++++++++++-----------
 6 files changed, 59 insertions(+), 46 deletions(-)
---
base-commit: c2cd463d6ee7d55a3ec0719d93c49ff99022d58f
change-id: 20260911-arm64-gcs-store-gcscre0-2e3e246e6f7a
prerequisite-change-id: 20260910-arm64-gcs-lock-eperm-06ce8f8e5250

Best regards,
--  
Mark Brown <broonie@kernel.org>

