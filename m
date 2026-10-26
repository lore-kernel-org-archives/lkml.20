Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008813;
	b=1xf7Ez3FBpF5WJjPxpIaaHQaaW5d/tTe4DdmeyhTGiNN9gX4ORQn8gy4TujoEMnoHhwP
	 uVWwaz+nVLQiiRiRDxSV9NBblwP5l5xaWRJwJkBqSZki7DzBFepT7RZYtIJu8KYuXH3c1
	 6AS/sEqNtLBUx+JOKoYJtWYCrT1sgKSF+pweCMBukD6W37CBiThKsAys8WVOthwXjFz9T
	 UeDmMsxkzGpt/MF3ELLUoJTw7LMEijbETWAgFgFw2HJf9MbN1hhNDENdEMvfBL0BQnP5X
	 Vbz547DcLtkBNS+WmM/S7hJqlSuc5cCpLD6YwEoDb22lnPAZKarLDJiHgMNfPT6Uofw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008813;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=JxMaWVtUV0uwXPkwo9Mu+D6xSwARN7kCHxKOQvkbv58=;
	b=2oYgcaOGjMvwqNmVpqWsnZdbW1IMEZ9dEaQh2u9HLC6vSjsiXTAs4H6AAbOzfL3uNdxh
	 RzTzpDXqAtW9++/KV1ctu0sxXzrX5gorokwvBTPoQreS08tqCB/cv2UYvor7Srp2D47vP
	 wpMjNkBuBKg/sEr+V1UjLqqDqSlyZXkYhtmdb27AFOaPBw/mc610r3stAmePh1AlGovGr
	 E/id1Woko/nNS7YXvItmMmeq42H3hcVvZs7cYlsH4tyIWF3gaRmaRtOMh3KtZDv0TnlLd
	 g9MjjoFFrVwdCh0IssCqydcZNkNSAZYY6nKqutOVKKSfKZAXfvUrRRxrgOY8QFDvrqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="rO9H/JJi";
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD915606B468
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:00:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD915606B468
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rO9H/JJi
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a208d93758so32041655e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008811; x=1793613611; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JxMaWVtUV0uwXPkwo9Mu+D6xSwARN7kCHxKOQvkbv58=;
        b=rO9H/JJiNVMoiSub6cjqmC2tT3lU2Gip1qc+hCn0V192ZnRtIPYPHh6ywTdpoL67dx
         u0E7cWwXQA4Ww74WYuBC0SfnqVTzEJ/B0co6Fl6RmJkg9VK36ePgDIKRuio70j+Kniwj
         9WtODl4KfhStM1ILHf8rjV8fU5A4nVmr3T+itpLquLk/w7elg/qrpM255BdimiA3QwTq
         u7mjNK/St9prrUNO6Z8YLgWR7PUBI5gbq1c+4L6Gv5QI3VPRBcdpc1nd3ENyFsQhtl+G
         I7hSH5iUvaEl3Nl2u1zHrqlSOxmu0mqhcre13RDT2dxEFypZ1EKvE7wbxXIStUPHvWYq
         0mnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008811; x=1793613611;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JxMaWVtUV0uwXPkwo9Mu+D6xSwARN7kCHxKOQvkbv58=;
        b=UktXfeIQU+ltc1hamVt0JHhthzcs9cQFpsCsnXg5Psku+nM1S/HxoYIURfevQ6aAcg
         UkQkeGkMk0UU3wy5n3JwJzcvWZrXOiq+aFdVr0ffNHLS/h/7P0FbUAdPFAk5vp9T6my9
         9EjT3fL88vMnRNPKAJ1z2E1ga2gogYnLXPXmNNEKf5ar2PLqVkpUsWHA+rJeyGSsFyIq
         hRGKt1cNUelKI5vhTOKPYE/Xsc4nzcX8p+IZVAIRrpb+jYM/Cz9Ei2KKKlQKa8fhohe3
         F8C9fR+ISyEupORWii8gabywmhGYehhiCWbYXcDxavhNmFVtoIgpwfvWiai/lwscqgT7
         LMjg==
