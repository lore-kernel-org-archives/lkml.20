Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812FC221DAE
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 02:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791166759; cv=none; b=emdC1BqfcIWzIuh3ixnIJsxgPKzElbogZqlIb8rpg0NqAIgPViAGzw4DAqh4O5/KY88WW3KIj1Crp5Cefcw2LJUZJJDv8kNewTJWfkCg8BOGZSnTdImUl//A1D8KA5I8MqZIx5JlhzYU5JpLVMFdbzp5wUjJ12M+fS55m6DJrLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791166759; c=relaxed/simple;
	bh=DoZx4B6mVqtoKkjnxisQ7+qRK/tLflDwfpXl0AImRps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O1BEWLEFHDxhJsHBHv1DN93xlAB4v9mYuLU9HN64f8LQrHulN4cpzPftz20Nl5wWOieW4kzcX1f24xTkOMTVSYOqKKM/U8vpjSWCRCPf9agteV+YDZtY147N+U5n0h9ykumaZa6o4vcqIWgxJK83m/0y4H19P7kC7HuSGHKE3Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=qk2SVn+y; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="qk2SVn+y"
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B35AE3F1DA
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 02:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1791166754;
	bh=DoZx4B6mVqtoKkjnxisQ7+qRK/tLflDwfpXl0AImRps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=qk2SVn+yPZ9Ku0HCQ+Xj9xPJKx53xwIg1SipSUnJGm5JR5+vStekkELa0sAIHsH8w
	 vhFTeLZLz99hQq9+nNYV29aftKirdNQXTZr9LJJy8//lujqNQHTsRlIKBparhcDZAz
	 9R6wXKSmmxAWHC5r3lPapdWNwlXbaLM4QhEuokGIk9SgNW1G7pl55rqc7AzKfboAaE
	 xpMNIQFwSoIjRaTC0yspc+orR8r6Zm3+FWT26QA8l9sHjGwVm7wEJcgEX0J8UvVmr6
	 JTMEU8jU+1Tl4kHiQS3/8zfBfcFV6MI/qBY7sJsvfykWhv1gfDkxxl6Lybc101n4la
	 Ero4l3PJer8svASw2faTcaoQp1iEJtoiqRWinyeyQeBihHgn9nOgyntbzB+GxEWOFc
	 RKkqMypQHscLe+XCWpHs+115HmdGosFbrcMa0N3f43XZO0seYFWKnBYQCjqYSoO9Ck
	 v2dMibP9nEHVzUZ6iDVBNLkArjkyh24dfVCBpHJh2Zr2bCYH06vsGbo+24CDRvAM8j
	 QE4bKZk8Xd3b+nDp6Dw3cTQ8bLlihYB7SpBiPacLdXq2VJla92MruUhxc5zwiXe6df
	 c3VfyNoe9x1bW+LvR5/9JxBZL6hV/jSwYkj0EFWw/XyXFQr1Ow6sCTF8446p74/B7U
	 KIT53pFkkbYJmnfh/Sdvp9fE=
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a70af6c365so1049457a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 19:19:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791166753; x=1791771553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DoZx4B6mVqtoKkjnxisQ7+qRK/tLflDwfpXl0AImRps=;
        b=qdJTD7tcgqc5qAQglPmdkxya6Ud+rNyiwWlkw0RzVT5y5ZFkl+EPBxaPuATHPj0mHS
         R+SvTHlFaTTBEl4HOK6hetsf9X51bdbtsVEV9EK51G4FbFZFnXfFF0w3CAJyC/cg+Zh1
         UK9iZVXY3OfAmBNbdJXeyx9Au2KYCNIJpNRdAzmSo7MdlYAEgLU9xHKa1kwVOnoH5iXc
         2W4gk6ZxNwZfSzyUJ/zlxZK1n6s4McDiS6QOmur9olp/KWTkpYS0KzhaYM4V1Vm4TNKX
         HwOHaU66UNJCzFwhNrYZBXr8HcldOuW41lrCvLOL1lg/AxXqLhijbgWjKJfmLNRtw+65
         RIdg==
X-Forwarded-Encrypted: i=1; AKwUvBwRv1Y+edMUk+sry6HhY74c2ZxpHewUvnjsH4U8Z3VHVWw47KC397LOicjO+2ELDWlpTc8ta9XqyyfQYak=@vger.kernel.org
X-Gm-Message-State: AFq9FYJekI95JSDYpVvn4iRxI2BhFX1ZNqvh9WBgYDeX1uChV9IpcqM4
	6yHBkBnNn5Ht/Bda4+DkeJsRFcS9675wJvrtYyA9qLsD2fQHJA0FPidFVy8asYy4NUgtEE8Mg/r
	f/jnmwcaF0h+C3RhSrDwrrzJ+OJ4N2E9NS+nAW24ntE/q+RhjbuQNqDV87xVyUSerYxrcY7jBVd
	xxAo078w==
X-Gm-Gg: AYBFou3yHnlSLXWcvhdJ2LWPaJ8T+FoH+pzFxeLQFEVBgWQ2w8xDh6ObunLCJBpOqVV
	opyLfVDvIZqQUXAPaAaFBsSroYurvAyjwMTZE6IUjwDF0BbUjZ8Zm1mEbrerF9AaxEPO8RvqZHi
	t9VlZrt6Ps5P40jPFPxIBFhU3lwMOO4YHywfWMHvs0JnVbWPowg5YzFXVa5b06Btzc9ntDOvxe6
	z+/Cl7FxaHpnh+PeGOf4M/fPXGBTPN9M54/stc2R+G0Xn1CEAYJSgdYiSrXNIbtAeNGZF8YJjhW
	bg7InFupYjlmhCvs/YoEyxkdst2MRMqGGxacEJoIFkW77eIqF7Zf/a0GqBijIBw06Zq/jCf636u
	5PHRS8n4xew==
X-Received: by 2002:a17:90b:4a10:b0:3a8:878:ebbd with SMTP id 98e67ed59e1d1-3a808796209mr1050589a91.32.1791166752740;
        Sun, 04 Oct 2026 19:19:12 -0700 (PDT)
X-Received: by 2002:a17:90b:4a10:b0:3a8:878:ebbd with SMTP id 98e67ed59e1d1-3a808796209mr1050569a91.32.1791166752352;
        Sun, 04 Oct 2026 19:19:12 -0700 (PDT)
Received: from ZBook.gateway ([123.208.39.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d7c64b1sm9637087a91.14.2026.10.04.19.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 19:19:11 -0700 (PDT)
From: Changwei Zou <changwei.zou@canonical.com>
To: sahil.malhotra@oss.nxp.com
Cc: changwei.zou@canonical.com,
	davem@davemloft.net,
	gaurav.jain@nxp.com,
	herbert@gondor.apana.org.au,
	horia.geanta@nxp.com,
	martin.kepplinger-novakovic@ginzinger.com,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lukas@wunner.de,
	pankaj.gupta@nxp.com
Subject: Re: [EXT] [PATCH 1/2] crypto: caam - Fix wrong unmap operations
Date: Mon,  5 Oct 2026 13:19:05 +1100
Message-ID: <20261005021905.11732-1-changwei.zou@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <DB9PR04MB8139513BA24CDF15DDC44B8D828C2@DB9PR04MB8139.eurprd04.prod.outlook.com>
References: <DB9PR04MB8139513BA24CDF15DDC44B8D828C2@DB9PR04MB8139.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sahil and Martin,

Thank you very much.

A new version (PATCH v2) is available at the following link.

https://lore.kernel.org/linux-crypto/20261004210200.290119-1-changwei.zou@canonical.com/

Kind regards,
Changwei

