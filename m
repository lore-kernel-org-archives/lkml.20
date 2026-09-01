Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D5918DB2A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788270342; cv=none; b=cThyUg4b8QLdXl1TvJwzf2pyA/15i79zeA3Ciiqg2rh0Vf8iyO21vD9KOsxzyy+yUFpkVmQS0FFex+S0TzBBlzrR3T5SuGmPuNnbgcb+H8CWdQiHC4DIoBtJsEAzd6atoR81YJuNeS63kX+00c+XtuHNJ/BZWli1DN/qMt3q44I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788270342; c=relaxed/simple;
	bh=n8S1N4HMqJmFaWZb8BtBi1Z3aM0N3ju4Ou2QJeFQ1pA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t2TCMbcc/ew7QQkooAqYYMcAQl0QZ9PwbdTQGqhrTOGryV4PFeTwmgWgEKsGYQt7U/gcaQsWSpyfJXLECwgEMIdByCeNh1G/YVvo4bQ0OIW2D7cEH32PiU+D0dKkKrlCE03QB3BNPwCbpumkiz9upiTgZ11pQ7C6VuAvlI1shYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=H1YS9u+j; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MnY1DTlo; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="H1YS9u+j";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MnY1DTlo"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 8E8631400098;
	Tue,  1 Sep 2026 09:45:38 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 01 Sep 2026 09:45:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm3; t=1788270338; x=1788356738; bh=u/2WKJiH81
	3zDez9Gu7MaYZhwl6Qr4KgQuQZx4eK/fw=; b=H1YS9u+jDRfsIxCvQCNPPrlSo9
	ELjy+pOTaAe2lB6jXIT+Hy3jPuMCY3F3GbnMHEPfI5kpqFKxYmqoyyN6RKvFjQ8i
	IIAcvtI+lf59Li3yoVB0tJN2RN2KB7Iap7ePLEPjQBmqw3RQJIvvS5vTEbDaYk3p
	pzLKhmsIagb67becKhKyKyiiOeJTt40BiAB5y7fmmd/IXj+8QaA5TMJxf4c+eFi+
	lcrxXYMzJUCl7j6Xcg2RDXVtpEn6wqF5tAxwOccux2CGK2onKVRZP5YFIzkZ+/QN
	Z54LexLhISJ/sabhj9mHZvXzVBJuy+ksa/t0n4rckdREhvmR9IZfCmkBTu3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1788270338; x=1788356738; bh=u/2WKJiH813zDez9Gu7MaYZhwl6Qr4KgQuQ
	Zx4eK/fw=; b=MnY1DTlogN61IV1MlabKyTOEJtqr/u6vHXCNL45qXDS3IZgdtOp
	2/Ox1c67dEMDu12087CGOPPHlwhCo0XdZ3/l9hB2Sip2Exb2FXopwabkuz7y18TY
	8iLaU8/YV1l4yqG6+Lj5XI1sNb4EmvZbZSg5k062mo7tkAbY6HwRa2OdmCUm9iCJ
	3BDxOSOLmYbCo2v4c54lL/kRZ9e6qXIiWfAfpEWBUIjoQCQ3thW+RpLJdhiU6jVk
	Kine+BIfghCnMfYxdMs550PJHoxBsdLIbeRLO4dr6QAqA8Doj/jN2ut0t89w/v/9
	vFVCwOF9dYQ9DwQuRzwSZ708w2Qs0avVxpQ==
X-ME-Sender: <xms:AteWar5MYw8Uf-LqUvNNAUwSTajCjUmtO_MQKHq1OhRUtxKlpis38w>
    <xme:AteWautugiAO5DiiKxjV9fF9lgiegqesoPBLniY-OLAwXHoDa2Mhsgs7jaYamesDn
    FZLm6ExGRjyYLep-h93H1gBguDfRqepweXznviXIpj5bMlNhZUsmCnI>
X-ME-Received: <xmr:AteWas6RFb8GJvxI3iHEj1EIYb_F-sM9f16Oi6psnKrQuDe0UHO2YzzWu62Gpedp7zwraszTq_MlMstKtNIO8WQUDQBszgsTUCWb-pl6oq4>
X-ME-Proxy-Cause: dmFkZTFXzn7K4IBs0AWjSrBi1tbDLqn6FsjD8REj5nY2iBOsmJjfU3X2RVJOVPSr6tvI6N
    2pywvJryIh6VWDcFn2Psxxy46x4iX/JXqIMck4YkJxS80Pd641e7UecTacmQXX8p4mO2e8
    O7HoMXyVkYRSDIQcDx9/a295NAnSfTAt/B826qrjb9ohqI+Q4lOOPdixq4WheWtbn5QW8U
    1IAtneHXj0cMlXdDRVre5HPv9Rm2oCaXNS+uhO2mOXPMiCj1FZ2bw1+Ilwh2IVjIfkAhNh
    yfDXrgXbjaCYOnWWDrEYR/63u4lxqJNHti6k2tsKkX1DhtsK60cX8dpVE/Z9DvqyTJGnc8
    6JP/pdX8rGyVmmpWCkIRhrWXZEW+LDWArW2dFLgVDjo2+sLFg6NOv5MhP515OnxIqd6b9U
    +82PbSXVersDHho8bGOaWGby7OItkgaRpDcP4ernMSYNOQqQnmHbxvMyRTeFqt42NbCFIl
    KhI7iazF9V/UfqQJfDYG/BxFh/bl5tv+A27r978BLOoBqRMbIuXmVggXwBo0fXtPZd5axk
    qOCjThXW3Y6TtUOAsiOIalLmaaLQKTcJyHQTiRZ5zNIA9UmajFickxd9XuzB5l1oM6r3bk
    NCCjaZMz+nv0D/Hpx6uTaLLYxMGS+Jb4dknQvBTGXsEsQxbc4c0oidZx3k4g
