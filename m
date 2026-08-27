Received: from mta1.migadu.com (out-128.mta1.migadu.com [95.215.58.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B822123392D
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 01:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787794340; cv=none; b=m7ao+4sdbGMdLvWRpuc5dAswuq529vByw4jBI7qEDK3r19yY5v2Pb1YrhVRS4JEeDcoy/BpnXCTQOXZACZwqMKlrEM9v1rvUi44L42lRRhcCXODZg/a1vQ3Qg5b73HHHLlcT9PaLRY3aaM+SmV/8/P4ZqfjiudRNbVOoxTXp0RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787794340; c=relaxed/simple;
	bh=bfIP4/e7W06oTuSXw5/NP5V/tzKwcJV04EfDpQomgsE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TcQoDvUM/+Al1Zs4xV1Bc3NYFdEbKHWnrAiuHna1SBxpDl35smrzGtKoS4LlyP9B4t0NHgMsmpuDBR4/Z1XCJudwCckUPUpezUi+xcRkSnOYRIfvGFOPYBlxfpdNCWNfKewkC6SDPNFOmsAXfN3J5lhHwswcy5vYUiAm3QdwtN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vIGasbMa; arc=none smtp.client-ip=95.215.58.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vIGasbMa"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=bfIP4/e7W06oTuSXw5/NP5V/tzKwcJV04EfDpQomgsE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787794336; v=1; x=1788399136;
 b=vIGasbMaQ8D+SvwsM1muozHm/0JqtkcupXBCAAobE9OLBZ6I1PYrNsZN/CfBOsG7pURVYgfp
 rtVps3IJe6tNxwkeCpDt6PGKP3+6VCmenDsLO0ZefJuOgS5tziQVJPXNXDKO3gsNb+Sg4edggOl
 pDIOM9i9vTDcxN7kb9A58wsM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: from nixos (149.28.209.68)
	by smtp.migadu.com with ESMTPS id 92813c93afc7940c;
	Thu, 27 Aug 2026 01:32:16 +0000
X-Mizu-Trace-ID: 92813c93afc7940c
X-Migadu-Flow: FLOW_OUT
From: Yuntao Wang <yuntao.wang@linux.dev>
To: akpm@linux-foundation.org,
	jbaron@akamai.com,
	jim.cromie@gmail.com
Cc: yuntao.wang@linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] dyndbg: fix incorrect mod_ct value in dynamic_debug_init()
Date: Thu, 27 Aug 2026 09:31:34 +0800
Message-ID: <20260827013134.1486880-1-yuntao.wang@linux.dev>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260811121831.577848-1-yuntao.wang@linux.dev>
References: <20260811121831.577848-1-yuntao.wang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

Just a gentle ping on this patch series. Any chance someone could
take a look and review it?

I'd really appreciate it.

Thanks,
Yuntao
