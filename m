Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6E6448B9D
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787923845; cv=pass; b=SANMMNbmQ6ML/THcFXkrYXlXsot/rhTBBix8BYsC0nK1hJ/9642Uu6M0jlrKniN28cdoUL5n2gW6TrxY0kdFQ92fvgZvXOWYDxwI4wGawxv1IMnUJCNkdp9WQjkBc8u6G5/2OKVo2MoHOmVQWQWFRypvVfkaTk9L88LN0VmpXI8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787923845; c=relaxed/simple;
	bh=hok4GvjDE1nmTNyDoS3DTDjsSlvgrhNExm+F3J3GMLI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J4ASX46mGI1gLqS+eqPE6g9uNyNSBe86xudW7QQFXAMt/7YkN715c3jekaxpaOUuFkkrIkc8YtnsFbt+9cEVrg6z8cSvyyfFcIj3hfLmXcvhjEALX6PHlqJVnBkcqX+HCCalqcP0Zpim1Awk+YmTey7SycG5mLPCAN+IjdEcI5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gfUlmO8b; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gfUlmO8b"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aeb99bc721so130885e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 06:30:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787923842; cv=none;
        d=google.com; s=arc-20260327;
        b=FZRrYOFz0/PsLS1ky+HjGM1H6kF+8rRliOZGtDmlQxX6h6Ro6DAsz7dxW5JZi7cqrv
         UbeBmhOfnGga8SVn641Ns+Q4wOwlmb0nTvjloGOEj6z9RTzLZuxlEkHBYF550d8vnhBk
         9PZ6E9DDkz4tZK7yyLO6EEXJCGBNgXQVjFtqrYl6RtCeRdHOciwnn39SbTYdfZ0VpWa8
         q5fZhvn4RjWV11thizxMfYMTrznaWEKpoQNCx87aBDo1VjlLdVuR5f8osSiM5yuuyYZb
         zuvO+G0cCUZoaXKXsFMYF5OHhGUrWNaPXr7CmQcA0Ej5ktsg4tVovXAKZzt97mMcINaY
         W13Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hok4GvjDE1nmTNyDoS3DTDjsSlvgrhNExm+F3J3GMLI=;
        fh=xPuz95q9vZDhewi3BOJHIoFI9EXABMGqAFBOA86Jmn8=;
        b=JtO5ymtslg5OdhvwdKT6E4ld/pY4EDT1gK6hdXDa55gzC1CUTiMoFdemJtZcGdqv+J
         LMf36+meidtO1OVp7JmCRjKYuso3F7m585szfDNY/gF/juuWmMk+ciaPwPLt6aFKh9Q1
         Qn/AA12H/6Je2tqIbBOPHMh4La1y1xFgLtYV17ZqgrnDhH316GB46rWFvuKRhnyhgqse
         mZ5XJMAUKXVuC93KsPeuorvfOZtiHBqsm36nHkoYdGa1mWIv0FQyR461SbPolPIyt2JS
         EXDZw6w4Bf10aE/6mho8pYENhUMMASrhnM4s4T0sqYzQWOhtHJy6z0zTRl9ATWSoQnYf
         dYAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787923842; x=1788528642; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hok4GvjDE1nmTNyDoS3DTDjsSlvgrhNExm+F3J3GMLI=;
        b=gfUlmO8bnKpnFyWsx+/8R0WWocZCifqJJPsQox5wNMj3wqidfp9chD4s3Mpblxg0AB
         t1wdB39Z27EsLPNEobzSvf5dpFozLsDU59pFmdGeg34bqSjtMq63f3bHSymHplU04vY9
         rEV4XLPVqKiKE1G0x8XKLUwhzeCtWdaEyiKXyMBlS2fhw2r/cNyuDnga/NA3spCou8dy
         kEaKKlbekj2epPNjarr9IjKG53JJTeOsanvftt5H7BeZJET7QE57kUusvf6wuGEmhTkr
         yormKlWpnGL1BfmqH0x7t/nHUwMfQeIxl2pFOdbCZVB9wrtOkPxNpanCB/tyQBCW3nc4
         EwvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787923842; x=1788528642;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hok4GvjDE1nmTNyDoS3DTDjsSlvgrhNExm+F3J3GMLI=;
        b=e9bTMX31B8IrayBl+OuED/vli1bJkENU0EWibTJi6usrKbylOt7tHw8Dl+xIq20B+l
         40h4BjOxqhbKcrbR8srQJ1mOsuoid+T/XH+L4MAGPghhLi5AnTpVfFiYJkKG0pgC0JZY
         D/h/m5DtsiGdghtAH63aDyxcSPfvwMSPomfUpBIkx3SjsO8BacM0DzSf/898nVCdvUrL
         oSBPGD3oJ7K2gbm8yoGPf45g3592cYSJzwKE0qY+tjNGMcEm7ubjgjnC5abhmCi4Sq1Q
         WWK0MPkud2uclOQnNY2/2S1LKOJshUxriALR3bMHfCldlLZ7GGAxY9l8V6emKV3Us1kb
         oEFg==
