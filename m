Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793718001;
	b=hMEMvVorkMdkUhJGfecQAF0mgTCXNW3TQAI4u/g1n6OtKkmXW2iwIPCCXpYR28cDMBQe
	 WFAXu8U9MuZz3Yqjz8VitQcXbd7m6NzxjDv6EElsXYV+pAAIVV2NYM99mO+GpVobOh8le
	 DvcJEHx00/s9W4GszhwlAVO8MdRda1rSJuSYVpRGmBtJaoqbcWrOi5Ef0n36xO3fANguJ
	 KVeJgK4wPbGKjFKsEYQMXP5zX12n9gDK9YbsP2XitrgHeHBLh0TuS3UJ/OliUC+JobmQY
	 CGzTRo20H9x6j6HiWJXdR8tSo2AVk3UtUKVARmfpyi+2lO2Mq246i9YAKr71EnT8kXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718001;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=7N01ts74+fbd6A0+ugAJGY01iwryjK/kLUoNysOMm1c=;
	b=IAoV/6BR2ObJwvrFvPcTeVx+CLGOgNhCVbXuVDDLpIoHcubevL9c0W9u18BBtyZn/CLi
	 HfiDQmr7aOGvD7BYCd/x92/xeYJzMc20W3tKwi3ljfMnXxs8d5vrxEfhC0TIUVkVKxp9p
	 pebc72OeQvJs7dFlz9kTUi/3ksfnKo6YNMHahJuMjFUB9vvkhrvaOvtAkrEiwZfWVbbpu
	 LO3vZ7NdDw7xe1funvPFddjpWrlmQyte6cpgBY16I8OSBp1Ph0mSh3AG+s6gi8C1zYGan
	 H+K03IfU/PcGwKa5v4PTyqbnxnZD8rzgCV96WCVFcvyW88nTDPwLLah8bN6uKF20AkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="d/aEna/I";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=PWDJkkMt;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A416071A27
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:00:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19A416071A27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d/aEna/I;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=PWDJkkMt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793718000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7N01ts74+fbd6A0+ugAJGY01iwryjK/kLUoNysOMm1c=;
	b=d/aEna/IqhxuAdRkL56DUGLT33MVPskmrVBKBPcZHPcKk43bZeB7SeuomSGeqEqmDGLief
	OKAECoTFmR1qi6iz1XThuvxJftxsUcO7BBw+QRkwxnzKe1CQOInw43o9thPuLjhfoT7Yl9
	ylBFNG+l+979ZIOzzgBnaFlWd+RRo2k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-WIQvTVP1M22im9wLm4Nv5Q-1; Tue, 03 Nov 2026 09:59:59 -0500
X-MC-Unique: WIQvTVP1M22im9wLm4Nv5Q-1
X-Mimecast-MFC-AGG-ID: WIQvTVP1M22im9wLm4Nv5Q_1793717998
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a20fd059ddso30359575e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793717998; x=1794322798; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7N01ts74+fbd6A0+ugAJGY01iwryjK/kLUoNysOMm1c=;
        b=PWDJkkMtxemvi+ivkzSkQGf7tp1NGY5FPMZQ3h5D4QAeR5HVc1TxH4A13f/88X/8Nq
         u/rcgcDPTvp9F7XYtBggbcKas+WYcmhYJ9vIcKcBhu0+4cStVSzk5somnTLRmj3CYJn1
         jTbutNI5x6qezyxudHrPxLkoAlr2I1DVjAPw8TQxAH5EEasRJ9uv0B7WGskfGxb4viNA
         +ZOIJO0Fi6ZWEcWtRC16fsYybcTJdrxtFSwN57UIp7CLllRgLzWOr43lexlkAbNGq6pY
         ZogMoEJaKAPF0JmwZEURFAawj4BpSf/UH3zbVMKQFs+QrDbS4KjO3ZqcLuXAPPtNk1Kz
         4l3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793717998; x=1794322798;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7N01ts74+fbd6A0+ugAJGY01iwryjK/kLUoNysOMm1c=;
        b=Dz/X5/cO6Ow1uOqetM/5X13MsV0TiM2bgCA9vU0GkUtyKTxcFwdMVv1BjA0sn3KLJ+
         WzjNp1Zs05doU6umoy0Peg0y2X/024meJfo0SJLcGRJVrgFBeHLFpplpY5Se/QwdStJr
         aT5Memc2hcmqZtf4jlyydctMwRi7wBhQ7bagmnty/cKgYSZQI8RdxU4EVq+p+V3FoYE+
         3/mUnXuzs1Zm5TwL8iMapX7WctaeZNqG7sjPOdnWzva21LNTnYy5IGNf6U7IfSe7fnZi
         hZo/4IWdjkFjKQxTGGPUV6WuqXBmsY3V2AiA2cLYPgjCXsdm2FErX1NSZzjxnlPDFvlS
         aZkg==
