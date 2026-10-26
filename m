Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792980737;
	b=YsHqdk6i7pkOTaAUiEB5exDlQ1y87x50ya5tBh8Jk462eKih30xdaaoJq/zz+Ij4aPnS
	 U2s8BUxZKNX0t0o3pSd00Zm555n+6/UD4bByT7z1PzXwe0SE+N/qpIB4A9e5Mp0Pp4kUC
	 pUiGOqPzZtpRwZVIC5Rq6fp2MsEh4Hrie7oOfWAjWBnysmpZ051XRCbjeKxYpfym0Nmhx
	 ziJzxyp5g9kuTT7npear9gYFmwd/GOY/qcmzPdDptquujy45zrt26v9uAmhf0FjDloNyW
	 iFkHGeNa5FLiCd4ZhLpBFXZdaEJaaC6sw1w6jc9neb3g7oq4LMQMNDHvZxscn4AEu5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792980737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=GPu9YN25dDm57paUC3yXoaI+yd25NXWYw23eCkA96p8=;
	b=fwL5EmrBu7LQxBbge4mu6b3MnXnZszsltNBDjjxsCyIjH0apx6K0NAyDtkt0rW40UXNi
	 NTyxuJ1TOlyxUyuu9a3vgUm4j7QvCVEU9cVvPCJzh/i4/uyXQHNDLqv53lJs8j6pI7Q97
	 qc+AmaBHXS89vC9b4eUQtDLvFCyIs5daSfYGYaLzM2KB/y6dYAIM0dKF021L+vtHa7uC7
	 15ozrbSsrw/Vm8JTTdFNxnIWEDuNafjQRX5IFPX0z+3zvgCTOFnlr0gVuEyIA4DAhBQGm
	 +jDaMgVA2zgAsjtWd7EtgDDwQqHBfoypLX1KCkwobh4MbDAqJTzfkrOAK8MmAyAfaVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=H6t4AtAr;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA99606A320
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:12:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EA99606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=H6t4AtAr
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b1a86c0316so3956674a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 19:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1792980734; x=1793585534; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GPu9YN25dDm57paUC3yXoaI+yd25NXWYw23eCkA96p8=;
        b=H6t4AtArQAj3QgYaCfrM3lyItzggtnfyus2Lijv+bbrQrM5UR/A99W/WKYkK76N16q
         J112kHpq/pkZhYcYyHM2ypu2OxNZ9qTRP8mRQVEYwYk0n3KFOKv9RFDWogak2ICoSgy1
         HYUvM3ch8wN8V8L9x5DvOM0myzqwMXz+RkCCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792980734; x=1793585534;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GPu9YN25dDm57paUC3yXoaI+yd25NXWYw23eCkA96p8=;
        b=oY12T58GtGSC2a9XhEx0fRYY5krlb9MqCpojqr/bQXeHLSGxa3axeQCAd7q3ASfNIo
         k32zrqLRbb23QZpya8xsOpAwMLctrV1Ye54XtG1bpVHhJGCEN3Q3ZCEQD5KM85b45lEw
         nx+8PFeKN7vik5maTDCKK9p59Y/yXNdnKqeat0rOI7Agp0+nOTk6FPb+u1+0UHo7Ma9S
         8anm7TlhownlQX5C/kJcNFjYg4P0TJPzZ3KOWs5c5b5atmun8Zzj/yf4zHsIHFaerC9y
         ZrwoKOHpwWST3lupe1diQBz9DS9F8BXCm8+R0a2BDIY9eEvWP3710fa99JKiv2vFHdyS
         0ehg==
X-Forwarded-Encrypted: i=1; AKwUvBxrL3zc1PtToKFtm/iXJupr+MCjN/rW0wzOJCDz0XH5pprxbvfV5IXH078/UofEcHit1ifoxZgc2BZWy9g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPA3soOOP5hTFNqMK7dxqANv+OuclNyd9OEcSOMhgEIrkFr+/u
	QCVfQoNtSY8JJFQf5IpGCr52JRqwICN4byrLDcrBJtwPNdRzJSwmF+2hK+nXw8p1Uj4TIs7ywix
	pSimeA78=
