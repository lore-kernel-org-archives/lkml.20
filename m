Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793682753;
	b=vJDaLZsW2Sy0PqN+aoBxQJav43wI2eChER0KtADaDv1ioHDuL5CX5CafDSgZshWHPVCM
	 QitijpW48QpJxH770ZUWMTOsXHFWueBJUAKMzO4CyqCHdeQMo7XyDCpzjK0md+SXC31BU
	 aSPe+lZold2BatInUyeXIL+iXbzymXVhj8WJhy/HbUtSifybAUkZzITfVTWjdJaLIlBjE
	 aIX8e9//VSlBuoMBLdQ8hpm116yEUvJIIEkmOf5NZE+3vM8xFP8jBQeHiR8uW4tNANzRH
	 SBY0OM+oxHxToiJF43ivuoRGrt41oPaNV4rW863XqBj/qvGFGKgxEDx5GW6v41MNtYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793682753;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:Organization:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=98Gn3SOXcBgcz2fGP/37f0Z9Rxhy4Kh56gat06c22LU=;
	b=mf/d0Yt/7Qxd4hRrTO59zCW5ZNsSQX/v4GvKS9xHFYXLReVtzzgD3tNe/rOpAIgUAxP1
	 qKUCx/wXUdXCUp5lo2aPup9Nqr4B+lpdWLzD0p8hWTbuBqkqbllaKn52keEM2ok85bjSK
	 PBqkfGr8P6sFTYPqlvWy+TTJBt2Ue1zLIL7m0qEHxQXfohoZFfiyw/ioAXpWv3oUnvTHI
	 +mu6G+sP7C89GyQ99ksLoOrTPAtyRWx4akjbOJTdGUAyIjZdZKj5LJwLzEqQcF42LLldQ
	 5A2JCQcqaPfDQj+285UN+86eiqjRShm2/w5GEaCqputvgEUcibbT6jzMT9Llko36qwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="l/na1ygk";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCFD606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 05:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l/na1ygk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 569451F000C1;
	Tue,  3 Nov 2026 05:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793682753;
	bh=98Gn3SOXcBgcz2fGP/37f0Z9Rxhy4Kh56gat06c22LU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=l/na1ygkNoU3dryiSarBu8D1eMt5hrSheOr1R0kOFy2OXTqYXYRj0zA8MvEaXuaH7
	 C4NXye6IK8bKku3wX45Rmwb6WXRf/a9jT3mYEJHBSEz27ArCzR925MPLH2IliNTOv9
	 kUkBwtIyLCMT5lKLyZIJndgKbwI0Awkh3E85DtlZ3iCwrqlHMXI7uagRZU+g/cjDGS
	 wlZ42MMvVy4aiAt4Yc9x+KIBEbk2X33CC8DHOxj31gHhc/YAxySUm39SNuFOcp62uw
	 WkGBm5tURPyBAzzeTuWb+me3OVjXNzj1lpq/bg0YAk2o3EmF5cnWCjRct/f45us6ku
	 NvduJ2zUXMDBw==
Message-ID: <fe0036f2-4513-43c9-8821-0d4b094cd4eb@kernel.org>
Date: Tue, 3 Nov 2026 14:12:31 +0900
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvmet: fix arbitration burst field mask
To: James Fantin-Hardesty <james.fantin-hardesty@seagate.com>,
 linux-nvme@lists.infradead.org
Cc: Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Chaitanya Kulkarni <kch@nvidia.com>, linux-kernel@vger.kernel.org
References: <20261030191853.1777683-1-james.fantin-hardesty@seagate.com>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20261030191853.1777683-1-james.fantin-hardesty@seagate.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/31/26 04:18, James Fantin-Hardesty wrote:
> The Arbitration Burst (AB) field of the Arbitration feature is
> CDW11 bits 2:0 (NVMe Base Specification 2.1, Feature 01h), but
> nvmet incorrectly masks it with 0x3. Use 0x7 for both set and get.
> 
> Fixes: a0ed77d4c9a7 ("nvmet: Implement arbitration feature support")
> Signed-off-by: James Fantin-Hardesty <james.fantin-hardesty@seagate.com>

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research
