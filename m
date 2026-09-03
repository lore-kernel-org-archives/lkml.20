Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A3DC2EA
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 00:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788393693; cv=none; b=c/9iQdt7CTt3Lw97jrgRaloDkUT28Km0mL9Ex8ZEcLVvUxTM/Ly91lvb7w+AqlhH9b0st4KztoQyNPG2a1fSaaCkuzbrkIhoaO92FSfpaxIV3oXbRH881tdtv6jdweShzsv/9lSp1HcgMhJ1LwNqBwrGDEtykDXZdOnjzYj0aV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788393693; c=relaxed/simple;
	bh=XP0HeXifUNJRzpYA8gzuFUGxfUGI1rEIawS5sr2ZRsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MKqm9mypH6TTFs2um6H7cunrvDXUQQI4txdYDzMg3JE3hKHHm6JOG/hc1HJBoErbHzVmMToVC9/gTArwrkqlVmMC6e2Chb+Exg38XNXG8WiSuU3nxYMkZ6KKxN5ctdOd6L0OOzb0GgMdOY7Gxde/nCTd3K/kGbwj1/xkbjmSAp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=bNJtai2I; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DtWdcdb/; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="bNJtai2I";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DtWdcdb/"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 486AF7A0039;
	Wed,  2 Sep 2026 20:01:30 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Wed, 02 Sep 2026 20:01:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1788393690; x=
	1788480090; bh=MbH55p3IzuXhSHGf5fFH3ilSgJIars9xy0x+NV3hOg0=; b=b
	NJtai2IQdgEgXsOfVBS26EyqVElUKvD0fVdbQuRkeprMgT4nU2ogWj49/nd90q7Y
	50JXp7ll03JWBu3kCi8CtxqA8rzEKSJAJ2/LWVlb5zGGBl7b/ruWsqO4D2yjHNNm
	XCMGQYroxdPvaA4xJn4iaeqxdCoMgeH/Zi53ucbg7Mpj1yUlTJqNV3hIA1jO78lM
	9oCLwHSHeMfhxc0jrTeDilphto/coOvDMcE6DrNIn7eMYreiF/0CnDHAkbv9h7nT
	uc23+FGPYW/AzMgpM1QD0feMscfAdlchy7aTBJIQn2/ycPMlIzL9Je32yGUC5ZJt
	EjTvD8fozyrVU4KTGhW5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1788393690; x=1788480090; bh=MbH55p3IzuXhSHGf5fFH3ilSgJIars9xy0x
	+NV3hOg0=; b=DtWdcdb/P+X/Qwb7LCYP+yxkoO1NRntIQsT3h7hmRWtnzjRe25o
	PqK4FrEZWtSu3I3AW6q/r7tNoFFb+ftLojTBUlR3kojNG2wDViiOBXFysWrTBF/B
	6KLULhh7OG869rtdiDyG7whvriZv07/Ah0oN0bMk1SePebOzTc8gfVx6nsounIMS
	btiEVHbUZLg7HN9qYUeRFkCUT3WWbQZLOY0swwEu3M+fidLFUlMANLASH2RZlqiI
	RSEzT7xD0ZCVLykVFVDTCt9uw7aDLdP+kozWyHopnJEEN4JGIXUiO+ip30+6N2+h
	w4KNo74mIueKIcisVFuglvW+IqpQsB7F+hw==
X-ME-Sender: <xms:2riYamH_FrNOvtrl-mbK3pBeAaZgW1tpd78QHi-LpN3rre4f54Bokg>
    <xme:2riYalLwx04vUnhmZzXHaOKMy_4qOvpMhh6NgEtLCAQhmro5FeCiTXP7Em-sUsSBh
    7p9d1_HDSU5MKmgua2f276Tp4lDohFhSzlamlhz82KAHy7U2nU_M24>
