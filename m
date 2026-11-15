Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794783672;
	b=X29tE4mgi3r8dtYFvOM+7NH7Ctz6zUxuLa8wpQk+Re8DWzWj0nMi6kI/1AbAmXMvk1JZ
	 1ohDGltYfY6U7vHIrzSSpapMwTq0AhFA9ze7XOW7GInDt9kQbQNxpnLweXEko5eWXfBOJ
	 5UWo8OmRoImK8Td/hZhHtIC+bhJmx+f+iEPfJ0UGf2l8h5H0sZOUeeZt8fUVDg8f1Psgd
	 uDudCPWtbYkMRr2RbyG2ly+4sTG4+NZZhxOaCGxzP6kFJZo+fkTVh7ePnhCMGXAVKM8IV
	 4J5ppakI1MTBAvAGsFg1U2Hi+jJvFtjtM1DJqESqkeiXh1zIig6bBxf/66m6jIVwTZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794783672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=pGYN85ltIoMmnrSUQu4gVbHDNOjBD9CL9NlblPsMu6M=;
	b=ZosvMJC7quEfpVVe90yMGTFJbXucxyc5fl6LsNPEWuXD3dhayYzkkwBIP5K5a1+8POTQ
	 ELBQm6xWxzmhyHy/AfhLvqhosRzkMlLk68frPUOk3QSV2tGpmMOuTSZKFrdARb/RgStRP
	 VtFHliFZ8ob6khIhqFyZymHswuyyW7aoGY9MjA6q4/4zZQjolw65MXQEq8ZUlgW3CCN9o
	 XTCqawDdPmgO8RorfowSDrKbDvBDsB93aemtEow5/Efl6D7GrSnkputHBs1wg0IhD2vRF
	 zXBcXmy6pGxTrI2dkHDbcDqvSvpuiQ1WMLalVgtNPR1liwmNnatU/64VjFGE8uBlABA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ktWYUI/g";
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC2C606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:01:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FC2C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ktWYUI/g
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so32112415e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 15:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794783670; x=1795388470; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pGYN85ltIoMmnrSUQu4gVbHDNOjBD9CL9NlblPsMu6M=;
        b=ktWYUI/gfLVcEH+TEBQuxfFtNcroRAo67z9hL/cdzuANggI/yHM8QG4YXPXqbxOpWc
         xf5lTTcmCRRRT0AE+GA6OBIFIXAuUwqzFSk3J4oKM78JA75/s/cN/G58vMvnlBY672TB
         CuQ4Lmj9isDy1KpkMFqzIxY2ITknmH480C18urgyz3kezCmsKOodHECICMfpCKke4k11
         +Rz6bPiIleOjP4iV57cjr6sh6hsllKjxF5TFjnvni3Yk8BVKsXhZCL/ZhLTduy7GY31E
         ONoNTj7JI/v6dGoSy9XAWP/JzpO93w4CCD43ESPIbijFM/dUNsgjQiX0MaXjb91YijOF
         QRtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794783670; x=1795388470;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pGYN85ltIoMmnrSUQu4gVbHDNOjBD9CL9NlblPsMu6M=;
        b=x73K9vBPSU9lzl5vftAnFkk0N0L5QLbRq3UtGrKYNXshqYXbzbFhQCcPRpoYoePFH4
         h0mfswC4SstDdsWAoBjnaLw37sc/eZr9J1LMvqfjXIr4QwV+SoySEsFsgVV0B7Xnsmkc
         FUGXeLyI6xq0mpKNkuUNPH8+TC3aruJ1xv/sI3vfYuY9NlvNvc3gSqCTl64R/ER15IkW
         E5zHliU3Kj84tKGa5JeM02+oUs1ciwG1pAzF0ZWrZF5cnS9zVhZKoakQkwSH7UExfDaH
         1kAqxNhUenHUb9MDpeW7hwnaPXJOuEqTxUzybVE+S1+HHxMpDnlQ+FeZvMn5t7iIoUok
         xVaA==
X-Forwarded-Encrypted: i=1; AL+hErFm256OTNfytGbWRVMRT0BCkWZx33MPUSnMIfTwl44T1webeIKrSDp0hJwkPfzpJ6K2ARLzp/tAgxnwWfw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DJwxAFVidR8ee5vlnfQObj4Vu5Xb+nz/B9aOYekQp1ovrDY3t
	QsDzBMWqJ2tvmpYobk2aO9ml8hRqc8fmrxPauQYGluimMTglMwVsITow
