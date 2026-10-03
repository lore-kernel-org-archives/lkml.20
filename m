Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CA11D63E4
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 21:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791063230; cv=none; b=eBoSAmAtWiP2QmenKw6PXuNT1Vi0OGIJFL/P+psYQyyZKflA5+xFS3BpWLO6JrL5KX36fBH+ANMnMz+XLJQXbuiSAOuQhGO0aWv7MiDxBiiUlR3Vvtq9yVxROzuquW762IBIxGQ9SKBa9+roCGO2gJKyg3Yz0VnMc9pggMGn+iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791063230; c=relaxed/simple;
	bh=kDXqnGMv+3/dGk6DPxEqeXvBQLgvyQU5ZWM8ZzjXf08=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RBD2eeA7dmAEPSJMXzMxu5VQ9Q86kJoiFkln0pwQ6qul748et4/Vd5uBTMhYtqIH4kZO5IJYoMyuZEptzqy/ATs6J/5l2jcgOICDYQ7vXlct0LkQ/hzJg+OP9METFwYAX5enjmluU415h73pzr2qFAt9V9Eckr+1Jxh0DIIN0Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=OpnIRgT1; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="OpnIRgT1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1791063221;
	bh=kDXqnGMv+3/dGk6DPxEqeXvBQLgvyQU5ZWM8ZzjXf08=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OpnIRgT17QQtur0E7ZQ1+4nbWFI2gwCemx/0KapAoxCvcfbqCtyXKndD4Y+fQ/EM4
	 SqhioB0vXIvFRNbrKcA0akg79VEJVi6YYscqU1hSEo3YXe4L/RHhabOeEzRRi7Ln9i
	 SSh1J8rjqKFZf/dDdmtSXDdNjZE/UwDH0smNer4XqntGgxKFm8IE6xzEgk3EeVzHAh
	 yZGuZF7ayBD43yRIH2gtEJc9jjtZ9y16CZZR9A04TYETZJCc90911F5G3rAO3U0DN+
	 Bgfn6E9GoboB1gZGX+Oqt9rLkjryemH9M9FvyJ27hT1DtEIMtNPG7c/uZvjHnqzRMN
	 +cXR9cJyjrgLA==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0716617E022A;
	Sat, 03 Oct 2026 23:33:40 +0200 (CEST)
Message-ID: <3c0dc77b-b692-498e-aed6-aa97d827b2f4@collabora.com>
Date: Sun, 4 Oct 2026 00:33:40 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] phy: hdmi: Add optional FRL TxFFE config options
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, kernel@collabora.com,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20260901-hdptx-ffe-v2-0-3a5922c76fc5@collabora.com>
 <20260901-hdptx-ffe-v2-1-3a5922c76fc5@collabora.com>
 <asFoBih6P7Cr6Ute@parshuram>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <asFoBih6P7Cr6Ute@parshuram>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Vinod,

On 10/3/26 11:39 PM, Vinod Koul wrote:
> On 01-09-26, 22:55, Cristian Ciocaltea wrote:
>> During HDMI 2.1 FRL link training, the source and sink can negotiate a
>> Transmitter Feed-Forward Equalization (TxFFE) level to improve the
>> signal quality.  Starting from zero, the source may increment the TxFFE
>> level up to a maximum agreed during the LTS3 stage if the sink keeps
>> reporting FLT failures.  TxFFE adjustment is optional and only attempted
>> when both the source and the connected sink support it.
>>
>> Since the existing HDMI PHY configuration API covers the FRL rate/lane
>> selection only, provide the following fields to the frl sub-struct of
>> phy_configure_opts_hdmi:
>>
>> * ffe_level: the TxFFE level to apply, only meaningful when
>>   set_ffe_level is set.
>>
>> * set_ffe_level: a 1-bit flag that changes the semantics of the
>>   phy_configure() call, i.e. when set, the PHY driver must apply the new
>>   ffe_level and ignore the other frl related fields.
> 
> The ffe_level 0 implies it is disabled, so why should we use a flag for
> this? Rather use if value valid (non zero) logic to apply..?

That's not quite possible because level 0 is valid (and the default) according
to HDMI 2.1 spec. The source is expected to reset TxFFE to default whenever a
new FRL rate is set, hence the API shall be conformant. 

Regards,
Cristian
