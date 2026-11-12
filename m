Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794466813;
	b=Z61KyRHwC4K+ufe1nN4nTPaEmU9KeBM3NJm76/e3bLPYJUhhC5IhOGfKRfynQkUzpRsO
	 7Xeh4yL0ROzuL37iTN+8hFDwqr4LcTXwphzoxiIs4GDYrXpTmmGo6vEbMqeB/qHXXEUw3
	 c42cL88JI51bSunx+uBQnXkfjh8AS9wUS2OYQZogpeOCfx22OjI4ZQuZeq1Z/4ITrQps7
	 IVrLNMD9U1P/Zf8UtrRoqhRXQAb3CRB6HUQu0k4j3QvwQmBoQ1x7bABP5AOdjLdLp5ji5
	 BlZlsi0Df1wO7b93h8JjApjILOc51gSkeSaH6Cod2puTSZwcU72JSZmGqdxW+kVjOxw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466813;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=k4eCs+pePZSsNTSLB3l0XzT1ZyhQXo8bkW+JvuOJYlE=;
	b=Ou7+zliZNohr1eu8VAm1xGWY6bxEVbq6eix6RXNlhiy4BUenzW4Mofybn50LHJmaGtug
	 0uyxEFDuIQoXW5w0sG7lKtS3Dw/S3/aSL0nYTMzC3x3F5SvMzIhrT+G6ySvtsB3amwqMh
	 ydKjy1EiENyrIUnsPP3y8CHk5IiNomix3JnyrIjCt1g9C6HCg04C792/iraEFzTd3zwU4
	 R5/+EdR5kESp8h1a2KCqNG9NUmF46Tj3PVlHpAJYhGRgWRlKd7JDP41L7/c/WzrHYqP2q
	 dUA3J+1ih1jw7WpMlbw7/bNrYyaTPoyOvYZrYuSh6s31p6Ah7mGqnuYp/zAnZGGoXTg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sbqhU+I6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80438606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:00:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80438606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sbqhU+I6
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-67be4f2f4d4so5048486d50.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:00:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794466812; cv=none;
        d=google.com; s=arc-20260327;
        b=DYhkWCqsw2+aViCmeXeH8yFhZCfvxlqaRtafU2die5wJ11MEadqFMc6ojQd2yKvOy7
         sKwt2Nle24IEqpUHrNJ79SNzQpLeDuq7YU/mts30cGsX/sfMRVMZg6pttmSeu08nNUQa
         SYcdFSwTZAYzOhVowKEAvggXbGXnfCYqsQopyZOcKwQG8u3+HmKBxSgIQu8JOM0778ba
         gPAVvXKryMTvKGzkVGIGPHSXgao0MfHzEQ7SPQIZTOHHTkc85le2RNStArRg4/pTfsfN
         6TIlMMPrEnWcTosChLveV65qlzxTS8LqOsncfEROhNfZnCN0M4cDB5YMMRxTGaIGv+oT
         thLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k4eCs+pePZSsNTSLB3l0XzT1ZyhQXo8bkW+JvuOJYlE=;
        fh=rAkUea3ygSWpgJ2CCDHbSX4M7qiTIPn11Gpc5OZV/d8=;
        b=bz2pHfLcWYFsJCbp5l3iv6IRvYYhAvBElVgPzmMSgByfpCKmkR+UtYTPEJ+n67xsx4
         NUhglwMyRGKAk646UYbQDyfd/IKPDdLP7DS0Fdm1hAqLerMJx/4Wd4rohXjRrIgUxhh/
         zbUxgsUWW0VM5iDoCjjHHmfbqM6DM00KU/LtwYbRg+UM9j2AhUHQ22DfdmPbKcHDGErN
         eYytnUyhvC5lnR//4MtKuVL17zMXbj6+Z2B2UqhPI+dMZc3+9rh6zXRi1LfvA4aRPWls
         hDXfwCgQaGo6xQwCTKVhogOLS6fFsQ5TyeCbbqm0UcTWXchz5Qg5o86usRwIqTW33yyq
         ga+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466812; x=1795071612; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k4eCs+pePZSsNTSLB3l0XzT1ZyhQXo8bkW+JvuOJYlE=;
        b=sbqhU+I61actH1FXlkQKkXifXZndh7qlvAJgUROUb48LOjnnFZ68Bf64wHDby1xifu
         N7jHViteGzXmM1S5VGfeMd4tFIVjdpInLWcLOIzN1wLEWa6X8eguIWRQQAAkDOV6htHc
         WTziKAfQCxxoJgN34ca/DDAg5PPf1SwkqgRb8B9Krv8QCyAMiMInrkh9lQEuu7Pk8+CG
         DKhgC3W8h9YzgPJFrNePk3vbklWXh04CNB94EyEUQYyb6cC7FjZIHjyRlszqnpgOhulG
         3rDwsWD96esH5sKtXWaNWeNxra+ErkSPRp8yQwGnNeYeOJgYvG+qf3oZ2fYprn76sGk/
         xtAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466812; x=1795071612;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k4eCs+pePZSsNTSLB3l0XzT1ZyhQXo8bkW+JvuOJYlE=;
        b=zld0ps3hNMFBaC9JK5qPwYQp2rtZLx7l+Xqs02vN27lFv8Z1C4Mzq6BS5kEmnOmHkJ
         FjLO/zDnBV6S4vLfqUJrJGdnS/nKgbXxkrnCK0BLt3xXKTh/wiqkbj6OvxN78SmIIxVT
         EbryCT/VQvqQm6A39R9DishS3N9/qvJJG8h9Kym7GcueezempawI5kw+6Qj1M/kc+pZ1
         zwLjh83hMk8MwG4WzeAOMA7KAUUKKVsoSo1D1H9LsdEBSLaK1zrbCkagupb7ZkOr5nVA
         xAwdQnoTdnK2hmmTIqP/SHX22/DHS+sdPO4lruKoE3MM2i52ui7WO8jONgrtCwzjCqlI
         XBLQ==