X-Forwarded-Encrypted: i=1; AKwUvBzHXgRbIwyUiHFjt2wz1EfFCN8PSl5BRuZmC35q0FeW2/XQ1zI4PYgG1ldUJO4S7xHfkQ0cCv5/tR8fzwU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJopiaxp/ciAG2TKPpCdoyw3HmmpjUTiGzboAG0MA/hmwU6J2Ao
	KHkCEbfUZMbmdW6iW44rF2dKEZUbxPApweXogXhFp8ZjqxPR+8Fuf65P
X-Gm-Gg: AYBFou0IpngkIZLeR4hRnX8e2bIXcki/33WHGW1XACwe7IBBw4Q5Zalm9/fnlOkCZQi
	laQWJonueFza4BGty6Z1/LhrwNKWRwX4iEKWuvN4uU6c7qVy71siT//g81tu5EvmbDr0R4iZgUb
	CvEClmfQML+Ozv094XjrvHpiSFbHDu7iWCPuoobtXFqWdBTJK1wMqCcxibYbYKRBiwfSjYZRcyE
	xeAAs4uG1N2mebXGhQyPJes81dA4iZAw2BwHqaSIt5/hrVpwHDi/r78eS+G+uJZVqBOGKCkx2V6
	4UesWesNPe4/z5cVm7pCacHb6ikMOs/9eCbGzLxBjy7fyfg+4NEcObD4wj4odnk8LIZNo3+eH+h
	AukQOLR9FYvhGUMOSqflLtOmw1PGr8lIb9jCgExuILJSVG8s+VEMOPrB7dcBuB+zNBHc8skkNLr
	Xy8Or//0Z17BrvaoRZ0x4t6r4BymHXbiBzmPEItuK3ptkwqZfpD9ZxUzZVzVNCl/feYankSRQHI
	ycTV2BVsFTsJe11F9JPgw95XwCZJlo/1SwJ7CZ4kTbK9TmsGoCIvNtqVk/qmEGmhje26lpnRAfN
	AFYPc7QhwYFbtTJPoDHiMYOfdLzsWLwL1eZ/oeXCgPN0FmRiBMZAJ4/XU2UfIM/Q3VCm8YbJ6cU
	oF8BETqGh27SyF3jHlRJDBuEcftZewwPM2Lg6mpySTIRCqK0uvqBo1zkVr1NZFlZvPwYBwSuthv
	imgwsLbKzDPiTk7XQGKtrRop3cQgxGQU4QYLqbB6tHzloWHUo9eAJYIIZJ7hDQdw==
X-Received: by 2002:a05:600c:3d8d:b0:4a1:f377:5c75 with SMTP id 5b1f17b1804b1-4a35acc2edbmr93717435e9.33.1793008810377;
        Mon, 26 Oct 2026 03:00:10 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359fbc718sm154241835e9.2.2026.10.26.03.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:00:10 -0700 (PDT)
Date: Mon, 26 Oct 2026 11:00:08 +0100
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Olivier Louvignes <olivier@mgcrea.io>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul
 Cercueil <paul@crapouillou.net>, "H . Nikolaus Schaller"
 <hns@goldelico.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] iio: adc: Add a driver for the Ingenic X1600 ADC
Message-ID: <20261026110008.00005296@gmail.com>
In-Reply-To: <20261026083631.48406-3-olivier@mgcrea.io>
References: <20261026083631.48406-1-olivier@mgcrea.io>
	<20261026083631.48406-3-olivier@mgcrea.io>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
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

On Mon, 26 Oct 2026 09:36:31 +0100
Olivier Louvignes <olivier@mgcrea.io> wrote:

> The X1600's SAR ADC has four auxiliary channels, each with its own start
> bit, interrupt flag and 12-bit result, and none of the touchscreen or
> battery engines of the JZ47xx ADCs that ingenic-adc drives. Add a small
> driver that exposes the four channels as voltages against the 3.3 V
> reference.
> 
> The registers are in chapter 19 of the X1600 programming manual. The
> ADC clock divider is even, as the manual has it (an odd value divides
> by one less); the vendor kernel writes the divider minus one, which
> gives a slightly faster clock than it asks for.
> 
> Tested on a HiBy R1, whose play/pause and volume keys sit on channel 0
> behind adc-keys: all three read and report correctly.
> 
> Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
> ---

The driver looks good to me now!

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