X-Gm-Gg: AYBFou35qnfx9ueKO0CUxN/1+b+5N0KzQ3c6ZOwEMXzN4iwS4R2fb0xIMR3kcsBX1+b
	VJZrtPkKzcfcXqaM978tgHNyELjTXJcTdsKBDVGjbVvFFbgETJB9Qr9Cpqk4XWrJ1tvUevldYwe
	BC2uanRWI3AQlU/fNjBQ19ndaeWsCvFYX9WPd7/XJv6gnAi/o1VgF9R5pxGHcX9w2Y7fhpFMTHK
	wf143uPZ4hjzpgOOOV9BMezdA3WRrGqQg3yP72I5hjIoioR7X6+N9JxX7biJf15DMh8T0GQECo1
	IsTwqT1cMVx9iPg4uJ+XXZVQGZvQO0hHT86+Fx58lzrQbyEtknmQsSjrEs74CI5s2XCxOW4IHEB
	EG2AGfiv4+mNX0fGZRBbBA5AX89PrMQg7L956Uf7it0EGmU69xWEdrerP/dBXzctG/BL9kQT3hN
	aWzU2WJS5z3N7LMPvCEqGK6ecKshz4BDExEw+4vE6QVVkXCemo2TXtWFk5fwJo9RGade4PpKkKa
	nUsDH3DIRVFJ1fk/FOKP2Mr7NY9zHW6FpE5MYN+eyoe9kZq6zVmFuBZk3QlZrnc9TGqAx6MnpCA
	WS9AsmeiEZUoiRQuMDwImYCah3TFJw==
X-Received: by 2002:a05:6402:c188:b0:6b4:203:a183 with SMTP id 4fb4d7f45d1cf-6b44324fd54mr4399813a12.36.1792980734469;
        Sun, 25 Oct 2026 19:12:14 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b445970ba3sm3123812a12.14.2026.10.25.19.12.13
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 19:12:13 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c46d41f6af3so89980766b.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 19:12:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByl24s1vJCnlGabK50RlqUn9IzexWZxUaMrPznrKvR7lJN/tJPbuEfmY7+Y6elVw2xFRajQaGBxTJsPguM=@vger.kernel.org
X-Received: by 2002:a17:907:3ccc:b0:c29:f5d8:9c75 with SMTP id
 a640c23a62f3a-c46bde7eabemr658242866b.36.1792980733776; Sun, 25 Oct 2026
 19:12:13 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <atoWDJDx6sFovvjp@mit.edu> <at1viAwYP3bFOkj_@mit.edu>
In-Reply-To: <at1viAwYP3bFOkj_@mit.edu>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 25 Oct 2026 16:11:57 -1000
X-Gmail-Original-Message-ID: <CAHk-=wgsdLwcKr1jguH4QfPtS3sm5Ss6HKfk5RAMULHz+O6Jrw@mail.gmail.com>
X-Gm-Features: AclHuK9VwiBTuLWnqHPC6xVDVLPjjIrsXpo0uxJp1zsuHKmEBofnjvervhtz3pc
Message-ID: <CAHk-=wgsdLwcKr1jguH4QfPtS3sm5Ss6HKfk5RAMULHz+O6Jrw@mail.gmail.com>
Subject: Re: [GIT PULL] ext4 updates for 7.4-rc1
To: Theodore Tso <tytso@mit.edu>
Cc: Ext4 Developers List <linux-ext4@vger.kernel.org>, 
	Linux Kernel Developers List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 24 Oct 2026 at 16:56, Theodore Tso <tytso@mit.edu> wrote:
>
> Ping?

Pulled.

Note that I was pulling filesystem code early in the merge window, but
this hadn't come in then. And then it was architectures and drivers
and other things for several days.

Now I'm back to filesystems.

It's been only slightly slower than usual due to a couple of days of diving...

                Linus
