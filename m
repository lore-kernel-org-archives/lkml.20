Received: from mail-ua1-f97.google.com (mail-ua1-f97.google.com [209.85.222.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FE516A395
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 19:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789414416; cv=none; b=M8qL3cUuEr1G9pMsjv/mne8eA8BrJH0XtAfGr2zrHg762hN7h7TlkdhBCWs8zQKT7iLPWnYE/PWRcZm0tkaM5U4rM/E50dNUMD9rC0RQar9vpB7iMBNRBlsiW8K/80adU71mMR9bWM1gZqcs2iP5+DCOOePZnJcc3X4UOw8WTlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789414416; c=relaxed/simple;
	bh=QovQPc4iliFKo25J6xhEnCLKTDsgyZShJRb3NFNeZU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mG+d6Neaty3L71dM1UPtaw4zW2KUF6DetilWlbsDgts+CDdA9+eDi6X66CQ5GUjaLGYjcaUA1Uv4yh6QOWDup6DMXh5oHxqhM/ZqjiqSMcNHMe4rRSovmYcDUFs4+6KiNoT6ixfVF2Jyy1lLQB0IJa4m5HQAN7ifES/Q4d9odyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=HWF0mNfh; arc=none smtp.client-ip=209.85.222.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="HWF0mNfh"
Received: by mail-ua1-f97.google.com with SMTP id a1e0cc1a2514c-97622cc1f40so813104241.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:33:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789414414; x=1790019214;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PCqYKrJhwcMBqMVGNNFrBZCCNQBh47WyyEB7W5B1uPA=;
        b=C9JdqnD6qz7K9OenHa1Ok3lFUVeofxJ0QieHd5C/CRo7uekpDVEyWFbWf5Kwa+atle
         Xr/46PQk3YF7Oq+TMNqMN0husryl8jGOCuR0dhMB51kt+wxiBuCAa3D+fdjsUYyz6Rm7
         03DqMyUKsIAMleUGrMuUQDx7KX5KPVoypmsvK59Qee828CV324q15SbaJ9EV/Fq4jsN/
         kTWbvMdp/BrJQyKVimNphDAEW5be7zsG3+iArmUHYRW6ukkSznZSyYhEdHF1C6iID2JN
         ak6nGjKBMIh/QszifVCiU5jA8vLInA3EeToIqhK4FXh7+WHI5vn+3bYeWSzdMYUNhEBe
         OrWA==
X-Forwarded-Encrypted: i=1; AKwUvByLzUf26994dPeN6/iygRdwfAZ9aNMQBeQAPLOAMnUPg5rGwTqq5B/KvswJXfduIt2x1uMO00/JEIiml40=@vger.kernel.org
X-Gm-Message-State: AFuF++ltAD3jxtg0f66YeIBZsoAE4w1nXlrM+vQvdHlgO11lKE6D42Ip
	KKjC8zUZzpiDRsTQqiRavACXjg9iVZZQ4wSAUVn6CyfR47lLL8F/XHU9dmnm89YE0UUJoF/uyU7
	Nxd97HQ0wvmSa1/y/ld1WNKVtGBHot44ojSZTz9Bl6gt0NCPhETD5ybEKOZUn+3PqK2F3cPg9cf
	qhH1FonT40LUg559m/2dil9mR5xtiB1/Skq1Ea4F2T3k+bX3lhSwgqJ5Ar/9m3wF7zCTg2NfvyZ
	LPkNO6QwSsgiILaqg==
X-Gm-Gg: AYBFou0+WtzS3ojO37R34FipNE1Tli5f8/PCOc0bC7A12YzFerOUHcRj18y8iUK4k2I
	nwmz697V7OqnnINBUPaHRo5KIzwDSkNGhAS11Ore5bnVaEvkVJrWeUV2csT9adTqtM4u7w6NecG
	QRKD9Lal/8NSJbwCK/U5c3QwhIXtYhTY6HtWl+F8v/X0W9BwHlub24gmO5i08QfQxG5pSU4qu2O
	lX/rigTG9waczmixP6jzj8BHgxcMmksv4MsxyEM1BzIKpWM4QkT8l3J5dZ9PRJaLYlgv4z6s+no
	LSETFm6hg3dXzmXH1yFzuvqDmNA7xNOfy+97LzNxdWmbJM8P8XNqdZKXYJSvN06hT3wOpa4eHVq
	NLFAndpnhW4J6HPy0gAQ1IjS/E36SDfM12S0MZI4g2ZShUl3Cb/uQjslpBqM4UHKVsEMveTqsfL
	dmMeiBXYZd/FI/QROIaaN+CvG8Ss0ESPi9REoF
X-Received: by 2002:a05:6102:292a:b0:778:5bbb:b2d2 with SMTP id ada2fe7eead31-79b5b681515mr2152955137.11.1789414413788;
        Mon, 14 Sep 2026 12:33:33 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-7927e99723asm203140137.19.2026.09.14.12.33.33
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Sep 2026 12:33:33 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-530f9b8cd29so36349901cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789414413; x=1790019213; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PCqYKrJhwcMBqMVGNNFrBZCCNQBh47WyyEB7W5B1uPA=;
        b=HWF0mNfhwgI97DhMq5Fb9LeIrAmyDNywpfIM6tzXs9D6gMO8fUeuYR4o5fQalAFfqu
         PoSWDE9M4LYh+yDiNfwK8ILY52h4N4Yl2qemnlggb/e8OPbYnolRSKJR9YQhiYaD//3Y
         SbbMqcimpkTwgyud6JQgiluFxf/fZj0d/k3jA=
X-Forwarded-Encrypted: i=1; AKwUvByzYvzInKgvYuljARocP5f+Umz9xKrlV+YK7Ts1XPxTA1Qs6eewha9e0Vx9Bz48rQXg5NG3bI/0AKlLHaw=@vger.kernel.org
X-Received: by 2002:a05:622a:2b47:b0:530:fd73:6c22 with SMTP id d75a77b69052e-5310cd28075mr78653801cf.0.1789414413247;
        Mon, 14 Sep 2026 12:33:33 -0700 (PDT)
X-Received: by 2002:a05:622a:2b47:b0:530:fd73:6c22 with SMTP id d75a77b69052e-5310cd28075mr78646031cf.0.1789414407982;
        Mon, 14 Sep 2026 12:33:27 -0700 (PDT)
Received: from [10.14.5.171] ([192.19.161.248])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45adb3sm101173966d6.9.2026.09.14.12.33.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 12:33:27 -0700 (PDT)
Message-ID: <d43cfb62-f048-42c8-909b-79a0300790df@broadcom.com>
Date: Mon, 14 Sep 2026 12:33:25 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: broadcom: brcm-usb: unwind clocks on probe failure
To: Myeonghun Pak <mhun512@gmail.com>, Al Cooper <alcooperx@gmail.com>,
 Vinod Koul <vkoul@kernel.org>
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
References: <20260913012956.16443-1-mhun512@gmail.com>
Content-Language: en-US
From: Justin Chen <justin.chen@broadcom.com>
In-Reply-To: <20260913012956.16443-1-mhun512@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 9/12/26 6:29 PM, Myeonghun Pak wrote:
> brcm_usb_phy_dvr_init() enables the optional USB2 and USB3 clocks before
> creating all PHYs and acquiring the remaining probe resources.  Several
> later failures return without disabling clocks that were already enabled,
> and deferred probe retries can keep increasing their enable counts.
> 
> Track each successful clock enable and unwind only those clocks, in reverse
> order, when initialization fails.  Keep the existing successful probe path
> unchanged.  This is limited to the BCM4908 and Broadcom STB USB PHY driver.
> 
> This issue was identified during our ongoing static-analysis research while
> reviewing kernel code.
> 
> Fixes: 49859e55e364 ("phy: usb: phy-brcm-usb: Add Broadcom STB USB phy driver")
> Assisted-by: OpenAI:GPT-5.6
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
Reviewed-by: Justin Chen <justin.chen@broadcom.com>
