Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794612964;
	b=NAM9iB5+f9G/mnbCwBuCaw6xKsKHRwJuSFYuzyjNor/CrFoVc/7hM1v1SFnZ0mets66b
	 yyVxS0eIkDh75mK3JkrBxrXE2GxYSbMhtRzKS+EaPBS5wwAmBE9YtpSgm1zqNshqcU/D6
	 BXgrYoCDyAogpcdQxsFztitvMd4Xr0InIir52e38QT8oGuamDDpnRY9paQjdnhhKrlffA
	 BEU0y59p1Llr3bNiGBmu4M8+p0suIJWyFJOFsar4QUV8HO0k9gUBfdusnAIJxOsO3mYvi
	 nfSJV21NfFDgWBCh//5KAM/0U4dwI/jn1y9W1CpwLSVFf+XnMbO3hvRX9KA+aFkQ66Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794612964;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:From:Subject:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=DyAnx0ByVIsAT/f0Q66p40vTde+JF3ipSreAz2l30GU=;
	b=OMtFZFkMeoGQYQqicnLGy8XQIJxW6/TDORHKL0erUvhRcMSxhAMiSgfj7W1ADMy40ntP
	 jS8JSCmXBHXbt2BNvhrms54iUwuIkYx9560BmHDyv86J1J4FMfa+eA1tLmrdZEy84oO/s
	 t+fxt8j81ieYw1QuCnnid2IRWj+IELX6UUh8GQQkHVdO4CzjyaN5ebvWucIsp1fgGso3L
	 7nhSGO/n21vU4mLVK7dqBI1TOwKZEq4FTYxn7gKK1ekml48fKCF+EM3YZ1eXXKPKO378R
	 FKOXS5r73rHKedMNvC9/2Xy3md9pwqN9rk1LW2s+N5bYxQ5L9Z5tg2TWjxyFF3kLx6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=NwCSwwiW;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EB6606A886;
	Fri, 13 Nov 2026 23:36:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1EB6606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=NwCSwwiW
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A3F6B10E7E8;
	Sat, 14 Nov 2026 00:35:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1794612958;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=DyAnx0ByVIsAT/f0Q66p40vTde+JF3ipSreAz2l30GU=;
	b=NwCSwwiWQbQHDDLCsQhCbyzc63tJLDIL73/nT4Gn+keHWEYFtv/LEwySStIS3hLesioadd
	pHaLCHR1f2xsNRhdDtK7oTfaAHP95uKBzVbP5nh+idg8uE5Cf2fPp1pqkS7cI1QzkQCKHW
	Y9j+kl5R3sGyptA8wzR8psVlDBYJVvK4gioZJ2LZf7/KZQHv+qUG3HVnIvNHEsrL1Z8oFE
	ymQ4ETQg/6OIJMykskqtYCyxRygLJtNP708k58kXcBBtaL0H9/Dxtq2H5P53MDHpfQTBjI
	ATAPOC5LiZKezsq2AHZVRq5rDLC1SLYWYaAHJmo28Mb6kDJF3ybra4vzTxjoww==
Message-ID: <bf2c6945-f72d-4aa9-a077-7d86f2071da5@nabladev.com>
Date: Sat, 14 Nov 2026 00:35:20 +0100
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
From: Marek Vasut <marex@nabladev.com>
Subject: Re: [PATCH] arm64: dts: st: Update gpio-line-names on STM32MP23xx
 DHCOS SoM
To: linux-arm-kernel@lists.infradead.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20261026125240.76753-1-marex@nabladev.com>
Content-Language: en-US
In-Reply-To: <20261026125240.76753-1-marex@nabladev.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 10/26/26 1:52 PM, Marek Vasut wrote:
> Adjust gpio-line-names to match both STM32MP23xx and STM32MP25xx DHCOS
> SoM pads respectively in their matching SoM DTs.
> 
> Fixes: 6642d6a47901 ("arm64: dts: st: Add support for DH electronics STM32MP23xx/STM32MP25xx DHCOS SoM and Breakout Board and DHSBC")
> Signed-off-by: Marek Vasut <marex@nabladev.com>

Is there anything to do regarding this fix ? It would be good to include 
this in 7.4 before it is out.
