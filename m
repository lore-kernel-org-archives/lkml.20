Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB5931A55B
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 05:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789795431; cv=none; b=Dhu6RFLHV9C9Nqf0/0hbYe6Vti3g+xldh76ei9IHt7PRtZ5gUo2HU49Ox+0WxxCKVcMcWNwyixGodtdrEyHEzrJz8pXdSw54xLHz1EGmiR+zZr10u2JxjT+gTh7yANrbgMynIpwgFi/hYIQluYRr7zBXDvi+PxDCnVZANaS9Q9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789795431; c=relaxed/simple;
	bh=+FitaPU7xxm51lVtdh8ABlftRiy+/s0hAsRKVPTqrv4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SPTb83TAhvF6nwpB7NoUzBRamDSjI6mctgcYKCb/FbR31iXoUKrxnINDrHVgg+yxbYzjm9ObuOoWhxrlcMjV0+ZFVKVJSop0BZrhkIxWgwwDHXJaGTH21YeQNiwnAo+HsAKh8D9YCmNlRAD5zwf8nx5dJTuvNzpb8LpgWnFBJzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TUwLoynz; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TUwLoynz"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d8239so10097295e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 22:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789795428; x=1790400228; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+FitaPU7xxm51lVtdh8ABlftRiy+/s0hAsRKVPTqrv4=;
        b=TUwLoynzxSuZQOfoQ/cCY0bTNiugno4GS0wNlIlbyuv+6cdfirtR1yRMtAHrNvLYwD
         WYILXlJNj+M1G+knaDOV5bxlF7LCyg8nu1IZgkALjhLyjQuwVYAhmBiad2fLKthZ4t2+
         2UtAqzv5qcQrb+nVX62MSxs7iZH1pVURyHWkkBgNJTgf0pH2zXU3EEeAqNbgJ4DCMUo/
         WAIv5nfveCI0E9xbd6w0Hjnu/SEVt8X0XCRTND4AZ4f1BT/v/5vfQkBAzxkktMi/ruMf
         7Hz4VMYfnBXBT10iVM6LCSUnuHUUxTDCKztj6sB8SdcLScE+xNdiG4S5RuatH2B2YWRE
         20BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789795428; x=1790400228;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+FitaPU7xxm51lVtdh8ABlftRiy+/s0hAsRKVPTqrv4=;
        b=0d8WsmcLazJoVZgFjCW3S7feBYD+YyucR0iwN++YPeL40ciENunDPmcTRyo5oPC5yE
         yCrjbfcJRTjXOmJjdKpdegjeSVIEr57YtpblAW0IqkduvezAcUe9aV0sO3na0sV4xIeV
         LiihLGhEPEtPO8eZlHHH8GKsDaJbBiTn+TSFCRyHp2Oow3V5/CilYRACiYhYiKzSHrs7
         VgCRWDPyeh2Ql3y23F1sE2ybPJuQjtO7MHZCYZsAZwv8YtBDazddDQrdr1Fx3UarDM4g
         LsxqB2s/qYidb4jbkeb750A/zcEhcnvqIq2MzEP1g78MNeuOtTw4cLjvdN6GA+bOKpIi
         0s7Q==
X-Forwarded-Encrypted: i=1; AKwUvBw+PYy6DI9o4nThSL4XXnJL25Dhr+3gCFy5Sy8gHvY4vzhousxO7X+3fWtseZp2U7wjUslHjojJKLueY74=@vger.kernel.org
X-Gm-Message-State: AFuF++kTC8xkoH6x6ThSGt7mChgEMG7WqXVQdw7xntSLbMFKF2gee3us
	j2Jf5gAh4j7q/2MFFkoxwCkHTfncfy6tW/PlMAX7EnwXumUp3aDE73OY
X-Gm-Gg: AYBFou0tbZNCsXVd3XfpFc6DuDrl99w3MG0Z5VPnWuIy07ebXQpOuN+BecRMCakmho4
	auYhOTo3NewtquXksWGlTv8HTzZ01kp0BLrvUFOHqG9nnf6jOPMExhOIIzLfDnmyjQxbsAfCxqM
	x6X64/9A8Y69OwkaphnDyongluLwYXfzcetsTA19KDZIiiXcWSf/NJ8Io+/11edey9/zW4+M6L9
	aSC5OYysx2mOPuWXZDYSNFYgFwgmde0wM4bHQ5yVLhaZHjF6c5XE5MyM6nUIPi5W6C8OBcLp+l5
	2WifnbltJ1nrWxDL0uGbF+67G9jUMu/XOgRG6Vnu3Oznlw+GdwtZV9mjsBHvLPTv8XbdWI2IPfq
	UtX3zHq+n0slm4jQtL1PGZnuQZhKWmqNb71WmpYpO9ODNwXg02mUZAsMR0VJFpJdsQxl4yjBHzf
	/iz055w28Mz44v7E+AhD3rv0KJZDfa8i39zgZXPO5dvK0OU8tchS5rnX9BcAZViql7OcdP6eJYh
	5cnbYtWOqIZB5lwKIbiH0UC1vel2IS+RoU2izDgQithw2CgTTg1xaTQXucrueZSvXEWxnuwJV9I
	mmwIDGcNhHRlz6sRXiayz9CiWUnY3Oaga3u+dKbb19YUtVYGdWW+T3YXlXbSLuTvPv5OiKSXdYg
	QlHiICjfQjLjcQ1s=
X-Received: by 2002:a05:600c:8b61:b0:49e:69ff:c6b1 with SMTP id 5b1f17b1804b1-49fc5749edemr69948685e9.31.1789795427940;
        Fri, 18 Sep 2026 22:23:47 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a017-2b01-05fe-203b-7cd2-a640.310.pool.telefonica.de. [2a02:3100:a017:2b01:5fe:203b:7cd2:a640])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc6ca43edsm109505565e9.0.2026.09.18.22.23.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 18 Sep 2026 22:23:47 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Steve Capper <steve.capper@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] ARM: mm: LPAE: Change THP helpers to comply with generic MM semantics
Date: Sat, 19 Sep 2026 07:23:44 +0200
Message-Id: <20260919052344.23653-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260824055938.27594-1-kmehltretter@gmail.com>
References: <20260824055938.27594-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, 24 Aug 2026 07:59:38 +0200, I wrote:
> pmd_mkinvalid() clears L_PMD_SECT_VALID from a huge PMD. A PROT_NONE
> huge mapping also lacks that bit. On LPAE, pmd_present() therefore
> reports both entries as non-present even though they still describe a
> huge page.

Friendly ping on this patch.

Adding Anshuman Khandual, David Hildenbrand, Ryan Roberts and Andrew Morton
to Cc for review of the THP helper semantics.

Thanks,
Karl
