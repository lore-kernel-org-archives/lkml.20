Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917927;
	b=CKPtavts23Mb+P9WCSSPEtLJIZ8hWN8xatkbiM4QeneqCb5ocOlZcwaEkcAgjjt9UVr6
	 KqFR+NTdM/HJj2QSo7eFFkKYNlNYVcjpo/8esgN2HYndDnJuFyBd7ibP23XRe8Z6eLhE/
	 bEvJPmWQoLp++MsFjvm4zEfNj6BZMl5FFvoaLAHqJpgGXHqDknKl84TXCZW1MLT6STzd8
	 K8kYeGTFqdCiw6d6Nwi0m9ttYdp2Y4TwOrdvui913wfa8pYw8cLNJV8s34NSNXLvmDEoJ
	 WhRuBgub6HofvpbBm8fOV+opFOwAQZnjJvcH+BsXOWfhhmVLZyI3QALbiUz0I6MKVmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917927;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Saf3SetBsCoiktrO+qd7rI13GSO6x+2RpySl+aH8Vbs=;
	b=2cCH+PfXp4oRtne8SnXGOVDd2/QVPtZOLsxpSUemXZlAr7uQaAfl3Z874X4XfJB5Ml4H
	 WxC97mCfQIZKcDOMjZVGafgFUTQHPtUlllIhA0qseQI97BmkEi2ywQt0hRpI5bQRT6a/I
	 vZvq70LrUdLS0AYlwxcJ4MUWZpsKhoUX4ETtwI/lJiC9ye+i1dXI32g9jc/ZLY5hxoFvX
	 74CDqvtNLkf3QQqxNSGJN8U9xKNJ4bbobO8+C980CYY/YEZ/ft/DIaO7PcvHhsPq44Ky4
	 o9LjmxEFNA31M3lQ1ZJKg1Iznx+JZxpdhUcRgTtpFJu0ZsJBcUkdXu8blcoMcXIMk/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HXz3m7Jh;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=IU70th4p;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F09606A339
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:18:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9F09606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HXz3m7Jh;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=IU70th4p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794917925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Saf3SetBsCoiktrO+qd7rI13GSO6x+2RpySl+aH8Vbs=;
	b=HXz3m7Jh/roq1qHArAsSoNXy2GvR4/JofBYDi8vH8e1hI5HNx7nWu6qxQVtJs4iDAz3+OL
	ceg9SxhQTQX8u2cdhA4N96CWMzn7SllmVqlLbS0Jk0zDc1fXXH20Yx5kyKxXyp82CWjUSE
	BgDDXDHUSA1iyNR/mSc/TuNhR4WsvLM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-386-NUxpvPFcNMCFawXbfDKkDA-1; Tue, 17 Nov 2026 07:18:42 -0500
X-MC-Unique: NUxpvPFcNMCFawXbfDKkDA-1
X-Mimecast-MFC-AGG-ID: NUxpvPFcNMCFawXbfDKkDA_1794917921
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-492d47f142cso671052f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794917921; x=1795522721; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Saf3SetBsCoiktrO+qd7rI13GSO6x+2RpySl+aH8Vbs=;
        b=IU70th4p55Ubx0ZuL5bmx32DVMBbG4I6m575HnjpltFOGQ7riySTZfGrVYQQFasNio
         nE7E0tjrjVmYxWi96qoEwSndGiTSiyQBU8qle4Vtg+Z8kOUoUlLWOzondWvNEifqJiFg
         AskPA8PD2kaS3sMb2oJyh0YlKJ5qmnPXSbI5gtJ2uAJD5SFZnjJEqNuofi1VhCzSZ0dO
         etydb0CIiUERTqTzfqdzZGHADW3dnGfaTLlDpXiMkzwsRpSosgn3ZYEzIGpi9F4nDVlR
         aiePleUHDMs2JQuEKMEAoN29j8ZNRaq8vvFKOogbYdKsRfUMZ1eyvsj54auahabLDmpS
         V86w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917921; x=1795522721;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Saf3SetBsCoiktrO+qd7rI13GSO6x+2RpySl+aH8Vbs=;
        b=sUC+G56uC2astwdz9uzkt1bGFdSObCbwIOQosKlwij273tqKK6GeW2m1s3Yubwnr/g
         1IeGJRAiN7Xs4hlkAdt19RIHc1DBrZ12wGmuyjZU1EE4Ed/WIaqBENJVXBu8VtQWaqQ1
         +vZ+KriLOfNABVtUKmYUvXHd1bEWXz/PMgxdV+huYuPvz8uRv26SANEQdfYAT6Jcier6
         Cx/4F2K+xU/KmaCpSFB8oNPa+1BTiJN1IOfbw+fFVmnP3wXHORSsWUrC3cu63kS30wI3
         k3eqfPkhouXA0mZzD+c4ZdPh7W1w8jokzipSpnG6L7JLmFkn6gHdRFQPp9fhg8YZ0vXZ
         PElA==
