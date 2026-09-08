Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B909152FE20
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 12:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788870546; cv=none; b=T6UprkgSEvjLJ0lWILstMgdLQOQ1/Go3hSeAwJ21CEO5btKev+3cXDl01TKfSqZ+va96JTeudzGzexjWeBTYcLaJoDtqC3eX5ZLf9cWpcBcA+sIKJDixA+5me+uRzFQxm2VpMV0X+kCZHwWvIB+dVdEn5ev0nrwPezBYCS+NDns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788870546; c=relaxed/simple;
	bh=L1670q2oOOC3xcLVanfXAD88ysuBv3EQx7TxdfVJWyA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TiwWreFEolcMsk5zS1L7tJQkUK6YjFjEQF9bgb5dh+tR5M/01chU1hV9Wj0PLIXCqlA2a1wXIAr+b8SEkw8k7VPQd5F8AtCD4Sn21hqta31U7Fw4mQJlr6Azjefffw9Do/PE7jUIfn0Wdefh+m7RZ8AgMg9cgKZyyRMjU5L2rNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=eOvN/vwl; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=S4AOdR0n; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="eOvN/vwl";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="S4AOdR0n"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D326814000E5;
	Tue,  8 Sep 2026 08:29:03 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 08 Sep 2026 08:29:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1788870543; x=1788956943; bh=Hwf1HBDT6X
	/MSmGQ/y1EYlhKP+Y21V/n9WD9aPMhOJA=; b=eOvN/vwlIbAf6+2KmE97y710x7
	2pJaks1IFhdtCJf0dnbnDNG9lqj9nBwi1NVJsQ4j/P9edN3c6EOh1jPNE7WM9K1v
	4/QPRXfnTUAPmHqxZEjl/0YlJhQhplYUxLoRcdzj4AeUKQ5+8VQWyPbFMNub9A07
	9B4oWvs2oEw38kSEtVkqx/0A9J1yqvzIDh1pjOGxaYwhzf2zXFo/FwzW4q1bskV5
	hdz2+i+V+PvLVsOs58GDdzaUS6HB9qphp6+gTSlIcPGyCYF6b7lBP2rF7YBsGSgX
	nTuJF132qeaUwwjympN1gsddwCCG5gLPQogANfHQ+EWPax96ZBrhWy7/Gf0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1788870543; x=1788956943; bh=Hwf1HBDT6X/MSmGQ/y1EYlhKP+Y21V/n9WD
	9aPMhOJA=; b=S4AOdR0ngjLzK6GpTHSq10Hj4GyNsI6/RhHoKqzQmbYGeYjfu2b
	Ve3uULXQQGCXRGTcbjYBGeOKnG662Ap5voa2mPefTNFG+HlaBOQ89SdKOxDz55uT
	iEden3gmLPy4VVmmx5M15gAHoW1lGCSr2esu83LGBX/VQjdbZuTjtqyk0qWuUvBO
	36no3uJwnwsqoVDX0Lqti79CmoSZ7qDmHct9POokotpnvzQKQL2yMGwMHREXdGGQ
	K+ZOMA7KzM1LSqxA3E1CPdOYWi234z5ITQe/dL9giG2043dxrAq/Gte9SkZt+zyL
	LIeIm+gq4yVn0QY2cadRDn/CWNSNzMu6Y9g==
X-ME-Sender: <xms:j_-fakfDY7IMxvaeE4S2WVx9fOsKxty2n75IShd_UDJmrOVA9Zv-Qw>
    <xme:j_-fat9yKhb36BeFElVmTK2Je5sNoeWJDq4jJt_4lRy38y1O3SbY8MrPje60-pEp5
    VLKUUii3GhxPOFcAuv9BDT1cqQ_HHXrPMw9NJYqXGEZXrpZknqkXR3K>
