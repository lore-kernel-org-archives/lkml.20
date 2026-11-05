Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793896042;
	b=SL545HdOg0rL7x+4Tg47glOQP42+JFTMae/acmVLUTvwycg4P2SpBOZLD+fdDl4R2MbW
	 cVWMgpl3DPYqIc2iDeebBwXvWc3PTd9XIZ9M00/2qESi88Fz6J2lCPyNqk7h04NdtdXXM
	 UBfbqpB/M4f4vWTnsPtzwta9yWTwx5XeO3CJVzzU/wqmYJMIsSp1S3OgmPMgOtcIT/y0I
	 LPBcsM2zTl8MHT/O5+zXKpEeC0nryInek0r5wtnooaWzHsnsaf5BmL/QR4nBWm2MqWDUA
	 OQavVdYB6kkmjwi5jmHEVyqxdhLi2ZdiOoMbURj9JZIIXe2iGCIejRFW+cI++GM+d3w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896042;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KjSVeGEEd0+bGdWRP6KVoFnNf90ZO756HfHoWrPkLN8=;
	b=YD1iS+KViWRtq8N1KZm2jv8/0OcXxPTQwnZraUhYG7+MbP0SpRjbHehK8hGW2FVssqA9
	 RoN2m+EiabBhnIVjhxSKcxi4LAUZHzSkAhkXa7uFPl4IzG4q750eVVMDEpS1QWK8T31mU
	 PdOM94j+CF6DIGp9TmUvEN/WSUhkrRRLrF9Of97WtB/jKv/pPo6JLyE+l71PAdjXLxfUt
	 zghVe6C4JQfAhhPN/iViPeCfN+o+bF0cHuQsUhq/9fRyZpsO63xHq40nvB/fSvLG+09DK
	 5MRFfjnpbn4lH5gVl3AWA5r//0pwClBx2Du6PPxQTluoI/WOdearlDP035gNin8pOwQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IAdWmD8J;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C80606D823
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:27:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57C80606D823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IAdWmD8J
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e9f6a16afcso68555ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:27:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793896041; cv=none;
        d=google.com; s=arc-20260327;
        b=i36nkVaVZDSQhu10dblErv6Oktnyczln7sMizlevk3hPSp1StfXaUjFcHrDNaTYEiZ
         iMh2GxkeXYBtbjBr8cLSm1If08myUdBin8SwGBNOpkdPSq6EOJJImPxMocF+UF3V3gli
         yGomKov8ZGNkU5qtd+1CqXaHll7tcdvErW3q4gSvZzuZlNmqhD2SuEzj9If0TNncj/DO
         ys3yHTs1sxWfvL834odkDHxQ7y9pd7hIeDqefSeNxcIud/WDKOUyzRP+rRshpsLWD1/r
         6kWh+ULiSUUws+Wxm98Qum5MlHCVrZ9SjHRag/uy2ZO5M2pKvw78aA3JsRXuvfgnrtzT
         Sifg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KjSVeGEEd0+bGdWRP6KVoFnNf90ZO756HfHoWrPkLN8=;
        fh=JbTn0rAOk2aZdssQsyKhNGmFpvibThjdGAz4CqU7YVo=;
        b=NjkI004jIBIFyG6HcY7LF2oknJXadlP0k9Yg3UfdWXojib4t/aGFHZdHF4W+5mI/sL
         ZhC4bbxHQNmoquETA0XTI5k5Cpv8USpfSJiaK3HvFlP+2xvg5NILBMPda2CYY4kx00nC
         dPHnVP41jZ7Y3kj4K/yHtVka3V08pqrYoB28IUEJ62nfh5nsF3Ju6U1fiWx94TNe+ONS
         vJXsu/aNCq3qJxIRgM3bj/VnKK7n8eymDFrNq377qksxsoRwD16eoq2vJbEj+XWQP98I
         l1xS5Cjzxgb/keC4MLB+DzjhI9Frge2NA05BBjDjaU2Lb6uyRXu+CdQshlQQyL0zNN61
         RSwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793896041; x=1794500841; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KjSVeGEEd0+bGdWRP6KVoFnNf90ZO756HfHoWrPkLN8=;
        b=IAdWmD8JNPkb8+BPDqxGVrDthrcfZlPbVpLTWVrjVrtFSpMlJnimBTQk4/nuq9rXDp
         ppHgIt4hqBFXBeHjd867j/CAsSVgjXkfq6GXp16mkT5K/sYhCf74FuAWiOgi51Xl23YP
         p/7zABbNgjIH5SYUiZdfmFPGbIW4FfN3p+2pIa6VhaHQDutr8itsY0X2nagXClXkWHMm
         FhEWL0xZD3vJItk2osFuhRXByiPR+eFiUTfqLZPdBdt1KrA68k2W2Gzf67boy/FaF5IP
         8Q3yBF7aWMnb64lG4ghdiuQNiOK05BhTUgghwfBU4bgLRDPisn0zlxqVkKmr32WkWXNs
         aokA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793896041; x=1794500841;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KjSVeGEEd0+bGdWRP6KVoFnNf90ZO756HfHoWrPkLN8=;
        b=fm5JTfg2h/XGbiukaE667cRmXbvKpD5OzfZn/BDwvVrAYYETSycMEvXmZ9U2W7PArh
         QCMvYOt/5xi5mAn4fAhkAOxjQxfJWhtF00T8OtTmBiS0thcOc82MT31D1dP80lUeOjFt
         QmwSMztawvpL3jBTUgGfKo99b6U+Y6hn6MOFt4vbBn4e6k2yI1m7DaOn77SJSOJ5m3R0
         B0BMuJyrO9gUqCTi+gjtnClOdBSB4aYmMqFbHMkpkYzDxP5aebzNT3WYQAxG71lwLZaM
         XANwiLoV7hXm07mxMkqyOo04uFXRZjBD4txJEG8frR7YpQ+hvimYUF+QwxtUhh50nstc
         lFZw==
