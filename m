Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705032;
	b=FMoFu96PkdP5whcARoUv5WEMQarnc79r2XncyBfTo2UgZkOh+1fL9GZcaXVRvGZvkaXn
	 rbd9UZJ//Q0p/7TJblKPIy72m1s1PyODZtkBk3WgnWF4/OwMY+9rLibza6xj6CZqnY58l
	 Bzhm5c8aX8tj67fwsCAOhcYZy12kreSUEPbl7Pgm2JltuQx6iAWC8sOkuK/JyFJrWnee8
	 wGEZkkB2ap0ajX7hvDaP6M/iHnx1/npOJTS9rv6WTRte7nIVePDzqqcuAFeB3gcgTqOur
	 43Jy73I6FzX3Owz1zmbpOV8tjG6dn1ut17SVlmtlCyw9COyGA6HaBhAj8W+6HWfBJ8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705032;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=O0ydARdHpR5wmfKN3T0hTmGNcktwao6e7xy0q9wcayc=;
	b=iGKKwzt+SLQQGyezFnaznPKbfVS/nHoqRLr7KhPRNZ8mjIJZjZwRLUcfAtkuk515XUH7
	 yrGjGWPo9jhJSuaY367vYAXyWci2u8vWWGe+bn4+iyFFeOipKQn8vjA+XFIUN9pwSxDQa
	 QTK1w3CZJNP2/NjVcnhf6xLYLyHIQuoBrpJN8vqOj0s3yvaYqXKWHsumR/JkmTSRzQ2Oe
	 rFIr6hP+2igxvCJElsNcDUhzkx+Rdr+9//5VCKuyeZS65DVlpu2cVbasi1B58WasMmZik
	 IFMZCmsbALLq8L0nG2gr9ciaJKVPkYJaRFMsmdVUToF0dHFDucdIJyTht5kwYUaUXNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hnXOwQSv;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=MgB2phEo;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33072606D838
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:23:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33072606D838
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hnXOwQSv;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=MgB2phEo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793705030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O0ydARdHpR5wmfKN3T0hTmGNcktwao6e7xy0q9wcayc=;
	b=hnXOwQSvpTzlV+fVFxTqb/b1MyG3V1waxmxHdd5uG0YNs/zOj2VfZ/a2rp90WMU0b+suQM
	mzMIZdwM6/vHtClifgvi57NMDMRkwrZNlHPgPhuJdkcdpwBU8dx1SPlKsuBjr9Zu3COE7Q
	HDpAwe3Zg6JkTqexRoKs4Cu+kHjCqxA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-192-e7ApA81DO7m_tYoLRhqm4w-1; Tue, 03 Nov 2026 06:23:48 -0500
X-MC-Unique: e7ApA81DO7m_tYoLRhqm4w-1
X-Mimecast-MFC-AGG-ID: e7ApA81DO7m_tYoLRhqm4w_1793705027
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48af5a07314so2617393f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 03:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793705027; x=1794309827; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O0ydARdHpR5wmfKN3T0hTmGNcktwao6e7xy0q9wcayc=;
        b=MgB2phEokuXFg7w39ty1l9ZFsZTBAX8R+dWoG5gvy617XkU0uZHoqTBopqqt3lRTLq
         blzokt4rnI0jci/wON4rBAyz3ymSjDPuYYvvgpRB+Z6f3HwFauHAnvmtOxYHvnbXYfLf
         63WfSnjAjH7yfLGVEf+/wmywvob7lgH30PjRClaVPkZaB46WIwT3CspJunPJI+Ie4ngg
         K6R66kMp5AVblJATine/TOyg2tYrJJJ3m+CbKfdD21IM/V5rrYjJxFryidZmjMqHNLx9
         MZDTr9SF/hTW/t0eqEh5AA5KtmrVZ6dhEqr6dORytMqwjf1mVHryp3dvKiE/IpaNz3Ac
         aIuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793705027; x=1794309827;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O0ydARdHpR5wmfKN3T0hTmGNcktwao6e7xy0q9wcayc=;
        b=V1y0sGSX/NqKO0kZZo/Bl5W2q0nKZJff7MaUFZRHNUXAIDfJXBJZvNH7/WJh8feZUO
         c9LICaYU+hYVzxAJAQ4mpF6gGRVPlfEtLUplBJQXYUvqyieiXo7oM8wNtpBMz7usBzNg
         2vwqSWZYOstfpi+KLME9Wjp4dHHGIAWCuY4B9A8hYwphJ70CdltSlfkxtqE91rQhgpO8
         fLKSIBgsKAYO7wJ9yV3CXEPMnMT6WA941Biget3fB/0C+tglcsqSglwZTHf/Dx3THZsI
         XtNS87qERVrdL6Z3pFBFRr92/pK0uMbGP8/cWiMYQlAmmv3Djzw7vxeNj1+nCL1qboh/
         2zFA==