X-ME-Received: <xmr:2riYaqk05IHeZPpC4nPe9EQS1nkMpeRcz7xU63lZC12YnXoyzHjN8rOzAacbKkCHYCfp-NBJUsTia1agUNa4awO-2aGyFA>
X-ME-Proxy-Cause: dmFkZTEt26+m5na1yhKs6skaQ5hkUVTTgsdsY4+1Yw5bLFs/L96IMAk6ma953qyDPLYISc
    NdUNm268Uc8pyAlw1Thq9TG0xB0MZQ9pVF3ojG0sxwmvQfZzkdKAsbnunxr7AOx7hWfPev
    /Eg5haCMQQfYlXu5CJ23PhzOcQKKA9XLjlw1fwJj3Ol8KlvZAdSkGONxIbJ2HQ/gShzKQi
    GS6YyXMXjNVqyE044ld/M2nmC9uacGiIydCjgYXUn2cAVZuZKtHGNwlNS24xXIK53G0Rzm
    DniqJEH6hSWJLdBzTTvxxkUQItKCcXhyENpcZj8m35JR2RScyIk/l7xrtMvS7q2DhfeWPb
    IYTg348cnyZo/oEzmXzebuW5p098uqOwd1U8LaJrM2sCOuQCpO1BLwAiFzFv2EW/ZKx+Ip
    VxoMBy9+wwDMyQal0r/VsoWTfT7Kc5gs5fWNn2/o2wf+WIJ7DwW+kku3xLuT9kk8maRmZ1
    2EcQUeBNUndfLWVblxzWGrNuBIrvLBy5c3XRwxCp3sQ3ZCxfyVhg6G9suPVpLw7PZ++aV5
    Sp9tMO+f5tvhd08pVwTO2uMGfCOcyfvAdIsoBFrJR8LBtaDFnrBufWKllZ7SAFX29NnJbS
    fJ/aUXGzNqd0mSVi0I1xZOWsp0cDxasC2MbvSNKXcQEe+wDIGQXjeu9uwGjw
X-ME-Proxy: <xmx:2riYatSP3L10tIXYi1Q89VRlw6RLSsLcM0egzPgBaW_j_aA8dJzCmg>
    <xmx:2riYasLIfPfpaVPgoj8jka1kSJcCBo7ag3O_74SeR3Mhvz1LOSwbyg>
    <xmx:2riYajCthOa1lzdovwn8VLWgYQNQVocjI2iJoEPKLFRpIgDmtm3Elg>
    <xmx:2riYalBwaUVFir7HNACo8jr698k8eWXNDLEmmXcmXQTzaafuVM-tgw>
    <xmx:2riYauKiGwdTI8wQ-9m_9c833k_0on5yKAqkDa1wyNcXr8BXb2KCqOd5>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Sep 2026 20:01:28 -0400 (EDT)
Date: Thu, 3 Sep 2026 09:01:26 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: sreekuttan2156239@gmail.com, mistermidi@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/13] firewire: core: add KUnit tests for config ROM
 parser and generator
Message-ID: <20260903000126.GC2393579@sakamocchi.jp>
Mail-Followup-To: linux1394-devel@lists.sourceforge.net,
	sreekuttan2156239@gmail.com, mistermidi@gmail.com,
	linux-kernel@vger.kernel.org
References: <20260901134534.2386577-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901134534.2386577-1-o-takashi@sakamocchi.jp>

Hi,

