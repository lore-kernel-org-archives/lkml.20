Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFB0F4F0553;
	Fri, 18 Sep 2026 14:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789740696; cv=none; b=sJWl446WkzKcWVR6sp/1h8Lc5Zc9PSLUV0T8NJCwy2U4/Mb2RSCsnKnoi4e3ET9YV0qcLgRVYQQHtx8C2JaCBrO9oxBpmbgvukUNiMH+YOYdRqbd21L8Q6mgahEew544vkhw9hEZHOeSE3s70lgl7PsQKKdyNeJqmKPFYQzOT24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789740696; c=relaxed/simple;
	bh=EqKIdJZ0C+yXX2cIFzzx7FCYTPgkMMFND81vIIt+GIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u5NBVFKTU3AHAUxySrv1tjaBwMnsPwAZE/aeBHTfCcsMDMqvMVe3IbEpzeJ3lwmWy1wnRP3Q3zGb66FGeq6OCFOneDO2CprHvWdhLI8D1o7IyoYXq+0gL4b2Bqyc1x3hz9En8y9yjQ+nB58Xo1NWRDcPhFjPF/mA1MK3gqCK+Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=F8FyOcCX; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="F8FyOcCX"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0DF2168F;
	Fri, 18 Sep 2026 07:11:29 -0700 (PDT)
Received: from e142021.Arm.com (e142021.arm.com [10.41.4.144])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9851E3F86C;
	Fri, 18 Sep 2026 07:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789740693; bh=EqKIdJZ0C+yXX2cIFzzx7FCYTPgkMMFND81vIIt+GIE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F8FyOcCXQckp4bzNt3OPkNZh/YqjJUFVK3Ks90QuELF1e+SfV/oHOHnLlbvEJbIjW
	 +0+W6JoEjuh4aPKeFPi1H2YKg+jWtMQuTPHrDEB65dDB4bMg/rHN6FapE+LfjOWR5d
	 ec95aBneWJET/Ps4qFVCb0yDoYk/OG7950gLn2Bc=
From: Andre Przywara <andre.przywara@arm.com>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Salman Nabi <salman.nabi@arm.com>,
	Vedashree Vidwans <vvidwans@nvidia.com>,
	Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
	Nirmoy Das <nirmoyd@nvidia.com>,
	vsethi@nvidia.com,
	Varun Wadekar <vwadekar@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v4 3/8] firmware: smccc: lfa: Add timeout and trigger watchdog
Date: Fri, 18 Sep 2026 16:11:06 +0200
Message-ID: <20260918141112.2115555-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918141112.2115555-1-andre.przywara@arm.com>
References: <20260918141112.2115555-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vedashree Vidwans <vvidwans@nvidia.com>

Enhance PRIME/ACTIVATION functions to touch watchdog and implement
timeout mechanism. This update ensures that any potential hangs are
detected promptly and that the LFA process is allocated sufficient
execution time before the watchdog timer expires. These changes improve
overall system reliability by reducing the risk of undetected process
stalls and unexpected watchdog resets.

Signed-off-by: Vedashree Vidwans <vvidwans@nvidia.com>
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/firmware/smccc/lfa_fw.c | 43 +++++++++++++++++++++++++++++----
 1 file changed, 38 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
index 7cf847e102d5a..b6ce478d3fc01 100644
--- a/drivers/firmware/smccc/lfa_fw.c
+++ b/drivers/firmware/smccc/lfa_fw.c
@@ -6,11 +6,14 @@
 #include <linux/arm-smccc.h>
 #include <linux/arm-smccc-bus.h>
 #include <linux/array_size.h>
+#include <linux/delay.h>
 #include <linux/fs.h>
 #include <linux/init.h>
 #include <linux/kobject.h>
+#include <linux/ktime.h>
 #include <linux/list.h>
 #include <linux/module.h>
+#include <linux/nmi.h>
 #include <linux/psci.h>
 #include <linux/stop_machine.h>
 #include <linux/string.h>
@@ -27,6 +30,11 @@
 #define LFA_PRIME_CALL_AGAIN		BIT(0)
 #define LFA_ACTIVATE_CALL_AGAIN		BIT(0)
 
+#define LFA_PRIME_BUDGET_MS		30000		/* 30s cap */
+#define LFA_PRIME_DELAY_MS		10		/* 10ms between polls */
+#define LFA_ACTIVATE_BUDGET_MS		10000		/* 10s cap */
+#define LFA_ACTIVATE_DELAY_MS		10		/* 10ms between polls */
+
 /* LFA return values */
 #define LFA_SUCCESS			0
 #define LFA_NOT_SUPPORTED		1
@@ -295,6 +303,7 @@ static int call_lfa_activate(void *data)
 	struct fw_image *image = data;
 	struct arm_smccc_1_2_regs reg = { 0 }, res;
 
+	touch_nmi_watchdog();
 	reg.a0 = ARM_SMCCC_LFA_ACTIVATE;
 	reg.a1 = image->fw_seq_id;
 	/*
@@ -318,6 +327,7 @@ static int call_lfa_activate(void *data)
 
 static int activate_fw_image(struct fw_image *image)
 {
+	ktime_t end = ktime_add_ms(ktime_get(), LFA_ACTIVATE_BUDGET_MS);
 	int ret;
 
 retry:
@@ -339,8 +349,15 @@ static int activate_fw_image(struct fw_image *image)
 	}
 
 	/* SMC returned with call_again flag set, or with LFA_BUSY */
-	if (ret == -EAGAIN || ret == -EBUSY)
-		goto retry;
+	if (ret == -EAGAIN || ret == -EBUSY) {
+		if (ktime_before(ktime_get(), end)) {
+			if (!msleep_interruptible(LFA_ACTIVATE_DELAY_MS))
+				goto retry;
+			ret = -EINTR;
+		} else {
+			ret = -ETIMEDOUT;
+		}
+	}
 
 	lfa_cancel(image);
 
@@ -352,6 +369,7 @@ static int activate_fw_image(struct fw_image *image)
 static int prime_fw_image(struct fw_image *image)
 {
 	struct arm_smccc_1_2_regs reg = { 0 }, res;
+	ktime_t end = ktime_add_ms(ktime_get(), LFA_PRIME_BUDGET_MS);
 	int ret;
 
 	if (image->may_reset_cpu) {
@@ -360,6 +378,8 @@ static int prime_fw_image(struct fw_image *image)
 		return -EINVAL;
 	}
 
+	touch_nmi_watchdog();
+
 	reg.a0 = ARM_SMCCC_LFA_PRIME;
 retry:
 	/*
@@ -378,10 +398,23 @@ static int prime_fw_image(struct fw_image *image)
 		return lfa_to_linux_errno((long)res.a0);
 	}
 
-	if (res.a1 & LFA_PRIME_CALL_AGAIN)
-		goto retry;
+	if (!(res.a1 & LFA_PRIME_CALL_AGAIN))
+		return 0;
 
-	return 0;
+	/* SMC returned with call_again flag set */
+	if (ktime_before(ktime_get(), end)) {
+		if (!msleep_interruptible(LFA_PRIME_DELAY_MS))
+			goto retry;
+		ret = -EINTR;
+	} else {
+		pr_err("LFA_PRIME for image %s timed out",
+		       get_image_name(image));
+		ret = -ETIMEDOUT;
+	}
+
+	lfa_cancel(image);
+
+	return ret;
 }
 
 static ssize_t name_show(struct kobject *kobj, struct kobj_attribute *attr,
-- 
2.43.0

