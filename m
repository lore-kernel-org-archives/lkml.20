Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302624848AF
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789660512; cv=none; b=tfXQiCaWtypjoquPbqqJFfRhDGTx7pfHi3L6Csufs2x6c+ql++EQ10lzFhN/2iX5trdVE1Adb4NIWVf7yhUc4WoOXfkeDiu0T6RDhd6EQuwRbVuwys3414lwJCxeYblPWSenm8mrgGW5Mit7nMU+L4jNxPdU7MtoWHmN7lLb2f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789660512; c=relaxed/simple;
	bh=dcorJvyvwLxM79R3qMPxGItFr+hAbZqV9Iry+iaHLdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ORuquj5vNrJBNO6J7VhdC9yqhBZl55AWiQnlFuy0YUeJ9IW5Smch9flN6JDAWAvg0rg7ZOaQwTK0S2IKjbc7Y0+8RZyRgXTZAtxn5wyo3fQ7Ox/uVRGQzetZw3c9XRZUjrhKlOC9m1jpUmuOdbjF4rC5Xbtsz676Nh8mXwpjJKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Vk09EAKO; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Vk09EAKO"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 2504040E01F9;
	Thu, 17 Sep 2026 15:55:06 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id LuCdozkODj2w; Thu, 17 Sep 2026 15:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1789660495; bh=nQi1GVoZXVMvr39nMFIV6SvcoGVGw4DVsjmvd3CTeUM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vk09EAKOry8vJrpj0qarClvY4w6+mZt1raUR4YGTgDaApZKhRkDuR7fMi12dLX7hZ
	 TcXHs1dxgL+RB3LsY27JXyjSCLsqRYt7Xa+QmejdSC43Z/Io0R+7aN0lAAffGHs5vk
	 7y3dATBgVpLRcFX1gZegzLQVLh0ibdHaZdb90vdbdp19NT1qJkWVc3bmo9ND938B7b
	 AWmTDQnEbMIukPQvN1RZ2uPqDGk8UV/FNaQ4m+wd6jdwGT1yiGu6e2ynB8fpu8i5Au
	 nN2zBQEHpmtmxN2KEEt7pDvG54vBNU1uQSQh47kVUG1BM3Low7Lz1K+0KooWNQFLfZ
	 xyxytNpRbRTXP8Aum8e0vsaO1ibbi6ISdZJlFiVpptJx2XlKPqaJmZ+NUX+ZAkkNNZ
	 ccAHIiJ08NCSJde8PHOBQHTpuAR/rAkIA2uctCzvNpdxUFzCPPieNHmnbczhZrZ/bH
	 jaDPJZoVFUWLi7ce+Zb7JC4jOSlMkAZZUMuBzhCNhYX9ibe0UpegJyWlfDEMAWvn6N
	 qwB83c1iDJDolNfq1dl1CuaQPNu4wNlTEu6+OZmFand/Ter5pg8LJblykwqZbwnB2u
	 tDWFpSDUxOMr1sLyHu+exfIrYVLmpdYsXEEqg7Akfo+PP5K/IL0WY69mg5PfEmc8pv
	 JoTd9SE+YUf5trAoYUW51PcI=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id F2DE440E01ED;
	Thu, 17 Sep 2026 15:54:46 +0000 (UTC)
Date: Thu, 17 Sep 2026 08:54:43 -0700
From: Borislav Petkov <bp@alien8.de>
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: Dmitry Antipov <dmantipov@yandex.ru>, x86@kernel.org,
	Tony Luck <tony.luck@intel.com>, Dave Martin <Dave.Martin@arm.com>,
	James Morse <james.morse@arm.com>, Babu Moger <babu.moger@amd.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] fs/resctrl: Avoid extra call to strlen() in
 schemata_list_add()
Message-ID: <20260917155443.GAaqwNQxslErNUtUNk@fat_crate.local>
References: <20260821081128.19242-1-dmantipov@yandex.ru>
 <f7a73d18-25a4-4711-9d18-8b87eb9af7d3@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f7a73d18-25a4-4711-9d18-8b87eb9af7d3@intel.com>

On Thu, Sep 03, 2026 at 08:42:47AM -0700, Reinette Chatre wrote:
> Dear x86 maintainers,
> 
> Could you please consider both cleanups in this series for inclusion?

I see Sashiko is complaining about two pre-existing issues:

https://sashiko.dev/#/patchset/20260821081128.19242-1-dmantipov%40yandex.ru

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