X-Forwarded-Encrypted: i=1; AL+hErFCfxpRmPGuma3d7zQzRYz6RzO80BbmuppYL0EXPCcwUO/b4nZAOPelWlocsQukfds1KIK0HvGNNRjgMnA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MqJ13w2uPW4y8wmsspGzXJkbrgbmnLGjJVo1jTSc1gmUQnqCx
	orF3OKIrkbd1Ms9x3ExE5I2qBYW2d27Day0WgHT5WZ+3jpI6AvFzBqgT0lKkykgv2628coc9fhw
	VLGpjNXIiTEcN3MaTDTiNbvFoHYHCXBUTuz7GFDT31ZoDeqf4wADgtBy1adJVUDf3vg==
X-Gm-Gg: AZFdTZehPj0ex4xhKMvERZmz0DxPb7J46ei5toCIJF5MW0wQxWZaIdDB0JcrVPFtlqe
	2g+2Pwsl5LHTkLKkV4+4asDE5K7l3EqmtUTrUbWzqPc3mUe5KHjoK31I3iBeNP810bqbVlyYm7J
	8F1u9+Wiy145thUkfrrfNqyFtUdp2OzXilpmniUN8157AUoD3un8y3Jy3PHsGTzo2XgPTHQzSZg
	0V/YusPkU0vJjQa+q7syeo1EA/lOnPNHh50fbIT87Gx0KkQtVqs673bOViw/+iTePBOOMp5VZe2
	IQT9sZX7BdTF5x1HBwL1yVMtTU373f1SZ6Zu1N53VeEAxCq7CstAZjqvgJ4FpMdctml1qcUFUte
	ocYNnUypTKBnqFW95YBf7INFMkeHD3Ys1p4hruBYuEPLHyteuSjfjnbMqKLUnOmbZxn/wiPIHen
	Xi00098HYguAFMNwK88YQuWZ4Jt13OLAJH7FK/cEefIsnw
X-Received: by 2002:a5d:64e6:0:b0:499:527f:ce55 with SMTP id ffacd0b85a97d-4a377c71e8amr6033005f8f.27.1794917921181;
        Tue, 17 Nov 2026 04:18:41 -0800 (PST)
X-Received: by 2002:a5d:64e6:0:b0:499:527f:ce55 with SMTP id ffacd0b85a97d-4a377c71e8amr6032937f8f.27.1794917920728;
        Tue, 17 Nov 2026 04:18:40 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d615sm28246035f8f.56.2026.11.17.04.18.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 04:18:38 -0800 (PST)
Message-ID: <f781b15a-a731-4698-8161-d384af5bb535@redhat.com>
Date: Tue, 17 Nov 2026 13:18:37 +0100
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
Subject: Re: [PATCH net] net: wwan: mhi_wwan_mbim: fix dangling links on
 registration failure
To: Xia Yan <yanxia@cmss.chinamobile.com>, netdev@vger.kernel.org,
 loic.poulain@oss.qualcomm.com, ryazanov.s.a@gmail.com
Cc: johannes@sipsolutions.net, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, yana06070@163.com
References: <20261111113213.280066-1-yanxia@cmss.chinamobile.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261111113213.280066-1-yanxia@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/26 12:32, Xia Yan wrote:
> mhi_mbim_newlink() adds the link to mbim->link_list before calling
> register_netdevice(). If registration fails, the caller frees the
> netdev without removing the link, leaving a dangling list entry that
> RCU readers such as mhi_mbim_rx() can access after free.
> 
> Register the netdev before adding the link to the list so that failed
> registrations do not publish a link.
> 
> Found while reviewing newlink error paths. A UML/KASAN test module
> using driver wrappers and a fake MHI context reproduced the use-after-free
> in the driver's RCU lookup. The fix passed the registration-failure and
> create/delete tests. Both UML builds passed with W=1.
> 
> Fixes: aa730a9905b7 ("net: wwan: Add MHI MBIM network driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xia Yan <yanxia@cmss.chinamobile.com>

This is not 'net' nor stable material.

/P

