Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E84553D0A8;
	Thu, 17 Sep 2026 13:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789652484; cv=none; b=p69xa/LNMqNPZdMsaTd/H6iTIyXOolwpr4B+hTx8biZbF1U2OUMpnbHqj+m3ITh/7/0Jdj8XiFDec0xdvBGNvc+G+uzmuRAJmuW2CKepTLq9ZHT8w6Z3qJDX3oYEv7cEhhUM1yrPsE8ai135sopxGYmOXP3wrQ7EnyFDUrLja9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789652484; c=relaxed/simple;
	bh=WXnbHCnUYR5s688B9EDCkVdUk9C84hOPHL2r2I0cRMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CTzieIPkNrNTs5X1n0/YdFqQsDEWKbQYK4BafCxcuseGB1QL1QXvmPuQgRXEFbOuhrOGrCYLH8hfzD/vuxA1PRg/uqp6+SNwZVHpnBYlZI1uiMF/IN4bfgybNY55UmVJrQgxBfX6PjpGn6faBmh3/ITZ1rDF2hTcEzC6fo0RQAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=kmCkZOj1; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="kmCkZOj1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789652472;
	bh=WXnbHCnUYR5s688B9EDCkVdUk9C84hOPHL2r2I0cRMQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kmCkZOj13qxW+S9TnLgN8z4faQzr+EEMKxY3glYI6AvDpyI0Xx2vRPsc8VVbLWAQL
	 9HpIKHi3DmVhIa1qZr7QjHxRY9hQJGI67VyY0p94wAnHdgHCbIsDEDi9DtGF0hM05O
	 R6P3aA9/6reVrlQEQ7g1bFgOFAwmoxEWHm3nydCvAyTr1jy5835DhLBXGN9noH2dKj
	 2o8R6pFOj66jXveiPN41+LlMFeXynIDk6QP9jFGFH4gzpuVKVsXoyl/82C4kUjBjkO
	 IBW/sjuATU2x3yib11NY8XjqTS25lHwlozNtmcM3UgECGFtFjs0Aj5jWxS2ZLsPHdt
	 EzqSTe51B4sXA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 90C1C17E01C5;
	Thu, 17 Sep 2026 15:41:11 +0200 (CEST)
Message-ID: <0e161194-aa14-4e63-b7c0-b1cf488203c6@collabora.com>
Date: Thu, 17 Sep 2026 15:41:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: usb: mtu3: add mt6595
To: rva333@protonmail.com, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260917-6595-mtu3-v1-0-a2ba7c230d68@protonmail.com>
 <20260917-6595-mtu3-v1-1-a2ba7c230d68@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260917-6595-mtu3-v1-1-a2ba7c230d68@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/17/26 09:32, Roman Vivchar via B4 Relay wrote:
> From: Roman Vivchar <rva333@protonmail.com>
> 
> Add a compatible string for the MTU3 IP found on the MediaTek mt6595 SoC.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

