Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794575088;
	b=CvLj02mECyVGXB/eAu9zUejgtd2mV8S3PQnRo1U5R4tbjo8SKbSDDqx9F0bItMRpFkfb
	 EyrqrJXnmpzfy7ycohl/SBOUlWh9LKqgIczup65WC+YI5Tpvh3iMwW/JQsbQ5cSGAjxLD
	 q6QftG+KFWP6/r/La2pcF8IQ3aCfz3NoebgFJAPizwQWeCaAAe9rIzKm2fwiDZWC2+plw
	 Y8dK6vE+NUkwjTGG4Hf6lWbBLVWRONgh9ZN9DINbXAiB5du5rG1M0Ieplb4wx+MkDC9Vb
	 Cj7Aue0p7k24/cgqKOistiD9hAhf7SQoJZaxY9AOqS8VxvuPTc21MKPZROft0dE7IQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794575088;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Debian-User;
	bh=i1nIoNWP6vn7BVAkfCZDHQr/6tzIle4kH7ZYHEiCwaU=;
	b=ixCFpBqDShZDefEHzPCSgcGrhX3p4H4uXfTEU4mW6NOLNwMS2NhB6S4X3kYwO6FZ+xin
	 6vaTdtx1H3xMZYxJBnApazYulVF4Kx2EKCuH/KyetuB2ab2jC5tb0snK++BbBLFMnoivK
	 XJMXG76EMADQfmifJIqPMCPiFJzD5juIKCmQkDgFHUAGrncsUHaNNwglzQ3jKAy98fDmy
	 e9MqbwpXg3s+pNGT7jgENfR5aZAWcmREFJc5LDjd/utdaVqxlCegjE1UzVNyM1QFqy35K
	 1ZOCuMlihfL7rsRZsawKCNZHK9xS6O3LEG05FAkMhF2KSvGVRah98TLN0K3FMuJk1ZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=Y7Q3ueDd;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE3D606A89D;
	Fri, 13 Nov 2026 13:04:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AE3D606A89D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=Y7Q3ueDd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=i1nIoNWP6vn7BVAkfCZDHQr/6tzIle4kH7ZYHEiCwaU=; b=Y7Q3ueDd7+9PcnPUxUvxQm66fz
	luGvY5Ec9GsuKHjZ164+LDKXi9il4eTztpGk+svfFDGVtbts/Qb9w1T5hsAUrwMH8eDZp+DEzmxIg
	kTwiNsgDJxnB59O08HIcDjmNPAqbybU1WphFtHTDcBecQUBgFTIc5KFCGfxfA9+VAirpES1MuusXp
	XmpNw4BHsJUrwNwBTw3NKVtYsmpI2LBPMg3nAuozL2I1YiRS2UnK5/Psy15qOgChUW2prZ1EtVnVh
	YaHIUMNLoTVODanKV2pgppH0YrWRUUgTaLJ0bLTWObizXr62halArwERo30hQIien52F6qn6HzHo2
	gTx+xCOw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xRqxP-00EllA-38;
	Fri, 13 Nov 2026 13:04:44 +0000
