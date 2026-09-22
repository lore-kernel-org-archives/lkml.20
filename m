Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA80F47D93F;
	Tue, 22 Sep 2026 11:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790077593; cv=none; b=rb3eDm0zLygm9m7pdJ0LEpkE3SYRjc8eTgi3mwFjghut042XJ6gkGbG3gBuedoy6x93/buOxirB/q4ml6CBn1Cooq0BR7lTadGETlNaN5cV3Rw3gsfZ0T9QdHEBVOO4hkYHcYqFnP9qFzXLSvLl+2wN2tZecdKhXEbk68LjKPCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790077593; c=relaxed/simple;
	bh=9gVIODxYw5hN0j770XoeC/JEiqFERg1vIPBvUxfQU4U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oyltsKCczwuwk08ohihKsss24OiHjRR4mudRcmf31oKZyugHhUyD2GXgN8ZwiT+UM8rzk6fKrzoRywKc8AoJCcq850Gi8KDRHV5p9rtmYejv4rD0b0ni3KyMO4MXX16J+1zp6xOjGIZTms53eNgPBL8y5A8LtYqKIRs+RCQt/fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=WkrWxP5/; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="WkrWxP5/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790077590;
	bh=9gVIODxYw5hN0j770XoeC/JEiqFERg1vIPBvUxfQU4U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WkrWxP5/jTaj4Svij3y9q5znIoayrfXGYGTse7KZQvIGo9RTOiFxiJpbW3rv93Brf
	 RCDHzGOt/ue6AI00eDVGxcPCiwmgZ8zxsEEuIYUWwpDKGEHeHW8xmfd1c+QPnwN+bl
	 fBDJZhg7IIE5RxV06q9WkJHgMdNW35zyEGzS9IALqPvHDZXxHdQye8vAY4tUDD8MHM
	 O97AFjQaRpqUJGK1tpC3AQeHP0lakRVz/2kywSTViiUnLtXrIlN0P5rwDqByIAWXvd
	 WeHmxpZcsqHZ292D9/0iC1om32nSznvCbcEAvOXcdHlgK0Ayw4Co/caF6DWcfNuaAu
	 7r5Sw1CdudTAw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9A2FF17E0515;
	Tue, 22 Sep 2026 13:46:29 +0200 (CEST)
Message-ID: <a3775b09-ed6e-4c11-8c05-9c3991b3ca63@collabora.com>
Date: Tue, 22 Sep 2026 13:46:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] usb: mtu3: add mt6595 support
To: rva333@protonmail.com, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260922-6595-mtu3-v2-0-71203a362b36@protonmail.com>
 <20260922-6595-mtu3-v2-3-71203a362b36@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260922-6595-mtu3-v2-3-71203a362b36@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/26 12:36, Roman Vivchar via B4 Relay wrote:
> From: Roman Vivchar <rva333@protonmail.com>
> 
> Add a platform data for the MediaTek mt6595 SoC MTU3 IP block with a
> quirk for single FIFO slot.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
