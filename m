Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C262931FF
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 06:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787812101; cv=none; b=Ye3aKQkEVYAHUR+ZjxGDLlxvri6aJqIaBEuNG0Pb2FAGQ801KsnrbSG9UK6gNw8ydMGkjC25vOPAldgOrdrlO3qcib1c1JyeQU99ZFchjYZqebq2TNCjQ/wItZbqTgnw2KGfvkrFO7SevyKyqx4rhNx8tvssvMF0o7LgxQw1NXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787812101; c=relaxed/simple;
	bh=vYlw+yoDo94J1djbsp89GGZe6PpoQNV/EiITRv9otXQ=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=X9lupW8yCYk2wkyOHHHcRv3leQ/rCtEv4JdaZ76nUv/J0BcYgGEnfe6sYGkvgxfGeJYgrCtc8XIONcOJFxDwHcBea2ZqhNeMpv2K8iaU4DOhMYPIzldJ/RFnO7/s7qfTQK+tGEGgFRsc86ztAZl7PYQFmnjUhjmx5RnjXMVzNO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bitvisir.nu; spf=pass smtp.mailfrom=bitvisir.nu; dkim=pass (2048-bit key) header.d=bitvisir.nu header.i=@bitvisir.nu header.b=qoVfmZfv; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bitvisir.nu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bitvisir.nu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bitvisir.nu header.i=@bitvisir.nu header.b="qoVfmZfv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=bitvisir.nu
	; s=ds202607; h=Content-Transfer-Encoding:Content-Type:Subject:From:To:
	MIME-Version:Date:Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:
	Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KAcKaRU0OoMgU5Owi+vF4uHlaalbqO8MSSCJvkuVGgM=; b=qoVfmZfvYUZwNNoBk3BYDCdRGv
	cgmRTUcOd8Q9i5uiceMm4mbH3YrlC4dXGW7g2nf/dDfUjCYzX+QmTnHXVtv+QYTxGt80uIXMqnvyP
	bMwaOXHCvCdnt8s/pEJTIlT0WR0SgiQTL3n3vQmh/ZfmBWDz0U0d+kKeJpriU5k6kmjoVTWqoo0Au
	akv23nlL8YHnsq4MYeFmKOc1zPaqlTuAswi11vM3aeZ2HsXslnOQA0zAibjRMYyR4C1DjUr7FoVvc
	qdLVQTr6ymsXXDWmRTWwOD3jgGzucJlrqnAYqavXn9Kq9vQKFWlket92GoeThHq7wxvxIIsO3KIgp
	fZtglbSw==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1wzTau-00EmcX-FK
	for linux-kernel@vger.kernel.org;
	Thu, 27 Aug 2026 08:28:12 +0200
Message-ID: <708c266d-dd55-46a7-8206-22d2e193667d@bitvisir.nu>
Date: Thu, 27 Aug 2026 08:28:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-kernel@vger.kernel.org
From: =?UTF-8?Q?Ywe_C=C3=A6rlyn?= <yn@bitvisir.nu>
Subject: Philosophy (was Low Jitter, Fair Pay, Unification)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Philosophy updates:

Now using the label Fidel, that is completely accurate, and a variant of 
Hacker (Truther).

Bitcurrency is a variant of Bitcoin where the amount is adjusted for 
correctness in accordance to Fidel.

OS's such as MX Linux, that claims Muslim (translated: Fidel) is not 
supported due to the fact that they believe in schisms in that concept, 
between variant labels. Fidel is letter pr. letter correct, and all can 
be done according to it.

This is now the only version really, since Mandrake (Linus version) was 
ended in 2000, according to his own wishes.

Inline with HP/UX really.

Serenity,
Bitvisir,
Ywe Cærlyn
https://bitvisir.nu/






