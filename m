Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793984291;
	b=j/h/TyyxcOYCPlVU4P9jKJ2F1grfMLSbKfmO0JEj+llT08jrR0wbkH0pUsDgxrmhuuh1
	 FbQUpEm/euPwa59WZuuDkpxQkCGXRJNwuSN9fOB+nfvaM5P5N6sAGinbhE8YyzE1BPuGM
	 dbdTL86IbermHTcX+SLZQKYYYbzQgKjF6REomcvgOwJmetQggSSFroZCJaXqRMxynA2oT
	 HrTjBe6nalPoK0JtV6fYy1P1d8n1VZtukPSzHgA1SF0nNikY4lf1jMoVV+cTyS39BWIR0
	 fmBChRf/b91NQRW5aBW7M322eisRih0xGaJWaRkyPJfhQMTSNmruOVOwPkOdcTXrK+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793984291;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Message-ID:Date:MIME-Version:User-Agent:From:Subject:To:Cc:
	 References:Content-Language:In-Reply-To:Content-Type;
	bh=tR15PMze+HXvf4bfvFEctvvE9+eNUsNFEYsIngDBI2g=;
	b=nqcahc7BqvaRPLT29eE200Aw1jjd5sq4Ei+oZA9LHQJef6bWklmoNFDdvXBtnU0ganfi
	 j/lltVMpWhI5Rb3+8fImH6gCvvx3btXhfUujgyZpasramfeCSCOQxy+EaHHToaNZv42Fm
	 2UeLFr8a2XiT7MV9vW5SJ0wCtXS2RKHFd8QycLihlfTZi8DX3SDf7vm898c9LvzYD9uqd
	 Pw1rrPpQtItHA8Onkdxb5keCMd0XkYGprRTE0Y9XTQS3gSnWapdafuaplOaAn15Xq2D+E
	 hh/7bAsqJOTw9LxKQEgdbNvvg26XosjnxHHmH/BRkqqB4MBWsFZDyYygZ9JnKB+a8GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gin1H2B7;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A36C606A333
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:58:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A36C606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gin1H2B7
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48df4f540ebso547574f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793984290; x=1794589090; darn=vger.kernel.org;
        h=content-type:in-reply-to:content-language:references:cc:to:subject
         :from:user-agent:mime-version:date:message-id:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tR15PMze+HXvf4bfvFEctvvE9+eNUsNFEYsIngDBI2g=;
        b=Gin1H2B7wRNxcbyBjdL47uyUsygj6jXUQQMLnvnt70dhjtMpIp0wxMNHuLJ3+or5KW
         VtUGmlr6/jQOgAQ0l+85oN7AjQUcvwmjRMy2hj3TSQDg4RBl8NJmPTuFn2RIYcfiwrXt
         m0vyrORwQ5eI+N/DwsQlHzty5n5YE+Lp+GwKf27yJ9ifctGHUWorj9kS69k+oeddpxxd
         nq/qxFZ0gb1mL+p8C60sMHqS+YmtTW0M/GR+lDcVg90mirmvj31J0rd0Gxm9oGyTl3TN
         ZB6d2pS15uTIOuf0Nz585VVcpSAjMwFmOsa1HXyGzI9BJV8TDk3f/rY48Ch6LXUrEkwZ
         woiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793984290; x=1794589090;
        h=content-type:in-reply-to:content-language:references:cc:to:subject
         :from:user-agent:mime-version:date:message-id:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tR15PMze+HXvf4bfvFEctvvE9+eNUsNFEYsIngDBI2g=;
        b=qxk9QjANtIXsA4JZZC0OIBq3m4ZV/zDg9jnjpBfBlUQDeawUFAB4JrgfHPb5x5Z6D5
         ZmoYuphIlCNxd4Qcck+4+t0KMFbXrA1FC6nW/UWJH9VI0GqJNnRxu91W1ySK7WyMbPto
         hC+RjaIGaCgX8Ouqv1q8DeV3cO1AkYZCvAaNBjsg8lRI4UexUUtB+3DU3ADdOIoCr16A
         jthu6hY/FpgfdQxkKQXltwLp2S92zK1iei97jbDPt/JGkZ/rw1fihyHYX+yVj+HVzF6h
         Fp5jm8fqpF426PdMur7PjZb9h6Xta4DUsmlwua+7O6BswcaSc6zwv3+Ql+JJrXH8LpvO
         QsCA==
