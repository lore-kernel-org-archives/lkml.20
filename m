Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com [209.85.167.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3FC241695
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.194
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792024012; cv=pass; b=odfVQ4jawFr3ldablTs3OJHPAUBMfOLWCHJgxLVGOe7ZDWSUbOZPOk34XteXoorAXSN60ct9CJYyzmrmboaMCKySR84CCvdS381Jnl4V8Jd0WLM+4nmCvfal7Vx+XAVBfb+KdH6gzC/a900OPVz/bXaXJQohbF9AyRhuIbNx3cg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792024012; c=relaxed/simple;
	bh=H++n+6X9C5VvpyroWHO6KdmIePZMRt4kP7lXJi1S608=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=BgKA3yPUIik7D+cZew7N3ZIXolFIUNMUh9FFN4vmgwQEADOKlDmi4sX210RF90A6bsSZWPTMjuaGU3jEVYLSqlY3pg2YXB0vKGX4Gj0+52pTm8iM6LunTYFdKknOWRkupGbNWcfNnHOMjOyRBibTQ9Chjn9+u13KIghziZL+DkE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trukhin.com; spf=pass smtp.mailfrom=trukhin.com; dkim=fail (0-bit key) header.d=trukhin.com header.i=@trukhin.com header.b=QJ4eocK4 reason="key not found in DNS"; arc=pass smtp.client-ip=209.85.167.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trukhin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trukhin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=trukhin.com header.i=@trukhin.com header.b="QJ4eocK4"
Received: by mail-oi1-f194.google.com with SMTP id 5614622812f47-4f6dcc0e8ccso4078290b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:26:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792024010; cv=none;
        d=google.com; s=arc-20260327;
        b=hyQsW9NgX8r3U+QODHEpkZCjmV94k+1e42tEPYFgejHEoJi1QzLQWyTTYIZCDY4PFd
         4+2g6VmjNfAxMyntY4h5kA6csVdYKHplr8WVYGJqVzN5LavIz4FMSdQGAoWekp47vAc2
         i3nVHdUpNDH1PrJGPc9xdXp413CWf5QXjyCntezFP8peerWYB/dem3NkwSPqJoAu5IMy
         9h7Gnx00A/JdBBVejLhYa4pnpPG90G98krF4qOa5NgfmP3kQhTiAAaTkTYLxpy3P8PBH
         u1olHTyUfKohO5gfucryJ3Qa0M/OdPkRTckqx1qeQ9j/RBxtow6NO2rC3jy8zzt6PWWi
         5TfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=EYnWTiTFyQXGC6BI11nfHmwSHAXOSjJcKpSLcmRA1K0=;
        fh=Kr6M4ad6Cy7trtXCb0dOjoUktr93IwQ/Xmm+pOb5vAA=;
        b=VCAm6b6DESPspGRIeMxdGA30hV37Ma4xBu8PuJKxm16PO2ppOJUML1xrfC+2LCZf43
         9W0YPZIQ4+iln0H839PGqNVhGkz9MsQHXUkiCeyqOQoSZViEJYG+RdnL6bqP6o2vSLXx
         NO/tOiX9kZEDEFKvimB8XV0c4jWumEq2L7rRS9rUXc/C9t19Iq+97Gy89iNRFPyoeX5L
         1MjfU86Lem7ET71UEw1MtKKmTzKRCYfGqDAOo+0lQf0xe127wHGPtCA3Ge4h82+mTwie
         ifbHQo6K5wYq0z8C35NFiFa0NPq5cMjbshXrnNzOOnWkyQL3cnW0PBB/JSjAbJWHVo5M
         oJiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trukhin.com; s=google; t=1792024010; x=1792628810; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EYnWTiTFyQXGC6BI11nfHmwSHAXOSjJcKpSLcmRA1K0=;
        b=QJ4eocK4Pzb2wyrib5eyQts6umMjbZh1ZqjObUkiEukyt9mfkRpewqgSxHuhenDdpi
         XLsWT47x8TpRHgaIQNQwvxMiMHHvkfj9W3q088qCGugSuR7DBHquV0CSADy3hzL1wfPz
         +88EeySq7wdi2/vSarAdvxwrZk2yTxoN7A29A1YsQjoOozIXQAckI60VfjV4jYcUn7qS
         kHMe/aEvln/qxJ2jKIJ5kGrfZkR4v+bPoEvqc2TVF/kj8jpxjbHfU9ve/T1eGW7v+5gr
         F2CPvlVXIsy3rRAhsQSz9VlWkJfQGgB75w4mBEcT+4qnuwyCn0GCRx/zEbwuTDvoAf7u
         YCaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792024010; x=1792628810;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EYnWTiTFyQXGC6BI11nfHmwSHAXOSjJcKpSLcmRA1K0=;
        b=ttdFfJkzo0C0GPwdZEzeq+ThoN1Xpj5c1G/PVzlsdbiUz3uzn6bUx2K2zjM4zCfUH6
         1n3XZqGr6nMDP3iDwYYuAUtruxDUG5Q+kDNWGwFNID2CHDeTfi35ZG1cbxQ3PthyouM/
         hNGY4Cq1Bdzw/BE7yqEd2BXkW2zd2qn1T4wiEaH8HZojYylM4E0apyDiDmLGDUxSOoLD
         x9qd7SuDTDudl2sj0UF+khw2LD7C/jSZ17FUqlX5QSyb98M1bYdprDpA3g1TPbYXAMzt
         YHmTkWf2XeIs4QMRyrmoYQDlvE5vLZ48x4oOAukkJb78ZVM2BK6W91143orysDrzjKW/
         qqTA==
X-Forwarded-Encrypted: i=1; AKwUvByDHxQq152fwW9tEtOuQkIT4PoYwHxWs8q4tT1QWNx1Glk2NeoNR3Ce6sHP4tKUIT4OKMqtw6rg/VoEz68=@vger.kernel.org
X-Gm-Message-State: AFq9FYLg8VVxvwjCuxIrl8v9vcUJDjs0RG3T5yit3SI8mjipT5gTnNLx
	yqf5xP36efekTBHRaCbu9txSA19rFrU6y7DZ5hF4c5Ep3gicTvXXgC3zhpRuE6NK5bUWhMi3THI
	BeOgZ1mmL0tG3oIBLj9veKGb9NUGgUyiXpClbHUfCxg==
X-Gm-Gg: AYBFou015VO2Du9lQmcv4MyBhqrEJHtj4bkzvImUUeXZL+HsZtyca2cEIL+irueP2YD
	xQB6dqVletNH4jXsPa5K8/jMUcX1/WVq83uSWFTSJN9MUFO0LKdhq4Y/MOpx68ngRZivg8jt8S3
	UiJpOook3hzIYOflvSiDy83wYufUkEO/Y2C4u255+Hq9fooVgbY11xLMAGFpS50ROABCieoCubg
	VQjroOvlfyiN3HT9u6xYHHqCk8BFJ8JtwbwUWGgNSzIrCIZV9p3YUphaL6YSzOrnMPKHUvHVlwO
	5Rd/3NYpB4Rtq7gY6b5z5A2KBA0UX4WVP+xvVRm5N/Wn+xExuFtzHLipdivoxCwynBD0ARGug1V
	0XQhoq2h7YE1q0zIQWsd1SOfQEoUG/PIChw==
X-Received: by 2002:a05:6808:221f:b0:4b2:8e26:bdd2 with SMTP id
 5614622812f47-50b5c4ecebemr13933676b6e.16.1792024009676; Wed, 14 Oct 2026
 17:26:49 -0700 (PDT)
Received: from 121308794542 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Oct 2026 19:26:48 -0500
Received: from 121308794542 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Oct 2026 19:26:48 -0500
From: Iurii Trukhin <yuri@trukhin.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 14 Oct 2026 19:26:48 -0500
X-Gm-Features: AclHuK91BdsMHJVbU4wd9iqYKa580uSZ-OhEQncSjljqKAdBVeh9GoyP5sy8tOU
Message-ID: <CAOx7e9Jm0N9O_ndL1UApMPrXUN=P4RiptSNibdDP+9prUsNPOw@mail.gmail.com>
Subject: [PATCH] arm64: raise default ARCH_MMAP_RND_BITS for 48-bit and 52-bit VA
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Kees Cook <kees@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Iurii Trukhin <yuri@trukhin.com>
Content-Type: text/plain; charset="UTF-8"

Since commit f101c5644771 ("arm64: Support ARM64_VA_BITS=52 when
setting ARCH_MMAP_RND_BITS_MAX"), arm64 supports up to 33, 31, and 29
bits of mmap ASLR entropy on 48-bit and 52-bit virtual address spaces
for 4K, 16K, and 64K pages respectively. However, ARCH_MMAP_RND_BITS
still defaults to ARCH_MMAP_RND_BITS_MIN (18, 16, and 14 bits), which
was set in commit 8f0d3aa9de57 ("arm64: mm: support ARCH_MMAP_RND_BITS")
when 39-bit VA was the 4K default.

Set the default ARCH_MMAP_RND_BITS for 48-bit and 52-bit VA to 28 (4K
pages), 26 (16K pages), and 24 (64K pages), matching x86_64's 1 TiB
randomization range (5 bits below ARCH_MMAP_RND_BITS_MAX) while keeping
ARCH_MMAP_RND_BITS_MIN unchanged for smaller VA configurations.

Closes: https://github.com/KSPP/linux/issues/371
Signed-off-by: Iurii Trukhin <yuri@trukhin.com>
---
 arch/arm64/Kconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index cab741a695f5..59a53d7a75c5 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -313,6 +313,11 @@ config ARCH_MMAP_RND_BITS_MAX
 	default 16 if ARM64_16K_PAGES
 	default 18

+config ARCH_MMAP_RND_BITS
+	default 24 if (ARM64_VA_BITS=48 || ARM64_VA_BITS=52) && ARM64_64K_PAGES
+	default 26 if (ARM64_VA_BITS=48 || ARM64_VA_BITS=52) && ARM64_16K_PAGES
+	default 28 if (ARM64_VA_BITS=48 || ARM64_VA_BITS=52)
+
 config ARCH_MMAP_RND_COMPAT_BITS_MIN
 	default 7 if ARM64_64K_PAGES
 	default 9 if ARM64_16K_PAGES
-- 
2.56.0