X-ME-Received: <xmr:j_-faom-PEW1F-X7sXZ5g11Jw0oMGwVmJRdahsfgWrvMJEt5i0NIOLr_18yDtyHXdaV5kJseU9UTjp54XiEc13LPuhGGA1aQh7M9oOxjyqeQzA>
X-ME-Proxy-Cause: dmFkZTFeSBAifWetgUpN/1jD6wPAT0lM3nmrqmNiMg0WRs/0UUbmxpnmUV3+X/EUvyOkmj
    p8bDGjEMi+y4djt+auw8nTpAEHBXo6/VZHMeXC/KnFtAVw3WOpZoQrOvacpl2F0OXh+1O0
    PfxgYW2K3oElrO3m66mYinLpXnWn8l/VZpN2zvR6tIewTFTIDx+VBfaMwvBPznR/NRBIei
    AFebEn6Yfv34RC702kyMAcwrkwNq2N7fOxjysbEOw/1+VR8KuN/Bj57NkVevFDJGIJGitq
    yh5UMw2vDcFFOlbBJeTb0KZFmygAVVOLfpXtm8xApm1fGR9sEV/InL/fzP8e81GvJP+NtC
    4bSqrNJNTSsW+JqseTj6wwnotjQSkTT294RhnHb5KVhSxpuSmphUuYNrMoorNc1OV1ziHW
    182sMcp+MWG3ftoPAOXmSclycfcXPalH9jtDW41E1XZQ8XuEQ5DmUmhP8t6aAZSCXk8HFK
    hYsHjo29YPWsdhfCFHGWxZP6skecNCBzvOTukMjh7NU9LgzlekMA6814q5lMkyoN3AlWqs
    TwIsA1LG5okxzIwLE+WhYS9VJrJT+0jEdY1cUueUnUgmaNxjn0mgzeTYgNnCw/9nGgPo28
    tRwOtpsPms2m+M4YNJl3Q17TIRd/H1mL/6m5JMmzXQGcAHIsjEy9oqC32HQw
X-ME-Proxy: <xmx:j_-fan-36Yw3JxOgmwcBCC_PkzvwnxCCxgBErGt_FLMl_5DO4TNyWw>
    <xmx:j_-faulERrNRu8KbtSbpV26hX_tcNEIksWr_iNpXSpm2K6BRzDlkhA>
    <xmx:j_-fas1tz25rh-jE6Tng0y3yKkYgJ9aiIP3DQh1l4aCM4A2QXZ15aQ>
    <xmx:j_-fahr83fc0TCfkvJrI3r7PLPU-QwGl66d0C_h9hYpqDWCK_9Gveg>
    <xmx:j_-faj2EP_xHtTK6_OcJv6ugReotuVRMo0cT3pAV7aG1LOHIjxSdvJm4>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Sep 2026 08:29:02 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] firewire: core: fix type of hard-coded image in config ROM generator test
Date: Tue,  8 Sep 2026 21:29:00 +0900
Message-ID: <20260908122900.2886661-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The type of the hard-coded configuration ROM image should be __be32
instead of u32.

Fixes: ee9a8c9afb57 ("firewire: core: add test for root directory generation in config ROM generator")
Fixes: 996096154e7b ("firewire: core: add test to generate with AV/C unit in config ROM generator")
Fixes: 7bd19bbed9ea ("firewire: core: add test to generate with IIDC unit in config ROM generator")
Fixes: c3b64c7d752c ("firewire: core: add test to generate with both AV/C and IIDC units in config ROM generator")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202609060630.rC0Zz88P-lkp@intel.com/
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202609061023.GbWS6Skb-lkp@intel.com/
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/config-rom-generator-test.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/firewire/config-rom-generator-test.c b/drivers/firewire/config-rom-generator-test.c
index 212dbdcd43ba..dd2e71213209 100644
--- a/drivers/firewire/config-rom-generator-test.c
+++ b/drivers/firewire/config-rom-generator-test.c
@@ -9,7 +9,7 @@
 #include <kunit/test.h>
 #include <kunit/device.h>
 
-static const u32 config_rom_bare[] = {
+static const __be32 config_rom_bare[] = {
 	cpu_to_be32(0x0404921b), // bus info
 	cpu_to_be32(0x31333934), // |
 	cpu_to_be32(0xf000b223), // |
@@ -52,7 +52,7 @@ static const u32 avc_unit_directory_and_leaf[] = {
 	0x50756900,	// Pui is the name of a cat that the author takes care of.
 };
 
-static const u32 config_rom_with_avc_unit[] = {
+static const __be32 config_rom_with_avc_unit[] = {
 	cpu_to_be32(0x0404c1e5), // bus info
 	cpu_to_be32(0x31333934), // |
 	cpu_to_be32(0xf000b233), // |
@@ -116,7 +116,7 @@ static const u32 iidc_unit_directories_and_leafs[] = {
 	0x20436174,
 };
 
-static const u32 config_rom_with_iidc_unit[] = {
+static const __be32 config_rom_with_iidc_unit[] = {
 	cpu_to_be32(0x04046a3e), // bus info
 	cpu_to_be32(0x31333934), // |
 	cpu_to_be32(0xf000b243), // |
@@ -162,7 +162,7 @@ static const u32 config_rom_with_iidc_unit[] = {
 	cpu_to_be32(0x20436174), // v
 };
 
-static const u32 config_rom_with_avc_and_iidc_units[] = {
+static const __be32 config_rom_with_avc_and_iidc_units[] = {
 	cpu_to_be32(0x040439c0), // bus info
 	cpu_to_be32(0x31333934), // |
 	cpu_to_be32(0xf000b253), // |
-- 
2.53.0

