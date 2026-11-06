Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793990212;
	b=mw/j1+9pV883NP7UjScyUwJdVo11Hj+nCtV0hGXau6R9bm/LirujhxQkGCIlZ6sjnk2c
	 NrhqmLCzDswOkok4tUjYfMqs/NiJVEEwUZkMawJ+DZnOWVOXc7EZ2n/v6GZxIVyreXeae
	 KytF49Npe13C1Y4YIuQzpjAD3A4AwPQOM66+sPUSP9tsogCQRy8PFqPyhtdlW1C5Gp1AG
	 KV8mA3xCJHoUwMoIn+z1vHfKYYatUbORnWjHi4eoDsAS2Zh4xEE0cIoY02vzHhtAYcQxu
	 Nl9iIXPq0B3xMRzSMDoppJTOUTHNuKz4z/6ZqpQoVH94luq9sBbQrVGP2yj1GA0qUQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793990212;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ner4HLqt8P3aTA3rkqClyXoS9WPb6d7Nw2R94iR6ruY=;
	b=eoBXLLvCYUC+Aev74rRIdBX1maRTwvcoyjGtan3bXVmyAcqbmS0bqcHpAr0SOPDdTqZ1
	 lFA354O2Q6pZsn936is831tdFoVf2HwOMs41ZjjNApu2uO669LGRljMpV2cTWt4wA1vwo
	 hDmHv5W/y3lTwzeVAGBBQX7sdZHlnh0FrY54MCV0ddQzhjQ6eAYsGwNdzxqrquL70HQ4X
	 A08LFVVFfuTLmN5/P9VzEfNZSM0jgeviyn2Itu6i6FsAfuHRKQffa4ORfhHBl7SUC5kyO
	 QiX5zupgRpSG8ur0qlFJs03B2Lv8BLDyHAuVE3pkkbOdvOJ8tEnHiLF/7SlVj5t88kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=QOFmY3f5;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B77C7606EEB1
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:36:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B77C7606EEB1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=QOFmY3f5
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 295011650;
	Fri,  6 Nov 2026 10:36:48 -0800 (PST)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B012E3F673;
	Fri,  6 Nov 2026 10:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793990211; bh=7ULSo94m9nkPCuWX576aB6lAnEnwhX48KblE/3XT8yc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QOFmY3f5TtXhb8oHDOllkyppL0ZWSK8FQJ5UPVoOGmLZT6wg6KGDCti0XGnB7OGhr
	 vaCZwTu7osM0MxpqMr9WYrSj8G6tLadtcfCdpDhKhuRKMn+Z+OpZ+EbIDnaAZWxURB
	 y7QbR9/kugsJ7MWHeRLU1fJ6X5tdu+Q/VvNbbjTg=
From: Catalin Marinas <catalin.marinas@arm.com>
To: will@kernel.org,
	mark.rutland@arm.com,
	rppt@kernel.org,
	baoquan.he@linux.dev,
	sourabhjain@linux.ibm.com,
	coiby.xu@gmail.com,
	bgwin@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jinjie Ruan <ruanjinjie@huawei.com>
Subject: Re: [PATCH v8] arm64: kexec_file: Fix elf_headers memory leak in retry loop
Date: Fri,  6 Nov 2026 18:36:43 +0000
Message-ID: <179399019202.2520879.12342583488895085376.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105125724.2283453-1-ruanjinjie@huawei.com>
References: <20261105125724.2283453-1-ruanjinjie@huawei.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 05 Nov 2026 20:57:24 +0800, Jinjie Ruan wrote:
> A retry allocates new elf headers and overwrites image->elf_headers,
> leaking the previous buffer.
> 
> Free it before assigning.

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: kexec_file: Fix elf_headers memory leak in retry loop
      https://git.kernel.org/arm64/c/ac302aea3d82
