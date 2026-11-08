Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794162356;
	b=TNsWWC9gceIMZUW0tJFhAWZTG+UQ+VVFFGndRxoi0crghMJcBZo7FyC5Zcg4l7Dy27cL
	 xrkqBHKvfGtZyClYHUIMMYJnhr3T0laF1XNN8dY7tGMiGwrHj/AgV9QOXeqHt2YOHu6Og
	 SSLHotR8ktWrsXUREhT2IUgZMNs4e1RVVgCNeSLlCfBnLYrYYPFsqjH+mr/Ez4Ht/+48j
	 pSrE6fSePHNw5r4YKe8nVO3WjzxUWdIWPK+jgTpEOIJ7Gcs7RgHXYSbDxdsAWQvO+gsPt
	 yzVn/MKTAVbGqN5LVXF4VU2y//LhNzv99PzF6DVTxmVpxedF23ywda0jbu1uuL00QyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794162356;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=idbZZdn1SuOKgz4rauQtb73BBm+iL+Kf0sgPmQoAV8A=;
	b=5MofJhRC1Exfies+CM1LzYMBoWHZ6WIDiYGUMRFFrUurYMin8VX/PdfEfISDLlOs3Iyj
	 roe43jQnFaQKesqXC7Gjfdgkwr0eFRO4o2KUpT8WqkdhffUGYPMbQkdO6NN7Sz5f0JUgv
	 pVkOCdcOdqAMVPuG4rRilfOrw3M2PQk+iBmtnUXqj2ik9z14WvrcPxBfyoMfGA44WxkMh
	 JHYOLDgIs81xJAxp/7XQQ4KUJuXTLVJq8xn/TAAJKB9datXzlFO87WcFumifNrHuw1pe4
	 yu57cX4bJ5cPDmxNs6D17RBu6R0fAYirhf69ElGwdOoz6Jjcvo3ipR/dSSdpy7J/fXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PUN0WCrK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A119F606A31C;
	Sun,  8 Nov 2026 18:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PUN0WCrK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E476A1F0089F;
	Sun,  8 Nov 2026 18:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794162354;
	bh=idbZZdn1SuOKgz4rauQtb73BBm+iL+Kf0sgPmQoAV8A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=PUN0WCrKv0kOZLULktHuNYch9QCXMUz3JcXKhYltea5si9QLYpK6FSQYpTTWkkQDJ
	 o3Vs5WmveOPcHwW8u+LZWIvRyYsAm0I4sgYnsa2HgFDSVOc5YHrJpSrC17bEQvBPtS
	 xPXFwb+NeFQyhd9c2nFYoWghDXgr32gE/uLe0cEy+iTIlxzVElqn2AF+AeNYKO6d61
	 2HQlOc1vTl2gGLboP1xKfJYCOQ6LW6nSJ9tpmdUMR1Ge28C3FEBs+yWFilVuvbtCMU
	 ejfFP7khTkGmx8xFXEA8OKL2Pp0COHNbgmu3aodcTDkjEJMJa9KNuuRgIv5ja8Bgke
	 PLuv9ZuV0iBng==
Message-ID: <2a1fb3a2-6adf-47d3-9aae-2ac46ca95cea@kernel.org>
Date: Sun, 8 Nov 2026 19:25:48 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] phy: apple: atc: Add initial M3 series support
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261108-t8122-phy-v1-0-c2783b2a53a8@chaosmail.tech>
 <20261108-t8122-phy-v1-3-c2783b2a53a8@chaosmail.tech>
 <4a6ae329-0d73-4ab7-bd87-7acafcb8778b@kernel.org>
 <F39FDF3A-E5DB-44F8-A31C-7856F7FA41F9@chaosmail.tech>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <F39FDF3A-E5DB-44F8-A31C-7856F7FA41F9@chaosmail.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/8/26 19:21, Sasha Finkelstein wrote:
> On Nov 8, 2026, at 19:17, Sven Peter <sven@kernel.org> wrote:
>>>   /**
>>>    * struct apple_atcphy - Apple Type-C PHY device struct
>>>    * @np: Device node pointer
>>> @@ -599,9 +647,10 @@ struct apple_atcphy {
>>>    struct apple_tunable *lane_usb4[2];
>>>    } tunables;
>>>   + const struct atcphy_hw *hw;
>>>    enum atcphy_mode mode;
>>> - bool swap_lanes;
>>>    int dp_link_rate;
>>> + bool swap_lanes;
>> ugh.. somehow dropped this comment from the email i just sent..
>> is there any reason you move swap_lanes around here?
> It saves 3 bytes of alignment padding. Yes, it makes no sense on
> machines of that performance class, but I could not resist. Can drop it
> in v2.

Fine with me either way ;)

Sven

