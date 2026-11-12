Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794513115;
	b=pURXIRY7ZumE7qFXyTDnrEKDB2SpFiQSV2dlRLokt0iyEbnPySMi741kK+98DRdyZFD8
	 C36NkKaTVl9Zhz/wWMGUqkj5lujY5rnL2BpqtrugFGEtcgombpN0t2vQufRyYeS4smwgH
	 5H/Ey9dhzg98kOct+4Z9Ts5+0FzeYeanMkpAAFt92hzt6wwT44NLmlk5XRnaTYIgoQjGc
	 qHXzRkmcZaC2wky1fatA7bu1yL96kDsoTyeAE+299gN9VoY17Dtpr+B35KAs9RZMzo23v
	 AwOcANf5cZls2Zb8zcAd70wl+o5wn39bedREzjX/Mczrq3urCle7axETv4yIBZHwJTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794513115;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=3MfZj507MMC+kYJd+NbJOCDQqm4lY2g+JzGBMiwexkc=;
	b=WSE74efJxPF+h5PBmp5+UWGtMC5OZsAenG+75ikHtvAzQEOKLQGfUel6QufCK9XKvHWq
	 DxHSeo/8kJjvQx0cqzv+b5rCxsZp7fmMU6DIEkWpD9sNsKvT+noFVMVSU3HWKVmwStywo
	 +s8GH45IL6/fQOtlpVLESgswfZyfzb1FZNfswxj7Ajbiv/Il9ZfQIqG4Q4ad9UcHj/QEw
	 unTqpaT5n0ZCp/vUL3hfEzmhwNBoJh7cCLLUTN8emiX9HU6NKXg0wYI62FShnSB60MmUS
	 Rxaw9VR3ZM+COPzb3Ju9Hn8QGogcF1Y4FA/jlUH2ClqAX6Nx4vcwSOfBkSUJaooJYJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=s5MNDvrn;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5A6606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:51:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E5A6606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=s5MNDvrn
Received: from eig-obgw-6002b.ext.cloudfilter.net ([10.0.30.203])
	by cmsmtp with ESMTPS
	id RZ5fxodFfJFmFRaptxg95Q; Thu, 12 Nov 2026 19:51:53 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id Rapsx9SW78cn4RaptxpiD1; Thu, 12 Nov 2026 19:51:53 +0000
X-Authority-Analysis: v=2.4 cv=Qrde3Uyd c=1 sm=1 tr=0 ts=6af618d9
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=sozttTNsAAAA:8
 a=3OfnbWqpRXkE7MXKp-4A:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3MfZj507MMC+kYJd+NbJOCDQqm4lY2g+JzGBMiwexkc=; b=s5MNDvrnZfVFU0eoxUz96jY+9a
	+sDLh5t+2OLuO1qHSYRp2Jh4PNJKff6xWIZhhNjeusu0CRlYpEA9ufKafpUVV+QPe6l2RsTgKIRDa
	yg6RkQhTjGZ6bMjviG5PgyrhE06NsJ0ke4vcmVuwokGV+1eOMO2hVm65uRUmwSWF60aIWoe0i0xg8
	CxKjsz7L/16Rv4YHNSTiR0KHmLrPvpMtviVVscfNIQWTPCaOeZ7d4a21o+WrAcgSv2x1VtPS5UVh3
	PunOrtLlhd5peVwknvVP5gkx/IDZd+/otI8wEaR7aWbFlAJNnyU6uWrsDqnqL+eQbjZSaxgvBoX0W
	zKJ2Q+iw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:48542 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xRaps-000000016KU-2p9m;
	Fri, 13 Nov 2026 01:21:52 +0530
Date: Thu, 12 Nov 2026 11:51:51 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Andrew Davis <afd@ti.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (emc1403) Fix table name to match driver
Message-ID: <d93134c3-2635-4ee3-a13b-34b005dfc2e2@roeck-us.net>
References: <20261111181154.445315-1-afd@ti.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111181154.445315-1-afd@ti.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xRaps-000000016KU-2p9m
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:48542
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 32
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfILKeWpZ6VF4R47tWGctsEOXKoYjNRr6hLWIyAvk38eblX4gy6aPqiuXN5itcAIvHs6UXmQN6cHb5x5Bqv3MO+65Y+NpLnXgLrw+BCgwheoirxoTIk1M
 HyfpoxMd+cy8wd2aBTDp+D64WQ+YBb8dk1uUfPACbTQdXsb2PdMHxYQBgmsgKSZg+CFrl/NHEBUvnCo0bDsR6h/5egJXBxlG/puai77035ff0DaJTQMaTSN0

On Wed, Nov 11, 2026 at 12:11:54PM -0600, Andrew Davis wrote:
> The temperature conversion time table is called "ina3221" but this
> driver is "emc1403", this looks to be a copy/paste error. Rename
> the table to match the driver.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>

Applied.

Thanks,
Guenter
