Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29433D955C;
	Tue, 29 Sep 2026 15:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790696667; cv=none; b=tee0yetqgTiIxbvTMQvCgbrAnW5Iedd6gUf44ir46lGlJgKC4DQppTwvS+dOYHno2einPKKb4JF4uumi/XH/3ELOpHj1BAA2QQugyuDPs4/5ucHbvQnlt0bPSIkTuzD/CnK7J8GXCOBDkxAN0g1MDN68huxGXTaYOVakilkUvfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790696667; c=relaxed/simple;
	bh=Ih+VYrfJNabfaFuS2j5WpbmEKYd+d+ZTr0oGOPqspA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=amqFVMyZ6ovQ076Gsm5yZvsPkFA3IERo6NkUcKTw3IRCj2Pu+FA1v1MeG8v6vBGlzvWrOQ6k42i3YRtRQFUkpk42H8iZ290D/sawGtmEgreZ5p0IcIBBHZSYgTUKwkyDDzLp8qIgd5ofc/OIv1jftm9bhskKMAlJc3oYDPVncOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I0GUmNUw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I0GUmNUw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5FC61F000FF;
	Tue, 29 Sep 2026 15:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790696666;
	bh=8ATwKM6CBa+lEmS+PAiMjYm9Mg++Rc16XqL0Se+4Nes=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=I0GUmNUw+asd8R2LsHAo6l13y8lXjwkT+MkdKYJviSyOncgijrLLe9pq+ky8QccXP
	 1WE3hYtGVYvzEvOnM1iSiK/q1ddyotl5txwuSHHDSf77Cvx+Vw5T11Vo5ymNe0vYI6
	 GslSrx2ii2WCbZhWqQymMA9fqqFLqePlc2iUkKSZDE0oacC4it9hs08i1kVCsH+Uje
	 eC6PeEeUNBSooUaW0Y0u20hPVUo4E/JKWw/hfj+Xg9rUVFBqzGz2LlIP3Me1y/jKHo
	 7SyUn8gtOzwv/OmS9xUB0jUj6OAkG6sM6bcbRFSUW6fAq3fYfA8L0K2k5PcY+Jtuzk
	 DnnEOTZhmXeXg==
Message-ID: <c7d290e0-212c-470b-85c8-59e5f6628454@kernel.org>
Date: Tue, 29 Sep 2026 10:44:24 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/3] dt-bindings: arm: altera: add Draeger M48 dual-cpu
 board
Content-Language: en-US
To: Petko Manolov <petko.manolov@konsulko.com>, linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, arnemaximilian.richter@draeger.com,
 martynas.grybauskas@draeger.com
References: <20260929134058.819371-1-petko.manolov@konsulko.com>
 <20260929134058.819371-3-petko.manolov@konsulko.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20260929134058.819371-3-petko.manolov@konsulko.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/29/26 08:40, Petko Manolov wrote:
> M48 is a heterogeneous board made by Draeger that is based on two
> independent cpus, that are monitoring each other.  One of them is
> imx6, the other is Altera SoCFPGA Cyclone 5.  The latter is booting
> independently off qspi.
> 
> Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
> ---
>   Documentation/devicetree/bindings/arm/altera.yaml | 1 +
>   1 file changed, 1 insertion(+)

You forgot to include Acked-by: on this patch[1]. I'll add it when I 
apply it, so no need to resend another patch. Just a friendly reminder 
for next time.

Dinh

[1] 
https://lore.kernel.org/all/20260928-quantum-cuscus-of-jest-1d2f7b@quoll/

