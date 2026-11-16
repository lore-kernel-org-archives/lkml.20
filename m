Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864138;
	b=TpV/z4UpbBtf/0l5KBRNjQvCr8BVPwGlLwrtU5rcg9Yanyne+8LvznlJlIxbVCvAFeNM
	 n50gRue3wM5vpcp9eXPuJYWF4iZBfvDSs/Y7Rxnn/KQK58FP3Wqy29SzldT2O9TcaSMGK
	 QJwkF/+oho9GO7vwIRerxtUwxaVg+M0qo4ZwSAPnfriiK4ENoJjMrNN4u3YQfBPH7mRv5
	 m7xhFw7kb/daP39cOjFoyFoCww1VSK7cT72JLxM5f3oI0qdglvrBkWk7Bq2HFArs3OncH
	 KGvz3rTwOkmjoSjx6ft/KYyP/DamrkrZmxQx5NYac0KIGWQJoS2x4h77SwOzeal8RAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864138;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=sJbfjHwLUTndWZHf1I31qfbGZOpPu211U7CheHU9eZ0=;
	b=4D8L17TeubCBgfwkYKNqUtP/gyhH0IjK52PhXT/9wu+aMRuJo4ndSRq9afL5cdg87TsB
	 eIzgnUWXfwzxRfjn8Vo/pSQ0hdTSfGgOckoghmpmjinpkcpioM4PKZ2uirHMIPIjBxyVE
	 UxVxZUPsy9QtE6EQ42xT4G4CWiRiOjymMf5va+cQPhRy3YhTk416OA9dmenyrvWAbmFxq
	 lcNrl093iuT5PYgskwQWzqtdyXcftP5UygYJcKqcUUHiyrTtTqLdlLZIlf4Ta6XIjKEFk
	 RWAIatfAMsj4P3pBzyl0agEXxnIEXAMo+ZBIVEtVyytcK93n0X6hLmQ4nr3Xj3KuHaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fml0NyDu;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795A3606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:22:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 795A3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fml0NyDu
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-490585eddfcso2809643f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794864137; x=1795468937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sJbfjHwLUTndWZHf1I31qfbGZOpPu211U7CheHU9eZ0=;
        b=fml0NyDuK4xOqqbN+fI7brgmiTe4BvzUncWHAL33hEJOTxY9rQ8kEGkFSaLlKY+dMd
         0UGKD4v7GTNE/oFJc+46i8YikeY/SPgj7aS12DdFBzujza2rO9Namq+HGAZZHFAxrEY7
         YNUa4rlvd3wziHuMuWl8/deLn/JNeh8FG+4T/wwD8/mdqqZt+G6VtlOy1zzlEOw2jjDR
         x3TvHxRO9wZUpG/9/jMcIhqtE36KzRFbCkbt7fqJjP99EE+CYvoSEv1SggckjMDCS5e7
         KTJ2O5vURdD+sLTUzeprgZxQcV3JfDLIpZOOfY4gv4bDBn4wNvQ3knEDHVIkOgypH8TN
         JVWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864137; x=1795468937;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sJbfjHwLUTndWZHf1I31qfbGZOpPu211U7CheHU9eZ0=;
        b=ZutxQyX01N2vnwANUGPyKL/d7J8dHCJpQokVqnC0nqUyI1KZ5v4dz4Y29s+bsHzXjA
         2qfwCZFoGogrDIm8nDMBmJYHVGI7nTSQpL7groa4wyzNj3Ht7tz0F7W5hxz1/UzYWacB
         tol0+R/7Hua5DWzLG2qmVuvqK42FMYUapRHmztGTBUKVRhlBYnAOPPKArh2bpfWRSDHZ
         3B52T/7tgpYdnb0W9De1mei7l3G7uKTWqxGjhXFzBmCbG4cCUL85Duvbf5ouO+Jzee/G
         lWqkJvbVBbVzAjk/EtKsBrYkVdRzKE3A2ocyL+kpYos+7LfpYXWYyZ7VtoPflxyTqeH7
         hLAw==
