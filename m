Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793815788;
	b=Hjwa/GdzcmYzlte3BHM+0s/f9DzRhJ+yshA2FVISCapiaNI+155H8aRg/aofbcVE9rD4
	 f0X4WLVpWHFNF6zVpl2Q/uxOC/NTITVIosdWr3wbn7Mdxoa8SHfhJQNO5Bfw0W9uL63ys
	 +xOyWKn0LrmHWi4Nb2ZOQxRf1mQ6ot87IWG+aDcgf/Yz4bzPX/JN9rxjKNB1oB+kYlqhm
	 2DYDrkoWCBSCNWDRTYlaDE1rmPZaJg2fF1mvXfQjErTlfC+ieornZA+0u7VSvkjJyJe1A
	 q2wUpauzhZucPujuhUUq4GD4I4yr2YyCzkbr49P6HS13PlwaNNCwNpV+wF+BqKfUyDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793815788;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=rwYBDK+4X8bpG7lKR/3Gcr7ptsz0LW7lgS/c66cHyr8=;
	b=V5b81Hra6HEVmBf9H+GAieIB1IqAAqiFnJNj04A0QifWJOcxBcq4ZXbuP9KnNdSKg9t8
	 B6vKScBp7RBGJ09TsO895EfbiY76vef5Esxdr3H7AlC519Lq/ttMhuurLae6HPvY7gVNb
	 m0rzUnnsLgpQ17u2K/WFX0hfAofiZRVRyxGpckhA25lp0lt09ZsAImWajpJ4pUAtvbNon
	 YJ3exDrzBffhqvg7R96radPAOLVvzhavsgONAESl9ai3ZCKLIYm5oKfyRTb3EhxIYw63D
	 vPnp/Q1MIS8Nyztep2XO+QRGHJeXCXAZbz0h1mB0FcgOoRmaDJQE1lL++d0gHrgr06A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZzQAqkq2;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6949D606B230;
	Wed,  4 Nov 2026 18:09:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6949D606B230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZzQAqkq2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=rwYBDK+4X8bpG7lKR/3Gcr7ptsz0LW7lgS/c66cHyr8=; b=ZzQAqkq2yZiObVQnLwRq8cx5Fc
	RwxGUuK0eL+gdfWdD76aayIemTpUSDoPiWWslG6Oy2fmaTGXVlzSbeKtelxeyCSNh+p+GeeD4Ac+T
	r/apvWWJqcf2kf8Gyck2jbM8d4PO11/+PCR8//n5RcOBzonLUmnYUIK2D8hHBQtmvw5uPbKAfuSyH
	tGy9O5rEcKfSOPygvNstKk9WlVsXE9B7J0UYFEHP9r5RfIiOwdE5M/bjss+qg/k0/uJiEZvJ/LfKV
	VXlPe3CYzdj6e5eH690IqqXzeZ7Gx6aQGtlqbrNZcI4U/Y9zW4QpBV8ETEHiXe/7Tg/eqcgwZ9E0D
	mahHn7KQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOfQg-00000006M9o-3LGl;
	Wed, 04 Nov 2026 18:09:46 +0000
Message-ID: <706deeb8-8d19-42db-b6fd-cb37195cce0b@infradead.org>
Date: Wed, 4 Nov 2026 10:09:45 -0800
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
Subject: Re: [PATCH] doc: process: clarify scope of applying-patches as legacy
 reference
To: aleszlucero@gmail.com, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261104-doc-patch-fix-v1-1-617cb9f4cd47@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20261104-doc-patch-fix-v1-1-617cb9f4cd47@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/4/26 5:53 AM, AleSZLucero via B4 Relay wrote:
> From: AleSZLucero <aleszlucero@gmail.com>
> 
> The applying-patches.rst document describes the manual manipulation of
> source trees using the traditional 'patch' and 'diff' utilities. While
> technically accurate for non-Git or constrained environments, it can
> create friction for new contributors seeking the primary Git-based
> workflows.
> 
> Update the opening note to explicitly state that this document serves
> as a reference for legacy or constrained workflows. Provide direct
> cross-references to submitting-patches.rst and howto.rst to steer
> contributors toward the standard Git infrastructure.
> 
> Signed-off-by: AleSZLucero <aleszlucero@gmail.com>
> ---
>  Documentation/process/applying-patches.rst | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/process/applying-patches.rst b/Documentation/process/applying-patches.rst
> index c269f5e1a0a3..74af6d8a2249 100644
> --- a/Documentation/process/applying-patches.rst
> +++ b/Documentation/process/applying-patches.rst
> @@ -8,8 +8,15 @@ Original by:
>  
>  .. note::
>  
> -   This document is obsolete.  In most cases, rather than using ``patch``
> -   manually, you'll almost certainly want to look at using Git instead.
> +   This document focuses on the legacy method of manually manipulating source
> +   trees using the traditional ``patch`` and ``diff`` utilities.
> +
> +   For the standard Git-based workflow used in current development, including
> +   how to format, apply, and send patches via Git, please refer to
> +   :ref:`submitting_patches` and :ref:`howto`.
> +
> +   The information below is maintained as a reference for constrained
> +   environments or legacy workflows where Git infrastructure is unavailable.
>  
>  A frequently asked question on the Linux Kernel Mailing List is how to apply
>  a patch to the kernel or, more specifically, what base kernel a patch for

Please test your patches:

Documentation/process/applying-patches.rst:14: WARNING: undefined label: 'submitting_patches' [ref.ref]
Documentation/process/applying-patches.rst:14: WARNING: undefined label: 'howto' [ref.ref]

Additionally, instead of using :ref:s like that, just use the file name
and our automarkup will DTRT (do the right thing) with it.

-- 
~Randy

