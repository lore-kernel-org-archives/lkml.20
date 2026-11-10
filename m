Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286043;
	b=MLygruKWl6bKaJmLI1GP+/IuD8TSzzfJisqKP7PxqabX6KLx8o3LCZUALXul3j+uKtKQ
	 GkSwJupjDflcS3CmoDJKHeoh5SV+qn1Qa55pWdB09ooqf3EbrEzYPIHN6At43+izGbo90
	 vkqwRZuB3H5VNI27N5LVxcKDvktuZwl+CfCqU6MVqFXHaoxSGJKhK66zlAQ0iIZ5wDpit
	 IEsAdj83Jl9nTlrPZfBaXxVY6o8PMsYWphyypQXY21tkDAxG8QuMKmrQ+UT3toFIXk3+5
	 lxU4AzNoBB+x/55djKYBdHvOvEGSCPz5VOwi/jmstNggnZTRZ3FgiJmyBAYgXnnOYaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286043;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=XG0VksmSfVKTtdSN1LbjQIB6bZPmaQKbfPiHZ6IjJLw=;
	b=XZ17lWJynHXjlWdummNXbG4PzmhF91ns2Xb6xHYCUEjdjDeNpmXW09arfKIFVoDUFKRh
	 oEsze7pR6qEyhE5xZEIPJuY+Ze4Mmv/N35f+6Jyjk9wC7mgBsJnx/kZeP1Fu9wbHRvdUu
	 EMpb4XPd1CQh+upTONzk3V5djmUpeIciZrPoDmq3DjO1fz0JaMTUGjpL+6lg7ZflkwOYz
	 JpfHYYYBrFi6199ddUUIYwFjkbY5NjalZzI3s8KIAZBZGZRYeTVJn9KR+nmkaBqCEE8IN
	 0PInDTIQlDr3Js8r0iebmzHDKqdgMHGuq/ADJHTWSm++PfukOZYvjfcbKP1YCwIr1RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wci7ijoM;
	arc=none smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF19606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:47:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FF19606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wci7ijoM
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93e63ee7b4cso146735985a.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794286042; x=1794890842; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XG0VksmSfVKTtdSN1LbjQIB6bZPmaQKbfPiHZ6IjJLw=;
        b=wci7ijoMJ3lK7M7H1VgZd/BhKNO0ynHkaqiv4EhkkwgSVCCdpyqdPNxzKTzOhhbD3z
         zmw5o8CpYMGtSgCGbmkt7csgw4X54zPgwIdCorS5eJ66Cv31ckBjsXKHJbJSSaJFrAcT
         48IgtBwMLoo6HGKZCB5MrnLezUPgECN5E8PQ2C10uADwgb3X/+PluYknJBPs2m68pXM7
         yFoLPzpNgNnhcvjyTx+8o31OUmeD9KIQ+ayrF9lf/tshib3EZKkB/Yq/h/tQfnRwvaZt
         zmSJ5PJRSDC9NND/Tlraez7PbP5B6he7qfxrMjdwXPwTnKoOvywETkQFoAmHKcc8IpTb
         xt2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286042; x=1794890842;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XG0VksmSfVKTtdSN1LbjQIB6bZPmaQKbfPiHZ6IjJLw=;
        b=eCLwEf1kk2x+eIBuVRwzgXLbXcWM1zS5f3aXmWPXA+mBjOxH/IlSBX5Q8n8aZngClx
         kuo78Rt33Dd/3qYaktKDeXbjuf/KRqMZg/dLYnKxsCAaalkFIwuGnQbir9xu2gzuJ0xl
         DyqxyCoEzurj3sK3iBWWrpXwRo59D0ofdWEispfhc8nQX7zjap+pe5Ey9cF7+FTa3SHr
         9FYQFrwrxv2Pgvo8/vadRGljAHeKm8Mh4Si+HspJ8d0AfUmxjqrv/ZHIfN4GaOM0ZhAd
         renK5IwfMUAQ/buoM5aQigtOVPXp9LsLYDeA5ck+uGZyYmPwavGOOMlLwdJwQ1EU/P9Y
         Mxqw==
