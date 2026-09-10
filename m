Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A34D39447C
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789021491; cv=none; b=C/A/kpDo/uqdiD04hagPcoNL1to3dCFkjptNa9EJcyjOFlGYHNUZ1oD9+o1B/ODj0AzlK9VOR4fCrBVgAcgx30HCwwaw7sX2+4ZPFVwLrQoT9hGVsi7HbFoBejgDGb8FrVUuUuTR3QYTu3pHZPEaxX3afqlYziz7WGJ6MLiaCD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789021491; c=relaxed/simple;
	bh=PavTPaSl7E4nl9f4cmxZDgR2MPv8hxGhKaAc6xi59I0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FwUvz67KRioHcM/x48fZwwTT01WVHxNVYPepQQsHLa1RRWE2kWj6XazNfDdErexZOmEzd8fxrayl+x82v2Bt4wQzjV+JHIMGZ9EJASbXc0fo0p7D3UyWlh1guqj0KRZMzfbY55dUzlw69cr7xetTTeCy6qptZ0G72857tFD66u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nSyr9pKr; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nSyr9pKr"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-485888b3c3dso6698516f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 23:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789021488; x=1789626288; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GwOPl6TUJvjurtx0SFT9PFDoGeN1jMxDAChV6NjVqrM=;
        b=nSyr9pKrXBHqTw0KmWwTabD5SYO6rUw5zecvUpwoWgEmwPCZyQmlxakYHYi9zRsrxF
         42CE7QJ9YKaXmp7kAJkRFsRvxDCNxKxDdJd3tEmm9yDJ04auVTAIhIS6rkbFbGQiqqKp
         TpyuVjWXmZ58kQMfwY6AcVOL6EiUkvG/JH9n3MsEHNjC4CpSr7CVEcPXYYkNDN45lqGq
         S7lFc1uO3LzDjRZUVNrkMgB8YOVhqBDYKfiKHH6a0PRcGjdeAPZCj5iS4BGUL3P7ocUW
         mAzF80+d9bs2c2AqSQvDJ2ulJ6Ppqrqx8TlTp3kM6M90Ca08+xNipvK7JR1SATnU3lgd
         XReQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789021488; x=1789626288;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GwOPl6TUJvjurtx0SFT9PFDoGeN1jMxDAChV6NjVqrM=;
        b=pRowhLXpRJ033hhmbJFs1zU8oxWd00Uf26hJ6XCXrQpG//awaKMnBtrGDLph1tb/xW
         njJtMG0luACvYckBViL5ctMt7TBuzh8QtUKwhy+tMBqONzqaIcpD/ZLW8aLug2uCzAzx
         0pFiFyGqlqEkB7va4jKDtwndopj+lNVxuVwJ5baMonc4zl69g8VityVgiB/3ckmj9wud
         +GDGSNP6sAo/vLLMVMtgdriB9UQ6PSGjd1SiXq18bN1ifOLcNt2GyCQU3Imkq4VV4F37
         P9GGRcUMmOhe5mAL4+c8EEGTd4RGIM8/7ODo+aD/8PAFihpQGabSX2nOAUrdsMionveD
         6L4g==
X-Forwarded-Encrypted: i=1; AKwUvBxFVmBSxc1FPARbXrOpw2GCivbyyuEVJGQfRysy1Rbv0rGTJ7YuRvYWvs8+kq8IEQuzoVMb2sXFBZTcc08=@vger.kernel.org
X-Gm-Message-State: AFuF++lPX5XAdFuwgbP+q+Nq+naK9zAi3102ixQmNI5XX34Tv3D8+3+J
	8XDUMnH0TwryPVEfrZ+FWAm4uU8Mf1NutuXryEuEtDcIBWmi8gM98mA5
