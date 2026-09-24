Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672D53E63B0;
	Thu, 24 Sep 2026 06:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790230247; cv=none; b=uZmBm0EL2yC3scidtWpYIdBes2L8UqiGQHZfRFO2+ZQmsGHOSY+vKB+F/w4efnEDEWcJLSlwbAYn2fgennblT0Lt7GNi5T3U3XlTFONWM1GX8FKryEB5oMzO7ds/0AnGPyohUobSmFci9YjsEcNujh+n/FnInTYf8RSNwRKp9X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790230247; c=relaxed/simple;
	bh=wKir4Z+kA7y/Fr7nUOeGS0b4qGfcmHwPVE1GJXscEuo=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:References:
	 In-Reply-To:Content-Type; b=d1h8qjkYgpYcpJozPN54HIuEw8XHEdm8Ekpm3HE+L1eE0YHin9ocL8uH8ROb1BkuIM4s3Q07StcgQpQy0KaReICXIquPf+s+4dMcZeRobP7spSU/umQrLrdokQCVE23R369LA9PnFsFryKvm3tY+YXdoIbvzUftizMTxdVm93C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=E/YwEcQo; arc=none smtp.client-ip=113.46.200.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="E/YwEcQo"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=+LkQbBr09PhLSFNntJ1K1HOZ5KcEQ9Y9EDgPD4khFSI=;
	b=E/YwEcQogKrBRly0ILeCe/c9TAkdEHi8lg4dfRUhqnH3VViEWvBVDU3Usz44PxlnUH5Gxzr+1
	dAMySI19E7KGqC/HsXNwxrSmJRYWyUGy2JoKUJkZbnS1NRm63cb2SMs0O/7DP9Wufl3P5nGIYcD
	AdbG/2DYKyybETDthf54M9s=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4hr36W2r4xzLlX1;
	Thu, 24 Sep 2026 13:58:27 +0800 (CST)
Received: from kwepemk200006.china.huawei.com (unknown [7.202.194.72])
	by mail.maildlp.com (Postfix) with ESMTPS id 5328C40565;
	Thu, 24 Sep 2026 14:10:33 +0800 (CST)
Received: from [10.67.113.213] (10.67.113.213) by
 kwepemk200006.china.huawei.com (7.202.194.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 24 Sep 2026 14:10:32 +0800
Message-ID: <6AB4BED8.8090804@hisilicon.com>
Date: Thu, 24 Sep 2026 14:10:32 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
To: "Rob Herring (Arm)" <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] dt-bindings: soc: hisilicon: Add HIP05 CPLD
References: <20260923191449.2204388-1-robh@kernel.org>
In-Reply-To: <20260923191449.2204388-1-robh@kernel.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200006.china.huawei.com (7.202.194.72)

Hi Rob,

On 2026/9/24 3:14, Rob Herring (Arm) wrote:
> Add schema for the hisilicon,hip05-cpld node on the HIP05 D02 board
> which is already in use. The node only contains the compatible string
> and one register window on the local bus.
> 
> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Wei Xu <xuwei5@hisilicon.com>

Thanks!

Best Regards,
Wei
