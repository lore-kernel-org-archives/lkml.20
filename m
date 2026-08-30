Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84405282F3F
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 21:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788124620; cv=none; b=NtYJe98CTJsaVKGPe5aDJm1QND1BU58c94lFmCqDmzQ8XOXFtOIkhbiGdEiJjj5bnPRe4enuuZhj+V+SyQmQEt5ATg4mtrY7tWzYlk2hV+jf9hWhh47qCGwlXHsF62d+2YK3I7kkjJgC9+j72wIK4DRzkwluWcIYWbtzGiljuBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788124620; c=relaxed/simple;
	bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tAOn1SlT14p0eNaQA4T3n+Cz/C/d9ccF/6B7ovi5Z+irtW7wPvsMdTxst5VSWFIzIO4excyP8mALSS6aLyPZpjCHxUvAeYU3TDGx8JB+aOX5TRtu9J4EQEIQMf8hTshWG+SYB/gqiiIaVJ30XDN34Cp/ZxzcjE6G++r2W8qRMas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so20644285e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 14:16:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788124618; x=1788729418;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
        b=fg2qXiFz+gQlGYgAhWYPEPZi8IfAijZdRf0GK6+xjDk+pHlveOFHH+vF4tAPAhezSJ
         O/QREarg/1QLYsU3BqBbWOHRa4d6mUxduE6wygXGkAUuzAirpHFCl+s/r5WNTk3IwrJI
         EcEZVOeb2LTl+NZuBFRN3P1kOj005LTJ6ruPw2QaVaRfz3BQ0FrAlY1YtwuNQ2b2DB9p
         Z2jidPGAXr79CFlOz/bBmGS3lvjAvSnaW+Ud8RfbUXDgtyk3B/remAwXEP4nBHmB06ba
         LCymlw1SR9VjZLMcDp3PdAd4S0b5BFTEhe9ui4FXL9M+FUvmcNz9+LVRt3YymFPtTxEY
         d87Q==
X-Forwarded-Encrypted: i=1; AHgh+RrraKWbk7vfEFYEjzmrs6TBrCO+CgvmeFtDoEOVG8S2lL6aG6R2c1gzr8j8rYBGByP2T3/TN2U+OIXcfNE=@vger.kernel.org
X-Gm-Message-State: AFuF++l4s2/+ShMCYSIyHVbpwXuiHfOjWRj44IpcNfbDPbu3VJH1DNxd
	O714wnwgbtsG50b+rNcMhiEUgTo8y+4Lm/wHeC7iMkyoa5r4wbl3ArgY
X-Gm-Gg: AR+sD13C07UK1QCpI1dB4Wf38PNryasNF+IyS1g7Fa+Vc9OeaGMcRmtsvFVapNeJgr/
	nNJ9mqOuJrR8mkaUuHk/OWC73U0YbzuMXvtAHCOwmq+luGtjbG+GXh5X37TObAEDhf5nCg4p0HC
	e2BgyuxzlmoOdPk1VZ8adwebPbNExCpB+hqmci3HdtAChuc8PnKq0+EZT+x766kPmIl81cOpVMj
	4COxDXF5oWayodxCuKeohBDb/E/0NyNWOJ6gAQIpOTga2XBDlHD3hq/4sX3XZo3f5wYK1qBJYDV
	WFTPN0eqqDgk32MMfh+8Hgc2q7EdnT0tiE9xezXI7+n3gvlk8NE0uE6HkIbLDaIRxL4PiO53q/p
	IJJ2YhlrimG2nemVodv4Uik8xF53hny9JteEUfSLuLF3mZ7jYrs2lynszDX0qWzDnSJupiMBGPO
	sPKAq3x4J/moNx8WKVtrvljmXuDgs1jgjKe/5MDKeZ6giPJwF2Ck2vEi8G547oxQwrZYInP1QHg
	uxhiinyl+bO8pRhrpuUvg==
X-Received: by 2002:a05:600c:6216:b0:49c:a2f3:fe9a with SMTP id 5b1f17b1804b1-49cd53bf560mr73470835e9.7.1788124617669;
        Sun, 30 Aug 2026 14:16:57 -0700 (PDT)
Received: from [10.100.102.74] (89-138-77-243.bb.netvision.net.il. [89.138.77.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9281772bsm110152965e9.1.2026.08.30.14.16.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 14:16:56 -0700 (PDT)
Message-ID: <a804fcc9-32e5-47e6-b43d-c4fbeaa482aa@grimberg.me>
Date: Mon, 31 Aug 2026 00:16:55 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH nvme-7.3 v2 1/4] nvme-fabrics: separate option tokenizer
 pointer
To: raoxu <raoxu@uniontech.com>
Cc: axboe@kernel.dk, hch@lst.de, kbusch@kernel.org,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org
References: <0D24A9A3F19DBCF9+20260827125710.1381672-1-raoxu@uniontech.com>
 <B5DBFE863C2BC94C+20260827130326.1390222-1-raoxu@uniontech.com>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <B5DBFE863C2BC94C+20260827130326.1390222-1-raoxu@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>