X-Gm-Gg: AYBFou1yVGZ4R9RgZ4cP5T11VTKfyFW66xczdadawxGCFuZNzfTnL17VQf3MjyU2wg+
	cmbQAilNaUAM9PVw3vZsOedBKacc57MTKKIi1/KWS3/548A1YZhfkNYUTQaVPgZHhXEVldyeif+
	F4PvdAStuqf5IvkbtJwh1guHaDWSjceW2kbGJXDJIans/4FCiOMJrNDnifl3tAeL+tUF4BgEulg
	E17bvdrhTw3RZ4j4hhztzRi7GPoaEMiUBCXBwEc8VjwB33rbRjHrzZY4fSAw3Vou0HgodguUn3C
	g/h30bhAftJ2hf813XOpZvVHlELgn3st7MQJQTC/FUTjlVpkqnyPkOrIp6G+aTjudCi84c1d82p
	Js06hTlYZ26nr/GFLBe6LOqhcs8FECrfhojAoRDNV+tp9dtZK7uHwqKsxkpF4qKWA+q/oGN5ow7
	DRcgF0IplaKVYAca69bF2VXMYqyvKwiCNz7fo/3EBGjvyqKg8RBRg0kShhzcJTXEr6nEv6xcOJj
	OFrS6XU9tPwY+uQ0NownaAmg1f0GiEhl+nlraOa9ItKZNy9qWgl9Bc//KBeHWEsmQSDwPu3HIAN
	k61aGEdyUB6li4j84DhiPB1hbiFmx3zZErG4vmnMtUd9dnq6icAUwY4YrdZnvBXZW/GhQE1Dqqx
	G1+IzLQCclvS2
X-Received: by 2002:a05:6000:310d:b0:486:e24f:335a with SMTP id ffacd0b85a97d-486e24f39e9mr2649724f8f.21.1789021488301;
        Wed, 09 Sep 2026 23:24:48 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-b3d9-b901-0402-5aad-0ef4-88ac.310.pool.telefonica.de. [2a02:3100:b3d9:b901:402:5aad:ef4:88ac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm53896552f8f.25.2026.09.09.23.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:24:47 -0700 (PDT)
Date: Thu, 10 Sep 2026 08:24:45 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Russell King <linux@armlinux.org.uk>, 
	Nicolas Pitre <npitre@baylibre.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dma-mapping: split cache maintenance at highmem
 boundary
Message-ID: <aqJJ5fQ60Nm6xf5G@gmail.com>
References: <20260909064443.90544-1-kmehltretter@gmail.com>
 <ff220a24-edae-4b75-9873-1a58f5948a01@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff220a24-edae-4b75-9873-1a58f5948a01@app.fastmail.com>

On Wed, Sep 09, 2026 at 09:24:23AM +0100, Arnd Bergmann wrote:
> I can see how the fix addresses the problem, but I don't yet see
> how you can arrive in this situation. What type of memory allocation
> can produce a physically contiguous page range from multiple
> zones?
> 

Hi Arnd,

You're right that a buddy allocation cannot span zones. I found this issue
during code review while investigating another ARM DMA issue. I plan to
post a patch for that soon.

My Pi test deliberately reserved the last lowmem and first highmem pages
in DT. It confirms the crash with a crossing SG entry, but I have not
found an ordinary workload that creates one. I should have made that
clear in the changelog.

In a follow-up QEMU test, sg_alloc_table_from_pages() merged the reserved
pair into one 8192-byte entry. It checks that the pages are physically
adjacent but does not check page_zone().

I also searched a bit for a real-world example. Rockchip's vendor 4.4
boot-logo code looks like a possible case: it builds an SG table from
firmware-reserved pages and calls dma_map_sg() when no display IOMMU is
used. Product logs show the boot-logo feature in use, but I found no
record of its reserved memory crossing the lowmem/highmem boundary.
Such a crossing seems unlikely.

I still think the change is worthwhile. For v2, I will update the
changelog to make the test setup and its limits clear. I may also drop the
Cc: stable tag.

Thanks,
Karl
