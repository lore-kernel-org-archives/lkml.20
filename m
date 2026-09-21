Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F21A30DEA6
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789979762; cv=none; b=md/4gOBhkn2/F8V69l2F3TNu7+8mXOvv18Slnk282IZvkw+ncbByvFuK+zm0MLggmgQYMgjy1ZJNenqk8tFq6qQZiQ1BUt3cuGoCDaoMHgf0I2w50WuGVCkpYyfPSwsZVrO3nmh8PD6a/loxfvx80zXv/kBb9ZaNbAUFo//pZMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789979762; c=relaxed/simple;
	bh=2yipzRfvxJamY4TEZR4EL2b4V+59rsolltYYECXWJJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K67aGjgnF8+6XvjYaQwZzbMXpicUb7zkcZyfjIAmAg5vf7t+vtn7bH5eie/9L1PxMdbORpArdlleesQ81EVZH0bvfVB/qn4TOYZQReJLat/bqrz1NK4N/xYkjcgqMpmdyvzwTQkwK2GltJJYsk/kaDt3c508ip+VecDiqIlhyyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=C2h1OsK0; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="C2h1OsK0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zSWyoAbSBO40r69UB/PnNFlKMJoroqefBV/j+DeU+Zw=; b=C2h1OsK03KGlhSbTI7LgZ3P+pM
	Ed4UR8d7g79BYj3sgdok4vQmMAtEMc8r9gtYaeG3dJhWdl5vFPI/bLItmurR8Ilxmk0o8N+fsWfiK
	+SarJzYh3wctOaArr16IVF6hdJCvaOl18DWrUZrksuB8M1J8t9nWCgrQMXHtBUT1aEwOZNrH8ks7G
	ihNjFoVIYVMWDxo5qgjs+6JMdG9G6XgLew7+QfGMxPl2EmrFBgq3pr/K8XOIZ/wAbZ47B/S0UktY7
	y174rImeJciQo0fpzndPKeGdReRaaHuEKJ7bm3dXDrgDvdp4XqMqbvwRWOyfFUJDBa+cDsNFrW8Ij
	4kdkUNdA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x8ZDK-0024F6-1j;
	Mon, 21 Sep 2026 08:17:26 +0000
Date: Mon, 21 Sep 2026 01:17:22 -0700
From: Breno Leitao <leitao@debian.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Kees Cook <kees@kernel.org>, Karl Mehltretter <kmehltretter@gmail.com>, 
	Peng Fan <peng.fan@nxp.com>, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: cfi_cmdset_0001: use assign_bit() where applicable
Message-ID: <arDoApVtVH4yXbKY@gmail.com>
References: <20260919130811.3041516-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919130811.3041516-1-peng.fan@oss.nxp.com>
X-Debian-User: leitao

On Sat, Sep 19, 2026 at 09:08:06PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Convert open-coded if/else with set_bit/clear_bit to the assign_bit API.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Breno Leitao <leitao@debian.org>
