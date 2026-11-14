Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794672613;
	b=O+t4SON8UuVkQfw6Dxlg34TbbwWrdDWLYGKh/vpq6W4zsPPbFqupqnNUi9lJu8tG49S7
	 mCVAgEycP5Z/w9/8d7Ulbwb16hJHKf2cvPIRVGTaxnx46/XZrfddYH+8ZI50dMkX+ap3D
	 TZIu0A43/1w+ePCpifyTJumn96ZQRlybAflcwl85tmsr+vPsYdHwnADL67jBY6/GhdsHc
	 9rE0dYGyWH9edf1Y189/NJgF0DJhbKPJJBNiHdzYOg9QGnnOnfysVxYMe6lOwkuvGLD6e
	 pewcntMGphmuzTN2EUWRi3UNLRmoephVMNUpfP2xU823Ogh2AaXf0wwsw8aes0/MTGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672613;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=2P2RSt5aEQnMcSYCvjp2sTWPTZ5yq37TCaTxuS5sx3A=;
	b=zIFuGytQ6daJvJ7ggKeOLGk9evTlTsjSvmLUVTT2psLulTAkXyZJ724FwLgWrXwPSwgM
	 U2mgnFVT1TRWIoD1gUCEWgUYFHQTcsreiAuUmBn/WsLKclYz46NbGDFO9APZsXdely6ev
	 SH+CsDLuwfed6WezktR50Sh8u4xl3+DTxQ2mHeJdfgKeHfl7HW6ZtZRYrfxDHCM8GKuA0
	 twoMK2+gvrf3H+kucBaEtxvL+tivtAs5evkEldDuhpx5cnw1nOeyPjN5h0EQ+tUIrKtnZ
	 vyAVKJQ0Bxc/n+9TIrj6vV4sjEdoDnwBBeId06pRas0vcuohnP+GDPg0wMGTJpMo5Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b="2O/WJukj";
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F809606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:10:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F809606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=2O/WJukj
Received: from eig-obgw-5001b.ext.cloudfilter.net ([10.0.29.181])
	by cmsmtp with ESMTPS
	id SEIUxfN7byb4YSGKSxgA4Y; Sat, 14 Nov 2026 16:10:12 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id SGKSxuN2yxmi7SGKSx8C0Q; Sat, 14 Nov 2026 16:10:12 +0000
X-Authority-Analysis: v=2.4 cv=KuFN2XWN c=1 sm=1 tr=0 ts=6af887e4
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8
 a=_4BeZiaCrzwRpDjRDyoA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2P2RSt5aEQnMcSYCvjp2sTWPTZ5yq37TCaTxuS5sx3A=; b=2O/WJukjiEmu4i/bKjHWfSBkxr
	p3Uf75SGsUPoF8VS7kIrXzUZlLSPaX2TsosXe4l2R8KLW/ZblDmUhDX3vQMRQ3G0uRtU0mJWxHDYS
	bBcrorrO0n6x6rbA3OHZLkyjdmuX7owZWUrR5kkkHQgHQqA4Fak6mIbeDR3XwQTTZi2el2EoO9LFW
	YiDym9iVwFZ6qEHDmSD2WbiZ/f6/XvEmBEmJ8FezqTyeSaKmUvjrUI0cxFB5J52qvFELAYAzOs5qd
	Ak5PuNyRia1wRZ1Dj8xWiH1Zhxga82Ua6o9Jm9arcvXzUqyw5dEAE5yj+mpqogdugyD/9v5h2Il1a
	RZNDCQBw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:45186 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xSGKR-000000005Ea-3s1i;
	Sat, 14 Nov 2026 21:40:12 +0530
Date: Sat, 14 Nov 2026 08:10:11 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Johan Dahlin <jdahlin@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alwyn Kik <alwyn@kik.pw>, Fabio Baltieri <fabio.baltieri@gmail.com>,
	Hamza Mahfooz <someguy@effective-light.com>
Subject: Re: [PATCH v2 2/7] hwmon: (nct6683) Restore automatic fan control on
 driver removal
Message-ID: <2a4c9b26-4ad2-4d31-bdef-8d2ef576f764@roeck-us.net>
References: <20261111082838.1418051-1-jdahlin@gmail.com>
 <20261111082838.1418051-3-jdahlin@gmail.com>
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
In-Reply-To: <20261111082838.1418051-3-jdahlin@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xSGKR-000000005Ea-3s1i
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:45186
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 32
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfNSdu9Lc5E+x57kbSX2t1XRDQeqCZMcBLJg5tCON6vNKvqgDcL7ckxOdO8za8WXIt26xrHItShtQ5Kv2teboJUiBNwweyTELKdi6naKJ9iPxcTjdFIlz
 ciHN679GclmzKwUY+Avszn4Ruj+/jf2c2BLpg/8WFPkQP52d+SS8DDiuSzPkfGYC3maPsnhiG/SvdF3FCGQpFMb/dwDlN00iEnhTxvqoKW24JQH6tzLsx1OS

On Wed, Nov 11, 2026 at 09:28:33AM +0100, Johan Dahlin wrote:
> A fan switched to manual mode through pwmN_enable keeps its last duty
> cycle after the driver is unloaded, with nothing left to adjust it.
> 
> Return the channels the driver switched to manual mode to automatic mode
> when the device is removed, using the bitmap kept for resume. Other
> channels are not touched.
> 
> Signed-off-by: Johan Dahlin <jdahlin@gmail.com>

Applied.

Thanks,
Geunter
