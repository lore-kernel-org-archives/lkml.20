Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794744973;
	b=jPKjZfN7ow8t313cdOoI+xGs/DLtSJ4paXw5X6Gx461l4HSnXIyAL3EihE1/l+xesq5D
	 us6nLIUHdguWfX+W7hrmg/5xHOiTZzqUv8Lo2N7ZDcFRynDKWWN7e0TOaHpeBAVY4QSST
	 w138s8txm89RI0I7D9KTjkw4n4tsIqHJpI4++AM4Ddr0FqlrluEh7hx6V78mtqQ+d6HEh
	 bUD+GkVhSYmWJxgZiONLzVYDmWmtLtwfzlzKx7iQ1w8p0OFIs3VY01rDLDVoJ4/pdwBa7
	 EOn3s9OgpZz+fSVxNhUpBtiREKENUhEgVtIYwMU2Lj4v9cF+SqXJX8DwhynkrdanNRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794744973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Cze6EXMazudJouVIRWBezoVb+gMXv48f+e410Dy7G9s=;
	b=LBFmnXmSyu9BxkGOWSl+sRST8VpqKqFmmL+F2dhALqPh0kiX02/PuEQL3pS5IMiTiaOF
	 sE7jEh21ba58JPLIcCvBn6JUMyiujSgJy1W0v9qAdcWDWJEYRVOlcuNw4P6rPVC24WCQo
	 /CvKvBrhHcqyLHG+I0QRe3JmEVA5fZBS9K0p9MOnrjejHChWtqW1N9DnGwW3ToKnbgSVm
	 zyQ5/D5lENOHeKA9ZBktWtbY0taHmZQLpXL34GGBkhnsD2iz2TzRkGqJwEx9KoZEAcmVp
	 1P6/14BzqcVhzkIRo4ZjY39VXEbK68o0blazA9XuilW5TWIpqnehHp8MICbDE7e6mJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UMWGuZNB;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17997606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 12:16:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17997606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UMWGuZNB
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so26822865e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 04:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794744971; x=1795349771; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cze6EXMazudJouVIRWBezoVb+gMXv48f+e410Dy7G9s=;
        b=UMWGuZNBsMnss2pwsw8rRFNOryhk6F4P5MsSQtbTOUSYf7p8ABU3vk4PaN1KFgXJ4m
         sLw57i7wKveAJsqJXa81ii4bayts99u5hg3J+aNyMOI795yl24cB+IpfYz5/HXSDqzz5
         8J81IXNBLkrq8pNuLrlDSWMlsmGEW+JxD6BDFcXHLBQjB+J9eOnH/escoFzz40YDBxpa
         l4K4aqxKU+xhxj/c2gSNDaf+IV7G2FNCNjefQ2qzQHvzhnP9uPM67bTReYKQRNnzW10P
         /U8EwovAUK3sCoJtrorcb/qNryT5hTEQM7Pctt8EMwGpw2KT7wD4z3gD8bIyUjh/OWZF
         nvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794744971; x=1795349771;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cze6EXMazudJouVIRWBezoVb+gMXv48f+e410Dy7G9s=;
        b=vP4tIDruOsxW9kBRQAfNZv3dDXpWXI6rpnL+UYIGLb70Y80vsAWUoFoucG/Ga8Tugb
         +SV0jS+qO1wu22kyjW/gK95kNkmQLEp7OsJOv+Zv8Es1j5lQthf/c8kcZgdU0UtOVEro
         HLaluEfURFMINJVHUFN4s0bi2fey+qXwLDQlMAAVb+10ucq/R6DXOPmWZuFaKpaT5mNq
         Kg3/0eBCrZmkNY42PfXlOi5hR2OFizzMk42xoO3KVjEf6WUNdvx57XTqUp4o2LH3XlTZ
         SAPyIytWyoMgR5kZevdHrCnV8E8nPoI1Xv49p8KdEqzs5KtvNi2fIT+Mo3VoGxWE9no8
         lp/g==
X-Forwarded-Encrypted: i=1; AL+hErFKWpgzywkYkm+Li2f6wY7dUQMiSMZ7Y54rZmLoaJNix4pzrLNTNcliHqNo9IuU1MGN+kfk3DOpB8oeGe8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JoI19ZNU5+r7St/cSK+9Qvi9TeOLXI38wSDJUVTzBsoLqDuPt
	O28uqa3mAn8Oxcic3l2ZdAfeWHRr2wRQWAhPhHrQZu364oE8FPkbekZcaaZCpHyZTt0=
X-Gm-Gg: AYBFou0MWoBO7CdZXLu4lNcFJ4oT7+EMUPCxGSmGtM9LRmAp0PujWKWdMTWw/HoDfoE
	ebhgeAqq30GRdecQXlSif0sKqtV/lTXNRxHCC4VfeTuG2r6TU3suwxD+kO/gTPVGIMdFGJZwd5K
	I7ZHuj+Q5p6oNKUcRPtA6LmEusP8L+BVdKzQQXyU+Q+x0P8E3Cmy+VGebBgX9gOQaguDhh/QADe
	+9pU/mMb3bPl+Pbk9QwcqZHc0c0KTnWcg+QRxUpWHYEoEHH+bxcLElEZ29DJhemQJMdOkkxJ7Ft
	qPtrVt6LagRbkOWDmLs6Jg9q6G1uEz9f3Amrh0osCwqV1I6/qrb2eQoUndCagwT1yRC6FcCm3iZ
	b6PZJoMNhlV42bP0FebNiC66H/0Fv4Cgbz8ypL1/10tczGxNhGZEs3sIdx/v28GaTKPnkmbjG9h
	cXWEFf8Fu9WpLR23VlF00i/2pfFNvwZm0pYvqPWoN09bUrHTUicbdH4XUMpC02Il9XeNIMYcXpP
	BUgaBR+5N+UC+ae9wSbYImPMt6O/QaMynqUSBXKu2pJ0b416WgLn2TR8hlggq5Tr0QBvPsm1mkE
	Oegl+A7pamgT0MrjjJibd989ASbXplyUOwUiUW8XW9A=
X-Received: by 2002:a05:600c:8b0a:b0:4a1:da58:1ee with SMTP id 5b1f17b1804b1-4bb55a95dbamr161321305e9.31.1794744970969;
        Sun, 15 Nov 2026 04:16:10 -0800 (PST)
Received: from [192.168.0.167] ([78.152.238.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb65ce005bsm126726035e9.14.2026.11.15.04.16.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 04:16:10 -0800 (PST)
Message-ID: <ea2dea8f-e696-4e86-be9f-248cb6ec86b9@linaro.org>
Date: Sun, 15 Nov 2026 12:16:06 +0000
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
Subject: Re: [PATCH v7 10/23] media: qcom: camss: csid: Add support for CSID
 980
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
 <20261114-add-support-for-camss-on-sm8750-v7-10-8ff2a11835f6@oss.qualcomm.com>
 <130fecb6-5372-44d9-8261-c3ac88248631@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <130fecb6-5372-44d9-8261-c3ac88248631@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 15/11/2026 12:14, Bryan O'Donoghue wrote:
> On 14/11/2026 11:29, Wenmeng Liu wrote:
>> +            for (k = 0; k < CAMSS_INIT_BUF_COUNT; k++) {
>> +                __csid_addr_update(csid, i);
>> +                __csid_reg_update(csid, i);
>> +            }
> 
> Why does this run twice for the same index ?
> 
> ---
> bod

"run CAMSS_INIT_BUF_COUNT" for the same index ?

You don't increment a buffer index. How can this be logical ?

---
bod
