Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890173;
	b=h3Hkm5PFz9o1YCmBTFSSKhQVKNe+7A+kxZvjgOWsKhTuguzerdgQuI3q/AzaPz3numQS
	 37Zwg8q/9VyENtCO8fIkseKiQ3vtSvdmmaDRgoxHF5w/uDgONtJCYrAQE+wfAXhKtBkfc
	 mFL086R6liWSJijANFjgkX4t4pGVccep/cIbJt939PckmgnjGivuxbQRM209JUaU0zA/H
	 iaBUOpD94OAXKp8h7vF1VCTordCIQw7A4dDZQ4kGNTbehjmjyKt/hXKbC/c42sViXGINx
	 fiGOga2aUstyfDJ5Nc9w2qHJV8qxk2c5Aqe37DJjZnU23kiJsj33P2C3dQEDPiZN73g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890173;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Om0tcSZNhZ5lOUlggnaxDt40uTNRQpeANYB2F5Pi83A=;
	b=ysOVHIwG3WUWUYmopC7FEUfh+QenaByAAIq/Jby3+8ZMIwTobekeH04kAk/P+cHgU4ov
	 t2IVQXipbjL7687q7Fr1EtNNbuQha7kE92+wnTZKvhdhbCbkIsxne5Ud3vJvV4OB+vMcF
	 64Ps7LsNVXYPE18iLbcLG5ACs1dUc2ctHDUE5yw0JaF39vUkzA02ZEBez6Ny4TTtIntTj
	 piJOPxtrhxBKH6j04Ztpwonwmn7LmNCaftnTXeib6QM2+2Rsl3KepnI6IewQtF9k4WCRF
	 lQGnTKeE/zn1EiGMK0HOBUP6IPhxDcdgKQNIwLcWq/MUnJenisj9YxIQTI1SxaG/S3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OxV2lkRh;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A56D606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:49:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A56D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OxV2lkRh
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2d6cf958bso9657605e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793890171; x=1794494971; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Om0tcSZNhZ5lOUlggnaxDt40uTNRQpeANYB2F5Pi83A=;
        b=OxV2lkRhk0C0TAO6rN7Z6hKEHmcuG3z7lblZ6BAeXcdGdhxfPtIsTrrTLyoBf8mX9h
         bsf9ewoi+eyF8RgAYLuAL9zrbWAiPVXk/61pfnNmZZf4l5k8wW57vsQz2pHYof5P45M7
         UM+yiwAiohv1D4Afb3JF+cnuAw0OwINRvK6KQ03FdSAcNMK/sQnKoe7Zkpa4jeK2RESF
         tHeQZZQstnEYt3KtTFgg2WuDGMVlEf8XxhmJKJx3Cn9ng1SReOwQdlA2p+bcmdz6eSyv
         f8WJcsqYkouW6OqvEMbwMsEsdd7AIE2QXvuIov6rB4iXhwTiEg8FuhJ8FQb75d2su6nQ
         8a/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890171; x=1794494971;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Om0tcSZNhZ5lOUlggnaxDt40uTNRQpeANYB2F5Pi83A=;
        b=wE5TuSFTMKajfYUCLUOShkmas7bKb6Tbmp9mSAtZTW8nVoKgNbfbsK03Dj5vxbs61S
         10GJFkPFekEFrS7qWUKxqRJwJi68IcetsL0egf+vy5kTqpGqpKb2wogdJhm88pd/UIqI
         sm/POyTHZEoH0cU5mOomwkWPeDmK1Mes6z9JMNewIq0Wms9QSLhJwsvtLT0l02997IMA
         0z5by5DXPT1w1DDQAlM7O3CC6jx05ZAOwsf1hyqNuOojWQa3bCxHB++W3tnrpzbLsuCj
         8P+MLl5hgdt8ZJe41hcHwQ7wm1il5DW8bKuHK+6SvkKzz7o9uaBEcT1Tp+fMGqVQmAY4
         FhNg==
