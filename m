Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793950257;
	b=ydROAECDNoNZmx6XeiQ5ht/gDvgeuNgHdBWnDk/Q/1EOxy5EvfkPCIv0lLQkqNjny61O
	 sTULfrWKysVDP++2AOIFmTnmqswJ4xfgKFA3Bk4znYE1XG/Ui7TD2fI9diVI8GNXiNf79
	 qFKmHBseGLfZWdbT2O1t2XeLtfY4VYEvYuOYjcxmShd37fP5RT1oHG7QRi+hBDS2LbQOa
	 OTXI5MIqcGttukJjfYAkx0SF6KR4jY8o7yvEYfKYQpD2s1BjHFDlWAV5F8NRjR31w5gqj
	 tiQs/dnXrGuHls5/A+O0PokvtZ7cFejgfmg0WbOg1XHH3jhp2B10ysNffhTI2UMsAng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793950257;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=7wSEXHkBeUm7jmx/vvmB6o23ptrbx9HTwP0lEI9vdgY=;
	b=JFDZVTrrMH5bnb7v14kHifT+NqJk5jrCOEwFzNmOUXq9SL85qNS1xvA7C0xWX18bEX1F
	 quCGsdI0Asf4/6yDEJRUvhY9LvLm6MHhJm0G3Zjhg2un5vBYdDrX1lbU+GBlInrmNOAK7
	 VhpX6K11KJpLIqtynvYFrRi+4G+d3iwVGDTEkhpQhSsry/WoRYYObv0IKW4gZTmPTeRPZ
	 XILW/oKnnV4yCaWLdApIWgVHbdXpfsc9mZ23Ab1/CmHay/P6zCSZKTNcC0AhYmom0r9Sb
	 c2ViYCQJc/SUOdSv2TiUBK3TCkDqKGz6O8MiKCFcdEu1ezMR1DIt8toTyGI1wPKYsOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nsJmSuzG;
	arc=none smtp.remote-ip=91.218.175.220
Received: from mta0.migadu.com (out-220.mta0.migadu.com [91.218.175.220])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B5D606A32F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 07:30:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71B5D606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nsJmSuzG
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=aaCHJPtjUYTzU9qBVb0bveZ30m9yiBJImLPHyP2kHKg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793950254; v=1; x=1794555054;
 b=nsJmSuzGtKp/9cUxFg7ULhPcboclm2j7V+Nc/W3nWsy24/svLKsee3mv0J+R3k84HRUy0ib6
 TF7f3DPHseyxKwA44HnHtXT971+7BMnJ3LdjfFuKU1K298f+EohqqFuAnrIn6k0tnb143zXGj1I
 n/8/UkO/F9imbnmELU/wS/LE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0621bc41cbb61551;
	Fri, 06 Nov 2026 07:30:54 +0000
X-Mizu-Trace-ID: 0621bc41cbb61551
X-Migadu-Flow: FLOW_OUT
Message-ID: <a95b787e-06ee-424a-a154-e4fdaef2eab7@linux.dev>
Date: Fri, 6 Nov 2026 15:30:49 +0800
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
Subject: Re: [PATCH net v1] net/mlx5e: kTLS, Fix missing error unwind when
 enabling RX offload
To: Tariq Toukan <tariqt@nvidia.com>, Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, saeedm@nvidia.com, leon@kernel.org,
 mbloch@nvidia.com, borisp@nvidia.com, witu@nvidia.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, linux-rdma@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xuanqiang Luo <luoxuanqiang@kylinos.cn>
References: <20261026095346.1212609-1-xuanqiang.luo@linux.dev>
 <20261029134019.GG257209@horms.kernel.org>
 <53ba3677-af71-4d8e-b445-39e08eea8b2d@nvidia.com>
 <c27e8ceb-c0d6-4801-a53b-837545dc51f6@nvidia.com>
From: Xuanqiang Luo <xuanqiang.luo@linux.dev>
In-Reply-To: <c27e8ceb-c0d6-4801-a53b-837545dc51f6@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Tariq,

On 2026/11/6 at 01:49 Tariq Toukan wrote:
> 
> Seems that we need a resend here.
> Let me know if you want me to do that.

Yes, please go ahead and resend it. I saw the patch is marked
"Awaiting Upstream" in patchwork, so I understand it needs to go through
the mlx5 tree. Thanks for taking care of it!

I'll send the follow-up cleanup to net-next once the fix has landed.

Thanks,
Xuanqiang
