Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7B05592ED
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788873932; cv=none; b=tIEf5pIL4cywjHWo9/+FOkrZprxynEudR71fYMuJniqK4YL0GbAI2Us1db6EJPiZJGwmMP2RY28YwG5JPrbC178IdvdHjURWVaZOsvoG8vu8m9Ke3gTrhDcAdyhQ99N8bHk3/PD8o7+/pX6yJgdyb4g5UIohdOQpetJ1d71240s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788873932; c=relaxed/simple;
	bh=doNjk0yqnNQBRJnnu7Oiv++yMMQ2tJBZJ5rKQaLA95c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LwhLWJ79MCEoS1B/qX8x3vqPUMoT+f0UpmcLN+mRSkZs7hB7n85VhS06xJxOp2AnIF5KNl10CuFuXK146GM5WfzgB9eRccrk58p8/cndnKLBsANpHYaqoxUt+m4tD8B7ozjEieQcexcr0WNiCrPkQI+Qp7rxxlmypGF+ySXnSFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ixPdl99C; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=WlSJy4nU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ixPdl99C";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="WlSJy4nU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788873913;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hz/K5P+rC7nHSjFEEEM9b9gZTobWQCboJgLPN/xVSyo=;
	b=ixPdl99CXgO/YzdcXZfcRR0t9WnYHBOj6OSKRct8khLTF91cVebaxe8v08ICiE80NL0b0M
	0ownQIfmNE9x3QR5S5PHeMdof94PvOu/sIVGq4nT9VRGYHjorECFLqdn47dzMhVeAA3x2i
	6Kb4iW1Gh9bKhiWU3YBlzkPSmD+pHIU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-eyKY6mcHMb-yWNi0TbAMSA-1; Tue, 08 Sep 2026 09:25:09 -0400
X-MC-Unique: eyKY6mcHMb-yWNi0TbAMSA-1
X-Mimecast-MFC-AGG-ID: eyKY6mcHMb-yWNi0TbAMSA_1788873909
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49b7c1dc61eso37766115e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788873909; x=1789478709; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hz/K5P+rC7nHSjFEEEM9b9gZTobWQCboJgLPN/xVSyo=;
        b=WlSJy4nUE2ZwoJeud1ZH/6MR7+18OAMj3dtB+4jSuwJQGacrpa0fgVipvLyhhLh7cs
         Yg9o3wiV47HSgzNmopKRpWDJAJvijEF6sCQZVDx5S4r4e+p1WjcOkCulVh5AUXIARbRm
         0VK02cFws5pHE9spuKcJnVCJhuY9NeGN18+NoYzDP72KxUHv4N0zkDHsz/Y1BKm0IsSN
         7YN8rG7ae5CGu4jI3Dt9XDfVf5sfMjVpCRtQXtSpR6HBDbv8w3WNMWHx0y9LkYDM7/MK
         YNfd+FUbHZs8SgE1aXAL/0YKjLWQw5s4O53mQyBCo4CXUY6nKRkNtZhiHtzWJ0yeT79U
         wn1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788873909; x=1789478709;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hz/K5P+rC7nHSjFEEEM9b9gZTobWQCboJgLPN/xVSyo=;
        b=ibz7Lnqc9GMI2oTilFYs1ssDhvHCSEzHw+J9PjVsr9MhHQMOV8n3s5rYOe4OUiKFMq
         FX2HIlrCg5e7ye50q9sfu1xfSJV4Ei03MvK1IusxGvf1+1KdXt4eJnUvkEnU036TpjIg
         tY0lqbtmZwI4m0Zflh8Jr32RwO2J/RK2TgIabn1vmzDRabZNkxCIj1PxSZN24xMSDcKB
         VyAIBFKujYDNqI08Xz6H/MDEQDQivMJ9cAWzgmItYbHbb+T2l1DODEtxhX7DqkhZBFrj
         LtdH6qJEOk0847lOfGv6/cqz97XbIQ4QU9T+8hxbBQQlCP6JwAuwOqCZVoL0Ll7kbHRm
         znfw==
X-Forwarded-Encrypted: i=1; AKwUvBxzWCFcsCuIq+FFolk2fmLsVqGr26zP9O8HE+cYdkmrPE/8bkROpzsqh4ytQcnN5dn/ATQMHkm2GztEY8c=@vger.kernel.org
X-Gm-Message-State: AFuF++nuPg/VA5mSBL73BJu0bhICFYoRWoRUu4mZoiMO9SMVcUbdWsZm
	DU5KPKVRUbBsYKRipYF6hsNSXkJk2hBXrviHWPuDKGW91KqZDj4jTYTj1v2pIvd9JaW79e3a3ZB
	U9cSBqh8aFN6gRFS88VPkNEaOio1VqJLPIaC9Is4hCFkPpl1ChqayHSJcv4fnm9AFmA==