X-Forwarded-Encrypted: i=1; AKwUvBx0qNd+lgIYMcIzgMrvAOjw9SSGFgmTryw4+ndpo+3E8GdiaZGF2qFo6/EOCeZK3T6FEDGcEsG2JyCRKII=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pwxR3hYYq5hnSTXwTiGekKA87x028T/HEeAwA3qHjA6zWQc+g
	iZAsQiQTaS2mf1XwJ04dz6gHRy04PXSxuMm5Nde1t8DkA2SJf9jqD7sI
X-Gm-Gg: AYBFou2vcDrDvSsdwj7RxBwRmWzlXbB+EL8lUXlRmj1CVQgQosBOt9U+B5mGYE+8Q/1
	Es8dBRxD+jzKj0w0ihEjh4/Vjgco4C/f0MGve8nfX+dKw1/TmBbd/mzrynViWMsExEmlXhmDDUE
	JGOoqkCSCWQKJfuIFjVip3t8nO4xy8AJ2Syh80N31LL3DbKEZlF0+ajAp4MbdcJsHUuyBq83mp2
	1xeqTj3Zn3m4rNZ6tPqLMN3eo/ts/yl5oTz+1YZGI9sNmgTcjWN5QJdWzByE53nCtCJ+WFDzS95
	EGNOK1cI6IsAw5b3bLFt0Nlk3QOc4EewXiEJLhL+IfTJpT4nkEzSl2HVFkNkIQCt3RtgaAfvBIV
	7N5YOT/yx0tI5HSYAF3xvFWbyVMNlgLiDUKNv9BLwU+R88DMSAfZNf4rMPwtCcB1yy0BOJ1d00I
	Ouli4bPDlNLDqx5YeAysi7/heR9JqKHu/ZvSENr0dLFqwBMdy3qMdn3oQAmirjS6/e7cUY9o2BR
	roEdIsr0kz94pBu5cI1H9Ah1t8B3fXq1kV/5sIfWXLnpQ778zPWhnuPxU5gl/2ltdUnrYPdyT8l
	y16hp8ti6iV3FS1KXmuoFzjQlNWrNhAEY4Z86DSMvAhcQLv9R9WwiqmEpNnYlNqk0diSupQq+ey
	HpCVoD91rmmYRFT2CY8oV
X-Received: by 2002:a05:600c:4e8b:b0:4b2:61e5:b2f4 with SMTP id 5b1f17b1804b1-4b6de4a6fc0mr55795315e9.11.1793984289501;
        Fri, 06 Nov 2026 08:58:09 -0800 (PST)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b57373f7f1sm176253205e9.15.2026.11.06.08.58.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 08:58:08 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <c855ad2d-2d30-4a49-8bdc-3adde0ead951@gmail.com>
Date: Fri, 6 Nov 2026 16:58:07 +0000
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
From: Julian Braha <julianbraha@gmail.com>
Subject: Re: [PATCH] kconfig: wrap long expressions in menuconfig
To: Nathan Chancellor <nathan@kernel.org>
Cc: nsc@kernel.org, ojeda@kernel.org, a.hindborg@kernel.org,
 nico@fluxnic.net, rdunlap@infradead.org, grahamr@qti.qualcomm.com,
 jakub.git@horky.net, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20261010095001.265759-1-julianbraha@gmail.com>
 <179385226473.826739.16877681288448258281.b4-review@b4>
Content-Language: en-US
In-Reply-To: <179385226473.826739.16877681288448258281.b4-review@b4>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------fFUEAkC32a0sU4w7dqS1o43G"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------fFUEAkC32a0sU4w7dqS1o43G
Content-Type: multipart/mixed; boundary="------------uCKM7dDNQohHbh0KBfQRDc9s";
 protected-headers="v1"; hp="clear"