X-ME-Proxy: <xmx:AteWapV2rBk5p4h6ATyktY29SbWZw3piXPqQJDpfNw0esIeWNESfzw>
    <xmx:AteWau9uP_BEHHYJWq8WkJ0une40f7Lx6jsuUwJ_V63_tR6B9oPY2w>
    <xmx:AteWalncLepEEKJDCrnvg63Zhw5OA25xLvLiKYV-MdpHy7Byn3fNKg>
    <xmx:AteWasVandygo7C4TFyoqoQKvgAtzOnDGk7dU4pl4A2KlfOEg7uvpw>
    <xmx:AteWaq8Wsl7L75OtrCougCXWc0nta5Iz0P1XoCfMr8rma_LGYLpi3iqa>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Sep 2026 09:45:37 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org,
	mistermidi@gmail.com,
	sreekuttan2156239@gmail.com
Subject: [PATCH 00/13] firewire: core: add KUnit tests for config ROM parser and generator
Date: Tue,  1 Sep 2026 22:45:21 +0900
Message-ID: <20260901134534.2386577-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

(Resent because the previous email was sent to the wrong address...)

This series adds KUnit tests for the configuration ROM parser and
generator in the core function.

The parser tests cover existing device quirks and malformed configuration
ROMs, including out-of-bounds directory/leaf entries.

The generator tests cover AV/C and IIDC devices layouts, combinations of
units, and invalid or oversized extension data.

The tests are intended to document existing behavior and provide regression
coverage for the parser and generator.

The test execution samples:

```
$ python3 tools/testing/kunit/kunit.py run \
  --kunitconfig=drivers/firewire/ \
  'firewire-config-rom-*'
[22:12:56] Configuring KUnit Kernel ...
[22:12:56] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=16
[22:12:59] Starting KUnit Kernel (1/1)...
[22:12:59] ============================================================
Running tests with:
$ .kunit/linux 'kunit.filter_glob=firewire-config-rom-*' kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[22:12:59] ======== firewire-config-rom-generator (4 subtests) ========
[22:12:59] ================ test_config_rom_generator  ================
[22:12:59] [PASSED] bare
[22:12:59] [PASSED] with_avc_unit
[22:12:59] [PASSED] with_iidc_unit
[22:12:59] [PASSED] with_avc_and_iidc_unit
[22:12:59] ============ [PASSED] test_config_rom_generator ============
[22:12:59] [PASSED] add_descriptor_with_invalid_length
[22:12:59] [PASSED] add_descriptor_with_invalid_data
[22:12:59] [PASSED] add_descriptor_beyond_upper_limit
[22:12:59] ========== [PASSED] firewire-config-rom-generator ==========
[22:12:59] ========= firewire-config-rom-parser (2 subtests) ==========
[22:12:59] ============= test_parser_with_regular_cases  ==============
[22:12:59] [PASSED] detect_irm_is_1394_1995_only_quirk
[22:12:59] [PASSED] detect_irm_ignores_bus_manager_quirk
[22:12:59] [PASSED] detect_ack_packet_with_invalid_pending_code_quirk
[22:12:59] [PASSED] detect_unstable_at_s400_quirk
[22:12:59] ========= [PASSED] test_parser_with_regular_cases ==========
[22:12:59] [PASSED] test_parser_with_overflowed_case
[22:12:59] =========== [PASSED] firewire-config-rom-parser ============
[22:12:59] ============================================================
[22:12:59] Testing complete. Ran 12 tests: passed: 12
[22:12:59] Elapsed time: 2.743s total, 0.001s configuring, 2.625s building, 0.085s running
```

Regards


Takashi Sakamoto (13):
  firewire: core: add KUnit test skeleton for config ROM parser and
    generator
  firewire: core: add test to detect irm-is-1394-1995-only quirk in
    config ROM parser
  firewire: core: add test to detect irm-ignores-bus-manager quirk in
    config ROM parser
  firewire: core: add test to detect
    ack-packet-with-invalid-pending-code quirk in config ROM parser
  firewire: core: add test to detect unstable-at-s400 quirk in config
    ROM parser
  firewire: core: add test to avoid excessive configuration ROM length
  firewire: core: add test for root directory generation in config ROM
    generator
  firewire: core: add test to generate with AV/C unit in config ROM
    generator
  firewire: core: add test to generate with IIDC unit in config ROM
    generator
  firewire: core: add test to generate with both AV/C and IIDC units in
    config ROM generator
  firewire: core: add test for invalid length in config ROM generator
  firewire: core: add invalid block test for config ROM generator
  firewire: core: add test for beyond-boundary case in config ROM
    generator

 drivers/firewire/.kunitconfig                |   1 +
 drivers/firewire/Kconfig                     |  16 +
 drivers/firewire/config-rom-generator-test.c | 407 +++++++++++++++++++
 drivers/firewire/config-rom-parser-test.c    | 355 ++++++++++++++++
 drivers/firewire/core-card.c                 |   4 +
 drivers/firewire/core-device.c               |   4 +
 drivers/firewire/core-transaction.c          |   4 +
 7 files changed, 791 insertions(+)
 create mode 100644 drivers/firewire/config-rom-generator-test.c
 create mode 100644 drivers/firewire/config-rom-parser-test.c


base-commit: 61defa04bf0578ff9f7a52a8c74a9cb5acd8fced
-- 
2.53.0

