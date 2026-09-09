Received: from out-2z4y-a139.jellyfish.systems (out-2z4y-a139.jellyfish.systems [198.54.127.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9352489FAC
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 23:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.127.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788998153; cv=none; b=gke/1MlmCJPeD1NFTbDOVzoLUxxEwnq9xO2XZO1rQH/u21zCBgBNAy9nDk8dxzng62vvKm1qJ2S+3FXBYRnWxg7CqKSPr3p0Hs5/L3Ygn7lU1pgz/bu2RzMZ+5vcYI52b6sDb5XA/jMY5kPu+F1O8UlIBoyiNVOJopwFa5uAf5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788998153; c=relaxed/simple;
	bh=7Heoq7yz2Lt0znUz0x8FD4ogNI4fraKbS8z8CtkyKBo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E8yW84B0yGrAOl6973Hg3DOcZEm/kjfuaJkKWGiWIIg4LkKnbOm51jvOUchXDnKT5IVVYuXmw+qhdVRh7t3Py/4w6HodlS9M4EnsIVQAjxCFIbotuBUsPVmsDUAzi6ye5RzyYqOB3jW+D+MGHCF+sHcgz39cdEwwzt6GWgWHIWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc; spf=pass smtp.mailfrom=tychen.cc; dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b=MiiP/7R1; arc=none smtp.client-ip=198.54.127.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tychen.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b="MiiP/7R1"
Received: from 192.168.5.7 (unknown [23.142.132.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4hgHkQ2b05z8sXs;
	Wed, 09 Sep 2026 23:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tychen.cc;
	s=spacemail; t=1788998144;
	bh=7Heoq7yz2Lt0znUz0x8FD4ogNI4fraKbS8z8CtkyKBo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MiiP/7R1mthCanTDpN3BC1vGG4G58dvBT2e+WPLduskMqYbZx9WJQnc1MA6Sxli9Y
	 ctbQ2707GlQ1XIksxrTYxE4ZqnERp2GVmig/CRmSdLCggJOTgbS3s8uJN2bs8A8QGq
	 wvqlYSIWjQdaW7hVt1SNi6Xe22n0ZB3EMtRPLUGtvlSnaAMn1dBfoHz7W0CtCKZAF8
	 cf9w2BykeaAGC0083/cdH0M6TH7QKnAD1N/fpBH1rGHLhAVDpjvXHfB0vSSZxsAR78
	 vzUKxuMUMNfxTCnoqYL0X46CPM+hmoCsDiGiK0/6xZuDsf+CK3uvKDfrSYSyadtUyy
	 djijLI06whFjw==
From: Tianyi Chen <hi@tychen.cc>
To: Mike Rapoport <rppt@kernel.org>
Cc: akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	hi@tychen.cc
Subject: Re: [PATCH v2 0/2] memblock tests: cover low-address allocations
Date: Thu, 10 Sep 2026 07:55:39 +0800
Message-ID: <178899778471.174768.9756364390429558001.memblock-v3-review@tychen.cc>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <aqGX-ZhxsJppfNpi@kernel.org>
References: <20260906144011.848898-1-hi@tychen.cc> <178874362959.1415955.18132997964995947947.memblock-v2-0@tychen.cc> <aqGX-ZhxsJppfNpi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: hi@tychen.cc

Hi Mike,

Sorry for sending v2 as a reply to v1. I have posted v3 as a separate
thread:
https://lore.kernel.org/r/cover.1788997523.git.hi@tychen.cc

I shortened the comments and README to describe the low limit and
simulated RAM alignment directly. Both patches now use Assisted-by: LLM.

I also checked the pointer casts with BUILD=32, where pointers are 32-bit
and phys_addr_t is 64-bit. The tested compiler sign-extends a direct cast
to phys_addr_t, while conversion through uintptr_t zero-extends it.
Direct casts also introduce warnings, so I retained uintptr_t to preserve
the existing conversion behavior. There are no executable code changes
from v2.

Thanks for the review,
Tianyi
