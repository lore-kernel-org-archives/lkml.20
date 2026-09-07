Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B849513542
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799242; cv=none; b=LD2TORwErN36hcXdoE/e70D5CPvs96qDe3aCiV6yIN6VCBowHIp4uMkr1A0CpK/RzvwoVv3tAL2Q/Ot79CJpqxJPmFHXzvPOq4yu4DpHnCP9J03nt02s5mNWGSXpwSijUshHsi4CFeGM98zQ/OGD+LZ1XaY5kFEku/uyyCI7VCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799242; c=relaxed/simple;
	bh=7fLL46OhSlXLJfTuycNHlvAzCjbTsvU0wCv5wzKp0Ag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qGPx92P221jI2gWIasfgTOhwbMt6KuQ8yC2IlS/+MoU/zfiR9cHse+bqLxjLeYmYoG98WpwtHue1CGycp+5ju7gdmbkiUZc+GuQYIQAsmpKlbvt81xYuRk8wjz/r9KTBVpaL4e2k8GzYzJjd3x4yz9vRzN4gFKdLbD1OsCyzw+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fEbnloOv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fEbnloOv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 986811F00A3A;
	Mon,  7 Sep 2026 16:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799240;
	bh=G0TnF0EdtSAjs6s5ohnJS7vNK/6l+Z91b6PJOF9Vof0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fEbnloOv9GjrTNDcDEMqFW38QNNqnZpKB9puUB8QoNObvdlHLcsM81ng0rRPCK1dm
	 utIwFWmbXy/TAaw85mSe61P3d4AlUptqlHawOUo1yba9WbrXaLUDZksEmbqfrST+8n
	 C9w9YCRmxbNVGQ+MOa+x/UnM+losT0dErQofYVEQIR2CMyQVyxwHI5oTGgIVhHHmPW
	 4pZ3JdZFXC3HvfO8VspXHSva0AjQCfD+j3GgG7+YN8FON4LDgTKn9gYO9GB3jAZH93
	 AnDVoOIKRrpM+4IlgzNfPFg3wq3gqFM2z0kYR3yy2EIFuJu3yskk42nEoJs5WtzmRF
	 lVZl8OsZD7cUw==
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
Subject: [PATCH 02/19] cpu/hotplug: Avoid trying to bring up CPUs that are already online
Date: Mon,  7 Sep 2026 17:40:05 +0100
Message-ID: <20260907164024.17164-3-will@kernel.org>
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

There's little point trying to bring up a CPU that is already online.
Although _cpu_up() handles this case by doing nothing (because the
target state has already been reached), it's wasted effort when we can
easily elide the call to cpu_up() in the first place.

Check that the target CPU isn't already online before invoking cpu_up()
from cpuhp_bringup_mask().

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
2.55.0.979.g7e5102b832-goog

