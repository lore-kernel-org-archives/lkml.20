Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870340;
	b=k/UEdslzaSbk7eiFDs2Mr73nTu3gZ6gaHUktQ7kscPPUYl5sXovL+VGOZZNkkeXx6bMu
	 ktYvxteePoiMN3ev30cwaQiVJAFzeSD05g9S+JO7+o96cXalOD7Sor5WPMJkIztDSY6p1
	 xxbrBRpvv/Ive9RBtj4BxYAs6015FH3DI0PWi01fAIswMB/1a2DHf9A1NZgA582Ks4kpV
	 11l2oSzIab/PwlI/ylZ1OmK11ONlQQcBSPhJVW+MHV6DNughY3X70akN0/1Y1SRpPFxJt
	 ziyB/2oSmxtomFUX8IF0ZxZRGbQDeMAUf9ttDl0RgzSb7AO4w0GR5sa8TqTKEOwgz5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870340;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=srnkzjaOG7BDN2bpeLlegl6CQK8Ql2ZPBafTe9mh37E=;
	b=S+L1HHIyXAscsAj0zt39O8pBUtVpd1YKB3hiwxcippZccjicLuFjbX1DoOWBKybwd5Xb
	 ExxI6lNt3IKCwJJT79Go5h54xu23Y9NIp7pfo+W8XCXapOPDtIprcIOutA+rJrmhpaAKY
	 v/XUlVIfCoQAaNnu5D8BDFVLS9U5ZRCXBLnxcv3bWdSKWJS2Dqpb+MFr/+PCqKAEvaTg9
	 NzRXru7bV+VojH4OrY4uO8kSHdFxWYGUf2gI5YZhLO1p2+UxmdOZ9ELVjNdvm0Lv4KNCw
	 Ry+6XW943O5IsI2RZL21z6h0rOTBUXc08zXWTyGqirWUQ7wCbsYbtjhzWJZoi4DaWag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OwOGHstb;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qfaIZpA+;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2C2606A332
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B2C2606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OwOGHstb;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qfaIZpA+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793870338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=srnkzjaOG7BDN2bpeLlegl6CQK8Ql2ZPBafTe9mh37E=;
	b=OwOGHstbpLPfj+GmdZ9D7SZJL8P8iHZdeXl3MQQ2G2wX3oH12eN/bgecoFkQQrhTnMp/xD
	62tcNoLSmHQiMsQQ4CUmWuUgK65k5e9JI1YyQTyV3nrj6lFSV/EvhMXGRI7FZEzb7mqQfj
	InTKY11+/NBiaO7Cbgwlp0iNreKdLzM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-39-5N71A6cIMEGsr8vLnok71w-1; Thu, 05 Nov 2026 04:18:55 -0500
X-MC-Unique: 5N71A6cIMEGsr8vLnok71w-1
X-Mimecast-MFC-AGG-ID: 5N71A6cIMEGsr8vLnok71w_1793870334
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-490ed502749so671945f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793870334; x=1794475134; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=srnkzjaOG7BDN2bpeLlegl6CQK8Ql2ZPBafTe9mh37E=;
        b=qfaIZpA+7xLqCsQxWZ5qFqIpLat51mVHlpsSoIu1/8YdTOXVzCw9LkgJSm2Bop4wIs
         5EYpPAm2moMyqlfNypDPKR1GpJlFkP9gb45622Sui5Z+yUQsbCEZ/FFdkIJqMLoNLBlr
         jDAfaZam5XmtdnGRVnrDJKweTmTAuIxGIB15cRU8lnoxwJkHcAtEzN9Zaupy/phsoWz6
         d+KgHwSXXhvTiqDwBnm1ikelKx15V/bsA2kjgUMvMYhClcX4JnpHQ1N9vvu/p12PV8qL
         eljcWU8JmC0ZbcryXTczuyYKkaLeUvBFXau505mTc4HoKpxvyT+pkvEvz+5lnFK6I5sW
         6tFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793870334; x=1794475134;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=srnkzjaOG7BDN2bpeLlegl6CQK8Ql2ZPBafTe9mh37E=;
        b=FeotcwlYlUPbszSca77bYlgi+Dme6k0cWMP3sfGh03Z78b+54gTj0fYEWVvWYmovUs
         fdsiEsQ9UNCD0mrhZhme0XGMkhSTTPzcAfnduf6Eihaes+t9kCFVrtb7AQmlAJ2A8YWL
         zWL9lltG38Xmd+9tzuo7RkTcXpcD8rlsSpuSo5OMFY7XKnKkV4PUP7HjpXIyxYy3SekO
         X9aivHohpzEQZ8ID3KlQWzytwmvbnpjmtvs7M9o96QnGlpi/0nHpIsvoLYlPyVQgtDlg
         ntq18mBYxjyIXDLp6eV9A2uf8vWXvzSKhWrGa+a4qKF2etuyO9QXGyXjIHaDOcrmL/rx
         pJkw==