X-Forwarded-Encrypted: i=1; AKwUvBysXsfo7jGECAnXglvDLew/GNF7XFnD3qQNuxoev+9hRn3Zmhh+L/Rs+DSJp7DX8n5Hv+nP3Ck6mVK1Crg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+C+Htnlm6j/mdkvQUSJO1rbE4CdInVzL9zf+TZewbpt5wHaQ/
	aZRRLH7QPJ+6fG/DY0/WcOtoStm1kDoTR1tvQodxtUZzt+Y4sE6bbNQb9ShgPyXWRga1muESQSb
	AOs6uxO7hmv+ghs2OksJvLhJwI3nmMlROORUZsCVBBHppCOeiy8+bb5mE3KLdDfE8jg==
X-Gm-Gg: AYBFou1cM6DLTiZ9X1j22y771tprM5qD1kN55+UQCd4vPHxQqo9C6UFUWGejsV/upJz
	bz+/I1WMftkkOXqBlrRd6GxREuhgpj64iU1Ue5ZWr89NHaYJddKiT2CUAfB85uX2fndIs/tszLV
	HIIVi///CRNNsBzadZygzSMxbkMDyKAWEcdA8kDKdbR8Rd+CQqfQQGuASojZg5ftB8inK7h8HNd
	oNz2kz56BnziRnH2ERLagUmsAiN/xqoHe63hPLyEyuL1QGr2FF6exQ6z/Kpcn5Pedl4ihTD5dnQ
	vrgXDVzI8+GqBBAzjEuPdf/UY4rnuJmMn3e5fdGsEZzWdj+8e0hAOh2ipsNwYDGsZzrVGLIyV49
	xISmMKx23S8I8jxH0hh6AU6BdMuyhkaMoZYEoFq+DmKhSmqDkEYC+FjozrMxIlc/ko6hoFFUOdZ
	WWxwwvYEhq8C5KrEAzkj/i0Z+iG9OXbid6UBEEyWJIALk=
X-Received: by 2002:a05:600c:a4c:b0:4a2:967:dfb8 with SMTP id 5b1f17b1804b1-4ac1765d7d7mr307789015e9.20.1793717997509;
        Tue, 03 Nov 2026 06:59:57 -0800 (PST)
X-Received: by 2002:a05:600c:a4c:b0:4a2:967:dfb8 with SMTP id 5b1f17b1804b1-4ac1765d7d7mr307787935e9.20.1793717996940;
        Tue, 03 Nov 2026 06:59:56 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abeb77af8csm464079285e9.1.2026.11.03.06.59.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 06:59:56 -0800 (PST)
Message-ID: <ff77c7ef-4c3b-4113-966d-3c46d5776cdf@redhat.com>
Date: Tue, 3 Nov 2026 15:59:54 +0100
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
Subject: Re: [PATCH v4 0/7] net: dsa: mt7530: support EcoNet EN751221
To: Caleb James DeLisle <cjd@cjdns.fr>, netdev@vger.kernel.org
Cc: andrew@lunn.ch, olteanv@gmail.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, chester.a.unal@arinc9.com,
 daniel@makrotopia.org, linux@armlinux.org.uk, arinc.unal@arinc9.com,
 Landen.Chao@mediatek.com, dqfext@gmail.com, sean.wang@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 naseefkm@gmail.com, b.larsson@gmx.com
References: <20261029184202.1859843-1-cjd@cjdns.fr>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261029184202.1859843-1-cjd@cjdns.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/29/26 19:41, Caleb James DeLisle wrote:
> The EcoNet EN751221 has a unique switch configuration. Every chip made
> with an EN751221 die has at least one on-die MT7530 that is MMIO based.
> This switch has 3x 10/100 ports and 1x gigabit port.
> 
> Some popular chip packages such as the EN7513G and EN7526G have another
> MT7530 implemented as a multi-chip-module that connects to port 5 of
> the on-die switch and is controlled via the MDIO controller integrated
> in the on-die MT7530.
> 
> In this configurations, the upstream switch is put into a "passthrough"
> mode in which all traffic is forwarded between port 5 and port 6
> without altering its DSA tags.
> 
> Furthermore, since the DSA core does not call mt753x_setup until all
> switches are present, and the downstream switch only becomes available
> when the upstream switch has configured its MDIO controller, the MDIO
> controller setup on MMIO implementations must be done before
> mt753x_setup, or else it will never complete.
> 
> Finally, the on-die switch and the MCM switch connect via a TRGMII link
> which requires calibration. In order to calibrate this, PLL adjustment
> must be possible on the on-die switch, necessitating changes to the
> core_(set|clear|write|rmw) functions to support MMIO implementations.
> 
> Solve all of these issues, add the TRGMII calibration, and add support
> for both switches.
> 
> Since this patchset will probably be subject to some discussion, please
> consider accepting any patches that are non-controversial since it will
> make future re-submissions easier.
Does not apply cleanly, please resubmit. While at it, please add the 'net-next'
subj prefix.

/P

