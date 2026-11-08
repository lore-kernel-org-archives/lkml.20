Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794155732;
	b=uerH4hvCS9+6Ak0P4IzfATEhkOjn9fhmjUTdfPKB3i4M49rvj4vZ6nGOG5d5L8Jiwj4z
	 8sCrV17KtfKgfo777K8zDUHpIE9mk+XquJwCf6NKucSDRs5KxQuvugT11rI14P8LjYKmz
	 RLCP3gW5zfn5Bld9FTCne1DPY1lbtGrce2s/qSpwiXA/eVZnUWOGsx7qGYWg6tqXljE9Y
	 BAkXBSbiqywzP5Mq/eqWYOl++Q5BYUcApj3QPijQtIHuvxVvuwklLlwDBj2e8OZVHJiJ2
	 RaV99nPdnhpFieLMEwS/X5+/ZmrIF4W1OMHZ0YbUVsIBJ70psI/oFouw7uqzwCwzisw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794155732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=vUMpCh0+ME16WhcfFd1W/qBu+AGK/hHn1T2S4rTNv3g=;
	b=kc5ELYOrxUQkWiRK9+yG5L/ME1ZIszQ414KIatlVMTWt2qLHhxzDBlHDwdhVpGBbBJyY
	 JjHIfo6DUV77JTEBK8hWEaVH7WIYUA2EVQI/sKP9LF+LSLFmUy+en4uAn2Xcf3OO9t9+T
	 zEsV21hq3kCpTxD76T0NtC/ITdhXbu9fLuDHLwrxaYJemflqoNY/3wthyywaerg9sLfaa
	 sG4PoeZ4n2eR++CRHhJ7zq7xsvgbTInabpnBKPDccZw/GvbmLsHLpuB6K2rBre7tEOwTX
	 IuJz4auW38oBC7ykt/hLcKQA89RQsMxzRcshAmHll3IkZy+ZC2EUdunsT37y77GVD6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=VlzD26K8;
	arc=none smtp.remote-ip=209.85.222.51
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FF4606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 16:35:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1FF4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=VlzD26K8
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-999b2b06bd7so73097241.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 08:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1794155731; x=1794760531; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vUMpCh0+ME16WhcfFd1W/qBu+AGK/hHn1T2S4rTNv3g=;
        b=VlzD26K8SrGNunC/7F1+1qL2zKFYLs7VRim98OHvoJTESTsW4VX08zNaQT/vTHVLag
         OrMyEXZTEW+/k67T5plFhxnmGPwSPCoMvffgIicU9+Id4rF8dCtmzOJBGyTBFv5gp0Ex
         MvP3N3+qQHaR/3YHY2z3Xn4TmarvSZGWhlUe9Y3wL3gsFL6cV2yzmGFpOyrPoWB0/Zpy
         j6+k43jKp6GvlJ8dLZ5GYqc472yx135y+sDubhOP7rV/+YY55T9VUPLaQTPQJSnEbLLc
         LEQYcB3v4QFZJc40yu6SnwNC61U4StJkgIWobrRyeGVkyX5volN0hQ77m7Z1Ws4GNb1c
         Af3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794155731; x=1794760531;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vUMpCh0+ME16WhcfFd1W/qBu+AGK/hHn1T2S4rTNv3g=;
        b=uDSdR/L1CfOHSDIrapw8QYrq9cEj8ba/Nko3Sp6uDP0DF6Dl+5i7xIoswv/obPmDKe
         0/xl3vTIq/brY77IjrTQ9VsOfWImd4spg6EHgUGk52MGLSsw/Q2Sze1FHmBJSai13L1R
         UZ3tdtVbopdD495Cfa57G+ADg29tawLrQSX2MZaRAUDjEEKCe3sg+0OzNAd6bhMOHtn/
         dmsT+AdeaAsfUlJWAoVnTGlUw8qou3ewGCnxUdC0bAWWYhgk58HoUSFIaqZa6tAiGhM3
         r0fhGyTmf9SU2fxxMfjjH7phTZLST9COPZWdJR5ZMNrVu0imX8loLSyAmNDfpiPsbt5x
         U9yw==
X-Forwarded-Encrypted: i=1; AL+hErEZyU4+Ux9xPCm9N0hJAupxFPDcLrJ/ubsb/MH6iE/BBKbqy7cbjkexR2oI4XRkH00DZa1u5TKTrs2GrN8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+naHn9nDyNVfaSLHj/fsoTjfTCK3pOMk0c3EFWCr3pUwYs4Rn3
	pm5+2AJpz0Fe4CCfPHsHl7k8AN3liWnz2/46YUP4HeBZMaJyTFOstLrPJBpdKlAmzCs=