X-Forwarded-Encrypted: i=1; AKwUvBwn8abnzyPhuMEYxe044MWC2ZJo5Dv6RqzpCwnFNAY65YgB3Oj3pa2heDdjAQ/bPvLYpAMWFawKmmap2Uw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IMudHATSanycwr2QHYThaQpxCIPPyDN6Nmx6CEMmxgo1n7JVd
	1/ogn+C0xT4cYy8OfoCAA2JSddx71Ro1s6SdojgmI4eYubCOqstInspHBLz5wyPBzIUkggPPamh
	uMxk9VdE+ec5NGZE0HuNqMolALk0+RoFYWccJfoTU
X-Gm-Gg: AYBFou3WwZIJ8/5U8bIkUPGUCWM9oz6vaf4+32lYxtLME/xIjVP9Y7vRWVsjw2Guv/m
	rQrO7ZpaQR5LbXQxr8L4/Rb2vE3ozC/Jb5Jhkce18E2YxRfbey66A74YkXpzIAhJgLK1cVWPE8g
	9PHlkS0Q/4PFOE6Y7oF8ylQPT7FlyEQSoODkIB2PZtu5+iqFfHNAloyEtAlOLKi3JSLwcD53EoR
	FhhRnyW68XoEITw6lWHPuD6ktt7NWKP8o60maJsT2ZjGZMFMYK0kaaTCCPO1n47x9xzwh8PvvY/
	coundjCUct8KzgYyVuup6Z9NqHRbjELputPDFJRzSuOs2FxViFTtwocVv6gvE6fg4QqIOq6zJ6Y
	OVdXo92B1TCEAZ/qinKHqMTsXfcQGG624bviL0cT8zr4TB5W6v8WKxjUDZfL5SRtFu5HQlFflCq
	Jd5Ksf58VFlwlZRgOi32BcemsnkzFd9nLAVi0YmCpng26r
X-Received: by 2002:a17:903:f8f:b0:2e2:d665:6ad8 with SMTP id
 d9443c01a7336-2ed261403d9mr4943165ad.4.1793896040053; Thu, 05 Nov 2026
 08:27:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-bugfixes-v2-0-021c84d852e0@kernel.org> <20261104-work-procfs-bugfixes-v2-44-021c84d852e0@kernel.org>
In-Reply-To: <20261104-work-procfs-bugfixes-v2-44-021c84d852e0@kernel.org>
From: Jann Horn <jannh@google.com>
Date: Thu, 5 Nov 2026 17:26:43 +0100
X-Gm-Features: AclHuK_t6xWdJYQZJZWrLOUlN89qpMohpKX0x61rzlBSDTuPtx0XhCCr0dC0-vQ
Message-ID: <CAG48ez19KzsgbOQ35FfGO=cVXGvr51WTA-3g3xNWPmUv2iS+8Q@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 44/51] proc: sysctl: resume readdir after the
 last name it returned
To: Christian Brauner <brauner@kernel.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Kees Cook <kees@kernel.org>, 
	Joel Granados <joel.granados@kernel.org>, Jan Kara <jack@suse.cz>, 
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, kernel list <linux-kernel@vger.kernel.org>, 
	stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 8:27=E2=80=AFPM Christian Brauner <brauner@kernel.or=
g> wrote:
> proc_sys_readdir() counts the entries of a directory and resumes a
> listing at the number getdents64() stopped at. The entries are sorted
> by name, so one that is registered or unregistered in between shifts
> everything behind it by one. Listing /proc/sys/net/ipv4/conf with a
> buffer that holds ".", ".." and "all" and registering a device whose
> name sorts before "all" makes the next call return "all" a second time.
> Unregistering one that sorted before the position makes it skip an
> entry instead. So a listing that takes more than one call shows a name
> twice, or not at all. Even the 64k buffer of ls needs a second call to
> find the end of the directory, so a device that comes up right then
> repeats the last entry.
>
> So remember the name of the last entry a call emitted in the file and
> resume at the first usable entry after it, like kernfs resumes after
> the node it stopped at. The entry itself can't be pinned across calls,
> unregistering waits for that. If the position was moved by a seek in
> between the listing counts from the start like before, seeking to an
> arbitrary position has never been better than that.
>
> That also takes one walk down the tree to resume instead of a walk over
> every entry in front of the position with a round trip through
> sysctl_lock for each of them.
>
> Fixes: 77b14db502cb ("[PATCH] sysctl: reimplement the sysctl proc support=
")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Jann Horn <jannh@google.com>
