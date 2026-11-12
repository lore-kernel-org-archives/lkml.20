Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794465476;
	b=kddEMI4BN47bAt2OHLH3J9CtVgEkHrepoIyO5+684NevJLzTJ8W8bOXBS2olqBTw+Zsn
	 fpKEWD9xOrdQ8/UmWOen7N7MgZe6+ugIP0WMAbcWqYO085U9452XeHVgXAlcu/iUL67SZ
	 +CoQcalz9c2qNs1IBTgqessqlPvcR9uYD8+lAHLVbZBbXYpv3alA1QwRmO4EDz8Lr5Z/7
	 /E2TUGdbsdUl8JGsJMuvCM0z/U2eXpWDuM3/NtJVHtvR5XlW5dO1arkKTGfBnyvTso+bn
	 +0bhRTdPnYzw1LQ8EORrhVAMXpda4fc62Xv1hy8r6ryNyn1xSsDIXmTnXarfTnVRkaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794465476;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JBxJLZ9A+stI0T9T5K+ypprlCbaS+rb6xSEgaYsFpb8=;
	b=yrsuIwO3AIdd+bFuYZPNuIhduLhZjWxDc0iRWSFj8QCqR8q3X4ro8k0+ATBI4G/2pQif
	 cPlGwd4mNnzoPs1AoawNM0WP8C16DVOwESduAXNi/b+1OtmstKFoMClX+JJz3LwfbcnHp
	 feXOTISked27PoBvA0GfalVwDPuNxcfORSUtE/kui+O0OVkcbhuGmqSE0KwocOIyrxTaE
	 AAomt5lQn0Yi4mxLsJX3p3j8HyfptneaR2DsYR2TsGHWLLA4uff2+9+M6DVCPOvuboEdI
	 AVHmcIhcEqsiCZcEcPBHIl7vPs4knIlS9WX9MLIk3+8eqUS/zxVDfD1clt0auQYJWmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a291R2Tm;
	arc=none smtp.remote-ip=209.85.222.169
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC61606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BC61606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a291R2Tm
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93cbc3ab2fdso203694685a.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794465475; x=1795070275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JBxJLZ9A+stI0T9T5K+ypprlCbaS+rb6xSEgaYsFpb8=;
        b=a291R2TmeVzX+ZoVQl5a1g1biY/0LsJrCAQEGU05PjlSV21LJjuSYaKMSxLRqAzE0C
         oWXoGCom82byt7HcHartYI2RKbISiuWm/7KXKQBxLfYza5U7SKt0NqDxOh3qWJgDWkf1
         /2Mbq3mnP+3x0+7sZMW+CU3tveq1Qmfho+c9KdLeFpV0HMr7ytiEPmlpoq2SNP2wqinw
         1rWoF+WrGAKREs3dTsqwOsMLuzHnj+vS0pFydFW25gv9I6CQsayS+28qGInk0foKTEf2
         hGse02rFGTgDaG+0/ULezN+rf1Yi8Rs1WMJWJllVFPCrpNGIzWok2pWC0Y3lK8FXzb5p
         43hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794465475; x=1795070275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JBxJLZ9A+stI0T9T5K+ypprlCbaS+rb6xSEgaYsFpb8=;
        b=nKkGmHvJbaH62vU1XfzPPpcT9zGR2aRuefeyNzoQA5nfTrV1cfOJGp4CrhWmhdZvp0
         5JHdszpW9/l8IwPIa7sNcdimvJHRRwAG5JZBqwkgCOgFSAAcE2RKs7ZLp4dvTJhkNPD3
         YqIWpqWYOvR7+vPEEkRQXdIxxuIftwFD401dibAGXpkhEi+h96kTmCNPJZ6B4aeVq8UM
         nslrM5eU+e4s6fgsAnGJZQylrfh6KnAYu4U6F73RM5AifZWJsSzEMWxWIGG3bnZ2XAj8
         JNY3ynIsjXE4XiA9k733/m37N7ZDG06N0xP9F1Yomxi8pk5Ql9rbFV2Oub+eVbzbFRxK
         1n4g==
