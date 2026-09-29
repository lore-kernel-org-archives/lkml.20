Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A02D8530DEC
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790701078; cv=none; b=qZJG93+0AzVuv5e8SU+FpVl4rs7T0MROVYldhsNhyf9okqZGddjNW+Tvu6mW2ncgsd7lhSEVHcSBXQ6KLaqbRjNQjPkknsfF6UWGvUnp0DYLDcisVAp+xhxc8TeKeyUhRsSpvR8E+CkuuZjNLOQ5aLVABZi+teDOJiXAObN69/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790701078; c=relaxed/simple;
	bh=8fXuBMTuT7/ajr1ByNzkN+6WlqLmt7pB0qIvAjl7yUs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RCXfyeHNNltGAISeu4uhRh1vZSik4iHCWKasEuMSlBQwpBp9Y922uygjmbzVhDSd1s0jpsDyHp/yCcbi/STfkXQN+aldXKyZyQcStitODAiDBka4pruB5HSnwTpE/DU3J2rQfQTRodtaLQZ1L9BYm8YjNvHp2aKBGpaHE28LVhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=D3gyaQMk; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="D3gyaQMk"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 458461516;
	Tue, 29 Sep 2026 09:57:52 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 638A73F85F;
	Tue, 29 Sep 2026 09:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790701075; bh=8fXuBMTuT7/ajr1ByNzkN+6WlqLmt7pB0qIvAjl7yUs=;
	h=From:Subject:Date:To:Cc:From;
	b=D3gyaQMkTzjF+zqrbqpopa+65GMPLxMhu+D1ujRmUDG7ojcA6NDLEL+Ib51MN9+rq
	 QAYocfxNcMn8vZErRDPgIrO8+7yg28YRZIVH4usQI/kSrRUaeXbV2De3tgGj8tvVsA
	 ViBqk2MVwNewyUm+TV2MvyYyfQEvbP0QjnAgGUO0=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v2 0/3] arm64/virt: Add Arm CCA measurement register
 support
Date: Tue, 29 Sep 2026 17:57:46 +0100
Message-Id: <20260929-arm_cca_mr-v2-0-1d98bba187fd@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAruu2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDSyNL3cSi3Pjk5MT43CLdRENLkySjVEujZENzJaCGgqLUtMwKsGHRsbW
 1AALSt7FcAAAA
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Suzuki Poulose <suzuki.poulose@arm.com>, 
 Steven Price <steven.price@arm.com>, Sami Mujawar <sami.mujawar@arm.com>, 
 thuth@redhat.com
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2943; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=8fXuBMTuT7/ajr1ByNzkN+6WlqLmt7pB0qIvAjl7yUs=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqu+4QUPDb2QnF/a5utA7oW1E4VdgU7ErT9zJCU
 VfWeKFUbM2JAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCarvuEAAKCRBt1cPRWsUx
 MyXWC/9eYmpMk5a1yC3S4+KZ+qKJOFsNto/1lpqsbF8A/D2V36i1aCAMWEdX2XsNR2J2jgD1ALt
 P3QdRjM4UhAyoSOuwbT1stx4gY3Ai1sCHHBV5jXgg+4hst8YWTK39b4S9pWs9MqQ5SJahAImtIM
 iOoPQ8OAoFxarJ88ypRyvX93MSpwhzcRYN457V4mwuT62LdZXSVVD7MAkzTpClqjl9J5P7kQAS8
 QK3+wkUlzkckkHH94iqrz9W1X3uLGer7/2cySwFlFIGpuwQWnFWwuNV/L4Ay+x62yYKBjh0EtwW
 ArM4024fwerybc95IOI3Oogp6pEGamptHlYmAEEz14VQ6mhsxljGX4KebsdfS+5PW46CEjdnNXE
 d9nscgXteIizAWbpC1PZsLOWVf/sX9pseWwU/bc3cPyO36+0ZTIGgEJdgFRqVhucMAGcwCiy4sh
 oYpYPDXKtnaHkchtO0VKG7WYD/Byux2Jo/Hl7x5zlPZ/43ibrUXjV8BdmiuZS9L4P3sBM=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133

This series adds support for Arm Confidential Compute Architecture (CCA)
measurement registers in the Linux kernel, enabling guest Realms to
access, extend, and expose measurement values for attestation and runtime
integrity tracking.

The Realm Management Monitor (RMM) defines a set of measurement registers
consisting of a Realm Initial Measurement (RIM) and a number of Realm
Extensible Measurements (REMs). This series introduces the necessary
infrastructure to interact with these registers via the RSI interface
and exposes them to userspace through the TSM measurement framework.

At a high level, the series includes:
 - Helper interfaces for reading and extending measurement
   registers via RSI
 - Definitions for Realm hash algorithms as defined by the 
   RMM specification
 - Integration with the TSM measurement subsystem and sysfs
   exposure for userspace visibility and interaction

After applying this series, measurement registers are exposed under:
    /sys/devices/virtual/misc/arm_cca_guest/measurements/

  Where:
   - rim is read-only (initial measurement)
   - rem[0-3] are read/write (extensible measurements)
   - The hash algorithm reflects the Realm configuration

Patch summary:
 1. arm64: rsi: Add helpers for Arm CCA measurement registers
   - Introduces RSI helper APIs to read and extend RIM/REM registers

 2. arm64: rsi: Add realm hash algorithm defines
   - Adds definitions for SHA-256 and SHA-512 identifiers returned
     by the RMM

 3. virt: arm-cca-guest: Add support for measurement registers
   - Integrates with TSM measurement framework
   - Implements measurement register refresh and extend operations
   - Exposes registers via sysfs using a misc device
   - Dynamically configures hash algorithm and digest size per Realm

This enables a consistent mechanism for attestation-related measurements
in Arm CCA guests and aligns with the kernel TSM measurement abstraction.

This patch based on arm64 tree's for-next/smccc-bus

---
Changes in v2:
- rebase to arm64 tree's for-next/smccc-bus
- Link to v1: https://lore.kernel.org/all/20260413084957.327661-1-sami.mujawar@arm.com/
---

---
Sami Mujawar (3):
      arm64: rsi: Add helpers for Arm CCA measurement register operations
      arm64: rsi: Add realm hash algorithm defines
      virt: arm-cca-guest: Add support for measurement registers

 .../sysfs-devices-virtual-misc-arm_cca_guest       |  38 +++
 drivers/virt/coco/arm-cca-guest/Kconfig            |   1 +
 drivers/virt/coco/arm-cca-guest/main.c             | 282 ++++++++++++++++++++-
 include/linux/arm-rsi-cmds.h                       | 105 +++++++-
 include/linux/arm-smccc-rsi.h                      |   7 +
 5 files changed, 430 insertions(+), 3 deletions(-)
---
base-commit: bce57945f5e7207960b2bd567a6e880f90258ffb
change-id: 20260929-arm_cca_mr-a194b2e92c17

Best regards,
-- 
Sincerely,
Yeoreum Yun