X-Forwarded-Encrypted: i=1; AKwUvBynA9t4TwqvzTXDbc/QTw78r8PAHNR73hw6PpErXJVwtqoA6qMqwwhVrTpPBxEz8kmxDWs+wsRpEmtveF8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lhXsknebR1mexCzAb/FvjtEWJzPgIFWKK1cC46yc+8uItuOtM
	vwhM40+v5k8uM/HaFFF+EeVT55NvaRydfuAlt4MRsdZaarH5m0wT1ZAQPfaLeORV8hgKCo9pigG
	dRNdd
X-Gm-Gg: AYBFou3Nf/VtyVY2jNbMDR4rAFlOUHgz829OdYypjvdJWaK7ZWY/a2hBahDLdR5zt3z
	tqkag3Cr0z5wwyn8QpbC2yxY308lb2OiVftNPKpLmEF35IUPwZmd1qnUt88omvNYpNbkqS9dunM
	GEvn862Fh2mDqPOhdyB4a8FUaIs3Vv+wY6n+u7Cn7DRBI8KRUS4ZGxIJo/wMT03F/ClvxW94xQC
	unSsWL+NLSDXs50rbwNlKGwmEPjbEU6qaZ+lviRQagqc+L+b0LWXDla+HsX9KfrRUXNzsI6JBQd
	wwAYyNisEHbZkan1XOjkFzfeT5SC1deIvd23svVJMeoKOxKEk2KwkW/fy1sQw4AM9FF41xhjN5P
	wP03RGeg6Rue+EWbX+XCQnIuhuR4LQoCrhW0O9HctYlYmoso8WE0bnNilsKvFeyyyqELfEt6AHn
	TuYTpACKfbqgWOFut65DwzduJ6YAdEr7vLZTvmOQva4+pvKfdFvAdOgFtejG+t7GMx4Mq9/HKuR
	FR5LzTYtplKUtRdwp6DsQ2Sbu4/EgX6RtqWCavfute6r7zdOp1p18E+WtNHCMFyDvema1h9WuV+
	D/ATXOIhYlI27+WplHOcUq+TFz5fPFHrf+AFF3N0
X-Received: by 2002:a05:600c:6285:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4ac182dc8f6mr417083355e9.34.1793890171437;
        Thu, 05 Nov 2026 06:49:31 -0800 (PST)
Received: from [192.168.0.167] ([51.37.126.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4104d600fsm129873185e9.0.2026.11.05.06.49.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 06:49:30 -0800 (PST)
Message-ID: <1215dd37-1575-4dab-8ab2-65348ac69d91@linaro.org>
Date: Thu, 5 Nov 2026 14:49:29 +0000
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
Subject: Re: [PATCH 3/4] media: qcom: camss: always stop the pipeline in
 stop_streaming
To: Allan Siriani <allan@fatecpompeia.edu.br>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261104202313.72494-1-allan@fatecpompeia.edu.br>
 <20261104202313.72494-4-allan@fatecpompeia.edu.br>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261104202313.72494-4-allan@fatecpompeia.edu.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/11/2026 20:23, Allan Siriani wrote:
> video_stop_streaming() walks the pipeline upstream and calls
> .s_stream(0) on every subdev. It gives up on the first non-zero return,
> without stopping the media pipeline and without returning the queued
> buffers to vb2.
> 
> A subdev without .s_stream() returns -ENOIOCTLCMD. video_start_streaming()
> already ignores that, but video_stop_streaming() does not, so with such a
> subdev in the pipeline, e.g. the pixel array entity of the MT9M114 sensor
> driver, every stream off:
> 
> - triggers the vb2 WARN about buffers still owned by the driver,
> - leaves the pipeline started, so the next VIDIOC_STREAMON and
>    "media-ctl -r" fail with -EBUSY.
> 
> Treat -ENOIOCTLCMD as success, as at stream on, and only log real
> errors, then always stop the pipeline and flush the buffers: a
> .stop_streaming() callback cannot fail and must give back all buffers.
> 
> Signed-off-by: Allan Siriani <allan@fatecpompeia.edu.br>
Please add a Fixes:

then

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
