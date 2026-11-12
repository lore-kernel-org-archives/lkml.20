Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794524676;
	b=NfkKmm8B6UQPmECmTelZ3xqTD1FutW/074arewzmTT3WMB8z4wFzsZdfjNipCKuJ20U8
	 E/Eelxqgd7C/VFjOxkeOSF37seoQpxa0pVhr2n+cijbWUbbyXR+2jJeBJmjb37VBLN045
	 btK7bI1yeBiXjfW1+vt/4OF95HgO+GZvS8o7gaO1rhJ3oLW4AgAYeLKMNKeadoQdMdDGy
	 myA3Qc6pOCW3s0Ol8yWgQ2FvWLd0dXTj+mIVO3dZuDyESW3YcCY9LXTsSlKTiEL+FV/pc
	 EmlIC6mY7vcN5BxS6UGoHIbGhkm5C3gaKRk+wHE7V+defRsC48CoWA1yG1wjufHnDag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794524676;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=sBij7smZOouUHznKTorIJM3XynGFmmLDsT0WPy2roWk=;
	b=RAkvFg3WysFjj+muoFcbkIG+eh0kr0fFGdyz/ATvmRtFbkTfPbMB/xHXkCJD7f1YsKAm
	 IRvCApwfrOApjiJ2dmNgD8iDU6Ul3/rA1EuTHt2qNE2G6F5L1eG5godsNc1d8Q9rCa3BD
	 OStNeBW6mXiXjRGcJmkcRqWq67NdobuMLyoNBDiYfbk+rOzKtpSzWcli1XjI4Vj4LQoDs
	 BDyo3sulRuTWrn/s4v5AmIpija+guxWVWF3lRuMvySuraUuE2tNFKRmFiezb6UkgsnI1t
	 y1/ouTRWwBN/CpjYfOaas3IT08gFhtd7iD5Q5+W03IUx3CfyfSqiyk9PHuakf8UzcsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=g3TrqJRx;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A69606A89C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:04:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62A69606A89C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=g3TrqJRx
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-498f5fa5103so115629f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794524675; x=1795129475; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sBij7smZOouUHznKTorIJM3XynGFmmLDsT0WPy2roWk=;
        b=g3TrqJRxgRsnkLphS/3LDrRwOP3Ro7TfCsv3eiTwFgUpiIz4nvnt8+exbs24XvOIQE
         K8PeM3VaWexSyusrw4TonxZcqsQrmfq9HB0G20C575ZU5K/Rc7scmAUbeGrgtI9tsqbR
         /meyk91eh7FBgtXnj5Y9nt6h7uPQNFtupnekk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794524675; x=1795129475;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sBij7smZOouUHznKTorIJM3XynGFmmLDsT0WPy2roWk=;
        b=ivxDAjw0Gq1HYM7ErEKvwohdUGfkDtfWMasIuFjOPYSEEIzYjhWBgUK51JXZYi5M8w
         1BsE38MP6sCOGrwdllD1zWyBdrW5X/QgOXhufWxSebu3qtiWmPPH6iizkWdvgJll09Sv
         8ew55kzIo3neLMKNmJrmHSr0Iet0LwB7REQlE6jlTcWcOAtAT3TdOcnSS/juMR/4mTOX
         u5fkX2Gpg3OrCGj3iPCWJpdVQpTRMu34gPW5KYDNu3KZcQmmY4i0v5SNTZA2z6nHCLdQ
         U65WhVcgrbwKagJ9gsBM/2tcETaXec3JpVIhoH4j4iOAvXRMhwlOQMLavHDbFraiBCHp
         XZiQ==
X-Forwarded-Encrypted: i=1; AL+hErGieOJedySl/iKcGC7Zljoi99HPtnwhGYYICv9bVoRsI3E9hFLrCO7ELc4+Mvg5ipkZLGrQC1OV5fViKk0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8P99UZnI7wJVxFw/jaanNHRyUgGEqAco3CYadObGkFqhVBAnzP
	C0n840nymNJwScxX/kLJ5+SWauidPqqwgt9Ry+Z2FJOHLJfzlFpX/N2Ev25q9U/WByI=
X-Gm-Gg: AYBFou1WRyMhy7t5HpRxFmqZvJ9UiRmMVUnKlUFZHOy+rfQ1QELWDia2484UlOjaq47
	ozPQ+WHoTv8P0eXfAYzr0j0GWw5kXhR6lveNw+yW2JTokHrkCoSAB8XppQ0TvnQgzlEiyMr8aoa
	tzrOVD7LHzITekYBsJZvIiMCQuWC1J0UWrN2yCjmxicvmgTzH1LkH4AWzG9Yo+Q7+4eJ7x5PohM
	ikXWCvHya782LIumHzjZT9O4tQVl8fm1+WKRQ0GpEVzE2xMlHwTDXG9dmJG1IEb5GBG8ZZVgqpN
	7qEbLXVYgVH0lw7TcHsg+hNg1jBAsnCNX1NOh1ziC+yIbyXuDklnDhbsRXIr5T2uvNgwxFN2wFe
	+D5Coh8U3U119ucfSOH/YiJaLT1v4uTnlFK2JhYGvxL7kL/2qOJwV45aGVONGyOKviEvvlkh3ki
	feqS/y5jEpRjNNZ7vfuNNAXw1Qdy8GOrkdwKbRF8scSCL3QHmkBww1/RAWX6X4KXyAio+FiLxL9
	ZBAiY1S/3UYa8nNcYmaMISAuAox4YI2gOzz5UWsXRO4QTcCLjp/KBiLUoYXJej24jKobSuoC5r/
	yo0BwYXvZlB0BlFeCdlEUtaFODQvL2+tUoBaJa2PDzOmNoYk/p/4xpvRA2/cLh5sAEtPIRuwzsW
	kxICJfuLK2ryKm52SNmL0lquF4JWHWzX0GTW1thVEV4w4QFCVLSfi9O+DpnKyrfV47fWmiBFANY
	uBqApHkguielA+129Iwt2X3On5t9tfWFl2WMyeQQRBB9QIGfRMwvoxneqLoQ==
X-Received: by 2002:a5d:588b:0:b0:48e:202:6718 with SMTP id ffacd0b85a97d-49c71b5d3cemr1948117f8f.25.1794524674865;
        Thu, 12 Nov 2026 15:04:34 -0800 (PST)
Received: from [172.18.0.2] ([199.201.64.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608d10b2sm2213288f8f.44.2026.11.12.15.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 15:04:34 -0800 (PST)
Date: Thu, 12 Nov 2026 15:04:28 -0800
From: Chris Down <chris@chrisdown.name>
To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>, Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, Marcos Paulo de Souza <mpdesouza@suse.com>, Naveen Kumar Chaudhary <naveen.osdev@gmail.com>, printk@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 05/17] printk: Do not accept an empty name or devname as a preferred console
In-Reply-To: <20261111154816.71103-6-pmladek@suse.com>
References: <20261111154816.71103-1-pmladek@suse.com> <20261111154816.71103-6-pmladek@suse.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261112150428.860b24f1e2f53848@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Petr,

Thanks for splitting this out! I've tested that this works well.

Reviewed-by: Chris Down <chris@chrisdown.name>
Tested-by: Chris Down <chris@chrisdown.name>

Chris