X-Forwarded-Encrypted: i=1; AHgh+RqBA7d6x7HJ5BBAKTSduoLGkxkF75UqCHaLJxUpNxs7Jnn/nbBFo1y0qFu6bwwGYUyMN21TcCI+yzDlirU=@vger.kernel.org
X-Gm-Message-State: AFuF++nuuYU6TSvA/fnnLCnhLrYXcdYYZ/2sbK3a0ZHeXXQRPC1VB3Yf
	8NBrIHgJye2b/UrC6VXU4CTrmqsgu7GtTe8QDeDxv5OV1kqI43Vq9ILXZ6XjvNrScuCyaaxMvW2
	VW37z0kd7CLUKWn9RGDMtq478V2nuJZvCXFY6Lzs=
X-Gm-Gg: AR+sD11jgCrDmNKSHTBqFu+SA8Quv6QbLBOOxhTZ6OTPAqk1yGoMG9diptSJ9tO1DsF
	ec26SiH67WwupawiE3igyNcXhnHnuo8IYacKsRQb2Vw77Jk7kNvs2FzZ26fIhDe/55WUnyI4nTP
	aXfKXaUPjOGb3i4gHceyvuFErpKWNHcslV58boA4sgfj69QdCnpobUPJxkenxMpQRZ+uHnu94kT
	sMAolttq/UglgyvCbuqjapNz4BjzZQAcMBRo0HAK4Pf/FDkZ+pI8+l4pb4SVKSfPEfmi462KcSE
	TF4bZpWPXFW97wal0iPYQ8mMxstp3tAmD/rImnbxJcsUgh4OdJZdh39wUteo0XG2vdJS1FDomzi
	U5kg10dQZFieBQRErd3uAHZ98DTtNs5rByuE8kw==
X-Received: by 2002:a05:6512:118a:b0:5b4:4c8a:abc1 with SMTP id
 2adb3069b0e04-5b5e6b35c5emr1180327e87.4.1787923842021; Fri, 28 Aug 2026
 06:30:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803163427.74445-1-chenyou910331@gmail.com> <aokF9v3orE3nBz4D@inochi.infowork>
In-Reply-To: <aokF9v3orE3nBz4D@inochi.infowork>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Fri, 28 Aug 2026 21:30:30 +0800
X-Gm-Features: AcwNN1U3qtWfXakKgSZWrBm0x66_gbL--qvyFVM6YD3FiR8B948w7osQE2VTpfk
Message-ID: <CAKspUhKtnmmB3UmfqgXa1Ciq=qaqHCmdTYfYDa_X-4WJSQWmfg@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: dts: sophgo: cv180x: Fix internal ephy node name
To: Inochi Amaoto <inochiama@gmail.com>
Cc: chen.wang@linux.dev, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Longbin Li <looong.bin@gmail.com>, 
	"Anton D. Stavinskii" <stavinsky@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, 
	"open list:SOPHGO DEVICETREES and DRIVERS" <sophgo@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

> Please send this with the same thread of PATCH 1. Otherwise, LGTM
>
> Reviewed-by: Inochi Amaoto <inochiama@gmail.com>

Understood -- 2/2 went out as its own thread by mistake. It will be
threaded properly in v2, and I will carry your Reviewed-by over.

Thanks,
Chen-Yu
