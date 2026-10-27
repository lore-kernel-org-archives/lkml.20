Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114039;
	b=IvqVvc7HNAmfmefuc7gTgd9nbX7ClBx+GMGGA8pODZBj3MEUJfJ9+lulzO7x4Ye18+Nk
	 8BA6Gcr44ulFSjbjGVfPNwB4E+DXZqOaqE0v+f8KUc/tO68UIrK6w3L4/9uzd3ijfJG8l
	 cfo+IXYzWbFNB8r6CEss3ziUIjKJL66Ac42I82Ra7md82SNpyFTgF0LuO6tQmXKFwG5eq
	 P+0G1xLoMdoPD8g+hpv29TiUFKwOsJNDWNB8Kg0ebk01hAoejXG0OgMflfSKfwzgeVCDX
	 uonPpJjGTpnoeLbAU5lLzLt88ogVHAEsbP5bG5Kj73EQttyIix5Dl2i42TXg16BVrIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114039;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=X/GqxhwzDfkNlR7rtD12qLgd9HV/zNHUYPrEnneK0SA=;
	b=CkQPYq7ysBb0nRyq9G7LoHnilngnKkTeShN2jA/nLysLHQEbXLI7GTeS5Mm/Gk/UQ2ls
	 DqGJi1rNvXudqHygtquujFu0HxgJuTBzee9zOwUHEW5CyblN/BVDsO3YF7IW2sVXa++Sh
	 NpFlcCfO9Bj/zTaa1G/AOX95aDxnbY3i4Nh3zKnZGECTFMnRCOz3Fb2Dh5/WQLv/2DHII
	 yNnsHB3NpyWMhSh5d1tsa6ExdajRCEW21XM65F0+9+QNdkTGFcEsEbmE0XSBfSUTyh53A
	 xrYqjP6iGM3u1Ug48+3Rx83gjIcWgUCsa258mi5TNWFcsDnxFYDamURcJ483nF3RpwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EH80Avzg;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66624606A31E;
	Tue, 27 Oct 2026 15:13:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66624606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EH80Avzg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=X/GqxhwzDfkNlR7rtD12qLgd9HV/zNHUYPrEnneK0SA=; b=EH80AvzgRK9DpF1v1znDz3zR4r
	BMj5tre3f0633b69n2SAg7pHpxxrjokoqpayRVjkV55O3x+vD5BNaAjqY67rXuxTU3dDx0IREGWc6
	rmyNsGdVERtCBAdL/hf2jEGqKpjL8aF/xei9SSvUfXnOesFyK6hvxiiBKHYSQNhYj6t0/pVsvo4Qj
	rRj7m9v6ovMDmRJGOfeM6FX/wq8R1yhAEFIkTtqQ+8XYg84l+Tvo9tmPtrMwhlzCSMShSHU5jSzc9
	M0ZkU/DK2FSkcKphEuA3CIycWBnM8pUIZLiglasJDMtT6Uk6ORVnamuP5uUg1K12YZtevQGUrnVmZ
	Y+g03WAQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLis6-000000058O3-24hT;
	Tue, 27 Oct 2026 15:13:54 +0000
Message-ID: <022548b6-607b-422c-b7db-5d95b0ba6b79@infradead.org>
Date: Tue, 27 Oct 2026 08:13:52 -0700
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
Subject: Re: [PATCH v2 2/2] nvme-tcp: validate the TLS handshake timeout
To: Yingjie Wang <1075151112@qq.com>, linux-nvme@lists.infradead.org
Cc: kbusch@kernel.org, axboe@kernel.dk, hch@lst.de, sagi@grimberg.me,
 kch@nvidia.com, hare@suse.de, corbet@lwn.net, skhan@linuxfoundation.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1793103202.git.1075151112@qq.com>
 <tencent_02EC3FD2E750D09B95ACA70091EE65DE0906@qq.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <tencent_02EC3FD2E750D09B95ACA70091EE65DE0906@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/27/26 5:13 AM, Yingjie Wang wrote:
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index cc54d5f169f67..a5adbf58fb8f7 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -4801,6 +4801,11 @@ Kernel parameters
>  			Example:
>  			nvme.quirks=7710:2267:bogus_nid,^identify_cns-9900:7711:broken_msi
>  

Maybe add "host" and "target" in the descriptions?
or something to clarify/distinguish them.

> +	nvme_tcp.tls_handshake_timeout=
> +			[NVME] TLS handshake timeout in seconds. Valid values
> +			range from 0 to the smaller of UINT_MAX / 1000 and
> +			MAX_JIFFY_OFFSET / HZ. Default: 10
> +
>  	nvmet_tcp.tls_handshake_timeout=
>  			[NVME] TLS handshake timeout in seconds. Valid values
>  			range from 0 to the smaller of UINT_MAX / 1000 and

-- 
~Randy

