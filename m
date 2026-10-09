Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551BE22E3F0;
	Fri,  9 Oct 2026 01:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791507854; cv=none; b=KmkjPnS6hL/j0VPnd2dBzxXTrGHxT46WaDHdIN3kGLJtHoJoxLWyEeX58wt+ncPc3a/9KgyPXBwNzY8AI69Oxr8NNfqrPTNLniwdmJLPUod4McB2dCC7CTF/RKyW0dDL8zXZu7Jb1Gf0J3VmxorQM0fk2XFiaZMG+Kp+fNUxBZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791507854; c=relaxed/simple;
	bh=KGG2Ktpt0yP6Q+5/+9UZusVn4jNj3Et6yKj1+F4L0FA=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:References:
	 In-Reply-To:Content-Type; b=RWrNyny0cToJNdV4fB9dJMqEzsh5NM29q1BBizwXyzGl7q7b475z7s2XzQd3p+fL/8MpYZyappB89bsEimBZAcXiWFy8lNFW7qIJMUYq3phKftK3XVdEz1aYbPANN5bKr++lqb0K06VNm+fl+9BLOlXIw2lMP+LUyrI5jhBC+68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=Yi2bjh/K; arc=none smtp.client-ip=113.46.200.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="Yi2bjh/K"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Rjq55+eOA9/1rvCud0HIBA7S3CKPm/bRJnQetVTrwZA=;
	b=Yi2bjh/KHDywomzaT0FjOJo8ntpiMwuJfT3Mr0C867BVqec4Q5pIS5j8S4u/UHVwIiZcMbtGf
	Dn8SS2cLU34cqyMHiJnNnuhA9MHuVxCcKZ0F9cCPH02Q1slBPyp25S/T7PIVpYKFqBSL0e9ACT9
	VwCoCEoCnmOApdd5ExoTygY=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4j17bn1kXzz1K9B0;
	Fri,  9 Oct 2026 08:51:49 +0800 (CST)
Received: from kwepemk200006.china.huawei.com (unknown [7.202.194.72])
	by mail.maildlp.com (Postfix) with ESMTPS id 6A8F74056C;
	Fri,  9 Oct 2026 09:04:04 +0800 (CST)
Received: from [10.67.112.178] (10.67.112.178) by
 kwepemk200006.china.huawei.com (7.202.194.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 9 Oct 2026 09:04:03 +0800
Message-ID: <6AC83D83.8000102@hisilicon.com>
Date: Fri, 9 Oct 2026 09:04:03 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Mike
 Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Michal
 Simek <michal.simek@amd.com>, Bjorn Andersson <andersson@kernel.org>, Konrad
 Dybcio <konradybcio@kernel.org>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 3/5] arm64: dts: hisilicon: Drop PCLK from static CoreSight
 links
References: <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-0-c3edca1c480b@arm.com> <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-3-c3edca1c480b@arm.com>
In-Reply-To: <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-3-c3edca1c480b@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200006.china.huawei.com (7.202.194.72)

Hi Leo,

On 2026/10/2 23:07, Leo Yan wrote:
> The static links don't need to program registers, therefore apb_pclk
> reference is unnecessary, remove the pclk properties from those nodes.
> 
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi | 4 ----
>  arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi | 2 --
>  2 files changed, 6 deletions(-)

Thanks!
LKTM.

Reviewed-by: Wei Xu <xuwei5@hisilicon.com>

Best Regards,
Wei
