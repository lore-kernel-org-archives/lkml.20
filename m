Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEC442882B
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 13:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789219543; cv=none; b=rslHgeNy5XuUsDGRxDEOpmCkydEPukrLYrg8wZmTjtEFdhMmsQjI/pd937Xvd1ko8qJDu2udU3phnw1Wbd00M2omoHMXyKHR9Xy+OOs1MuByrGFWkrGFSMLwT/jq6lTubJ6xANNLzv52Af0G5tMDeYpcGmFQ585Wal8tS6ZzDAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789219543; c=relaxed/simple;
	bh=ra+nBxwYJ9Dt1/cxvZ0GNQZEo/hQ3YnP/tmoVkrBeEE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xo0aAQpp7Hd6h9I0tEIKtUBPYCJnekl+O4goymEKnnKaNK5tTsfHblkihm5QBPw43mwwomO7Gg238c6b22NtWYpNy488PtNeWUO6Y2ICu9hrZF5u53bAdYM59P5pse0b2QmUb5CVJaSG92fw2/TKcGyhZ11rzZWL1b2YEAjAEXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oAQoPF2/; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oAQoPF2/"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so20258055e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 06:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789219540; x=1789824340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kW/Q8SPmIwY6gpgjSddoHsXSzmBQy2ZAVo1h1jIxSwM=;
        b=oAQoPF2/kB+ldjz8uIYnip6ys/PR6wNJKBtf2TSW/z60pfHQ1gcE9o/udeh/qkmL9V
         lPNPZORklPTKfyztj9EwJ3KOC65kIn7q3TqQj+rsXFyLnQli87s0NCmjyD/4LYZpX3j8
         Dl/Wq8iW5r7K2ktJzudxr2We1fmEw9yAt9o+Vgj8IUXaFBv1unkuzMPqQ2FY9Sp/1fH5
         dF6Mb5RH9zOxfEm4rQMvzrPoQf9brS1c6VZS9DheOrelBgmK/KAr0XLXecL5RapGx969
         e77GDThipwSKg/LnB58iM/PkG/uENsf1+GeZ2XLj/UsunhirA7wui+05zJ1xH/qvQ6kM
         TllA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789219540; x=1789824340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kW/Q8SPmIwY6gpgjSddoHsXSzmBQy2ZAVo1h1jIxSwM=;
        b=YwpblFVV1WdSNFaz9Qfrs8eJC06sDgYRvCITFlvX+XH5TqkuCsfqEvw8e1h6+326i5
         Kk/bUAxng82ylQ9vTrJfucElAnF2Qk7pNFGQHcu76jXh2zP/aVPTY2xf1gGIxet0pXND
         7sK3OXYGtVMiBwM56CfiN82QK6J8cn5A27JDsBv5tY11FHdRnthXM0xVkjEHZaVrr5R3
         DpUCgLUfPRhy9h4JIJavZ/vnHgUdHeyfbck+na/gLTCOCdo8TUJI8Bes4zGeMmaBPIMT
         yMYDxlRyP+A2yOU3ipT3Z3G4a6p0Zn6QMqTMw55Cr5/kIfLnFsyHAKNT1sn/QF4Z5/mI
         WzFA==
X-Forwarded-Encrypted: i=1; AKwUvBywea5wE9Z3UQf+/pYtGid8hM13vhDWKBb3MXl55jwPaY5nD+E4ns+jqd1hY0+1xcfyPEiWjz3R00xGI3Q=@vger.kernel.org
X-Gm-Message-State: AFuF++l6TbBRMvIAbU7jWq+hRE3aMokpxe6tIEnnddEkxefXrdwfRnf+
	CsCsl+SW1u8XHVpgA0qNLNovsJRMvxmz5a49Ub1azd0SlSCCpnkiDzZ9
X-Gm-Gg: AYBFou0p9bs2wh6NdbgV7J2ofKzi8Ejl0dKjRiooQvrC3EEyAMmhmweXvWbtgWYvKDk
	B9nqPr9p67zoL5iP+W6XTV/UC8DCSvHAR9bhnawyCA991PkL7vCTMWpn4FrixhaTkOroeJdie+2
	KJwyfUT0WGjNFwcNqO0JIe024LMFQOBSdZVMR7MMiZag2kvQrYmD9iasStShihcSgZWWKJad0m6
	dFe4lqQ6h9qqQFlnoM9oJVJdbGuMnh0ynQucYfXVGi0mTwFbITUBvD/2Zi5P8PRULWUaesIZ30F
	CXUItY0llz8AUYFnl8HCoIVS7dmY269ZO71/7fXwvR30APz2OeM8jta7oIs4l09X/NyvkTrsC6t
	IPLLqfXiTjndTMHQ3h8Wghqi6VEPPDWEiSGUBjIFp0JR8Ahu68+bKUYHyzkPL+ca12KsLSl+NlY
	M3jK3qKSQ1benKflyK762KRMvmc6fLrJjJ0UTkLBK+HAmaLb/Fk4DyPWmLjclFPCDHZTYu4ZQcr
	8Oy7m73gY4uPniqEA==
X-Received: by 2002:a05:600c:4714:b0:49c:c96a:d36b with SMTP id 5b1f17b1804b1-49e61988ce5mr95438225e9.12.1789219540215;
        Sat, 12 Sep 2026 06:25:40 -0700 (PDT)
Received: from fedora ([154.182.88.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ee8bsm12684503f8f.15.2026.09.12.06.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 06:25:39 -0700 (PDT)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: jic23@kernel.org,
	gregkh@linuxfoundation.org,
	nuno.sa@analog.com,
	Michael.Hennerich@analog.com
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	joshua.crofts1@gmail.com,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH v6 0/3] staging: iio: adc: ad7816: Fix SPI read race condition and DMA safety
Date: Sat, 12 Sep 2026 16:25:14 +0300
Message-ID: <20260912132517.55686-1-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series addresses two separate issues in the ad7816 driver:
1. A race condition during SPI reads where multiple threads could
   disrupt the GPIO state.
2. A DMA safety issue caused by using a stack-allocated buffer for
   SPI transfers.

Changes in v6:
- Separated the alphabetical sorting of include headers into a dedicated
  precursor patch (Patch 1).
- Kept the mutex addition strictly focused on serializing the read
  operations without modifying the sizeof() argument (Patch 2).
- Moved the sizeof() argument fix to the DMA-safe buffer patch where
  it logically belongs (Patch 3).

Changes in v5:
- Split the changes into separate patches for bisectability.
- Replaced stack buffer with a dedicated rx_buf aligned with
  IIO_DMA_MINALIGN.
Abdelnasser Hussein (3):
  staging: iio: adc: ad7816: Sort headers alphabetically
  staging: iio: adc: ad7816: Serialize SPI read operations
  staging: iio: adc: ad7816: Use DMA-safe buffer for SPI read

 drivers/staging/iio/adc/ad7816.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

-- 
2.54.0

