Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794823287;
	b=a3K8Q0LVJ5369vbge6QrtRUnfcg3yfakO5yuOITF7+CLsTQObnsCtsSrfY8eIG56comf
	 L1ci4MH5wmh+yNpWZnRnSGsc/XoBuNoBeW/3P8hVwUVSaVZJLZWRLCLnFCGo9WyaXfGjF
	 0NRw2c7dBMloCjeM+LT5bRA2C90cv3k6UTwD3uAgoVRJoiJw5GigDGx0FA63vTe1nsrWC
	 YH/7eI8XeV40ZVL+69fYEiiD/xhdrboz9K4TwsOcaqwocQ/lDh3BxH+5WRSs0yhSzxwzk
	 u2l4O2ZzkWV1XQpa8xaIFMGivJ73WH40A3BvzeNu6XNeVSBiLSlL89OymvzzENGEWHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794823287;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ZohoMailClient;
	bh=+RGkjd/Qfb4Dw3SBbE+1NagLSuw1G0THfq1R7Ey/gug=;
	b=QKZDPAIjgR5Pvom04drUP8/PPwnB+qGcjpt+Hs4/CpS0Y5kBeLsaO1XWWP7eJ1A6KMSQ
	 voxVffXewuqbePjAbVv6HSSJC3lpfARoPHhd9k1hpLZ48wKYUtLVQTbl7cjSZQPAL8K4e
	 UFZBtzHJ1QHqSGbjRtd1zITRSGMQVBChf2zp4vJ9qf1KyTKVFJ1uc3xpejxxq0iOI70TB
	 6/ie/VqCbmWdbB7rp9NQ7d62ZzAOcVO1pNvxD6am0/E/oHygH2csNbtnoFAleL4TmIr0o
	 099aj6cqAvF0yXDOUBqs4u9BKkvuPdwyhmusR0Uo4wXmJ5lDHa0J9B3fECe3pej4mYw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b="V/YBkTvq";
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41462606A323;
	Mon, 16 Nov 2026 10:01:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41462606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=V/YBkTvq
ARC-Seal: i=1; a=rsa-sha256; t=1794823239; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CUf5+UwYhRfnn8buxQ8wPL6o5V1CqkFUd02zBuF3/3wUjfGTYXwyWaeMpZePi+Yb13asn+2aEkj1FffAl9A5YC+pYc33h7F0LdpND24zoOIOxoKBBHV38O5qFZkDnVNvbkLsaH58sCYbOCgqP9R3C0dl53LPZjJKeOdNeU3/7HY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794823239; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+RGkjd/Qfb4Dw3SBbE+1NagLSuw1G0THfq1R7Ey/gug=; 
	b=A84ZmGMlEkDQWkyxVnHmRSVcSvfABnfX5ksXn7JUP7RmXdhjWkMqV0qe6kB1Foe2XU6M8N+NiiDNRsbXjzgEFGXswvhifdhyozwBEcvMyyniZxJHOnEgs6fXXBhpFk/fjJX5ENoLNn7OImzQUTBYdegNJO5t+Aoz4xn4t3GSV3g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: a=rsa-sha256; b=V/YBkTvq+AuWstlhlVzFK5LywsMcAB/lZUIDwgs66uK9j1v+qq3XqmX1RpQ7E36zCdf+5chq5/7sn1lm/i/0zJY9JjWvCWsh6JWRB6y8wP2e3D9qsM52I7O7T3DiK8eKQbSuono0eD8yej7CQtNF6bYfpFSOIsGFaA4dUmB/GOw=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=+RGkjd/Qfb4Dw3SBbE+1NagLSuw1G0THfq1R7Ey/gug=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794823237050288.840830608097;
	Mon, 16 Nov 2026 02:00:37 -0800 (PST)
Message-ID: <0d837fe2-e192-4fc6-a2e5-c23df40684ab@collabora.com>
Date: Mon, 16 Nov 2026 11:00:22 +0100
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
Subject: Re: [PATCH v6 3/9] phy: rockchip-samsung-dcphy: Unwind power-on on
 PLL lock failure
To: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Guochun Huang <hero.huang@rock-chips.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
References: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
 <20261110-dcphy-rx-v1-v6-3-d681ba20b36a@gmail.com>
 <3ab93996-7e37-4143-aa4c-b4b4b0e025d8@collabora.com>
 <CAPwA33JHxsd=nr9F9_KFKWPx+HGaR8P3ee7hxMc8XCS6QY46gw@mail.gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <CAPwA33JHxsd=nr9F9_KFKWPx+HGaR8P3ee7hxMc8XCS6QY46gw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Hi Jason,

On 11/16/26 04:01, 楊智成 wrote:
> Hi Michael,
> 
> On 11/11/26 14:02, Michael Riesch wrote:
>> I wonder whether this should be here in the first place. Only judging by
>> the name, samsung_mipi_dcphy_pll_enable is something that affects the
>> complete logic block and probably should be kept in runtime resume to
>> begin with.
>>
>> However, since _dphy_rx_power_on does not call this funcion, it seems to
>> be something related only to the TX side of the logic block, but for
>> D-PHY and C-PHY. In this case, it probably should go into
>> samsung_mipi_dcphy_tx_power_on.
>>
>> On the off chance that this is actually for the D-PHY TX operation, the
>> function should be renamed "*_dcphy_pll_*" -> "*_dphy_pll_*" or
>> "*_dphy_tx_pll_*".
>>
>> What do you think?
> 
> The settings in this function are indeed only for TX, for both D-PHY
> and C-PHY, so I will rename the PLL helpers to
> samsung_mipi_dcphy_tx_pll_* in the renaming patch (6/9).
> 
> samsung_mipi_dcphy_tx_power_on does look like a more suitable place.
> However, I do not have a C-PHY board, and I only have one panel with
> mainline support, so I may not be able to test the DC-PHY TX side
> thoroughly. For now I am trying to leave the TX code unchanged unless
> my series affects that code.
> 
> Should I move the PLL enable to samsung_mipi_dcphy_tx_power_on, or keep
> this error cleanup path and the renaming change for now?

Thanks for the clarification.

I take it that the patch is only here because sashiko complained about
some existing bug. Your patch fixes this as-is, therefore

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Still what we discussed makes sense, so let us do some refactoring in a
later series. I don't have any board with display either, but I think
Heiko and Quentin might have one for testing.

But again, let's focus on getting your patch series merged first.

Best regards,
Michael


> Thanks,
> Jason

