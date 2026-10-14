Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE064F68D7
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970784; cv=none; b=e/cjyhpAMn2ThBshLt7nDINoCQgOrw2W0NLitEphegw4qE+ktVhRaNGZ23MMzCinSfCPyJiBbyj/p58y1Z8DCnwAvidwEpf92CXWF17SPqGDAsd3/4T8tzyTIFagAFplntQpij5jPe4BdyEAqb0PBkNmEevpMY2+cT12sa6P+KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970784; c=relaxed/simple;
	bh=okzaYTuseeajn/y9/bMRisEYExitpZUhSZUqWkpEvcw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QvQ3EpsZNrqatVWYAbgBH9Gjfsaqq+ilDQQR4vNhEVi8EG+z7IddG3cfanhosRShj/kDoJL6SE28eiP0XEGH+tCuZbqawtGB6FTdAaikUnsR9SanUKoHi1+gNV6EHUDzbi3BUgb6z7IC3+9didqsp4xtK5BKTDOMub65WZGAlnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lgYSlXmk; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lgYSlXmk"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c2e5e801487so585335566b.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 02:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791970781; x=1792575581; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i1GZw3cNFikclMDGa5RfJqbcmWgweDgc3stMA6cogOA=;
        b=lgYSlXmke3NhGXgHOPHA5I/ODRDwVTY5w3VnVAo81ZF3piDNIh4XsBoU3F1iz85PkI
         MJPqAvklJACU2gpmfPp0bDi3ftPc2S1Jokv5afqZqDrddeeLU6yg5u0LIZMjrpADrc1N
         onBTXCA0w65ZLXeQQNQKl8w+ebMwLaeR5v+FDs2l8+xScqBXny0GK0jMDpASiBiMiJaM
         lMv3DXgCMB3swRdoZZbcFYcBfWygGMUKeWYEsz9X8IOMACwEMYccR+UV+LSjSUVZuKuF
         MMJM070xA+/vncqYacXgO07gjHyxC6in/VCb6VWENb131SGyDpWngnu01nYwWEMxibmW
         9ZDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791970781; x=1792575581;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i1GZw3cNFikclMDGa5RfJqbcmWgweDgc3stMA6cogOA=;
        b=BXQDYJj5tUpjeHszVqrmUgPEDnzV8Kx6IRASo2pyb+XJbZQIE2MLCj8sv/X2bd3xpF
         rfsWjngpBIjv3QKFFFg9C9t/vMHBpuiEOSPlsAs4QczrnfOInexSp1+WcI9gjOW3IxDv
         lBkbcUw9vb0k4xHQtddbtYlqUEFCVbD8xZhEkDyYPm2JJNWSqSikwi1TCcl014sNyQDl
         /76UEOqSmL95nq4/OkIPDaIPzCZGcJxf2wJDN6Kn9SJQErW6S6PvfQPynqJhccfzjVjH
         nkkQcpVdaPv/6X+KdMq3HB8g0in+R2yZ5/z6LU5z74eoDZNPza+gxu0CClLKxYaZX5q/
         MwBQ==
X-Forwarded-Encrypted: i=1; AKwUvByL8tZayPFwzTtYITV3U9oPmBkT8Kx9UGxnfeDP/CNLohitmd3cAq7ACfoZoUbhIVBQEBPlqB8MZIIv9CY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBIbq8nZA4BbsNJlhsR2GCYXzslELDj/5siBAZY1yBW5soKVed
	DzcwuATWijhxwOgHWaUQLJdhBErJKdM7ASn3C8QYtN0erBmxPJS7N8e0gW7i7hvoJi8=
X-Gm-Gg: AYBFou1+pSCzK1i/eLiqxFrGBRyK6tAKLTmUGcBjCZYBFWiTdEPqQNfB7qfVxjwURcp
	EHCU9YqfIyZaJP8tmdKEPh/c9eH0ht3R4mjmMivB/HUIMa7BUzjydQlPe/UQF8XLI6rynq9Pz7r
	AQUgXK3WHjT2l0IXT/HBj8z6ZL83OjwMuDnReWDU7TEY4l1CWDt3KCQ2Wh4KwRlaJEegLQHWK98
	z564r01jhb4TLMR/woxPGyrWiBbhFJK2D+XheMvSVJF0LT/FPkPhZn2QOAw/fm+rljP/06Rj54u
	QqwyFC9YJDAbx2h2m2cYJplW7n4zdVibTj/hvsLvH+qjW8DvWXYf0FYVuX0EERjsSXGjx6Ibe8m
	DF44ILoXhcQbvF6z8+eXtk9vMXq7P5xxt3bau7mBkM4+MTxuDPGhoDCOswJCEQhEQPJEzj89OxP
	gHZkIXBJbj101MEO1qdk3Q9CV2iG9Ameu7rrnPotG+ldw1IVCyMo4j1jhFaOlWKDgkpgpYjjN19
	IdhycRgdUpg
X-Received: by 2002:a17:906:c116:b0:c31:8441:35ff with SMTP id a640c23a62f3a-c31aa0e9367mr1389779166b.48.1791970780874;
        Wed, 14 Oct 2026 02:39:40 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.126.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ae59f9sm681485866b.80.2026.10.14.02.39.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 02:39:40 -0700 (PDT)
Message-ID: <d08f3f62-713f-43e5-bec8-dd58997c2249@linaro.org>
Date: Wed, 14 Oct 2026 10:39:38 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] phy: qcom-mipi-csi2: Add Hawi support
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org
References: <20261013-hawi-maili-camss-v2-0-fc93222da89c@oss.qualcomm.com>
 <20261013-hawi-maili-camss-v2-5-fc93222da89c@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261013-hawi-maili-camss-v2-5-fc93222da89c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/10/2026 12:02, Nihal Kumar Gupta wrote:
> From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> 
> Add support for the Hawi 2nm CSI-2 D-PHY.
> 
> Reuse the Kaanapali lane table and adjust the data-lane CTRL0 value
> from 0x8e to 0x8c for Hawi-specific tuning. This prevents potential
> stream stalls and SMMU faults.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
