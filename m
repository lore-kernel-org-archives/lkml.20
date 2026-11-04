Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793815008;
	b=2VaaUkiJCrejQZPC9+xK9/j4fha6S3qzdVBpNcVRB6TnT/ZlaQZVroWM5yKAOkDcQEi7
	 +EPiGgKdqe8s8LEwTygQNUbZLs/RiWJbWy9qawvkXhJskLiJzr1vN691ZXWDFNLr0NC8P
	 2GKAhWZz0QAbWspXAAkQS5U/vkPAtF7EdZ1ZfHHHHI94MH03QDgRz7c/KkcjAzLhDR6l3
	 CBkNkM+44NJJc7ssH9Gq4wRltKo/PbrPYkzjcEI5KJ25/o3zpAtLjqs5hJJVryvuMLW+0
	 UrmCWQ3E9gyGZp+JExYMQaGhG9XZZzdyW1UaWEm9mEDM+RXYfn+5IvCcjXoQmlT2VCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793815008;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Ao07XvrYRhVla4XfZ0jpVb8vCXSsJXg5ekdiJiyYjWg=;
	b=RY0dtS2w21VPmafK1rDHa7kvwyyEREW8hYt5Hf1TkSfcItX5idi7LASfnG+/VWdZdM8v
	 OGBja4s2vxfkLHSA3CNoEPHfIWyriQ1V1QPOGJy0e9iDDf9XxQWSNGpMsaLPqMG+jS2Em
	 nJEmr7sdjnRxy5XnXu1u+/BCR5yQXLSsOHLBZhcf1soY8F/xrW5zhVeVoreBl86f741Fh
	 78Z6lknOHiRMGmM7HYcNDDPq2yzRxD9sk+erEDgJJKGKywFwrqNRy6nuXNWOyyy4LbQ15
	 wNKKIiPDpY10YAUsapGziRSOLuHpdAgEsTBCMgFMdGp5QRT7W+oa71EzNqEthozFFPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LmRqsmCU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AACE60703D1;
	Wed,  4 Nov 2026 17:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LmRqsmCU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 676041F00A1E;
	Wed,  4 Nov 2026 17:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793815008;
	bh=Ao07XvrYRhVla4XfZ0jpVb8vCXSsJXg5ekdiJiyYjWg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=LmRqsmCUBelHPf2Wz1rOYKFGI/QoOAh0bICQ6jhiQ5aN5ZtjxNeurMcz+5040qSq0
	 5PMCl+3aMQ9DQ5mDTlb/nCDFfJ8YLvE6M0fZfp5y707WpbWGG8SOmjqYiC8TbOcjly
	 qsfyrKPrlKrkCAjqE+Dgc4QLiya1ukmMvqVrmHdBT8Y/2knxX4xshVhmkedHGM72eY
	 lhbmtIj9P2QkUlGLhDLrytH/5c7Ps0FQcb9Iowsp7sJHrPd+lTlSqWFyxWpKGDilsM
	 V3RUd7n0Law3qfIJrdNydlFZup1xXKrBTOx1Y0dtf8KXEg2wqSg9+4xzpCWMZxKpfY
	 01VjeOjXkUecA==
Message-ID: <5f61e7ab-503c-4bc1-a6c1-92f8f5eddbc9@kernel.org>
Date: Wed, 4 Nov 2026 18:56:42 +0100
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
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261104-doc-patch-fix-v1-1-617cb9f4cd47@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261104-doc-patch-fix-v1-1-617cb9f4cd47@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/11/2026 14:53, AleSZLucero via B4 Relay wrote:
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


Please use known identity (see submitting patches).

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

Submitting patches does not provide information on applying patches,
only about sending, right?

This document does not cover sending, therefore I see no point in
providing the reference. I guess howto has something more applicable?


Best regards,
Krzysztof
