Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1C0454836D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419282; cv=none; b=P1Ci8sQH26I0Sx9/805b6U5TiM1xup1RQGPpMIBOhAnAjYs2s9eHhmWVk23Dh3MrCWIkjUi5h7yIju5GTlump8/jFp9RvYOUHIAVCmha9FzxvtnDV+9axhxE6Iftv9TmaNufElKlLXJUq5Ex7fLvlapXEUYcum64H6loEJMLDoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419282; c=relaxed/simple;
	bh=acYj46bAxdWbuEbOhneF5ckxlobjJs/JJVp9hxOcfo4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=b/IbPtdBWuX2vGAQ9NpdY0K+MJ78rdMC10mboDmiNVsv/9Gw1vWpAlRLMJMimtoZgMiEYLXY/do5jyPY3+iVhxQId1o+UCsfNPYyQGO00Iu+WCihPFkGcLeyYxza5cMdht8xK2AK3HvHibUwKRAepnJbaKINUHJUN+X1MjGc1+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=j5RdBllv; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="j5RdBllv"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 36D301682;
	Mon, 19 Oct 2026 07:14:36 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B23B13F871;
	Mon, 19 Oct 2026 07:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792419279; bh=acYj46bAxdWbuEbOhneF5ckxlobjJs/JJVp9hxOcfo4=;
	h=From:Subject:Date:To:Cc:From;
	b=j5RdBllvhFGZfX6lQGSnPcns4MMpNcHTbQhwiUAOkQG3/GcXt+2wxDGnyCpt+MZWY
	 3EFzwkYaIagQoAgDRm2WyxkWe+PzYhkp+VOFz4aNeuuZWdu45/bXcYoYi26Wv6qyHU
	 xORYVLZ9o88+2nWVbOR1rN1ELy2Y+rDuw6SXyDjc=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH RFC 0/3] firmware: arm_firme: introduce FIRME support for
 host attestation
Date: Mon, 19 Oct 2026 15:14:32 +0100
Message-Id: <20261019-firme_interface-v1-0-27895c9cebaa@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMgl1moC/22NwQrCMBBEf6Xs2UgS28Z4EgQ/wKsUCXFj95BUN
 qUopf9uyNnjm2HerJCRCTOcmhUYF8o0pQJq14AfXXqhoGdh0FL30mgrAnHEB6UZOTiPwnS96n3
 bOS0PUFZvxkCfarzD7XqBoYQj5Xnib31ZVK2q0P4RLkpIYc0RQ2i196jPjuPeTxGGbdt+IluBn
 LEAAAA=
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki Poulose <suzuki.poulose@arm.com>, 
 Steven Price <steven.price@arm.com>, Sami Mujawar <sami.mujawar@arm.com>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Jiri Pirko <jiri@resnulli.us>, 
 GONG Ruiqi <gongruiqi1@huawei.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4888; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=acYj46bAxdWbuEbOhneF5ckxlobjJs/JJVp9hxOcfo4=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBq1iXLCXbKAMZvRl/irKlXnYVtSLBN/LtDnUB/w
 c498eQFNF+JAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCatYlywAKCRBt1cPRWsUx
 M6oJDAC9lDUAB6f+L01DAIp7rWxMexvCisf52P2617kAUk0ZoyHr13GVoL4UsDUHQlmpof9pVPM
 VcG1lZOifb4InJAj1AcD/uczITyrpeEGJASp3+qUkIPDERiPyj/MZQ+YywmzKY+HoZs9ZVyHmat
 6OCAcKlpZOSiTfLb2J59Q8p4nXCEYVhQNXYXMVFYb+0+XzhHAxqXj9UNGoblgtRyf8Xy9ZlmyQ/
 PqJ3rTUuRXgG+8DKfM8GmmObWmLFn9oSbSUMfatVbWmGL4Fb3xUEamP0v8b9FIvxG+XfCSOzmNp
 VXb9bnGD9pQ+ujSbfxe5QgfO7Kz9tVS3g6XN5HZclTgEdL0FDbwFiFEvKEvxLlytz8bzeSF+5mw
 mk/i2ciSd/12hKqi/7AXf0wEjcIbxE7YskWYvZmMUTC3Ao/hcAAm6sEaQRvqAptkE0CWLgo3eIZ
 8gXGZZ6fTtNtICcUkE6nQ7xx0Iyc0tERVTa+raIuXObn0udy8f4c7bNrcaz7fg47k22Co=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133