X-Forwarded-Encrypted: i=1; AKwUvBzUuw06/f8n765ETLGbZM8NVfdbpCO96gUTJ6vP4NhoUpvQPib2RX55sbo1fRwxBnt7DE7U6LHLOEhrInw=@vger.kernel.org
X-Gm-Message-State: APuU4Z944mNTuxEqv1FFPeG/9y74PuZ2RLcKxDu9cQUJec9t8kV57txf
	ZXx8ecaI/4jO76SvfA4cK0jQ4TZMuyDXC6A9sV0ExPCCOAyddiRbUdT1QtZQLqVWSYyJUZjhmpv
	F5x3+5Cer45qO7KlpJQIcc5NOg2jWAFtiH5FYp+0+JIfzBRrfWE7FgdMNuRin32+nJA==
X-Gm-Gg: AYBFou1z2U0jhRWEWuGVyFfES5ShvrAqiqgAeNU0b8U/YWKitHSvzjNq2zbrDhilxjd
	O6OQwZxfTYKf1FAST2rpVdTjjmEtBee3Uy1RDxsqV4ayVmH3ExQuElMzl59BXe+LTibxojSxzEF
	NBAVj+wme+IdcxZuB7zV/1X4JqRlp/YvVeTHNDR7spv8cZHQY1OGnLqCmb3CyxPcN20oX7QaJ/9
	Egxp214jljgvu6i0qOH/2dL5Zixdpldjg8ugGOGiQ0SpU46HXufPSVCECNjeU2YAHq0sJjCPP57
	Z7oLlNBWaF7DReclCg0jBe/PCYihDGkhCfBFrUqfz9QXFcXn5Cw1kojgberwu0aj5b9s5kDrxzF
	SZywc6L7UJHUwaae6WA9LmTi2+8Zvs/77Az+sJMdxoj4RGA6rrRbZ27+HJt1PD5rNMwD+rjPsv1
	thlTUhTFMX09BRwMbXu0f9nGyY9zYicXpSBHpPYNRatmU=
X-Received: by 2002:a05:6000:1aca:b0:48e:932:aefa with SMTP id ffacd0b85a97d-48e6e2f66b5mr28935387f8f.26.1793705027403;
        Tue, 03 Nov 2026 03:23:47 -0800 (PST)
X-Received: by 2002:a05:6000:1aca:b0:48e:932:aefa with SMTP id ffacd0b85a97d-48e6e2f66b5mr28935346f8f.26.1793705026929;
        Tue, 03 Nov 2026 03:23:46 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78c10sm24129554f8f.25.2026.11.03.03.23.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 03:23:46 -0800 (PST)
Message-ID: <dd92fa56-7c57-4a6e-9598-20d4363d0a66@redhat.com>
Date: Tue, 3 Nov 2026 12:23:45 +0100
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
Subject: Re: [PATCH] net: ethernet: ti: cpts: drop the refclk mux node
 reference
To: Wentao Liang <vulab@iscas.ac.cn>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20261103102858.1340800-1-vulab@iscas.ac.cn>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261103102858.1340800-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/3/26 11:28, Wentao Liang wrote:
> cpts_of_mux_clk_setup() obtains refclk_np with of_get_child_by_name()
> and only drops that reference on the error path.  of_clk_add_hw_provider()
> takes its own reference through of_node_get(), which
> of_clk_del_provider() releases later, so the reference taken by
> of_get_child_by_name() is leaked when the mux clock is registered
> successfully.
> 
> Drop the caller's reference once the provider has been registered and
> its devm cleanup action is in place.
> 
> Fixes: a3047a81ba13 ("net: ethernet: ti: cpts: add support for ext rftclk selection")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
Please have a look at:

https://elixir.bootlin.com/linux/v7.3/source/Documentation/process/maintainer-netdev.rst#L386

also please note that such limit refers to related patches within the same
series. It's highly discouraged to have more than an handful of unrelated
patches in-flight.

TL;DT: please stops sending new patches. Likely a very limited number of the
one you already submitted will be processed; you will have to wait a significant
amount of time for any new contribution.

It's not the first time you have been asked to comply with sanity limits.
Please respect them, I really would not like to be forced to blacklist @iscas.ac.cn.

Paolo

