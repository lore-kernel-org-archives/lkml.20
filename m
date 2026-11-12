Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794524694;
	b=CEfA3t1VLhibBiZKuXK7CfGotjM52S7lXNoCdpXRIaEYUsq3PDNxaANp2rSZ6lOOlJFB
	 jXBlGGmcNII5Pu1p3BkYILhIfE9YouJnjrtH6SkG+9snkGRNrLi2MjIJPlHo63Hq42UXA
	 2Ct/AF3nmEa97ORXW9O5Vb4qcKnW6oJ3FL8LyyNJwbX5PxIXm1WDpA7RXfIVA4tPaX1Pj
	 4+sS9o5MFmw4WO17yHIZJxUkSzgVe9Aheit2Q2e5dkwGYJKGWnz34ZzF+bMUzBAzoD+2a
	 H984PV/KbsPlrUfYCvJtq+quMq2KCBUP7h6py00i7E/AnKBImhPEfr0FXl99/09VFdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794524694;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=f+UcsNuMg4Yueaqy8xslzDAXYJR5HIy/+gngqmLcoZw=;
	b=oRabGktBFd3iB5K4eH9wzjNXKIH7EjPldYOGaDHL0OAvS8iKA+otkaPA4ho6GT/MRdZi
	 Kom7Dcm4Ivxcvmgdt3Fsp5T6vnbJ/CKxxPBkcAHJlOg9YY46PJ1JbYr7k0mto8EasO3YY
	 kDAufU5vhfcs6tf63iKn9DoOqKwAFATK8uNIo5ldZPo9jV6lqV44V9qpodfPf1IxeOHjE
	 bgRw7VKFYRSePPcp+vmOyKuCOtrJzzTWtHJTcEO7pdzmlFukEAu8DbxNOhnusUEgWzx4e
	 UL+WxLeMVpsBdaOq9+0uz3yB0vTjRc6vadsljZ315hLEb9mvlBubGP8HDN0SZBhvx4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=sVVDHIa6;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6E1606A896
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:04:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A6E1606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=sVVDHIa6
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48dee593f18so341235f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794524693; x=1795129493; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f+UcsNuMg4Yueaqy8xslzDAXYJR5HIy/+gngqmLcoZw=;
        b=sVVDHIa6u23cm6n6Dj6idhGyLsWD05OKU8iAVIgjvD2Cr5tardQsTCl67SHlqhbZDV
         ERv72mVYEG7cWHj9u2+HJ2u/7NVHiPctQQtsIjAZw+mOXtt/ZH6QSTGpg6EN4dHF/Tmn
         6AnsrCJkH7wP7e9hdfUhRy33Rn0Zxb9zN1ipw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794524693; x=1795129493;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f+UcsNuMg4Yueaqy8xslzDAXYJR5HIy/+gngqmLcoZw=;
        b=Vfx6/HHUDd/U6WARzJkQz1ZH7IZLkIsfZO8QaA6Y3vvlHfMnt6zIj02c4I9zbhnXiB
         z+L5NWKglpaDBD7Ox/t6sva2FDcoAhEI76CEfNdB+aaDz42ZufMjtMkjGpWkusx5CDyK
         9/Eq0xepRovFED3L3N78SThUywX4slpohgVKOXPQsyIDitV8nbY4jJ3Hd1fa/QqiLg8m
         MYY604NTC5fahm/nVs6+EooSgWduI0zDBDKWMpcmLQFArDxR2JGzaXgDFaufWAm9nq+R
         7r9ujnWwCIWT5Igfpd+uTcBieh7O82j54pAEE/MnidY6f3OphDcsP/kG8zqBVq6Ig7qw
         hzDA==
X-Forwarded-Encrypted: i=1; AL+hErEuQ6GSqifwuNmmri8ofrEpdb2tqng0/FmnkHzLc7o0/GUAaLU4eRzsdyN+LCtiXfGTAUS+Gtsq5NBrDtg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9G0Fd8tWSJttIn5Cxzqp0iHDFHC3OUN3CcqVBTc+o7/gJ+xw8m
	KK5ZBxhBFEnJtRaraXzWyJarW/jhLNAVaKuGvap+s6usbwe93TemU4tmiqAQmheXrjc=
X-Gm-Gg: AYBFou0fibjXx5uwo2YdpoJM2jRd3cVJZbTyK+hKXlEWpUwJiAFknMdTI/nbu4TBAKi
	6nbBBn5WQvOx3dfBTDwQr9Lle6MB5nu1r3drfhbfhh6fNAoOO3uGGeGeGFE1/08Vi8hwaknTeql
	K/Z9neQYGNDtIPYzBB1EQUd58QuEu9yb+caHDlPtaNIlNjHgzkKfobKqcES0n8R+n+DRtcJzhqO
	4Y9/vb0zPxr2wBJrCLgs66MpjF59TU6P+ptmtjAC4bbugL3XbPF90YwSAWohmO8+QNyOS4rcuic
	XlxyCWX+MJ7xP99hAcEZFj1wABeFHIKOVY8TF4J5SmJlb0HX6KcX7UNBKRFZl0I+G/oPSWHARKB
	V80djMqLN/Ufpr2kxgvNbPSQTTwn1pCQWG5Z7bS9xewh+IK6CIaWtAnMThKif3JYRi81aVdfoSr
	SYo5qOEN7xA/nC/vpDbnOGO1oeVb+wSsMFKqnM6eRF0BqnvumSCXAVPI+DGyIyejIqFsyaGoarH
	rG3gBaydd/N0qt1CL7GecJ6RRVu1Ygi/UTEKLiC9F0t++tRn9vA65+R8KOUiGh+HUfiXdI/5u9P
	0DxskK1/Uox3UKL4HHm6wZAWRf6bF1rmxVKFhuJGXfX1u2U+8uA6/U1nzDneT/l/rcCV3doljK1
	ddLyIIf1J+uvjDMPQrXFLmSwa21pPidiCfzjMgZQYijJOm81JvM5nORbhPctXlhhvLYW5gWXOPZ
	9BLHX8LOYq7ihaRl9bWxIgs1BKadNcwl14SNsGPMycT8fs8pLHAZIXIdxzU2SEaRyupOvWEDRAt
	rVX7cU=
X-Received: by 2002:a05:6000:2402:b0:493:8847:841e with SMTP id ffacd0b85a97d-49c6fd933b7mr1670741f8f.16.1794524692875;
        Thu, 12 Nov 2026 15:04:52 -0800 (PST)
Received: from [172.18.0.2] ([199.201.64.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c603f4e2esm1589884f8f.36.2026.11.12.15.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 15:04:52 -0800 (PST)
Date: Thu, 12 Nov 2026 15:04:47 -0800
From: Chris Down <chris@chrisdown.name>
To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>, Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, Marcos Paulo de Souza <mpdesouza@suse.com>, Naveen Kumar Chaudhary <naveen.osdev@gmail.com>, printk@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 08/17] printk: Ensure consistent name and devname when updating preferred console
In-Reply-To: <20261111154816.71103-9-pmladek@suse.com>
References: <20261111154816.71103-1-pmladek@suse.com> <20261111154816.71103-9-pmladek@suse.com>
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
Message-ID: <20261112150447.cd6d7098fc4dfe5b@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Reviewed-by: Chris Down <chris@chrisdown.name>