From: Breno Leitao <leitao@debian.org>
Date: Fri, 13 Nov 2026 04:49:15 -0800
Subject: [PATCH v3 2/2] x86/mce: Rate-limit the CMCI storm transition
 notices
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
Message-Id: <20261113-mci_ratelimit-v3-2-ada38c5a6c88@debian.org>
References: <20261113-mci_ratelimit-v3-0-ada38c5a6c88@debian.org>
In-Reply-To: <20261113-mci_ratelimit-v3-0-ada38c5a6c88@debian.org>
To: Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Qiuxu Zhuo <qzhuo@nvidia.com>, 
 Qiuxu Zhuo <qiuxu.zhuo@intel.com>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rik van Riel <riel@surriel.com>, Breno Leitao <leitao@debian.org>, 
 kernel-team@meta.com
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2362; i=leitao@debian.org;
 h=from:subject:message-id; bh=fvZr6T1j5RLXFy6lJvfk3/mkHLV+dm0Ial2RhaSrnWY=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBq9wrd5jlTrCJoTGPj6xFrr+hojZFcNxdz7Amqn
 bIcpYxsfP+JAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCavcK3QAKCRA1o5Of/Hh3
 bQvAEACvFPPBjWXRhHnSZAnBd8LPJcksRcmjoNCOG17CG58yawUpvWEw7WXqe4/HQBjtEQsjQmF
 N8vYNBrdUl4JCCGEudXYVbV124A+y6c2CXm5vkHvf52w/J93b8q8FO+1zECqeXvMnY59XBf5e7D
 eRVg766EiW/p+vXQ2UQ2QYVj8Mj91lGMyJ7CmEnPuGU/DnPoAvs23LVm7V++46oyb5tBLvVjc/r
 kiUfPqHTnn47yF1mbEm51i/gFDsCMtLp4ezx8c4T50uLM3MJ0tsndXCFBSx7gryQu9yn68Bk808
 mZWmXseHNP5wHiyfF5wg1/UAAsMI0m54UTSwfOjLrjS34wgbztiZJawl6bjqMiLEw1kZg3PJkxw
 lCObOOfbJbbG/I7eE8Ps1k+QE/uepSAUHpUpPad+Y0DKKxctJ7mlE03eJtESxUXSDvgjs5gG0Ly
 6hOfCV8Xdrc8d9ug59n1WQJsvlzx+i+ys3wrkoqzf9hBzKcgaIk8y7ZF2w62MCf/wWBWm25T7JS
 FVsNwCMLlqP6t6torTmJqpsdOGRv7GfVR/+S4wHqwOFnl/+9k/n9Dw+I0GKbRyxkdVjmPW45YPZ
 eW50bnJ/MiKzbt3kP0tc9ahudD+Tyg9DdVfvuzUbUh5kmy5xut1YKEc+QcmUE3H0fVs06U7qDGR
 RAtA1zdXK+eLciA==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

mce_track_storm() prints a line every time a bank enters storm mode and
another every time it leaves. Neither is bounded, so the log volume
follows whatever rate the bank flaps at.

One host in our fleet logged 9970726 "CMCI storm detected" and 9970734
"CMCI storm subsided" lines for a single bank over four days, which is
a bit excessive for all monitoring purposes.

Put both transitions behind one ratelimit.

Acked-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Breno Leitao <leitao@debian.org>
---
 arch/x86/kernel/cpu/mce/threshold.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/mce/threshold.c b/arch/x86/kernel/cpu/mce/threshold.c
index 6c370d5af5bd23..8591715ce24306 100644
--- a/arch/x86/kernel/cpu/mce/threshold.c
+++ b/arch/x86/kernel/cpu/mce/threshold.c
@@ -4,6 +4,7 @@
  */
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
+#include <linux/ratelimit.h>
 
 #include <asm/irq_vectors.h>
 #include <asm/traps.h>
@@ -111,6 +112,13 @@ void cmci_storm_end(unsigned int bank)
 		mce_timer_kick(false);
 }
 
+/*
+ * Shared by both transitions so that a bank flapping between them cannot
+ * outrun the console.
+ */
+static DEFINE_RATELIMIT_STATE(storm_rs, DEFAULT_RATELIMIT_INTERVAL,
+			      DEFAULT_RATELIMIT_BURST);
+
 void mce_track_storm(struct mce *mce)
 {
 	struct mca_storm_desc *storm = this_cpu_ptr(&storm_desc);
@@ -150,13 +158,17 @@ void mce_track_storm(struct mce *mce)
 	if (storm->banks[mce->bank].in_storm_mode) {
 		if (history & GENMASK_ULL(STORM_END_POLL_THRESHOLD, 0))
 			return;
-		printk_deferred(KERN_NOTICE "CPU%d BANK%d CMCI storm subsided\n", smp_processor_id(), mce->bank);
+		if (__ratelimit(&storm_rs))
+			printk_deferred(KERN_NOTICE "CPU%d BANK%d CMCI storm subsided\n",
+					smp_processor_id(), mce->bank);
 		mce_handle_storm(mce->bank, false);
 		cmci_storm_end(mce->bank);
 	} else {
 		if (hweight64(history) < STORM_BEGIN_THRESHOLD)
 			return;
-		printk_deferred(KERN_NOTICE "CPU%d BANK%d CMCI storm detected\n", smp_processor_id(), mce->bank);
+		if (__ratelimit(&storm_rs))
+			printk_deferred(KERN_NOTICE "CPU%d BANK%d CMCI storm detected\n",
+					smp_processor_id(), mce->bank);
 		mce_handle_storm(mce->bank, true);
 		cmci_storm_begin(mce->bank);
 	}

-- 
2.53.1-Meta

