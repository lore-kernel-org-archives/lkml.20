Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792683358;
	b=KEjic850lTJY/FyeLCTyHQglDx5eDxcXxsPZR82PEcN32Q9mQ3x30uMxI7YXykdQFayl
	 dWfJCqk6AYpD3gL/iLVM4zCmZq9pCPmJP77PkTKptYS1kYtF0DxHSBcUOQp+CbVgyb04N
	 +/hi11piVe4kosRnLvrZd2MGd1notfizjns1G0d8o8/VkAyubvSI5jjxdkJ+68dwYVsmb
	 B0MLcn8+ycLnoTpel2MorFynrWqvbdtcGKMSMrDQa2EXQrREGGYffhGD6jggg3DBtzJf3
	 0/RTZr+3m7G7s/4qIO+uqsKY05A/osfLW4a12/mwVVFqxTWyIV/A0KB5NsvRI4tOMEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792683358;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=kBR8z+6OMFs7ROLQsh3LHG9M4ZcuQJree8NCBsQTSrk=;
	b=dUEAKERCy2te8rw1OluglaV6LnLz98jCfwXouBhWNEqmfh29TXsrHC9O2KtGZ9yJXAEE
	 Ombj4J5bda/nSfkwryW8YTBi/OM3fGWDZtZDmkF2Gorcp+637ooQf9DeiRHHD0Q+l7+xS
	 XiWxUMeuCOpQzjcEwvbjnLV2bHnN259lTIfTPLMZmqoz25c76A/4+WHlL+/GgOl0iLSOu
	 dOqY704WrlvpgX64g/wZsewX666wG8SydZkoN59xd+fW5Iz5F/KUDH4i9qkjjAPWY3Hil
	 H/aHPMLl5Hqn7WxPlDiUrgC02TIIMuUu8cVWikvv09AVkmFDQdMMzECdIuZwzn+VDuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=U1GLbi0e;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E1D606A319;
	Thu, 22 Oct 2026 15:35:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71E1D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=U1GLbi0e
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 462DD408DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1792683357; bh=kBR8z+6OMFs7ROLQsh3LHG9M4ZcuQJree8NCBsQTSrk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=U1GLbi0ewB1XdpMUK6U31OJC86cMj4+6eZwFeQx1UTTkBWYqe187ZhtpNxaHI6stp
	 ELwSyX12b1+6gXZkpk/PA9wzzLc2mF0wg0bfvtt5zH8ghJ9V6MgrT5pfTi3Xhggia7
	 p3LXw5bntGmHIPM7q+k38Ti0AuGO+Qpb9dBF74XCMeMcFGoidTupp9c92qhpo6UJaf
	 VbWqYkU5GrruVa5exC/1lYWzcLkwkSQGCp43fhGsACYl27FfkZTe8GFj54HTr6FxNU
	 NFISTC0CBO4FDCca1rkwhv6fO9Hqq0oQV+myS9a2U7W8iNtPnSsEozmqVdCsBwl/n4
	 EKZD1Jqyj8V1g==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 462DD408DA;
	Thu, 22 Oct 2026 15:35:57 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Subhadip Sarkar <sarkarsubhadip604@gmail.com>
Cc: skhan@linuxfoundation.org, rdunlap@infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Subhadip Sarkar
 <sarkarsubhadip604@gmail.com>
Subject: Re: [PATCH v1] docs: admin-guide: Fix typo in kernel-parameters.txt
In-Reply-To: <20261020150530.15291-1-sarkarsubhadip604@gmail.com>
References: <20261020150530.15291-1-sarkarsubhadip604@gmail.com>
Date: Thu, 22 Oct 2026 09:35:56 -0600
Message-ID: <877bj93fz7.fsf@trenco.lwn.net>
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

Subhadip Sarkar <sarkarsubhadip604@gmail.com> writes:

> Fix a spelling mistake in the rcutorture.stall_only parameter
> description by changing to "applications".
>
> Signed-off-by: Subhadip Sarkar <sarkarsubhadip604@gmail.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index e75344f4e..f5263eaf8 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -6249,7 +6249,7 @@ Kernel parameters
>  	rcutorture.stall_only= [KNL]
>  			Shut off all rcutorture kthreads other than the
>  			RCU CPU stall-warning test kthreads.  The purpose
> -			of this is to test production applictions'
> +			of this is to test production applications'
>  			reactions to CPU stalls, and with minimal

Applied, thanks.

jon
