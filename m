Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792844074;
	b=V5BTcMPUaDb2odjw04qc4yMZATLju5ncchXMtbl42h9Q2UFrtrUob9lbr0LPQFobsEyP
	 Ny4YYOPmF3s8iXRVyxK6BjnDGxhAlBgUF2zoMdo4Bn19Wpjjy1x6FkY9poqdvhhdPgXMJ
	 A/z+/DSXybfRE/CX6BvxLNvjiRS0kPmh5+LpPj3vOd4OksFj1aG+9EQGWs5QMZdgfJozY
	 xu8YwKVrQakWap0FFcTEU9O1JUGJkN4vlsrax/DXg5ak/ExV+a0qZ/bgk5WFOLivddttt
	 /dWpWjNJOn/suhNqwQg4Rh8fDvVWtVV2Rnj7fec1TAUEyQ/PGY7Nqm2WRcHV8XRwVjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792844074;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=clDe5T+lnMcAu2QCaqAIBM25j1mGGUWhHQ0Gl7zGb7U=;
	b=5HSXJgj4cF6qfIL3GrAGxFkgRGv/qD2rK4eVsHZv2vWFPDvMXs4lIn2voBYPP4xNyXFs
	 1LyagMjD3l59aJX8kpAcgNHH52sToaDDJBE/5eRQ0tqnjdrHKQvdTyzOnu4sTQSq4c2gR
	 kFq0H5+jlB81HSTffs4vfVTLSg8voZ2NsG6fILdnoHNNXpJaMUAuZSliiaBp+6ECkIfSy
	 iB0ZX978VTWpG/duuwJ85KDEad2O+qRzukOJiDWYC5ET6k25ttFr/CRSpfrpGBCIH8q9t
	 TyzWNdqrEn/SpsXY+H/9SVhJNdNHB5d0j61BRBewPWxGz4+7O5b09i1bNyXHoVMp/mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VHbg+laW;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6365C606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 12:14:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6365C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VHbg+laW
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48c4649b35bso1734070f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 05:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792844073; x=1793448873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=clDe5T+lnMcAu2QCaqAIBM25j1mGGUWhHQ0Gl7zGb7U=;
        b=VHbg+laWae7qdWoRf9x+wBMuztkCQdnqfHfp9mIJJakuDJT0KiB47aAXP9L60qQ2D0
         /B6V+lzJTNRZeVjuvIX8wEFuNqICUVNkujBINShcuRBIC8fRfYc+PXLlXBdmqZNi8bJ8
         ed0384CPR43IAMXCjdmAUZqrEDyA8mnPjE+n4SIZ1iufwBuTEAoSksHD0g1U+VGZWXF7
         SEgQE8v+1z1085t4eka2p7bD1myIBzVlMhuAiHPwUtNYghIiCY8+dmrUmE2+ZugB1a0c
         yAIRZ0fZfuO/jYOoOG+t7GFwecNBaIzBH1PsORaHHZqokjp36tF91UJVF+BAr3HWHj5z
         i3NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792844073; x=1793448873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=clDe5T+lnMcAu2QCaqAIBM25j1mGGUWhHQ0Gl7zGb7U=;
        b=iR1gi1noPM/GeTTvoGl7LqCWLBrRLylIcxidFQj1WcE58kHlk2+mIuD7if3maiGnJ9
         WC+Y6Ab63vv9AB5VA2Y7tSXHgcBAEAligotZkq9CBozJatMsIxgmuFYZ1VsYgguj41L2
         oe3fyJNYo6WzaO3REmW9zkPm/utb1eYGn3gxqkhKQTU/gCwfbRAR+M0Q78CRW1iv9eRn
         UkPc1v6d1g1UBmFZCeUZjFWzd2QTfVmpy1+i4vdXSP8D93zftFeHmoDfIZJBHv9V9uLj
         Asy4tRotJwfOU9EOKxejPZnoDH36wT00jqE8pGVasuxid4WnJzpx2v5WDVI57lgqDnyq
         aHVw==
X-Forwarded-Encrypted: i=1; AKwUvBxRCeaEbzh+QqlI31mSPAgEYoQPRZLRMy4lH7KPtZSdfsmo7d+2C/b4WcCEMEl6OYG59+/oVVe0i5FqOf8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLuI/DOJkO/5MSl11U8sJEynLvMM4cb2TE+FnHE8LA0x+SO91qc
	+WCCojurJnsfazVUL45mv2JZKQCqLG+i2bR6dSprfTrqRBO1jFxaawtp
