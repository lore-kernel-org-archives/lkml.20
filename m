Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FC74E2F0B
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790164382; cv=none; b=S4cbozK7oPQe8ZSnVesA8GRs9AAQE6I+8Q90RUxzlK3Z7Rke1M5Mwg9PyueU0ILTV3QZpZolW0UVBCHWxFK4EhB9OYpm0dmLmn52wOzIcmRo6xzZuNFfgw59qpxln1PAA+NWfkymCEMT49ynD5XErS8ASUxvOLLUMlQwDU7cX70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790164382; c=relaxed/simple;
	bh=F2lmUoAjfo9h+YnqRWnZGIPu+0W+o6EEbYJc1by4+7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ugg+8dXCe5noU2kPIbFEvh/TrgZMNkWKbV0ztgdUoCh5ZpX+bEtfEu4DqZeb8BooYJV+GZ4q5t8CcFq+oc8BN6pznyAcmp+Ce0kd/At/1vmrlAyVGOPV8WMOaV1HgmgFNgV4q4hM6snc8H8z1Y8ZmYQsG9zqxNULWij6zs8tlcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=fuStAAtG; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="fuStAAtG"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 071A0240106
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:52:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1790164363;
	bh=lWuEHByYW7PJ7uyRtCFsmzNtANJLIM43E0XB3a/uqEw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=fuStAAtGUtJzqWqcmpUSbJbW/JTKUgddsafXquXDY2531joRLiqTgqA0KCRIAyGw1
	 AZrjUUufBouNKFroAGLQeNyS1uoAthOKBExNSI+rDXR1zBl9czR8Iv2RIHwpBiUQ9s
	 BftzMVQ+ZzR1Kovuv3LGQ7lLGkT59cCpcTWcH/oNVitSNDizduMmLRA0nfSSIYhlgJ
	 thuUYxq+OwzVRGgv9cItck6IaHxGPNHdNqaDeMRcVsBaZkQe5Yf04+RBxwutcumPF8
	 HeK5wai0cA+vTMFS35cETC2Xkje2nYbk9jlnmSxXamf1s7nvwrCTzeZf/esIo0ZF7b
	 npojOoOCIuaRg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hqb1h5rjTz9rxD;
	Wed, 23 Sep 2026 13:52:40 +0200 (CEST)
From: Mateusz Nowicki <mateusz.nowicki@posteo.net>
To: alexandre.torgue@foss.st.com,
	mcoquelin.stm32@gmail.com
Cc: antonio.borneo@foss.st.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lionel.debieve@foss.st.com,
	amelie.delaunay@foss.st.com,
	patrice.chotard@foss.st.com,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: st: fix arm,smc-id of the SMC watchdog on stm32mp2
Date: Wed, 23 Sep 2026 11:52:42 +0000
Message-ID: <20260923115234.142728-1-mateusz.nowicki@posteo.net>
In-Reply-To: <20260907091400.55954-1-mateusz.nowicki@posteo.net>
References: <20260907091400.55954-1-mateusz.nowicki@posteo.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Alexandre,

Gentle ping on this fix, Antonio gave his Reviewed-by on Sep 8.

On current stm32-next the SMC watchdog still fails to probe on the
STM32MP257F-DK:

    arm_smc_wdt watchdog: probe with driver arm_smc_wdt failed with error -5

Could you take it for v7.4?

Thanks,
Mateusz
