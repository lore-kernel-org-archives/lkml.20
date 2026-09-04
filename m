Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857764A2616
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 13:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788529575; cv=none; b=NfaylTnoCVZ+pmoi1+kcXm0E/kAT2Z//X8H8VmdLt691M9VfSE1B6t9SlPZyIpt1PCcOS6E+kPFUmgW7Tc7iy6L6VNWT1lHtRTPG+8i+pEZVSoco2ah50O4FHWDwf9s2zdb//823aZT8oUI8TS0kfdBKK+TH1Jt/0TsGZeuow+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788529575; c=relaxed/simple;
	bh=aRDNjiBSJdp4KAleprd2J6YFWETwk979Dw1PDfikz60=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RmR7iqOO6rxT0cV9Xuh2pVQO9WxWRYY1fD+etEdqgZkzFOu0PSCvrRXlX4Kxz35ZQv0mghCx4MOm81qp8fAW9/d4MDecgxxg88lR2jf1pf8Gaqavz4dok+GmxlZXmVtx31XfabsfI2eSxFz01v1BF33hLQsKRucadW/C5k9Qd+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=rMQxXj08; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="rMQxXj08"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-92e99ef0902so86054785a.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 06:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788529571; x=1789134371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nmxDfVgaXo0zCFfrt0BitM9JEDcb53UQDgVMwH70Kbw=;
        b=rMQxXj08jg3hHocTg2zWYmb3Pa+qjmobqsM6QC48oHWSAjcejnMrxXWdntOgXHUQa3
         65/q9rY5jsxxTx/afd4EWfXK3RDyl85kl9SNhNMauYA89NfRP90nx1XzMwmmcxHY2w4E
         eAObqArLBbjoihptgivUBOXEvBqI/mIAAhhd3omyOOzWogYYlfvk8DAU1CdS4A9MLlNO
         s3coR78DIY0nK09tIOTn1YCEz1ViWEzJX/ANguW6L6sgUXq1hCPTVsAWbNUbq3+2b9tW
         +/JAAG+QZuRTl5DjN/8k57E0+qXhY95KpJ72Fnh1IB7w+n8ltb2JV++/aDIUETHXGSVo
         b7RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788529571; x=1789134371;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nmxDfVgaXo0zCFfrt0BitM9JEDcb53UQDgVMwH70Kbw=;
        b=CFpYf7bhF6bgEwDVaqHIpz8uUbXm7Mwmd9sZfGztetEtMUTSr5ASMbf2Wk86TFUW16
         OOHAGhTslUUlU8YCY7brvYU2c7iJdyWIsSI6ytNPzVg3k5H/khvEYXDpbf4N+UQHVw1/
         cxA3nXpq8JxPZdJ8r9reETRRcLMQgyljR6JubgM3JoLGwKtNTR7Qvte66sZehOvDnTlK
         bgeL6R7b3J/5R91vfmcsLIvqJSBSHkIeLyuOYO/rW0S7+QZuP6UA7xpIpkG0BeoiwDgU
         vvEGNsF2IyQ4YXNDYGTlZwj2c6PPjuIfiDZ6jfsPlwUO1M1igQXtvTgesoGaKOpR7zjt
         htSg==
X-Forwarded-Encrypted: i=1; AKwUvBwJRfw9bj1kIfdVS7gKd0Bevv1BHl/zjvdFLK6X8k/wFvcfURW3eg9Hvd744BToR+tZL6uDdYqEePO6S9M=@vger.kernel.org
X-Gm-Message-State: AFuF++lSdR1vnkv/hhfFPmbS4g7RFn48VwmdxE2EoZ5RVWCIjuBrQgs3
	GUnwuSLY2CJiLmE8ozrmQW7Ztmv1kQaW7/vIKsWlnsEXKWPWqzmvDJrkK+w4JOh5PCM=
