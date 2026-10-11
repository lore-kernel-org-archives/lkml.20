Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5CE2594BD
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 22:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791756056; cv=none; b=IvyjnJC7owdy2MUHFImQO98wY88ubfbHxZi3o1mE2uXlRi1q9fkff1kxZQfIpJoyjpFtJL/ENxQsrlG2bZkJ7aPg8zRUph/aiLH9AYM9RSZn+iPXYoXkDWLFjOz6DeELQeDAOk0HN3uD3EcDOT4BaLxJEP8XJWY5GhjB3mgXSJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791756056; c=relaxed/simple;
	bh=Ywh1GMRw2iBO14IQbgD0pj6ibbfA/kMA8uXSyE24qzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mY1ep+YPe9iubk6x5Yvkvj9Kz77RI3QjL7p0F8bYPd1rN6YO+X0oGaBdlMocwSV/Go50Aisxzvjf4i6lo8HJwhsiVKvgW9GiyfgkMlmlHA8RssL6DxYDET3U4mWUs2bfWnTpr4gbJlkJWEhHUmX9o0/DSOxbBwUtXiPlXCQKPc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=RGqVBaoP; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RGqVBaoP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1791756046;
	bh=Ywh1GMRw2iBO14IQbgD0pj6ibbfA/kMA8uXSyE24qzQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RGqVBaoPkXH9kOrMo6u1pfngT02rTOpnlcvjdokeFPC6gfsY8pTcnDkNT7o8t9wiV
	 knISOnkUrwGL+v9OwiuScoWP4JRVi773vsgS5n0x8ffq7qkdLWGlbJWfBqoPGcvaHZ
	 ERt/yxo6khEvhJuI5J8wXejPjKfXQUe8+cOKNl0N/BrgU6AN9gi4EMHPM+7iqIfux0
	 41W5IT7eJAIw9iRPx7w/9Y6Br2Gzul+ABgz8Dq6syTNkYPEEqmufTpnU8vNLX5lZe8
	 w3mIrbqVSkGH9gvXhKZpFhaz4yeYFirR5nSuxWMvbqyNFmD828mmcima5U2AB1yJyn
	 wfgD/gWp/XLtw==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 50A5B17E0110;
	Mon, 12 Oct 2026 00:00:46 +0200 (CEST)
Message-ID: <eac822b3-8468-4067-aa1d-579a2dd9cf6e@collabora.com>
Date: Mon, 12 Oct 2026 01:00:45 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] drm/vc4: hdmi: Defer pixel clock validation to HDMI
 helpers
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Maxime Ripard <mripard@kernel.org>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261001-vc4-common-scramb-v1-0-51280460194b@collabora.com>
 <20261001-vc4-common-scramb-v1-7-51280460194b@collabora.com>
 <CAPY8ntDCU80hkxdDEGphQCX362ut4AdWJUTGkDOwOHWfkPW6BQ@mail.gmail.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <CAPY8ntDCU80hkxdDEGphQCX362ut4AdWJUTGkDOwOHWfkPW6BQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dave,

On 10/8/26 9:01 PM, Dave Stevenson wrote:
> Hi Cristian
> 
> Sorry for coming in late on this one.
> 
> On Thu, 1 Oct 2026 at 01:27, Cristian Ciocaltea
> <cristian.ciocaltea@collabora.com> wrote:
>>
>> drm_atomic_helper_connector_hdmi_check() rejects modes whose computed
>> TMDS character rate exceeds the connector limit before invoking the
>> driver's .tmds_char_rate_valid() hook.
>>
>> BCM2835 is capped at 162 MHz, slightly below the 165 MHz limit of HDMI
>> 1.2.
> 
> Nothing I have says that BCM2835 is HDMI capped at 162MHz.
> Working back through the history, originally the HSM clock was always
> set to 163.7MHz and the pixel rate had to be >1% below that, hence
> below 162MHz.
> 
> However that was reworked so that the HSM clock rate is now set to the
> pixel clock * 101/100.
> The HSM clock can run at 166.65MHz without issue, so a pixel clock of
> 165MHz is fine.

Thanks for checking this out. 

Since that would be a functional change, I think it's worth introducing a
dedicated patch, acting as a prerequisite to the current one. I'll handle it 
in v2.

Speaking of which, assuming no additional changes are required, would you be
able to merge the series afterwards? That would get us one step closer to
finalizing the infrastructure cleanup.

Cristian