X-Forwarded-Encrypted: i=1; AL+hErEQKOOs4kLVUBxQ3gQEwnc8pAfgcBRq4iWrI4WNph+WqSLz3VxPPtPSmnw4VmVFSlL4C4LdCObv9INaCvY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aOc+bCmfr43wDtXx8hPr4H4PJE+v3uAJEFvs2bytELWFYQUuB
	sv8MH5h8Z2GUprqSvAUrS+MovwXzfaQW/ifkaJHBm300ATzK/rPKC1M=
X-Gm-Gg: AYBFou0MwadbOy8XKZbN15NTWO1dERc0wmqhtFIddVMbMRWOizPjRDKU4F73H2vvVDD
	HFZfgC1LRH+xvIEM9WsrlOxnh66k1bMOLyOAIdgr/aLjs72PTJBEOwAB1S/l9qc/+3peFIc9jPg
	+s7iT0yxoL1YKYBpItRqxSRnurnryPiXNYlykEobuedw4uScZsFwz4Mkk1omiLrR7lyvESOZwJY
	51Mq9FwUuWHbcrgSQhhyXa2zh4ctIATY0vxAlakjro+gG8/sgUTL7TQJ7PdBbT5Pr+eYXc9nzjb
	LG0KZMnvy4qyG8XccnlnbZlVUU//HT51Fwx++G6OQqulZSGqKfJTcwg2qyAWkTyE124GSEOVfyn
	KicB1+BU/L4flOcK33tJn7vCFEymHVkDhu8SpGc4/UzWtKwsztlQNsTlMiA/+NBFntXud14gGJ9
	cNO/5qcsbHuOEKrgFI0ebc4dJ47AEI5a4fBzIIiijeNB/Fpb1TwTreL4XPZ6KYURngnJ+6lJt/l
	2ICieorOBxBTbsnRKqa9mvSOdL4wTO8QB6UZFsgDbPgrlHOVY4BuG7gIqgbkfv24cm1JCbyxr/r
	QNfTj1iP6xSL8k6XSWblJ5AwJx2AwmAfRGwHm1ev6KQH5NObL7G8yoXl36ZzbrrA2lWLnOVLao9
	o861PUm+aOohn5NCRqDm4K6Yl2sjlffEALerIv9i7D60tF81gF+kszspjI4706lRsDLbKmMFs78
	JZKOM2BCbiCQ==
X-Received: by 2002:a05:620a:3914:b0:947:9410:f076 with SMTP id af79cd13be357-9479f2f6069mr234609985a.55.1794286042116;
        Mon, 09 Nov 2026 20:47:22 -0800 (PST)
Received: from localhost.localdomain ([104.39.152.7])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73ab4bsm137920185a.14.2026.11.09.20.47.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 20:47:21 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Even Xu <even.xu@intel.com>,
	Xinpeng Sun <xinpeng.sun@intel.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v2 0/2] HID: intel-thc-hid: quiesce IRQs during teardown
Date: Mon,  9 Nov 2026 23:47:17 -0500
Message-ID: <20261109-thc-rebase-v2-0-mhun512@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Rebase the original QuickSPI and QuickI2C teardown patches on mainline
b3dfbde62cf1981c4638939c159dfd087b7a72e9. The source additions and deletions
are unchanged from the original submission.

No hardware testing.

Changes in v2:
- Rebase on latest mainline.

 .../intel-thc-hid/intel-quicki2c/pci-quicki2c.c    | 28 +++++++++++++++++-----
 .../intel-thc-hid/intel-quickspi/pci-quickspi.c    | 28 +++++++++++++++++-----
 2 files changed, 44 insertions(+), 12 deletions(-)

base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
-- 
2.53.0