X-Gm-Gg: AYBFou2kJwV1bjtzf+wnXeLvEHeQr+KJR/myL0vPk9krx70x3PNSYwNfwfrDHeZVn4u
	vzhoQ9RU70ZTtSGqKrjI4BuE2Y0JyUduvZehLoLr+BfykQA4xf0R1nyXSNPC1eBxgnuaVZs/4zS
	ze/v1Bnl3ysKfUsXft9aib0nX/7X/xz3syICIhqLfxpUoBJpwjMEyXTTz9FZPbf4xJSDS/a0n1j
	bpdatvMFbcoZzVLfWkZaKhpUmnC2EBTTvKAzxmTEDPM/fT3M4GxAv9648cVpDfxvd8cx1fvY5c6
	9HQR3PYCLzgZlk440zgxdPT+QrqHOkod7UvXoAmiTdGNgL/htm2mEFS9Rx7+n92leMgx1h8qd1+
	B9IKwaWyZzH8Yk/NIiY7MzRqIvPxKcVCfqmRc2qjrGbYEgyBnRgsPi4O57M8D4SXChCqPWgF8Bn
	BPu7R1P6UYqS5q0P3fUmCJQ7bhuEI88uXqlC038TxrzBjOooPblYg0r/Fq7ZgH3KIC7/4O+LIUU
	9fXvSk5kuFSmLnBinw+p8rDezkMH75NZnqz9lxWn7+BnNwP3Lcuaecr
X-Received: by 2002:a05:6000:2411:b0:48d:fbf2:555f with SMTP id ffacd0b85a97d-48e3eb8d497mr2806535f8f.55.1792844072587;
        Sat, 24 Oct 2026 05:14:32 -0700 (PDT)
Received: from NB-6746.. ([178.66.130.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ece5e4asm3860411f8f.59.2026.10.24.05.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 05:14:32 -0700 (PDT)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: tzungbi@kernel.org,
	linux@roeck-us.net,
	p.zabel@pengutronix.de,
	Sergey.Semin@baikalelectronics.ru,
	mika.westerberg@linux.intel.com,
	andi.shyti@kernel.org,
	iav@iav.lv
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	wim@linux-watchdog.org,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] watchdog: dw_wdt: fix reset line management
Date: Sat, 24 Oct 2026 15:14:22 +0300
Message-ID: <20261024121428.18862-1-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <y>
References: <y>
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

Hello,

This is v3 of the series fixing reset line management in the dw_wdt
driver.

Testing:

$ ls /dev/watchdog*
/dev/watchdog   /dev/watchdog1  /dev/watchdog3
/dev/watchdog0  /dev/watchdog2

$ ls /sys/class/watchdog/
watchdog0  watchdog1  watchdog2  watchdog3

$ chmod +x watchdog-test
$ ./watchdog-test -f /dev/watchdog0 -i -s
watchdog_info:
 identity:              Synopsys DesignWare Watchdog
 firmware_version:      0
Support/Status: Set timeout (in seconds)
Support/Status: Supports magic close char
Support/Status: Pretimeout (in seconds), get/set
Support/Status: Keep alive ping reply
Support/Status: Keep alive ping reply

$ echo mem > /sys/power/state
...
...
[ 1560.147058] PM: suspend exit
[ 1560.371470] usb 1-1: new high-speed USB device number 3 using xhci-hcd
[ 1561.031825] cdc_ncm 1-1:2.0: MAC-Address: a4:2a:95:e8:fc:e4
[ 1561.037736] cdc_ncm 1-1:2.0: setting rx_max = 16384
[ 1561.054408] cdc_ncm 1-1:2.0: setting tx_max = 16384
[ 1561.084713] cdc_ncm 1-1:2.0 eth0: register 'cdc_ncm' at usb-xhci-hcd.2.auto-1, CDC NCM (NO ZLP), a4:2a:95:e8:fc:e4

$ ./watchdog-test -f /dev/watchdog0 -i -s
watchdog_info:
 identity:              Synopsys DesignWare Watchdog
 firmware_version:      0
Support/Status: Set timeout (in seconds)
Support/Status: Supports magic close char
Support/Status: Pretimeout (in seconds), get/set
Support/Status: Keep alive ping reply
Support/Status: Keep alive ping reply

$ ls /dev/watchdog*
/dev/watchdog   /dev/watchdog1  /dev/watchdog3
/dev/watchdog0  /dev/watchdog2

$ echo 1 > /dev/watchdog0
$ cat /sys/kernel/debug/1e012000.wdt/registers | grep ccvr
ccvr = 0x09a7baab
$ cat /sys/kernel/debug/1e012000.wdt/registers | grep ccvr
ccvr = 0x0599dce0
$ cat /sys/kernel/debug/1e012000.wdt/registers | grep ccvr
ccvr = 0x01926467
$ [  110.392536] watchdog0: pretimeout event

Thank you.

--
Best regards,
Artem

ChangeLog:
  v1:
    * https://lore.kernel.org/all/20260320135624.223863-1-a.shimko.dev@gmail.com/T/#t
  v2:
    * Reduced from 5 patches to 3: manual reset handling is replaced by
      the devm _deasserted variant from the start, so the intermediate
      states that could leak the deasserted reset line are gone and every
      commit is self-contained.
    * https://lore.kernel.org/all/20261022134354.534642-1-a.shimko.dev@gmail.com/T/#t
  v3:
    * Squashed the last two commits.
    * Add error check for reset_control_assert() in dw_wdt_suspend()

Artem Shimko (2):
  watchdog: dw_wdt: use
    devm_reset_control_get_optional_shared_deasserted
  watchdog: dw_wdt: manage reset line during system suspend/resume

 drivers/watchdog/dw_wdt.c | 40 +++++++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 16 deletions(-)

-- 
2.43.0

