Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CCF27280A
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 01:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791422596; cv=none; b=nff3ObtSTtPRwtciSl6UZYQ61IPg1naCTo8Rs7OvEvwcKGukPfXorZy1hWlusf3mUMQd5d8npN/OaE00UhLvoFNACBfLuLP5yILkc68acE294O4+vJoPRL0fZwiqYUmDgli8d2x0bMxo+6tcum5kA07rIoK9kuzQwbfkCLrT62U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791422596; c=relaxed/simple;
	bh=Y8rdUhJtNv+lemmpSnXA/4ojm70xPc3itzkj1+R66X4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=etejfxg5dBAH+1ynN4qPfTNNKlEMMwwYkBa3Zbv4qVJAbjyDrrnrHZku20lGxUWqkNOIOIZ8ncLbErETMzDDedgrNUfONi4mBVUBt5ccCzoR+/feFZBFyRBZuNiWshIxh4VgSpwaXfdnx126Hv6RNqFDJKnzpuABe/oOz6gaTzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=NCJ8ea64; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="NCJ8ea64"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6e560e00a86so1603473eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 18:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1791422594; x=1792027394; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3gdEfELDQOn2l6TNFqzsXxFT3tZf6RoNraBFM8rA2Fg=;
        b=NCJ8ea647BvqnQ+tubQ8RvtxaaNBLAjeusgJPGAnoNzYvxfnO9d1EXLTZZbhpDvz6Z
         dWLl3MCnov30cKeCFBwxKy9MAqMW6qiDOAfHKf47BJ8iR1TQOdpMYb5brbNVnc9RrxTt
         UgYc2WkaUdCtFDygPz8xJEVnrF5caOXSKfiC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791422594; x=1792027394;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3gdEfELDQOn2l6TNFqzsXxFT3tZf6RoNraBFM8rA2Fg=;
        b=U7fzogw8XWCemTC4qeCFkoo5C376FGBQ4u7bPTO80vwqj0vjI0lxHChPZ4VEqhszrh
         yH7Sauqf7INVbig/lVyEihSqZG7DNulKeyYJogNzqwAwcp/ePhMLCpM4x6/74qCJa9mu
         /IHQWdL9aI3EnpnoEi9+hZk+DygZwZ+qFtrSX7ZcJta1peBE5ljiNXXzHU98SIrPnRfl
         tYenmA5bGT/7KPTt56M7sphH71DX7a95aiNSKq6/xQSB0lm9WRJ26Pil+6GMiXzep790
         LddEtzAL4zQV5xPV3zeHpDvjFiYouqFHNj7VFatfFh+/dToi+Kc8McQa+CUdSdhH3Tjt
         BYPg==
X-Forwarded-Encrypted: i=1; AKwUvBw5qGJuGS5dxALiSttrfiWgc7IWX2P+gY91D9mZDtdB9BvmdBKDeC2fr85gHg59K78ebe0o0dFcsaQSruc=@vger.kernel.org
X-Gm-Message-State: AFuF++nySy/rV2GJRHPoJCUThd57f6753UFFPXP96UToi5tX1g9tR4ZK
	0hLQvugskGQjd0//oY902fI90FdXGeU+zn4KibDcjrF/QH9kSew8UydAEm3RLnFqqTQ=
X-Gm-Gg: AYBFou2xaw5VuT+nYq69Ioq6sdWhTCJHPcoDc8+v3caMBa4JSUB2RsMCgf/uZDTKkrJ
	HPrzT3ayuBQWHuxEfjTjCK7a3TJJrIqwL4r7lc0U84nlr+wJAZLq0e7QAOliqtr/ges/yldR1P9
	cbps29zvP5A7m8Pk0dA88JLqKmyk0C49nuE3OhCWzGt5oiOFNX+kmMxUpVj+YGeak6O6wdKg8y4
	fR7LSBObRONorwwMkaprjU1KFRIfVrA2YVuG6awtp8Phn4xy3T8aJZ29cmhtKvb2HHt7EiX+/gg
	D8Enai/I36uUtszmp5rUONnFtuYPAgGeQfp/tCjz+x3H7cICuEZAj8zjVm5CvaMVJjo7ZgSpces
	ysb16SsdroP+PBs3qkniNqUa2y7OC5SO14AVEfRowCZtsfIjHIMCdVAoLcY1CnbYoI8jV+7SCF+
	b0ydMbfS4K9+gqzhDwedGp1dUiDr2yhBd4elKQJzcxTEzw2F2MjiYFvOYBZYCvLhWOZpCje8Dy4
	qarSH1mD2kC3bzryH70WYJtxXyVZPjQ1bF6yQRnROo4vlwEisNNkCeWb9z4EuBF
X-Received: by 2002:a05:6820:1694:b0:6e0:fb60:d5c1 with SMTP id 006d021491bc7-6e7a4b20318mr3832032eaf.11.1791422593892;
        Wed, 07 Oct 2026 18:23:13 -0700 (PDT)
Received: from com-75606 ([199.47.143.7])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a274b7ca62sm1945452fac.9.2026.10.07.18.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 18:23:13 -0700 (PDT)
Date: Wed, 7 Oct 2026 18:23:10 -0700
From: Kyle Zeng <kylebot@openai.com>
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, outbounddisclosures@openai.com
Subject: Re: [PATCH net v2] netlink: avoid hashing the network namespace
 pointer
Message-ID: <asbwfr5yXmeOQ-hT@com-75606>
References: <20261008011359.63727-2-kylebot@openai.com>
 <179142234633.2527009.9314976849845433713@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179142234633.2527009.9314976849845433713@kernel.org>

On Thu, Oct 08, 2026 at 01:19:06AM +0000, netdev-bot+sinfo@kernel.org wrote:
> Hi!
> 
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
> 
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
> 
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.
> 
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
> 
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

I have a PoC for this issue, the symptom of the issue is kernel
information leak.

Best,
Kyle
