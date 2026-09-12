Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F43A4BEE20
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 14:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789222840; cv=none; b=c9Au1G4R+hDL7n6vIRY3kB7XgtjDaogNpv6ZRfUzN9d0t5Svanw3otMj8OL12hO/Ua5Y/FpSy+WdTe9lF5kL4LzrCGt5/DtxAQ9PYVwPT6nV77SHJ3JqbeNUxBQuQCykWalvlsTtTQ2IzzC15onTCSjq1bjWreSsThqLNBZhQu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789222840; c=relaxed/simple;
	bh=JLVHm6p63n0VryfKPzW5PRsxWWIQ2DrkwggRggEOHXo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oaVcSd6aALVDGl4HySU4MWyEejMbj20gjcbxHpNc8ImrHpKVUtreQuekHMH9mq2r/+SEb9TGlXoMADesCK2Ys1WBnUa9k2IAFZM7nptg0MwiNuZ/JGbvtOTlNSqYLDWyrB91BNhfkvba74yHqPkQI9pAVRvqdtXgRttFxPPoJ+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZAr9RU5i; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZAr9RU5i"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso1400727a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 07:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789222839; x=1789827639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JLVHm6p63n0VryfKPzW5PRsxWWIQ2DrkwggRggEOHXo=;
        b=ZAr9RU5inB+2IhbFUvOqP91pLU2gBCSu42uo2kjxWuF8xyQgq0xUGAEmg+AiC+oqgb
         XQFheRNFn80XK0kGABGYFlF/AJV12W4KltY6pDW5rAHLatsT7Z/GHSNXtHvI6rQer/H9
         gtmzPxX3LhXhuiI/G0Ke+cF5U10CluS20ZvgonoxWXNlQjP3BayNfKCfqU4y+Mz6gFVJ
         9L6QqtjTB0bNgXnLGENEm6uN+USaIlAbe3un1KcAuARirzj8HtwDztF9R1VVmED6UkCM
         sml/UmouAbhggLpehbd4C/LRrQ7UC7rxda5aTVwz0XgtmGNPtRa1LLql/e/9Bkwhqw0p
         PC9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789222839; x=1789827639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JLVHm6p63n0VryfKPzW5PRsxWWIQ2DrkwggRggEOHXo=;
        b=VAmLWo2e8zDjp/bg1IEwTqQ6o0MCFJ00vxqC10HLiBSLYMPIM6pTGPpENSbBi13dSr
         mgwYdweSlQ3L+lollUtgdjgUu7EA/AfWsS0AuxEuyV2cdR3bnANLZ+HwmesX3h7+h9oO
         cSxAVymvkPE2Cetgwl6HoGkdNgJ2c/AXKbOhGHnhSSN9sBe5Fs1T3SK0OSQXY1vTE7K7
         3urfi8atyqHIAcyTXCXKBnIgWycxC8EbJ6S7LOqGGHo/TFW5QwXvW+6sOPrlTEyvh2Kz
         wws/64JeCPVwvmBEQBeCOYb9KopEp7cObSgzuzPpH7kuJVA/n2+OmNnI3pzHe4DxAy0E
         jlMw==
X-Gm-Message-State: AFuF++l2okJd7Mxw67X1VwaR/axASz9WXJ255OmMpBAC0nShTH0fCFBc
	jxjtASUwScfBng/X1Za3+EdDSLvHJA8PiL4/mSfvfxfogkSNHY4D7GAe
X-Gm-Gg: AYBFou1/so01GZSkrl1L9qYMeRj3tDBMs+o+ujdROyO+cmDwc+b2aUPHa4lb/ErkZmC
	ixfeELxU3a8qmorqUaFwL7C/6e7riTedIx9N9bHs2jk/y4KmTDGuQidwLqw0+VhSpRs+EbvUf/6
	3tPbBkD4XVOWJ4XEYzRnI/8zmNzCtX/LQVHXbfTOQxMYjuL7x7FTGnzPeE62rDifkCFsB1ppzgh
	HMR12RuiBx51bsL18DOWFXlkBO44NR0JHyzREdeUZTpJ2NHYgLLGlyYuhnp8ow0jfT3YYODdxuI
	wJuv01QToSz9xeFWdhcR4tuKr86EY6jAREVdNXnDm7auTz477w6bkq+u+r9rqgHZZXPgMyMAU7s
	1tW4zThRaum/BqFjHb1BnWAzvOxZbMRCU3wdzw4nQMF3xG4EiX7Olc9Lb19zbVarP7mOU723Jt4
	59RxpUR1zFMHzpkC0HvhbABgFreBmawkQ0BvIx8aCyMBZBeOI1r6ysOnZJZdeysr0OAOgREYGnC
	uNQRgi94sXHYQ==
X-Received: by 2002:a17:90b:2f44:b0:398:e86b:ce14 with SMTP id 98e67ed59e1d1-39d9c21f686mr15996429a91.20.1789222838747;
        Sat, 12 Sep 2026 07:20:38 -0700 (PDT)
Received: from kidz0ne.tail43063e.ts.net ([180.69.96.23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39db113a3d0sm6222472a91.14.2026.09.12.07.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 07:20:38 -0700 (PDT)
From: Kijo Park <red993688@gmail.com>
To: tglx@kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
	Hyunwoo Kim <imv4bel@gmail.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	John Stultz <jstultz@google.com>,
	Ingo Molnar <mingo@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	"Eric W . Biederman" <ebiederm@xmission.com>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [patch V3 0/8] exec/exit: POSIX timer related bugfixes and related cleanups
Date: Sat, 12 Sep 2026 23:20:11 +0900
Message-ID: <20260912142011.1139400-1-red993688@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260911090341.949101445@kernel.org>
References: <20260911090341.949101445@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I applied the V3 series to Linux 7.2.5 and reran my reproducer. The WARN
and KASAN use-after-free no longer occur.

Tested-by: Kijo Park <red993688@gmail.com>