X-Gm-Gg: AYBFou1x4KJb6x4ZzuuAk/zYkMt2Rh94nfgmbh3IH5Wh7AFY0sQAOxDz0B6ErFnbtwU
	9dM1rCp+6u3banbAFVBV7i6l83hdflN9AkmQm+u8nGZirmDRBDJmOk4PCDZAzeq5XPhttMHNI0W
	IqwfaIOWN5mhCHiBL8GS1N7fvs8JESdZUQgCjI6zZT6UBlhkjr7eQp/yCqw7Kbu39ZSesAL0AQs
	7wLe4r12FVKDcHEDL3iXW1wov7Vvt1lnxvGhA/Rq3PbfdDAkTyHLXpoSy2T5yEde6EhMrZ0F2mi
	Z8cKxmJ8r3sv9XDMU5jon/d3WRxKQZZux9B89MBL1czVebL0gohDjmKSAiQiEiYWN8b6oMtiyhn
	agoFVW6B1jES/DLoxNtKSWa/lRaNa+YzdJGqUdlvRmF6ZmcyM1q0dR3D6TtiVebW+HoCyBUK3FA
	==
X-Received: by 2002:a05:600c:4709:b0:49c:fa21:e748 with SMTP id 5b1f17b1804b1-49cfa21e99bmr265389895e9.30.1788873908678;
        Tue, 08 Sep 2026 06:25:08 -0700 (PDT)
X-Received: by 2002:a05:600c:4709:b0:49c:fa21:e748 with SMTP id 5b1f17b1804b1-49cfa21e99bmr265389265e9.30.1788873908208;
        Tue, 08 Sep 2026 06:25:08 -0700 (PDT)
Received: from [192.168.188.218] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d00031c95sm366226895e9.11.2026.09.08.06.25.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 06:25:07 -0700 (PDT)
Message-ID: <c44aaa6a-a06e-4799-872f-909e4520c966@redhat.com>
Date: Tue, 8 Sep 2026 15:25:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: phy: dp83867: handle the active-high LED
 polarity mode
To: Donggeun Yoo <donggeunyoo.kernel@gmail.com>, Andrew Lunn
 <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260903022839.4006614-1-donggeunyoo.kernel@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260903022839.4006614-1-donggeunyoo.kernel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/3/26 4:28 AM, Donggeun Yoo wrote:
> Commit a274465cc3be ("net: phy: support 'active-high' property for PHY
> LEDs") added PHY_LED_ACTIVE_HIGH and made of_phy_led() set the matching
> bit in the modes mask when a LED node carries the 'active-high'
> property. dp83867 was not part of that series.
> 
> dp83867_led_polarity_set() only recognizes PHY_LED_ACTIVE_LOW, so
> PHY_LED_ACTIVE_HIGH falls through to the default case and returns -EINVAL.
> of_phy_led() propagates the error, of_phy_leds() drops the LEDs registered
> so far and passes it on, and phy_probe() fails. A device tree marking a
> DP83867 LED as 'active-high', which leds/common.yaml allows and
> ethernet-phy.yaml references for led@N nodes, thus stops the PHY from
> probing.
> 
> Active high is what the function programs when no polarity mode is
> requested at all, so the initial value of polarity already satisfies the
> request and only the case label is missing.
> 
> The same series updated mxl-gpy in commit eb89c79c1b8f ("net: phy:
> mxl-gpy: correctly describe LED polarity") and aquantia in
> commit 9d55e68b19f2 ("net: phy: aquantia: correctly describe LED
> polarity override").
> 
> Fixes: a274465cc3be ("net: phy: support 'active-high' property for PHY LEDs")
> Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
> ---
> Compile tested only. I have no DP83867 hardware, so the failure path was
> traced by inspection through of_phy_led(), of_phy_leds() and phy_probe().
> 
> The polarity bit sense assumed here matches the datasheet: LEDCR2 bits
> 2, 6, 10 and 14 are LED_x_POLARITY with 1 = active high, 0 = active low,
> and they reset to 1 (SNLS484J, Table 8-24).
There are more drivers with the same issue, and Sashiko suggests to fix
all of them in the same series. I think instead this fix can be applied
standalone, to avoid more traffic on the ML.

Still an explict ack from someone actually owing the H/W would be nice.
Waiting a little more for that.

/P

