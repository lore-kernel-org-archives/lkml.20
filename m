Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506984;
	b=Yg4hDtMzRx6aN5HeyUXWNakqC7ESOeUaU9S0E85YmhXg7XJUFImXeKddnM7c0CzZa07D
	 qOMS5gGao13ptHgyyR9qVEE6t/E2r5EK6746/uhNnga85pru/p0ZHvLxbWUl0ePSg1emJ
	 ld4cUlgbSb4195raaiCfiu/d266WXC5wamM+92w17OaO96u81KEamyc9F/wxsCj3F88sp
	 kLrDpbFPvBAHr2rE8PSPSojMghr2UCcC5Mug2jX9AxP5gss3lMbEAPU4jejMpIvfV8RRq
	 h1YgG2HVY8NZAoFaxJe3fDq682oMoWxkSPaJOTSnopStgnj8fyMatyQMwEjfSrhL4tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=GikeMcL0RrnlrjkigfHn4bmphngNDtuGpxDpa3/PnB4=;
	b=Q7FObfgX7V8gMng+ODQ5HSLGXDVmkqjfC5RUmNrv50WKVi26fAM0a9yT0CMuREnlp8oS
	 mMmp9nI3Ua8UD8XJSVLuZIeP2IWVP9slj99HTulmReaPS8OzarxGUFDObF+oPXk+L1OCV
	 uHGCSrugVgJWXpCcc/KYe7QESZhuc8evOaNHpPUQMN0kFsu8oSy4zwLcs7sncywXe+t12
	 XuV0fA8yggenJf7/BDw/glK+xaPMYUYjKSL3E9m4k5IMNT+CCXo0XNai4qWys7Z7xrskQ
	 lAJRyiaXQ10dYK3FF9U7BV3roBEcAW+BfR/5j8fxYHkYLohcF5d4VZtBzxGBty7vFqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=GzwKj62z;
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69C6606A32D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:36:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D69C6606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=GzwKj62z
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-53512cd2f85so37280111cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792506983; x=1793111783; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GikeMcL0RrnlrjkigfHn4bmphngNDtuGpxDpa3/PnB4=;
        b=GzwKj62z5bUVTtMtQaRtXDHyPWzUfDqBcPNykSSm7jJ4lOypBEf2RbuZf9v4ZujGn9
         HrerrrRyCJguaiRtzcQgDA3kdfU0Xkc3WrfWzAGVK2ulKWaAhnnSPpMYs4tWfExeHN8Q
         tkC7A/WCtJmPQnHWDnKVbNHD2OuNTzQjq6IZkiL9/GMQhS/NwGkqE1k9W9QNVIe1O4QQ
         bp5Ih47xFTi/rp1McFFydlFAwIe1aBrxcmsuWjGZSgUxozeTP9s5kXRvkstuolCZpR7K
         i5lEW29eEv0l8Xidr9MpDH2WnVN4zuba8GCZTRkMhv8UdCTC+V9z13+RJEWLQrlbCgK2
         +/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506983; x=1793111783;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GikeMcL0RrnlrjkigfHn4bmphngNDtuGpxDpa3/PnB4=;
        b=j+mxH15Qy7STl+Pzi8v+FecErNz8cj0kkMGOVG1mYFFnhAuxZ6u4APfaU6Q/SFfMp2
         TPeRpA1u2VzISB+NnUkSyOkfAKNn/lKRy/+9HxbtHnog/SlvOf1EbcRm5Uc1dkYZAa/e
         Iis6xqUqvgVnpGOlUwICyu/ROsEByOlWUdACFvmDAQZKJYtuIyMCNHIByr+YkWK057jZ
         mMXIsSANnJfEey0BuV79Nk/3Kb1H+ByRTIXc6LwmdIUa+KLeF53eaGwxi85rZvBstpIj
         czvKTBLd/syl2oIbAzBiiIoW/sH8r9A7rbUmpKWnF3ORf9LdDkaOkeSRYBcOYzubRUyY
         y7vw==
