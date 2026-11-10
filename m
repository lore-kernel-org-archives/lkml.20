Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794324569;
	b=Z6yHCW4SNWIc4S9dzO+ut9f4xTlH+AWWpPt//128b84Zgxk6gJKFRdMWX7OlYIYWC6cT
	 l8a5EGO5teu8Yrdsy9azRqpKIithst2D8qs5z0qngej2aigvwYdl9KXTXYzeFeQyNXB3/
	 6S/fAx1BeDQ0v7OGmUfK6Rn4no1f4L6/KfR7WH98czAMPudUNCgbjpQu+ia6n3Z5M3KjL
	 pZTGrV3EQdynONICWJoQpNumsa20iVXgBQxopT/e+3S3SNQ2+02zYceIZysoxD5RLJK63
	 2hwEyOV8tv16wdfWxhYFFeRPQ8qNnT2XJpSmYphTJuFQrb1DAObZLYLs4UdeCaSM9Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324569;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=eE5bBnvx3Gqg63Wh6ioe05F/FzYJEQy40fvhqq/+9QY=;
	b=5oEMs5S9xVUu9hoo8zOJ2wv7XzpxKRk0uDyCTI7aqD0GvjluKLzkv2JYXcIcLGtP6RXN
	 psBAMy//YKJIERxfTHnaAhRZEfYXbKZo3y6LXcEkdsLt1tUVLXuLlcCoyszH6AU/l7UET
	 2gOVLHua9bMhWsqNjWKy9NkY3r6YQOjKIfgLvWWCZnCRpsmKh8yGKoKDfWlJP6Q3bG7Jc
	 P9RSG+aQL7WsYIbTuYyv23M3deRpKR+05gp5giV2g63si/2g9a13Jex6kiWTNLvmxoUhB
	 KfZGT0s3VfAtGFZMGvCHHlgzFiBGvInvWv2uPY/OTh2a33NIxMayz5nz71kBGqVMKJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="EgGrkjt/";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E7660A3827
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:29:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21E7660A3827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EgGrkjt/
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so15802515e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794324567; x=1794929367; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eE5bBnvx3Gqg63Wh6ioe05F/FzYJEQy40fvhqq/+9QY=;
        b=EgGrkjt/sx6/1BBrzSVaWxuMe5RXtwLIOGAoye2pByFuW+s6DWWDzJ871hmoC7CvF0
         IFL/k0f7ozxOsNbVgrodVmboGNgccu1iFY3nXWvc7lP4e81Ct4ZF+cYpoKwYvd7NxMQ3
         M+ccnETyvbFvY1WU+fSoxGINzI2lAPkjihLo0LFqMfnaii3XD+Z3rVafu22TAfH8i13A
         i7zpRQDlTJnEtkV9VOlzpHIXY6UDC5Om9lcQldE6UwmgSBcisGG/b29TJFJLvnOtrxls
         KK2vvOn8oh0tiFHINZ7D8MRmGW8cY7hsCdZZ832uWKOXTQVsVB9J8bSBRoJBmLrOfwiP
         Aaww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324567; x=1794929367;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eE5bBnvx3Gqg63Wh6ioe05F/FzYJEQy40fvhqq/+9QY=;
        b=hoJzst8pjVL4y5JFPb1xDlXgAuRiAzwCZ7I6qF8kUnIHer+XAqK2fh3j5wJWbfr+Gy
         +0lwf9dQUtiqFsxO1hdh+duxXKzXkANs+s6ECYqytNMypvnmAjaUnyyvvuoJRIoQrG3r
         i2WAzfSUnDNG60wT41JRJOx8D6Psw/gyeFw/jLsJNe0kXwNa1ZRDtCPta2TlWH9Nl01+
         nKSeek2O9tvmCCI2RhSq0cuEo+9pNFtiRPceqoZFUgQQXqsHwvcaczggDVeHXWSe5vWL
         hdiDwaqQggyOM9YR3S8RxI+u+EPpqqndqG6hRV52gSjEooVmzUy3etCaR6WcsJ2riLtU
         bjEw==
