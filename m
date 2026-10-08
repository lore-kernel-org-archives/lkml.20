Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77356255F52;
	Thu,  8 Oct 2026 12:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791460893; cv=none; b=BfW4i1pE8WNNkDdgm4iuj2Tlg5u9sp3Ta3cRd2JBprlrE/dARXsdR43ARgWzwxUgtwQwqzKUyQ81lwgmftxvypvDsZNLFADRtqtYeYdnC1kxRAwOCj4Qker+7sm6YHQTsxXP8gqZMGRo0L9hqkoROFyvulh4x40PZPn+KlcGZwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791460893; c=relaxed/simple;
	bh=qMRVziGPzCtMwld1lzf37fz5iHB3YpLxvLKL6rBz5gI=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:References:
	 In-Reply-To:Content-Type; b=QcOOzAuxs0AzRKi1ZfgtbNbAKO+6P1UdwGv6YQGfgt7WUqnRk6APEwjMNIpSXRJ3AfvlOShGjFuKncTk2KgEmOHOR8MgskbkjS/WlMeP/DEOevJWDzyDcZFuO0gYrLVzEEoQpJYw5s7UMmMKJNkFPLc4jpVKNRKJp5nf6XSYGig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=VaLxK1ub; arc=none smtp.client-ip=113.46.200.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="VaLxK1ub"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=zP/NKYu4DfkhxHxe1NYNyBovs0qsaVZeGfyDxa6IlmA=;
	b=VaLxK1ubNTyR20h/UUPt5skCxaIe/Z+TcIYb1uo9vO+a4cTxfxxitZD1I7eb+VzwpMqadInVf
	5r12Z4epsvqo+IRSmE5hFtTJW/KT9XwCmXPUY/q7CztfOQdqRorshPqp7Fl3TrE/sWpjMQjxwCI
	gEI3yImnpIqoeVuS/xV877M=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4j0pDT1vyVzpSyV;
	Thu,  8 Oct 2026 19:48:57 +0800 (CST)
Received: from kwepemk200006.china.huawei.com (unknown [7.202.194.72])
	by mail.maildlp.com (Postfix) with ESMTPS id 0BFA140575;
	Thu,  8 Oct 2026 20:01:22 +0800 (CST)
Received: from [10.67.112.178] (10.67.112.178) by
 kwepemk200006.china.huawei.com (7.202.194.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 8 Oct 2026 20:01:21 +0800
Message-ID: <6AC78611.5090404@hisilicon.com>
Date: Thu, 8 Oct 2026 20:01:21 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
To: "Rob Herring (Arm)" <robh@kernel.org>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: media: Convert hisilicon,hix5hd2-ir to DT
 schema
References: <20261002193158.3263741-1-robh@kernel.org>
In-Reply-To: <20261002193158.3263741-1-robh@kernel.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200006.china.huawei.com (7.202.194.72)

Hi Rob,

On 2026/10/3 3:31, Rob Herring (Arm) wrote:
> Convert the hisilicon,hix5hd2-ir binding to DT schema format. It's a
> straight forward conversion.
> 
> As this was the last reference to rc.txt, it can be removed.
> 
> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Wei Xu <xuwei5@hisilicon.com>

Thanks!

Best Regards,
Wei
