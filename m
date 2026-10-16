Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC5854706C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792158559; cv=none; b=Y1Z6i3uoyz692kKNHy36/Qo0C8EfALiN8vzjRh+1A2qI8y8IodlnWk7tERUstNHQSWjAEZOHYkJlys9DvZ+xPpvJVjKcsk+7dHlo8s0rjcGlsUTxinKVnxxSMpOINGxjFT6f2pFB3sbNeySBAEDYoLvGzsiEGmLb9UOqzfu5vHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792158559; c=relaxed/simple;
	bh=2oPOPJSo8SwZG2zShQhf9c9WjJUFK6Ksr1Sry34EbzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b67zmCiSWObJlY4xpFpXqQehEQIWXLPIVPDOmIg1q2PfeiP5aEkqPF8iQY13nqYA70nn9YRuK83+pDY1V6x7m8f9EasMy03i7QDNzd8GMGivE2I2U2Th+lwtxNfkCRc9MkWl66ps+YpYuVVtmRTJCmLq+ZPTiEDpVauKmy2kCJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mcCm71ir; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mcCm71ir"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e86dce4510so33206565ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792158557; x=1792763357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2oPOPJSo8SwZG2zShQhf9c9WjJUFK6Ksr1Sry34EbzU=;
        b=mcCm71irbVZSlfGUNhUZhx0XBaLg8JsVwT2iTb2wdkb5nE9rd0mysQ8/0RiV+IAbRr
         bh6bd/DvRGpK7GIU4u3roxhQ5DCa0CeSSDBNSiOwqTi7NI5YK0lZVjn5oe2l/4fg1vS6
         kzLKNX1GGnTrBu9ntID5sp7uJo9MBWkFBJ9/ET9K36P7FUKu4fJWAVYyZ7x/CUNUFL52
         aG+PYcawvz+hUVXsmMQAMwvpiXbZ3cb8NgTk6AhezUf8CD5TRdsexmUiklLZH7fP7oei
         ojmDPC8hxcPM/3xVv+q78eWcJqEwBs1Ys3DeVhmlP5gs9pVvc9cODqfpouuCbBC/s7sZ
         IjQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792158557; x=1792763357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2oPOPJSo8SwZG2zShQhf9c9WjJUFK6Ksr1Sry34EbzU=;
        b=Y8Hz7nwkJl1c9p6d80m6S2cARy1d7cQXiyPShK7aMXzuZ6g9AE0O67IKY1X+JgQcTt
         meHPJTdAZLiYbXSZ8KCQR6tu3sR0ciKtbFY3P+JKqVrB+62Fe6m+bRcG+EzrZJdT7sa4
         m7cCD72T7+GbBoDsq1dyoNAplsH48irIRhY1n4VrL0izalF7lWLaYYrLqhYHBXK7Ksi3
         UCPzhPPrHttbIG2UXH3JS1rX1QDvqeid7cFah62XZr9QeIuKQ+lvtNMSf9SF8O9yE5dC
         xvmV+gbesDnF7iJaTPS4VmrAJiyTnOrW01y4aLlTbNShmbKQQH02gxoZ6zcPyt9NAZVL
         tILg==
X-Forwarded-Encrypted: i=1; AKwUvBw9VuXlnQ9zBRDPgh0pUR+KVFY1vUbW7/paCPbL0VNJ6X+QhIs+EVWu4yJv7U5HnUxU5LVrp2231ORcE2w=@vger.kernel.org
X-Gm-Message-State: AFq9FYLGGED3aNFbWnuvem7YqxRm3a9XeYsabWK4q4KlyqHQthht7f06
	4WSvXqAgu3oMD4sFmsw6vKG1gJ7B4MBmjRi9fV5/0yIJ4C/YGxVFYbj6
X-Gm-Gg: AYBFou1JbKTg6NHyrjknZR5IabKZ6mTsMrLnwlnXGvvQbWixaqAE0NIC+6+26ELeJfs
	hnVH8oPeuQdcBxIfiJ6AK9RyDC0u1e1sbNwwRB66pf+F1EBYAhM45NU/LKuQMB3wbVVR3RLss+w
	mj+uwL/7bW6Aq9PRgv66GUdQNxPBpHLSCWDalZQCBJUaJxhfmI8gipzrNFk87ZCV/H/aG9SoriK
	LCVvt/AUDXM4k/yFGuYlu+e58zd4qUE+CNIRXiNB/biGiTGMTBNyR7Ne06yzlMG1UKOVlDDKR/9
	hjQ7nOfaSc+/hn5pIbQxjw6PfeaOy9AG8j42Afo5LwrY/unGWviIPfBGmDG9AyZDCzFqxWjjBBI
	sWdEL+baIW51twrvo40IaQUFKfWf/DDh00UDd/XZ2MhrExVkjsIVWtPIrbUj+WGV3pYST9a40Vn
	JhvbuT8k5EYVjguI5nPCXrrid48kI0uUPgPEsCQ98haGCCext7vvtVX9yn6bS95JYbqItsCN6kD
	7Ymub9oHP7Hn52bHhQz7WBKMMx3qmSxhDNOeC2mael6Zs5bCtU6GlzOb7xw6cbCc+NYJneIpA==
X-Received: by 2002:a17:902:ef45:b0:2e9:7ace:ccc7 with SMTP id d9443c01a7336-2e9a69eadc5mr215965ad.39.1792158557334;
        Fri, 16 Oct 2026 06:49:17 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:301c:f8cd:1467:1666:71b7:b993])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e87836bsm10762845ad.47.2026.10.16.06.49.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 16 Oct 2026 06:49:16 -0700 (PDT)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] accel: ethosu: Fix kernel-doc for ethosu_gem_cmdstream_create()
Date: Fri, 16 Oct 2026 19:19:06 +0530
Message-ID: <20261016134910.35015-1-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20261016132726.GH5059-robh@kernel.org>
References: <20261016132726.GH5059-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Oct 16, 2026 at 08:27:26AM -0500, Rob Herring wrote:
> Why are you sending this again after 4 days?

My mistake sorry, this is an accidental resend. It is the same patch as the
12 Oct posting with nothing changed:

https://lore.kernel.org/all/20261012152118.33548-1-sinha.aryan03@gmail.com/

Please ignore this copy and use the original. Sorry for the duplication.

Aryan
