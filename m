Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794153741;
	b=OI1amVfCwphd5FvRZYTTsWO+0fvE39/b6Z/F7Aja5mLWKtPuJg20a8NHwexvXbYMIm3f
	 iIkF4jjOA0Ln8eU01CuwMUnmvXYYl00rDelWs3bQ889LZkfi6umS4IWtS8EJgUW/bkUOg
	 TKRbMy8w7iGj85v3iSiqvGRh2RqpCKQ0OSVeOmjbPhmAmXcGy6h7SmARIcBWkQc2PdYgq
	 wGck6yR5DQQByaDP95IlTsfaq7HIGa2Ih1J/MHc/YHB59PB1Eu1ZPrhDV1L0c8iR0JY2H
	 SGy8UWbJQz72kYs8QzZSSpRXOWHBnHHfsrsIJtzuuUaTvwTxTPt2IIodSqOKl1bSxQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794153741;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=ej30WceHDvxYCHBRpxgFnbxKwm/1PhHk2tRvt9APK+k=;
	b=C3SxUfd/IQE41DNX+TlFC0DRjB3pGZI5+wG311DU5BvTvt9WZ4yynx++oCGVu1f4fO6b
	 xTs5vEBq3/hWD8I3PcfG+3wXAuD3E9j9efR4QwDE6XFYwAcb7RIjGqngstU2R5hfTJLDI
	 Q1XdyLxefGbEPybevi+FqrfIyCHx9ckR7ckedzLBf2l+Z5lB0H3I2kut5t2h3q33RmuyU
	 dDdXY/rpJV3hCgCvIr0eTFHQ4Wn0YH0x4TSRZHR4GkKqZW6QrsgQ0KzkRR7I5gFvcl38G
	 9Pnpw5wqVg7zqCub9gVMDv1GofuQZLEySHjAlEyC18K5OsQBabWXSxYBqQKApeTsflw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b="iOvQYmm/";
	arc=none smtp.remote-ip=44.202.169.39
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B826B606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 16:02:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B826B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=iOvQYmm/
Received: from eig-obgw-6007b.ext.cloudfilter.net ([10.0.30.166])
	by cmsmtp with ESMTPS
	id PrGNxznA4OOJnQ5LXxwJlE; Sun, 08 Nov 2026 16:02:20 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id Q5LXx9TYo3nNNQ5LXxMLcc; Sun, 08 Nov 2026 16:02:19 +0000
X-Authority-Analysis: v=2.4 cv=TuLmhCXh c=1 sm=1 tr=0 ts=6af09d0b
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8
 a=_jlGtV7tAAAA:8 a=ubTP0OvWGwm60-eT7C4A:9 a=CjuIK1q_8ugA:10
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ej30WceHDvxYCHBRpxgFnbxKwm/1PhHk2tRvt9APK+k=; b=iOvQYmm/kI38VNWHr/X7dMB1fk
	c0MBgFttyqNqrj4o/wauJR4XgNdw330swRLXIV3rlUIvOCgAdfJGyTNzxDFfDVzrOEpeOnOx6LyJP
	E6PF1MWSO3QYqYpa32LpH9HVTIxkXqOntsMu7SG0nXn+w5IyCr3lNEAe7sOxEMuNKm47xtyMZm2lJ
	dsVjmRHDfWZuFZA440FPdFnTWmrKQ8xR+WTtr+5P/FWX4AbNZWxh/7G1FPRa434XZA54XHiYA6S0p
	/aNFYebxGDs3bDxD38hZ2zQC7GcAIbtiQBdnpzOpia6mCSqFkB5iuZzdG+rWetEvuND5TuwWtQcNP
	7xmBv3tg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:53492 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQ5LW-00000000xnL-3vFA;
	Sun, 08 Nov 2026 21:32:19 +0530
Date: Sun, 8 Nov 2026 08:02:18 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>, linux-hwmon@vger.kernel.org,
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/5] regulator: sy7636a: bind to the I2C device
 directly
Message-ID: <1ad52663-696e-4a6c-8f78-c75e3cd84102@roeck-us.net>
References: <20261108093602.329554-1-pmazzini@gmail.com>
 <20261108093602.329554-4-pmazzini@gmail.com>
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
In-Reply-To: <20261108093602.329554-4-pmazzini@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xQ5LW-00000000xnL-3vFA
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:53492
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 1
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfHH1+AEQiAxCwf1nz5Pk9KQCh+irZnJ26MXc7J6ajqt6VoK4aEUqRHnDz1coiSIVjw3i/4KF6MpME02O2z7EZnXfzyaWK0uLD2Hhp1BIUiKOjFRdCEiE
 2WVu++K28Imr/oumTpsbb3P43287oe4ZiRv+ehqpolYlq0HjSfr7ey9XySuIhB6PRIibYqG0fdquJZP/jTQSIsRLrw9Djdt3zX1bJRlQdQK068bGZ5J+CCRA

On Sun, Nov 08, 2026 at 09:36:00AM +0000, Pablo Mazzini wrote:
> Bind the regulator to the chip directly, as the TPS65185 and FP9931
> drivers do, and have it create an auxiliary device for the hwmon driver,
> instead of simple-mfd-i2c creating a cell for each. Drop the MFD glue
> and header. It now probes before the GPIOs may be ready, so report the
> power good GPIO with dev_err_probe(). The hwmon driver then only
> accesses the chip after vin-supply is enabled.
> 
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>

For hwmon:

Acked-by: Guenter Roeck <linux@roeck-us.net>
