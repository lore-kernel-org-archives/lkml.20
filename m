Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794384251;
	b=OJyJijVwUSUnJebJwTXWoziWlBODRngunJrOZ9ZMYjR3xYWKXH8Wd8Qa/pn0wnpaA8D5
	 JTCyukz2wy2iN3sO8RyeHgf+m8tgAXbQxBpaH+4WBORWY6z0KRectaKywt8UIwpr8qlZD
	 tJnInJH0lWx7GZ93sCVCU6V0eQQgmaShWxj8661ozfTBlMeybC0EJkbPCaQQFBES1GOkA
	 EZ2b+zziibuE20P33VGfkZ3oilJCJQQEzXA7agQ0UiNq29cPsxS+5UUrBOA8s+oHmgtXb
	 rquCPWV8OkCJhRermm8wo8WsQZTjj43hP9FgSOpSbO+YjvfZQuVB0+Oog2j4k5a6byw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384251;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=e02CISDat2rnFU5auy1swbmNQ1NAggjZWxzVKQlZOt0=;
	b=2SK/G904DXI1RP4U9N0bSwUM4IEtHRt8rhMqtAcvBpjTxWthqpM0R+NysI+4t7ftg/oc
	 Fjn9OUY14YA8nmrVy8isL6+z4M9gT5OBG/VCg7SWYMrIQnmFrCp7Rd+Pcmle0Sn8RpUnX
	 IBa+jBNx+o8WkkLC9EuWFaH9RIcgRsCb4YGx1U/H7ppBRQM1nAmj75eq2ItRFRmd4BA5N
	 0n+6dvbvZI2r7iUTdLKh2QWOi/H74nhFNf+yv1g5Vucweg8fKJgWGlIwYOq5f1QDy3vEd
	 pH5MD5en+oEvNRjzL24hANa6HtscGLdOLftSXyLyhlLhgoo5c0s+V/myXdI4BK4/WPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kzpLQfiw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5316606A320
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:04:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5316606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kzpLQfiw
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36f8cdd30beso4921622eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:04:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794384250; cv=none;
        d=google.com; s=arc-20260327;
        b=ATwA8M7D0ggbUvCAIoGJ8mgdOCuqZ/mEXqGCH90A7LER+Q2QwXjrRLNcQD9FRifSC0
         9Z1RYrT+UiA/BZcpXTKpc2g5j+60QFEtOrpdJXXCBy8BEm8bVCGa+LT0SN9yIWtv1h4q
         6RCI1ltRlTQQeAiwO33p+iUP/3m9T+dffcOtwm2YhFE9YnYFBbKuVaW6ZnOtsiPhHuqF
         RIauiho3+vYHw+qVu506CxCR6Dd1LQPJRpWybY8X8jUl+pQ7ijTCJJJKBN/U3Bou+9Ur
         iyFsG/dAMNSw3M57nmf+Od+YyjNNeOSRCknnItuz3t+fvk1BGnrSdItk5RIYkCKUkNxp
         ccBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e02CISDat2rnFU5auy1swbmNQ1NAggjZWxzVKQlZOt0=;
        fh=Mb5cg/4d8SlW5gdS+Y6k9WxtM7CxP2bfdTCUqAhwy7Q=;
        b=A31aqtvdO6UZxx1wFO0ywWXexns1C+FgW2qQEbpwlxRTcfDNOUYNvorW34779Cb9qi
         FpmXX5owRFo6RJV5XP68qcLlK+dm5Hsmauf+MVNwC2VR8CkZvt8LEVDD60GZCAzYijWw
         MAcUw2zc3ABVQhb4LNnVk4vJGxO8U6cN2KrLkeHuppp/TmBGKzoP8jHzBbSnQhr425Vo
         hKNsfFyCml82CKCm4AGCqUiNOo6M4BZv+4k78Q5iWk5rqmFpiMH9jK24tvdnSJTYflDt
         PXx8k5P/zx6rAFx3x2mh1X3aSn4jmmfqr5yHArCriWD5k5D2aWdWe8pRFl5bBVMO8/9q
         3JPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794384250; x=1794989050; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e02CISDat2rnFU5auy1swbmNQ1NAggjZWxzVKQlZOt0=;
        b=kzpLQfiwu0lF3hZg9xt82iPrgOdaOSV+6MVvCpKSxyopwjMFtTqsiojJJNFe72Iu9w
         S0FlRWDuF4L0+fOBKFDZUYNij3m2zmKyuxxdhi56DKV3i1z9s9+Ff0XcnWuvkiMUOSkp
         OOEV7WDrtpUE5dhjSELEiWfTns7p9uU+uFD3cndCvIMlMqfl76EhWstj8n/909tB4nPN
         YBqKSQ72S9FJAjQXpfBZyASR99LDe+xmnBxCHLNVyGoSyu9E/YCw7s0loJKC1Dlkkiut
         o0OzMR1VNT76qoDQLMkJeXMITaRo0JpCbbmSkR28fFObutvBytpPPfle58m2dri3z9Sk
         nRlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384250; x=1794989050;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e02CISDat2rnFU5auy1swbmNQ1NAggjZWxzVKQlZOt0=;
        b=SitputzE08h/+Ggu7XjOgjx+XZYMh4MP3wgu9/VkU8WVH5doch/6dQ6ytk9XExHW78
         1udQpB8BONEi007rddBn+IlqY2kMWTxdHyuJqRyoYPC5l6g4VXQqdTWJxNJ8zrxmLg2i
         r9RerX7BjJM0rLhbP7+nCdHAIrhCDLDn3XNwi+VgyCGWZXKg+bAlOGyLrx8kfQlUZshU
         51Z55ISwqnBdQtLpV32sjkS4I+v1WmsEyxhfK5FCzHzXR/6o4ZqjBKWQrd5OUOPx2etw
         oY88D+igTzutPjscdWI+j8IJOxp2rfOTJvFOEKEqgxf9Tr6bHgVKn/yJBYkTlMJnsNYA
         YcFQ==
