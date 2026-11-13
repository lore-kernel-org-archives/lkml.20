Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794578081;
	b=4cLJVKJSJQVkLcxKBOyj0vIwY199TOiIklRM9foh64h11VAfaUqGwd804hN26JC+Ukzz
	 gxhOt/44TrWqlwre8ELbrh2LdmyDpUVeX0fwHPSFrdFALY4bpOj10BVO0JRhWek0m8Mlo
	 mICqC7YGe/+N3HIMv179CdEARK3rN4IL92gYXFL/90TATKZAnsHNRDmLH2VrMgSCbdW6+
	 0kIXR8vVxfmIYTxw0yGvKjmTbP2lbOheX1XP3my60LH2Op78nmTUTuxBw97MP0UkILQJh
	 aP8wLJx+2kIY8xD1wZGOyERTkGqZ8gi/6RsFE6XlqEEWAI7YOPDBvAPbdLnpEgAGf5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794578081;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:X-Google-Original-Message-ID:Date:From:To:Cc:Subject:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=wLLpkF4cjBVNx1uNJleKZrvmo7zDl67dEZ7VEFv3KR0=;
	b=UUXHp1INg6HeQLT8/9O+F5VGimEk7/J4H2P6xWgX+rqMMU8AWHiafcF7xONYURRvSqMf
	 xGyjAOBE6+q0wk8tuJHe2UTMVaVq2tDC1ZcRWzsfPLCz3zE18NJdtEwt0mJbcwwBOuwFD
	 E9McbblWfRh/QbLmz820K5NrXoN+GhLsWdekIiT2tDUcIeYm5SjyWoJzLlY82Vf+4xDbN
	 GilICijH8rKgnyjBulMYioKx3U+TJRiN5cSbEq1mi+SfHL8piyXeQmiUIX7Ya5LeZ93t/
	 59u8Xk+kkDyDWv0Ce5otykW5Bn6bdc41ctjsDkt30Bc11aRFpUu/i8a4W1RI6UubBJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vN6x1Vg+;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A198606A884
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:54:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A198606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vN6x1Vg+
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c5083bc0e28so208769366b.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794578080; x=1795182880; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wLLpkF4cjBVNx1uNJleKZrvmo7zDl67dEZ7VEFv3KR0=;
        b=vN6x1Vg+cWbRws0oppzT0pYULxFVRSyz5ZMm4n03rHi+HYaL8SdKbfoy0Z0i3m8RCq
         fL5vB+QE42Rum2oxeFeTP+XbMe6HLgYIgmeAhrn4Z3EqYul4GOdlxsSjSIS0S+23lvuv
         6cxrMEmbjsquxKmSdeIwtwCqYALg6bsp/vbIY125m7azK+cjMN5l/neOD6Qh0EUYC0kt
         MTtMt7X+XCVdIUW0kQChWCrt28EYHyU05qQwO3/T1Wkqnqq0wexqcSwVc9epMwwixNiw
         MXd2lDNCYk9ZJ6WdPsLMRFcOiRrhQ4jq6Y6A+ZcYuU/qYSpI6y9aXkCTA32gglhZo/3W
         iVCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794578080; x=1795182880;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wLLpkF4cjBVNx1uNJleKZrvmo7zDl67dEZ7VEFv3KR0=;
        b=z/kuQq9rMafIZQVSa5InHbcyOSeYYqocEdO/454tFEZnDXzsfwVuvdIbw5D0Op8iGg
         UyoeiD2a0JdQUFIa0zReGgwE3zNFJuFXzjiNl8Uyw5ZwmBeNe/1zWobjxVZRLXBQDjQ+
         fmAETd3v6sxLeQ0e8k1EXI6ruZ0t6/fQRnq8xbPmYJoN+L2QnKelHgZeQvQ5JJUIEE1t
         09D1a5yGOS0zRFbx01L3NAo5hB/ogSZA96CaaOP/DvVs21AzMf3M8l589rMlfevWchaU
         zyKkZ1mLyrmtBNiEpAear9VNd9ko03Aedj3Xcwvh5vTWPufllEkQycKYT8ysuVYvew2Q
         NDwA==
