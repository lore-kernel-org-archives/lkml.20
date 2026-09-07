Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B4751D501;
	Mon,  7 Sep 2026 16:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799050; cv=none; b=MGRMQ4WyyxdaX8rNa0fbtAaCwhxrg1d3Ks0avzhNDa8RymsEbS+VyuYVwJQkSfxUog1ahEAPSVzaAxXtlEvzyFoIKHyEIKsoZua/1pIwzW+ZIYCbGTBRrtUTK6kDJ7r++gX/QGJnzVhYGUaJtBeexsj59Kam7MSlQmnGDOX8IpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799050; c=relaxed/simple;
	bh=aAfYC2asVQ3Z7KEDpUga4ahRhwYOqmtsvXzaSrW+ieM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=O0W3fHsyKAtuRETBpcoe810r7xZsYc2T04/qdY3C/ngb0Bhvj/AHe2xYzzd4wAln78Oi99NYoxzFGkvoTfeLWl9QX0Zq2mw7dVf9TFdEOTVRI8vVJLdsJZJQ+7PDXKjsdVk5RB7s8hMNT8pTRBkIiIKgGhef3M1hAoqejR+WgYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=IVSpp7VN; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="IVSpp7VN"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0B555408FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1788799048; bh=zsHO6Ek/n4cKxDKDyLxyoYczJMDtfbsZrixbjewRkFE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=IVSpp7VNlqXfL93wNrz0A50LD1yN4kVdSI9YK2RuvKRg2N4xgZ+JJfp9s3WakJSWb
	 rukwLoMbVRZ0WhxXOsCuz+8I8ZflgGfaci7e1NSdQwAYwkC+AlR1xliJg4sP8SBs1V
	 Dmy7Ef1SVedNnyn/vPlVkot/5d2u7UXaOBE8oeC5llFE9wh6wK1+MTJdrG04UrJmD3
	 jj7e/RyM5IuRSt2/2nSruJ2TgC9p0aj+xuYuMktH09xLF2ruMWb8Xq4qrdRYbYzMtk
	 oq4xGs/oZafKO27CbLD1b420+qUhgXN+s8MscrN+nCi3yGBuT5Qit0GCIXBNUtt6Ur
	 g4QSZRO1qDhmg==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 0B555408FF;
	Mon,  7 Sep 2026 16:37:27 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Yang
 Erkun <yangerkun@huawei.com>, Bart Van Assche <bvanassche@acm.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: sysctl: Remove obsolete sg-big-buff entry
In-Reply-To: <20260905010952.57451-1-kmehltretter@gmail.com>
References: <20260905010952.57451-1-kmehltretter@gmail.com>
Date: Mon, 07 Sep 2026 10:37:27 -0600
Message-ID: <87tso1ow54.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Karl Mehltretter <kmehltretter@gmail.com> writes:

> The sg-big-buff sysctl no longer exists. The documented SG_BIG_BUFF
> macro is only a compatibility alias and changing it does not alter the
> driver default.
>
> Fixes: 50209dec14f8 ("scsi: sg: Remove deprecated sg-big-buff")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  Documentation/admin-guide/sysctl/kernel.rst | 13 -------------
>  1 file changed, 13 deletions(-)
>
> diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
> index b6328cd0f43e9..d9e9b12136eb2 100644
> --- a/Documentation/admin-guide/sysctl/kernel.rst
> +++ b/Documentation/admin-guide/sysctl/kernel.rst
> @@ -1334,19 +1334,6 @@ seccomp
>  See Documentation/userspace-api/seccomp_filter.rst.
>  
>  
> -sg-big-buff
> -===========
> -
> -This file shows the size of the generic SCSI (sg) buffer.
> -You can't tune it just yet, but you could change it on
> -compile time by editing ``include/scsi/sg.h`` and changing
> -the value of ``SG_BIG_BUFF``.
> -
> -There shouldn't be any reason to change this value. If
> -you can come up with one, you probably know what you
> -are doing anyway :)
> -

Applied, thanks.

jon
