Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793932126;
	b=KVn5gEd24WMYlRkG/ZrKqLVIwoUBD6eO+aHFaAckqmNm1rscSO3ZqOuYIXWGzXcLXEGP
	 JXYJC5f5JdVcbIxK5dLtcFcFEB8xQm+LK2QO5JHdYF8Fc132r48p4PnckgRjuIe0fiD0k
	 WBLENlfxWPXCcYCWEc02Fyr1lESUvjm7CsR8uglNjhHntl8kqKnEvNAQzAzHUbLriwTSc
	 OXmw+wymsuo0ENNSNnS5762ppy/Xy+PS+Yjj6/KLn3GfX+uj7bVtugyZCUcbnYFjkXPCB
	 ZFLq3FvgQ9W5f1au+4knO5wKKFGtZ5snryEj1p+e2ce1OsdlbLALUgE5MDDBjVcRtRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793932126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mVFhMdPaOpZaZhoFk4x/27qwSHFs/IDKrnB1S7WQ5Wo=;
	b=ebubImaaM5BE4cp/2c8B9USGj4sIV28Je3FijTeQIi5jooZMS+8GVJWtCrqNal1WHC7i
	 ptA33uNrgEe94909QKZC0A2YwtYdYV+Hllhh9loLYIOE4/mY9rqf9m8aeO7A8ziT043G/
	 bz6wwdOrHJCKz1QM4aX8o/BEICkIO109rBMG5n06+c5n0sn1VgA0y2dghZovsfcVlW+aA
	 eJIv3K4O6niUYrWRqMrmHP5ycTiYiXoCdGNkO9LDauTVP6YG6rpCYcn9Ddz53G3YjwOII
	 UQe/B8VNSZGpyvU+y5MJ1qBNNCvMy/lMFfjqZF8Io//w9tkNi33iYBE0w98qsa5L/BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V4uaPxWj;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF80606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 02:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFF80606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V4uaPxWj
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so279845eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 18:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793932125; x=1794536925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mVFhMdPaOpZaZhoFk4x/27qwSHFs/IDKrnB1S7WQ5Wo=;
        b=V4uaPxWjkVoous4zrIsNkoyKhInuO7jZxNmIUliG6mOWkHMnHdRmXNxB/t6yC843BU
         FIBulfB70A6G++DwfHF+3dAkfdszEW60CSWhgm/hHygI8CgdbQdLTpj5QJ8y2WQWAOpF
         OUiytJMUSD+8SffcvsGK3MeV6Shjslmxa0v5Z0Um3cH+EncLu/YQNPKaf3h4sgIVkgqW
         LUXfFkvrmVMropFNSDHAHkSjaGUv6XHqvhRsyRD9SOjdjgqyMJxpWIIo1jV4Y2n0NlTM
         cYbagB4SkDHdGqBxqbj8/20WZQ8tzitgAojQZHDSaw5CYkMHSL+VU42l68aAPZITxrIv
         4ufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793932125; x=1794536925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mVFhMdPaOpZaZhoFk4x/27qwSHFs/IDKrnB1S7WQ5Wo=;
        b=vvOpAyNpnN/oj0V4bwht2gqZruJaXxP0GeYRMAEGrC3gE20BmP9HV1jdIosnUnuOoG
         PlMuFcjnDqqB8XicKzMSSphcXNbXp+rM7jgc3J2rzNw55lmodB9AmD7Pmymg6kKlek9V
         HDFY8rehnUYORBEv1RGksrLaXIJAnCkanc7EPvBelm4tbonu4DjfU/1NkwUtCRSAUyfR
         ia6QWTQ/2b81/Gu6w7GYIsIb4faCEmYaoFeKWzfmpEKXxtTeStu2BQfVZ42coX9ijdD6
         d4FV20f91YM+/lcmNyKoiVc0kXBSkTVRMtX6wDYJf9C+cXHtirrFf9K8PXpZL0uxOdVi
         RwXQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2c0OBMY5UKQDBZPMtckyq8hYzhJmgzxE+GOsojFfxU1wnVqJp284yHOFO+AHX7HWPUD8B36RJD5JQPrk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mg3AfLVIz3gl/TATt8ObFRitymKCEjiM8ccY7Z21ISAznl22o
	o7atDU4ihGON6lVFCpladQPEk79g7IzKLd5TAlL93zwANU+tk/ezU6mZJDcmTw==
