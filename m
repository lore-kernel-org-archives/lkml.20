Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B77B33A029;
	Thu, 27 Aug 2026 09:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787824536; cv=none; b=ReZLy5OYPpSKovcbHdo+6lBMBnjpIFnVvu7IS73pFqNeTu7tNx6IZD8321JoYv6jVulCqUl0rwic3A5RrkpITt0YhMxxtHgQL7sTbvJMTj3Akii2UUkhZP9Kp8bcFyDmAdK8E6IjV/iqU2VRLGVte312RGSvWptWQ95ltUXj7zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787824536; c=relaxed/simple;
	bh=wn6vNR+gNApMgA3EqRDt1zjZM4Fnlcaf5/SPd9MBERw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RT4/r8iX+Iqi3uQtmbH25TcMHKD+8gsitaR0tcXqbOjBQZ13UvBR3EtNKFg6WfrA5wAFlB8d9vYWJvDD8GrVna7s815sY0NRSgbl7L6F2x+5KNeWxhXonvLXy/7OQO/qyDY55Z0aCtrSblsylO8x5l9qIiHHHZSHS0GsbYK38TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=hf7JzrWl; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="hf7JzrWl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=Hv8N+7TnTbbe4S2bY6DaK8vTQFSVSFqTOo/XZ1y38WM=; b=hf7JzrWlRhCogPg/MxeDgdZY/9
	a5nrtLdMXGiAmmad/53Q5RRVJohxAKi1xxAz6mQAW6EaOb7267i3Dxnme1P4jzksuPOvfm1Jqi8jq
	+nYhVBD75+cbgdzEhwyVhBDtAsSnCkTMCckToaaZQ2p97MiEgC9KhccC1xxuKRPxxRdKcJrcgxqpP
	yJvnr3QyMMjtJw1HpFde3Qb6ZYYzEPv9bc1oPscnCJ9Gr/rf3cm7Dzk0V/ys5bxLkqEJy5xyYcMN2
	+OfKzWzteyhQIiGJV96rKXlyLAGySCr40DHb6wTnzwzq25Gc1uYFQLj7ADhKpp4Xcjc66lArf37us
	RFRJxX7A==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wzWpF-00FuVP-0d;
	Thu, 27 Aug 2026 09:55:13 +0000
From: Breno Leitao <leitao@debian.org>
Date: Thu, 27 Aug 2026 02:52:14 -0700
Subject: [PATCH] x86/mce: Rate-limit the CMCI storm transition notices
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-mci_ratelimit-v1-1-ac43df769b36@debian.org>
X-B4-Tracking: v=1; b=H4sIAM0IkGoC/x3M2wmAMAwF0FXC/bZQQ1HpKiIibdSAL1oRQdxd8
 AxwHmRJKhmeHiS5NOu+wVNZEMI8bJMYjfAEtlzZhmuzBu3TcMqiq57GVs5xKRybEFEQjiSj3v/
 Xdu/7AXDRRVNfAAAA
X-Change-ID: 20260827-mci_ratelimit-064421e2d8cd
To: Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-team@meta.com, Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.16-dev-f8e9d
X-Developer-Signature: v=1; a=openpgp-sha256; l=2507; i=leitao@debian.org;
 h=from:subject:message-id; bh=wn6vNR+gNApMgA3EqRDt1zjZM4Fnlcaf5/SPd9MBERw=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqkAl9gxs6NoVVUlVKa/RaZcBKH/NSwvSYC3w1X
 zDtOIphCWyJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCapAJfQAKCRA1o5Of/Hh3
 bfnND/9iFrvPPzfimRF8BK+uJ1NHqmyfKVa90GR2cXJY8kxZMs7tLt61MuPQZL5ICnVCLHoGOXc
 2ftmQwxs45jBxf0VqrG8RLrBC6SCshM7LESIE6+x/Z9t5U8nCyxB1s1P60G3Vtoa0k2/9uNaaDo
 Y/kU94HtZU8f9vhj6PAupWrIQ9GiCewTpufPvhUkk8x/mIpNP6MXWrg5yijGieaCznt+26peAl7
 AiM2Cqe+DaTsShkprZ54dkosZj1qfHpEUguT7NEFBSx5GxcjknxHW6I+Alj7/9kpbm2we6s1vVv
 Gz248ySf7EZdXgQ8kzWkxq2QvRQMBzhop8T9W7gqC7iGs6pK49vqwWgf02u4jpf4JdOsoQKV/HR
 ZZXAe+YA7DzkTSCVcrvWqVf6O1ZzUOV/30uYijjS2vhsCm9YcQ4GNFFKGbl7g7XsJtbbtE3S8z5
 qTdHVmxteUlPFLJetjlamOIz6Gro6/JEmUPoslQ84xbXBqsu463LyZou909c5c+utU4faOyhBYo
 3pPP82kMXY7emIrf53V/2le+Jo388VM10zQ06MWVi0/4AcrypPGMuwZDWbJTpw2c8M7KP/Z8iXu
 4wxmSmxUyOKe+tUunZyPlb3TBf0vMg/0XFRdkMlxVi5C88AxY1RV6oIgqLIwcuGT6RdbgKmDIvB
 p0ARtgvRrcSXZQg==
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

Signed-off-by: Breno Leitao <leitao@debian.org>
Acked-by: Tony Luck <tony.luck@intel.com>
---
 arch/x86/kernel/cpu/mce/threshold.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/mce/threshold.c b/arch/x86/kernel/cpu/mce/threshold.c
index 6c370d5af5bd2..8591715ce2430 100644
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

---
base-commit: f82a5da2f04960df9fb57489992d03dd5e64ec6f
change-id: 20260827-mci_ratelimit-064421e2d8cd

Best regards,
--  
Breno Leitao <leitao@debian.org>