X-Forwarded-Encrypted: i=1; AL+hErHIbFB3WHLP/xr/Py6YnLIwdH0crie9jW/WGPjVJmQqp+PcOs2jMaIxRFy6pZJIE+XOuay5/uReS36RpCI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MRcpt5WXZRpUpo9B/P9AZ9ymAHNt77PLWklEFignZuYvzKmDp
	Tj2Y0/QPcCyPHwWQ7R5n91sw/vPaR9g9LCIudKoQZiyHMJSi5K1jvKnG
X-Gm-Gg: AYBFou1jjqEASIr5Aq6tHaZLdXjIEIpAMWN+k4wEOeTehAmkbVnBCqmcEZNkUaS4GLA
	2+SkMkDNwR3HmysMukflRaZ9aSncSNSEWkQkbfoRxwYV0XF1DOWB137BQrc/ICDmpjdNritPAo/
	7iOFlOC3EfJosOv1YKlWS/rc3Dfo59AOj8tAXya5r2hmDqW0txF3PzYDcCw8W4R4T21qYy4DjXH
	h3t4GnSbh3U++aUV3lEJ9LMgqb+8JMyXzldtwZlzowV1BeQA2a1tIK4EIdATB/8uBrGtCOdgJJQ
	ICZixCktoB1vn5N8YPQdnRCqKU/fzp+PeMtwuwwrlCrOlyvwpTd2H5WNipTnhivJUfjpIPdj7Ey
	GSr/rkCEIdYrY9ZwGXBhZEbQk07Plhqmnwbqych42z/dyryolxAshU2Ijbp+IjaDBoHiNTylaEt
	J0W+IExtLofcuSaMNdBMed62YwUcimRdJPoVoDXs5sv7u8rc0kAsNnm8x8tEcJFXSxe62xO4IhY
	8jwB/9K7up9x10LQ5PxujjvUZpzCyOzF53OCR8vV12FAXORP/A6/jzWcCr2Dy9tIZd9PnPqgL/i
	U5A0B5PpAWKQIfcWLleVNFY/qialiLUdYKa9jYmFEFHpSWP+7Bc/Y18MVmIQ5CMDLtpKvDZ0xtD
	Fd1C+OTvxeK+UT8LW6Ds4e9eFwBjf1iLu+bceqhhRuQ==
X-Received: by 2002:a17:907:94c5:b0:c50:576f:b3a8 with SMTP id a640c23a62f3a-c50963d9089mr297085466b.48.1794578079717;
        Fri, 13 Nov 2026 05:54:39 -0800 (PST)
Received: from Ansuel-XPS. (host-212-171-11-167.pool212171.interbusiness.it. [212.171.11.167])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b236fdsm98205966b.19.2026.11.13.05.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 05:54:39 -0800 (PST)
Message-ID: <6af7169f.a90a51d8.32ae4c.1a7e@mx.google.com>
X-Google-Original-Message-ID: <avcWnNDG0MA7jaOW@Ansuel-XPS.>
Date: Fri, 13 Nov 2026 14:54:36 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 1/2] net: phy: use const char * const for
 phylink_an_mode_str
References: <20261112131358.106442-1-ansuelsmth@gmail.com>
 <86b2767e-c2a6-4bc1-ab30-c69069edf253@lunn.ch>
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
In-Reply-To: <86b2767e-c2a6-4bc1-ab30-c69069edf253@lunn.ch>

On Fri, Nov 13, 2026 at 02:53:05PM +0100, Andrew Lunn wrote:
> On Thu, Nov 12, 2026 at 02:13:56PM +0100, Christian Marangi wrote:
> > The local string array should use const char * const as reported by
> > checkpatch.pl. Use the correct type as to mute checkpatch warning.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> 

I notice a more suited title would be to use net: phylink: ...

It's ok if I send v2 and fix the title (and keep your tag?)

-- 
	Ansuel
