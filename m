Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1EE42BC43
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 18:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789495811; cv=none; b=PdNr/KmaH4tsRbQtOwqqTuX95qvVLtyU3FKPlxg6iiOUa1eEKjbyW169dSZnhgUCeqwHjhhfFRHfszGd1rzp1lV1FwwkM4c5uJQfaW27OkkALyBigrBzC3CrjBM4HuOMyZX0eXCLty513o0NBMpI8EGNIOtPS7yh52+OheHwsKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789495811; c=relaxed/simple;
	bh=z8HNl0xymtC9OMb9m4yWES1OaOT9HUEDb8ymvvRc7Uc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ufHGtVIlks1UHhlQqWioT9rQlRlzyx30l01mcy2flznNCaXSX5jHyJewaCpnGjxBxCMreAm+Rf8DelFfRoBT67hHZHFE1osqXFSkJvRqQ8jsfGutWZjf2Gwdh4Y7T5QB3OkHvNqCr4IALDcI9GIVdBfr4rAGKkni8Q4oxD0QVAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=m2auIjw3; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="m2auIjw3"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-939922847efso8444185a.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 11:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1789495807; x=1790100607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=22xfVV5hCviOiMQtMKw9vaS9SNxAHQv+tM1KVgQ9uIM=;
        b=m2auIjw3TcShu/UqyJ3L2NXS8NpZ7yP38tElYMXVD6HfZkbhDk1QEnXbohh8Deb9aA
         UbgVWpLt+4xtVsIm10NrVRsTdMkN1mSF//bbNZMJpjUVy1gHIY3IgesGdxfBqUeY1y7H
         rST5m6SdzfjfjOo8P4xQXgxfJOFOR9P8FBpCDuc3tzqp7JbK1CnvkcWbNcwGNSrTVynb
         n7Fn+9GCu+LYuH9LryTA29Cr+qzvCWOPngIIIb8Zhk8NB7he3ZqysHfcXQKV8lfkuRby
         iNDfZmnqC4byybO73CvYDiabafvih+MOxCK/XFTB4FkTZQcxmdrcEjLuPQmr32f2A7Y3
         H7tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789495807; x=1790100607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=22xfVV5hCviOiMQtMKw9vaS9SNxAHQv+tM1KVgQ9uIM=;
        b=vZkqTkP5dm4VgdWhcgjkeSZCYiCqFb/uCq7CnAUtrUtIU9txAKGTxLftq/wzos69NN
         n3uCXEU/ocYUPEd5mNDktg8urm8JmD96M7P1ChABD0sondgiuZYHqC9rtlDuAbp5TW7r
         /41XwEB/JOQ8nYqlDuXB1+T/ezE3xI2rZfwIczKTS5AiXFHzZWQWR6qmgUZxnPAJ5UAA
         OoaqiQypunXVOh45WQrMQSEbymtHF1pUPPM+WVvLOQj3B110J0DopS/LslnaueBiBUet
         OebOG3nTRPO3QATFHlVSDy1lGtZetF4DBqhz8DgmKBMjfWaML6lvhkts6FYfGpA9hEh5
         /l4w==
X-Forwarded-Encrypted: i=1; AKwUvBzE6owvAMa2kwIivmi0yo/fxQUGEKcerbbNDjZZRP5E5hnuOCOSWzVM17kiJWTumLbzb/swP1H5/Ayf7yE=@vger.kernel.org
X-Gm-Message-State: AFuF++mSErLcDHiONA/3VyK0JSgbt/Pc0DCDRIxVBTe5Q2+31S8+z81i
	Micpqi1+0KDuxHmqTTLt385OJQlNoAQGDPDiDi59JR3khgNREeh7931UhPjOt3scLUg=
X-Gm-Gg: AYBFou2dW2ywMM3MS5L6AQR++BkYGYtMS8Pf9Taq3RzbUnOyorSP5TwFhQ9nq3MEtjf
	PqdYOqM+fJmdGZowEMsMgdYkBPdJkc7F2dt3whZb9/6Skf8vpni0eNX5pnzrF9qiKF0kGKWmcx3
	nQJINl1GtbPrP3P/GB35s3l+1/y2BCYeCOP/ntCYATEn9g0/5VsMd/oHzrBeL0xF1FriL0AO3eT
	qE5HQI/Akj2BrVtV0LPw3P9AfkH6e6zy16sBV3UZUlHWornnqOdBScwh5L6Dx+A1QIWVQKRZTCF
	/TIjXNiqnrxav81oNKf/nTQkmZo4XIVjOQdlEIoQkeUadPHuW9CTbPEtLdymQGy9IWLQAAPxdpT
	HzEYmZvHk0SNiS6qCim7N1HDXWZopTF4A7CKZlFhdanrOGdulRuMcdJGViG69pJ/TPrzY0cZI3e
	n9rCyFAJ8AtYAbTafkKm6skvNti+Zye+U/KQG3E9p6bzVfvSukQlUb1LVWlBgyN7DGHvyw80gCi
	3w=