Message-ID: <c855ad2d-2d30-4a49-8bdc-3adde0ead951@gmail.com>
Date: Fri, 6 Nov 2026 16:58:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Julian Braha <julianbraha@gmail.com>
Subject: Re: [PATCH] kconfig: wrap long expressions in menuconfig
To: Nathan Chancellor <nathan@kernel.org>
Cc: nsc@kernel.org, ojeda@kernel.org, a.hindborg@kernel.org,
 nico@fluxnic.net, rdunlap@infradead.org, grahamr@qti.qualcomm.com,
 jakub.git@horky.net, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20261010095001.265759-1-julianbraha@gmail.com>
 <179385226473.826739.16877681288448258281.b4-review@b4>
Content-Language: en-US
In-Reply-To: <179385226473.826739.16877681288448258281.b4-review@b4>

--------------uCKM7dDNQohHbh0KBfQRDc9s
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11/5/26 04:17, Nathan Chancellor wrote:
>> In an offline conversation, Miguel Ojeda reported that scrolling
>> horizontally in menuconfig's search to read RUST's dependencies has be=
en
>> slowing down debugging.
>>
>> Let's wrap expressions (like in the 'Depends on', 'Selected by', or
>> 'Range' sections) between tokens at the end of the window, such that e=
ach
>> line begins with the same indentation. Ensure the '!' negation stays
>> attached to the left side of the option symbol, and keep the value
>> annotation attached to the right side when wrapping.
>>
>> Note that the 'help' textbox uses the same expression printer as searc=
h,
>> so this has the side effect of improving the formatting in 'help', too=
=2E
>>
>> In the future, we should consider a larger revamp that would wrap all =
text
>> in the search window, allowing us to safely disable horizontal scrolli=
ng.
>>
>> Assisted-by: LLM
>> Signed-off-by: Julian Braha <julianbraha@gmail.com>
> I spend some time searching for random symbols to see if all long
> depends or selects lines looked seriously broken and I did not find
> anything.
>=20
> Tested-by: Nathan Chancellor <nathan@kernel.org>
>=20
> Like you said down thread, this seems much better than what we currentl=
y
> have, which is nothing. The Sashiko comments [1] seem rather contrived
> (if valid at all, I did not check closely) but it seems reasonable not
> to get things wrong off rip so with those fixed (if necessary), we can
> probably get this into -next to see if there is anyting we immediately
> need to tweak.

Thanks for taking a look!

I can confirm that the findings are true positives, but it's a mixed
amount of contrived-ness:
(1) there actually are some Kconfig string constants in use with
trailing '!' characters. Rare usage, but not overly contrived.
(2) the leading space problem is much less realistic: technically yes,
Kconfig allows strings to have leading spaces. But no constants in-tree
are using that and I can't imagine potential use cases.

I've thought about tightening input validation to disallow leading
spaces in strings, but I suppose it's _possible_ the host has a poorly
formatted env var, and preprocessing Kconfig macros should probably not
be the place where that gets caught...

Okay, so resolving sashiko's alarms belongs here.

It's taking me longer than expected (why is expression printing this
complicated?) so let's see if I can finish v2 this weekend; I agree on
giving this its fair time in -next.

- Julian Braha

--------------uCKM7dDNQohHbh0KBfQRDc9s--

--------------fFUEAkC32a0sU4w7dqS1o43G
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQT6qjll++tIFxF8TUPElYPCBXNxIAUCau4HHwUDAAAAAAAKCRDElYPCBXNxIFKr
AQCrhnSPHcHE+swEYsZ/SIizzkKit9xBCx5qG07aLfWfpgEAv9xaTjeThzK/bKy4bN4It816GVjU
jxvCawJTIw4GLgw=
=zWGj
-----END PGP SIGNATURE-----

--------------fFUEAkC32a0sU4w7dqS1o43G--
