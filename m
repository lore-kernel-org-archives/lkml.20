Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688A74CA76C;
	Mon,  7 Sep 2026 15:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788796487; cv=none; b=ouMFirIsvlHYRxEf1eEVCAoTbz+HDcfBHBfCw5mUm72q0b483UfcTMSBuu+ULMBbYMejubl/kqjNQoRkFd7RA8mUhTvQtt3uG9FZG+eoFviRCIrL/8L2tzQUz3pjIIgCWTW7o5bUs+r44KFN/ZP5gw9wtBPRmUQjr+OyoXe2BFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788796487; c=relaxed/simple;
	bh=OxTfmdKlF/M39hwa9LeJeJy+VvQMQL+ijNheXwzRphc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VOKgqesHRND3drlimVt17GR5QlwE3JGO+jZHPYfwWdq/Z0g8Qze7ovm650DleoHdO9VW6mIJvCX0AddeiR7dlZLv9py5iG2ljBwht187HbgRu6t/fVUWoMc4oZ7rKrpy04UPpydy//4B4kEXsAMzLtXUGU5QQ+f0puWQga7AtI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=BhHR5vVr; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="BhHR5vVr"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9A29F408FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1788796485; bh=fRnfya/x44Q2TqwNBL3QeJIypGRPLLcZVr0sT/HdHF8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=BhHR5vVr+oIYyHrDCamaYDlo4yBi+knoDw+c3SqW1+yICv0uySDoWh8QRis4eztBa
	 W9Zy29y41P2YMQvWLd6vloioNuzhlVyyHSTuvo1D3Znf5NWEf4ehcY6PRT/o0hdOTY
	 PCieSvcba9U8uZ3566zNfO4a0xsMDl/aEmfqfAf8cSRU+yL7QNVpgICfutkT5kklIy
	 FZamf2a8GKdFAp4JQMOUyiszKTG+Scxy9K4VcGW0c1nATifOEexy3Csp8f7N8sFo0p
	 Kfhj3OHH/AgeK4OuxSbNBAYQIU7d7y1jUewGWC8RICjmHbWec+KkOZv01i9qa3m12e
	 lXRSXYvjeRb1w==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 9A29F408FF;
	Mon,  7 Sep 2026 15:54:45 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebnerli@mailbox.org>, Shuah Khan
 <skhan@linuxfoundation.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: misc-devices/spear-pcie-gadget.txt: Fix bracket
 and whitespace
In-Reply-To: <20260905074641.811164-2-manuelebnerli@mailbox.org>
References: <20260905074641.811164-2-manuelebnerli@mailbox.org>
Date: Mon, 07 Sep 2026 09:54:44 -0600
Message-ID: <87ecf5vyyj.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Manuel Ebner <manuelebnerli@mailbox.org> writes:

> Add missing ')' and remove needless whitespace.
>
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> ---
>  Documentation/misc-devices/spear-pcie-gadget.rst | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Agree with Randy on the white-space fixes, they are generally not worth
it.

Applied, thanks.

jon
