Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794048818;
	b=FhuvF0J7ofih6kQWY3iO8HMbiJMo1JOiREO1xYLZOTr4pTiqujGBHP/inXOKhvP2mkn0
	 6vc+6rqIHdlZxvE7WV0BnzAa5E1EwwV6b4xUSO8Yt2OD2bcP6iRna+Kt+ApGh0kY/UxXW
	 BUpBjBWE196KEnysbVW6HaUvYGBRzZfhWWrYUJ0wo/b7Pc+meZPc5IHqnjpio3Ly9eDIK
	 XGH4KwzVqwn/rX0NWpA1XwfaWLJEKD6CXzodNR/HR8J8T3L8R1oi9SnjHCKOLggx70Vj/
	 Lnts1YMrUQdjR7MabEYF/BjQFt995t7iW3YxPC1mUgzkfs5rUUdFVYNY+6sRBYT1lyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794048818;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=k93Uquzi2gmvL8btLkqz1m+7uDv12qNerGrKi9jXuw8=;
	b=QyK3vZ+VB4tpgiWduKXu04lXTOMlGG2hwcIXQCLxqzEjZ/X3fE/q/sCQBQmxBG9rcRoi
	 xDZbCmvoB2e0dfESVrMEzWTvZnRAcxI+hXXQnr/RPHitcQvhkdhOv7cP3LC7Vu8jY80wP
	 eDhxK+VfmtHRchxwAemi13/SXZcK3lAlQ1/Ec++vhPKi9D0STQcluFb5z7NwbXpLOCuND
	 zfrM7ExidQNZG4nr9gnwoVvisPdHCAzn/Kjev9B/lD2srNwfBtEP+zNyPpc4QU9DAkjXN
	 6vkjzVhyQniMqdg4Jl1dS8snVy4fXfCI3w5jaP7PsOfdmFNTg+DFNP3QadqSxINjc4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yBQznKcF;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB66606D803
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 10:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BB66606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yBQznKcF
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so15719485e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 02:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794048816; x=1794653616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k93Uquzi2gmvL8btLkqz1m+7uDv12qNerGrKi9jXuw8=;
        b=yBQznKcFH1qW2p5hPPNyh8Ph+Y1MExnF4KNZYxHzWNa9DWZlgo7aWr9EktqX59K3Zk
         m8eagAnh96qTyut5zTrfKX9PtxagT3C/xz4nGUdTBt1SsV+RtL3WiQNQ3OVAwtSzB7p8
         ZoVA0zkmzDzNzqMNJTGZIwO/fNW7cwo/jfNXagnToyZt3dyBH5fQ3fMqekGPJZaM1ZSV
         DwbB8HQozKv5+HeSwbRsoAVi6lwh6MS7n1psEHAn/tqCmGM+TKE1k1J6l9/uZHFCCZ28
         wICCkzqAh1rGQogdAjy3kqcyoVOVJkt6rtxruUrvFwoFMcyx6AJzXhYl0SgohnNCjnzh
         kHQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794048816; x=1794653616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k93Uquzi2gmvL8btLkqz1m+7uDv12qNerGrKi9jXuw8=;
        b=QXdH7ayTvIfA7za01Z+ojltJ+wvCreBECGIgv9w9TCfJ86jf9c6tzoWrNIKWCPuXmC
         D1+kG30G2gL55JgQp+PNGKd4xNeg1XIw+3dxBtN3htm1A1u5n0tlR6KGxBCI6+jWOobB
         Bc+i8rtZhDXMycF5LhXDSFip3/ST5+/cBQzbaV9xPnlXklT7Zpq3nueUsp+ekgQXFC0G
         oUmhVlSyRm36wF2Jeo1FZqthB0eFKpCDxmV9KixaBd9X12KK5LbloCaZ5n/dj+Ajmaab
         8J32BoOSc9+RUhgulPwO6BKIa9JVM4yZU7Wi4RkIdLpo/p4gRGAlbziaLBUpwveO+yQa
         CDhw==
