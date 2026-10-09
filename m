Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0325A298CA5
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 10:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540475; cv=none; b=MrAQiRInxQiQYC5be7r4chIEyjPH/KQjwDjO4LX/L4oy7ONiACJvE8ITK4jhf5WceCLeldLbmV3ZJArsfWvVLZfW8T20bBVSrEQADPMzKrrEIrV2I255VG3NpUw/xqvDXt6eOUXzwsu3gtlFyWFqPTRb4wtYIWPDcrFASOt1CqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540475; c=relaxed/simple;
	bh=H2pso/1jAKRy8QRPb4tMmjjGjmDL0+cZxHY8Cl6wvP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Slt4K3V2hGxMhsQvQ0oKUwbTvikHMJF520Sd3YQ7ACtqZTH1PS+rsVHGVPgt1/byS0oBC3U1Vcm1WiBHKI8l0C5HCZOiOMkpcxNIzBrZoIqHTvIsICM510x670M2YIzGvOA4c8ob4s/7evo39424pRX0/lJw4Q4XT80eumf3S5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=In3kowbK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="In3kowbK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76BAC1F00899;
	Fri,  9 Oct 2026 10:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540474;
	bh=pfHxhycY4c003LsMRsPy6F6Xh21xTwGQzv/lLDaJzCU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=In3kowbKxzi0zjMZuqzN80/iyK437ZerWuTZkRHz6Jyik7ekEn2cYLzTUoak3EWUd
	 EjfkFJ9ZOzenPO/lmMhvKJlvq/Y/0tTyuLIUpaDWbf7hyWs5QacL9fDRzeZ1zkz3hq
	 ClDcSUsA8cXXojGHySxdI7B0GCzCAkrjl2HDjG3zVCKGh6kQASybloEz4+HIcI3iw7
	 8XzvEmG96MXY5TFBzKR7YEklflWXQiN+gIQZc9AdIBRpjRL3ig+Ih1OC0NERgxZvK6
	 hSID8wHl5AQPNENRKy4yvp7Jo83XQuHjFY/r3TvDO+bHQdvRvoYs8+0ZUfwnAbMptz
	 9LhUT8gZ//h+g==
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
Subject: [PATCH v2 02/23] cpu/hotplug: Avoid trying to bring up CPUs that are already online
Date: Fri,  9 Oct 2026 11:07:13 +0100
Message-ID: <20261009100738.31288-3-will@kernel.org>
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

There's little point trying to bring up a CPU that is already online.
Although _cpu_up() handles this case by doing nothing (because the
target state has already been reached), it's wasted effort when we can
easily elide the call to cpu_up() in the first place.

Check that the target CPU isn't already online before invoking cpu_up()
from cpuhp_bringup_mask().

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 kernel/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 198c929c452a..97a9bfe4edad 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1769,7 +1769,8 @@ static void __init cpuhp_bringup_mask(const struct cpumask *mask, unsigned int n
 	for_each_cpu(cpu, mask) {
 		struct cpuhp_cpu_state *st = per_cpu_ptr(&cpuhp_state, cpu);
 
-		if (cpu_up(cpu, target) && can_rollback_cpu(st)) {
+		if (!cpu_online(cpu) && cpu_up(cpu, target) &&
+		    can_rollback_cpu(st)) {
 			/*
 			 * If this failed then cpu_up() might have only
 			 * rolled back to CPUHP_BP_KICK_AP for the final
-- 
2.56.0.385.gd3acb90ef8-goog

