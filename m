Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793005732;
	b=OPQzyY+/8D2uj6h1K7E2t75uQ4C51Ap/vlWlmb6f6koKEWm6dFLusOwV6z4HWAa+MCxu
	 dsPZQVmsQeKAMc5BcLjEhnnC41aYu9smXWDYa82S0UFmm3+nskqBUlDVOIE1xvOYKDlU6
	 vmXrve94omNJtUQEbzgnDBwCuZvI/yJPZ+/0hC/a/oLk0mAlokZ8au/L+dFOUI1HfEWE+
	 2qHub/S8oUWvJVQi9mtirKTWQQXj86notBo4cw6ivPobFB5/mDGjPdJYmFDGPHON5tENs
	 5cMlonp+yDrkuFnGIRqSZ6PqoZUdOuf98ZGni7uXJrEXpJg39GLxeqRG89WS+T0q5WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793005732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=1lFx2w6bCJuej2RXH2wzPTTzm/dZdmmNeuWWjCPk8mY=;
	b=Qj2q4DqRX0T2nC5RPis6d5EQR4T7b1eipoBlm+vOhmSz8HEvVrBhou8k54e8HhXphi/l
	 PIji/809n0z8NeucArs67V3G126uHohLFX+XndE6NAjPHjelGmdcQRhcVLIEXSHjfwQwW
	 lYBWPXx+oF1z7xcWj94Lo3i1CHP8R07lRfRHiDLUn1LBh27zSLSfNF1jQweJAJjmZ4QxJ
	 TzmbuabCYws+3zmzYBSgXMohGOXvrP2ocdg/5MnrkSDictofKLoPWSas7qSKQMPtKXE/e
	 YFCnXUU5seSKurFy5c2OgIvOoWpjs6P0XaXgtECX9TdagRfqx7kkKtbBJD0ZfKXKnkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=X2OOUp+A;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BE9606A320
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:08:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0BE9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=X2OOUp+A
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e00eee27dso1685693f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793005730; x=1793610530; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1lFx2w6bCJuej2RXH2wzPTTzm/dZdmmNeuWWjCPk8mY=;
        b=X2OOUp+A02CXDZvu8A20i0A6Kra8e4XDde7P4W/y8Ml4B6cdCfBkSSZbeRW9XJ7pfi
         nf1zLDFqoX0M1m5ST91pY3FVF0iZ+yXj92VKjKXpuv2aFa5fX4+KSHpSwjTnhmmkzQN9
         LYM0Wx72tHCgBnmCr2VjuVhsdL6lYkzKHBVImzyDavyCD6owRdMEIY7o1EP4oHiCywgl
         ky1O+qCDd16rZJTLbn3RmrEt3mRNpANDxIAcT9uZeEzNE1NqyVQHZT3vfhMxKeJ0ybRN
         ci+LCHoJ+iRHmcuKntLk0ExEcVJfSZBGBWq3+VGeMBX7qnIO+KUxtXnFSexb814dyljs
         isng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793005730; x=1793610530;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1lFx2w6bCJuej2RXH2wzPTTzm/dZdmmNeuWWjCPk8mY=;
        b=ILY5BAi7uvuGyGpyfDjqYKbpUKZEVPHdCTS/Kp3mefBSe+YhYsQuNnsCeSD9tNb2LM
         iH//nd1+iR8QElVSTXt4kH+H/T/Tm348TaQJvFVlv93aSLm+yINNhxbaWYBX+Fj0LvYS
         lSJK6LGaFhYgr7ryhinocPo3AcW1gRriphjrhCNQOBp8TG3kTi5Nd/DB/Q8E1q7BhJ3y
         3tpdL9951fNiMZ7QlWmlDaF1MU1vlkKzRB9fwBWInkFaZptDfzWYipaEb7E5W7TON7b3
         sTn7MFOZY3raNF0o/1WhEq772rPS1ox6xe/nf0NrbGkgx+3pLkC4IRbuglcJeJffJjq6
         GAUQ==
