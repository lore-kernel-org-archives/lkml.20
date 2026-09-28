Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA3D4E9C18
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790612190; cv=none; b=bChO65xQjpLrcDTkPRZBBCXc/G7kH3asa2+ZngFnr5amyI2nLKCPOjLcD5aB/WRIS1kYyrMZwmeKHK2Irp52Uz+ZM3AwDZnWwzBMqYAgJd52BEeA6lN+Mw63SOWESjQ9au2gCCH5SdtlZ24Rm5u3EOC3YNXwh3+BsUNv6BMGoJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790612190; c=relaxed/simple;
	bh=8uJKOVpW1+neIMO6pgN+ibn3QsgOgANirwbLENiBsW4=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=IcRihB5Mou66TnoWp8lHQtDR1dqIF7Yb7unaBzsg/lU36CUHL2N5Y+C5PtArrHqctJa4tmh6phKso+KZNztqM9NGmpGDJ02p5cTtWYdfn17oRQVF+StwwLLBvZHIObtZxo/1rHjSkP72u0Zsg6hd1Ejb1bcIJSkyyUuKPKW7Qls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bitvisir.nu; spf=pass smtp.mailfrom=bitvisir.nu; dkim=pass (2048-bit key) header.d=bitvisir.nu header.i=@bitvisir.nu header.b=MkXDwaqD; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bitvisir.nu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bitvisir.nu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bitvisir.nu header.i=@bitvisir.nu header.b="MkXDwaqD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=bitvisir.nu
	; s=ds202607; h=Content-Transfer-Encoding:Content-Type:Subject:From:To:
	MIME-Version:Date:Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:
	Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pFQGI8OdBF882zlZ54lRNZrr64/m8HKGbDXWgPEfC00=; b=MkXDwaqDWd9z9Vo6pagty9hWE1
	R0Z30HIriYnnUi6ejKyi2/EvVKXF2TdfgqoaWVPGPsviw9KMZyt4hRYyPDZ6hGT1DTAgZy6ETeMRu
	jcsLmJ7F5Vxg+AYZ26HFnFtlX54jq1P+uGhZ0vxmbNl6gHmKS7PsBklGrGyMDBeyPlEer8iy6XOEH
	T5jNHNHhMxRH4QjHftKLtW1RKMo9ggxae20LfcgsVH/mWaM++oxk/lQXGC6YgRbPHSDPrAuEX2N3f
	LPjZAkQv7pI729vbCe5om6Ip48hiqBHjx84DF6OAMg9T03cWXqVg/SIZSBXIiY0WAYTnLN5WF/1qQ
	176DMfWA==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1xBE1S-00CasA-TD
	for linux-kernel@vger.kernel.org;
	Mon, 28 Sep 2026 18:16:10 +0200
Message-ID: <35b8d4de-579c-45e1-95e2-9b5996f9882f@bitvisir.nu>
Date: Mon, 28 Sep 2026 18:16:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-kernel@vger.kernel.org
From: =?UTF-8?Q?Ywe_C=C3=A6rlyn?= <yn@bitvisir.nu>
Subject: Visir Wavelet Anisotropic Filter = No GFX Card Needed (Part of Fair
 Pay Philosophy Unity and Low Jitter)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

3 poles, one in negative should be a wavelet anisotropic filter.
( / 1.3 cut down pr pole)

Used via Cache, should abolish the use of GFX Card. CPU Coming!

This is part of my work with Fair Pay Philosophy Unity and Low Jitter.

Intergrates well with GAI Game AI, simplifying games development, more 
Open Source Style.

Serenity.
https://bitvisir.nu/