X-Gm-Gg: AYBFou1AP6yCuX1A+fHxGz+O39RuAdx5DIJuz8MvsCsZ4v9Lnu2ajR06IAVz4KIkZR2
	ZVGAn1aUWo/9njl7M+aP3bX6Ju3QZSkJYsGKBTOd5DD+8c7cfY/MQOyobeb1826lwbuGt9Ko1uW
	NjcyJGYsAjmyJ4Wp0evqomyjOjH0cmW6qrlEDjfdhXD7Q3frVohyAACABcEv0lab1hu+h3y+mzb
	6nLpXwUGPGJ2Jk8Y5LA7+tJed0J62Bpd8YaY/zAtaKU58ZlQXPoLyx10Nbww3zvP5q0Xnv2eLpw
	w37AcGlAPeYiXF6nZwyraC1oQbpScBqUw/01XsoByzn8iFNL4skZ2KnOQNbC0z5FlVZ36bIVJSc
	LhbBMPwawjWEqF+IKVIMG4PzZrFFidR+Z9apuKXWCSlnoHrA0vV6FXavKUKPuPguDc3WlOGXtSr
	MeX76VPrtXmOdWzNrfx+/n13l+ZULtOF/F2qhbBLjnWQVn99/zpENv4X7B7JHcpOj9npKEedD77
	O9doqAMTx1vxD1JVmHke6uCF4F5G4WvjgTfoUmuDpSk/tmbj5vwNoLMN/Fp4QDa8S022X4QqGRl
	B4DIOYFsyngorMCbBnUEuTl9O0ct+tTKVD67GmcrPaXsgQ==
X-Received: by 2002:a05:7301:929:b0:369:ef63:ea95 with SMTP id 5a478bee46e88-36f76814c3bmr1285854eec.6.1793932124917;
        Thu, 05 Nov 2026 18:28:44 -0800 (PST)
Received: from debian.prasanth ([103.183.205.43])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8e3a47esm1697186eec.6.2026.11.05.18.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 18:28:44 -0800 (PST)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: linusw@kernel.org
Cc: andrew@codeconstruct.com.au,
	joel@jms.id.au,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	brgl@kernel.org,
	tan.siewert@9elements.com,
	linux-aspeed@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v4 0/2] Aspeed GPIOP handover with managed controller lifetime
Date: Fri,  6 Nov 2026 07:58:33 +0530
Message-ID: <20261106022835.10709-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105152348.8567-1-prasanth.padarthi10@gmail.com>
References: <20261105152348.8567-1-prasanth.padarthi10@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series continues the AST2600 global-to-local GPIOP passthrough
handover work, rebased on v7.4-rc1. It adds a shared pinctrl lifetime
fix before the G6 handover change.

The registration lifetime issue was identified by automated review:
the G6 callback data is devm-allocated, while the shared helper used
unmanaged pinctrl registration. Patch 1 switches registration to
devm_pinctrl_register(), ensuring unregister runs before earlier
devres allocations are freed. Patch 2 retains the v3 handover logic.

Changes since v3:
- Add managed registration as a separate prerequisite patch.
- Keep the handover implementation unchanged.
- Add KASAN lifecycle testing in QEMU and on B650D4U hardware.
- Update validation statements to distinguish lifecycle and power tests.

Validation:
- Shared helper and G4/G5/G6 objects compile-tested with W=1 on ARM.
- G7 SOC0 object compile-tested using ARM COMPILE_TEST; this was not
  an ARM64 build or G7 runtime test.
- Generic KASAN boot and one unbind/rebind cycle passed in AST2600
  QEMU and on physical B650D4U hardware. Controller entries disappeared
  on unbind and returned on rebind; a subsequent debugfs pins read
  succeeded. No KASAN reports were observed in the captured tests.
- The final v4 source tree matches the tested v3 tree plus the
  managed-registration change; only commit order and messages differ.
- Earlier remote power-on/off and physical-button power-on testing
  used an OpenBMC 6.18.24-based kernel, not this v7.4-rc1 test kernel.

The unfixed runtime comparison has not been performed. Concurrent
readers, probe-failure injection, mixed-pair forwarding, protected
writes and SCU510[28] hardware handling remain unvalidated. Existing
questions about probe-time normalization policy and concurrent SCU
writers also remain open. Electrical measurements are outside the
scope of this lifecycle test.

Supplementary procedure, exact source/config and logs:
https://github.com/prasanthp20/asrock-b650d4u-bmc-support/tree/64eaccfde9ac4ec35646c0b7a8663486775b5d3b/docs/experiments/03-pinctrl-lifecycle-kasan

Previous version:
https://lore.kernel.org/r/20261105152348.8567-1-prasanth.padarthi10@gmail.com

Please review the shared lifetime fix and the GPIOP handover policy.


Prasanth Kumar Padarthi (2):
  pinctrl: aspeed: Use managed pinctrl registration
  pinctrl: aspeed: Hand over global GPIOP passthrough to local mux
    controls

 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 145 ++++++++++++++++++++-
 drivers/pinctrl/aspeed/pinctrl-aspeed.c    |   3 +-
 2 files changed, 143 insertions(+), 5 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.47.3