X-Forwarded-Encrypted: i=1; AKwUvBxEVF8sO/5I73j2SByZ8jv8NnPHaMtZtFg/3n7qCUG/L5JXJkH+p5LE3of/foF21bImngjcQw7QmOMVr4w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qGNfTTITPLcOWGCsaEmjWVfnvANzP7/Tv0Hg0Q4IvjKouWjc7
	jl1lLnp3mPqS53fI+EXlynO/nWRSF0jRyp1sPqLGLh8HcMpGBZL6t5wfo5EC+lNN+JQOItUu47w
	73tKAFW1gMcW87V1N0O53l4d+6pNRyuIZUSf4UR223DjQFw3Dba1o0UzNCwVj/M2NxQ==
X-Gm-Gg: AYBFou2sLE2Plloa95LL5sO3gW5HV+mBC7RAX0gIbGNY9rIlP8YmynzFdC1urygL2OG
	ClPQa/t0ohLI2+ouO7NVDB8115kO7q159nRMeDYEe7uEr1xRxoUn8HqIbIyEice75KPcbVfJlYQ
	Qdba4IxMj+Bzsbi5/TjB/19AXLfluFftNGl+IzI77icjmyS4LQVHu/MZIKZ74qWppj5dgpewFFV
	SNgWDrcT+MaNGb9LErrDkT2cV4KmQ2cqkMjHTU7+MFr0EKxwhTvtMMKlQ2Hlg0n01EA5yvvsYQs
	O0zFaakjwCZHWYo3sbrqLqV/H1YR2LHvKbyTf8rVzqBptrs5xAIwD9RkbwdmdQeDffn8/nynqBe
	BOItW2eHVUT/vXWoqQdYZWB/PJ0pvJx6/xenKBwUnDXGG5ktnd0Si2Ooa3qLMJRTFyz0Ggd7Ajm
	RpqkENvLrkugeIPW/LQ2+s182ZHUorBdHcisuODQLKJ8M=
X-Received: by 2002:a05:6000:2904:b0:48d:b75d:30f6 with SMTP id ffacd0b85a97d-48e6e308d92mr41690805f8f.35.1793870334119;
        Thu, 05 Nov 2026 01:18:54 -0800 (PST)
X-Received: by 2002:a05:6000:2904:b0:48d:b75d:30f6 with SMTP id ffacd0b85a97d-48e6e308d92mr41690741f8f.35.1793870333456;
        Thu, 05 Nov 2026 01:18:53 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fea18104bsm9317500f8f.6.2026.11.05.01.18.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:18:52 -0800 (PST)
Message-ID: <deb337e3-f7aa-447b-8227-fca872b8cbd7@redhat.com>
Date: Thu, 5 Nov 2026 10:18:51 +0100
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
Subject: Re: [PATCH net] net/mlx5e: TC, Fix double free of branch in failure
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>,
 Mark Bloch <mbloch@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Oz Shlomo <ozsh@nvidia.com>,
 Roi Dayan <roid@nvidia.com>,
 "open list:MELLANOX ETHERNET DRIVER (mlx5e)" <netdev@vger.kernel.org>,
 "open list:MELLANOX MLX5 core VPI driver" <linux-rdma@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20261028145805.54595-3-fourier.thomas@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261028145805.54595-3-fourier.thomas@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/28/26 15:57, Thomas Fourier wrote:
> When allocating the false branch fails in parse_branch_ctrl(), the
> already allocated true branch is freed but attr->branch_true is left
> pointing to it. The caller parse_tc_actions() fails the flow, and
> free_flow_post_acts(), mlx5_free_flow_attr_actions() which calls again
> free_branch_attr() on attr->branch_true.
> 
> Clear the pointer after freeing it.
> 
> This bug is theoretical and was compile tested only.
> 
> Fixes: f86488cb4685 ("net/mlx5e: TC, initialize branch flow attributes")
> Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
Given the lack of H/W testing I would appreciate an explicit ack
from the mlx crew.

Thanks,

Paolo