X-Forwarded-Encrypted: i=1; AL+hErE12e4jUASNgHrVcxIpClwnNkDukkobJ8fzqNLKroPz7epnu+fI9cUiixVvN3kAtwXPlrcLb3Z4ZUUWcc4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CBiQWk0h2Xw70FTct2PbJoNagA/VRMiAC9UuGeS+Km+DHVWgI
	qmsJZ5QmFGX28+IXVxsPi7m+K6MvDoqbnMYJMAYepLGHRSrUb90ovEnbabZgzo7dBHlh6OOxHQS
	hMnWPfnCogEkqx8V8xtxvv77Rxp8gm2o=
X-Gm-Gg: AYBFou2Lf8czSuEOjK88DrdmCEyKe5cr8V3UIZ0xsj1ehhQjactjTb+EVuunwoRTBOb
	agyneavGj/4MJY2dQz+blrEWwpK6YPeFFZXvQVBMCz3ayn/uWZV7l7CZkeHeWmuCkCPyZ3pZFLp
	FesIvXmus+hUj0x6KkwGKHihtjebtPVMLv6Mks2ysM+AlOCGYOHtGw+U2yiST94BISDTdaIMfUY
	4t+5K0BbDYJ4Y7hlcosatsvq9EplIM49roP6VcOkwaDE/d6c5qaajoE0JffxBwXlhiKIIJEs0dJ
	kGFakmaJ4wpUY2hP/G3itx40oUTq4LUtnXc6GD1l1UmZODWWKanvavWuHNcwTYOU+oa5RV55g8Q
	8bnVLQjn3XaX2ZcLLoJqFXRmvFhMARzb3MJ5Qx1fk3IoBCw6U+vOEKnhs1CmbEsa5jkBOk4odK6
	b5NNLyAYjgnEatjg0K9qp4UUXx103+Fw==
X-Received: by 2002:a05:7300:561c:b0:36e:2626:4ace with SMTP id
 5a478bee46e88-3768366a866mr2441050eec.5.1794384249564; Wed, 11 Nov 2026
 00:04:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108151348.204182-1-clamor95@gmail.com> <8f84154c-0296-4c82-a887-de76558df94d@sirena.org.uk>
In-Reply-To: <8f84154c-0296-4c82-a887-de76558df94d@sirena.org.uk>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 11 Nov 2026 10:03:57 +0200
X-Gm-Features: AclHuK8vaEcJ7SqWAmNPakfkNoxiPosAOmNdZbgEthELf7kS-7VilDYNl0DIvFg
Message-ID: <CAPVz0n1LmYHJts91P4OU3WFiUBwcU6sA7Z9McOdLK6cLu6PzvQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] leds: Add driver for MAX8907 LED cell
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Griffin Kroah-Hartman <griffin@kroah.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-leds@vger.kernel.org, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 10 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 21:0=
3 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, Nov 08, 2026 at 05:13:45PM +0200, Svyatoslav Ryhel wrote:
> > Add a small driver to control the LED cell provided by the MAX8907 PMIC=
.
> > The LED does not require any specific configuration and is folded into =
the
> > PMIC's node.
> >
> > Patch 1 of the series requires this patch:
> > ("regulator: dt-bindings: maxim,max8907: Convert to DT schema")
> > https://lore.kernel.org/lkml/20261027114634.79706-2-clamor95@gmail.com/
>
> This doesn't apply against current code, please check and resend.

It requires commit converting max8907 schema from text to yaml to be
applied first. I assume you may just ack schema adjustment and it will
be picked by Lee, but that is up to you to decide.
