Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527BB40683F;
	Tue, 15 Sep 2026 03:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789442769; cv=none; b=uK5Qin+HELdVCg/kL6/iyk5JUMWrABef5eKuXltxdUh1TY8eKzxYI8zih1rvb6rgj/Oel8rZG9Y0htbn0DSvX+F+EXET6fc5X171E1CTUuK0WwByAfgA/ENsG8LZKZSLqu8sG95XEj6VCosPTxVOXfoxfJYHzPeHRYfQjOUObnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789442769; c=relaxed/simple;
	bh=8D1TK2t/3L66y/xiU8Hp3ZVt047LrPdpFy0CNuOUQvQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=INe9qjMIvMdrnV/hE4t2+Df2tnftdi7aLNtw7/bHPLFJxqvkdaC3bN/9IaO/lQSL5Vn5Mryqd10U8QjTMKbFQ0Ft8bBc+CRfAEP/uWk3VUTN92Ot6va9IhORTloeAy2VvzKvLk+5h8csSu/aokoYvgWOizx007eCPT7WS3LhEKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=XfbDylbg; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="XfbDylbg"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1422A10426F;
	Tue, 15 Sep 2026 05:25:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1789442751;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=AqGeZE73TwGqd4RTSmyG3nXolmwonmj7ztlZhk+6TDY=;
	b=XfbDylbgzwNf9RJ0sFxeK5F/WtNYYkvLKhatTkcvskX4I3c+75aBzJuxPy5ZoGQMH8R5r5
	fpgKxWYqMem2uVOZPISqmuNV+zUY8j9+zejHE1kHn6zcReZMyilN3EFl9cjSuFybkvjdPU
	kuh9T+SvW2qAF9h13tKlbTRtEiWpVQ6gojQ2NcaPDgN4muLjLQqoquuoJMlC0VFAC07XOa
	xso++3biTMy9dF1plVj+dr9AqzdH/V1hhMrq9xsaL3trcLhOa3LhZTaQb6RPURQX26HMBW
	n7gigdPQvnEQg6k3o+6fXM3QVUA/WAyz8z+BlGuOuTreYrmaw7mvNwnd296r2A==
Message-ID: <e7398227-fd42-455b-9582-73690d104fd9@nabladev.com>
Date: Mon, 14 Sep 2026 15:50:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: zynqmp: Add ifm ZynqMP VHIP6 EvalBoard
To: Peter Korsgaard <peter@korsgaard.com>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Michal Simek
 <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260909182641.165383-1-marex@nabladev.com>
 <20260909182641.165383-2-marex@nabladev.com>
 <874ifwjff2.fsf@dell.be.48ers.dk>
 <fdf07bc2-428f-4055-97fa-61a302f57a6b@nabladev.com>
 <87wlspb50g.fsf@dell.be.48ers.dk>
 <00acb35f-ea7c-465c-96da-4eb5dac9e2cc@nabladev.com>
 <87y0d4v1nu.fsf@dell.be.48ers.dk>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <87y0d4v1nu.fsf@dell.be.48ers.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 9/14/26 7:32 AM, Peter Korsgaard wrote:

Hi,

>   >> OK, but why not add all the referenced GPIOs if you fill out
>   >> gpio-line-names anyway?
> 
>   > Because the userspace depends only on this one line name. But since
>   > eeprom node contains wp-gpios DT property now and the kernel controls
>   > the nWP GPIO, I can also turn this around and drop the gpio-line-names
>   > entirely. What do you think ?
> 
> Up to you. I personally find it helpful for debugging (E.G. the debugfs
> output), but if it isn't used at all...

Lemme start with the later.

Thanks !

-- 
Best regards,
Marek Vasut