The Arm Confidential Compute Architecture (CCA) introduces the
Realm Management Extension (FEAT_RME), which enables the creation and
management of dynamically allocated, attestable trusted execution
environments known as Realms.

Realm management relies on EL3 firmware to provide services for Realm
construction, resource allocation and isolation, and attestation of
the initial Realm state.

The Firmware Interface for Realm Management Extensions (FIRME) [0]
specification defines standard interfaces through which EL3 firmware
provides these services. FIRME defines the following service groups:

  - Granule Protection Table (GPT) management
  - IDE key management for PCIe and CXL Root Ports
  - Memory Encryption Context management
  - Attestation Token management
  - Integrated Device management

FIRME also defines a Base service that provides common functionality,
including service discovery and feature discovery.

Although FIRME primarily supports Arm CCA, its interfaces can also be used
on systems without FEAT_RME to provide firmware-based attestation and
other security services.

This RFC patch series introduces the arm_firme driver, which provides
the common infrastructure for discovering and accessing FIRME services.
The initial implementation supports:

  1. FIRME Base service:
      Provides service discovery and feature discovery.

  2. FIRME Attestation Token service:
      Provides access to firmware-generated platform attestation token
      used to attest host firmware.

The Attestation Token service is integrated with the Linux Trusted
Security Module (TSM) subsystem, enabling userspace applications to
retrieve platform attestation tokens through the existing TSM interface.

The objective of this series is to establish the foundational FIRME
infrastructure in the Linux kernel and enable host platform attestation
using the standard TSM interface.

NOTE:
  This implementation is based on version 1.0-ALP4 of the FIRME specification
  and for-next/smccc-bus branch in arm64 tree.

RFC and ongoing TSM infrastructure discussions
==============================================

There are ongoing discussions regarding changes to the Linux TSM
infrastructure [1]. This series is being submitted as an RFC to gather
early feedback on the FIRME driver architecture and its integration with
the Linux TSM subsystem.

The intent is not to pre-empt or undermine the ongoing work to evolve
the Linux TSM infrastructure. Rather, this RFC aims to highlight an
additional use case that the evolving TSM infrastructure will need to
accommodate, namely host platform attestation through
the FIRME Attestation Token service.

While the current implementation uses the existing TSM interfaces,
we recognise that changes may be required to align with the proposed
TSM infrastructure.

We hope this RFC will help inform those discussions and ensure that
the requirements of FIRME-based host attestation are considered
as part of the ongoing TSM development.

We welcome feedback on the proposed FIRME driver architecture,
the integration with the TSM subsystem, and how best to align this work
with the planned TSM infrastructure changes.

To: linux-kernel@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Suzuki Poulose <suzuki.poulose@arm.com>
Cc: Steven Price <steven.price@arm.com>
Cc: Sami Mujawar <sami.mujawar@arm.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Jiri Pirko <jiri@resnulli.us>
Cc: GONG Ruiqi <gongruiqi1@huawei.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>

Link: [0] https://support.arm.com/documentation/den0149/latest
Link: [1] https://lore.kernel.org/all/arzr32ZDComnfmny@FV6GYCPJ69/
---
Yeoreum Yun (3):
      firmware: arm_firme: introduce arm_firme driver
      firmware: arm-smccc: add FIRME device
      firmware: arm-firme: TSM_REPORT support using FIRME

 drivers/firmware/Kconfig            |   1 +
 drivers/firmware/Makefile           |   1 +
 drivers/firmware/arm_firme/Kconfig  |  42 +++++++
 drivers/firmware/arm_firme/Makefile |   6 +
 drivers/firmware/arm_firme/attest.c | 172 ++++++++++++++++++++++++++
 drivers/firmware/arm_firme/base.c   | 145 ++++++++++++++++++++++
 drivers/firmware/arm_firme/driver.c | 139 +++++++++++++++++++++
 drivers/firmware/arm_firme/firme.h  |  53 ++++++++
 drivers/firmware/arm_firme/report.c |  88 ++++++++++++++
 drivers/firmware/smccc/smccc.c      |   6 +
 include/linux/arm-smccc.h           |   1 +
 include/linux/arm_firme.h           | 234 ++++++++++++++++++++++++++++++++++++
 12 files changed, 888 insertions(+)
---
base-commit: c83237edf0adb8f8cbd9859841bbca5acc00fc11
change-id: 20260729-firme_interface-75616c45a203

Best regards,
-- 
Sincerely,
Yeoreum Yun

