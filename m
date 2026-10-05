Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9D64A2626
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 14:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791210300; cv=none; b=ZYv7chkxJRL5T7WDE9r8XQUdxugTM/XZ8rnyJkiH0dC9gf8ZVzC3u52+yGyAJxpNc2xdm0GUI87UBjbvbAWnN8sfiaA6aUq98lu7encj9lw+8ZL7ftzjzlk1OB0Kfl8kjtRaJQaxl3MzT8huTtdW6Bi5Lc+Bia0w2/0W6CkWKN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791210300; c=relaxed/simple;
	bh=9Gq3JWvyMOAXLx6ijyhDS1Isi/brJL11wAHMuFxk1ZY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=dAMfJjAnBzdyWZQAoTtvZeUR0H/+xK8PHGBT1Mm6syiM9ybzQ4GBTGYsnFLZcOWG2pEiUnF2dPTD+mhpRWpQzCho64xLbEPvHt2rcH4jQQ4kIULeC0ZXB8SarzC57MeDdvJuNFDDkGBqt+y28SBoO4J3akaX0F4nFO9pts1pOTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bitvisir.nu; spf=pass smtp.mailfrom=bitvisir.nu; dkim=pass (2048-bit key) header.d=bitvisir.nu header.i=@bitvisir.nu header.b=YjLDKAaG; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bitvisir.nu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bitvisir.nu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bitvisir.nu header.i=@bitvisir.nu header.b="YjLDKAaG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=bitvisir.nu
	; s=ds202607; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References
	:To:From:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WVrqfvj0SLPGShToHyZMpEksUmiwjatt9QkhwUdOcV0=; b=YjLDKAaGuFTV+Lqgf3b7VMUDqN
	5jdiQnpPosOuzLLkj9rihazgj2To7+RkvN0E6WpEhb8xor168fiU7KnAEO397I4KCDlouasqKNW0E
	ZzyzmHJo8Tg19qgQFEPUZvwRcjGUiG5O+8/Iod2IhWxdRPhz+3omX9hSFzTN3UrRM1Nk/aQx/lnDM
	u6z6VH86Bz1EYqxjBHRJ17DmHul7ehZPD29A//KnwBWfbB4bV7VG+ctUe3c3AX5Tg0UASYqUxIGcv
	yw4P1mWyArPPH7iZyN+SKSVYbiitkJzhYmVXVEnAjeSE3ArLczvf1LKx2Daun3XwTP15+r2ipfa3T
	C9HKziXg==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1xDjcP-005MYr-SU
	for linux-kernel@vger.kernel.org;
	Mon, 05 Oct 2026 16:24:41 +0200
Message-ID: <a4c7d99d-7c18-47a8-ac6d-99981cc3ae28@bitvisir.nu>
Date: Mon, 5 Oct 2026 16:24:41 +0200
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

Updated gfx to indicate modification of Stack to run Visir filters via 
Cache.

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

