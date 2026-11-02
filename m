Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793653656;
	b=C0cpub3kf8BM28/mNgcePEE7VtIC+qb/szZMhFww8UpE47ZR8GehoTMph6AfOW+fnyks
	 zi9qKw2GmTN6HDhcfJE3rtIX2aCyoSLM+mPXZnCVRfy831xoCvp4pz6emb9owdjRX1TuB
	 bZ5wbs5tpdXJpJOjlO/M+7HK1xHCkrLTdC1XN8TO1VK6LsweGfKD0ulbXCDks/X6lvo9r
	 pV9IrFADe+FWDwOQFK20zOV0fUBLfnn0s4Y0L+upRRVcKD2D17cdAhs0XfUTIlWMPmwx0
	 NM/Ll9ZMKNJxJWdKuidVrkx3wEnCU9JMWURjN/jl1/XIGe8ixj9hGqB9Zai8RJm3Fqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793653656;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=b2vLF9RcVkN6cfLMLh4ULuVTknCF3Xevt20oONWX7/g=;
	b=Fpr56nh5Flb3KO2i3Y7Ureu+kY264ImR3Rvwo2L0qiZy201l5QdN2ZmjqTnWupehqQca
	 tuLqQ4cyA4hKPvXlv/K4mN7zgo2LbfzYvF8hnC/hM3eGw6QaKM3KEEBzxTFR+QP5XbMBS
	 IkXYIY3XcipZArjJbNTE82W4/qcGsH6lQQpFBeGtgJFh4VeUKuvnUaggY7o+itBOAKFL2
	 dk3GSUi0ArRdvz+HGhurtDFLk+XOPin0qGcwQYPi8PO5+cBks1pPa3t5eqheomDOysKSi
	 oJNOSvrSJ1fdhIodzxJIpoVkTeGDlrUa7k5c37nLuxsbSdMuP0QUsXTTld7aeV6F/gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=J95iuE1e;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A383E606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 21:07:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A383E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=J95iuE1e
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso3105256f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 13:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793653653; x=1794258453; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=b2vLF9RcVkN6cfLMLh4ULuVTknCF3Xevt20oONWX7/g=;
        b=J95iuE1emN4u67AhxNrJ+MCVmsKuzIrXYeEv3Wa877KjUoe+996S3nBs9dUqHMaPfB
         KTBLowvPiSgDYDMUWynCYxaslvP4szcoaYDTCUoV33GMZ29iarRkkFWpAQC46fARh5jE
         0F+FVIPzGfQqP9qWmFI/ZdSNsoAQF1NQGg37Mtcm7gAdEsRyT5BrQXnk869p44jQCrPc
         5G66BLQu/WZZd9rCyf8iHVfTE1WW8S+5nVVCbwoWfp4wjBnnB4S+JphXe4q4V9+LE6dm
         fsx2XGECKokho+XUwB8g3vphxpgCF3l+lEqcPT22fZOLW91s10TJCS3UX1LRSPwfwOFR
         5AfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793653653; x=1794258453;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=b2vLF9RcVkN6cfLMLh4ULuVTknCF3Xevt20oONWX7/g=;
        b=Tvje0mPMv946ZlBlNgf8k42CU86+fdWd7zP2zvhjhbXK/pMwyKpQddDabs1rdyIF2B
         oZJHgjNt85owSwmqWa2WTyyCfTLHFguWUYAoyx6xhNOkvWgF0KiV6dqUUUbS5q5Bjvbt
         lpl6OC9rQKq43NFiIvg2UJLg/K9MfIfjfnOvbPFgcaOsEuhxmcRxnTV3cd3wFL/dOfvr
         6gP0XTfk2qjhh0j4rcRfqygfS9h2y0XkZOjvaJ7e3qV9r81NwXodcowq8iddIubqmuKF
         jny64O9VjvcOEMJ9nw7FlC2jtZMsknEMKUPScvdOjr30xQKP+wlU8EQHFSQQkB/jxE/O
         HD4A==
X-Forwarded-Encrypted: i=1; AKwUvBwVpnQW/q/+Ako0xGuW+dZkD3PsnCEHFdaebt1sXe/XZUBBHLrkYEsoQ9qYSQV3Vhj6JxsX+ARZ8FRMqK4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HNSNnS5UF+EyYxY/8wvtrRVFOT8+BtG9Eswgb0AU5f1Jr1/p+
	GrKd3TPQrxL63l7x5T/jTOTECcW+AuIGZ1fOlbomuoi8pi0VlZL2+QNRHEHff4//fR8=
