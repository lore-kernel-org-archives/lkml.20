Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FA7233149;
	Wed, 23 Sep 2026 02:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790132138; cv=none; b=K97N1RPpRMiJkzEzeRxRh9qQWLQPtvV4Tf9P+zhswg7eRrCjSCNsT92mTMsb2Tb7H9DGkOVQPgvvh6VbBwg1CR0Tg18HeXuFlxMS47hHv8ftRCT2evZf+yX7fDEqffZ0zYfkOqmJwdqfIDQ4fvbBfVFeVdH1ymYXHKpPm44f1I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790132138; c=relaxed/simple;
	bh=uZC1XiULrqzAC9iNFxpCn73XPmh1YXKIQ3pl3xdsed8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=axfQZLLJP9wzFrvQjyzPB75EwyJJsL++99rrhchERgR8hGd+a+WWNXKX7upjxWAoVBqCDr1DTm94ca1GmBF0S3Iwktl1uJLfZt3HhbxW272LI/3gnqlTkno3Hv9JtgSC5SRX6lCKTugIvzQPjMkCdvIlGq2vCIFQxIbvJ8lhgTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=zYRBYcLw; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="zYRBYcLw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=lIxehaR8yZWOs1PZelfbTS1LZUGz5g2odjrc/Fh7LWY=; b=zYRBYcLwECVu43QrLDae2U1AhR
	RwN/Y5JEdpGciTTt+tH+zYO5oA4nQFdmUPo/2UKEGDAVaS0fwGIXlQP9hVxJby7oKQf6wsSd2GrqT
	cJGn71goc9PZUvhRGEjk4bNRsYyI63s7PYfIPJvadBapDf2xvPQDaD4dnCPZ/X73FUp30pBC4CPF/
	gy+UVR3RR3mNQG29aqqqG5v+nEuc3J5g92un8Th832x4DeQ1iOS+XvvHSeH/XEda/cTRIIRdOYwug
	qxEHyqVzstkAf9sPrDbZICZxgHk9/VbuVzqbaI1cOeTZWOa6nccCWp5cdwMRgbHDJSEn3AdYy3GxZ
	5R41q/LQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9D8x-0000000705I-0ROC;
	Wed, 23 Sep 2026 02:55:35 +0000
Message-ID: <086e1b04-c437-40f0-b71a-4f7e62a52c75@infradead.org>
Date: Tue, 22 Sep 2026 19:55:34 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] doc: phy: Document some bulk helper functions
To: Inochi Amaoto <inochiama@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rhys Tumelty <rhys@tumelty.co.uk>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
 Longbin Li <looong.bin@gmail.com>
References: <20260923023304.78428-1-inochiama@gmail.com>
 <20260923023304.78428-6-inochiama@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260923023304.78428-6-inochiama@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/22/26 7:33 PM, Inochi Amaoto wrote:
> +Missing Bulk Helpers
> +====================
> +Currently, Only a few bulk helper functions are added as they have users.

              only

> +Function not upstreamed can be found at https://lore.kernel.org/linux-phy/20260904083709.425893-1-inochiama@gmail.com/

-- 
~Randy

