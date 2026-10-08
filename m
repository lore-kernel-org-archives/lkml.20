Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA52937D12F;
	Thu,  8 Oct 2026 16:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791475706; cv=none; b=sFtE4cuiWzWB0jR1fAuHhOVRr4jGcdVDHd55yMcX3mGoivGmGNY2iUJH7KlTo73fW4OUOb+CZbUfNp75cyoMjIxfRdiz64d1ufcCR9yG75CRt8vQGorMi3DqPreD5H8Xafnn+Uin9dj0M4EjWHTmUwRhCqfdK48t1Uy7Y+aoReM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791475706; c=relaxed/simple;
	bh=PNMRS5gukpVT3IGSL/X2B8mkIarZtsEfAYhSKWx4RsQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Idr1k75jNtcHrYXeUKbzww+XHh7EUTSx88NF9iLYqDKFWwxx3J5m/9feVE17SLXYKRcZ8YqQxw/jEKgNp4xES8Da+zXk07UY+HYWc38d+0Z9gllvUqb7OylfrNd1lMQIxHsld+vzW5IOiqgzSYQdDmZWcul8JBbdBmImOz3CgxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=3zyiCZQ0; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="3zyiCZQ0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=w3ZgHepumE8Rw/tNjhDFn/QavF2QumRaxKJx7LtCObA=; b=3zyiCZQ0sj0TAx3hN3Ggv08Geg
	ZbkSWV+r8hiBikJ2caYyrT1boRbX4rGOCKxf+QnL+xX/wNxlixUpxg/uxsciUHJm8Agz6OGUOiqos
	9Gttnb4y9I+tKZiYFr35Bc3NxmZtKvZSadLvScADpEHjgICYs3v0ABfdxecyrlzrstfsqGBUhfBfP
	SYXQ7cEvYSe/5h9/sdjG35hI+kLfd53uLDCes19GcMZEk5w+BS4gMWZH56UhOrhn5Bv+I9Kkf1EJM
	HIgsR5AcTzkK+YF1OjCfT8AsxgMZNlLPXCUcD2oVw7U9sR7YKs8bLS8L/9VjzS2ogBBW7hjoR+2La
	EuA7aIWA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEqfG-00000004fp5-2izK;
	Thu, 08 Oct 2026 16:08:14 +0000
Message-ID: <f43a4c86-38f7-448b-b011-b2fb6e19f3c4@infradead.org>
Date: Thu, 8 Oct 2026 09:08:12 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irqchip/qcom-pdc: fix builtin vs. module build error
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org
Cc: Maulik Shah <maulik.shah@oss.qualcomm.com>,
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 linux-arm-msm@vger.kernel.org
References: <20261006231845.461332-1-rdunlap@infradead.org>
 <d72d754b-767c-4101-a778-d68a94095cf2@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <d72d754b-767c-4101-a778-d68a94095cf2@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/8/26 12:34 AM, Krzysztof Kozlowski wrote:
> On 07/10/2026 01:18, Randy Dunlap wrote:
>> When CONFIG_QCOM_SCM=m and CONFIG_QCOM_PDC=y, the build fails with
>> aarch64-linux-ld: drivers/irqchip/qcom-pdc.o: in function `qcom_pdc_probe':
>> qcom-pdc.c:(.text+0x1060): undefined reference to `qcom_scm_is_available'
>> aarch64-linux-ld: qcom-pdc.c:(.text+0x1094): undefined reference to `qcom_scm_io_writel'
>>
>> [ARCH_QCOM=y, COMPILE_TEST=y]
>>
> 
> 
> Posted 3 weeks ago by Arnd already:
> https://lore.kernel.org/all/20260915195948.3521662-1-arnd@kernel.org/
> 
> Got also review and that patch should be picked up.

I agree. I guess that there has been a bit of travel time
in the last 3 weeks. :)

-- 
~Randy