X-Gm-Gg: AYBFou0BpYPhzmNYqEl9390FMThfQwJF3tXqXIQ9ctRW6NCuVN63O1oPIuaC1wjoEJd
	70aebEJNNBa5hWz7eNOJ2FCBPvB4St5GdQ439gfsr+mbxdh3w49zcup5ksj4G7H8fcRwWwU9jCq
	9q/vdsyXkMgnfUNLBRKkgzDpUWx2qCy7hkL/ZV558YS3Y3N6KppZw4N1E6hL4iujno0q+TIGvFo
	41g4Ee/Xgzf+MmsiFP978UJO+jZqvC1AH5+tvvkkQXw0BD8szbZ9gtcRrpC+838P6c/bf+Kn6P3
	VooI1Y7Ut/J6Au6YzRbUnNK9aL6iHC5MLQRchv2CG32MfMK9qJuhRwu7+YHa8NsSBqqV39FJhG8
	X/ip5EoQL49WhtEnA1WBdadfnE9FUrg0+5TCsHzDvItAWF9VM2yL3sUWAL2P8SaIVGdDbKLGYYH
	Nb1xWuYKIHcnmX69VqAW7AaFsaZzfAcJ9RqzSsF0KgKiYFk3PsaN1Jw/tOuEfd2LGCUisNrfKA3
	lNMQGbRoNS8psPPezNre7Re5a2i20CHTPx+MLYb9BJpFgHs/EnQd+6leB4MI6NUdVuOG9gHRdTV
	traqTD51E4Y4G6K8YNB45XVh3e0XLvbkjrFahRZuQTulMl2cWUaPJqSq4CowyLsOw1IWEwB5dkg
	I3dJjtKCSG7K9PbO8jA==
X-Received: by 2002:a05:6000:41c3:b0:48c:4658:602b with SMTP id ffacd0b85a97d-48e6e4f5605mr24195118f8f.10.1793653653017;
        Mon, 02 Nov 2026 13:07:33 -0800 (PST)
Received: from [127.0.0.1] (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8a7d1sm21765308f8f.38.2026.11.02.13.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 13:07:31 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH 0/2] Fix clk-divider rates above 4.29 GHz on 64-bit
Date: Mon, 02 Nov 2026 22:07:19 +0100
Message-Id: <20261102-upstream-clk-divider-large-rates-v1-0-eb17035bfad2@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQ6CMBCF4auQWTsJraSgVzEsajvqAGIzU4gJ4
 e5WXX7Jy/82UBImhXO1gdDKyq+5wBwqCA8/3wk5FoOtrTOmtrgkzUL+iWEaMfLKkQQnL2UpPpN
 i19rGtZ1r6HiCkklCN37/Li7937pcBwr524V9/wB4Qm7hhAAAAA==
X-Change-ID: 20261102-upstream-clk-divider-large-rates-872467864e39
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: Brian Norris <briannorris@chromium.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 David Laight <david.laight.linux@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

On 64-bit platforms, the clk-divider truncates requested rates above
4.29 GHz when computing a divisor. Fix it and add KUnit tests.

Sebastian Reichel fixed this in 2023 [1], but later versions moved to a
new generic macro and were never applied. Patch 1 resends his v1 with a
new commit message. It uses the existing DIV64_U64_ROUND_UP(), as
Stephen asked for then [2]. On 32-bit, the rate fits in 32 bits, so
div64_u64() does the same 64/32 division as today [3].

[1] https://lore.kernel.org/linux-clk/20230519190522.194729-3-sebastian.reichel@collabora.com/
[2] https://lore.kernel.org/linux-clk/5e9e776db6628d02d7081292b81ab102.sboyd@kernel.org/
[3] https://lore.kernel.org/linux-clk/1b74d2ea2c3a458694c4c74f2381fcab@AcuMS.aculab.com/

---
Carlo Caione (1):
      clk: divider: test: Add tests for rates above 4.29 GHz

Sebastian Reichel (1):
      clk: divider: Fix the divisor for rates above 4.29 GHz

 drivers/clk/clk-divider.c      |   6 +--
 drivers/clk/clk-divider_test.c | 117 ++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 118 insertions(+), 5 deletions(-)
---
base-commit: ab94dbf302331eed3679e262e1d8d1a73f308640
change-id: 20261102-upstream-clk-divider-large-rates-872467864e39

Best regards,
--  
Carlo Caione <ccaione@baylibre.com>

