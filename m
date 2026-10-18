Received: from mailrelay-egress5.pub.mailoutpod3-cph3.one.com (mailrelay-egress5.pub.mailoutpod3-cph3.one.com [46.30.211.244])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93309345ED9
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 15:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.211.244
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792335966; cv=none; b=qrwVhlKwlooca8TzYAOhWbf876/b4eGbIvVx8kUXVxY++P8tOiKzyWyQxjvPpxASOks0bkY6Cdt9cd06cEvSrSz3YUlLJxjhQlQlKpgSlQc92FqvYWGQx9uOr/MD3H1CNgVzGQj9JVzg8UFW1IvLYgzMgccWbjWv/wv9oQwBMIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792335966; c=relaxed/simple;
	bh=42GIB4EF1Cmol4K/G9B35dhI5HuTBXj4CSGbnrCD4+c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PKcmUG62v+11NloQTTYPS1Lg/qzXOt54jkHUN3CH+y2ytwYfKqZxlzRsoUOsChl14vHxfeSFO78rWy3KAhili+uWpM1v76kfV0DacOaNhBU52ZPgVfpPpz7k7BZf4p1jV7deeDwIkkJjf+2xVE5ZsJPsaBPelsztvifpG6OByCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=eRlcKfG4; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=BvruNTxp; arc=none smtp.client-ip=46.30.211.244
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="eRlcKfG4";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="BvruNTxp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1792335953; x=1792940753;
	d=konsulko.se; s=rsa2;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=42GIB4EF1Cmol4K/G9B35dhI5HuTBXj4CSGbnrCD4+c=;
	b=eRlcKfG4sQQGXsB5DSf8JsUHOamiYeMUWDVLNKUCdHr8matOquTWQJSfFRKUYbwQZZrTcACuoU6JS
	 n0OQ4IPa3zYm3eXbopk5wi2dbTAsazImLsVbf6m9A/aAG9k3s1x4NY4DfmDqRAFFRTTxvkeJVP6owT
	 NjjGwd+IeUHPWxrrPAKK0eWE/o6z8odrdkFTuTJFLl3A5vfsNsneYfTXOr5mYZaRRNAoeu1tjlmOES
	 xEguMVkyzPEWlIyhDvJS98Ks2ISt0dnYjqnuUWvt/bx5htWs7ZkEUsXh/0dMDtPvwYfgp0FsvLhvki
	 nF2cEHztGmEJjU27EXaG+agRNZcv0gQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1792335953; x=1792940753;
	d=konsulko.se; s=ed2;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=42GIB4EF1Cmol4K/G9B35dhI5HuTBXj4CSGbnrCD4+c=;
	b=BvruNTxpw062T2ILscHjttL097ild0JkfIrErF613G69TLVQx2znAvmL27FUhXdCZhpR0Tpc4M55z
	 ez6jjeVCw==
X-HalOne-ID: 690684ca-cb05-11f1-81a7-33fc7c51c1c8
Received: from localhost.localdomain (c213-102-77-204.bredband.tele2.se [213.102.77.204])
	by mailrelay3.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 690684ca-cb05-11f1-81a7-33fc7c51c1c8;
	Sun, 18 Oct 2026 15:05:52 +0000 (UTC)
From: Vitaly Wool <vitaly.wool@konsulko.se>
To: harry@kernel.org
Cc: akpm@linux-foundation.org,
	cl@gentwo.org,
	hao.li@linux.dev,
	hch@lst.de,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	nickolai@csail.mit.edu,
	rientjes@google.com,
	roman.gushchin@linux.dev,
	vbabka@kernel.org,
	vitaly.vul@partner.samsung.com,
	vitaly.wool@konsulko.se
Subject: Re: Re: [PATCH v1] mempool: fix min_nr exceeding the elements array after concurrent resizes
Date: Sun, 18 Oct 2026 17:01:52 +0200
Message-Id: <20261018150152.1464225-1-vitaly.wool@konsulko.se>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <atJBK6hWYh2AqXwK@thinkstation>
References: <atJBK6hWYh2AqXwK@thinkstation>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> [+Cc Christoph Hellwig and Vitaly Wool ]

Thanks for CC'ing me on this. How about we take my patch [1] instead since
it isn't prone to this bug and is a nice optimization to the existing
mempool_resize() at the same time?

[1] https://lore.kernel.org/linux-mm/20261013091408.1231786-1-vitaly.wool@konsulko.se/

~Vitaly