X-Received: by 2002:a05:620a:2809:b0:939:5ab4:e6ab with SMTP id af79cd13be357-93a40752e39mr312131285a.5.1789495807276;
        Tue, 15 Sep 2026 11:10:07 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b7824f72fsm14648485a.28.2026.09.15.11.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 11:10:06 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	bhelgaas@google.com,
	andersson@kernel.org,
	konradybcio@kernel.org,
	abelvesa@kernel.org
Cc: daniel@riscstar.com,
	mohdayaa@qti.qualcomm.com,
	lbiancon@qti.qualcomm.com,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] PCI: introduce TC9564 misc driver
Date: Tue, 15 Sep 2026 13:09:59 -0500
Message-ID: <20260915181003.1633543-1-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Toshiba TC9564 is specialized SoC that implements a PCIe switch as
well as an Ethernet AVB/TSN bridge.  It also implements other functions,
including a reset and clock controller, an address translation unit, and
a few other devices.  PCIe BARs provide access to registers that manage
these IP blocks, and the SoC is modeled using a PCI endpoint bus in
devicetree.  This allows the IP blocks to be bound to platform drivers
using MMIO through the PCI BARs.

This series introduces the simple PCI driver necessary to implement the
PCI endpoint bus.  It enables the device, enables master access, and
then scans the devicetree subnodes to discover any devices defined
within the endpoint buses.

The driver is placed in the "misc" directory, following the practice
of other PCI endpoint bus drivers.

This version of the series was sent quickly after version 2, to just
address some very simple Sashiko-reported observations before others
had a chance to comment.

					-Alex

Note: to work correctly, this series depends on this:
  https://lore.kernel.org/lkml/20260910021919.3421449-1-elder@riscstar.com/

Between version 2 and version 3:
  - Call of_platform_depopulate() if case of_platform_populate() returns
    an error in tc9564_function_probe()
  - Eliminated an unnecessary dependency in the Kconfig file
  - Updated "parent addresses" in the DTS file
  - Fixed a dumb typo in the binding
  - Note:
      - Ignoring the Sashiko report about the place holder ranges
        possibly not being updated at runtime.  (The above-mentioned
        prerequisite series will cause them to be updated.)
      - Ignoring the Sashiko report that the pci-ep-bus nodes should
        include a reg property that matches the node's unit number.

Version 2 is available here:
  https://lore.kernel.org/lkml/20260915031038.1087264-1-elder@riscstar.com/

Between version 1 and version 2:
  - Updated the block diagram in the binding to include BAR2 and SRAM
  - Use KBUILD_MODNAME for the driver name
  - Removed bogus initialization of pci_driver->driver field
  - Added the third patch, which defines pci-ep-bus DTS information.
  - Now based on the Qualcomm for-next branch

Version 1 is available here:
  https://lore.kernel.org/lkml/20260813222943.1655453-1-elder@riscstar.com/


Alex Elder (3):
  dt-bindings: misc: introduce pci1179,0220.yaml
  misc: tc9564: introduce base PCI driver
  arm64: dts: qcom: qcs6490-rb3gen2: add endpoint buses

 .../bindings/misc/pci1179,0220.yaml           | 154 ++++++++++++++++++
 MAINTAINERS                                   |   7 +
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |  30 ++++
 drivers/misc/Kconfig                          |   9 +
 drivers/misc/Makefile                         |   1 +
 drivers/misc/tc9564-pci.c                     |  84 ++++++++++
 drivers/pci/quirks.c                          |   1 +
 7 files changed, 286 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/pci1179,0220.yaml
 create mode 100644 drivers/misc/tc9564-pci.c


base-commit: 27b3028b7d65cbc44fc5b60d2e977ce55cf186f1
-- 
2.53.0