X-Forwarded-Encrypted: i=1; AL+hErHXiXwVjlvYCTyfBPgOzZT4C5GNtcLxi6r8FFYMrac+6Dr+0AuJ4Ell8IQJrZnEDt2tLqwTvN0ANi0yk/8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UmNMCOuAlrY5InPWlnUsnpEYnagpGD8+tOJQ08DbOWUa5KLYV
	ZtD1g1BlVOCOup6Gv1hn7/0GZ+DTxkn/+bXyCXzUg8u+v29gYdPbOBvAXRA+WgUMyW4=
X-Gm-Gg: AYBFou09QHbTEabQMPILBpNq+XyAXohoAN0kiLvCglrHOkl3OmNo2vWGAdfbShBtCTL
	ffbxM5H2t5kRNn/YRJ87HZY5duincYSqjwpknSUX18BQv6O1swz34D+8f1EON+EQXWGJQRYkOOa
	vx0W8mSoGZfHVdXrpH7EkNbxm0mZvEpsC0HBPnKjBespRXSct4VMK6kkk5MXRqVn50cmd73SiZ9
	+XFXOTH0XSE053sCxJmJRYr3cPfoO0/hoZG2iBjFo7QfXzuRQ/Jua22Ixa2KPzrG54FhSHNHT/V
	jOrJJQautW189zsoU0H23DlB7yhSvKuI5B8IyAYushB7ygbkdNkKsEueggyN1CusVJtyp+9sw63
	knqlSi/75NuQ7spPZ4m0Hvg9KT+2964hDaMBmD5zvCDaR7A2+NU8PTKNNwlzMGjJcLxYX82VYpO
	gGDPlffELOqlfa9Lh7cuT6ZokUnIWixVGgy8itLM9IoTDhzrASsWRduwkhZ2GTymNmWm+oJjHrP
	95hGWHTK5gTDXKWJKGzFBQ56np4wL7delSw0xRfWxD8dDMw7MOEitBvl1ROzn2TgpksNPWQ5u0O
	a/bfleF3+kgH6tdqqlKH0CIOUcUwY3+klGHOH/b0Hxw1EdpxQ4hdbTU=
X-Received: by 2002:a05:600c:3b83:b0:4a1:88de:9e8b with SMTP id 5b1f17b1804b1-4ba0233f907mr61071135e9.5.1794324567432;
        Tue, 10 Nov 2026 07:29:27 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0236f03esm55689215e9.3.2026.11.10.07.29.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:29:27 -0800 (PST)
Message-ID: <d5b0310d-7123-4b61-95e1-04cf4f92e523@linaro.org>
Date: Tue, 10 Nov 2026 15:29:26 +0000
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
Subject: Re: [PATCH v2 04/23] coresight: trbe: Check the buffer association
 before IRQ validation
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-4-3f57cf3199b1@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-4-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/10/2026 17:55, Leo Yan wrote:
> is_perf_trbe() obtains the sink buffer from the output handle and
> dereferences buf->cpudata before validating either pointer. A live AUX
> transaction does not guarantee that the selected buffer has a CPU
> association.
> 
> Reject a missing buffer or CPU association before reading CPU driver
> data or checking the hardware buffer addresses. Treat these configurations
> as an invalid perf TRBE session.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 8ec0b4c4987f25d10ee0b2f80c27e10f76357387..91fbdbad3676ffae399df0b4d4ddcd603a40e86c 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -1111,10 +1111,16 @@ static int trbe_handle_overflow(struct perf_output_handle *handle)
>   static bool is_perf_trbe(struct perf_output_handle *handle)
>   {
>   	struct trbe_buf *buf = etm_perf_sink_config(handle);
> -	struct trbe_cpudata *cpudata = buf->cpudata;
> -	struct trbe_drvdata *drvdata = cpudata->drvdata;
> +	struct trbe_cpudata *cpudata;
> +	struct trbe_drvdata *drvdata;
>   	int cpu = smp_processor_id();
>   
> +	if (!buf || !buf->cpudata)
> +		return false;
> +
> +	cpudata = buf->cpudata;
> +	drvdata = cpudata->drvdata;
> +
>   	WARN_ON(buf->trbe_hw_base != get_trbe_base_pointer());
>   	WARN_ON(buf->trbe_limit != get_trbe_limit_pointer());
>   
> 

Reviewed-by: James Clark <james.clark@linaro.org>