X-Forwarded-Encrypted: i=1; AKwUvBzSHuoFbCWgUAm7HvjUY2SNU1KvPnky8KJA1mCyxjwyxUgNruSGqNtC8L0pA67O9Fu9UJ4LJ+CkbEtBcto=@vger.kernel.org
X-Gm-Message-State: APuU4Z/B7mpKx982zQGx3T/UX2Gx++/skT82qF2HEqzte+ohU9KyAhB7
	WHgmodi7DsInMyeS+Vtlh+MShy2dIuheHTQ8mK9cSkbwg0m8nxUvva8B
X-Gm-Gg: AYBFou2JgpcEPI2INR2NI15Ndc0yUhRVj2OMH5bc0qIkxOzCiNbd9o2VMjjY2awJy8B
	LSR0CggvKFpVPklWy9nPTyliT48hNnXFpCIImfozSF/lqgz2rirno8qG784PUtrFdU+6xWOcVVu
	zGw0xYKepmDapZmeUjDYH9lSYGFqqjfcSqeCiEoBEj1trtwgy6IfUTyyxRD/5WAythxIJPosqAW
	mK2WzADyq8w46ElXnLXMMQ/A1wCtHe/gDQHE9M7tVZxn1W/veQ8SfvSDgZpQ4qCLm6rJXadoBU8
	nc3ctCpYTZkAeMrJ1Rl1wM+/ugQseLlg+4OugVI8wSk3i/2/feTTlKSrYNDzoiKPQA1oizL6L8c
	hQ+4Pycf35Kh3QlUoo1nhrmIUXVg/BfPJ2AJy8VCBpggcTA0PC3Z2HkTRJT4l2LxNxeRbSt153+
	2rKqHaREnqcmnyPHfSm4gX06ak5kaOSU8gONMydf10OnrFNL/E5jI+FyJDH/tRIpw1pXBm23ayh
	atLanMggQDfKblfHBF5uER8K9KI9O5QbSEEMwrhnoJtjzYOjDUb9LVtgEvuFVsLKE5LpMFhfxYL
	PbUcKVdzjmyxOe3aEGjk0XEx6guAMQ/652m9K+tNFgi2+4OgJ4NhwHN94Fww8vUlki4Q9sCSA7E
	a+xqi6UV3jRovSsepa5nE5lm9GnBfe9ZL5qU4L7ZjzSX+xy2E3Tvmi0m1XUyg6n3tcPXcMYps8H
	CQKX8zwwFm7w==
X-Received: by 2002:a05:600c:1914:b0:4a4:7a8d:c436 with SMTP id 5b1f17b1804b1-4b6de788f5bmr87694475e9.11.1794048816330;
        Sat, 07 Nov 2026 02:53:36 -0800 (PST)
Received: from PC-Marco.lan ([151.59.49.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b8af10dd35sm42291335e9.4.2026.11.07.02.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:53:35 -0800 (PST)
From: Marco Ziliani <rylos78@gmail.com>
To: Kyrylo Biryuk <illofspeed@gmail.com>
Cc: Niklas Cassel <cassel@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] ata: libata-pmp: disable the SEMB port on Marvell 88SM9705
Date: Sat,  7 Nov 2026 11:53:33 +0100
Message-ID: <20261107105333.19934-1-rylos78@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107081335.3360920-1-illofspeed@gmail.com>
References: <20261107081335.3360920-1-illofspeed@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Kyrylo,

On Sat, Nov 07, 2026 at 09:13:35AM +0100, Kyrylo Biryuk wrote:
>                                     softreset  reset failed,  last disk
>                                     failed     giving up      attached
>   7.4-rc1, no libata.force          60         12             197 s
>   7.4-rc1, libata.force=N.05:norst   0          0              70 s
>   7.4-rc1 + this patch, no force     0          0              11 s

Thanks a lot for testing, and on a second unit with a different setup.

The norst row shows that the commit message is too strong where it
says libata.force cannot work around the problem: norst on port 5
removes the retry loop, but the last disk still comes up about a
minute later than with the patch. Niklas, Damien, I can send a v2
that says so, or you can reword that sentence when applying, as you
prefer.

Marco