X-Forwarded-Encrypted: i=1; AL+hErHpcrRmOD592Ya1/qztiWWv2d2R+hAM/F5bZf/vNC7A3Areix7TLIGX3o/It/oiykXIBpCEcLup0P9hDxE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gXs4eMcYxdjsT8I2PcffSOqjJ35yz9ZNb2fSldEZDWjF/jpK4
	kQkIpEtLybNfkFiYY8xH2A7rhfsboW0VruZ4dQCIIMtpOZngG84pZVg=
X-Gm-Gg: AYBFou2wPU7GYKAOja1syFS0i6n4/++qR9e2NLtVkRo14s28tJticq86Nd++uQdMTf1
	RQrAJOqBsonbx5Vf9M54cUkiHqcIuBjZQAqdZz/wLHbQmTQKwD4wYQvXTBjXog2RD3kqd6sgu6e
	y5QNah4/ttqD48BapFNv/hwZHMbNLUzL7HslR+bIMrOHciFJxGkQkuEjB8TNNcyptQZMY/kExIV
	7F87uHL4gR2AnfTJd+QcuMaRSqKF4vm6TC0kBlIS5We5ql8O6czPdxXk/mXFxrxPg5cucphNi6w
	2N2PX/KVjj504Jsyzi4ZAg9asRP3lKq8TjEMOKu55U4CFY5+tlvkWBXMHacwA1U4p3HAyg6VREs
	kSvY7I6QVAObOr+WbpWf8GDNrftZltsrK6io7Le9NahvlLnzd7NKYVljBFn/v9/i7wp2EphcX07
	B930lOt/V+bnFl/GU0Oj0L3h9Dh2yrXY1Soj/7qi8SQ+xn5hMkUxehVsAcEiIg7z+u9Kl4XWeMr
	LePiFCVU3jz46kolGfeo2kTAdSoSiSztDkcCjnDKGlSPx4T96Ek2/RDVJ6Kp8/wnrhRd0mzQJe3
	wOI9a9ExExJ5FXro71g8SjOzyaf7Ufq/tYZz8u9bW9hSx0X0gqbv5G0YPiW3gwXeFTSilkspJCe
	Ip8dnb/qTpUrZOaK1cXaHfBPC3P6MQa2XF+iyvlNVzziWrHyfyhEjhELb0xgT751cEoBv5ZNUfO
	cf4RyaC7RhX+zt2u0H6hFjkgBbH4HCzKzX
X-Received: by 2002:a05:620a:1b9a:b0:93f:3576:d428 with SMTP id af79cd13be357-947aff8876emr767795885a.22.1794465475188;
        Wed, 11 Nov 2026 22:37:55 -0800 (PST)
Received: from localhost.localdomain (h16.44.55.139.dynamic.ip.windstream.net. [139.55.44.16])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7e3c34sm658719885a.36.2026.11.11.22.37.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:37:53 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: even.xu@intel.com,
	xinpeng.sun@intel.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: srinivas.pandruvada@linux.intel.com,
	mpearson-lenovo@squebb.ca,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ae878000@gmail.com
Subject: [PATCH v3 0/2] HID: intel-thc-hid: quiesce IRQs during teardown
Date: Thu, 12 Nov 2026 01:37:50 -0500
Message-ID: <20261112T063704Z-thc-v3-0-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
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

This resends v2 with the probe cleanup formatting requested by Even.
There are no functional changes from v2.

Changes in v3:
- Add blank lines in the probe error paths of both drivers (Even).

v2: https://lore.kernel.org/all/20261109-thc-rebase-v2-0-mhun512@gmail.com/

No hardware testing.

Myeonghun Pak (2):
  HID: intel-thc-hid: quickspi: quiesce IRQs during teardown
  HID: intel-thc-hid: quicki2c: quiesce IRQs during teardown

 .../intel-quicki2c/pci-quicki2c.c | 32 ++++++++++++++++++++++++++------
 .../intel-quickspi/pci-quickspi.c | 32 ++++++++++++++++++++++++++------
 2 files changed, 52 insertions(+), 12 deletions(-)

base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
