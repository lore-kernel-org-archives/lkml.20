Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755FB34252B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401623; cv=none; b=P7HEh4H6osCvh05NXkLJgDsZNc4/Qy5f6miT2O9rF8DnHRQNbb6Uqm1BFz/HHhDr+i2fcuP7dLCE2OyTtd284W3uvMuWZRY+83AHMcHeBgyX5z54Bse4ovwEtdJQDqiVZWWlqshn0XooBlTwHIycQjWUEZr9hsmGGtsfQ7V3P/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401623; c=relaxed/simple;
	bh=XRYbluNPP8AMPvjs11ldgv62V308J1KXRstC2EzoBRY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Xa+fOhe4G1qFGFSVo1GtbUbh6NoOyFuuMh/dTiHrWwUT9QOP2HUcYUmZJ9t0EbVJr7Lb5RqFt/vulVfZsMfdPL3ZWlQP+61YYtyGd7nROphBu1DlFj18sViyK4TPZjXnM+PqyG94QsqxbuVc56QcULEJh7wFVhyzqxc7XGnlSuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HzDwXL9P; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HzDwXL9P"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c29c49a977aso37380266b.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789401619; x=1790006419; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XRYbluNPP8AMPvjs11ldgv62V308J1KXRstC2EzoBRY=;
        b=HzDwXL9PtsDZPrCoGHlBfi3c4hkfP5Rkangyd+FB4oy5y3C55KbqWNTTXpBlj4dz1m
         f/kbk37o3+kByzdp86QQ/dmw1wjwzOumcgFZd+OcEd6TuRNr3pdyLU00qQUmbLGzGwuF
         pEvKR28EabW2NcyBFyUTQcmx+GBojbEkBEMdsPquEO9YzjEyLHHMqIYP1eMBpgLi/goa
         ucblFqTsGUyhMYO/XIbIeIyJARiR6ngG0e3QFgF63C6Oq5Mej9ZC2oIJvmV4Q5wqn+U8
         fWyeRadgBEl6DemrkomvZtyPsRq6vp9VH4X14HhrMFmaLz3yvCXhqFZGX/UzT2BUBb+h
         +fzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789401619; x=1790006419;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XRYbluNPP8AMPvjs11ldgv62V308J1KXRstC2EzoBRY=;
        b=giHtIDRetdOy7fUoQMXIY7yaUczaO3WIKOJvtoRkG+Mj8ozW5DHXuCs3xO5YyOeTHI
         BuTiCY4hc5rZNtoHvyCheYcmYISOvRmq8Gc8AKtTdzC/OtkKx53FzcD9UtWz1An6jTP5
         Y7Yfst3IVfrIqQtTusNFj8RhMkuZkqa/sCaBUsF/0iXBshMLPeJP8+liFY3shvnypSeZ
         s0isGkMxdA0HKIPqXdghvnbV8KuNHv8QCUKsuN01lLpXz4uDaCMJGK5GiF9pfeA4zmlh
         wJBOk7eRJBT3q9i+EEDNtBMH0CiQjjpGEf0rLELlK5KeewSj/QkHM5oQGOFCgM+x2fsb
         EXSQ==
X-Forwarded-Encrypted: i=1; AKwUvByizfXNTFRPFGz2qyd6cxYKBPT5zEXxLV5d2YXjjRUjzCwybE9tPm4Y8zPsrEdxR7pVoX/NbBecJ3R7ZPg=@vger.kernel.org
X-Gm-Message-State: AFuF++mZ254/yo97tnkocYZlX1UactCf3VopPZsQxFcjhQl3cq72vbPg
	/YIXizUucWa+eU+H87m9BlKnFlHE4Tuc0keS8ERNQ40OIKsJprPncK9qq4BPTwuEz44=
X-Gm-Gg: AYBFou3GKaPKANbEd5arAwkme6hM8xHBgEJN7S+Ql39Pi1udhvusC9UKFff3qqvnj2s
	4e0UvFj/H5aimNBOpDYwAmp8pMEp7zOESp7xdOitxRz2CNxTBikmuZnoDom/9qXzKNJ/Fo0WoEb
	AkAl7MaW0J2abbS4wzAETJUHO0YBmvrFFWCTvxiZLFul4klkjkA5PRx5TCnmR9265a8XhfhMh6e
	Me0A1ReeziKI4usY1OFidVdRyCLldtkR+QdUr2C26b+yzYQNEg61I7+Qi5JBbRZz29TjzeJDS03
	HrL+IECj2yttB4c3JEJXphupesBKsjCg+5synnb/yDnkwEp5MC5EEJo8PUAzudVcjhdaQpady5U
	zrFjO0RlHH2Dxtx7+Ckc/OUkSu8UJd/reC44kw+3BT9O0c4C7/D6hEXjcL0TQdupKiHY0TA3+p6
	TFnnPOCvD98cD2xl/ECkqryBIc3zXzhKcBrTbbK7AOM6Ugi0cn6ip0NQGsbRv2aDESHoj96JG6b
	B8=
X-Received: by 2002:a17:907:6088:b0:c26:19de:9ae8 with SMTP id a640c23a62f3a-c29b8734e64mr227554866b.39.1789401619322;
        Mon, 14 Sep 2026 09:00:19 -0700 (PDT)
Received: from draszik.lan ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966021d0dsm467443566b.10.2026.09.14.09.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 09:00:17 -0700 (PDT)
Message-ID: <6d3fd2d27eb54a926486da34947e843c0f29253c.camel@linaro.org>
Subject: Re: [PATCH] phy: samsung: usbdrd: propagate GS101 PIPE3 lock
 failures
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, Vinod Koul <vkoul@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Krzysztof Kozlowski
 <krzk@kernel.org>, Alim Akhtar	 <alim.akhtar@samsung.com>, Pritam Manohar
 Sutar <pritam.sutar@samsung.com>,  Sam Protsenko
 <semen.protsenko@linaro.org>, Johan Hovold <johan@kernel.org>, Peter
 Griffin	 <peter.griffin@linaro.org>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 14 Sep 2026 17:01:36 +0100
In-Reply-To: <20260623135349.42739-1-pengpeng@iscas.ac.cn>
References: <20260623135349.42739-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-06-23 at 21:53 +0800, Pengpeng Hou wrote:
> The GS101 PIPE3 initialization checks the PMA PLL lock and then checks
> the CDR lock. The PLL helper returns an error, but the GS101 PIPE3 init
> path dropped that result. The CDR helper only logged a timeout. PHY
> initialization could therefore still return success after either the PLL
> or the selected receive lane had not locked.
>=20
> Make the in-file SoC-specific phy_init hook return an int so helpers
> with real failure results can propagate them through the existing PHY
> init paths. Keep the register-only helpers returning success and use the
> new return path to report the GS101 CDR wait failure. Other SoC helper
> paths keep their previous success behavior.
>=20
> Fixes: 32267c29bc7d ("phy: exynos5-usbdrd: support Exynos USBDRD 3.1 comb=
o phy (HS & SS)")
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
> =C2=A0drivers/phy/samsung/phy-exynos5-usbdrd.c | 78 ++++++++++++++++-----=
--
> =C2=A01 file changed, 55 insertions(+), 23 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
