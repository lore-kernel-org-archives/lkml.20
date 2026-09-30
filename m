Received: from mail-oo2-f41.google.com (mail-oo2-f41.google.com [74.125.231.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1564F85CB
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790780952; cv=none; b=gmYzxBpmPWdhhIcHfRUcmbiXorkG83KSvCJTw30ZsT/L3L22+cBFrbCmltmjBJyQFWKda0wH0bMgeeE/8R7RzRWsTme6r7Pi8dtzNBnyQW0iaHYJffiB0pzkyOIuSxfanjftmmj+UpOoRP4qzK/g5ROjr6U4wluxOpMkO+XdVsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790780952; c=relaxed/simple;
	bh=DPVKVN5xXXAoaMKbr9xf4JRJlRrtKEzhZ77EGh6aO/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j44H4WvYoa7L1EhWMWH0hhrns4EebfYbWg6p/lkCwQoufoBZcqbc+cODOjh45ayGwoKFCLGl0HypZ6D0w/34ovckL89bS3fKZVcSh4xDJVQlF2t0GGE5bXRqpqOa88iY3go5lbpDuaWZNsaF2m+RDFqjmpZ90sClDNyKWCJvX40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ElgjC/o+; arc=none smtp.client-ip=74.125.231.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ElgjC/o+"
Received: by mail-oo2-f41.google.com with SMTP id 46e09a7af769-8177a7fc354so2859890a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790780934; x=1791385734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fPgmINCV8SVNtxSwxWT/uE2/pfejEYPQvV6kz07ef0s=;
        b=ElgjC/o+m9EGCSMuUCxjvJxSyRWInYLIh4wPpEL2U2uhr3IKDOyiRzMzGaPPolj55/
         STnTo7GBULtTRnGn/jopxFyPjd70jMjVUasHAUzrCGz+N9EJK9bnmexCUui3d7+rPlPH
         MMZrrjrz2nkuA9T2JkDPBrn9kFjb1wtMiuBOprv5kSl/1jQ5i/F14z7YSaaXdN/vvpSS
         WXlxCzQEektylYTIgRbunjBT7NaakE5SVMHJa4rQExxCv7etZ5W+AHTTKU7BG0EkcisG
         nWsT+IBeBhKqJY7I57OKYvfoQyR6YIeO7VuzXHEerIL2cdt1w4p5SMrlZ2P1ydzcl5PG
         gA4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790780934; x=1791385734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fPgmINCV8SVNtxSwxWT/uE2/pfejEYPQvV6kz07ef0s=;
        b=ZorChwS2JOms0ZpTUW7VPK9UEsEFvANzWyV/nLmX6E8dMBoP5zH+G6/Uvh4bIwxeT/
         O4V3rVEFxFzE1vjoa1KPJLMBLAUITvJkAQTM8pJm7UnFZebvSDJgHOAu4iouse4RPVVL
         tY9R2IBLgQHg2C8u/3kfKVcWaUOrTJjIcVVw6416uNqDjKPed0eGytjLa7wfmd7mcJPu
         19ttIWJnIHXmtxVlOmJc4ZZiRXNcoOOjKI0hogHyP0bLN7copxFoSahnJunjjH45bN8F
         cCaFdjyDI7V09wbC3u7IuSoMl8UDgRncSaN89a2J5ARUfeUAENWFbdJMIFzgAA1TuNTs
         LA4A==
X-Forwarded-Encrypted: i=1; AKwUvBxBm/rCnGT+6aWq6Y98+/36GpCk+cFLkTY09VsPBIBbO1cn5lxT9+BNrZ9mwiqMsw37gCbpPjKVm0L34fU=@vger.kernel.org
X-Gm-Message-State: AFuF++kd7zv01H1P6VJpxQswaj6T3z+LE4DieBqJmWchejL9NRH0n6eY
	eR7dHP9pKWrEWO3Fd95OfydbUvu/lZfMk+o6+5kVLEJFsWII88fRI0Jx
X-Gm-Gg: AYBFou3+cQfs5LatlcyOSsMs5smasLiu9XqSnX3NpdQfOINXYnSRrxjVYilTUWztLJY
	0VAFswPXp50rrFAUQvMlKBoAK77/Yl4twMNkImzPgmysCSzXZwGkHtvkm+CcgbVZydc5GiO4smN
	bTfgcJBS8R4kaVhl0Cz+zK5jkPYh3unHJbWIfMg3HeYySE5MCeoGpQSEBYQjZvgZIyzCfgoNMQo
	16E9YedBmkpMnuyCOZkupCcEwX3misD22PnEzK592yUUMTRHMfjVzMCEyB2yDfeqColHahjfNms
	4HEsf8yanox9xLEo/sSwkqBH/052tUDU0iDfClv8Z4RIRoE3Zp6HtGA21OZHpd9+odChTHS2onV
	3CmzioZ/KZxJJcskfOJyD6/pcZn/T3aBWtHzHZQdpnPjOXL4JzQcOoO3t2Nn7vBcx65G+6TKqrK
	YGRKekUqDkOimDkvqbyPwio7eRp8W54hpyQ0ZAo9Hrl7yafDKj2hRbdY3Xw2Sz1rAo4MpyILqIs
	qA45n8RTjKz3vZpkr2l
X-Received: by 2002:a05:6830:3916:b0:7fa:5c68:d04c with SMTP id 46e09a7af769-8204b5c2093mr2071820a34.22.1790780934250;
        Wed, 30 Sep 2026 08:08:54 -0700 (PDT)
Received: from localhost.localdomain ([103.179.231.92])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82062ccb8c9sm1087165a34.6.2026.09.30.08.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 08:08:53 -0700 (PDT)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: linux-pci@vger.kernel.org,
	ryder.lee@mediatek.com
Cc: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4] PCI: mediatek: Fix integer truncation and handle oversized resources
Date: Wed, 30 Sep 2026 15:07:27 +0000
Message-ID: <20260930150727.2897-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930120539.4967-1-sreekuttan2156239@gmail.com>
References: <20260930120539.4967-1-sreekuttan2156239@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi PCI Maintainers,

Apologies for omitting the revision history in the main patch post.
Here is the complete changelog for v4:

Changelog:
 - v4: Fixed struct device pointer access (pcie->dev) for dev_err().
       Verified build and passed Sashiko review checks.
       [Subject: PCI: mediatek: Fix integer truncation and handle
       oversized resources]

 - v3: Replaced clamping logic with strict size validation
       (size_order > 31 returns -EINVAL), added !size check, and
       updated size calculation to fls64(size - 1) to handle
       power-of-two sizes correctly.
       [Subject: PCI: mediatek: Fix integer truncation and handle
       oversized resources]

 - v2: Added size clamping for size_order > 31 to prevent overflowing
       the 5-bit AHB2PCIE_SIZE() macro mask.
       [Subject: PCI: mediatek: Fix integer truncation in fls() and
       clamp size]

 - v1: Initial submission using fls64() to handle 64-bit resource
       sizes and prevent integer truncation.
       [Subject: PCI: mediatek: Fix integer truncation in fls() for
       resource size]

Best regards,
Sreeraj
