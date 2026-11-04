Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793799719;
	b=f3J0LduwC5tAd3vHRRhqjKTDw9u+NLQig8qQZK5IFo8YCwCmFSPk+h/yEuPM1gHopYpE
	 x2PGcwSMBGwECdoelwtDdvSZOybZCiwtMYPJmr4RZ8FVD5UIkMgvQSryTUazZZZ7DxzGG
	 FjUfHSHlHFe3bKEqXCo+OyP0AiJm10ltTpeUHIon3PGRTn5DwLnzkzYYxmeWrsn7zQnCX
	 3r06HMhhpPIhm6g+Rm75uZ8hbynbD+VTbA/EjY+xIQdVQF2fX8XynGuMmMtod7YybRU6w
	 kuZAn4Ksmc/5m+m8kJ/EC6RNEy2aD1/VaUdPMZivnh9QBbvRQcFCINQZ8+UHhwshOSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799719;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4IqEotgPDT1hegyi7/J8DGunAd5SP02PqdK9DhD9Exc=;
	b=YmAQFF58lUhF6FQo7jTjk3Qz+ctaIJGXh/Jg0thJocbQmeQYS4f/UMmsnFiWMOMxo2Gz
	 NAm0pojEew081SHJngbPrMylQjmT1wkkO+VKvlZoy4GIiJjMZs96nnF+Dfn3H3VNdlny7
	 aHF2faC0y9mpvPZuw+Aq1PvbG7Ba7ugXcBv0cYS8ZMOgV6mI7RumxwVxLNSN1j8SdT7A5
	 tUbnWlt4qsUcQl76iagNZiFG59UGY99Lypew8qkT3VxO9bKgHsHWDlmiOBSD2FG4eZ7q4
	 9SxgCVOrgxXl2LqHFcuBMNFK21kMK9JNICGszkIzVN2yfAbkf2d5u4KMCyyoDyds8YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b="x7+dXt/a";
	arc=none smtp.remote-ip=115.124.30.133
Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDE9606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:41:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EDE9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=x7+dXt/a
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793799714; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=4IqEotgPDT1hegyi7/J8DGunAd5SP02PqdK9DhD9Exc=;
	b=x7+dXt/axRomaaLnDtxGwv0ARtPPgLy3mMAyzd0gzFfLYEcKpOMAo2ddE7chN1DeBhZkdKMDunke6Ffec9rw9plbYbpEVaLWKcI3bo9FeZiTWO1bWD0g4d9TsYH5ItyGvSCg4clHHu/p76rigmtFAmyCY7htXfteVvXHVo5yTfY=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R711e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XE5r9Xj_1793799708;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XE5r9Xj_1793799708 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 04 Nov 2026 21:41:54 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: pratyush@kernel.org
Cc: graf@amazon.com,
	kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	pasha.tatashin@soleen.com,
	rppt@kernel.org
Subject: Re: [PATCH] kho: Skip zero-sized bootmem areas
Date: Wed,  4 Nov 2026 21:39:56 +0800
Message-ID: <20261104134147.1695-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2vxz8q38lqp4.fsf@kernel.org>
References: <20261026131851.9942-1-cp0613@linux.alibaba.com> <2vxzld7kpmmi.fsf@kernel.org> <20261027074028.13042-1-cp0613@linux.alibaba.com> <2vxz8q38lqp4.fsf@kernel.org>
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

> Mike sent out [0] recently which should fix this problem. Please take a
> look at that, and see if it works for you.

Yes, that covers it. The zero check sits in the one helper all three
allocations go through, so the three cases in my other mail are all
handled and my patch is not needed - please consider it withdrawn, there
is no competing change from my side.

Thanks for pointing me at it, and thanks Mike for picking this up.

Best regards,
Chen
