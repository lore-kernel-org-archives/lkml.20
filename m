Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F513446AD
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789499592; cv=none; b=neUw/7CMEQ7DnByP6pPCZaIHar8ZVaZPB6X3tZ/lzFvtpkO2eXhmHiiL9ZbvzTeQp+zUPjaBQXAVVvdd7I5sVzJq5C7CEVt7Y/U5LZn6DQwSsJGPS+4NN+Kjwz/d/rgwN6uyOE0F2lEtoF3Oo9LEyZtmB0Oe6vUHld55XyQhtaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789499592; c=relaxed/simple;
	bh=UlKFmriCqhBUVfF3XegD38NJe/Kiyz0XHZuAH4D1adU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=j6x1Oh6LKQTL9QUimGMnKEvc2SUT6EfMBc6sO9yFRPMLFQu3xH9oTAJclzlU6lS0ziXFgYB0XSztophL6GLQDDsEmakFDgPUZCYMqaY/gXQohR60mYUqRMRW62nVSMI4dcDqcn/mgDpvNfBDZ06w28zvuIFX23/77Li5MNKAocE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aD/2VADH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aD/2VADH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF3A21F000FF;
	Tue, 15 Sep 2026 19:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789499590;
	bh=BucQk8jnC42ySucV0Or73xIsHrWN44jAPpHb73iJ7pM=;
	h=From:Date:Subject:To:Cc;
	b=aD/2VADHyiXENg0qiI/QTE4mJWl8eyS32mKoo5WZs6QLj/pBkb4LK8sMHdKamBBxI
	 OaYJHhCdqYMnw3JHXqXCMAaCd4j+VBWOWFvLTWR2A6m7XT7Wn7LSmIZJTPdCUE3nB6
	 koh2wfIYDzbuL7YOIcZyxmMmBSlbzdCeom4fqN0geWt07c3Hw9FO/JXhxhFSiAPlkx
	 VvYRSWCK3L0xlbSh2XWzwdr+SqOrAqE2iiPDxSCXYMnmhjUFYScIMHcANfjwpmzwFw
	 s12aqP/Jfm2jiy4p3z9pmd3GJRssAVgVfAGuEnOy2etb72Uvpc0rv1OSjU3RbFKh4q
	 JpLQFDw+EfCBw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 15 Sep 2026 21:13:03 +0200
Subject: [PATCH] irqchip/qcom-pdc: Fix kernel config dependency
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-topic-pdc_fixup-v1-1-0f7f7de924de@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM3QpAQBCG4VvRHNua9VfciiTGYByw7VopuXeLw
 6ev773AsRV2UEUXWD7EybYG6DgCmrt1YiVDMCSYFFjqXO2bEVJmoHaU0xtFGouMsccRUwgvYzk
 MX7FufjvfL0z7m4H7fgBzMkSfcwAAAA==
X-Change-ID: 20260915-topic-pdc_fixup-c1064e0b0f03
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Sneh Mankad <sneh.mankad@oss.qualcomm.com>, 
 Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789499587; l=1049;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=JA+RW3E0m9Y7x53k9ouDRc/88oXdQtObKqTW0nwSoyo=;
 b=8gopUtYIFSUc3kYBEM8l1SJDDWO955nQY1omAADDmw28BYigDqadx/7Nv+dxGTwgZeE3M+GiY
 TQ6g/98Yc8KD28PO9LUu5BgH/OhI4Fl5QsqHEbdLMA1EocgKN53o9wl
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The commit mentioned below added qcom_scm_io_writel()/is_available()
calls without updating the Kconfig. Fix that.

Fixes: ad01c2b2f291 ("irqchip/qcom-pdc: Configure PDC to pass through mode")
Reported-by: kernel test robot <lkp@intel.com>
Closes: http://patch.msgid.link/202609160249.tiuDbEzF-lkp@intel.com
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/irqchip/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index a8f8c423b795..5213cefc1077 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -524,6 +524,7 @@ config QCOM_PDC
 	tristate "Qualcomm PDC"
 	depends on ARCH_QCOM || COMPILE_TEST
 	select IRQ_DOMAIN_HIERARCHY
+	select QCOM_SCM
 	default ARCH_QCOM
 	help
 	  Power Domain Controller driver to manage and configure wakeup

---
base-commit: 1a1de54f7369cd2b5bac0f265910e60ad3a6b4c3
change-id: 20260915-topic-pdc_fixup-c1064e0b0f03

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

