Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794333998;
	b=qq38/wWzvvnYI8VzxowvaNVF4OdUJXbTgOarBRwAROZ2pWeNzEMfIr4ZIiltgqM4saj0
	 OwSjNYrL60Mwg8yfnpTdDgR+kxsY847bF6mnOf4fBZNdSHPFS1kcOaUuJOIgk8xIbi0Tl
	 6gsheB35JWhwzyNIm2lRU8aUBSugGkooXQPNtnhNPr4Pb3JNJHnleBXBA0FWqS7/TRmyZ
	 xnrdDsxizRnc4++Y+JhgNb4w1gqyQgl5ouAAzNhyyAr8hIxtafT0rgz+fuztnO2lRassk
	 95jMxH6pGy9DV5DEK4WBYnDRmHS0jzUjY2pMNO5kv43xwh3cpVI/9y7bM3HHCiCJwLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=GzOxYTq7EHxh8VUxt5+RHjpcCv/SzSEIP5xLxXIbEDA=;
	b=M+7lhamb+eJ2G8AU1fNb2gmhC/uvNWWYw+3n0gez5Z16STNVMwWGkvCDNAZYkHbNqmqi
	 PfDwZDyRnd8MOikyhOzyUSF3TdXxgymqkvOT7hpQJARkJo3mcsFSuoWFYIGkW9s/ajbpr
	 dJFtEjnWVqTBYVJ8BdRkAxYfFZAkw6k0p09S6YC2nqjSBu9JrLAIfdDZ4zHKDfFIYqZlj
	 0Z8rUX0AMWBQ73GOER+ANfjSgI4UJeF3p7YM/FDV0YTZY+CUnjo7qh+1KM3f0Cfc/SeRn
	 4NC1Q7SMYOBdhE9D00pLPssv/+fmObNnEW7nq9oO9hVrqskNZFzUDcUDjvPkRSVoBVg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zx2c4.com;
	spf=pass smtp.mailfrom=zx2c4.com;
	dkim=pass header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20261015.g header.b=a0rPiWb6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1E960A2603
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:06:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F1E960A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zx2c4.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20261015.g header.b=a0rPiWb6
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c49c32650adso164639366b.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:06:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794333996; cv=none;
        d=google.com; s=arc-20260327;
        b=JbFP1mIpjvAUbpgfDoFe/qHtYKpqCzCtnHkjG3JhbqQWplxP7F+fElq/wNRHKwWVX8
         d+iaZSoT/mK2ViFV0StMkGAAzIPfRhUEPuWZaSYkb6IyVChBcEESevkjM2TVBV3lmjsS
         6sJCIvAh4RhoocW79E5qtspXa8oJ9ViwRX85phb35+ksJb2DyGeCJF53Z3ju0paM3ekU
         A4hMc2gTA1A7lc/sMEqjz7/jpW/NYPKCiC5rV4pgzL6TDsVj4WUxIKnw/juc+eD2IQGj
         pxXercO38MUN1TOJ6SH7884smlOo2RVumcKhFq5MGQwY35r8I6sgwBZppT1jiQYvdczk
         80ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GzOxYTq7EHxh8VUxt5+RHjpcCv/SzSEIP5xLxXIbEDA=;
        fh=EavgocCTUw00jhOFzI9m+GUh1d0Az5XoRiIsDWP7l30=;
        b=mGfr1tfxVNfuwKuWs9nm8JO+kpVwk0ltYSA6nxAkH/Z9SwX6KbblfIyN7oQFibDr/h
         ibtZZrtMsrGnbb6DnNotpozpKhOf/mbI8s9UomKBpDjrfWUw1GmhGbhT/OAdOuXcJ9G+
         zUrs0qRdPmbd+TGluc3YWVZfA7VLf9BP1/DYgJTha2Ksf225DV1n82UEuZtFaZ9Qy5ey
         7m9QdWynpje0YggTyexaasTv4Rts/eZ45S6LPzbaBRJkp5luk4jmw7M0t7+pBuEM7hwa
         y6vX5iF+e88ULLbCspHCdf8FcVi3alatKJ1aWwbHq/dY2ZAYLhaeyVeRIdoSA3+Rt41t
         dVzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zx2c4.com; s=20261015.g; t=1794333996; x=1794938796; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GzOxYTq7EHxh8VUxt5+RHjpcCv/SzSEIP5xLxXIbEDA=;
        b=a0rPiWb66uhhooRgzJb6oHoMppMYrookK7xJNcUPFqJzEdVi2grND7+FILrWsx3Tss
         DzH9+GbDDHk/x+Xs0CZnsU7ZqKbULUo8QQktzl0lJMGks0WReik5niHTV3KMUB2O3Sfy
         D0TBp9ZRWvTT4L/KdmoJXszwet4OBZFoF6w215gtaA+OvCgSms2uFRyFsjFUC8eraVVb
         rl+FoCcvVkWgCk7kWPlg+fID0tE9x9FZYeRYue2e/R6S5y8NmHODTwia47wNVYIR9JYM
         kKlylL8qVRUwEftxMj692gnTfUkAZbmXB8EFnYbgH9UbFsILIBp4ueE0excjSF9wT7Jz
         lPsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794333996; x=1794938796;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GzOxYTq7EHxh8VUxt5+RHjpcCv/SzSEIP5xLxXIbEDA=;
        b=SxZdeZh1mH4EN2YPa68MXaI0piQBrffXt0H3F4Db7amyYzpNQjVPtFQAqc4SYMzQdI
         5VIo1NOPI38qOD7Rgv0ZRkVKRF7KzVWPA6GL7rfFEd1XIpMxGBPPSCIU1pj8m2ngFHDd
         B9JGrin3MLF/2A4IIqbI/ETveB7piFVJAQVpV/2il4wsp9djfwGrpLYEr2APGCYsG5rL
         D+q3Ubdv4vVRXJr30qY0j5+pZC8XbgtSDmF0rphr7PR034nc2aICBiFT2Es0lCzuYa3i
         F74IPOoTuNaTn1X0+xxM4zaYlrnic7g4n9CvMmdZh9PKODVBbe7TFz2g0/JghjlVfYLw
         Rs5Q==
