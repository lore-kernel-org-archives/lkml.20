Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793909081;
	b=hA+zFcc2b+/UD1MxuGL+j9JxCCBjVlSBLGuvzhwH8ib3vsQ+AlPtd1nG9uz+6jvN6xuO
	 6zXVfVbbGp+s19/Ln7OZRTxlTVsVZ7bjNSuvBo9YPJon2S0R2UY94ftbAE1neiHxK6uho
	 N02GyiM8gg73xFJiejj6Jry+fEnIxMTlgyL+kP+jsJaP1Rx932YVZZdjUpIEjCt4QHo91
	 SD9c9crse9JMwGiyS1vkmIMk/KkjN2bBu/FoJnXGsoEch1atoTarWzhUDYaNVrlmXzA4B
	 wfY17lYygpY0vpQMLbWvs+VzEBHnl95gpi6d/rcfES+E00TzZ6I4RJVHBA8bN6+iGuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793909081;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=0zytNgzS4LP/EjC+8OcTqhI1+dN2grs5+BG8DeIhBXA=;
	b=WRhsKldu7BHHUXOe9k2FlhEwMBUedeJa4ZwoV4kpM4xV7M2pKz23yuQhTIEvctChcYvs
	 r/imqEwSPi8G8v6rs0EutOn+orHVs3+cM2Y5RVLLT3ex6QWE5y7QRueFg0WKpX3FRIpV9
	 yeeWUBZJhyb1ednwAo6hL+e5LauH4zobwb3r5N2OIHcCIte6hEcEKk7bdceRXo5fM27oM
	 A0XGfuYrJzqmtPervZgHkOSKtXar7OICHt1kJmD9O89zQfV/+J7yt3+Z2I/Giw03rgCU/
	 MNEfb0x+gU1q89r9QkeEBlefMfbecK6CA8TdCGeKbGnfCwKC6GYvOgDMkMS7XV+0jrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zytor.com;
	spf=pass smtp.mailfrom=zytor.com;
	dkim=pass header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2026102901 header.b=Uiqtl3zw;
	arc=none smtp.remote-ip=198.137.202.136
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0091606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:04:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0091606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2026102901 header.b=Uiqtl3zw
Received: from [IPV6:2601:646:8001:6901:cb27:19ed:d7a2:a981] ([IPv6:2601:646:8001:6901:cb27:19ed:d7a2:a981])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 6A5K4RXP3307873
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Thu, 5 Nov 2026 12:04:27 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 6A5K4RXP3307873
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026102901; t=1793909068;
	bh=0zytNgzS4LP/EjC+8OcTqhI1+dN2grs5+BG8DeIhBXA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Uiqtl3zwTdsxk0+fffWOvfbdGvNkc06N7c+/7R9Qi9lZtK819/aVYvEwnhMCWOhhA
	 yizLK7WPzKuZjbl1ImVpcS5LvDQ7jN2Fntz0LWV9Fujz7vtpsrAjEPiFoaBtDKPA59
	 w4Rvwftop2+TBDqM3D9YqJIilhVtKHf450SGZb7rRz0UdTOi3XE4a8N97jE/uGNpzp
	 n2oacg39HW94H5Rw6hTzgQGrfvHhPxhi12zjN0Olg3Atzl5lzC+LWKLvfRfg/3mqi5
	 9MKQ0/vgswxrPVCMvl/5mLr74gYhSTHpnt4DPLPRS+ud5qHRp7kw50z0Y4QmMfXYoQ
	 geabvLcJdHdtA==
Message-ID: <d68f418a-044f-4020-a9df-bf6f7007943e@zytor.com>
Date: Thu, 5 Nov 2026 12:04:22 -0800
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
Subject: Re: [PATCH] x86/realmode: Use .init.rodata for embedded real-mode
 data
To: Thorsten Blum <blum@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20261105194836.405335-3-blum@kernel.org>
Content-Language: en-US, sv-SE
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <20261105194836.405335-3-blum@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-11-05 11:48, Thorsten Blum wrote:
> The embedded real-mode blob and relocation table are only read during
> init. Use .init.rodata for both objects to reflect this.
> 
> No functional change.
> 
> Signed-off-by: Thorsten Blum <blum@kernel.org>
Reviewed-by: H. Peter Anvin (RosaicLabs) <hpa@zytor.com>

