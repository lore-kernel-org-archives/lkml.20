Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792683796;
	b=H14L46zf9HRhjNbXgW4i9sVHm8ePQ37oS09BPKv2RVA9589FQOUk78N6yzgVS/Hl4Yy7
	 UK3bP0X3Fn6muDO1VTubxlKWmAq1NKA/qR62PRzjBhFYUzq8cAmqeBUs3pLVLaUqa4Tp0
	 mtUfqfQwyLV3/ELPq6DmlZsKN2Y1RglNLv81r/8L/8JxRXzsbtElvz31tt0iHpZAoMTI7
	 p4B12fFvpmnSjj/e3e+1Cq5JrzAYfdEgLn4WUFXDypO9+Mmg8KUrzuOSzggmN/7yQ0R6T
	 NS4EH3lvZLedfR50GpMLq/JOn4zBBp6w/tO6f1NNQhm7r8//LFEUyL2ck5VcC5GhkgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792683796;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=MkIh4OrRcgvtwy45zxvwy9lPS36RJHtzznNxINaUDvU=;
	b=DB2SuatxKNue90cISXPRZnof4YgUoUZDuSx3HH7tj1OJGzS1BktaBu0CYmvu4aB02Uzc
	 6ZHh/uLlAv8HnaWHydrM+KWv+ryJbcekkeE3lOKZc84CNsJzyspk4r8Ubitdi7gBYDtjP
	 CZTE1BL4R+qGEw1Okrs4MoZJ2R5s+cajTQZp0lTU8KZPhvn0r5VAbPv8sqJTsMa2XGyZq
	 G9X/HGhOoVl+hmo66oYt1Hwx4THJjolWb5BDjgke/PtLMNn+btDVW1y96e4wjU+SsVzF2
	 RaFwLgRKIfRGikUVSJ0MfImf8g4SglBy/iPB0RsQcY9fdGqkvV2JwduTIhvfiKPRvxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=QVFQcCvM;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBD2606A319;
	Thu, 22 Oct 2026 15:43:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BBD2606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=QVFQcCvM
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 66F7C408DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1792683795; bh=MkIh4OrRcgvtwy45zxvwy9lPS36RJHtzznNxINaUDvU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QVFQcCvMMOi9IiEpRiF89YDF4bUDf+YcswyE3TNGNrvIVYZKRut9gLnyiKcnl4MLn
	 zTzSGGyDTUsmehbwZcH08nOi5Zda2DSRBl/m7xEEunqbeaHHdBT0Atejf/9th1KIaZ
	 uWnc+7Q9+dVi6shX6RYpqelTXsYeyXbk7MCqeILCWjW5kAkvPCekR/CTZMiHHcs4MF
	 627+TDfX294Ust2UXTxpX42LCMGkpP3jg1G1W8w5CEg+UxFlzB/lYe5ty/HWhhD/HJ
	 Z1Xng/ZSAEzHMHSDLTiH0QdANuq33htcwrfgjIY/vZX1uRI31anGueuQXweqXtG3Uj
	 7x6D9WnB3YSWw==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 66F7C408DA;
	Thu, 22 Oct 2026 15:43:15 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Randy Dunlap
 <rdunlap@infradead.org>, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 0/4] docs: test_doc_build: Test up to Sphinx 9.1.0
In-Reply-To: <cover.1792053090.git.mchehab+huawei@kernel.org>
References: <cover.1792053090.git.mchehab+huawei@kernel.org>
Date: Thu, 22 Oct 2026 09:43:14 -0600
Message-ID: <8733tx3fn1.fsf@trenco.lwn.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Hi Jon,
>
> This small patch series extend test_doc_build to cover up to
> Sphinx version 9.1.0.

I've applied it, thanks.

jon
