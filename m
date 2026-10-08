Received: from canpmsgout12.his.huawei.com (canpmsgout12.his.huawei.com [113.46.200.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B732042124D;
	Thu,  8 Oct 2026 12:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791461560; cv=none; b=rDYjH3064RVmvVQO9JtMniohTO96UiT9moEmIpTS2fWt6lrhnyJ8yn5wmLi88T8uH4GaNjIoF+HErBql5bVnBviHzDPgoo0mzeVWJBTGFWk1FFsyso7BHcUEMSSWxDC2XTiuTUkJYJjUNscAnfXpD/RbAe0ks4pOG4TC4YOcI9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791461560; c=relaxed/simple;
	bh=IDpKUhtPR/7/inDI/ZdHtXIuZR3OHaNUZsyiPpHJnQo=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:References:
	 In-Reply-To:Content-Type; b=Zwc1po9NXBQr+z0fbY2dXCCUSKpib4u6uoX4+CcIMsZ/ox5gO3OcEDurvtr2i+d/mhTRw8ITNFPUzjgngWVjNJ6baUpah2RmJSrohyILb/fLttVdHRnQ4zhs2RPr1Qq9rUq5Rz2QqEbmyaiwissabZOw6U0dlYTQGBPcFCpLd0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=OdkP902L; arc=none smtp.client-ip=113.46.200.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="OdkP902L"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=v8XhiJzQ0wkWf3cw1AMfX8eIn7JkKx06yCPZ44dMqLU=;
	b=OdkP902LbaNlpRqM4BwZ+Jh03nenBTC0JSYYixmZZhDhLIbx1BOHhSAmRTJv59XJTC5n2zubC
	dLcTOmoa8ezu5OSYJao/ceufHG3tuOWHnbk9gjXarNO8OLe/OtPXRWGpd8YYL9sH478JHA23ZKd
	H4BXX4eUG3DmE2N2rTx1U+Y=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4j0pTx4H5gznTVd;
	Thu,  8 Oct 2026 20:00:37 +0800 (CST)
Received: from kwepemk200006.china.huawei.com (unknown [7.202.194.72])
	by mail.maildlp.com (Postfix) with ESMTPS id 4750B40563;
	Thu,  8 Oct 2026 20:12:33 +0800 (CST)
Received: from [10.67.112.178] (10.67.112.178) by
 kwepemk200006.china.huawei.com (7.202.194.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 8 Oct 2026 20:12:32 +0800
Message-ID: <6AC788B0.9010806@hisilicon.com>
Date: Thu, 8 Oct 2026 20:12:32 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
To: "Rob Herring (Arm)" <robh@kernel.org>, Jassi Brar
	<jassisinghbrar@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: mailbox: Convert hisilicon,hi6220-mbox to
 DT schema
References: <20261001230547.2752114-1-robh@kernel.org>
In-Reply-To: <20261001230547.2752114-1-robh@kernel.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200006.china.huawei.com (7.202.194.72)

Hi Rob,

On 2026/10/2 7:05, Rob Herring (Arm) wrote:
> Convert the hisilicon,hi6220-mbox binding to DT schema format. It's a
> straight forward conversion.
> 
> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Wei Xu <xuwei5@hisilicon.com>

Thanks!

Best Regards,
Wei