X-Forwarded-Encrypted: i=1; AL+hErEEAf8pFbk7pS3A2lSXh9ieE++TK6Cjb7FZw9UNlBbBw8QRCGeXiFUubxAj29u+7cMhs6FVFKFGTQt2jA8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4g6xyXeuU6DXzgecmdirleuPy3Dbnv+vV80LezUjyAO6PGxSf
	EvATW9OcNeAoJxh3ZM6qUqkqn8B7ZEh+rRhU2DbjjPMckGJw+1rcLOQ9/TLqxgndqCBMaMq5RfT
	VEl5/A4sR7KTsVq2PTkCk6Q9i8xmCcoM=
X-Gm-Gg: AYBFou0j278ub3eYLAdU35VTqp2Or0isrViy1CdPbOYoETm1G1WkmH7TLu58oBSXkYB
	aJU4bYQQSeh/hHxByMBwNC54VFZ2NkhYEhFZM22aXIUTEmqczxS+UI9l8fGy3dp8hwxw+uzp/co
	Lfk2fsVT5CsUW0CPMq6X08oyBK5VzDCCMSbl3uugTTzbdYC+XCtzfqLBbZdkKHxun/Y3dgmjHvf
	/HNTR7xsWrRS+xkGr2HUywjy/ybAOHriA2Ye37NYMKSVIrA3j1NV2v5ESAnXkTanTXhZMVDJIh5
	TQWwefnUHrFSmj/osF97ICXqKGjV+VR1zhyrgdXbeAmOH+x8+IJyFGCYURutEq4K52C0Rr/4Qp/
	BuEXQE7BkPIY02PUlelWS+CRAZmckjT23RFISzd/dYxm0nCCVmOAbX9mx8KLf0qhoOFGrpgB+eZ
	SmhSOU2Cb0xxMtbIFTXwx9lROPfLO6SOgQ8gMpWtVM1b0fLZKBkhB4uhEWuuNLgzeuialP1TASQ
	pc075gwVfdz02yKzVkC5feubE7ZDOF0TkFmgNKHpKqhBpYZR6vmlNpaXJ2i9w==
X-Received: by 2002:a05:690c:e016:10b0:8b3:2d9f:e5e4 with SMTP id
 00721157ae682-8b3a808cf11mr23524727b3.23.1794466812390; Wed, 11 Nov 2026
 23:00:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112011025.101375-1-hmjm081106@gmail.com>
In-Reply-To: <20261112011025.101375-1-hmjm081106@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 12 Nov 2026 08:59:35 +0200
X-Gm-Features: AclHuK-mtvH5nJYZEQDl4p7LrxPm2ImC-KMW5NnR0JKKS7aflF6_FvAqZyCHuxg
Message-ID: <CAHp75VcFZB7Rz0cs2iHqzRoCaGKWS8Q2Mt2MkgTc-xbKSg+S-Q@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Remove unneeded return
 statements in irq.c
To: Hezekiah Mogere Joseph Mayaka <hmjm081106@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 3:10=E2=80=AFAM Hezekiah Mogere Joseph Mayaka
<hmjm081106@gmail.com> wrote:
>
> Remove the bare return statements at the end of void functions, along
> with the blank lines before them. They have no effect and checkpatch.pl
> warns about them:
>
>   WARNING: void function return statements are not generally useful

Only in a single file in the whole driver?


--=20
With Best Regards,
Andy Shevchenko
