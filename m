Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9FD1A6835;
	Wed,  9 Sep 2026 07:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940321; cv=none; b=d4jWnUQktPFXW6QeIeuLQqQIvgi8sEj/asVAYhXLR2w5Bt4oIAbZMAcNT4HevoUA5TLPbhXgvvPd3rqfDlZblbne1YefdOqU7cNNuWvW63paj3s42rDjhRieoslqHEsihPCYYqWQz+urIcDvb+3at9T1eXT/N4BrwpwreC2FsKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940321; c=relaxed/simple;
	bh=dUESelDRcMcbWsrkRSlHWMWFgBjHtb8uoGGa1xfW+Jg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tOW6q3LFFB1PSSI6c4FDQm4INQBwubfUQtXv/hPZqclpXLnkczJYldrljnLDdkjbH4TYcxLwLnxOdNQGo5tcwjWk55KvGHpvE87i97q1Qt9zrPs4bFp+4qEAcnokeEDDAwF6Tnon8q0vVfLHTMmuA1M0wedMzXEhCr16ks4q6Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KRC2oOA9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KRC2oOA9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E2751F00A3D;
	Wed,  9 Sep 2026 07:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788940319;
	bh=5vuh78kClq7KGvNejQQj0xWgLvOfNW79nm/EQCjh7xM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KRC2oOA996pcNN3ePwBT2Aj3PJb5c180iP1CZ3GDkEW9Tm7In9H55tc1zN4j130Lh
	 6HlGVdRu6z78+bjhJqHnLE9yVRsjUxwImOAdCCR83SJX8rJjDpn0z/xzoPnww1ZgEf
	 PhD++BDphIUiac/NAoWZ6A1HkJtB6yDBD3W1Omcgp/zZVPOLsbiudnaujERNlIzVE6
	 bGFOV8T+gnv77bZhh8BqTdDdnKWQ7VfnGUqDYIuf6M7R/ZD6Qb+WELWBKvNm9NixIz
	 BebInEfVLIWNjg5uxGXcyecPMAKzIRdnTTiU/1nSyxYbMGwRlDMbW8G6iCf+kCf9kq
	 usy+3sDjogSrA==
Date: Wed, 9 Sep 2026 09:51:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hongliang Yang <hongliang.yang@cixtech.com>
Cc: peter.chen@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	p.zabel@pengutronix.de, vkoul@kernel.org, neil.armstrong@linaro.org, pawell@cadence.com, 
	rogerq@kernel.org
Subject: Re: [PATCH v4 2/4] dt-bindings: usb: Add CIX Sky1 USBSSP controller
Message-ID: <20260909-sceptical-eager-cobra-b550a2@quoll>
References: <20260906032440.470788-1-hongliang.yang@cixtech.com>
 <20260906032440.470788-3-hongliang.yang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260906032440.470788-3-hongliang.yang@cixtech.com>

On Sun, Sep 06, 2026 at 11:24:38AM +0800, Hongliang Yang wrote:
> Add device tree binding for the CIX Sky1 Cadence USBSSP controller
> glue layer. The integration adds glue registers and mode strap
> controls in the Sky1 S5 system controller. The CIX glue node wraps
> a Cadence USBSSP core as a child node.
> 
> The per-controller RCSU control and status registers live in a shared
> RCSU region described by the cix,sky1-usbss-rcsu binding and are
> referenced through the cix,usb-rcsu phandle.
> 
> The per-controller RCSU registers are accessed through a syscon regmap
> referenced by the cix,usb-rcsu phandle.
> Signed-off-by: Hongliang Yang <hongliang.yang@cixtech.com>

One more note:

Please use git to write commit msgs and then actually commit.

Missing blank line before tag. This is triviality, but why you can't
just use tools which solve such trivialities and no one ever has to care
about noticing them?

Best regards,
Krzysztof

