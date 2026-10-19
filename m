Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CDDC556FF1
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419285; cv=none; b=UTWoOaBk/n+6ztvrPPmoVcvRxCG3oUWdzkzUd1jEKC/ZeGShnynppooAeR8H8o+M6zZDxP+YF1+fFKz9jM51WkXNmWvYIDmZ6r/C1Y5HB3op+Er/JymjSOo9w1OekHqK3V/3u/F3f2fhHPA/BXQWlbP53AwAWlWDTke4NKF9LLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419285; c=relaxed/simple;
	bh=miXpFvzDWp1rgsrIkIJfHSpb/+AkGB7/fFGMtDBCe3w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VKJAflCLEBkAkJcY393THdHDWfXuSyNtjzFbtScQgR4wKvsMZO6XButld3xGE2k3XLXJKsfv4yLFunnMgloSuik8BY/kagR5TW7WFec7ufhdqAL3yKuDUO7L6IVCTgwpJH0LrE9jYPFQ96IJ1KKcc+Wg/8dInlPJ5xnAY/1IdeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=l9dXBqAR; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="l9dXBqAR"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 60DED1D70;
	Mon, 19 Oct 2026 07:14:40 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E262E3F673;
	Mon, 19 Oct 2026 07:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792419283; bh=miXpFvzDWp1rgsrIkIJfHSpb/+AkGB7/fFGMtDBCe3w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=l9dXBqARznxrSaps1Az6u/BW5Xm0jOtXZVumEkspEArMqdZgkPfQYABcb1KFyhhOj
	 7U3xhKItwpjISLLGlM6dESb8ktfUiJMea9+SLU+88yIwD1zMY5Ve/nvtcH7e5ncUN0
	 HEREipB6KnRWOa0MGj8pz/omxa1XHRQvCr9PUjXo=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Mon, 19 Oct 2026 15:14:34 +0100
Subject: [PATCH RFC 2/3] firmware: arm-smccc: add FIRME device
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-firme_interface-v1-2-27895c9cebaa@arm.com>
References: <20261019-firme_interface-v1-0-27895c9cebaa@arm.com>
In-Reply-To: <20261019-firme_interface-v1-0-27895c9cebaa@arm.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki Poulose <suzuki.poulose@arm.com>, 
 Steven Price <steven.price@arm.com>, Sami Mujawar <sami.mujawar@arm.com>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Jiri Pirko <jiri@resnulli.us>, 
 GONG Ruiqi <gongruiqi1@huawei.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=968; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=miXpFvzDWp1rgsrIkIJfHSpb/+AkGB7/fFGMtDBCe3w=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBq1iXMjM/voiX2Ms0h8f57FQMSvqR80WL6OssPU
 ovmmDE4zOuJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCatYlzAAKCRBt1cPRWsUx
 MwpfDACtswE5QJhiFVWWeE0ASCXR0zcB4pqB7yJMiKcm4fBw0OSzWam1ux1itTZ2+fhhLu3FmvM
 RT4s7OaMx/MuMk8e8Y8zbOVo3pu6fcHzWGwWBt2yzA2+jPUZqwnNSo1XKAnBy3cMSwy4AnUjeKE
 44jUK6UK+i1B8TtakqUoVWw0LSkm741TJm68YkcAJOoHsyAHDYnQvzWpXZLsddJfzXI/kEPVNAo
 32PK0kh3dWRMybl1djyzZNfvXpYUW5qApM5Ttijy4Z9jq89lSK+dCmHz213DyDv13Itbgshhpuh
 vos2uj0qY5xd4q+qix9xMnoPGUtpS9QMVynspeAt4hgFGWcps/3JGFMITfuRBBVQqo8hQznORk3
 crqRHaYsFDNmu265dlmzR665lf7DaZP/39oindQ8Djn/aWXcDZKZW2mBwOpm7Xdnw3VwDDywkX0
 qL+Hyu/jF0Gtd190Fwoh/KiPzooZHrRRlR3Gc+RN96S2jVuD1PUPRUQysC6F41HN3yHs0=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133

add FIRME device into arm-smccc bus to use FIRME service.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 drivers/firmware/smccc/smccc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/firmware/smccc/smccc.c b/drivers/firmware/smccc/smccc.c
index 5dc768ac4143..8398a77a2ec0 100644
--- a/drivers/firmware/smccc/smccc.c
+++ b/drivers/firmware/smccc/smccc.c
@@ -11,6 +11,7 @@
 #include <linux/kernel.h>
 #include <linux/arm-smccc-bus.h>
 #include <linux/arm-smccc-rsi.h>
+#include <linux/arm_firme.h>
 
 #include <asm/archrandom.h>
 
@@ -100,6 +101,11 @@ static const struct smccc_device_info smccc_devices[] __initconst = {
 		.requires_smc   = true,
 		.device_name    = "arm-rsi",
 	},
+	{
+		.func_id        = FIRME_SERVICE_VERSION,
+		.requires_smc   = true,
+		.device_name    = FIRME_DEV_NAME,
+	},
 };
 
 static bool __init smccc_probe_smccc_device(const struct smccc_device_info *smccc_dev)

-- 
2.43.0