X-Forwarded-Encrypted: i=1; AL+hErE3hDr7DdFR/lpRDPsowc8dE6HWReXaud9IvqiYbWC8OHHuGoehvX6DB2utl8wpQAMDZXN0aQ+ePmxlneg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UGrGvLBMpAWX4yQ560NIvu4eOeZPlyVprLJ4b3JPYL5U7SS3Y
	ipQ3mGNjsZhPIuLOgxACu26NxHTkOuSegRhoaSIWS0/kXQn164Ts4cVtW7sz+hXQA1BUcAnb+88
	H/AezJpOIU2nHO4U1ZjmENkGGzHrT2bI/Y2KEpcdl1/s=
X-Gm-Gg: AYBFou2zeMQACXR2q7k7YXXNsBpmrBCnvU7LATcH9RR+YPL3W+HIxR4cayvpQ9j3U0U
	FQyfuNsh/JWyFItsAgkB/12+7jiwzRSi4FMsIzZpSPMkQ9PowY4Lb9N6+QL9oqTuyWKhR43mfAS
	2zoaCUy98zk1FCkc74Zw1LRPnFassr1zsrWVndPhyzaTiepTiUeat+q8tOQcntqLVcs9z1lATgD
	PafWFWqWJKwbplbMKF0LEEOS4uvhYmIsnTKN3lrhyMVY2q72oVHY+33/X7WeQf10pizpvs2DJQr
	rKMG/Q2hAFqQN3pCvBwDUTO/Q+BrxRETXCeUMY7OzPvDNOHoCYSxI60iMDQWDvP3BJ/2dMc1vrr
	wFkN6/qXGsJG+/HIxyPqjoIU7NDy+ME9vSKahvl/JY9fXoKF5gSwQDJh4Isep9GP9TkFsP79CWg
	B2FZn/hxIstUrMFwvHyQIYvScelAjvThCT8cD/t3fRQPJl1dTDVqxOYkM2LXKNGyBZA4OwJDNPn
	cCc
X-Received: by 2002:a17:906:1248:b0:c50:4a70:b7f5 with SMTP id
 a640c23a62f3a-c504a70c977mr195279766b.17.1794333995965; Tue, 10 Nov 2026
 10:06:35 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105141006.95083-1-alex@badcode.im> <20261105141006.95083-2-alex@badcode.im>
 <avNM9dfdW1uULJUf@zx2c4.com> <a979d36bb97608275f9f8884764afd41@badcode.im>
In-Reply-To: <a979d36bb97608275f9f8884764afd41@badcode.im>
From: "Jason A. Donenfeld" <jason@zx2c4.com>
Date: Tue, 10 Nov 2026 19:06:25 +0100
X-Gm-Features: AclHuK-z5kRyS093UsqlUbVg9AjVDqYIwR1bFV-l3asgu02YzQT6xz0LvKo0raw
Message-ID: <CAHmME9pMKKw-1dQRG5OEYrGA4K0GGFbpvN3Go8ZuVKLuaNMA1A@mail.gmail.com>
Subject: Re: [PATCH net 1/2] wireguard: account peer and allowedips
 allocations to memcg
To: alex@badcode.im
Cc: wireguard@lists.zx2c4.com, netdev@vger.kernel.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Okay, I guess I was just looking for some judgement discussion, not
more output from the LLM. I'll look into this myself on the slow track
for a little bit.