On Tue, Sep 01, 2026 at 10:45:21PM +0900, Takashi Sakamoto wrote:
> Hi,
> 
> (Resent because the previous email was sent to the wrong address...)
> 
> This series adds KUnit tests for the configuration ROM parser and
> generator in the core function.
> 
> The parser tests cover existing device quirks and malformed configuration
> ROMs, including out-of-bounds directory/leaf entries.
> 
> The generator tests cover AV/C and IIDC devices layouts, combinations of
> units, and invalid or oversized extension data.
> 
> The tests are intended to document existing behavior and provide regression
> coverage for the parser and generator.
> 
> The test execution samples:
> 
> ```
> $ python3 tools/testing/kunit/kunit.py run \
>   --kunitconfig=drivers/firewire/ \
>   'firewire-config-rom-*'
> [22:12:56] Configuring KUnit Kernel ...
> [22:12:56] Building KUnit Kernel ...
> Populating config with:
> $ make ARCH=um O=.kunit olddefconfig
> Building with:
> $ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=16
> [22:12:59] Starting KUnit Kernel (1/1)...
> [22:12:59] ============================================================
> Running tests with:
> $ .kunit/linux 'kunit.filter_glob=firewire-config-rom-*' kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
> [22:12:59] ======== firewire-config-rom-generator (4 subtests) ========
> [22:12:59] ================ test_config_rom_generator  ================
> [22:12:59] [PASSED] bare
> [22:12:59] [PASSED] with_avc_unit
> [22:12:59] [PASSED] with_iidc_unit
> [22:12:59] [PASSED] with_avc_and_iidc_unit
> [22:12:59] ============ [PASSED] test_config_rom_generator ============
> [22:12:59] [PASSED] add_descriptor_with_invalid_length
> [22:12:59] [PASSED] add_descriptor_with_invalid_data
> [22:12:59] [PASSED] add_descriptor_beyond_upper_limit
> [22:12:59] ========== [PASSED] firewire-config-rom-generator ==========
> [22:12:59] ========= firewire-config-rom-parser (2 subtests) ==========
> [22:12:59] ============= test_parser_with_regular_cases  ==============
> [22:12:59] [PASSED] detect_irm_is_1394_1995_only_quirk
> [22:12:59] [PASSED] detect_irm_ignores_bus_manager_quirk
> [22:12:59] [PASSED] detect_ack_packet_with_invalid_pending_code_quirk
> [22:12:59] [PASSED] detect_unstable_at_s400_quirk
> [22:12:59] ========= [PASSED] test_parser_with_regular_cases ==========
> [22:12:59] [PASSED] test_parser_with_overflowed_case
> [22:12:59] =========== [PASSED] firewire-config-rom-parser ============
> [22:12:59] ============================================================
> [22:12:59] Testing complete. Ran 12 tests: passed: 12
> [22:12:59] Elapsed time: 2.743s total, 0.001s configuring, 2.625s building, 0.085s running
> ```
> 
> Regards
> 
> 
> Takashi Sakamoto (13):
>   firewire: core: add KUnit test skeleton for config ROM parser and
>     generator
>   firewire: core: add test to detect irm-is-1394-1995-only quirk in
>     config ROM parser
>   firewire: core: add test to detect irm-ignores-bus-manager quirk in
>     config ROM parser
>   firewire: core: add test to detect
>     ack-packet-with-invalid-pending-code quirk in config ROM parser
>   firewire: core: add test to detect unstable-at-s400 quirk in config
>     ROM parser
>   firewire: core: add test to avoid excessive configuration ROM length
>   firewire: core: add test for root directory generation in config ROM
>     generator
>   firewire: core: add test to generate with AV/C unit in config ROM
>     generator
>   firewire: core: add test to generate with IIDC unit in config ROM
>     generator
>   firewire: core: add test to generate with both AV/C and IIDC units in
>     config ROM generator
>   firewire: core: add test for invalid length in config ROM generator
>   firewire: core: add invalid block test for config ROM generator
>   firewire: core: add test for beyond-boundary case in config ROM
>     generator
> 
>  drivers/firewire/.kunitconfig                |   1 +
>  drivers/firewire/Kconfig                     |  16 +
>  drivers/firewire/config-rom-generator-test.c | 407 +++++++++++++++++++
>  drivers/firewire/config-rom-parser-test.c    | 355 ++++++++++++++++
>  drivers/firewire/core-card.c                 |   4 +
>  drivers/firewire/core-device.c               |   4 +
>  drivers/firewire/core-transaction.c          |   4 +
>  7 files changed, 791 insertions(+)
>  create mode 100644 drivers/firewire/config-rom-generator-test.c
>  create mode 100644 drivers/firewire/config-rom-parser-test.c

Applied to for-next branch.


Regards

Takashi Sakamoto