X-Gm-Gg: AYBFou2ITUG7MGQNKy4D46cWMwWk/ZjvSiG0RdmBFkLe13hD8bp+OO/cQkpFurjyset
	BorCPpC4P5PKADrRS2pLBtzUub94oAo++l20cjyrxkiUfXZQrsbcm8HvUUKxPH/+FDVY8nl1rqE
	tTTEnPEssSor/lJuTVvwb9Y+e2huaYk8SWpcefqlBGKqyFQSwhVlIutazMaXU/zm8Ccf3r5N9Ja
	bMLz2OzkeSslvQh7zTQwzpMUcwyfyThXZlh3+tdmIkoDQMnLbZBKLm/1buxtfzk4kb64BaqFHUt
	BZSe5I9QixU+3jW3EhXh0gALjt1fsGLLmUserBNH0plkrZTGm5gBtgyUmMvxDhGkgNncztOg3oC
	h6byVh7owqlO3vToJL6ebmG2TIEZPvisaW4P5KDprx7XKzkinlvZsD+blWLES+FxlAA/nxmcI7N
	9eLHF0NPn3GxxtzBSXKcec8tN3WC2+BRhxkEdfI3yeL8/IMWafbq+ZQ/DHkKHfpQzwRvdyV/cTS
	k2GUNKtjhEV0+FzFN+6MkUwl7DZKR3QUcBNkcuyLUjkMNWTfpZIvZS11nsVPcn3GF+pgiBrnoX3
	3qbTIyxymKUiTVhbFDKapSsVQ6I/mkn6nib7z849zAeL/H311lSNa8sdvcXKALrWNMrj9XuztqP
	MB0TchOVq9AI6enrG4OKLpQR8uRPdu5OcrassrXOYkSpOfBc=
X-Received: by 2002:a05:6102:6b0a:b0:7cf:61e8:c508 with SMTP id ada2fe7eead31-7d2db0bcd81mr562845137.21.1794155730709;
        Sun, 08 Nov 2026 08:35:30 -0800 (PST)
Received: from soleen.c.googlers.com (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d2db5ef806sm2095957137.6.2026.11.08.08.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 08:35:29 -0800 (PST)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Mike Rapoport <rppt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, 
 Alexander Graf <graf@amazon.com>, Greg Thelen <gthelen@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Evangelos Petrongonas <epetron@amazon.de>, kexec@lists.infradead.org, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261023054518.3258350-1-gthelen@google.com>
References: <20261023054518.3258350-1-gthelen@google.com>
Subject: Re: [PATCH] kho: check fdt_phys in is_kho_boot()
Message-Id: <179415569586.625723.12004410702455553565.b4-ty@b4>
Date: Sun, 08 Nov 2026 11:34:55 -0500
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
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=332;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=pntAOEp28rvpPJmjiHSWGEkBLb5e9psS4E+7JdTPPpo=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBq8KTRkK+pdagJG3uuwOjoIOYQWkYDjK1Z7kQiA
 uyff3mUlEaJAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCavCk0QAKCRC7dyhM23N6
 3nAQD/46TScYr5fNbB1l95VJdBlbmbfFCXWVTm4C/4Pc22h6gzpojjQSQyRcS68ZsbRODtMydmF
 QWzNl02NZS7CDiZYXl7kz7ZP0+fIETuQP8kHfwdJB+r6agGnF2lx82uuL6283oNWzVCwJ1RFlyx
 Rx8WsaGF2wmD6e2HW2OxhPevs7tjbytuUautMqdt9bZ2YurWVTcojCDhITzB6RpBW/2ZFMYbToS
 ubEQgkPjY2L4wqvywV5bvWsDwWjwmbHI6wgY5wPghqVm1KztgAnfDm2dRsPGhvftXGw4vta2JI5
 7AZWqYy8eZTamFmqjlYczr+NG/A4yPm5tKrpe5xnWzIjho0uyOcxOvio1eIZYfQqzIL9UPkEN0y
 m9LnNz5ROzzuYN8uU4ag18A9TDcoMCtLAfzrHk10Xc+G+MkTtKgcqMqSfE99OiYAo5ZWCg9Y7K8
 EQDHDOEljbZgrcE9yZQrfFUcVikND22cEbFAUFx8hqV6mW0qmpkq2PjMyc6iKx/qMPNf1jleIMA
 iph/Eq7sMIqOEojUUO4c6gM98NnbjIEdDIfIXp2zD27fxFURTpSC0admJ06ae8+M+NSzczMCpSj
 bu6i9WZkMBq1lfjIViJunX22yYZ39dyz53PEJGsNz7hRNPEz94UUaROONBl6D/6+JUSpGKjH/Yu
 OSNWBBtibvZWKyw==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

On Thu, 22 Oct 2026 22:45:18 -0700, Greg Thelen wrote:
> kho: check fdt_phys in is_kho_boot()

Applied, thanks!

https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux.git/log/?h=fixes

[1/1] kho: check fdt_phys in is_kho_boot()
      commit: 58c5852ca96c58cdfdb9646870b217fc54d06a97

Best regards,
-- 
Pasha


