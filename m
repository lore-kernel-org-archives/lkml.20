Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793924536;
	b=c7KEnrVaQs8P/oR1fCSV1SbkooyFGAEaVnmcJW2ajAkY8vqsef9Y/2gESxCjYFWJ/111
	 5J+Wx95EAzq3FvygZnolMdmy0GXOcC0tiM3sQsbZ/EyxtLeSPFPGZm4owc77XYz2phuz6
	 2SgnwRpm4pBjgVZH9feVW4ljsgvD1MEHT5ZnQZT+4qLS+QY9d19jN3NUde1qy99XxCCNH
	 47qBAOXzxG3yoPY+VSXbQaFvv37C5hwMr0F52rQSBHuKki/rCPu1BN8TepoFkFOmFXA6+
	 3/ktlijjaMg5mMpMqnO6Sv0Ep7cCn1OgAjxmbhxAOqs3hlnvPokYqvo6WIavEGUJ/dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793924536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=sUCl/9f3hEKU1jzVhTQT9nv09NWVWMgehGoFAgkpdGM=;
	b=M/yQW6cJsaCjLjoWgTkeRrT5GnnLdQBQVlGR3QArqIvqw7bYl2RuWsAh3HPVabiDbVGL
	 gpVCmJb2Y4upMDjIO9gWQsCcrDeu72haVLofaDMe/mpDcInFCST0+L/TddI3wF4D67JMX
	 +ogFIO5A+paYp9Yc4KsT5lDt83x2e70cteb6vgKq4jaGfisTgF+3Dt/ef30FbjfpVzjOt
	 U+Y96lDRNMOevg7WocKx1kvO2ovJMbA1ww3z6dT/9Zi0yY06xyFeJAoYkIyRerV5ri5aK
	 L38MKRUTK3A/aGNl8fS9bRDjGUr+P8oDks9RiYH9J+qNalA7Ua7WPSXdT1X21x4Gt2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yAXWY+0k;
	arc=none smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDE4606A328
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 00:22:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FDE4606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yAXWY+0k
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-67bfea06a82so29750d50.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 16:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793924535; x=1794529335; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sUCl/9f3hEKU1jzVhTQT9nv09NWVWMgehGoFAgkpdGM=;
        b=yAXWY+0kGHY1p/NXLSl9GlvtEP9NhJRmDlqYEQh/mZZKvYegQ3M2Bpp9xHv2Dr7Px+
         jlsaQB4KNHNtKa5mn6EshVTqhoNXU7dpj+yqZgoSnDAD525hnhbW3XVio/knfFqt/gbh
         z4rSMEug5KI6vhjltlV/geCl1R5w9GcfhVT/AdNdc6kN79h6XQsTqBkSYgLJTUJBulH6
         +alGx7/gu1KW4SzwjTzl6n2cJsgFW1z8fYy4qJVsn34KjKgmljzaTmguG/h7c4GGOFqs
         ntjw9nR2ADcbqsZEzGV+ug9JDKCqKnuzzOXpK3tCLh3qcd6q3giZyarb9n57w8fDy8Cd
         OaHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793924535; x=1794529335;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sUCl/9f3hEKU1jzVhTQT9nv09NWVWMgehGoFAgkpdGM=;
        b=Oj3q01c71SN5UfP7dFT+L0u5KlujsfZSMTTXxqKAWl6ElBRHr/aUCKtxE/o6ign3hc
         vxqa2XceDF2wuTTEG8UHNbCtVXWBsv6Q2uH6ywAH5tIcD+c5HYUDObShZrUvw+HbSc0J
         qY4PYJRuVlofiW5qvOy6gEeMKYNXknVLkf3JMH7tM18ANium4beWa+OmRSlbzOQdEP0u
         tW5xzDdy7fRL5q9oQfzXMvTXwe0BQaATUGwNk1sgQAIwYrUR4fwRhAooZfwaLrF0X7iV
         ZcKceG85pNChoOUV5dEJzrxNaeoZUy2tSo+hmRxPo3UwYemo13o0RH6etKDFsMngIp7l
         WXBw==
X-Forwarded-Encrypted: i=1; AL+hErEGmz9jxdWqgMGvQzIQaDKtTfB6KYOJ5zM2/eYQptmQBIlvajCg1507v6cyDWnOBOEL9D6EiC43gEZloX8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Lry3MxHUiKueRcsZp4cyOvMVkpvJ5kVUElJ+mSDnVz+xtBSkA
	ktqQK6FMAXjoUp+yqYHbPwaG6NDe4tyz5BTM8/BcZIYQOTZ8C4YJ5bVg
X-Gm-Gg: AYBFou3IzcpHC0AUb2ZHajb+McQt39/SdBGbyUWEDxl8RxkJfwr+VcH7VmSe4luT2Z5
	MczXJEEYCYAxHQc4n5RXF2vhyCJpmCRnui4VFQ78FwUAg2WnAwqbFG7MZUG0ax/ILqrG7ytaWTh
	aHkoY/fVfMIzx12t/ZFmKiANH3N6bkJ1S3eAs/yUCXIcMzc8pIdI1cs19jaODFxjp2dXPZGymSL
	kXtD8ss1YEdWCBkQlaCgez1fQUY0iuBAACGoxBd1OJfff+bsfdfGsVMvq8ivo+69uE3sN8vp5Rm
	dJxb6d+5YK7URxR0CCBZcBJeCwjOCSzeLKyMhZ868UKesZNNgkSiJnbGWOB1kFlCFSxrEvK5Nb4
	uCwwTd8epruQRzHH07EiCQumfmcWmhOLn1CgGPi5iaYbTPzFOL6euiI1SlpsN9w2fzHWhoQIzoX
	NeCKWnTM6+UW3Rh0abaKUeNIdfiyXGLjSTPGLG5/EGSyefiw8lMOrU2OaJmom8j485HsRWN5RJ8
	vhNszTBnukUwt8kdK/nYLCX+2Woutg6ZQ/2d7AhbAvfsyKzMMkOepHNwkQm8SQBlsLwsZ3eIPAN
	jhp0/CRiLTiBaC4P
X-Received: by 2002:a05:690c:1c:b0:8ab:415c:d733 with SMTP id 00721157ae682-8b34178baa9mr3874997b3.7.1793924535092;
        Thu, 05 Nov 2026 16:22:15 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:135::7da0])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33f8394b9sm7441337b3.31.2026.11.05.16.22.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 16:22:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Nov 2026 18:21:32 -0600
Message-Id: <DMNP5QPGP3Y1.2V7SL7MODHHC5@gmail.com>
Cc: "Teddy Wang" <teddy.wang@siliconmotion.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "open list:STAGING - SILICON MOTION SM750
 FRAME BUFFER DRIVER" <linux-fbdev@vger.kernel.org>, "open list:STAGING
 SUBSYSTEM" <linux-staging@lists.linux.dev>, "open list"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: sm750fb: make g_fbmode constant array
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Francesco Giandinoto" <testata.nucleare13@gmail.com>, "Sudip Mukherjee"
 <sudipm.mukherjee@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261105211344.17532-1-testata.nucleare13@gmail.com>
In-Reply-To: <20261105211344.17532-1-testata.nucleare13@gmail.com>

On Thu Nov 5, 2026 at 3:13 PM CST, Francesco Giandinoto wrote:
> The g_fbmode variable is used as an array of constant string pointers. Ad=
d the missing const qualifier to clean up the source code and adhere to ker=
nel coding standards

This doesn't compile. Also, please keep log messages at 75 characters
per line.

Thanks,

ET