X-Gm-Message-State: AFq9FYLZLYuZfGiNnHiHNuJLKZ6xLtVz6FABKh34fWLp4Z3J+N1+TxRU
	2cYISqsF9jsST5+B35+C5YF5nKUCrmFI2DOx7iYpc4Ex1lD2CtgVmX5Bh7SUR0zbrqs=
X-Gm-Gg: AYBFou0J1OyqEpIEaN5h7J5xtKj9yYwUCABj6TPouKzfNLVmFwKj0oppTeacWZndta3
	+RnjzRovVMN4xTAvBO73+a8SLaQ2YGuLf0NV8M5ZT4Rz4VWVQ2a1a58yhh+XwvcAdq1/LHuvktK
	3rtTAeRtyXa7inK1xSN3jC4+efgETjIWtqUPnqEs1sR6oEIYIBRzH8djcQJnmkEagI2g9Ayb5fB
	sAEjlc/Vfo6n4ACnW/SlN6NazeiK54xF0jC6y4GcM55Y0AzInxWJXv+Q0T7runsEu5iU3KABgMd
	TcDMaIcxjCqqi5tA1TLiy/PZK9o5GEmqWfvjs0opSS12nmGWtoKCrBKz6484RLVWSsvoQWk26nI
	NYQkqqWhwghcxWtvfRSz9i+/EG5rTUYdTo2yiV3byKXA9AQRHLQFlnJVff8qSe1o/2moQ63VqrO
	YO5PUxxnyzT5Bw7QPbeG3h0RiCIvFzaZc9uEQeljS466wgBIQ9Jwv8uFcmIikhlfx5wTQZNKbNt
	FQlZ1MucMM1niLN3/at/WRtP21lS2n2ZhSzOmN6NrsgpenPnMAG0hHg
X-Received: by 2002:a05:622a:2615:b0:532:e4bc:b80f with SMTP id d75a77b69052e-53646074ce3mr154755381cf.60.1792506982644;
        Tue, 20 Oct 2026 07:36:22 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53636731fcfsm111546931cf.19.2026.10.20.07.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:36:21 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xJAwu-0000000CgOq-215N;
	Tue, 20 Oct 2026 11:36:20 -0300
Date: Tue, 20 Oct 2026 11:36:20 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Jiri Pirko <jiri@resnulli.us>, GONG Ruiqi <gongruiqi1@huawei.com>
Subject: Re: [PATCH RFC 0/3] firmware: arm_firme: introduce FIRME support for
 host attestation
Message-ID: <20261020143620.GP14213@ziepe.ca>
References: <20261019-firme_interface-v1-0-27895c9cebaa@arm.com>
 <20261019233532.GL14213@ziepe.ca>
 <atcUoSdggT9eU8YE@e129823.arm.com>
 <20261020124536.GM14213@ziepe.ca>
 <atdvnMJuHUJlqX8t@e129823.arm.com>
 <20261020135006.GO14213@ziepe.ca>
 <atd2_9Q2wTv_3MXz@e129823.arm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atd2_9Q2wTv_3MXz@e129823.arm.com>

On Tue, Oct 20, 2026 at 03:13:19PM +0100, Yeoreum Yun wrote:
> > I wouldn't over complicated it. We already have smccc bus to do this,
> > we don't need layered stacks of busses here. Just change smccc bus to
> > be able to break up the multi-function SMC into several devices.
> 
> I think my explaination was poor. Apologise...
> I'm not saying another bus making but just wrapper of smccc-bus APIs
> for firme specific and definietly, this would separate the
> multi-function SMC to defien each firme device (attestation and IDE).

I don't see that kind of complexity is necessary.. I think it is
better to just have the root smcc bus spawn them 

> But, the *base* is common. and I couldn't find any proper location to
> deploy *common* code unless making arm_firme.

What common code excatly?

There shouldn't be? Getting an attestation is entirely orthogonal to
set link ide, for example?

If you can identify what you think would ever be common that might
help clarifgy what to do..

Jason