X-Gm-Gg: AYBFou3Zke2Nub12uPfpypM6CdHuhtjpTPa2LTs59SF+/zF/vFGPlZ20zLH6lmAqG61
	/iEBdTnVT4cQCwswFusfbdarYs+fdvNMI/ZTfvZ0uTG6gKEkmceZJvQ5bNcql8Dr4z4cnt483CH
	9uLSSaP9uUUAeGWxItjYg66Gl1ETkIiK9hqKXV06Do+749RPKywRPQ9uLA4TxzTV5BLB+LwDBq1
	HMt3vk6vRmEL582MJ73bJqETcCI1+LvqCqUDZIDFXsumMZNbIvyIeHD5NAdxaSlUPADNzHfZJxS
	5Wdyq+SN+CyBNCQ6bjNz3vGWmQYDPBrpwYjRneEaCyLXldLhcNv4+Aw3yTReSP6435faxhUUx2o
	0Oq5tSZHz/9TgDDjLMVYgRLLz859H1nv4bfPI56JgvMIKMJC2S2Wq2fr8gyGsgcydjSXowK2R6I
	4Fn5ssxLmtBIbTFkVSBC176M4wmvO/Pi1ByO5OfQ6ifTHF3G7SxX8g6i1OFMBJDq4bvV2JcIxYC
	QLg+Aq6WhbxVH4Q4Q+DePT9459KuORe3ehl86OFmfceISNvuKGaksNyK0VI2FR6hcYsglZ/Gvfz
	jCupDM/KC0cxnx6fN9KS20w81Re+9P8YUTCgjxyVcxMb0S0iZ7OkTjG1GUMtoMAQhQ==
X-Received: by 2002:a05:600c:885:b0:4a2:1867:10e8 with SMTP id 5b1f17b1804b1-4bb55a71212mr113683025e9.25.1794783670351;
        Sun, 15 Nov 2026 15:01:10 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5720f6basm121534695e9.4.2026.11.15.15.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 15:01:09 -0800 (PST)
Date: Sun, 15 Nov 2026 23:01:08 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>, Usama
 Arif <usama.arif@linux.dev>, dave.hansen@linux.intel.com, dsterba@suse.com,
 linux-kernel@vger.kernel.org, mingo@redhat.com, terrelln@fb.com,
 tglx@kernel.org, x86@kernel.org, kas@kernel.org, hannes@cmpxchg.org,
 riel@surriel.com, shakeel.butt@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v3 2/2] x86/lib: Use REP MOVSB for large memcpy() on
 ERMS CPUs without FSRM
Message-ID: <20261115230108.44309d35@pumpkin>
In-Reply-To: <CAHk-=wjNdNjA_=POY-jA2ot+KKTVJ1-b7Xv_bwF6ehF-AJMmQQ@mail.gmail.com>
References: <20261111234608.GAavT-QFRo6EtvoL0y@fat_crate.local>
	<20261113141137.1113517-1-usama.arif@linux.dev>
	<20261113160300.3f0d0a37@pumpkin>
	<CAHk-=wjmnpCmhyOta1EBR6D8_JFgLNz7Jb2s_PgbPq6cBiQ0wg@mail.gmail.com>
	<E9C129F6-61F5-49CE-8948-064DAE86EF4F@zytor.com>
	<20261113233703.GCavefHwxVZX8mGFCm@fat_crate.local>
	<628BDCC5-B599-4B70-B512-E13DEE926DFA@zytor.com>
	<20261114224504.7574f7f0@pumpkin>
	<CAHk-=wj0MtJpBbwNr=NGh4kFPM__Wf9Hq+LZ1Qv1Yv1SCpjaLQ@mail.gmail.com>
	<20261115124205.076cdd63@pumpkin>
	<CAHk-=wjNdNjA_=POY-jA2ot+KKTVJ1-b7Xv_bwF6ehF-AJMmQQ@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 15 Nov 2026 10:45:22 -0800
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Sun, 15 Nov 2026 at 04:42, David Laight <david.laight.linux@gmail.com> wrote:
> >  
> > > But having extra registers free could help at the call-site,  
> >
> > There isn't much you can put at the call site instead of a 5 byte call.  
> 
> You misunderstand.
> 
> Avoiding call-clobbered registers means that the caller has more
> registers live and can do better code generation.

I missed that was what you were thinking of.
Clearly you definitely want as few registers clobbered as possible.
It is a compromise, but current 'standard C calling convention
is horrid here'.

> Making the calling convention clobber registers that aren't useful is
> *bad*. And if you do a loop - which you know is either large or
> unknown size - and take the I$ hit, adding a couple of push/pop
> instructions really doesn't hurt AT ALL.

When I get around to some memcpy() performance measurements I'll
include it.

> It has nothing to do with the 5-byte "'call' or 'rep movsb'" instruction.
> 
> (And I realize that 'rep movsb' is only two bytes. You'd add a 3-byte
> nop or harmless prefixes to it depending on which decodes better)

I'm not sure why I mentioned a two byte nop, I've been writing x86 asm
since 1982 and really should get it right.

David

> 
>              Linus
> 

