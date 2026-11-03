Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699732;
	b=kiuN4GQnyoRnj7OWzDNwgkVqxp7VFbh/onO+5+vhZRcol5bkYZYdonk9Le2WJ/ImxIDl
	 d90jt1CKTTGZ6OnPa4uXHP5I+oattUal1mj3hfz76c0TJy9cfU0GOlCYbrCj880pawiim
	 AHrimrfVgKWiBV5SxDdZ3FFRN6tECh+yIbGHdYQYzeppfwt2eMbBscc5bElu0N9Gkqzep
	 OoyZc+sJHYQODfbonSktFgQUZlk5xMWsFaAfPo1TO1ZY0Wz1Wu2z3wBtv4RXROo+xtB+M
	 7B61hoQBBzAgiJwNPVlZlX1eW+JaFS/o5zOrLI4gtKTLmbvA+f4KjRlc7+WikbwC9Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/rEx9xsJMA/TnhcQ+QAyFw753KGccvIQfoQPHH40/e8=;
	b=c8dXaHfzuqBj3genM7ZYJQkspcxkHiHZuSRWjokuAjH3b6UCpbb4bP8wJK+yP9Dp2nwc
	 JyDGlx7hXi5V+ghoVjfwof0RqBFrT8t3iqHW/3V1Vy2mSnUfFbREGzZ8Eadb30sgJV7I6
	 7TXbJpGPg4hVZm1tg4UMxOb4qGPmfrLMwDrecKRIsJCYYdCJbqZjcAVPti1LZN5SV4Q4Q
	 WN7o/WhFN1L//yPh6xJttd/FFovTgYjzlT90hJLGri+evk5i5M+Ssy20ZswBDkFfUgbZq
	 DjUIlUvQCFCMqLwA3MIgPRJPyJ4U4a3ljwdpupmdHpL4sWQjE/q6eIkvzWiiSU+kJag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jd3rrcZz;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FCB60A6F43
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:55:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76FCB60A6F43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jd3rrcZz
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e8246b13cbso33749855ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793699732; x=1794304532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/rEx9xsJMA/TnhcQ+QAyFw753KGccvIQfoQPHH40/e8=;
        b=Jd3rrcZz5YgR4MOcersmQYFB/he9g3x9TqjLKgTaZZn+hkIwnWUAFrC/1zS9i6EIx8
         V3FYNfV+RAd7JBcYxTjDUE1BM51jbx2o2pltz/7CHkYVd1Sd8PrGJJkHG/rzXXF+zU+S
         LARCTTgCD0t/+aj/MzcGWuJ0OHPO+gQ5DBCaBL8Xg472neQulMunSo12K0uf1kHWCbFX
         leA6gm7c0gdFjPrD0eTJ4fZQybkRExQg2j+2IZOlprqSpj/DSzjGg/CSDoH+Ux6+EKKI
         Py5t2GvZ8EekGw8MUMhdx5jFYOf+DBTv/T1s+E2tkVQP4EJ9+1WNDGQIncvbeCnMLovb
         ScLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699732; x=1794304532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/rEx9xsJMA/TnhcQ+QAyFw753KGccvIQfoQPHH40/e8=;
        b=SJYi9SkWO+6EIjLrn7APHJJ1HZmaeEFWUju5h/azBcHNQaL3cR2pMpdDD2kw+dfcHf
         b3E1PFOPneznCbFKq4VKC3JXh6mVpRpcVbCg43dGkJ79OEzKZep2duOhDh/D6ASyAMJg
         WW5fqHhKvurxkbzhPhGK9N4H59evvcA9BM+VfBW+NyqQByzEDJOXd+IxkHknB5mq+liD
         rg3E6h9HTvXaPL0+LaU8p4iJSomB17QCP50mpMwO2ZAM/XcIKU7L3R+EB5Hx6adXpczi
         mBoz2AgAyF465HQn54/i+0o83U3DBpBqZBb5aG9RYR+KnbURxo0Mp/o284qeki/QaeO7
         OqjA==
X-Gm-Message-State: APuU4Z83W34w+kwC9G2G+cS4m3BFwlj9pUWpHICDlv9gMpck17f3hEEF
	Hr80YVouIhisIEAr396yd83W3WT50TML6V9yT1/lSRlcMvRch4r6zgtw
X-Gm-Gg: AYBFou2xZbS9Dnp0kynuYfoV3hcEh91PTkK7fkf1pIzMHdzqzOL9lBxKI+Tl958vlkD
	lnGHGH33iFxlcFKN8MoNiiIZu1SESjDRTX2asQ7x2VmK6h8p4Eik+Cp6afgnnAnbyyUcE1T/8gy
	JCLq03bHVMka/GO1JPJvCquoDJF8jelBuCEo2nD5mbg5zUm93MHtRY8GeLoU4ej68QMwCQ5Dfnv
	rl7cxbcsf+TC3vMAqowqN/3XY6LhWMmGlvWxTmFvvN7nN1a0Z4InJJb68LpBMpsyLGeZQ/dq/JE
	hf1g1o1G/sMiOivsDKsclZ7QRx/8vE//qZb0D+0CMQzkgF7Sz1WgKcFDmBaNRtUbbUb+C1/+huS
	LA1YJvMC8e9FIKQ8T96VW9x84m/M+OeZhjLUAI7DULARErQQno/Mk7OFi3xfGNred1CTpJFaFTl
	AiOXj0i6IstTTwOXqUl/jrZfDvnjnHJ1atbTmR1phvd2v0dHRBWmYSLldooT6YiPREqaEqIfqYQ
	eoEhXYtRrN759ok43fTTyVuFuEkZ47oBRWHGDZQDX6XgRApsXp/TgHFaus2PgjjScNkqFexLLvj
	ZK9ClUFoO1zHaIqTnOJi2DXOldbu6KFdFaUcZVFDec78wActixQ3kL8=
X-Received: by 2002:a17:90b:280c:b0:3ac:9669:846b with SMTP id 98e67ed59e1d1-3ae895746f6mr10607167a91.9.1793699731765;
        Tue, 03 Nov 2026 01:55:31 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c69d8e2sm3505470a91.12.2026.11.03.01.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:55:31 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: ben.horgan@arm.com,
	james.morse@arm.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com
Subject: Re: [PATCH] arm_mpam: Only program MATCH_PMG when the monitor supports it
Date: Tue,  3 Nov 2026 17:55:26 +0800
Message-Id: <20261103095526.238470-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <912dbaa0-0fc0-46fb-819a-6594538b47cd@arm.com>
References: <912dbaa0-0fc0-46fb-819a-6594538b47cd@arm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ben,

Sharing the outcome of our discussions with the hardware team and Arm
support, to close this thread:

Although the MPAM specification allows up to 8 bits of PMG, our
hardware team found that the DSU120AE and the Cortex-A520 only
propagate 1 bit of PMG. Assuming 1 bit was as good as none, and
without consulting the software team, they considered the 2 monitor
groups it would allow dispensable. So the MSC they designed
implements MSMON but no PMG support, and the bus carries PARTID only,
without the PMG bit.

Sorry for the noise again on this one, and thanks for the pointers.

Ping
