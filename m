Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE462E229F
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 07:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789803914; cv=none; b=bA0KLft/0ty9LXMD863QwQE+vHua/SCAhqKV2QZCyDuYm6kFRtvrXEJvdZ5Y5xkVT6uZtZgwAmo2w5pRN2OXCG7jC1TOygBcFAaEms2FPOPQcGDnBP8zJQVLyZI7HR0U5gEqn3x0TBFM2jCL053fFNkcF6NCMU3vArKW+Ss+Qjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789803914; c=relaxed/simple;
	bh=Q+zCiKser7bCWIbP78SoG0/m+GiWQMGnDLfmB3/UOP8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dNIMMpL6mCPCroGeA7q4JUKdSUDvhNWuGKjyL8jwlzrfQYePOJTdLGuoehluTlKM6vWTJcLKznxEBFUhaUzpjQTW7Zj2qq9tUwSKkHpi3Vs1h53u46fiuJiYMMlizIoBWDSuYIdEdmfxNwW4g+7K1SFsnZEg0zmhGyPCsz4R9Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g+Hgmmm0; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g+Hgmmm0"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-398a1676000so1293433a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 00:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789803913; x=1790408713; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nzhIw8jPRNxoB8iVaoAn3LrVYY24GoK7KU38cNUcsNA=;
        b=g+Hgmmm00OCJCpR1hbzuOF0V/LzxwntqZ8J1xelH5x+pVUelEzy3bRGE0Z53mrfaWV
         TRef0vk5kGl1KMYh4vZbNEh+gTYq06/SW6S8qR3eVh8R48h7L2OUWujjXkKFo7Anljj1
         KJkCxVH8EE1fjByZpCRrn+tPjcZ277FL1wpTV+PDUN4SvTu6I91oi8SVUihcV7vnu+TM
         hOo2yjnT7+gMRPhcvNYtAISy48zpx7VjxhRKS4UvPWyHYPKLW1nAFasbRyT/Ilre+XYG
         bhd2KOtlJIxvevjSuXnaDscVbHKFZp78GqNSGmPPirbVkZqJeyh5cqz23j2VgStwygVP
         IDkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789803913; x=1790408713;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nzhIw8jPRNxoB8iVaoAn3LrVYY24GoK7KU38cNUcsNA=;
        b=DX5lCQ8dgFyDpoaE0nQI7HakjEcrysgi2H7ErO78lJPgDt/LjWCfOvD4BexrpC8llp
         4DQt7cdYf0ZzJ0X4WPUn+eQzBWU4XNI31iCm0//I3ZmIEjg8ZfKxJF5m2y2ZTTvNsBKP
         4D9AQ2MNVX99tHyVEfdZCY4DQBxcR0eqh3HJ3ZOjvYQA7CWuFvaWqiQnNigfpc3ESI/K
         VfUNjfWWOdX7l7gqXKdBK8qg9tOgDRzWJJfSs26NjtV2vYmgOK2hY7PwLhGT1QwjNj/y
         fdAyghWxOMIDkg7ZfSs/1Y5MNaEuXpB+F66WbtzwaCha6MYM8tWUjzi57KqAefG1FF1Q
         xEPA==
X-Forwarded-Encrypted: i=1; AKwUvBwv+iAhHelEt+I5x8wGx9zZpVrEAh6EIQSTIIyNUSAtQ78Yc/63N8JFhtLa7fX2QQkQZ5R1C735jbT05d8=@vger.kernel.org
X-Gm-Message-State: AFuF++lmisqVOuockg9iNQ01MSMP4Pgh6DirxwtudkZ7DJJApS41ReOX
	3iYC5ird3WivvMrOfDm2pI1swxlSPHi8QMaoHqfJLL01wYj40e7E/4hb
X-Gm-Gg: AYBFou32ch3aT5qFgUisEhAOOfY1OTnxfZuL8OYITXUq0jhaOwI12KrM0nAOeGo4wjP
	dVnAXjbihyOandPnrAhBz80diW+urr5yUArxgXvXPP8gNBSsqjUWCyteHtE92YPV5WFDk11PXM4
	Ssul6kbxNng2y8y/nKFPHLtWGYNxkuf6DH5WJ4jSFbDEks1u/8KhMSZne3gprr8/vRjBlnUwqbh
	dehZPWEvYe77UM0MTODZNCKcjWY5DisJusI2mCb+NvyTmYM9ks4kfVJuxKNKLLxLlx65ZdmzhY9
	8oGds/nG0ce7v8qCNU2ev01Buz4IUgsx2rhKzi1I2nLqVGjMhJToB1EzF8t45UGO+lZ/QzfgoqC
	6RVC5fs+aVbFGsSCb+HsPUo9up58bzDiuYnDmk1jC+0uiHPLsV277/aWKS5QdKusfkeipy63lsT
	SGEB/fuXaZPAiqImn2Libzv0eC314gKfPaVdyKShOPOFvn8Tnv+pnYmvvQNgk/Kd2dahnV45ff9
	A==
X-Received: by 2002:a17:90a:c88d:b0:39e:4c80:f67f with SMTP id 98e67ed59e1d1-39e54f3aa58mr9006171a91.30.1789803912686;
        Sat, 19 Sep 2026 00:45:12 -0700 (PDT)
Received: from [192.168.101.188] ([207.90.239.231])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55f299fsm6860122c88.15.2026.09.19.00.45.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 00:45:12 -0700 (PDT)
Message-ID: <aeb5b8a8-e01e-404f-9788-b4770ecdd9ef@gmail.com>
Date: Sat, 19 Sep 2026 15:44:54 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] arm64: dts: allwinner: a523: add DWC3 USB3.0 node
To: Per Larsson <per@palvencia.se>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara
 <andre.przywara@arm.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-sunxi@lists.linux.dev
References: <20250816084700.569524-1-iuncuim@gmail.com>
 <20250816084700.569524-7-iuncuim@gmail.com> <20260915013336.68ee3611@rpi>
Content-Language: en-US
From: Mikhail Kalashnikov <iuncuim@gmail.com>
In-Reply-To: <20260915013336.68ee3611@rpi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/15/26 07:33, Per Larsson wrote:
> On Sat, 16 Aug 2025 16:46:59 +0800
> iuncuim <iuncuim@gmail.com> wrote:
> 
>> +			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
> 
> (Sorry for the more-or-less necroposting)
> 
> This is the only mention of irq or interrupt in the entire series,
> which at first led me to believe there was something missing given that
> there's a "Nobody cared" message appearing when the port first detects
> something connected to it followed by something about the irq
> being disabled.
> 
> Now I read in the text of another patch (adding a TrimUi dts) that this
> message comes when an interrupt storm is detected, and given that the
> value in /proc/interrupts goes from zero to 100K in no time, that seems
> likely to be the case here as well.
> 
Yes.> What is this interrupt supposed to be about, and can it be handled
> better?
This inerrupt should be disabled in host mode, I'll do it in v2.
But except this message it doesn't affect functionality.
