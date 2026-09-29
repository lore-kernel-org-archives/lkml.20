Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5E3392C3A
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790653333; cv=none; b=rtQZdVmgON8VgQjLzlYa69fHNhDMzmEe4kJj3bAwu0/Qj72HZ4axl9d7g/Rsaay05gmCN+72sqxAtxwE0BIDSFO7wNz8pUXdL0mIiNVlCExob9UPt/0C2HXYktcl+C74xM3Hj0EHDTCdifO58gHb75qlXzo5TrAWumUXqTYKebU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790653333; c=relaxed/simple;
	bh=Oil6GhtL5WyQNmppabU/7LTIvdahLnkm9YDG+0XXqi4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=PNynVIJ9glUy1ZyZXH7dRrcyRlwpGMwlJxeW/htxH8nj/HAqT+C7ODEYLrslPJmlG7h9GmQkfZ5Hh3sbbgny/Hr5oxHsC05gZ/XHYbRJV2tDt7G+kCcbFDdwaPtrP9uYvkmNtUzG+mXGnPuClBPErlmwjWkZm3uotKx6H5/zMSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bitvisir.nu; spf=pass smtp.mailfrom=bitvisir.nu; dkim=pass (2048-bit key) header.d=bitvisir.nu header.i=@bitvisir.nu header.b=MMhD+qHl; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bitvisir.nu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bitvisir.nu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bitvisir.nu header.i=@bitvisir.nu header.b="MMhD+qHl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=bitvisir.nu
	; s=ds202607; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References
	:To:From:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lVzmNczI9Cto5WqdWmI7mAisNxqQP0y0iK2vOo171Xc=; b=MMhD+qHlUPHtvIVKhxs1biCt4F
	2GLrV5ei/usBV2QoQq7OPMciW/lzDBQemrdqYk7IqNaIolvDgAF5fqOF7CbkrkiMvkNZ2zRTZA/jN
	4wzpoV8ARevpLV4omTrPRxAabxH6CMRnVf1ywaqbDYCqb6k38ABpakH0HeCvqnSks0s+Bs1fErrEB
	NuJJme9ShUMfm2r2bxvkeAYVb3ayqgqR1gO848h+oPHvvH7lR2rE9DE9kXYPP1d0mtt42DHNCt32f
	mHApoSiPyBNxkBLhbYrFn6T+wLpj/kD0ey4+HHg8crFgqNw491pLcBQsk5HDwCjELFemqSP7dDqOb
	iy6htU5w==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1xBOjI-00EyIP-Ur
	for linux-kernel@vger.kernel.org;
	Tue, 29 Sep 2026 05:42:08 +0200
Message-ID: <07b34ea8-6eea-494e-80c0-338ccf9b8bea@bitvisir.nu>
Date: Tue, 29 Sep 2026 05:42:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Visir 24dB Filter = No GFX Card Needed (Supporting Fair Pay
 Philosophy Unity and Low Jitter)
From: =?UTF-8?Q?Ywe_C=C3=A6rlyn?= <yn@bitvisir.nu>
To: linux-kernel@vger.kernel.org
References: <584eb9dc-0582-4e60-8eda-b01e362f9bd3@bitvisir.nu>
In-Reply-To: <584eb9dc-0582-4e60-8eda-b01e362f9bd3@bitvisir.nu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Here is some graphics on that one aswell: 
https://bitvisir.nu/Visir_3-Bit_D_A.png

Den 29.09.2026 03:52, skrev Ywe Cærlyn:
> Visir 24dB -
> constitutes RMS, Constant-Q, Anisotropic in one filter.
> 3 poles, 1.3 cut down pr pole
> last pole negative in sum
> IIR typically for Constant-Q (minphase analog) FIR other.
> 
> Used via Cache, should abolish the use of GFX Card, and DSP card.
> 
> This is part of supporting my work with Fair Pay Philosophy Unity and 
> Low Jitter, for ITS.
> 
> Serenity!
> https://bitvisir.nu/
> 
> 
> 
> 
> 