X-Forwarded-Encrypted: i=1; AL+hErHUiahx6Adhvb5rCMqgXUzZrd1hLiV4ukIq5sh7STI8Y/HxwblD3NP4FD6wJ9ozbTavgWkY1mFBQKeu9FA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mKmGmCGSF5FlNc249WG6BF9bnOhg6HctcYj280wD5IEXUNZNO
	8/euqQJ/K6gMFOZgtEgJZhNY39P7ItQ8c7RxUJq4iekN73V0Il4jZ15TjPiG7mX2t+4=
X-Gm-Gg: AZFdTZcJyha2rojGUXgZj8snV3ffLiOT1DfdsFimLWPgQzc8dxYiOdgUz28LotJzi6P
	GXoqCU/8THKEOOtML7n8WIhIRcwlXiteD8y2c7HKqe3gE+cY/+NS/qpv9z9+trKGVdpAKWiXnrA
	u26izJf2LNwsmvPNAPsww902XXxJTR0W0wjJX26b9nGICW6+Rzk2Eg7loIOX9UE/qh9prnj9dy8
	X/n+8ZFjhWJlFWDzDrtRKvhsCRajJOwFKL8mgS/LyMuOXe19+o68cDtFRiYJ1cdzMO9YnWWjEmi
	RJHj4e5hlLY0az1hlGGAoHUoN1eaxguNCmtswAmq3HAvACBx4B34qn8YryoO2VxWIwLnS3jBVFo
	MMmMft2GEldQhMtPoC6ky7TPDa4lcvCh39tghnOHif+s8yyDq6enbUPW7ymbgAjlCFJLgyXN52Z
	nQOGnC96Lzg+W97tlIb3WxQIeuw1joSOlPPBuZ7huLexc4Fw5A3J/jKwOi3I0ozqiD1lCiiWw1J
	0R7GeZ0xUG/7fT9zFzpjEsL5UrONd+Zk1BFVM7twRrPdUlERw/G3HDsZPaeCD+n9aRcn3pOq9jH
	Z/G9WOAR9cuCqJsUTQVHVkhNwpeA1c1a8j9w0h6dsDHSMeZskh4=
X-Received: by 2002:a05:6000:4284:b0:492:820d:5e6 with SMTP id ffacd0b85a97d-49c72ba6660mr30296893f8f.49.1794864136472;
        Mon, 16 Nov 2026 13:22:16 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c603f4d29sm23832144f8f.35.2026.11.16.13.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:22:15 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Zhentao Guo <zhentao.guo@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
References: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
Subject: Re: (subset) [PATCH v12 0/6] Add Amlogic stateless H.264 video
 decoder for S4
Message-Id: <179486413508.1210949.15857134761629837585.b4-ty@b4>
Date: Mon, 16 Nov 2026 22:22:15 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

Hi,

On Thu, 22 Oct 2026 13:26:58 +0800, Zhentao Guo wrote:
> Introduce initial driver support for Amlogic's new video acceleration
> hardware architecture, designed for video stream decoding.
> 
> Compared to the current Amlogic video decoder hardware architecture,
> this new implementation eliminates the Esparser hardware component,
> enabling direct vb2 buffer input. The driver is designed to support
> the V4L2 M2M stateless decoder API. The initial phase includes support
> for H.264 decoding on Amlogic S805X2 platform.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (for-next)

[1/6] firmware: meson: sm: video firmware loading via secure monitor
      https://git.kernel.org/amlogic/c/fe6c77ab883ecbbcb2d4731a2a5d883a9efbea30
[2/6] firmware: meson: sm: Add video firmware loading SMC call
      https://git.kernel.org/amlogic/c/a47962dfcc5a924d3b824ec7acf56c0c654510b8

These changes has been applied on the intermediate git tree [1].

The for-next branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