X-Forwarded-Encrypted: i=1; AKwUvBxk1Jnd4QOzFwA4GdOcIUZA3MCXpL5C/bLaxpdH/BAfpj6NwtvEjQIJCe9chZVSYlXftd3wdg68teRjaUQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJFbnZ9viuN7M1TPn1R4eRM3LRCsIHrQ+MsafuW1CJcoyWeFl3Z
	VA3/ce/56J5tYSvFM1gd/zLmqC2ihhpdtmmVMzVrKqzwHhaZPXBBNDzysyWnCmVhRSA=
X-Gm-Gg: AYBFou3g58vDkxdpLWdVrNhx+I9X4Bf4s58ka7HWBHMGR7qEkn41z2TUFmu28OHNA/K
	tPuowrJljD5WvrhbEylGdFz2sU4SLgmvUUYVcvG8p+WN6QuAAz+aJdGgXSCp/SrrBIVhz4ABzuy
	RFqE7WhsvhcCrIq8nxYxqWgeStEBVKly9uzA3DHarooxkedTY/DJ2EZ6u4lN4rlL8eP9nU0pZYQ
	ypd8jYUHu+LkoROXH8rtPjGCZ6AvF3ThYdSQSZO5DVZwcAPH9ogyoGuOCaBHVN+g3KGhqtN3MAL
	/AvjlYH0cYQgKxQjgHb9XbqWD69xF1TKWpm/0m6PEQjz29nLFZ5o9jE4Y7Jcw1p+BKvQqN7jTkU
	TpycW7XYFLd2W7d/UkQW40KsR/H9cjRP9Qul7djLf9u0W1DRyq/1o11DdZFHaMk7Yk5ZTYx6EQt
	uX6lktrjaz34UJKjzH2u07L3avjPIcM63cTCxYv2zsR1SvVmZelRoMt+TWX5VBVHUpIyBasLc4+
	1TrvVReIL0LkCCMKpQhTPWgEkXhMJM8H5E3oZx5wFCrOJfBWi4gNh2NIchrd3nmefI=
X-Received: by 2002:a05:6000:2312:b0:48d:ee59:3a30 with SMTP id ffacd0b85a97d-48e3eb8b4c5mr11452297f8f.22.1793005730243;
        Mon, 26 Oct 2026 02:08:50 -0700 (PDT)
Received: from [192.168.0.167] ([64.43.151.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ece13aasm14118984f8f.58.2026.10.26.02.08.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:08:49 -0700 (PDT)
Message-ID: <2665de15-dea8-493e-9a24-1c12cd9eda3f@linaro.org>
Date: Mon, 26 Oct 2026 09:08:48 +0000
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
Subject: Re: [PATCH v2 3/6] media: qcom: camss: sm8250: do not set VFE core
 clock rates from CSID
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261024094027.3095475-1-atanas.filipov@oss.qualcomm.com>
 <eGhL2aGIqxBFBKgd68g6t_m4p17F_a0I12V3BQjSCuOQ0HisGBIC1n8Oh4dIXGvyIEEJBQptPK1TAGQpg_ik1Q==@protonmail.internalid>
 <20261024094027.3095475-4-atanas.filipov@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261024094027.3095475-4-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/10/2026 10:40, Atanas Filipov wrote:
> The SM8250 CSID resources list clock levels for the VFE core clocks and
> for the shared VFE Lite core clock. CSID power on runs after the VFE is
> powered on and sets these clocks to their lowest level, overriding the
> rate selected by the VFE from the pixel rate and lowering the shared
> VFE Lite clock under a running VFE Lite.
> 
> The VFE core clocks are set by the VFE. Drop their levels from the CSID
> resources so that CSID only enables them.
> 
> Fixes: b4436a18eedb ("media: camss: add support for SM8250 camss")
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