X-Gm-Gg: AYBFou0o3TZn+/vvxEXKymEqNnItWPC53wc8wkO2u07Wl+mTdzwbCfbArx4sF27mwnE
	lFVyb7stb0hSq5Ix6XfsCvXj7gG+pS4ocn0BbSeqWDqb9pu3ZccI4A34xIcPYiS1vWj82/ocfJf
	g8qEbNeRww3eDERoMZd2bQDvhRu3fXyW9bgmAvk2Rpwy3fsjePQ9hPXKl8/FwzLg4KFsQzdZisb
	RPT2WQyIMJtoNVjvb/bfaHDbIDM49UfFuTFKELvaFSv87iyCAJIcyaAL0IItdSmc8geVfmp8yzP
	qh/zIqfKbzk+F5w5SElmRJCeUSw3f2iruWCjik7Gi9EGqD+zlhMznHzzmtXVJXlYcm7ov6FScdv
	PjgI9exi8FyiLCr93WqcrofVKw+bcXsYNfHLW4pZ2hC73Bb41IKVNVnH/srucd9x8GHhais7NOu
	BoBnYTk0WEHXDE8Bx384Ret01OofyR/aDUM5uatXvMRJfSuK95jQWJbXegaw1mq63aXIn5aT081
	YA=
X-Received: by 2002:a05:620a:8017:b0:939:6ec8:6928 with SMTP id af79cd13be357-9398037ac44mr597251885a.16.1788529570935;
        Fri, 04 Sep 2026 06:46:10 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fafc3a7sm211613885a.14.2026.09.04.06.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 06:46:10 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: bhelgaas@google.com,
	robh@kernel.org,
	saravanak@kernel.org
Cc: herve.codina@bootlin.com,
	daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/4] PCI: of: warn on bogus device_type property
Date: Fri,  4 Sep 2026 08:46:02 -0500
Message-ID: <20260904134607.1856121-1-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a check when adding a PCI device to ensure the device_type
property is (or is not) correctly defined when the device has
a non-null devicetree node pointer.

PCI has a well-defined bus and device discovery process.  The
PCI_DYNAMIC_OF_NODES Kconfig option allows PCI devices to *also*
have a devicetree node.  This enables certain things that are
not possible with PCI enumeration alone.

While working on a Qualcomm platform, I learned that some PCI
endpoint nodes were defined with device_type = "pci" properties.
Herve Codina pointed out that this was not correct.  Rob Herring
indicated that people seem to have trouble getting the PCI
devicetree nodes right, and asked whether we could warn if this
particular problem occurred.  During review, Herve Codina also
suggested that bridge nodes be checked to ensure they *do*
have the proper device_type property, and later, Sashiko suggested
that "pciex" (and "cardbus") also be accepted as valid bridge
device_type property values.

This series implements these checks.  A new patch in this version
removes a (now duplicate) warning issued by the devicetree code.
The last patch that was included in v3 of the series is now gone,
after Herve pointed out it the message it removed was not in fact
redundant.

The first patch prevents a possible null pointer dereference that
Sashiko pointed out some time back.  The next two patches are simple
cleanups.  The last adds the new PCI devicetree node checks and
warnings.

					-Alex

Between version 3 and version 4:
- Insert a first patch that fixes a Sashiko-reported issue
- Drop the final "duplicate warning" patch from v3
- Include "pciex" as a valid PCI bridge device_type property value
- Add Herve's Reviewed-by tag on the last patch

Version 3 is available here:
  https://lore.kernel.org/lkml/20260901011338.1323243-1-elder@riscstar.com/

Between version 2 and version 3:
- Drop a patch that made a change only needed by a different series
- Switch a function header to use kernel-doc format
- Add a warning if a PCI bridge node has no device_type property
- Added a patch to remove a duplicate warning in the devicetree code

Version 2 is available here:
  https://lore.kernel.org/lkml/20260812172247.276554-1-elder@riscstar.com/

Between version 1 and version 2:
- Check the PCI devicetree node even when PCI_DYNAMIC_OF_NODES is
  not enabled

Version 1 is available here:
  https://lore.kernel.org/lkml/20260807194100.455599-1-elder@riscstar.com/

Alex Elder (4):
  PCI: of: avoid allocations in of_pci_prop_compatible()
  PCI: of: drop the reg_num argument to of_pci_set_address()
  PCI: of: don't zero flags in of_pci_get_addr_flags()
  PCI: of: introduce of_pci_verify_node()

 drivers/pci/bus.c         |  1 +
 drivers/pci/of.c          | 32 ++++++++++++++++++++++++++++
 drivers/pci/of_property.c | 45 ++++++++++++++++++++++-----------------
 drivers/pci/pci.h         |  3 +++
 4 files changed, 62 insertions(+), 19 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.53.0

