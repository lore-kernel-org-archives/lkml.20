Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FE635C6A7
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 19:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791054683; cv=none; b=CV08Uz54+7mEoTefP60YA2tH2PbDRIAzieVX+QqiYcHDKPlkkjxq8KSREi1JqF6LkN4SelGMHVMpz/qaP25mjXyCuAsPK2DCavsAaZJ1jey7u2sWkpDt75EV9IURagAanpB2VpMNod6KM36NVrfeKkUz1EnfygulEIoMxj9QWcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791054683; c=relaxed/simple;
	bh=fbyGV63fwXkPEJ1aVy/GDfNe2j2MUoamF77AMyyYKHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u1sqfOe5MJMSOeRPfQSp2Xtw1vuLpExaGZUNrVVVNr0fR8By/ZMhnv3xmEXJEJzCHGveiU2kuUtSldcuTAeQUsOJdFQNRFnpm+G1V7ymZPRxnr05EOX3+woEC/7HBntH5bDkh8O8do04LQVlIV2r2MxnnU7aWv7ssIHRIynU7Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FG7I/IPz; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FG7I/IPz"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3a7858d3a20so7227511fa.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 12:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791054680; x=1791659480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fbyGV63fwXkPEJ1aVy/GDfNe2j2MUoamF77AMyyYKHI=;
        b=FG7I/IPzKBRQfk/7m3EhddmaK0x7zIuXBGUtP/LGHkyPe+iE6kEPkSPlroRP14HvgU
         OiFmA8jhGlDs7qs1qurG2irhfWVI3j5KVRaHjHtmgzgOH6tYLykI8ZQFcNbPr/G3ir70
         jbHu4SI3Y8KvjP62H3Cq0iAbZnF2EZ29vMfe0w5b8aNtO98L03tQYT4HIT0al5JQBPQ6
         Qkl950HpQC89FASdTYY/vUAM7aV6DQFxjiBR2ZX8ac39GMqYWdR0j+ZUe0DWK4WCIJg8
         XCj/cd4s7iPMv4zdtwD4jXvOJz52ExOpou1l0+cF/ZwcmBonLNXaXPqiU83FL9VT0YrD
         DqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791054680; x=1791659480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fbyGV63fwXkPEJ1aVy/GDfNe2j2MUoamF77AMyyYKHI=;
        b=twQiZRwc1N0E4j/inE+m0fH7S4Qj78i8Xa/gWqQ3A/QHQUejWi5NqmsJIx/P+LCKPF
         /g7J1EHkl+0b1fJbbojhFtGClDMxuktLEXS3/VS/X3I9d9YzJBJrTqT+VCe8wi6DBI8C
         oyK7hXtzzuCr1TslpYCmy7A9+qCXXNuTz+UhZHn6wmozyAJRGvP+cLaVnA9JSTb8xQGB
         ynibef2Vc4NqTomvihmhdZ/tAzuqcFUUEcVYd+XsmJj5wvh+L8lBVMmQGpDbiQenxNCC
         Ciw1T92QAb+PNXO0V89EXIDxQYC+9fTgwgvb/GQT0cplLFmXl/dEaEfwGymMsPlvx/Hl
         sLtw==
X-Forwarded-Encrypted: i=1; AKwUvBwBROMUZ7SF+6oMiHMX7MsL1xYTHN67ZfJcxzX7NvzuXeC1LblUDP6xN0vE/IlGxVvyiE1SVMoJV1y927A=@vger.kernel.org
X-Gm-Message-State: AFq9FYKE80kMRGAdAoLDYzo1rR32AXc6EvNGA/yfti9mLJQn3v8NvvoU
	Y05zIFvfWsTDCZ/cwTNqYL9hGHEEgQkH64hyhs/eIAItr4MMKq1mR+8s
X-Gm-Gg: AYBFou3nFIxf4r4WMQ/jtrb5R+wCfFTINF8wPnmeeYsoLPaa4vR29hav/9nyJwZtJOE
	tUBHUWB9jlFQ15IDyF3dHrDgYcyBXzbBt5ptcU+jy7wRl7zrHfRrtyfaPawQ/1oW3rG4REhyHad
	T89X5E1t5ez6mXNAZdJk+xNip+Et5UbRK7J2aVCeM8I/CD5zEqqC5DEA9l68+66ecWIh/WC25/s
	eDJOv47/aCeL7cwSYeUQ4BYk8Yv/zktaJ12kCMOSB6zJfvCfdWOC+g3yxjmd7zYa4wQzbHAz782
	2A2fCfyjb60DYiGsFrG+mOKKp6AMK7ljnuet4YqmTtgzIIwxsewV8L9ZEBoQM1XgtZaB7Eu/pql
	Jd9NYfX66d9/Ycza7Jlj9pASqz6WdHS/GCVy8VCEG4gJ7iB1swg9/WuFASG1SQP+j769xjeZ+kt
	U0phNrH8zDyADo7gxRqikNpSPmIa+mMsuB9yiyr30/m7iu/h4vigXkCNzgL1odYs0ru3a13NFuP
	6Bcga4iTH2/ZiXSMTVisxbk2ehEQ6FDWVEzyauftqSRrD0lTa6xYEVsVimXw/DPdGNtLw==
X-Received: by 2002:a2e:b8cb:0:b0:3a7:8294:caac with SMTP id 38308e7fff4ca-3a97d7e9d13mr1971021fa.3.1791054679482;
        Sat, 03 Oct 2026 12:11:19 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e2f826dsm23626371fa.8.2026.10.03.12.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 12:11:19 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Andy Shevchenko <andy@kernel.org>,
	Bill Wendling <morbo@google.com>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v11 5/5] iio: pressure: dps310: assert the lock at runtime too
Date: Sat,  3 Oct 2026 22:09:26 +0300
Message-ID: <20261003191058.35287-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ar9j0O7DdJ7O1DVk@ashevche-desk.local>
References: <20261002072526.250081-1-zoone.rupert@gmail.com> <20261002072526.250081-6-zoone.rupert@gmail.com> <ar9j0O7DdJ7O1DVk@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Oct 02, 2026 at 10:57:04AM +0300, Andy Shevchenko wrote:
> On Fri, Oct 02, 2026 at 10:25:26AM +0300, Rupesh Majhi wrote:
> > __must_hold() is clang only and does nothing in GCC builds. Add
> > lockdep_assert_held() next to each, so lockdep catches a missing lock
> > too.
>
> Suggested-by?

On v10 you said it wasn't really your suggestion, so I dropped it.
Happy to add it back if you prefer.

> But we need to hear from Jonathan and others if they like these annotations in
> a mere IIO driver.

Agreed. It stays the last patch in v12, so it can be dropped on its own.
