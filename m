Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794360202;
	b=Hv2srKINBr9qzx/Xkya4LNammP9nCpnGgeiPAsQeVeO2BzRTchq/EyKbh+XipU811Uf7
	 smb5eCyyFYquW8vW50rMjU6JfhxMLf9FNiOIqnNim/3FBrhQOxo2lg84PvMPWMLjnvCCd
	 /h7DoOhy5nGx0mEZ2QZOklriv7wlsuWUlaPUa35HrYnAyLHmsmrOLr0ygsnk30HBrrape
	 QTSb7COinB8Tk6tip5RBwGqMDjwA14Cg2HIzDcZv//4QpWWl/hsAA0vslqUnYXBYHP0CO
	 /5RyFdyUjEV7UU0t6YhBtN1exymUqfZveBWs6gkt94yghoSwskwrIJZW0fDfYQDCWnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794360202;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=me/uMZLei5JIMqJLLPA+JNTv7cc5G55ohXwpfueBK1Y=;
	b=uNhsnwcn/guyhBmYCUt46oS2AVBe+G3oEXeDn90tgEvzTU42wBUGU7q9GTqrmggEwUKR
	 Me/+Ws2c0/XhXoOJzepe0Z+3Vp+1DdTFXsiQ5dvVz0BwCmfrJoRM1iI+DUOhAzn2AQA3o
	 gklqsoOjJorG4Ks0f8Ru7KhC/KiyZ75lpIiMRFfXCVPh1+koNaVl0Tn9xxL3q85dWA+XA
	 7khpm01svwBgkuKH0K6Kcx2BLdbhg5CvBp+fmURxCq3Knf9SIxOPJKZfEb/XISWh3Pks9
	 PKrUFl/2YL2AYFbo0cgbInliot3RG2wUBzhjO9KMDQbWfthk+Crkr2/9D5x+yLybWNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=codeconstruct.com.au;
	spf=pass smtp.mailfrom=codeconstruct.com.au;
	dkim=pass header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=POJCMNyn;
	arc=none smtp.remote-ip=203.29.241.158
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E33606A320;
	Wed, 11 Nov 2026 01:23:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84E33606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=POJCMNyn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1794360199;
	bh=me/uMZLei5JIMqJLLPA+JNTv7cc5G55ohXwpfueBK1Y=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=POJCMNyn6snlb4G0e2HDTHoPRzRUBxoRk8jFatnDEtPv1p2ZhwYVCI5L5Vp9rcBwr
	 PkhiIN366ux6Ed1P4CIyu46MRmf7nbpmJjF9vEK1cAMwWyTYigfD6OnYaKyfb+uEuP
	 jdqWh1ZQmmwWM084HKuZUwuLmqzF6oDJKHFCTmA4erFENMjLjtZ1SRd1hkpvl36M/4
	 W4xI9Rh0DZSxbCFdMfUav/0Hof5XgXq7kXMRLCZCuQXgyUh+PJ2T3YCHXBCajW0/55
	 U3xHPNdpJBZJ8L3tBNv97CHR+DOZAPcy4587TXhp9dNrmq6+e9TRSrbfKVp3ie3oaa
	 U7G9f7qERxmiQ==
Received: from [192.168.68.117] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2B90D64C3C;
	Wed, 11 Nov 2026 09:23:19 +0800 (AWST)
Message-ID: <8b78ad45a331231c0dc0d6b459d2bfada521b6f0.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: aspeed: anacapa: remove unused EEPROM
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Carl Lee <carl.lee@amd.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel
 Stanley <joel@jms.id.au>,  Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai
 <billy_tsai@aspeedtech.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	colin.huang2@amd.com
Date: Wed, 11 Nov 2026 11:53:18 +1030
In-Reply-To: <20261110-arm-dts-aspeed-anacapa-remove-unused-eeprom-v1-1-e3b5d9cc1a03@amd.com>
References: 
	<20261110-arm-dts-aspeed-anacapa-remove-unused-eeprom-v1-1-e3b5d9cc1a03@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Carl,

On Tue, 2026-11-10 at 17:44 +0800, Carl Lee wrote:
> Remove the unused HPM board ID FRU EEPROM (0x51) from
> the I2C mux channel 4 device tree node.

This is evident from the patch so in my opinion can be removed.

>=20
> The EEPROM is no longer needed in the Anacapa device tree.

Can you please explain why that is in the commit message?

Thanks,

Andrew
