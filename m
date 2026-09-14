Received: from 0001.3ffe.de (0001.3ffe.de [159.69.201.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06342F7EF5
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.201.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789367629; cv=none; b=I9oLVqr9y2kX8lbSgQSi5OKnxUbMoabqcEMM6+nq/R/od5aUe9s+WSF2PSTxKjYWaSC4nEPkS4dK90Mb0xTSUhdaDrmqmpcErMv6PNDmNXaQepDQzgTccA+goV/ohn+YJn5qWLk1L7ErYXRn4gq0xeKjbE/B0OcyPtImSRq1KqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789367629; c=relaxed/simple;
	bh=uz/zgmqy1rIDFTBJoxe11CkT82ASoa0317D8mWpjnsw=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Subject:Cc:
	 References:In-Reply-To; b=ht+hc9QxOhjZa0J2pcZ1Idc4oLL1KRLPlSs6tZ9w4LJevQ8+ojffKkoCD7OhA8V5OPiXRV+eNHrgBV8mJZ5zSqzOVTGLg1J2hRmLxMpEpLr4JLlghFcvyhjqDjX2Oj24OvLj2XqGImOmFk+wW2wYHpQnrORXz5oKGdF/fE0YwAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=walle.cc; arc=none smtp.client-ip=159.69.201.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=walle.cc
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 13202132;
	Mon, 14 Sep 2026 08:33:45 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Sep 2026 08:33:44 +0200
Message-Id: <DLETVUMUX3AN.3SSH7NN2CKAIU@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: <takahiro.kuwano@infineon.com>, "Pratyush Yadav" <pratyush@kernel.org>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger"
 <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Alexander Sverdlin" <alex@sverdlin.org>
Subject: Re: [PATCH 2/2] mtd: spi-nor: spansion: Assign .fixups to
 s25fs256s1
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20260914-s25fs256s-fixup-v1-0-e94019455c1e@infineon.com>
 <20260914-s25fs256s-fixup-v1-2-e94019455c1e@infineon.com>
In-Reply-To: <20260914-s25fs256s-fixup-v1-2-e94019455c1e@infineon.com>

On Mon Sep 14, 2026 at 6:50 AM CEST, Takahiro Kuwano via B4 Relay wrote:
> From: Takahiro Kuwano <takahiro.kuwano@infineon.com>
>
> s25fs256s1 has incorrect SFDP entries, like s25fs512s and s25fs128s1.
> Assign the common s25fs_s_nor_fixups to s25fs256s1 to fix its page size
> and sector map.

Do you have an SFDP dump by chance? I haven't found one on the list
for this flash.

-michael
